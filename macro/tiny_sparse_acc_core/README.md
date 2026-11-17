# ICC2 hard macro

The current main build uses the ICC2 core as a fixed macro inside the
Tiny Tapeout 1x1 wrapper. The RTL tests still use the original RTL; the GDS and
gate-level jobs use the packaged core. No synthesis or PnR was run to package it.

Source export: `20261117_175536_1794905736922050`. Source hashes and the exact
packaging transformations are in `provenance.json`; reproduce with
`python scripts/package_icc2_macro.py /path/to/export` (requires gdstk).

This FP8 E4M3FN core uses one lane and the existing 10 MHz constraints
in the widened 339.92 x 141.12 um floorplan. ICC2 reports zero route DRC/open nets,
zero PG connectivity/DRC errors, and positive setup slack at the nominal corner.
The previous export's external DRC/LVS results do not certify this new layout;
full wrapper integration and signoff are being tested in Actions.

The macro is 339.92 x 141.12 um, at (3.36, 3.92), orientation N. Its existing
Metal4 VPWR/VGND terminals align with the parent grid. `src/tcl/pdn.tcl` adds
same-layer feeds overlapping those terminals by 1 um. It defines only the
wrapper standard-cell grid, with nine VPWR/VGND feed pairs; the default Metal4--Metal5 macro grid is omitted
because the macro already has its own power network and Metal4 terminals. No signoff checks are
suppressed specifically for this experiment.

Two Metal3 buses above the macro (VPWR y=147.40 um, VGND y=150.90 um)
join all nine macro-aligned Metal4 stripe pairs. PDN generation inserts Metal3--Metal4 vias at same-net
crossings; opposite supplies cross on separate layers without a via.
Their ends remain inside the wrapper core bounds (x=3.36..343.28 um),
covering all nine stripe pairs without touching the tile boundary. This
prevents Magic LEF export from creating extra Metal3 power ports at the edges.

External supply pins describe nine full-height Metal4 stripes per supply
(1.6 um wide, y=3.62..157.10 um), rather than promoting short upper fragments.
All nine pairs are covered by the core GDS stripes and wrapper feeds. This preserves
access for the shuttle grid and the TT precheck requirement that every power
pin be on Metal4, at least 0.8 um wide, and within 10 um of both tile edges.

The SPEF contains only nominal 25C RC. It is reused across the flow's corners
for this integration experiment; this is not multi-corner RC signoff.
The original export's unused VDD/VSS alias ports had no LEF geometry. The
packaging script removes these aliases and connects the existing VPWR/VGND
ports directly, without modifying physical geometry.
Packaging also adds the missing GF180 PR_bndry rectangle on GDS layer 0/0,
using the LEF size (339.92 x 141.12 um). This boundary marker is required by
Magic macro streamout; device and routing geometry remain unchanged.
GDS database precision is normalized from ICC2's 0.1 nm to the streamout
merger's 1 nm. Packaging checks all polygon/path edges, instance placements,
array offsets and label positions first and fails if rounding would occur.
For Magic LEF compatibility, Manhattan obstruction polygons are decomposed
into rectangles with an exact geometric XOR check. Pin access and routing
obstructions are preserved. The redundant ICC2 OVERLAP placement outline
and its layer declaration are removed after checking against LEF SIZE.
The continuous Metal4 supply stripes are exposed as full-height LEF power
pins after verifying their metal coverage in the GDS. The matching strips
are subtracted from Metal4 OBS so Magic's abstract extraction does not treat
valid power-pin metal as an overlap with a routing obstruction.

Main RTL remains available in `src/rtl/project.v` and `src/rtl/generated/design.v`. The
current `info.yaml` selects `wrapper/project.v` instead.

Compatibility fixes:

- Remove 1230 unreferenced physical filler NAME_MAP entries from SPEF.
  Packaging aborts if a candidate entry has any references. R/C data and
  connectivity are unchanged; this avoids the OpenSTA parser failure at
  the first `xofiller!` entry.
- `test/icc2_reset_x.vh` corrects eight proven UART/QSPI D-input values while
  both reset polarities are known and active. It releases on reset deassertion
  or unknown reset, applies on subsequent resets too, and never forces Q.
  This code is included only for this hard-macro GL simulation, not RTL or
  synthesis. The uncorrected DC and ICC2 netlists exhibit X pessimism.
- `python3 test/check_icc2_reset.py` exhaustively evaluates each corrected
  combinational cone over all binary inputs, constraining only reset. The GL
  build runs this proof before compiling. A changed or unsupported cone fails
  the check instead of silently accepting the workaround. This is a local
  reset proof, not full-chip formal equivalence.

With the corrections, the existing UART READY / NOP / READY smoke test passes
against the packaged powered netlist and native GF180 cell models. Its output
assertions are unchanged. Full GDS integration/signoff is still under test.

## Wrapper row handling

Placement halos are zero so three rows above the macro remain as OpenROAD
floorplan metadata. Hard placement blockages reserve all remaining rows for
wiring. The PDN script removes the automatically inserted wrapper tap/endcap
instances; the hardened core retains its own physical cells unchanged.
Wrapper followpin rails are disabled because there are no wrapper standard
cells to power. The Metal3 buses and nine Metal4 feed pairs remain enabled.
A local replay from the failed Actions macro-placement database passed PDN
construction and both supply connectivity checks with three rows and only the
core instance. Full routing, DRC/LVS and precheck remain Actions checks.
