#!/usr/bin/env python3
"""Prove the six simulation corrections against the packaged gate netlist.

Each bit of a Python integer represents one complete binary input assignment.
No flop initialization is assumed: feedback outputs are independent inputs.
Only the two reset polarities used by each correction are constrained.
This is a local combinational reset proof, not full-chip equivalence/signoff.
"""
import operator
import re
from functools import reduce
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
NETLIST = ROOT / 'src/physical/macros/tiny_sparse_acc_core/core.pg.v'
CASES = [
    ('uart_tx', 'HFSNET_0', {'n42': 'clk_cnt[6]', 'n50': 'bit_idx[2]'}),
    ('uart_rx_WORD_WIDTH16', 'HFSNET_2', {
        'n98': 'clk_cnt[0]', 'n92': 'clk_cnt[6]',
        'n101': 'bit_idx[1]', 'n100': 'bit_idx[2]',
    }),
]


def prove(module, reset, targets):
    match = re.search(r'module ' + re.escape(module) + r'\b.*?endmodule',
                      NETLIST.read_text(), re.S)
    assert match, f'Missing module {module}'
    drivers = {}
    flop_inputs = {}
    cells = re.findall(
        r'gf180mcu_fd_sc_mcu7t5v0__(\w+)\s+(\w+)\s*\((.*?)\)\s*;',
        match[0], re.S)
    for cell, instance, body in cells:
        ports = dict((k, v.strip()) for k, v in
                     re.findall(r'\.(\w+)\s*\(\s*([^)]*)\)', body))
        if cell.startswith('dff'):
            flop_inputs[ports['D']] = ports['Q']
            continue
        output = ports.pop('ZN', ports.pop('Z', None))
        if output:
            assert output not in drivers, f'Multiple drivers: {output}'
            drivers[output] = (cell.rsplit('_', 1)[0], ports)

    constants = {'rst_n': 1, reset: 0}

    def support(net):
        if net in constants:
            return set()
        if net not in drivers:
            return {net}
        return set().union(*(support(v) for k, v in drivers[net][1].items()
                             if k not in ('VDD', 'VSS')))

    for target, expected_q in targets.items():
        assert flop_inputs.get(target) == expected_q, (module, target, expected_q)
        inputs = sorted(support(target))
        assert len(inputs) < 22, 'Cone too large for exhaustive bit-parallel proof'
        combinations = 1 << len(inputs)
        mask = (1 << combinations) - 1
        cache = {k: mask if v else 0 for k, v in constants.items()}
        cache.update({k: mask // ((1 << (1 << j)) + 1)
                      for j, k in enumerate(inputs)})

        def value(net):
            if net in cache:
                return cache[net]
            kind, ports = drivers[net]
            args = {k: value(v) for k, v in ports.items()
                    if k not in ('VDD', 'VSS')}
            if kind in ('inv', 'clkinv'):
                result = ~args['I']
            elif kind in ('buf', 'clkbuf'):
                result = args['I']
            elif re.fullmatch(r'(nand|and|nor|or)[234]', kind):
                op = operator.and_ if kind.startswith(('nand', 'and')) else operator.or_
                result = reduce(op, args.values())
                if kind.startswith(('nand', 'nor')):
                    result = ~result
            elif re.fullmatch(r'(aoi|oai)(21|22|31|32|211|221)', kind):
                groups = {}
                for pin, val in args.items():
                    groups.setdefault(pin[0], []).append(val)
                inside, outside = ((operator.and_, operator.or_) if kind.startswith('aoi')
                                   else (operator.or_, operator.and_))
                result = ~reduce(outside, (reduce(inside, group) for group in groups.values()))
            else:
                raise ValueError(f'Unsupported gate {kind}; review correction before proceeding')
            cache[net] = result & mask
            return cache[net]

        assert value(target) == 0, f'UNSAFE reset correction: {module}.{target}'
        print(f'PASS {module}.{expected_q}: D={target} is zero for all '
              f'{combinations} binary combinations during reset')


if __name__ == '__main__':
    for case in CASES:
        prove(*case)
