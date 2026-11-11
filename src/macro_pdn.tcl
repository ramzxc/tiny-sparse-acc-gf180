# Parent rails/stripes use the standard TT grid. Macro power terminals are
# on that same Metal4 grid, so connect with Metal4 overlap, not Metal5 vias.
# Define only the wrapper grid. The default pdn_cfg.tcl also creates a
# macro grid with a Metal4--Metal5 via connection, which is empty for this
# core's same-layer Metal4 terminals and causes PDN-0233.
source $::env(SCRIPTS_DIR)/openroad/common/set_global_connections.tcl
set_global_connections

if {$::env(PDN_MULTILAYER) || $::env(PDN_CORE_RING) ||
    $::env(PDN_VERTICAL_LAYER) ne "Metal4" ||
    $::env(PDN_RAIL_LAYER) ne "Metal1"} {
    error "This hard macro requires the TT Metal1/Metal4 grid without a ring."
}

set_voltage_domain -name CORE -power $::env(VDD_NET) -ground $::env(GND_NET)

set pin_args {}
if {$::env(PDN_ENABLE_PINS)} {
    lappend pin_args -pins $::env(PDN_VERTICAL_LAYER)
}
define_pdn_grid -name stdcell_grid -starts_with POWER \
    -voltage_domain CORE {*}$pin_args

set extend_args {}
if {$::env(PDN_EXTEND_TO) eq "core_ring"} {
    lappend extend_args -extend_to_core_ring
} elseif {$::env(PDN_EXTEND_TO) eq "boundary"} {
    lappend extend_args -extend_to_boundary
}
add_pdn_stripe -grid stdcell_grid \
    -layer $::env(PDN_VERTICAL_LAYER) \
    -width $::env(PDN_VWIDTH) -pitch $::env(PDN_VPITCH) \
    -offset $::env(PDN_VOFFSET) -spacing $::env(PDN_VSPACING) \
    -starts_with POWER {*}$extend_args

if {$::env(PDN_ENABLE_RAILS)} {
    add_pdn_stripe -grid stdcell_grid -layer $::env(PDN_RAIL_LAYER) \
        -width $::env(PDN_RAIL_WIDTH) -followpins
    add_pdn_connect -grid stdcell_grid \
        -layers "$::env(PDN_RAIL_LAYER) $::env(PDN_VERTICAL_LAYER)"
}

# Join all vertical supply stripes above the macro. The core ends at
# y=145.04 um; these Metal3 buses are centered at 148.96/152.26 um.
# Unlike the manual macro feeds below, these belong to the PDN grid so
# pdngen creates Metal3--Metal4 vias at every same-net crossing. This also
# keeps the upper portions of the eight macro-aligned stripes from trimming
# away and connects them to the ninth pair serving the right-hand rows.
# Offset is relative to the wrapper core lower edge (y=3.92 um).
add_pdn_stripe -grid stdcell_grid -layer Metal3 \
    -width 1.6 -pitch 38.87 -spacing 1.7 -offset 145.04 \
    -starts_with POWER -extend_to_boundary
add_pdn_connect -grid stdcell_grid -layers {Metal3 Metal4}

# The macro already contains its power grid. Connect the existing terminals
# using same-layer feed shapes below; do not create an empty macro grid.

set block [ord::get_db_block]
set tech [[ord::get_db] getTech]
set layer [$tech findLayer Metal4]
set dbu [$block getDbUnitsPerMicron]
foreach net_name {VPWR VGND} first_center {19.68 22.98} {
    set net [$block findNet $net_name]
    if {$net == "NULL"} {error "Missing power net $net_name"}
    set wire [odb::dbSWire_create $net ROUTED]
    for {set i 0} {$i < 8} {incr i} {
        set center [expr {$first_center + 38.87 * $i}]
        set x1 [expr {round(($center - 0.8) * $dbu)}]
        set x2 [expr {round(($center + 0.8) * $dbu)}]
        foreach {bottom top} {3.62 4.92 144.04 157.10} {
            set y1 [expr {round($bottom * $dbu)}]
            set y2 [expr {round($top * $dbu)}]
            odb::dbSBox_create $wire $layer $x1 $y1 $x2 $y2 STRIPE
        }
    }
}
