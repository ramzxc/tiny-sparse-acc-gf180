"""Actual maze EGRU first timestep; exact-rational FP8 oracle, tiled host jobs.

Weights are staged between jobs by the testbench (Flash loader is out of scope).
Initial h=y=0, hence recurrent matmul is exactly zero and only its bias remains.
All 256 hidden units and every intermediate are checked, not training accuracy.
"""
import argparse
from pathlib import Path
import numpy as np
from generate_matvec_vectors import F, encode8, decode8, add8, mul8, sigmoid, tanh

p = argparse.ArgumentParser()
p.add_argument('output')
p.add_argument('--data-dir', default='/docker/projects/egru/sim/data/maze/fixed16')
args = p.parse_args()
f = open(args.output, 'w')
mem = {}
jobs = 0
checks = 0

def load(addr, values, bank=1):
    values = list(map(int, values))
    f.write(f'L {bank} {addr} {len(values)} ' + ' '.join(f'{v:02x}' for v in values) + '\n')
    if bank == 1:
        mem.update({addr+i: v for i, v in enumerate(values)})

def run(word, dst, expected):
    global jobs, checks
    f.write(f'J {word:016x}\nC {dst} {len(expected)} ' + ' '.join(f'{v:02x}' for v in expected) + '\n')
    mem.update({dst+i: v for i, v in enumerate(expected)})
    jobs += 1
    checks += len(expected)

def activate(v, act):
    if act == 0: return v
    if act == 1: return 127 if decode8(v) is None else 0 if v & 128 else v
    if act == 2: return sigmoid(v)
    if act == 3: return tanh(v)
    return 127 if decode8(v) is None else 0x38 if decode8(v) > 0 else 0

def vector(a, b, dst, length=256, op=0, act=0, sparse=0):
    for start in range(0, length, 128):
        n = min(128, length-start)
        expected = []
        for i in range(start, start+n):
            x, y = mem.get(a+i, 0), mem[b+i]
            v = (add8(x, y) if op == 0 else add8(x, y ^ 128) if op == 1
                 else (0 if sparse and y & 127 == 0 else mul8(x, y)) if op == 2 else y)
            expected.append(activate(v, act))
        word = (1 << 63) | (sparse << 62) | (n << 52) | (op << 50) | (act << 47)
        run(word | ((a+start) << 24) | ((b+start) << 12) | (dst+start), dst+start, expected)

# Focused cases cover all vector operations/activations, odd lengths, signed zero,
# NaN, sparse all-zero pairs and mixed pairs. Padding is allocated but ignored.
for op in range(4):
    for act in range(5):
        for sparse in range(2):
            load(0, [0x7f, 0x38, 0xb8, 0x40, 0x30, 0x80, 0x38, 0])
            load(32, [0, 0x80, 0x38, 0, 0xb8, 0x40, 0x30, 0])
            vector(0, 32, 64, 7, op, act, sparse)

weights = np.load(Path(args.data_dir) / 'fixed16_export.npz')
data = np.load(Path(args.data_dir) / 'test.npz')
def quantize(values, fractional_bits):
    return [encode8(F(int(v), 1 << int(fractional_bits))) for v in np.ravel(values)]
x = quantize(data['input_q412'][int(data['trial_offsets'][0])], data['input_fractional_bits'])
load(0, x)
# Three full affine input products, 8 output rows per weight tile.
for gate in range(3):
    for row in range(0, 256, 8):
        tile = quantize(weights['kernel'][:, gate*256+row:gate*256+row+8], weights['fixed_weight_fractional_bits'])
        load(0, tile, bank=0)
        expected = [0]*8
        for k, b in enumerate(x):
            if b & 127 == 0: continue
            for r in range(8):
                expected[r] = add8(mul8(tile[k*8+r], b), expected[r])
        dst = 512 + gate*256 + row
        run((1 << 62) | (8 << 52) | (182 << 44) | (1 << 36) | dst, dst, expected)
    load(1280, quantize(weights['bias'][gate*256:(gate+1)*256], weights['fixed_bias_fractional_bits']))
    vector(512+gate*256, 1280, 1536)  # vx = xW + bias
    load(1792, quantize(weights['recurrent_bias'][gate*256:(gate+1)*256], weights['fixed_bias_fractional_bits']))
    if gate < 2:
        vector(1536, 1792, 2048+gate*256, act=2)  # z, r
    else:
        vector(2304, 1792, 2560, op=2)  # r * vh_candidate
        vector(1536, 2560, 2816, act=3)  # candidate
load(512, [0]*256)  # initial h
load(768, [0x38]*256)
vector(2048, 512, 1024, op=2)  # z*h
vector(768, 2048, 1280, op=1)  # 1-z
vector(1280, 2816, 1536, op=2)
vector(1024, 1536, 1792)  # cur
load(512, quantize(weights['threshold'], weights['fixed_hidden_fractional_bits']))
vector(1792, 512, 768, op=1)
vector(0, 768, 1024, op=3, act=4)  # event
vector(1024, 512, 1280, op=2)
vector(1792, 1280, 1536, op=1)  # new h
vector(1024, 1792, 2048, op=2)  # new y
f.write('E\n')
f.close()
print(f'EGRU first timestep: 182 inputs ({sum(bool(v & 127) for v in x)} nonzero), 256 hidden units')
print(f'{jobs} jobs, {checks} checked bytes; events={sum(mem[1024+i] == 0x38 for i in range(256))}')
