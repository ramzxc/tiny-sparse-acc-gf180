# Rebuild ICC2 hard macro

This macro was newly synthesized and routed from the rebuild RTL now tracked in
`src/rtl`. It is **not** the earlier FP8 implementation. Direct 16-bit instructions,
FP8 E4M3FN, one lane, 24-bit device-local addresses, no micro controller.

Export: `20261118_221815_1795007895490261`.
`provenance.json` records exported file hashes and the RTL hashes checked against
the synthesis input manifest. Run `python3 scripts/check_macro_sources.py` to
reject a stale macro after RTL edits.

- Synopsys DC cell area: 34,032.19 um².
- ICC2 routed netlist cell area: 34,091.46 um² (excludes physical-only cells).
- Macro boundary: 339.92 x 141.12 um; wrapper placement: (3.36, 3.92), N.
- Clock: 10 MHz. Worst reported nominal setup slack: +16.84 ns.
- ICC2 final route checks: zero opens, routing DRC and antenna violations.
- PG connectivity and PG DRC checks: zero errors.

These are local implementation checks, not a claim that external GDS DRC/LVS
or Tiny Tapeout precheck has passed. Actions checks the new integrated layout.
The nominal SPEF is reused across flow corners; this is not multi-corner RC signoff.

Native GF180 cell GDS is merged at export. Packaging renames the top consistently,
adds/verifies PR boundary, checks lossless 1 nm precision conversion, decomposes
LEF obstruction polygons into geometrically equivalent rectangles, and exposes
GDS-verified full-height Metal4 supply stripes. The existing wrapper power plan
connects those nine stripe pairs with Metal3 buses above the core.

RTL tests use `src/sources.f`; GL tests use `core.pg.v` plus the wrapper netlist.
Gate simulation needs reset-only X-pessimism corrections in UART, QSPI and one
data-controller state bit. `test/check_icc2_reset.py` exhaustively proves each
corrected D input is zero under reset for all binary inputs, without assuming
flop initialization. It is a prerequisite of the GL build. No Q initialization,
normal-operation correction or GDS modification is used.

## Shared output-port extraction

`uio_oe[5]`, `[4]`, and `[1]` intentionally share a driver. Magic's default
hierarchical extraction dropped two of these port aliases when their connection
passed through ICC2's hierarchical via cells. This caused port errors even though
all 1,521 devices and 1,545 core nets matched.

Packaging now inlines only `$$Via*` instances, checking exact polygon multiset equality on
every layer/datatype. Standard cells remain hierarchical. LibreLane's documented
`MAGIC_EXT_SHORT_RESISTOR` option preserves the aliased pin names using zero-ohm
links in the extracted SPICE. These are extraction annotations, not new physical
resistors. No LVS exclusions or port-matching waivers are added.

Local validation re-extracts the packaged core GDS and compares it together with
the CI-extracted wrapper against the original powered reference netlists.
The final packaged GDS passed: `Circuits match uniquely`. Logical and powered
reference netlists are unchanged.

## Wrapper via-flattening experiment

`src/tcl/magicrc.tcl` sources the PDK startup and sets Magic's native
`gds flatglob VIA_*` option. This expands OpenROAD via cells during GDS import;
standard cells and the core remain hierarchical. No extracted-SPICE Python
postprocessor is used. The stored GDS and fabrication geometry are unchanged.

Local re-extraction of the successful run 44317152587's final GDS restores all
top-level port names, but Netgen still reports one top-level pin mismatch:
`uio_oe[4]` is represented through a shorted alias instead of a direct macro
terminal. Thus via flattening alone is not yet a complete replacement for
commit d883463's SPICE alias restoration. This revision is an explicit CI
experiment, not a claim that LVS is fixed.
