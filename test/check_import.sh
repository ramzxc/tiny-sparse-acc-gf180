#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
for test in inst_fifo decoder act mem_ctrl micro_ctrl uart_matvec; do
    bash "test/run_${test}.sh"
done
build_dir=$(mktemp -d /tmp/tt-checkpoint.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
iverilog -g2012 -I src -s tb_tt_checkpoint -o "$build_dir/top" \
    src/generated/design.v test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_tt_checkpoint.sv
vvp "$build_dir/top"
