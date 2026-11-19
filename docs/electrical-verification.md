# Electrical verification checkpoint

This is a verification-input repair, **not a clean electrical signoff**.
The routed core remains the physical implementation from commit `77303f2`;
no RTL, cell sizing, placement, clock tree, routing, GDS, or submitted macro
views were changed by this repair. The default Tiny Tapeout README is unchanged.

## What was corrected

1. **Hierarchical SPEF assembly.** `uio_oe[1]`, `[4]`, and `[5]` are connected
   inside the core but have three separate routed branches in the wrapper.
   Reading the wrapper SPEF and then `read_spef -path core` left two sinks
   partially unannotated. `scripts/assemble_spef.py` joins the RC graphs at
   each actual boundary terminal. It preserves distinct terminal junctions,
   every resistor, the OHM/KOHM conversion, grounded capacitance, and unique
   coupling edges. Mirrored coupling records are deduplicated; conflicting
   records or disconnected terminals are errors. External loads remain three
   distinct SDC loads. No physical short, buffer, or ideal wire was added.
2. **Explicit coupling interpretation.** The original coupled graph is retained
   as `assembled.spef`. For a reproducible static comparison the audit also
   writes `grounded.spef`, replacing each coupling capacitor by its full value
   to ground at each endpoint, including same-net coupling. This is a
   deliberately pessimistic grounded approximation, not SI/crosstalk signoff.
   OpenSTA and PrimeTime agree on the repaired output load with this model:
   **0.248119 pF**, versus the incorrectly stitched 0.218730 pF. With the
   preserved coupling model their reported loads differ (0.243409/0.247362 pF);
   do not mix those tool interpretations in a before/after comparison.
3. **Matching electrical limits.** Local `syn/cons/top.sdc` now includes the
   existing Tiny Tapeout 0.2 pF maximum capacitance. Local
   `pnr/export/export_core.tcl` explicitly appends max cap 0.2 pF, max fanout 10,
   and max transition 3 ns to exported SDC, because ICC2 export omitted fanout.
   These affect future implementation/export; they do not retroactively fix
   the existing physical core. `syn/` and `pnr/` remain intentionally ignored.
4. **Board constraints no longer silently use invented delays.** Local
   `syn/cons/board.sdc` requires a reviewed module-boundary timing budget.
   Missing budgets fail immediately. The profile includes minimum/maximum
   delays, receiver hold, and both possible SCK phases in separate runs. Its
   syntax was checked in PrimeTime with synthetic inputs; that test is **not**
   a measured board budget. It still needs real TT mux/pad/board data.
5. **QSPI tests use the current interface.** The older standalone bench had no
   `req_device` connection. Its address/device mapping now matches the RTL.
   `qspi_pin_timing.sv` checks CS setup/hold/recovery, transmitted data
   setup/hold, and a conservative 3 us PSRAM selected-time limit. Nominal and
   illustrative delayed traffic pass; deliberately invalid hold/CS-low
   waveforms correctly fail. Analog slew and real board skew are not modeled.
6. **Strict local audit.** `scripts/run_electrical_audit.py` checks all three
   TT/FF/SS cell corners, refuses missing cells or annotations, and returns
   failure for setup/hold/cap/slew/fanout violations. It labels the supplied
   core RC corner explicitly; it never substitutes nominal for requested
   min/max. This supplemental check is not yet wired into the GitHub flow.

## Reproduction

Use a completed LibreLane run, complete GF180 Liberty files, and OpenSTA:

```sh
python3 scripts/run_electrical_audit.py \
  --run /path/to/runs/wokwi \
  --lib-dir /path/to/complete/gf180/liberty \
  --sta-command 'sta -exit' \
  --output test/output/electrical
python3 -m unittest discover -s test -p test_assemble_spef.py
bash test/run_qspi_ctrl.sh
```

The current design is expected to return **exit code 1** from the electrical
check. That is a detected design violation, not a reason to relax the limits.
Artifacts from this repair are under `test/output/sta_repair/`, including
`final/summary.json`, all three corner reports, the original and assembled RC,
and independent PrimeTime validation. Seven RC assembly regressions pass.

## Still unresolved

- **Actual circuit violations:** max cap 8 and max fanout 15 at every PVT;
  SS also has 1013 max-slew violating pins and roughly -73.32 ns setup slack.
  TT/FF setup is about +13.45/+50.21 ns. The corrected analysis does not repair
  these physical violations. The next implementation stage needs real
  buffering/sizing/clock-tree changes and a fresh all-corner evaluation.
- **RC corner coverage has now been completed for the public PDK models.**
  See the nine-case results below. This does not remove the detected circuit
  violations, and does not turn public engineering models into a foundry
  qualification certificate.
- **Actual board qualification is still incomplete.** GF26c routed mux/pad
  timing is now available and was analyzed below. Package/PCB parasitics,
  memory-loaded analog edges, minimum-path skew and the delivered board
  revision still need qualification. A digital delay test is not that proof.
- **Power-up assumptions:** the official Tiny Tapeout guide says store-bought
  Pmods already have Flash Quad Enable configured. That resolves the normal
  factory-Flash QE prerequisite, but does not initialize volatile PSRAM QPI
  state after a power cycle. Existing RTL still requires PSRAM QPI preparation
  and an erased/unprotected Flash target for programming. Verify that handoff
  before treating the complete system as ready.
- **Analog coverage:** neither grounded SPEF nor digital timing assertions
  establish crosstalk, package-pin edge rate, or EM/IR signoff of the complete
  shuttle and external board.

No implementation or GitHub pass claim should be made from this checkpoint.
No push was made as part of this repair.

## External references

- [Official QSPI Pmod](https://store.tinytapeout.com/products/QSPI-Pmod-p716541602):
  Flash W25Q128JV family and two APS6404L-3SQR PSRAMs.
- [Pmod schematic and revisions](https://github.com/mole99/qspi-pmod): also
  documents an optional SCK delay capacitor; its population/jumper state must
  not be silently assumed.
- [AP Memory APS6404L datasheet](https://www.apmemory.com/en/downloadFiles/032411212009597427):
  Rev 2.7, January 2024; PSRAM timing reference.
- [Tiny Tapeout Flash preparation guide](https://www.tinytapeout.com/guides/configure-flash-qspi-pmod/).

Flash timing monitors use conservative reference thresholds, but final timing
must be reconciled with the actual W25Q128JV ordering code and datasheet
revision. The older downloaded Rev F datasheet is not silently treated as the
latest production specification.

## Follow-up: extraction coverage investigation

The imported OpenDB reports its wires connected, but the OpenRCX SPEF has
923 nets whose explicit resistor graphs do not reach every terminal. Wire
ordering was repeated with the ordered flag cleared; it did not resolve the
problem. The database contains 1,971 `SHORT` path records, used to represent
connections through overlapping conductors or terminals. For example, the
clock has a Metal2 path ending at (248.080, 112.000) um and a via at
(248.080, 111.720) um joined by such a record. This is a representation problem
to investigate; it is not evidence that all these physical nets are open.
No guessed resistance, artificial metal, or ignored annotation was accepted.
Evidence is under `test/output/rc_corner_repair/`.

The public [TT GPIO timing page](https://tinytapeout.com/specs/gpio/) describes
SKY130 pads and measurements on an older die. Its 20 ns round-trip observation
is not a GF180 TTGF26c PVT bound and is not copied into this design's board SDC.
A direct Pmod connection is the intended configuration; the GF180 shuttle path
still needs a suitable timing bound or physical characterization.

### Current-core StarRC cross-check completed

Fresh extraction of export `20261119_160122_1795071682898338` succeeded with
`SUPPORT_DIFFERENT_PORTNAME_NETNAME: YES` and `SHORT_PINS: NO`. The defaults
otherwise merge separate contacts/names on a shared net. All 43 signal ports
are retained with these settings; no post-extraction port rewriting is needed.
The SPEF assembler now also gives internal numeric RC nodes names under their
joined logical net, preserving unused-port RC emitted on DEF dummy nets.

A signal-extraction-only standard-cell LEF omits well-only VNW/VPW terminals
and the Nwell/Pwell portions of the two physical cell PG pins. All metal/via
and signal-pin geometry remains. Submitted LEF/GDS/LVS files are unchanged.
This is an interconnect RC comparison, not substrate extraction or LVS.

`sta/starrc/prepare_current.py` prepares the inputs reproducibly from an export
and an explicitly supplied NXTGRD. It refuses an existing output directory and
records input hashes. Both this script and the local EDA workspace remain
ignored by Git as requested.

| Nominal RC, same three cell corners | ICC2 RC | Fresh StarRC RC |
|---|---:|---:|
| TT setup slack (ns) | +13.45 | +12.68 |
| FF setup slack (ns) | +50.21 | +49.77 |
| SS setup slack (ns) | -73.32 | -74.80 |
| Partially/unannotated active drivers | 0 | 0 |
| Cap violations per corner | 8 | 8 |
| Fanout violations per corner | 15 | 15 |
| SS slew violations | 1,013 | 1,037 |

All 1,570 native core net names matched. Matched wire capacitance increased
3.459%; StarRC additionally reports twelve unused-input dummy nets. The
circuit violations therefore reproduce with a second extraction tool and the
current layout. They are not explained away by the old extraction snapshot.
See `test/output/rc_corner_repair/starrc/{comparison.json,audit/summary.json}`.

**Decision:** the verified nominal RCs are sufficient to begin diagnosing and
repairing the known circuit violations. They are not a substitute for min/max
process RC or GF180 board-path limits when claiming final operating coverage.
The nominal NXTGRD uses the same engineering process model as the ICC2 TLUPlus;
this check validates extraction/assembly, not independent process qualification.
OpenRCX min/max extraction remains rejected until its topology issue is solved.
No arbitrary R/C factors, fabricated links, or relaxed constraints were used.

## Completed RC-corner investigation (2026-11-19)

The current core was extracted with the pinned Ciel PDK
`54435919abffb937387ec956209f9cf5fd2dfbee`, using **each corner's own techLEF
resistance and OpenRCX rule file**. Merely changing the RCX filename while
retaining nominal LEF resistance would not have supplied full corner coverage.

ICC2 DEF has legitimate touching metal and special-width patch shapes. The
OpenDB wire-ordering/OpenRCX path lost explicit SHORT edges and some
edge-contact connections. The extraction-only normalization inserts centerline
representations **inside existing metal**, then restores explicit same-net
OpenDB SHORT connections and identical-coordinate junctions in the RC graph.
It does not add any GDS metal or connect different logical nets. KLayout checked
all **488 normalization rectangles against the submitted core GDS: 0 uncovered**.
All three corners use identical normalization. Original extracted resistor and
capacitor values are retained; restored ideal junctions add only zero-ohm edges.
No detached resistor components, disconnected terminals or unannotated drivers
remain. These are model-import repairs, not an implementation ECO.

| RC | Cell PVT | Setup slack ns | Hold slack ns | Cap violations | Slew violations | Fanout violations |
|---|---|---:|---:|---:|---:|---:|
| min | TT | 16.82 | 0.58 | 3 | 0 | 15 |
| min | FF | 52.22 | 0.21 | 3 | 0 | 15 |
| min | SS | -66.99 | 1.45 | 4 | 813 | 15 |
| nom | TT | 14.57 | 0.58 | 8 | 0 | 15 |
| nom | FF | 50.86 | 0.22 | 8 | 0 | 15 |
| nom | SS | -71.11 | 1.46 | 8 | 945 | 15 |
| max | TT | 11.67 | 0.59 | 8 | 14 | 15 |
| max | FF | 49.12 | 0.22 | 8 | 0 | 15 |
| max | SS | -76.47 | 1.47 | 8 | 1087 | 15 |

TT = 25 C / 3.30 V; FF = -40 C / 3.60 V; SS = 125 C / 3.00 V.
All cases use the same 10 MHz module constraints and grounded coupling policy.
Nominal extraction cross-check: ICC2 / StarRC / OpenRCX TT setup slack is
13.45 / 12.68 / 14.57 ns, and SS is -73.32 / -74.80 / -71.11 ns. StarRC was
rerun on the **current** DEF with `SUPPORT_DIFFERENT_PORTNAME_NETNAME: YES`
and `SHORT_PINS: NO`; no stale-layout comparison or alias rewrite was used.
The three tools agree that SS setup is failing. StarRC and ICC2 share the
nominal engineering ITF, so their agreement is not independent foundry model
qualification.

Local evidence (intentionally ignored build artifacts):

- `test/output/signoff_completion/coverage.json`: nine cases and input hashes.
- `test/output/signoff_completion/geometry_check.json`: GDS containment check.
- `test/output/signoff_completion/{min,max}/audit/`: six corner reports.
- `test/output/signoff_completion/nom_audit/`: three nominal-RC reports.
- `test/output/rc_corner_repair/starrc/`: current-layout independent-tool run.
- `test/output/signoff_completion/run_corners.py`: local extraction replay.

## Actual GF26c external-path evidence

Source: [GF26c build 44502983067](https://github.com/TinyTapeout/tinytapeout-gf-26c/actions/runs/44502983067),
commit `de1d31ca69a1b1ea6a927e9fd64db55b84583ffc`, GDS artifact `14519733137`.
This is a routed shuttle snapshot, **not a guarantee for the eventual delivered
shuttle/board**. Its pinned mux revision is
`aab1e278ef8e10eaa78b30369438c86107d02a8b`.

The [actual GPIO configuration](https://github.com/TinyTapeout/tt-multiplexer/blob/aab1e278ef8e10eaa78b30369438c86107d02a8b/ol2/tt_top/tt_gf_wrapper.v)
uses `gf180mcu_ocd_io__bi_24t`, 24 mA drive, fast slew for user bidirectional
pins. This is not the older SKY130 pad or a generic GF180 4 mA pad.
The [shuttle SDC](https://github.com/TinyTapeout/tt-multiplexer/blob/aab1e278ef8e10eaa78b30369438c86107d02a8b/ol2/tt_top/signoff.sdc)
assumes 30 pF output load and 2 ns input transition, and targets 5 ns inward /
12.5 ns outward. The actual reports **do not meet those target delays at SS**:

| RC/PVT snapshot | Worst inward ns | Worst outward ns |
|---|---:|---:|
| min/FF | 3.880138 | 5.848889 |
| nom/TT | 5.928331 | 9.897305 |
| max/SS | 11.655940 | 19.603041 |

These are maxima across the reported user-I/O path groups, not the minimum
input/output delays. In particular min/FF above must **not** be used as a hold
bound. The official `min.rpt` reports control-clock hold paths; it does not
supply a complete minimum-delay QSPI path/skew budget.

The indicative worst outbound + 6 ns memory tCO + inbound sum is 37.258981 ns,
before board flight/skew and core timing. This is below the nominal 100 ns
half-SCK period, but is **not** a complete setup/hold or analog signoff.
`test/run_qspi_ctrl.sh` additionally tests independent 0..22 ns clock/data/CS/OE
skew endpoints with a 20 ns return delay. The extra board allowance is an
explicit stress-test assumption; it is not a measured PCB bound. All included
traffic and negative timing-monitor checks pass.

A real remaining limitation is electrical loading: APS6404L Rev2.7 specifies
its output AC behavior at a 15 pF system load. Its package output capacitance
is up to 8 pF; the Flash output capacitance is up to 8 pF. A read from one
PSRAM sees the other PSRAM, Flash, chip input and PCB. A conservative sum of
just the two inactive memory pins already reaches 16 pF, before chip/PCB.
This does not prove the Pmod will fail at 5 MHz, but the 5.5 ns PSRAM tCO
specification cannot be blindly carried into that load. A suitable memory
I/O model or a measured, bounded waveform is needed. PSRAM also specifies a
1.5 ns 20–80% SCK edge; GF180 Liberty uses 10–90% slew, so direct numeric
comparison or an assumed conversion factor would be invalid.

Consequently the missing mux/pad evidence is filled, the digital robustness
tests are stronger, and all nine RC/PVT cases are executed. **The actual board
is not yet electrically qualified, and the core is not all-corner clean.**
No production GDS/RTL changes or push were made in this investigation.

## Step 1: SS critical-path diagnosis

Analysis only: no RTL, synthesis, floorplan, placement, CTS, routing, constraints,
GDS or CI changes were made during this step. Input is the max-RC / SS
`ss_125C_3v00` annotated netlist from the nine-corner audit above.
Raw Tcl and reports: `test/output/ss_path_diagnosis/`.

### Dominant path

`core/exec/lanes_0__weight_reg_reg_4_/Q` to
`core/exec/data_out_reg_4_/D` has -76.466316 ns setup slack.
It passes through **115 combinational cell arcs**. Of these, 113 use drive
suffix `_1`, and two use `_2`. The path is FP8 arithmetic followed by the
activation output logic, not an external memory or UART round-trip.

| Component | ns |
|---|---:|
| Launch clock insertion | 2.376207 |
| Clock-to-Q | 3.062748 |
| Combinational cell arcs | 172.087765 |
| Explicit interconnect delay | 0.145543 |
| Total arrival time | 177.672272 |
| Required arrival time (setup/skew/uncertainty included) | 101.205948 |

**Cell delay includes the effect of wire capacitance and input slew.** The
small explicit wire-delay number must not be read as proof that routing has
no effect. A separate diagnostic retained the mapped cells, pin capacitances,
external loads and constraints, but omitted SPEF entirely. Even this optimistic
pin-load-only model failed with **-36.554127 ns**. This is an explanatory
counterfactual, not a valid signoff result or an achievable routing target.
It shows that removing wire parasitics alone cannot rescue the current mapped
netlist. Resizing/remapping can still change the cell delays substantially;
no upper bound on the benefit of a new synthesis was established here.

The worst path's maximum net load is 0.091690 pF, below the 0.2 pF limit.
It contains 12 output pins exceeding the 3 ns slew limit and one fanout
violation: `exec/HFSBUF_1639_14/Z`, fanout 12. None of the eight max-cap
violating drivers lies on this data path. The launch/capture clock insertion
values are approximately 2.376/2.147 ns; clock skew is not a 76 ns problem.

### Supported instruction modes

For diagnosis only, all six `exec_inst_in` bits were fixed to each supported
operation/activation combination using case analysis, then the data-out
register paths were reported. These fixed-mode checks do not replace the
unrestricted analysis: instruction transitions also require timing closure.

| Mode | No activation | ReLU | TANH | SIGMOID | STEP |
|---|---:|---:|---:|---:|---:|
| ADD | +9.719 | +9.150 | +9.150 | -7.229 | +8.119 |
| SUB | +9.719 | +9.150 | +9.150 | -7.229 | +8.119 |
| MUL, overwrite | +4.799 | -3.506 | +4.799 | -11.802 | +2.483 |
| MUL, accumulate | -59.048 | -59.629 | -59.629 | -75.996 | -60.647 |

Values are worst setup slack in ns at SS/max RC. A supported
MUL+accumulate+SIGMOID combination still fails by nearly 76 ns; restricting
reserved opcodes is not a solution. FP8 multiplication is rounded/packed
before FP8 accumulation, and sigmoid adds another FP8 arithmetic operation
(`x/4 + 0.5`) plus clamping. The accumulator-register endpoint itself already
fails by -54.844 ns in unrestricted analysis, so activation is not the only
problem. See `src/rtl/core/exec_unit.v` and `src/rtl/defs/fp8_math.vh`.

Unrestricted worst register-D endpoint slack outside `exec`: data +67.472 ns,
serial_memory +77.585 ns, receiver +78.702 ns, transmitter +81.146 ns,
fifo +76.669 ns. Worst top-level output slack is +51.729 ns under the generic
TT I/O budget. These do not establish real-board interface timing.

### Electrical violations are a separate repair track

- Five clock-leaf buffers have capacitance 0.212850..0.253881 pF and fanout
  37..45. The audit limit is 0.2 pF / fanout 10. CTS distribution needs repair.
- Reset-distribution `HFSBUF_464_17` and `HFSINV_976_15` have 0.230025 and
  0.229149 pF loads. Buffering/fanout distribution needs repair.
- `serial_memory/HFSBUF_12_4/Z` drives the aliased output-enable ports and has
  0.253459 pF load. The three external SDC loads alone total 0.218730 pF,
  already over 0.2 pF. Merely shortening wires or upsizing this one driver
  cannot satisfy that global capacitance limit. This needs an explicit
  interface/driver-distribution decision, not hidden constraint relaxation.
- The 1,087 slew violations are **reported pins, not 1,087 independent nets**.
  Mapping the internal violating pins gives 214 distinct net objects;
  560 reported violating pins are under `exec`. Loads and drivers can both
  report the same slow signal.

The implementation flow currently defaults to a TT target DB in
`syn/script/synth.tcl`, while `rebuild/pnr/flow.tcl` explicitly uses 25 C / 3.3 V
and nominal early/late RC. Finished PNR reports show one `default` scenario.
This is consistent with an implementation optimized for nominal conditions,
not simultaneous SS-setup/FF-hold closure.

Recommended next step: inspect and prepare SS/FF MCMM constraints, then assess
SS-aware synthesis/remapping at unchanged 10 MHz and unchanged architecture
before spending time on full PNR. Measure its timing and area. If that cannot
fit/meet timing, discuss cycle/architecture or frequency changes explicitly;
do not insert a multicycle exception or false path to conceal this failure.

## SS-aware synthesis comparison (2026-11-19)

Completed synthesis only, keeping RTL, ISA, cycle counts and the 100 ns clock
unchanged. No PNR, production macro replacement or push was performed.

- TT baseline: `syn/runs/20261119_210836_553610`.
- SS candidate: `syn/runs/20261119_210827_553543`.
- SS synthesis uses SS/125 C/3.0 V as maximum library and FF/-40 C/3.6 V
  as minimum library, with BC/WC operating conditions. This is synthesis
  corner pairing, **not a completed ICC2 MCMM implementation**.
- Reproduce candidate with `bash syn/run_ss.sh`. It does not replace
  `syn/LATEST`; synthesis now writes a dedicated `synthesis.svf`.

| Metric | TT-mapped baseline | SS-mapped candidate |
|---|---:|---:|
| Total mapped cell area (um2) | 34269.27 | 38055.99 |
| Exec cell area (um2) | 12354.59 | 15882.27 |
| SS setup slack (ns) | -39.91 | +0.01 |
| TT setup slack (ns) | +30.73 | +49.82 |
| FF hold slack (ns) | +0.18 | +0.18 |

Area rises by 3786.72 um2 (11.05%); exec accounts for 3527.69 um2 of the
increase. Timing values above are independent OpenSTA checks with matching
constraints and correct PVT libraries, ideal clocks and **no SPEF**. They
must not be compared as equal-condition results against the older routed
SS/max-RC slack of -76.47 ns. Evidence and replay script are in
`test/output/ss_synthesis/prelayout_sta.json` and `evaluate.py`.

Formality passed for the SS candidate against RTL:
`sta/formality/runs/20261119_211052_554399`, with `FORMALITY_PASS` in
`test/output/ss_synthesis/formality.log`.

The candidate's +0.01 ns prelayout slack provides essentially no routing
margin. This experiment demonstrates remapping benefit, not timing closure
or tapeout readiness. CTS, extracted min/max RC, electrical constraints and
external-board timing still require their own implementation/verification.
Do not label nominal ICC2 TLUPlus as min/max RC; public OpenRCX rule files
are not interchangeable with ICC2 TLUPlus input.

## SS implementation trial (2026-11-19)

Ran the SS-mapped candidate through a separate ICC2 implementation using the
existing 325.92 x 145.04 um boundary, PG, taps, CTS and Metal1..3 signal routing.
The experimental script is `pnr/experiments/ss/flow.tcl`; launch with
`bash pnr/experiments/ss/run.sh`. It never exports/replaces the submission macro
or updates production LATEST pointers. Implementation uses SS/125 C/3.0 V with
nominal TLUPlus, not min/max RC or simultaneous MCMM signoff.

Evidence: `pnr/experiments/ss/runs/20261119_211603_555001/`.

- Initial core utilization: 86.90%.
- Placement legality check passed.
- CTS completed; worst SS setup slack at the CTS stage: -29.59 ns
  (not a final routed timing result).
- Route-auto connectivity/DRC check: 1737 DRCs.
- After route-opt: 1655 DRCs (`reports/repair0_routes.rpt`).
- After first incremental repair: 767 DRCs (`reports/repair1_routes.rpt`).
- Stopped the second incremental-repair attempt after more than 20 minutes
  total runtime, with residual congestion/DRCs. Exit 143 is deliberate
  termination, not a tool-reported final PNR failure. This is NOT a clean
  completed PNR result; final TT/SS/FF timing was not produced.

Existing production GDS and RTL remain unchanged. For room-temperature
research, relaxing the requirement to close SS/125 C is a scope decision,
not evidence that +0.01 ns prelayout slack guarantees silicon operation.
Process variation still exists at room temperature. Physical shorts/opens and
capacitance/slew constraints must be handled separately from the temperature
range. Prefer retaining the previously routed baseline while targeting its
specific electrical violations, rather than adopting this congested candidate.

## Implementation baseline decision (2026-11-19)

User selected a return to TT implementation for room-temperature research.
The SS implementation trial is retained only as an experiment and is inactive.
No SS netlist or GDS was promoted, so no production macro rollback is needed.
Default synthesis remains TT/25 C/3.3 V, and the regular PNR flow remains
25 C/3.3 V at 100 ns (10 MHz). Existing production macro files are unchanged.
`syn/LATEST` remains `syn/runs/20261117_162157_304799`; the original PNR pointer
remains `rebuild/pnr/runs/original/20261119_155725_463851`.
Keep SS/FF verification results as limitations, not implementation targets.
This decision does not waive physical DRC/LVS or electrical-cap/slew checks,
and no new synthesis, PNR, or push was run to enact it.

## TT electrical repair candidate (2026-11-19)

Found the implementation root cause: ICC2 emits CSTR-011 and ignores SDC
`set_max_fanout`. The original CTS default allowed 37..45 loads per clock leaf.
Set ICC2 `opt.common.max_fanout` and `cts.common.max_fanout` to 8; use 0.16 pF /
2.5 ns implementation margins while retaining 0.2 pF / 3 ns / fanout 10 for
independent acceptance. Added separate buf_4 drivers for uio_oe[1,4,5], preserving
the logical interface while separating three external loads.

The first trial accidentally followed stale `syn/LATEST` (20261117); it is
excluded from all candidate results. Correct implementation input is
`rebuild/syn/runs/original/20261118_233754_372413`, explicitly recorded in the
production PNR log. All RTL/defs input hashes match the current source; the SDC
has since changed as intended. `syn/LATEST` now points to this actual baseline.
This corrects the pointer interpretation in the earlier baseline-decision note.

Correct TT PNR: `pnr/experiments/tt_electrical/runs/20261119_215130_573345`.
One remaining slow driver, exec/U212, was repaired by adding an output buf_4.
Upsizing U212 to _4 was rejected because it moved excessive load upstream.
Final candidate: `pnr/experiments/tt_electrical/runs/slew_20261119_220419_578718`.
Export: `pnr/exports/20261119_220514_1795093514192231`.
Candidate hashes/pointers: `pnr/ELECTRICAL_CANDIDATE.json`.

ICC2 final checks: routing DRC 0, opens 0, antenna violations 0; legality passes.
These are implementation checks, not rerun Magic/KLayout DRC or extracted LVS.
Formality verifies the candidate against the original mapped netlist.

Independent audit: `test/output/tt_electrical_buffer/*/audit_flat/`.
The STA-only netlist was flattened by Yosys (no synthesis optimization) because
OpenSTA's hierarchical alias handling left two active instruction-bit nets
unannotated. Renaming SPEF NAME_MAP entries alone did not fix it and is NOT used.
After flattening, the only 12 unannotated drivers are unused external inputs;
no partially unannotated drivers remain. Physical GDS hierarchy is unchanged.
Public OpenRCX min/nom/max use matching tech LEFs and extraction rules. All
geometry-normalization rectangles are covered by actual GDS metal; short-link
restoration has zero disconnected nets and preserves extracted R/C values.

| RC model | TT setup / hold (ns) | TT electrical violations | FF setup / hold (ns) | FF electrical violations |
|---|---:|---:|---:|---:|
| ICC2 nominal | +14.94 / +0.34 | 0 | +51.02 / +0.06 | 0 |
| OpenRCX min | +17.77 / +0.36 | 0 | +52.75 / +0.07 | 0 |
| OpenRCX nom | +15.86 / +0.35 | 0 | +51.55 / +0.06 | 0 |
| OpenRCX max | +13.34 / +0.33 | 0 | +50.03 / +0.05 | 0 |

Electrical counts include cap, slew and fanout, with unchanged generic TT I/O
loads/delays at 10 MHz. These are core checks; new wrapper routing has not been
included. SS/125 C remains outside the chosen operating target: OpenRCX max
setup -73.11 ns, hold +1.02 ns, 674 reported electrical violating pins.
Do not describe this as all-PVT or real-board signoff.

Reusable preparation is in `pnr/core/prepare_electrical.tcl`; regular comparison
PNR and run_wider call it before placement, and prepare_cts sets the CTS fanout
limit explicitly. The final slew repair script is candidate-specific and
asserts its expected cell identity. Production macro files are NOT replaced,
and no push was performed. Wrapper re-integration plus full GDS DRC/LVS remain
necessary before promoting this export for submission.

## Fresh wrapper integration verified (2026-11-19)

The repaired core export `20261119_220514_1795093514192231` is packaged in
`test/output/tt_electrical_integration/macro`. The **final** candidate is
`test/output/tt_electrical_integration/final/wrapper_core.gds`, with machine-readable
results and its SHA256 in `final/results.json`. Production macro files remain
unchanged; nothing was pushed.

Wrapper synthesis input, die, pins and macro placement were retained. PDN uses
LibreLane's unmodified default configuration Tcl, trimming enabled, with normal
wrapper tap/endcap insertion. Fresh OpenROAD routing completed in approximately
15 minutes with zero routing DRCs and both power nets connected. An interim
candidate reusing the prior wrapper routes also passed checks, but is superseded
by this freshly routed final candidate. No manual routing ECO was needed.

Full integrated GDS checks: Magic DRC 0; KLayout GF180D FEOL/BEOL/connectivity/
off-grid DRC 0; KLayout antenna 0; extracted Netgen LVS matches, including the
core hierarchy. Core polygons in the merged GDS exactly match the packaged
candidate; exported Metal4 power-pin shapes are covered by real GDS metal;
there are no Metal5 polygons. Optional density checks were not enabled.

The wrapper RC was freshly extracted at min/nom/max and assembled with the
corresponding new-core RC model, retaining boundary resistive branches and R/C
values. Unused macro pins are represented as numeric RC junctions, preventing
OpenSTA from looking up removed hierarchical terminals. Eight RC-assembly unit
tests pass. The STA-only combined netlist is flattened; GDS is not flattened.
All three TT analyses report zero unannotated or partially annotated drivers.

| TT / 25 C / 3.3 V, 10 MHz | Setup slack ns | Hold slack ns | Cap / slew / fanout violations |
|---|---:|---:|---:|
| min RC | +17.77 | +0.36 | 0 / 0 / 0 |
| nominal RC | +15.86 | +0.35 | 0 / 0 / 0 |
| max RC | +13.34 | +0.33 | 0 / 0 / 0 |

Acceptance remains 0.2 pF, 3 ns, fanout 10, with generic 20 ns I/O delays and
0.07291 pF output loads. Coupling capacitance is grounded explicitly; this is
not crosstalk/SI signoff or actual-board characterization. SS is outside the
selected implementation target, not silently classified as passing.

Five functional GL tests pass on the fresh routed wrapper and new powered core:
memory/compute roundtrip, sparse/snapshot, interrupted UART/QSPI reset,
queued commands with stalled memory, and scalar sparse CUR. The new mapped
reset cones require eight X-pessimism corrections, each exhaustively proved
constant during reset, recorded in `gl/reset_proof.json`. No flop Q or normal
operation value is forced. Tests use functional cell models with unit delays,
not SDF annotation; see `gl_fresh.log`. The existing production reset helper has
not been replaced with these candidate-specific nets.

This completes the pending local wrapper integration checks. It does not claim
fresh full Tiny Tapeout precheck, GitHub Actions, SDF simulation, physical-board
qualification, or all-PVT signoff. Those remain distinct from the passing checks
above and must not be described as guaranteed silicon operation.
