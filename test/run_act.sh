#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/act-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
python3 - "$build_dir/vectors.hex" <<'PYREF'
import sys
sys.path.insert(0, 'test')
from fp8_reference import activate
with open(sys.argv[1], 'w') as f:
    for op in range(5):
        for x in range(256): f.write(f'{activate(x,op):02x}\n')
PYREF
iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_act -o "$build_dir/test" src/rtl/core/act.v test/tb_act.sv
vvp "$build_dir/test" +vectors="$build_dir/vectors.hex"
verilator --lint-only -Wall -Isrc/rtl -I./src/rtl/core --top-module act src/rtl/core/act.v
