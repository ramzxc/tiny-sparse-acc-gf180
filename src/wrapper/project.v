`default_nettype none
module tt_um_tiny_sparse_acc_ramzxc (
`ifdef USE_POWER_PINS
    inout VPWR,
    inout VGND,
`endif
    input [7:0] ui_in,
    output [7:0] uo_out,
    input [7:0] uio_in,
    output [7:0] uio_out,
    output [7:0] uio_oe,
    input ena,
    input clk,
    input rst_n
);
    wire [7:0] core_uio_oe;

    // These outputs share one physical driver inside the hardened QSPI core.
    // Make the aliases explicit at the wrapper boundary for hierarchical LVS.
    assign uio_oe = {core_uio_oe[7:6], {2{core_uio_oe[1]}},
                     core_uio_oe[3:0]};

    tiny_sparse_acc_core core (
`ifdef USE_POWER_PINS
        .VPWR(VPWR), .VGND(VGND),
`endif
        .ui_in(ui_in), .uo_out(uo_out),
        .uio_in(uio_in), .uio_out(uio_out), .uio_oe(core_uio_oe),
        .ena(ena), .clk(clk), .rst_n(rst_n)
    );
endmodule
`default_nettype wire
