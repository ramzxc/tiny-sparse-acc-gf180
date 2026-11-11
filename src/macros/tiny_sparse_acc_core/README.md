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

Local verification before push: Icarus elaboration with the native GF180
models passed. The UART gate-level smoke test failed: transmitter.clk_cnt[6]
remains X after reset and TX subsequently becomes X. This also reproduces
with zero cell delay. The exported optimized feedback logic reconverges
through this bit; distinguish simulation X pessimism from a real reset issue
before using this export as a submission. The test is intentionally unchanged.
