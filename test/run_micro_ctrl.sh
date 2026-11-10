#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
build_dir=$(mktemp -d /tmp/micro-ctrl-test.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
python3 test/generate_matvec_vectors.py "$build_dir/vectors.txt"
core_sources=(src/core/micro_ctrl.v test/micro_core_fixture.sv src/core/decoder.v
    src/core/mem_ctrl.v src/core/vpu.v src/core/act.v)
iverilog -g2012 -I src -I src/core -s tb_micro_ctrl -o "$build_dir/test" \
    "${core_sources[@]}" src/mem_itf.v src/qspi_ctrl.v \
    test/qspi_psram_model.sv test/qspi_nor_model.sv test/tb_micro_ctrl.sv
vvp "$build_dir/test" +vectors="$build_dir/vectors.txt" +require_overlap
vvp "$build_dir/test" +vectors="$build_dir/vectors.txt" +require_overlap +no_stalls
verilator --lint-only -Wall -I./src -I./src/core --top-module micro_core_fixture "${core_sources[@]}"
