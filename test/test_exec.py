#!/usr/bin/env python3
"""Generate exact-rational FP8 expectations and run the rebuilt EXEC block."""
from pathlib import Path
import random
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'test'))
from fp8_reference import add8, sub8, mul8, sigmoid, tanh, decode8


def activation(x, op):
    if decode8(x) is None:
        return 0x7f
    if op == 0:
        return x
    if op == 1:
        return 0 if x & 128 else x
    if op == 2:
        return tanh(x)
    if op == 3:
        return sigmoid(x)
    return 0x38 if decode8(x) > 0 else 0


def main():
    rng = random.Random(19)
    cases = []
    # Every input encoding through every activation, multiplied by exactly 1.
    for op in range(5):
        for x in range(256):
            cases.append((x, 0x38, 2, False, op))
    # ADD/SUB/MUL, including stationary accumulated state, NaNs and signed zero.
    for _ in range(6000):
        op = rng.randrange(3)
        cases.append((rng.randrange(256), rng.randrange(256), op,
                      op == 2 and bool(rng.randrange(2)), rng.randrange(5)))
    acc = 0
    lines = []
    for x, w, op, accum, act in cases:
        product = mul8(x, w)
        acc = (add8(x, w) if op == 0 else sub8(x, w) if op == 1 else
               add8(product, acc) if accum else product)
        cmd = (int(accum) << 5) | (op << 3) | act
        packed = (x << 22) | (w << 14) | (cmd << 8) | activation(acc, act)
        lines.append(f'{packed:08x}\n')
    with tempfile.TemporaryDirectory(prefix='rebuild-exec-') as tmp:
        tmp = Path(tmp)
        vectors = tmp / 'vectors.hex'
        vectors.write_text(''.join(lines))
        image = tmp / 'exec.vvp'
        subprocess.run(['iverilog', '-g2012', '-I', 'src/rtl/core',
                        '-s', 'tb_exec', '-o', str(image),
                        'test/tb_exec.sv', 'src/rtl/core/exec_unit.v'],
                       cwd=ROOT, check=True)
        subprocess.run(['vvp', str(image), f'+vectors={vectors}',
                        f'+count={len(lines)}'], cwd=ROOT, check=True)


if __name__ == '__main__':
    main()
