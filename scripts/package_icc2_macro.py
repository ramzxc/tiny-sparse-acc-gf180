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
out = root / 'src/macros/tiny_sparse_acc_core'
out.mkdir(parents=True, exist_ok=True)
old, new = 'tt_um_tiny_sparse_acc_ramzxc', 'tiny_sparse_acc_core'
lib = gdstk.read_gds(a.export / 'core.gds')
next(c for c in lib.cells if c.name == old).name = new
lib.write_gds(out / 'core.gds')
lef = (a.export / 'core.lef').read_text().replace(old, new)
for name in ('VDD', 'VSS'):
    pattern = rf'  PIN {name}\n.*?  END {name}\n'
    match = re.search(pattern, lef, re.S)
    assert match and 'PORT' not in match[0]
    lef = re.sub(pattern, '', lef, flags=re.S)
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
    'changes': 'Remove unused SPEF filler names; rename top; remove geometry-free VDD/VSS aliases, use existing VPWR/VGND terminals. GDS geometry unchanged.'
}, indent=2) + '\n')
print(out)
