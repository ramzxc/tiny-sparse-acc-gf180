# GF180 SRAM macro views

The 64x8 and 512x8 macro LEF, GDS, CDL and three 3.3 V Liberty corner files are
copied unchanged from the GF180 PDK used by the source accelerator. SHA-256 values
are recorded in source_sha256.json; the upstream Apache-2.0 LICENSE is included.
The .vh files are blackbox interfaces for synthesis/lint, not memory implementations.
Simulation models are in test/models and are not synthesis sources.

The 4x4 floorplan places the 512-byte macro at (30, 30), and the two 64-byte macros
at (500, 30) and (500, 300), all orientation N. These are initial nonoverlapping
locations, not a validated routed floorplan. PDN hooks connect VDD/VSS to VPWR/VGND. The macro connection joins SRAM
Metal3 power pins to the TT Metal4 straps; the unused default Metal5 connection
is replaced while PDN_MULTILAYER remains off.
Physical implementation, DRC/LVS, timing and gate-level simulation remain unverified.
