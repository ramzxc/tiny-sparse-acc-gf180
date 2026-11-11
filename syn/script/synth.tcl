# Based on egru/acc/syn/script/synth.tcl; no SRAM libraries or old source manifest.
set ROOT [file normalize [file join [file dirname [info script]] ../..]]
set TOP tt_um_tiny_sparse_acc_ramzxc
set VARIANT micro
if {[info exists ::env(TT_SYN_VARIANT)]} {set VARIANT $::env(TT_SYN_VARIANT)}
if {$VARIANT ni {micro direct}} {error "Unknown variant: $VARIANT"}
set STD_DB /docker/projects/egru/acc/technology/gf180-derived/db/gf180mcu_fd_sc_mcu7t5v0__tt_025C_3v30.db
if {[info exists ::env(GF180_STD_DB)]} {set STD_DB [file normalize $::env(GF180_STD_DB)]}
set SDC [file join $ROOT syn cons top.sdc]
set fd [open [file join $ROOT src sources.f] r]
set RTL {}
foreach name [split [string trim [read $fd]] "\n"] {lappend RTL [file join $ROOT src $name]}
close $fd
foreach path [concat $RTL [list $STD_DB $SDC]] {
    if {![file isfile $path]} {error "Missing input: $path"}
}
if {[info exists ::env(TT_SYN_CHECK)] && $::env(TT_SYN_CHECK) eq "1"} {
    puts "TOP $TOP\nVARIANT $VARIANT\nSTD_DB $STD_DB\nSDC $SDC"
    foreach path $RTL {puts "RTL $path"}
    puts "TT_SYNTHESIS_PREFLIGHT_PASS"
    exit 0
}
set RUN $::env(TT_SYN_RUN)
set OUT [file join $ROOT syn runs $VARIANT $RUN]
set REPORTS [file join $OUT reports]
file mkdir $REPORTS
proc synthesize {} {
    global ROOT TOP VARIANT STD_DB SDC RTL OUT REPORTS
    set_app_var search_path [concat [list [file join $ROOT src rtl] [file join $ROOT src rtl core]] $::search_path]
    set_app_var target_library [list $STD_DB]
    set_app_var link_library [list * $STD_DB]
    read_db $STD_DB
    set_host_options -max_cores 4
    define_design_lib WORK -path [file join $OUT work]
    set defines [list SYNTHESIS]
    if {$VARIANT eq "direct"} {lappend defines TT_DIRECT_UCODE}
    set fd [open [file join $REPORTS inputs.txt] w]
    puts $fd "VARIANT $VARIANT\nSTD_DB $STD_DB\nDEFINES $defines"
    foreach path [concat $RTL [glob [file join $ROOT src rtl defs *.vh]] [list $SDC]] {
        puts $fd [exec sha256sum $path]
    }
    close $fd
    file copy -force $SDC [file join $REPORTS input.sdc]
    if {![analyze -format sverilog -define $defines $RTL]} {error "Analyze failed"}
    if {![elaborate $TOP]} {error "Elaborate failed"}
    current_design $TOP
    if {![link]} {error "Link failed"}
    redirect -file [file join $REPORTS check_design_pre.rpt] {check_design}
    set_app_var sh_continue_on_error false
    source $SDC
    # Retain module boundaries for attribution, not dont_touch on internal logic.
    set hier [get_cells -hierarchical -filter {is_hierarchical == true}]
    set_ungroup $hier false
    set_boundary_optimization $hier false
    set_fix_multiple_port_nets -all -buffer_constants
    if {![compile_ultra -no_autoungroup]} {error "Compile failed"}
    if {![compile_ultra -incremental -only_design_rule -no_autoungroup]} {error "Design-rule compile failed"}
    if {[get_attribute [current_design] is_unmapped]} {error "Unmapped logic remains"}
    redirect -file [file join $REPORTS area.rpt] {report_area -hierarchy}
    redirect -file [file join $REPORTS timing_setup.rpt] {report_timing -delay_type max -max_paths 10}
    redirect -file [file join $REPORTS timing_hold.rpt] {report_timing -delay_type min -max_paths 10}
    redirect -file [file join $REPORTS constraints.rpt] {report_constraint -all_violators}
    redirect -file [file join $REPORTS check_design_post.rpt] {check_design}
    redirect -file [file join $REPORTS check_timing.rpt] {check_timing}
    redirect -file [file join $REPORTS clocks.rpt] {report_clock}
    redirect -file [file join $REPORTS qor.rpt] {report_qor}
    # Sum mapped leaf areas by top-level instance; avoids double counting hierarchy.
    array set areas {}; array set counts {}
    set total 0.0
    foreach_in_collection cell [get_cells -hierarchical -filter {is_hierarchical == false}] {
        set name [get_object_name $cell]
        set group TOP
        if {[string first / $name] >= 0} {set group [lindex [split $name /] 0]}
        if {![info exists areas($group)]} {set areas($group) 0.0; set counts($group) 0}
        set area [get_attribute $cell area]
        set areas($group) [expr {$areas($group) + $area}]
        incr counts($group)
        set total [expr {$total + $area}]
    }
    set fd [open [file join $REPORTS module_area.csv] w]
    puts $fd "instance,cells,area_um2,percent"
    foreach group [lsort [array names areas]] {
        puts $fd [format "%s,%d,%.4f,%.2f" $group $counts($group) $areas($group) [expr {100.0*$areas($group)/$total}]]
    }
    puts $fd "TOTAL,,${total},100"
    close $fd
    change_names -rules verilog -hierarchy
    write -format verilog -hierarchy -output [file join $OUT ${TOP}_gate.v]
    write -format ddc -hierarchy -output [file join $OUT ${TOP}.ddc]
    write_sdc [file join $OUT ${TOP}.sdc]
    set fd [open [file join $ROOT syn LATEST_$VARIANT] w]; puts $fd $OUT; close $fd
    puts "TT_SYNTHESIS_COMPLETE $OUT"
}
if {[catch {synthesize} message]} {puts stderr "TT_SYNTHESIS_FAILED: $message"; exit 1}
exit 0
