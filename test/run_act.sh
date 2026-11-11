#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/act-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_act -o "$build_dir/test" src/rtl/core/act.v test/tb_act.sv
vvp "$build_dir/test"
verilator --lint-only -Wall -Isrc/rtl -I./src/rtl/core --top-module act src/rtl/core/act.v
