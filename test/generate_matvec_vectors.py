"""Independent exact-rational E4M3FN oracle (RNE, finite saturation)."""
from fractions import Fraction as F
from bisect import bisect_left
from pathlib import Path
import json

def decode8(x):
    s,e,m=x>>7,(x>>3)&15,x&7
    if e==15 and m==7: return None
    return (-1 if s else 1)*F(m if e==0 else 8+m)*F(2)**(-9 if e==0 else e-10)
VALUES=[decode8(x) for x in range(127)]
def encode8(x, negative_zero=False):
    if x is None: return 127
    sign=128 if x<0 or (x==0 and negative_zero) else 0
    x=abs(x)
    if x>=448: return sign|126
    i=bisect_left(VALUES,x)
    if i==0: return sign
    lo,hi=i-1,i
    dl,dh=x-VALUES[lo],VALUES[hi]-x
    code=lo if dl<dh or (dl==dh and lo%2==0) else hi
    return sign|code

def add8(a,b):
    x,y=decode8(a),decode8(b)
    return encode8(None if x is None or y is None else x+y, bool(a&b&128))
def mul8(a,b):
    x,y=decode8(a),decode8(b)
    return encode8(None if x is None or y is None else x*y,bool((a^b)&128))
def shift8(a,k):
    x=decode8(a)
    return encode8(None if x is None else x*F(2)**(-k),bool(a&128))
def from16(x):
    s,e,m=x>>15,(x>>10)&31,x&1023
    if e==31: return 127 if m else (s<<7)|126
    v=(-1 if s else 1)*F(m if e==0 else 1024+m)*F(2)**(-24 if e==0 else e-25)
    return encode8(v,bool(s))
def to16(x):
    import struct
    v=decode8(x)
    if v is None: return 0x7e00
    return int.from_bytes(struct.pack('>e',-0.0 if v==0 and x&128 else float(v)),'big')
def sigmoid(x):
    v=decode8(x)
    if v is None:return 127
    if v<=-2:return 0
    if v>=2:return 0x38
    return add8(shift8(x,2),0x30)
def tanh(x):
    v=decode8(x)
    if v is None:return 127
    if v<=-1:return 0xb8
    if v>=1:return 0x38
    return x


# Standalone checkpoint oracle. Values are exact Fractions; no RTL functions.
# FP8 oracle adapted from acc/sim/fp8/reference.py.
if __name__ == '__main__':
    import random, sys
    rng = random.Random(8321)
    cases = []
    def add(rows, cols, vectors, activation, zero=False):
        stride = rows
        w = [rng.choice([0x00,0x80,0x38,0xb8,0x40,0xc0,0x30,0x01,0x7e,0xfe])
             if row < rows else 0 for col in range(cols) for row in range(stride)]
        x = [[rng.choice([0,0x80]) if zero else rng.choice([0,0x80,0,0x38,0xb8,0x40,0x28,0x01])
              for _ in range(cols)] for _ in range(vectors)]
        for sparse in (0,1): cases.append((rows,cols,vectors,activation,sparse,w,x))
    add(4,5,1,0)
    add(1,5,1,0)  # dot product
    add(3,1,4,0)  # outer product
    add(3,5,4,1)  # odd M/K, multiple output columns
    for act in range(4): add(3,3,3,act,True)
    add(1,1,1,2)
    for _ in range(12): add(rng.randint(1,7),rng.randint(1,9),rng.randint(1,4),rng.randrange(4))
    with open(sys.argv[1], 'w') as f:
        f.write(f'{len(cases)}\n')
        for rows,cols,vectors,act,sparse,w,x in cases:
            stride = rows
            result = []
            for vector in x:
                accum = [0]*stride
                for k in range(cols):
                    if sparse and (vector[k]&127)==0: continue
                    for r in range(stride): accum[r] = add8(mul8(w[k*stride+r],vector[k]),accum[r])
                if act==1: accum=[127 if decode8(v) is None else 0 if v&128 else v for v in accum]
                if act==2: accum=[sigmoid(v) for v in accum]
                if act==3: accum=[tanh(v) for v in accum]
                result.extend(accum)
            nnz = sum((v&127)!=0 for vector in x for v in vector)
            f.write(f'{rows} {cols} {vectors} {act} {sparse} {nnz}\n')
            x_storage = [v for vector in x for v in vector]
            for data in (w,x_storage,result):
                f.write(' '.join(f'{v:02x}' for v in data)+'\n')
