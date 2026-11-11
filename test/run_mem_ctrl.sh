#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/mem-ctrl-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_mem_ctrl -o "$build_dir/test" \
    src/rtl/core/mem_ctrl.v src/rtl/mem_itf.v src/rtl/qspi_ctrl.v src/rtl/core/vpu.v src/rtl/core/act.v \
    test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_mem_ctrl.sv
vvp "$build_dir/test"
verilator --lint-only -Wall -Isrc/rtl -I./src/rtl/core --top-module mem_ctrl src/rtl/core/mem_ctrl.v
