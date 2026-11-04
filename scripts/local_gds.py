"""Local LibreLane run using the TT configuration, without GitHub publishing."""
import json
import os
from pathlib import Path
import subprocess
import sys

import yaml

root, tt_dir, pdk_root, run_id, log_dir = sys.argv[1:]
root, tt_dir, log_dir = Path(root), Path(tt_dir), Path(log_dir)
os.chdir(root)
sys.path.insert(0, str(tt_dir))
from project_checks import check_project_docs
from tech import GF180MCUDTech

check_project_docs(str(root), 'gf180mcuD')
info = yaml.safe_load((root / 'info.yaml').read_text())['project']
tech = GF180MCUDTech()
sizes = yaml.safe_load((tt_dir / 'tech/gf180mcuD/tile_sizes.yaml').read_text())
# Match TT create_user_config; use an absolute local DEF path for this run only.
user = {
    'DESIGN_NAME': info['top_module'],
    'VERILOG_FILES': ['dir::' + name for name in info['source_files']],
    'DIE_AREA': sizes[info['tiles']],
    'FP_DEF_TEMPLATE': str(tt_dir / f"tech/gf180mcuD/def/tt_block_{info['tiles']}_{tech.def_suffix}.def"),
    'VDD_PIN': 'VPWR', 'GND_PIN': 'VGND',
    'RT_MAX_LAYER': tech.project_top_metal_layer,
}
user.update(tech.librelane_config)
merged = json.loads((root / 'src/config.json').read_text())
merged.update(user)
# These files are already gitignored by the template.
(root / 'src/user_config.json').write_text(json.dumps(user, indent=2) + '\n')
(root / 'src/config_merged.json').write_text(json.dumps(merged, indent=2) + '\n')
command = ['librelane', '--pdk', 'gf180mcuD', '--pdk-root', pdk_root,
           '--run-tag', run_id, '--jobs', os.environ.get('TT_JOBS', '4'),
           'src/config_merged.json']
(log_dir / 'command.json').write_text(json.dumps(command, indent=2) + '\n')
print('Starting GDS build. First run may download the PDK.', flush=True)
result = subprocess.run(command)
if result.returncode:
    raise SystemExit(result.returncode)
print('LibreLane completed. This does not run TT precheck or gate-level tests.', flush=True)
