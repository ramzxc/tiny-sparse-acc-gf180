#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/uart-microcode.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
mapfile -t sources < src/sources.f
sources=("${sources[@]/#/src/}")
iverilog -g2012 -DTT_DIRECT_UCODE -I src/rtl -I src/rtl/core -s tb_uart_microcode \
    -o "$build_dir/test" "${sources[@]}" test/qspi_psram_model.sv \
    test/qspi_nor_model.sv test/tb_uart_microcode.sv
vvp "$build_dir/test"
verilator --lint-only -Wall -Wno-DECLFILENAME -DTT_DIRECT_UCODE -Isrc/rtl -I./src/rtl/core \
    --top-module tt_um_tiny_sparse_acc_ramzxc "${sources[@]}"
