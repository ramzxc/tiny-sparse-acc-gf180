# GF180 SRAM macro views

The 64x8, 256x8 and 512x8 macro LEF, GDS, CDL and three 3.3 V Liberty corner files are
copied unchanged from the GF180 PDK used by the source accelerator. SHA-256 values
are recorded in source_sha256.json; the upstream Apache-2.0 LICENSE is included.
The .vh files are blackbox interfaces for synthesis/lint, not memory implementations.
Simulation models are in test/models and are not synthesis sources.

The 4x4 floorplan places the 256-byte macro at (30, 30), and the two 64-byte macros
at (500, 30) and (500, 300), all orientation N. These are initial nonoverlapping
locations, not a validated routed floorplan. PDN hooks connect VDD/VSS to VPWR/VGND. The macro connection joins SRAM
Metal3 power pins to the TT Metal4 straps; the unused default Metal5 connection
is replaced while PDN_MULTILAYER remains off.
Physical implementation, DRC/LVS, timing and gate-level simulation remain unverified.

The corner-facing placement strips are blocked with `FP_OBSTRUCTIONS` in
`src/config.json`: `(0, 0)-(30, 380.88)` on the left and
`(0, 0)-(941.86, 30)` along the bottom (all coordinates in micrometers).
Their ends include the existing 10 um macro halo. These are placement
obstructions, so the strips remain available for routing. The inward-facing
channels and SRAM locations are unchanged. This prevents cells from entering
the left-edge sliver where the previous floorplan left only 14 um between
endcaps, less than the 16.24 um width of a `dffq_1` cell.

This experimental branch uses a 256-byte weight macro (431.86 x 340.88 um),
128 FP8 vector rows, and 384 bytes of total SRAM. The 512-byte views are retained
for wrapper compatibility but are not instantiated in this configuration.
Programs must tile weight loads to at most 128 rows.
