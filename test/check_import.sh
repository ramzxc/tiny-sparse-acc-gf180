#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p test/output test/sim_build/import
python3 - <<'PYCODE'
from pathlib import Path
import json, subprocess
files = ['src/' + Path(f).name for f in json.loads(Path('test/rtl_import_sha256.json').read_text())]
models = sorted(str(p) for p in Path('test/models').glob('*.v'))
command = ['verilator', '--lint-only', '--timing', '-Wno-fatal', '--top-module',
           'tb_tt_um_tiny_sparse_acc_ramzxc', *files, *models,
           'test/qspi_nor_model.sv', 'test/tb_tt_um_tiny_sparse_acc_ramzxc.sv']
result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
Path('test/output/import_lint.log').write_text(result.stdout)
print(result.stdout)
if result.returncode:
    raise SystemExit(result.returncode)
command = ['verilator', '--binary', '--timing', '--assert', '-Wno-fatal', '-j', '2',
           '--top-module', 'tb_tt_um_tiny_sparse_acc_ramzxc',
           '--Mdir', 'test/sim_build/import', '-o', 'sim_import',
           *files, *models, 'test/qspi_nor_model.sv',
           'test/tb_tt_um_tiny_sparse_acc_ramzxc.sv']
with Path('test/output/import_build.log').open('w') as log:
    subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
result = subprocess.run(['test/sim_build/import/sim_import', '+uninit_sram'],
                        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True,
                        timeout=120)
Path('test/output/import_sim.log').write_text(result.stdout)
print(result.stdout)
if result.returncode or 'TT WRAPPER PASS' not in result.stdout:
    raise SystemExit('UART/QSPI integration test failed')
PYCODE
