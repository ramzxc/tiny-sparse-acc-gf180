#!/usr/bin/env python3
"""Report physical cell instances, including the imported core, to Actions."""
import argparse
from collections import Counter
import json
from pathlib import Path
import re

import gdstk


def cell_counts(cell):
    counts = Counter()
    for ref in cell.references:
        copies = ref.repetition.size or 1
        if ref.cell_name.startswith('gf180mcu_fd_sc_'):
            counts[ref.cell_name] += copies
        else:
            if not isinstance(ref.cell, gdstk.Cell):
                raise ValueError(f'Unresolved cell: {ref.cell_name}')
            for name, count in cell_counts(ref.cell).items():
                counts[name] += count * copies
    return counts


def summary(gds, run):
    layout = gdstk.read_gds(gds)
    cells = {c.name: c for c in layout.cells}
    core = cells['tiny_sparse_acc_core']
    if core.bounding_box() is None:
        raise ValueError('Empty core: cannot report valid cell usage')
    core_counts = cell_counts(core)
    total = cell_counts(cells['tt_um_tiny_sparse_acc_ramzxc'])
    if any(total[name] < count for name, count in core_counts.items()):
        raise ValueError('Core instance counts exceed final design counts')
    wrapper = total - core_counts

    print('## Physical cell usage (including ICC2 core)\n')
    print('Counts come from final GDS instances; tap, filler and endcap cells are included.\n')
    print('| Scope | Standard-cell instances |')
    print('|---|---:|')
    for name, counts in [('Core', core_counts), ('Wrapper', wrapper), ('Total', total)]:
        print(f'| {name} | {sum(counts.values())} |')
    print('\n<details><summary>Cell counts by master</summary>\n')
    print('| Cell | Core | Wrapper | Total |\n|---|---:|---:|---:|')
    for name in sorted(total):
        print(f'| {name} | {core_counts[name]} | {wrapper[name]} | {total[name]} |')
    print('\n</details>\n')

    print('## Wrapper lint\n')
    logs = sorted(run.glob('*-verilator-lint/verilator-lint.log'))
    if logs:
        text = logs[-1].read_text()
        errors = len(re.findall(r'^%Error', text, re.M))
        warnings = len(re.findall(r'^%Warning', text, re.M))
        print(f'Errors: **{errors}**; warnings: **{warnings}**.\n')
        print('This GDS-flow lint covers the wrapper and macro declarations, not the core RTL.\n')
    else:
        print('Lint report unavailable.\n')

    print('## Final timing and routing metrics\n')
    states = sorted(run.glob('*-misc-reportmanufacturability/state_in.json'))
    if not states:
        print('Final metrics unavailable.\n')
        return
    metrics = json.loads(states[-1].read_text()).get('metrics', {})
    print('| Metric | Value |\n|---|---:|')
    for label, key in [
        ('Setup worst slack (ns)', 'timing__setup__ws'),
        ('Hold worst slack (ns)', 'timing__hold__ws'),
        ('Setup violations', 'timing__setup_vio__count'),
        ('Hold violations', 'timing__hold_vio__count'),
        ('Max slew violations (reported aggregate)', 'design__max_slew_violation__count'),
        ('Max cap violations (reported aggregate)', 'design__max_cap_violation__count'),
        ('Routing DRC violations', 'route__drc_errors'),
    ]:
        value = metrics.get(key, 'not reported')
        if isinstance(value, float):
            value = f'{value:.6f}'
        print(f'| {label} | {value} |')
    print('\nTiming uses the flow SDC and supplied macro netlist/SPEF; it is not a full-core LVS result.')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('gds', type=Path)
    parser.add_argument('--run', type=Path, default=Path('runs/wokwi'))
    args = parser.parse_args()
    summary(args.gds, args.run)
