# Only macro-specific PDN operations live here; grid dimensions are in config.json.
# Parent rails/stripes use the standard TT grid. Macro power terminals are
# on that same Metal4 grid, so connect with Metal4 overlap, not Metal5 vias.
# Define only the wrapper grid. The default pdn_cfg.tcl also creates a
# macro grid with a Metal4--Metal5 via connection, which is empty for this
# core's same-layer Metal4 terminals and causes PDN-0233.
source $::env(SCRIPTS_DIR)/openroad/common/set_global_connections.tcl
set_global_connections

# Preserve the rows as placement/PDN metadata, but reserve them for wiring.
# This wrapper contains only the fixed core; its taps/fillers live inside it.
set block [ord::get_db_block]
foreach inst [$block getInsts] {
    if {[$inst getName] eq "core"} {continue}
    set name [$inst getName]
    if {![string match TAP_TAPCELL_* $name] && ![string match PHY_EDGE_* $name]} {
        error "Unexpected wrapper instance $name; review the macro-only floorplan"
    }
    odb::dbInst_destroy $inst
}
foreach row [$block getRows] {
    set box [$row getBBox]
    odb::dbBlockage_create $block [$box xMin] [$box yMin] [$box xMax] [$box yMax]
}
if {[llength [$block getRows]] == 0} {
    error "Wrapper rows are missing; FP_MACRO halos must be zero"
}

if {$::env(PDN_MULTILAYER) || $::env(PDN_CORE_RING) ||
    $::env(PDN_VERTICAL_LAYER) ne "Metal4" ||
    $::env(PDN_RAIL_LAYER) ne "Metal1"} {
    error "This hard macro requires the TT Metal1/Metal4 grid without a ring."
}

set_voltage_domain -name CORE -power $::env(VDD_NET) -ground $::env(GND_NET)

# Do not promote the short stripe fragments above the macro as separate
# external pins: TT requires each power-pin rectangle to span the tile height
# to within 10 um of both edges. Full-height pins are defined below instead.
define_pdn_grid -name stdcell_grid -starts_with POWER \
    -voltage_domain CORE

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
# y=145.04 um; these Metal3 buses are centered at 147.40/150.90 um.
# The fixed wrapper signal pins reach y=146.02: the VPWR lower edge at
# 146.60 leaves 0.58 um, exceeding the reported 0.56 um M3 spacing rule.
# Keep both buses between the existing M1 rail via stacks, not on top of
# their intermediate Metal3 landing shapes. Overlap there prevents PDNGEN
# from completing the M1--M4 stacks and leaves the upper rows disconnected.
# Unlike the manual macro feeds below, these belong to the PDN grid so
# pdngen creates Metal3--Metal4 vias at every same-net crossing. This also
# keeps the upper portions of the nine macro-aligned stripes from trimming
# away across the full macro width.
# Offset is relative to the wrapper core lower edge (y=3.92 um).
# Leave extension at its default core bounds (x=3.36..343.28), not the die
# boundary. Magic otherwise exports the bus ends as forbidden M3 power pins.
add_pdn_stripe -grid stdcell_grid -layer $::env(PDN_HORIZONTAL_LAYER) \
    -width $::env(PDN_HWIDTH) -pitch $::env(PDN_HPITCH) \
    -spacing $::env(PDN_HSPACING) -offset $::env(PDN_HOFFSET) \
    -starts_with POWER
add_pdn_connect -grid stdcell_grid \
    -layers "$::env(PDN_HORIZONTAL_LAYER) $::env(PDN_VERTICAL_LAYER)"

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
    for {set i 0} {$i < 9} {incr i} {
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

# All nine pairs follow continuous Metal4 already present in the core
# GDS plus the overlapping feeds above.
# These are pin descriptions of real metal, not additional routing through
# the macro. Keep all nine supply pairs accessible to the shuttle power grid.
if {$::env(PDN_ENABLE_PINS)} {
    foreach net_name {VPWR VGND} first_center {19.68 22.98} {
        set net [$block findNet $net_name]
        set terminal [$block findBTerm $net_name]
        if {$terminal == "NULL"} {
            set terminal [odb::dbBTerm_create $net $net_name]
        }
        $terminal setIoType INOUT
        $terminal setSigType [$net getSigType]
        $terminal setSpecial
        set pin [odb::dbBPin_create $terminal]
        $pin setPlacementStatus FIRM
        for {set i 0} {$i < 9} {incr i} {
            set center [expr {$first_center + 38.87 * $i}]
            odb::dbBox_create $pin $layer \
                [expr {round(($center - 0.8) * $dbu)}] \
                [expr {round(3.62 * $dbu)}] \
                [expr {round(($center + 0.8) * $dbu)}] \
                [expr {round(157.10 * $dbu)}]
        }
    }
}
