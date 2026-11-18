#!/usr/bin/env python3
"""Run actual EGRU first step + FC through submission decoder/data_ctrl/exec_unit.

Independent rational FP8 oracle; vector-wide variable-latency memory model.
The full 182-input/256-hidden exported network is the default. No UART, QSPI,
training accuracy, physical timing, or automatic microcode hardware is implied.
"""
import argparse
import json
import re
from pathlib import Path
import subprocess
import sys
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'test'))
from fp8_reference import F, encode8, decode8, add8, sub8, mul8, tanh, sigmoid


def activation(x, op):
    if decode8(x) is None: return 127
    if op == 1: return 0 if x & 128 else x
    if op == 2: return tanh(x)
    if op == 3: return sigmoid(x)
    if op == 4: return 0x38 if decode8(x) > 0 else 0
    return x


class Program:
    def __init__(self, path, width, sparse):
        self.f = path.open('w')
        self.width, self.sparse = width, sparse
        self.cur_bits = max(1, (width-1).bit_length())
        self.memory = {}
        self.next_addr = 0x10000  # exercise both halves of the address
        self.reads = self.writes = self.skips = self.instructions = 0
        self.input_values = [0]*width
        self.checks = 0

    def allocate(self, values, preload=True):
        values = list(map(int, values))
        values += [0]*((-len(values)) % self.width)
        a = self.next_addr
        self.next_addr += len(values)
        assert self.next_addr < 1048576
        for i, v in enumerate(values):
            self.memory[a+i] = v
            if preload: self.f.write(f'L {a+i:x} {v:02x}\n')
        return a

    def issue(self, word):
        assert 0 <= word < 65536
        self.f.write(f'I {word:04x}\n')
        self.instructions += 1

    def address(self, a):
        self.issue(0x3000 | (a >> 12))
        self.issue(0x2000 | (a & 4095))

    def load(self, a, weight=False, cur=None):
        mode = 0x8000 | (int(weight) << 10)
        if cur is not None:
            mode |= (cur << (10-self.cur_bits)) | (1 << (9-self.cur_bits))
            mode |= int(self.sparse) << 11
        self.issue(mode)
        self.address(a)
        self.issue(0x4800)  # MEM READ, PSRAM A
        self.issue(0xffff)
        skipped = weight and cur is not None and self.sparse and not (self.input_values[cur] & 127)
        self.skips += int(skipped)
        self.reads += int(not skipped)
        if not weight: self.input_values = [self.memory[a+i] for i in range(self.width)]

    def execute(self, op, act=0, acc=False):
        self.issue(0x6000 | (int(acc) << 12) | (op << 10) | (act << 7))
        self.issue(0xffff)

    def store(self, a, expected):
        self.issue(0x9000)
        self.address(a)
        self.issue(0x5800)
        self.issue(0xffff)
        self.writes += 1
        for i, v in enumerate(expected):
            self.memory[a+i] = v
            self.f.write(f'C {a+i:x} {v:02x}\n')
            self.checks += 1

    def vector(self, a, b, n, op=0, act=0):
        out = self.allocate([0]*n, False)
        for start in range(0, n, self.width):
            self.load(a+start)
            self.load(b+start, True)
            self.execute(op, act)
            fn = [add8, sub8, mul8][op]
            vals = [activation(fn(self.memory[a+start+i], self.memory[b+start+i]), act)
                    for i in range(self.width)]
            self.store(out+start, vals)
        return out

    def gemv(self, a, weights, bias):
        ksize, n = weights.shape
        padded_n = n + (-n) % self.width
        weights = np.pad(weights, ((0, 0), (0, padded_n-n)))
        w = self.allocate(weights.ravel())
        out = self.allocate([0]*padded_n, False)
        zero = self.allocate([0]*self.width)
        for start in range(0, padded_n, self.width):
            self.load(zero)
            self.load(zero, True)
            self.execute(2)
            sums = [0]*self.width
            for k in range(ksize):
                if k % self.width == 0: self.load(a + k - k % self.width)
                self.load(w+k*padded_n+start, True, k % self.width)
                self.execute(2, acc=True)
                x = self.memory[a+k]
                for lane in range(self.width):
                    # Dense mathematical result: no dependence on RTL skip logic.
                    sums[lane] = add8(mul8(x, int(weights[k,start+lane])), sums[lane])
            self.store(out+start, sums)
        b = self.allocate(bias)
        return self.vector(out, b, n)

    def finish(self):
        self.f.write(f'R {self.reads} {self.writes}\n')
        self.f.close()
        return dict(reads=self.reads, writes=self.writes, skipped_weight_reads=self.skips,
                    instructions=self.instructions, checked_bytes=self.checks)


def quantize(values, frac):
    unique, indices = np.unique(values, return_inverse=True)
    codes = [encode8(F(int(v), 1 << int(frac))) for v in unique]
    return np.array(codes, dtype=np.uint8)[indices].reshape(values.shape)


def generate(path, width, sparse, w, x, hidden):
    p = Program(path, width, sparse)
    # Mixed +0/-0 and nonzero input, cur changes without reloading, input-mask
    # replacement, padded non-power-of-two lanes, and dense vector operations.
    for inputs in ([0, 0x38, 0x80, 0xb8, 0x40], [0x38, 0, 0xb8, 0x80, 0]):
        a = p.allocate(inputs)
        weights = np.array([[0x38, 0xb8, 0x30]]*len(inputs), dtype=np.uint8)
        p.gemv(a, weights, [0x30, 0, 0xb0])
    for op in range(3):
        for act in range(5):
            a = p.allocate([0x38, 0xb8, 0x40, 0, 0x80])
            b = p.allocate([0x30, 0x38, 0xb8, 0x38, 0])
            p.vector(a, b, 5, op, act)

    h = p.allocate([0]*hidden)
    y = p.allocate([0]*hidden)
    a = p.allocate(x)
    vx = p.gemv(a, w['kernel'], w['bias'])
    # Execute recurrent GEMV as well, including all-zero skip behavior.
    vh = p.gemv(y, w['recurrent_kernel'], w['recurrent_bias'])
    # Copy gate slices using RTL ADD with zero, never host-inject intermediates.
    # Each destination has independent tail padding for arbitrary lane counts.
    def gate(base, g):
        dest = p.allocate([0]*hidden, False)
        zero = p.allocate([0]*hidden)
        for start in range(0, hidden, width):
            p.load(base+g*hidden+start)
            p.load(zero+start, True)
            p.execute(0)
            vals = [add8(p.memory[base+g*hidden+start+i], 0) for i in range(width)]
            p.store(dest+start, vals)
        return dest
    ax, ar, ag = [gate(vx, g) for g in range(3)]
    bx, br, bg = [gate(vh, g) for g in range(3)]
    z = p.vector(ax, bx, hidden, act=3)
    r = p.vector(ar, br, hidden, act=3)
    rg = p.vector(r, bg, hidden, op=2)
    candidate = p.vector(ag, rg, hidden, act=2)
    zh = p.vector(z, h, hidden, op=2)
    one = p.allocate([0x38]*hidden)
    nz = p.vector(one, z, hidden, op=1)
    nc = p.vector(nz, candidate, hidden, op=2)
    current = p.vector(zh, nc, hidden)
    threshold = p.allocate(w['threshold'])
    event = p.vector(current, threshold, hidden, op=1, act=4)
    reset = p.vector(event, threshold, hidden, op=2)
    new_h = p.vector(current, reset, hidden, op=1)
    new_y = p.vector(event, current, hidden, op=2)
    fc = p.gemv(new_y, w['head_weight'], w['head_bias'])
    result = dict(h=[p.memory[new_h+i] for i in range(hidden)],
                  y=[p.memory[new_y+i] for i in range(hidden)],
                  fc=[p.memory[fc+i] for i in range(len(w['head_bias']))])
    # A separate nonzero FC input ensures weight reads/MAC are exercised even
    # when all first-step EGRU events happen to be zero.
    synthetic = p.allocate([0x38 if i % 2 else 0xb0 for i in range(hidden)])
    p.gemv(synthetic, w['head_weight'], w['head_bias'])
    result.update(p.finish())
    return result


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--widths', type=int, nargs='+', default=[2])
    ap.add_argument('--small', action='store_true', help='12 inputs, 6 hidden units')
    ap.add_argument('--output', type=Path, default=ROOT/'test/output/sparse_egru')
    ap.add_argument('--data-dir', type=Path, default=Path('/docker/projects/egru/sim/data/maze/fixed16'))
    args = ap.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    wf = np.load(args.data_dir/'fixed16_export.npz')
    df = np.load(args.data_dir/'test.npz')
    fields = dict(kernel='weight', recurrent_kernel='weight', bias='bias', recurrent_bias='bias',
                  threshold='hidden', head_weight='head_weight', head_bias='head_bias')
    w = {k: quantize(wf[k], wf[f'fixed_{v}_fractional_bits']) for k,v in fields.items()}
    x = quantize(df['input_q412'][int(df['trial_offsets'][0])], df['input_fractional_bits'])
    h = len(w['threshold'])
    if args.small:
        nh, ni = 6, 12
        columns = np.concatenate([np.arange(nh)+g*h for g in range(3)])
        w['kernel'] = w['kernel'][:ni, columns]
        w['recurrent_kernel'] = w['recurrent_kernel'][:nh, columns]
        for k in ['bias','recurrent_bias']: w[k] = w[k][columns]
        w['threshold'] = w['threshold'][:nh]
        w['head_weight'] = w['head_weight'][:nh]
        h, x = nh, x[:ni]
    report = dict(inputs=len(x), hidden=h, source=str(args.data_dir), runs={})
    for width in args.widths:
        assert 1 <= width <= 512
        image = args.output/f'cw{width}.vvp'
        subprocess.run(['iverilog','-g2012',f'-DCOMPUTE_WIDTH={width}', '-I','src/rtl',
                        '-I','src/rtl/core','-s','tb_sparse_egru','-o',str(image),
                        'test/tb_sparse_egru.sv', 'src/rtl/core/inst_decoder.v',
                        'src/rtl/core/data_ctrl.v','src/rtl/core/exec_unit.v'],cwd=ROOT,check=True)
        for sparse in [False, True]:
            key = f'cw{width}_{"sparse" if sparse else "dense"}'
            program = args.output/f'{key}.txt'
            print(f'Generating {key}: {len(x)} inputs, {h} hidden', flush=True)
            result = generate(program, width, sparse, w, x, h)
            run = subprocess.run(['vvp',str(image),f'+program={program}'],cwd=ROOT,
                                 text=True,capture_output=True,timeout=300)
            (args.output/f'{key}.log').write_text(run.stdout+run.stderr)
            print(run.stdout + run.stderr, end='', flush=True)
            run.check_returncode()
            match = re.search(r'cycles=(\d+)', run.stdout)
            result['cycles'] = int(match.group(1))
            result['rtl_pass'] = True
            report['runs'][key] = result
        dense, sparse = [report['runs'][f'cw{width}_{kind}'] for kind in ['dense','sparse']]
        for field in ['h','y','fc']: assert dense[field] == sparse[field]
        assert sparse['reads'] < dense['reads']
    (args.output/'summary.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'PASS EGRU + FC; report: {args.output / "summary.json"}')

if __name__ == '__main__': main()
