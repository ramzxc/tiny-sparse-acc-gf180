# Keep the PDK startup and extraction rules unchanged.
source $::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/$::env(PDK).magicrc

set ::tt_restore_ports [file normalize [file join [file dirname [info script]] ../../scripts/restore_spice_ports.py]]

# Run immediately after SPICE emission, before LibreLane starts Netgen.
# Proof comes from the same extraction's merge records, not the schematic.
proc tt_restore_extracted_ports {command code result operation} {
    if {$code != 0} { return }
    set output_index [lsearch -exact $command -o]
    if {$output_index < 0} { return }
    set spice [lindex $command [expr {$output_index + 1}]]
    set ext [lindex $command end]
    if {[file extension $ext] ne ".ext"} { return }
    puts [exec python3 $::tt_restore_ports $spice $ext 2>@1]
}
trace add execution ext2spice leave tt_restore_extracted_ports
