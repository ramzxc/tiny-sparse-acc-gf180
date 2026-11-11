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
    tiny_sparse_acc_core core (
`ifdef USE_POWER_PINS
        .VPWR(VPWR), .VGND(VGND),
`endif
        .ui_in(ui_in), .uo_out(uo_out),
        .uio_in(uio_in), .uio_out(uio_out), .uio_oe(uio_oe),
        .ena(ena), .clk(clk), .rst_n(rst_n)
    );
endmodule
`default_nettype wire
