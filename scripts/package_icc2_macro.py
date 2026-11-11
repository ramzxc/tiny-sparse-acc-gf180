#!/usr/bin/env python3
"""Package an existing ICC2 export; does not run implementation tools."""
import argparse
import hashlib
import json
import re
from pathlib import Path
import gdstk

p = argparse.ArgumentParser()
p.add_argument('export', type=Path)
a = p.parse_args()
root = Path(__file__).resolve().parents[1]
out = root / 'src/physical/macros/tiny_sparse_acc_core'
out.mkdir(parents=True, exist_ok=True)
old, new = 'tt_um_tiny_sparse_acc_ramzxc', 'tiny_sparse_acc_core'
lib = gdstk.read_gds(a.export / 'core.gds')
top = next(c for c in lib.cells if c.name == old)
top.name = new
lef = (a.export / 'core.lef').read_text().replace(old, new)
# ICC2 can export the routed shapes without a PR boundary polygon. Magic's
# macro streamout needs GF180 PR_bndry (0/0); use the declared LEF dimensions,
# never the bounding box of the routed metal or standard cells.
size = re.search(r'^\s*SIZE\s+([\d.]+)\s+BY\s+([\d.]+)\s*;', lef, re.M)
assert size, 'Missing LEF SIZE'
width, height = map(float, size.groups())
boundary = gdstk.rectangle((0, 0), (width, height), layer=0, datatype=0)
existing = [p for p in top.polygons if (p.layer, p.datatype) == (0, 0)]
if existing:
    assert not gdstk.boolean(existing, [boundary], 'xor', precision=0.0005), \
        'GDS PR boundary differs from LEF SIZE'
else:
    top.add(boundary)
# The TT streamout merger expects 1 nm GDS database units. ICC2 emits 0.1 nm
# units even when all geometry is on a 1 nm grid. Refuse conversion if it
# would round any polygon/path edge, instance origin or text position.
def check_nm_grid(points, context):
    for point in points:
        for value in point:
            nm = float(value) * lib.unit / 1e-9
            if abs(nm - round(nm)) > 1e-5:
                raise ValueError(f'Cannot losslessly convert {context} to 1 nm: {value}')

for cell in lib.cells:
    for polygon in cell.polygons:
        check_nm_grid(polygon.points, cell.name)
    for path in cell.paths:
        for polygon in path.to_polygons():
            check_nm_grid(polygon.points, cell.name)
    for reference in cell.references:
        check_nm_grid([reference.origin], cell.name)
        if reference.repetition.size:
            check_nm_grid(reference.repetition.get_offsets(), cell.name)
    for label in cell.labels:
        check_nm_grid([label.origin], cell.name)
lib.precision = 1e-9
lib.write_gds(out / 'core.gds')
for name in ('VDD', 'VSS'):
    pattern = rf'  PIN {name}\n.*?  END {name}\n'
    match = re.search(pattern, lef, re.S)
    assert match and 'PORT' not in match[0]
    lef = re.sub(pattern, '', lef, flags=re.S)

# OVERLAP is ICC2's placement-only outline, not a fabrication/routing layer.
# Magic's GF180 technology does not define it. Remove only this redundant
# outline after proving it matches SIZE; keep every routing obstruction.
overlap = re.search(r'    LAYER OVERLAP\s*;\s*POLYGON\s+([^;]+);[^\S\n]*\n?', lef)
if overlap:
    values = list(map(float, overlap[1].split()))
    outline = gdstk.Polygon(list(zip(values[::2], values[1::2])))
    assert not gdstk.boolean([outline], [boundary], 'xor', precision=0.0005)
    lef = lef[:overlap.start()] + lef[overlap.end():]
lef = re.sub(r'^LAYER OVERLAP\s+TYPE OVERLAP\s*;\s*END OVERLAP\s*\n', '', lef, flags=re.M)

# Magic rejects the long notched POLYGON records emitted by ICC2. Split
# Manhattan polygons into rectangles, preserving pin-access notches exactly.
def polygon_rectangles(coordinates):
    values = list(map(float, coordinates.split()))
    assert len(values) >= 8 and len(values) % 2 == 0
    points = list(zip(values[::2], values[1::2]))
    for a, b in zip(points, points[1:] + points[:1]):
        assert a[0] == b[0] or a[1] == b[1], 'Non-Manhattan LEF polygon'
    polygon = gdstk.Polygon(points)
    ys = sorted({y for x, y in points})
    rectangles = []
    for bottom, top_y in zip(ys, ys[1:]):
        middle = (bottom + top_y) / 2
        xs = sorted(a[0] for a, b in zip(points, points[1:] + points[:1])
                    if a[0] == b[0] and min(a[1], b[1]) < middle < max(a[1], b[1]))
        assert len(xs) % 2 == 0
        for left, right in zip(xs[::2], xs[1::2]):
            rectangles.append(gdstk.rectangle((left, bottom), (right, top_y)))
    assert not gdstk.boolean([polygon], rectangles, 'xor', precision=0.0005)
    return '\n'.join('      RECT ' + ' '.join(f'{v:.6f}'.rstrip('0').rstrip('.')
                     for point in r.bounding_box() for v in point) + ' ;'
                     for r in rectangles)

lef = re.sub(r'\s*POLYGON\s+([^;]+);', lambda m: '\n' + polygon_rectangles(m[1]), lef)

# The GDS supply stripes run continuously between the original end pins.
# Expose that real metal in the abstract as well: full-height wrapper power
# pins must not land on an OBS-only representation of the same supply.
supplies = []
metal4 = top.get_polygons(layer=46, datatype=0)
for name in ('VPWR', 'VGND'):
    pattern = rf'  PIN {name}\n.*?  END {name}'
    match = re.search(pattern, lef, re.S)
    assert match
    pin = match[0]
    assert re.findall(r'LAYER (\w+)\s*;', pin) == ['Metal4']
    rects = [tuple(map(float, m)) for m in re.findall(
        r'RECT ([\d.]+) ([\d.]+) ([\d.]+) ([\d.]+)\s*;', pin)]
    columns = sorted({(x1, x2) for x1, y1, x2, y2 in rects})
    assert len(columns) == 8 and len(rects) == 16
    lines = []
    for x1, x2 in columns:
        assert (x1, 0, x2, 1) in rects and (x1, height - 1, x2, height) in rects
        stripe = gdstk.rectangle((x1, 0), (x2, height))
        assert not gdstk.boolean([stripe], metal4, 'not', precision=0.0005), \
            f'Missing GDS supply metal for {name} at {x1}'
        supplies.append(stripe)
        lines.append(f'        RECT {x1:g} 0 {x2:g} {height:g} ;')
    pin = re.sub(r'        RECT[^;]+;\n', '', pin)
    pin = pin.replace('      LAYER Metal4 ;', '      LAYER Metal4 ;\n' + '\n'.join(lines))
    lef = lef[:match.start()] + pin + lef[match.end():]

def clear_supply_obstructions(match):
    header, body = match.groups()
    rectangles = [gdstk.rectangle(v[:2], v[2:]) for v in
                  (list(map(float, raw.split())) for raw in re.findall(r'RECT\s+([^;]+);', body))]
    remainder = gdstk.boolean(rectangles, supplies, 'not', precision=0.0005)
    lines = []
    for poly in remainder:
        raw = ' '.join(str(v) for point in poly.points for v in point)
        lines.append(polygon_rectangles(raw))
    return header + '\n' + '\n'.join(lines) + '\n'

lef = re.sub(r'^(    LAYER Metal4(?: SPACING 0)? ;)(.*?)(?=^    LAYER|^  END)',
             clear_supply_obstructions, lef, flags=re.S | re.M)
(out / 'core.lef').write_text(lef)
for filename in ('core.v', 'core.pg.v'):
    text = (a.export / filename).read_text()
    start = text.index('module ' + old)
    end = text.index('endmodule', start)
    top = text[start:end].replace(old, new)
    top = top.replace(' , VDD , VSS , VPWR', ' , VPWR')
    for alias, actual in [('VDD', 'VPWR'), ('VSS', 'VGND')]:
        top = re.sub(rf'input\s+{alias}\s*;\n', '', top)
        top = re.sub(rf'assign\s+{actual}\s*=\s*{alias}\s*;\n', '', top)
        # Preserve named child ports .VDD/.VSS; replace their connection nets.
        top = re.sub(rf'(?<!\.)\b{alias}\b', actual, top)
    (out / filename).write_text(text[:start] + top + text[end:])
spef = (a.export / 'core.gf180_nominal_25.spef').read_text()
spef = spef.replace(f'*DESIGN "{old}"', f'*DESIGN "{new}"')
# ICC2 includes physical-only fillers in NAME_MAP, although they have no
# signal parasitics. Older OpenSTA parsers reject their exclamation marks.
# Remove only entries with no references; never remove R/C or connectivity.
from collections import Counter
references = Counter(re.findall(r'\*(\d+)(?!\d)', spef))
lines = spef.splitlines(keepends=True)
removed = 0
in_name_map = False
kept = []
for line in lines:
    if line.strip() == '*NAME_MAP':
        in_name_map = True
    elif re.match(r'^\*[A-Z_]+', line):
        in_name_map = False
    match = re.fullmatch(r'\*(\d+) (xofiller!\S+)\s*', line)
    if in_name_map and match:
        if references[match[1]] != 1:
            raise ValueError(f'Cannot drop referenced filler: {match[2]}')
        removed += 1
    else:
        kept.append(line)
(out / 'core.spef').write_text(''.join(kept))
print(f'Removed {removed} unreferenced filler NAME_MAP entries')
(out / 'provenance.json').write_text(json.dumps({
    'export': a.export.name,
    'source_sha256': {f: hashlib.sha256((a.export / f).read_bytes()).hexdigest()
                      for f in ('core.gds', 'core.lef', 'core.v', 'core.pg.v', 'core.gf180_nominal_25.spef')},
    'removed_unused_spef_fillers': removed,
    'pr_boundary_um': [0, 0, width, height],
    'gds_precision_m': lib.precision,
    'lef_power_pins': 'Expose GDS-verified continuous Metal4 stripes; subtract only these stripes from Metal4 OBS.',
    'changes': 'Remove unused SPEF filler names; rename top; remove geometry-free VDD/VSS aliases, use existing VPWR/VGND terminals; add missing PR_bndry (0/0) from LEF SIZE; normalize GDS precision to 1 nm after grid checks; convert LEF polygons to equivalent rectangles and remove redundant OVERLAP outline. Circuit geometry unchanged.'
}, indent=2) + '\n')
print(out)
