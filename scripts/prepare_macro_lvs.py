#!/usr/bin/env python3
"""Adapt ICC2's powered Verilog for GF180 native-SPICE LVS, without changing logic."""
import re
from pathlib import Path


def prepare_lvs(text):
    # Native GF180 SPICE has explicit well terminals; ICC2's digital models do not.
    def wells(match):
        cell = match[0]
        for well, supply in [('VNW', 'VDD'), ('VPW', 'VSS')]:
            pin = re.search(r'\.' + supply + r'\s*\(\s*([^()]+?)\s*\)', cell)
            if not pin:
                raise ValueError(f'Missing {supply} connection: {cell}')
            if not re.search(r'\.' + well + r'\s*\(', cell):
                cell = re.sub(r'\)\s*;\s*$', ', .' + well + ' ( ' + pin[1] + ' ) ) ;', cell)
        return cell
    text = re.sub(r'gf180mcu_fd_sc_mcu7t5v0__\w+\s+[^;]+;', wells, text)

    # Netgen becomes case-insensitive after reading SPICE. ICC2's N<number>
    # generated nets can otherwise alias distinct n<number> nets in one module.
    names = set(re.findall(r'\bN\d+\b', text))
    for name in sorted(names):
        replacement = 'lvs_upper_' + name
        if re.search(r'\b' + replacement + r'\b', text):
            raise ValueError(f'Reserved LVS name already exists: {replacement}')
        text = re.sub(r'\b' + name + r'\b', replacement, text)
    return text


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('source', type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    args.output.write_text(prepare_lvs(args.source.read_text()))
