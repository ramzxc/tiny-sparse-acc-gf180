#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/vpu-mac-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
python3 - "$build_dir/vectors.txt" <<'PY'
import sys, random
sys.path.insert(0, 'test')
from generate_matvec_vectors import add8, mul8
rng=random.Random(8192)
with open(sys.argv[1], 'w') as f:
    for case in range(8192):
        op=case%4; accumulate=(case//4)%2; sparse=(case//8)%2
        x=rng.randrange(65536); w=rng.randrange(65536); old=rng.randrange(65536)
        if case<4096:
            x=(case//16)*257
            w=rng.choice([0,128,1,56,184,126,254,127,255])*257
        result=0
        for lane in range(2):
            a=(x>>(8*lane))&255; b=(w>>(8*lane))&255; c=(old>>(8*lane))&255
            if op==2:
                v=(c if accumulate else 0) if sparse and a&127==0 else (add8(mul8(a,b),c) if accumulate else mul8(a,b))
            else:
                v=add8(a,b) if op==0 else add8(a,b^128) if op==1 else add8(b,a^128)
            result |= v<<(8*lane)
        control=(sparse<<6)|(rng.randrange(5)<<3)|(accumulate<<2)|op
        f.write(f'{x:04x} {w:04x} {old:04x} {control:02x} {result:04x}\n')
PY
iverilog -g2012 -I src -I src/core -s tb_vpu_mac -o "$build_dir/test" \
    src/core/vpu.v test/tb_vpu_mac.sv
vvp "$build_dir/test" +vectors="$build_dir/vectors.txt"
verilator --lint-only -Wall -I./src -I./src/core --top-module vpu src/core/vpu.v
