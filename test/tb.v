`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a FST file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.fst");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  wire [7:0] uio_in;
  reg flash_stuck_busy = 0;
  wire [3:0] flash_in, ram_a_in, ram_b_in;
  wire flash_cs = uio_out[0];
  wire ram_a_cs = uio_out[6];
  wire ram_b_cs = uio_out[7];
  wire [3:0] dq_out = {uio_out[5:4], uio_out[2:1]};
  wire [3:0] dq_oe = {uio_oe[5:4], uio_oe[2:1]};
  wire [3:0] dq_in = !flash_cs ? flash_in :
      !ram_a_cs ? ram_a_in : !ram_b_cs ? ram_b_in : 4'hf;
  assign uio_in = {2'b0, dq_in[3:2], 1'b0, dq_in[1:0], 1'b0};

  // External devices only: no initialization or forcing of DUT storage.
  qspi_psram_model #(.DEPTH(1024)) ram_a (
      .sck(uio_out[3]), .cs_n(ram_a_cs), .dq_out(dq_out),
      .dq_oe(dq_oe), .dq_in(ram_a_in)
  );
  qspi_psram_model #(.DEPTH(1024)) ram_b (
      .sck(uio_out[3]), .cs_n(ram_b_cs), .dq_out(dq_out),
      .dq_oe(dq_oe), .dq_in(ram_b_in)
  );
  qspi_nor_model #(.DEPTH(1024), .BOARD_PREPARED(1), .PROGRAM_TIME(15000ns)) flash (
      .clk(clk), .sck(uio_out[3]), .cs_n(flash_cs), .dq_out(dq_out),
      .dq_oe(dq_oe), .dq_in(flash_in), .stuck_busy(flash_stuck_busy),
      .reject_wren(1'b0), .ignore_qe(1'b0)
  );
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;
`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

  // Replace tt_um_tiny_sparse_acc_ramzxc with your module name:
  tt_um_tiny_sparse_acc_ramzxc user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(VPWR),
      .VGND(VGND),
`endif

      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

`ifdef GL_TEST
`ifdef TT_ICC2_HARDMACRO
  `include "icc2_reset_x.vh"
`endif
`endif

endmodule
