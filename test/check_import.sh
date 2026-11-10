#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
for test in inst_fifo decoder act vpu_mac mem_ctrl micro_ctrl uart_matvec uart_microcode; do
    bash "test/run_${test}.sh"
done
build_dir=$(mktemp -d /tmp/tt-checkpoint.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
top=tb_tt_checkpoint
if [[ $(cat src/build_mode.txt) == direct ]]; then top=tb_uart_microcode; fi
iverilog -g2012 -I src -s "$top" -o "$build_dir/top" \
    src/generated/design.v test/qspi_psram_model.sv test/qspi_nor_model.sv "test/$top.sv"
vvp "$build_dir/top"
