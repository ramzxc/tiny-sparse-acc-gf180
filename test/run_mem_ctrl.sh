#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/mem-ctrl-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
iverilog -g2012 -I src -I src/core -s tb_mem_ctrl -o "$build_dir/test" \
    src/core/mem_ctrl.v src/mem_itf.v src/qspi_ctrl.v src/core/vpu.v src/core/act.v \
    test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_mem_ctrl.sv
vvp "$build_dir/test"
verilator --lint-only -Wall -I./src -I./src/core --top-module mem_ctrl src/core/mem_ctrl.v
