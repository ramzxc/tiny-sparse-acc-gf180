"""Packed fixed8 matrix jobs with an independent integer reference."""
from fixed8_reference import *

# Standalone packed matrix fixtures; the integer oracle is independent of RTL.
if __name__ == '__main__':
    import random, sys
    rng = random.Random(8321)
    cases = []
    def add(rows, cols, vectors, activation, zero=False):
        stride = rows
        w = [rng.choice([0x00,0x80,0x38,0xb8,0x40,0xc0,0x30,0x01,0x7e,0xfe])
             if row < rows else 0 for col in range(cols) for row in range(stride)]
        x = [[0 if zero else rng.choice([0,0x80,0,0x38,0xb8,0x40,0x28,0x01])
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
                    if sparse and vector[k]==0: continue
                    for r in range(stride): accum[r] = mac8(w[k*stride+r],vector[k],accum[r],True)
                if act==1: accum=[activate(v,1) for v in accum]
                if act==2: accum=[sigmoid(v) for v in accum]
                if act==3: accum=[tanh(v) for v in accum]
                result.extend(accum)
            nnz = sum(v!=0 for vector in x for v in vector)
            f.write(f'{rows} {cols} {vectors} {act} {sparse} {nnz}\n')
            x_storage = [v for vector in x for v in vector]
            for data in (w,x_storage,result):
                f.write(' '.join(f'{v:02x}' for v in data)+'\n')
