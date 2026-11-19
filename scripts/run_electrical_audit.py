#!/usr/bin/env python3
"""Audit routed wrapper + core with assembled RC and explicit TT constraints.

A single core SPEF is intentionally labelled nominal RC, not nine-corner
signoff. Returns failure for electrical/timing/annotation errors. Board timing
and RC-model qualification remain separate acceptance requirements.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shlex
import subprocess
from assemble_spef import assemble


def tq(path):
    value = str(Path(path).resolve())
    if any(c in value for c in '{}\n'):
        raise ValueError('Unsupported Tcl filename')
    return '{' + value + '}'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--run', type=Path, required=True, help='Completed LibreLane run directory')
    p.add_argument('--core', type=Path, default=Path('macro/tiny_sparse_acc_core'))
    p.add_argument('--lib-dir', type=Path, required=True)
    p.add_argument('--sta-command', default='sta', help='Executable command, e.g. sta or a local launcher')
    p.add_argument('--output', type=Path, required=True)
    p.add_argument('--coupling', choices=['grounded', 'preserved'], default='grounded',
                   help='Grounded static approximation matches PT/OpenSTA; preserve original RC separately')
    p.add_argument('--core-rc', choices=['nom', 'min', 'max'], default='nom')
    p.add_argument('--core-spef', type=Path, help='SPEF actually extracted at --core-rc')
    a = p.parse_args()
    if a.core_rc != 'nom' and not a.core_spef:
        p.error('min/max require their own extracted --core-spef; no nominal fallback')
    def one(pattern):
        matches = list(a.run.glob(pattern))
        if len(matches) != 1:
            raise ValueError(f'Expected exactly one {pattern}, got {matches}')
        return matches[0]
    wrapper = one('*-openroad-fillinsertion/*.nl.v')
    wrapper_spef = one(f'*-openroad-rcx/{a.core_rc}/*.{a.core_rc}.spef')
    core_spef = a.core_spef or a.core / 'core.spef'
    a.output.mkdir(parents=True, exist_ok=True)
    merged = a.output / 'assembled.spef'
    graph = assemble(wrapper_spef, core_spef, 'core', merged)
    if a.coupling == 'grounded':
        merged = a.output / 'grounded.spef'
        graph = assemble(wrapper_spef, core_spef, 'core', merged, ground_coupling=True)
    results = {}
    for pvt in ['tt_025C_3v30', 'ff_n40C_3v60', 'ss_125C_3v00']:
        lib = a.lib_dir / f'gf180mcu_fd_sc_mcu7t5v0__{pvt}.lib'
        if not lib.is_file():
            raise FileNotFoundError(lib)
        out = a.output / pvt
        out.mkdir(exist_ok=True)
        script = f'''read_liberty {tq(lib)}
read_verilog {tq(a.core / 'core.v')}
read_verilog {tq(wrapper)}
link_design tt_um_tiny_sparse_acc_ramzxc
create_clock -name clk -period 100 [get_ports clk]
set_input_delay 20 -clock clk [get_ports {{ui_in[*] uio_in[*] ena rst_n}}]
set_output_delay 20 -clock clk [all_outputs]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN [get_ports {{ui_in[*] uio_in[*] ena rst_n}}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin ZN [get_ports clk]
set_load 0.07291 [all_outputs]
set_max_capacitance 0.2 [current_design]
set_max_transition 3 [current_design]
set_max_fanout 10 [current_design]
set_clock_uncertainty 0.25 [get_clocks clk]
set_timing_derate -early 0.95
set_timing_derate -late 1.05
set_propagated_clock [all_clocks]
read_spef {tq(merged)}
report_parasitic_annotation -report_unannotated > {tq(out / 'annotation.rpt')}
report_checks -path_delay max -group_path_count 20 -digits 6 -fields {{slew cap fanout}} > {tq(out / 'setup.rpt')}
report_checks -path_delay min -group_path_count 20 -digits 6 -fields {{slew cap fanout}} > {tq(out / 'hold.rpt')}
report_check_types -max_capacitance -max_slew -max_fanout -violators -digits 6 > {tq(out / 'electrical.rpt')}
report_worst_slack -max > {tq(out / 'setup_slack.rpt')}
report_worst_slack -min > {tq(out / 'hold_slack.rpt')}
puts AUDIT_COMPLETE
exit
'''
        (out / 'audit.tcl').write_text(script)
        proc = subprocess.run(shlex.split(a.sta_command) + [str((out / 'audit.tcl').resolve())],
                              text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        (out / 'console.log').write_text(proc.stdout)
        if proc.returncode or re.search(r'^Error:|Creating black box|not found', proc.stdout, re.M) or 'AUDIT_COMPLETE' not in proc.stdout:
            raise RuntimeError(f'STA failed, see {out / "console.log"}')
        annotation = (out / 'annotation.rpt').read_text()
        missing = [int(x) for x in re.findall(r'Found (\d+) (?:partially )?unannotated drivers', annotation)]
        if len(missing) != 2:
            raise RuntimeError('Unexpected annotation report; cannot declare coverage')
        electrical = (out / 'electrical.rpt').read_text()
        counts = {'max slew': 0, 'max fanout': 0, 'max capacitance': 0}
        for name, section in zip(re.findall(r'^max [a-z ]+$', electrical, re.M),
                                 re.split(r'^max [a-z ]+$', electrical, flags=re.M)[1:]):
            counts[name] = section.count('(VIOLATED)')
        if sum(counts.values()) != electrical.count('(VIOLATED)'):
            raise RuntimeError('Unrecognized electrical violation report')
        slacks = {}
        for kind in ['setup', 'hold']:
            m = re.search(r'worst slack (?:min|max)\s+(-?\d+(?:\.\d+)?)', (out / f'{kind}_slack.rpt').read_text())
            if not m:
                raise RuntimeError('Missing worst slack')
            slacks[kind + '_wns_ns'] = float(m[1])
        results[pvt] = dict(slacks, liberty_sha256=hashlib.sha256(lib.read_bytes()).hexdigest(), electrical_violations=counts, missing_drivers=sum(missing))
        results[pvt]['pass'] = not sum(missing) and not sum(counts.values()) and min(slacks.values()) >= 0
    summary = {
        'rc_corner': a.core_rc, 'rc_graph': graph,
        'scope': 'TT generic module-port constraints, three PVT corners, one explicit core RC model',
        'board_signoff': False, 'independent_min_max_rc_coverage': False,
        'core_netlist_sha256': hashlib.sha256((a.core / 'core.v').read_bytes()).hexdigest(),
        'results': results, 'pass': all(r['pass'] for r in results.values()),
    }
    (a.output / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps(summary, indent=2))
    return 0 if summary['pass'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
