# Preserve the PDK setup and use native Magic GDS import/extraction.
source $::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/$::env(PDK).magicrc

# Expand routing vias and the macro boundary, retaining standard-cell hierarchy.
# This avoids comparing electrically aliased macro pins as independent terminals.
# No SPICE postprocessing or LVS exclusions are used.
gds flatglob VIA_*
gds flatglob tiny_sparse_acc_core
