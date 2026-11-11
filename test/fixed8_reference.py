"""Independent integer oracle for signed fixed8, nearest ties toward +infinity."""
from fractions import Fraction as F
from pathlib import Path
import os
import re

DEFAULT_FRAC_BITS = int(re.search(r'`define FIXED_FRAC_BITS (\d+)',
    (Path(__file__).resolve().parents[1] / 'src/rtl/defs/defs.vh').read_text())[1])
FRAC_BITS = int(os.environ.get('FIXED_FRAC_BITS', DEFAULT_FRAC_BITS))
SCALE = 1 << FRAC_BITS

def signed(x):
    return x - 256 if x & 128 else x

def clamp(x):
    return min(127, max(-128, x))

def decode8(x):
    return F(signed(x), SCALE)

def encode8(x):
    v = F(x) * SCALE + F(1, 2)
    return clamp(v.numerator // v.denominator) & 255

def add8(a, b):
    return clamp(signed(a) + signed(b)) & 255

def sub8(a, b):
    return clamp(signed(a) - signed(b)) & 255

def mac8(a, b, old=0, accumulate=False):
    product = (signed(a) * signed(b) + SCALE // 2) // SCALE
    return clamp(product + (signed(old) if accumulate else 0)) & 255

def mul8(a, b):
    return mac8(a, b)

def sigmoid(x):
    return min(SCALE, max(0, (signed(x) + 2) // 4 + SCALE // 2))

def tanh(x):
    return min(SCALE, max(-SCALE, signed(x))) & 255

def activate(x, op):
    return (x if op == 0 else max(0, signed(x)) if op == 1 else
            sigmoid(x) if op == 2 else tanh(x) if op == 3 else
            SCALE if signed(x) > 0 else 0)
