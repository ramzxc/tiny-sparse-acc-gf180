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
