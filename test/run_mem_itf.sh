#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/mem-itf-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT

# Compile every current RTL module, including the unfinished top skeleton.
iverilog -g2012 -Wall -I src -I src/core -o "$build_dir/all-rtl" \
    src/project.v src/core/inst_fifo.v src/uart/uart_tx.v src/uart/uart_rx.v \
    src/mem_itf.v src/qspi_ctrl.v

iverilog -g2012 -I src -I src/core -s tb_mem_itf -o "$build_dir/integration" \
    src/mem_itf.v src/qspi_ctrl.v src/uart/uart_rx.v src/uart/uart_tx.v src/core/inst_fifo.v \
    test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_mem_itf.sv
vvp "$build_dir/integration"

for module_path in src/mem_itf.v src/uart/uart_rx.v src/uart/uart_tx.v; do
    module_name=$(basename "$module_path" .v)
    verilator --lint-only -Wall -I./src -I./src/core --top-module "$module_name" "$module_path"
done
