#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/fixed8-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
for fractional_bits in 1 2 3 4 5 6; do
    iverilog -g2012 -D FIXED_FRAC_BITS=$fractional_bits -I src -I src/core \
        -s tb_fixed8_exhaustive -o "$build_dir/math" src/core/vpu.v test/tb_fixed8_exhaustive.sv
    vvp "$build_dir/math"
    iverilog -g2012 -D FIXED_FRAC_BITS=$fractional_bits -I src -I src/core \
        -s tb_act -o "$build_dir/act" src/core/act.v test/tb_act.sv
    vvp "$build_dir/act"
done
