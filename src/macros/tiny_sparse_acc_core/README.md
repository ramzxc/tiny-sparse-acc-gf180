# ICC2 hard-macro experiment

This branch tests the manually routed ICC2 core as a fixed macro inside the
Tiny Tapeout 1x1 wrapper. The RTL tests still use the original RTL; the GDS and
gate-level jobs use the packaged core. No synthesis or PnR was run to package it.

Source export: `20261111_192348_1794392628598485`. Source hashes and the exact
packaging transformations are in `provenance.json`; reproduce with
`python scripts/package_icc2_macro.py /path/to/export` (requires gdstk).

The macro is 299.60 x 141.12 um, at (3.36, 3.92), orientation N. Its existing
Metal4 VPWR/VGND terminals align with the parent grid. `macro_pdn.tcl` adds
same-layer feeds overlapping those terminals by 1 um. It defines only the
wrapper standard-cell grid, with eight VPWR/VGND feed pairs; the default Metal4--Metal5 macro grid is omitted
because the macro already has its own power network and Metal4 terminals. No signoff checks are
suppressed specifically for this experiment.

Two Metal3 buses above the macro (VPWR y=147.00 um, VGND y=150.90 um)
join the macro-aligned Metal4 stripes to the ninth stripe pair in the right
wrapper cell area. PDN generation inserts Metal3--Metal4 vias at same-net
crossings; opposite supplies cross on separate layers without a via.
The buses lie between the right-hand M1 rail via stacks, leaving clearance
to their intermediate Metal3 landing shapes during PDN generation.

External supply pins describe nine full-height Metal4 stripes per supply
(1.6 um wide, y=3.62..157.10 um), rather than promoting short upper fragments.
The first eight pairs are covered by the core GDS stripes and wrapper feeds;
the ninth pair is generated in the right-hand wrapper area. This preserves
access for the shuttle grid and the TT precheck requirement that every power
pin be on Metal4, at least 0.8 um wide, and within 10 um of both tile edges.

The SPEF contains only nominal 25C RC. It is reused across the flow's corners
for this integration experiment; this is not multi-corner RC signoff.
The original export's unused VDD/VSS alias ports had no LEF geometry. The
packaging script removes these aliases and connects the existing VPWR/VGND
ports directly, without modifying physical geometry.
Packaging also adds the missing GF180 PR_bndry rectangle on GDS layer 0/0,
using the LEF size (299.60 x 141.12 um). This boundary marker is required by
Magic macro streamout; device and routing geometry remain unchanged.
GDS database precision is normalized from ICC2's 0.1 nm to the streamout
merger's 1 nm. Packaging checks all polygon/path edges, instance placements,
array offsets and label positions first and fails if rounding would occur.

Main RTL remains available in `project.v` and `generated/design.v`. The
experiment's `info.yaml` selects `hardmacro_wrapper.v` instead.

Compatibility fixes:

- Remove 1,062 unreferenced physical filler NAME_MAP entries from SPEF.
  Packaging aborts if a candidate entry has any references. R/C data and
  connectivity are unchanged; this avoids the OpenSTA parser failure at
  the first `xofiller!` entry.
- `test/icc2_reset_x.vh` corrects only six proven UART D-input values while
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
