#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/vpu-mac-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
python3 - "$build_dir/vectors.txt" <<'PY'
import sys, random
sys.path.insert(0, 'test')
from fixed8_reference import add8, sub8, mac8
rng=random.Random(8192)
with open(sys.argv[1], 'w') as f:
    for case in range(8192):
        op=case%4; accumulate=(case//4)%2; sparse=(case//8)%2
        x=rng.randrange(256); w=rng.randrange(256); old=rng.randrange(256)
        if case<4096:
            x=case//16
            w=rng.choice([0,128,1,16,240,127,255])
        if op==2:
            result=(old if accumulate else 0) if sparse and x==0 else mac8(x,w,old,accumulate)
        else:
            result=add8(x,w) if op==0 else sub8(x,w) if op==1 else sub8(w,x)
        control=(sparse<<6)|(rng.randrange(5)<<3)|(accumulate<<2)|op
        f.write(f'{x:02x} {w:02x} {old:02x} {control:02x} {result:02x}\n')
PY
iverilog -g2012 -I src -I src/core -s tb_vpu_mac -o "$build_dir/test" \
    src/core/vpu.v test/tb_vpu_mac.sv
vvp "$build_dir/test" +vectors="$build_dir/vectors.txt"
verilator --lint-only -Wall -I./src -I./src/core --top-module vpu src/core/vpu.v
