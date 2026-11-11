#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/inst-fifo-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT

for depth in 1 2 3; do
    iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_inst_fifo -Ptb_inst_fifo.DEPTH="$depth" \
        -o "$build_dir/unit" src/rtl/core/inst_fifo.v test/tb_inst_fifo.sv
    vvp "$build_dir/unit"
done
iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_uart_fifo -o "$build_dir/uart" \
    src/rtl/core/inst_fifo.v src/rtl/uart/uart_tx.v src/rtl/uart/uart_rx.v test/tb_uart_fifo.sv
vvp "$build_dir/uart"
verilator --lint-only -Wall -Isrc/rtl -I./src/rtl/core --top-module inst_fifo src/rtl/core/inst_fifo.v

iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_uart_checkpoint -o "$build_dir/checkpoint" \
    src/rtl/core/inst_fifo.v src/rtl/uart/uart_tx.v src/rtl/uart/uart_rx.v test/tb_uart_checkpoint.sv
vvp "$build_dir/checkpoint"
