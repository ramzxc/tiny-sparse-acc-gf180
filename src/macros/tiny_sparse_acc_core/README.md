# ICC2 hard-macro experiment

This branch tests the manually routed ICC2 core as a fixed macro inside the
Tiny Tapeout 1x1 wrapper. The RTL tests still use the original RTL; the GDS and
gate-level jobs use the packaged core. No synthesis or PnR was run to package it.

Source export: `20261111_154647_1794379607968332`. Source hashes and the exact
packaging transformations are in `provenance.json`; reproduce with
`python scripts/package_icc2_macro.py /path/to/export` (requires gdstk).

The macro is 339.92 x 137.20 um, at (3.36, 3.92), orientation N. Its existing
Metal4 VPWR/VGND terminals align with the parent grid. `macro_pdn.tcl` adds
same-layer feeds overlapping those terminals by 1 um. No signoff checks are
suppressed specifically for this experiment.

The SPEF contains only nominal 25C RC. It is reused across the flow's corners
for this integration experiment; this is not multi-corner RC signoff.
The original export's unused VDD/VSS alias ports had no LEF geometry. The
packaging script removes these aliases and connects the existing VPWR/VGND
ports directly, without modifying physical geometry.

Main RTL remains available in `project.v` and `generated/design.v`. The
experiment's `info.yaml` selects `hardmacro_wrapper.v` instead.

Compatibility fixes:

- Remove 1,432 unreferenced physical filler NAME_MAP entries from SPEF.
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
