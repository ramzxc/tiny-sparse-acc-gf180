#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
python3 test/test_exec.py
python3 test/test_qspi.py
build_dir=$(mktemp -d /tmp/tt-rebuild-tests.XXXXXX)
trap 'rm -rf "$build_dir"' EXIT
sources=()
while IFS= read -r line; do sources+=("src/$line"); done < src/sources.f
iverilog -g2012 -I src/rtl -I src/rtl/core -s tb_rebuild -o "$build_dir/integration" "${sources[@]}" test/tb_rebuild.sv test/qspi_psram_model.sv test/qspi_nor_model.sv
vvp "$build_dir/integration"
for width in 2 3 4 8; do
  iverilog -g2012 -DCOMPUTE_WIDTH="$width" -I src/rtl -I src/rtl/core -s tb_vector -o "$build_dir/vector_$width" "${sources[@]}" test/tb_vector.sv test/qspi_psram_model.sv test/qspi_nor_model.sv
  vvp "$build_dir/vector_$width"
done
