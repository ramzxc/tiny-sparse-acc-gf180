#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/decoder-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_decoder -o "$build_dir/test" \
    src/rtl/core/decoder.v src/rtl/core/inst_fifo.v test/tb_decoder.sv
vvp "$build_dir/test"
verilator --lint-only -Wall -Isrc/rtl -I./src/rtl/core --top-module decoder src/rtl/core/decoder.v
