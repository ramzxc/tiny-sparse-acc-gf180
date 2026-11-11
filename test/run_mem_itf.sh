#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/mem-itf-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT

# Compile the active source list; includes the fully connected Tiny Tapeout top.
mapfile -t rtl < src/sources.f
rtl=("${rtl[@]/#/src/}")
iverilog -g2012 -I src/rtl -I src/rtl/core -s tt_um_tiny_sparse_acc_ramzxc \
    -o "$build_dir/all-rtl" "${rtl[@]}"

iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_mem_itf -o "$build_dir/integration" \
    src/rtl/mem_itf.v src/rtl/qspi_ctrl.v src/rtl/uart/uart_rx.v src/rtl/uart/uart_tx.v src/rtl/core/inst_fifo.v \
    test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_mem_itf.sv
vvp "$build_dir/integration"

for module_path in src/rtl/mem_itf.v src/rtl/uart/uart_rx.v src/rtl/uart/uart_tx.v; do
    module_name=$(basename "$module_path" .v)
    verilator --lint-only -Wall -Isrc/rtl -I./src/rtl/core --top-module "$module_name" "$module_path"
done
