# Preserve the PDK setup; expand only OpenROAD's via cells while reading GDS.
source $::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/$::env(PDK).magicrc

# Standard cells and the core remain hierarchical. Geometry is unchanged.
# Use Magic's native reader, without modifying extracted SPICE.
gds flatglob VIA_*
