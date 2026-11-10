#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/uart-matvec-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
sources=(src/core/micro_ctrl.v test/micro_core_fixture.sv src/core/decoder.v src/core/mem_ctrl.v src/core/vpu.v
    src/core/act.v src/core/inst_fifo.v src/uart/uart_tx.v src/uart/uart_rx.v)
iverilog -g2012 -I src -I src/core -s tb_uart_matvec -o "$build_dir/test" \
    "${sources[@]}" src/mem_itf.v src/qspi_ctrl.v \
    test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_uart_matvec.sv
vvp "$build_dir/test"
verilator --lint-only -Wall -I./src -I./src/core --top-module micro_core_fixture "${sources[@]}"
