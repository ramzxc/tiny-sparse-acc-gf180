#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/decoder-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
iverilog -g2012 -I src -I src/core -s tb_decoder -o "$build_dir/test" \
    src/core/decoder.v src/core/inst_fifo.v test/tb_decoder.sv
vvp "$build_dir/test"
verilator --lint-only -Wall -I./src -I./src/core --top-module decoder src/core/decoder.v
