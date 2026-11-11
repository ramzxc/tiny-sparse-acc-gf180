#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/egru-layer-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
python3 test/generate_egru_layer.py "$build_dir/vectors.txt" "$@"
iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_egru_layer -o "$build_dir/test" \
    src/rtl/core/micro_ctrl.v test/micro_core_fixture.sv src/rtl/core/decoder.v \
    src/rtl/core/mem_ctrl.v src/rtl/core/vpu.v src/rtl/core/act.v src/rtl/mem_itf.v src/rtl/qspi_ctrl.v \
    test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_egru_layer.sv
vvp "$build_dir/test" +vectors="$build_dir/vectors.txt"
