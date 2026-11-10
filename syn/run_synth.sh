#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
export TT_SYN_VARIANT="${TT_SYN_VARIANT:-micro}"
case "${1:-}" in
    --check) export TT_SYN_CHECK=1 ;;
    micro|direct) export TT_SYN_VARIANT="$1" ;;
    "") ;;
    *) echo 'Usage: bash syn/run_synth.sh [--check|micro|direct]' >&2; exit 2 ;;
esac
if [[ "${TT_SYN_CHECK:-0}" == 1 ]]; then
    exec tclsh "$ROOT/syn/script/synth.tcl"
fi
export TT_SYN_RUN="$(date +%Y%m%d_%H%M%S)_$$"
RUN_DIR="$ROOT/syn/runs/$TT_SYN_VARIANT/$TT_SYN_RUN"
mkdir -p "$RUN_DIR"
cd "$RUN_DIR"
echo "Variant: $TT_SYN_VARIANT; results: $RUN_DIR"
"${DC_SHELL:-dc_shell}" -f "$ROOT/syn/script/synth.tcl" 2>&1 | tee dc.log
grep -q '^TT_SYNTHESIS_COMPLETE ' dc.log
echo "Module areas: $RUN_DIR/reports/module_area.csv"
