#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/qspi-ctrl-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
sources=(src/rtl/qspi_ctrl.v test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_qspi_ctrl.sv)

iverilog -g2012 -I src/rtl -s tb_qspi_ctrl -o "$build_dir/normal" "${sources[@]}"
vvp "$build_dir/normal"

# Illustrative pad/memory delay test at 10 MHz core / 5 MHz SCK.
iverilog -g2012 -I src/rtl -s tb_qspi_ctrl \
    -Ptb_qspi_ctrl.OUT_DELAY=10 -Ptb_qspi_ctrl.IN_DELAY=40 \
    -o "$build_dir/delayed" "${sources[@]}"
vvp "$build_dir/delayed"

verilator --lint-only -Wall -Isrc/rtl --top-module qspi_ctrl src/rtl/qspi_ctrl.v
