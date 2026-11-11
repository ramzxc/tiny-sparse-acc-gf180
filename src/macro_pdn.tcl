# Parent rails/stripes use the standard TT grid. Macro power terminals are
# on that same Metal4 grid, so connect with Metal4 overlap, not Metal5 vias.
source $::env(SCRIPTS_DIR)/openroad/common/pdn_cfg.tcl

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
        foreach {bottom top} {3.62 4.92 140.12 157.10} {
            set y1 [expr {round($bottom * $dbu)}]
            set y2 [expr {round($top * $dbu)}]
            odb::dbSBox_create $wire $layer $x1 $y1 $x2 $y2 STRIPE
        }
    }
}
