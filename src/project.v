/*
 * Copyright (c) 2024 Aram Yun
 * SPDX-License-Identifier: Apache-2.0
 */

`include "defs/defs.vh"
`include "defs/inst_defs.vh"
`include "defs/mem_defs.vh"
`default_nettype none

module tt_um_tiny_sparse_acc_ramzxc (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Assert reset immediately; release after two clock edges.
  (* ASYNC_REG = "TRUE" *) reg [1:0] reset_sync;
  wire internal_rst_n = reset_sync[1];

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      reset_sync <= 2'b00;
    else
      reset_sync <= {reset_sync[0], 1'b1};
  end

    wire rx = ui_in[3];
    wire tx, done, error;
    wire mem_itf_rdy,read_en,write_en,copy_en,read_data_val;
    wire [24:0] src_addr,dst_addr;
    wire [`DATA_WIDTH-1:0] read_data,write_data;
`ifdef TT_DIRECT_UCODE
    localparam HOST_WIDTH = `INST_WIDTH;
`else
    localparam HOST_WIDTH = `HOST_INST_WIDTH;
`endif
    wire [HOST_WIDTH-1:0] rx_inst,host_inst;
    wire rx_inst_val,host_inst_val,fifo_rdy,host_rdy;
    uart_rx #(.WORD_WIDTH(HOST_WIDTH)) receiver (.clk(clk),.rst_n(internal_rst_n),.rx(rx),.inst(rx_inst),.inst_val(rx_inst_val));
    uart_tx transmitter (.clk(clk),.rst_n(internal_rst_n),.inst_fifo_rdy(fifo_rdy),.tx(tx));
    inst_fifo #(.WORD_WIDTH(HOST_WIDTH)) fifo (.clk(clk),.rst_n(internal_rst_n),.inst(rx_inst),.inst_val(rx_inst_val),
        .fifo_rdy(fifo_rdy),.core_rdy(host_rdy),.inst_out(host_inst),.inst_out_val(host_inst_val));
    wire [`INST_WIDTH-1:0] inst;
    wire inst_val, core_rdy, mem_rdy;
    wire [`MEM_INST_WIDTH-1:0] mem_inst;
    wire mem_inst_val;
    wire [`EXE_INST_WIDTH-1:0] exe_inst;
    wire exe_inst_val;
    wire [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] weight_data, input_data, vpu_result, act_result;
    wire weight_data_val, input_data_val, vpu_result_val, act_result_val;
    wire [2:0] act_op;
    reg exe_active;
    wire exe_rdy = !exe_active;

    // Ready means the complete VPU -> activation operation has finished.
    always @(posedge clk) begin
        if (!internal_rst_n)
            exe_active <= 0;
        else if (exe_inst_val)
            exe_active <= 1;
        else if (act_result_val)
            exe_active <= 0;
    end

`ifdef TT_DIRECT_UCODE
    // PC supplies the 16-bit internal ISA, including EXE_SYNC/MEM_SYNC.
    assign inst = host_inst;
    assign inst_val = host_inst_val;
    assign host_rdy = core_rdy;
    // No high-level job boundary or job-format error exists in this mode.
    assign done = 1'b0;
    assign error = 1'b0;
`else
    micro_ctrl sequencer (
        .clk(clk), .rst_n(internal_rst_n), .inst_in(host_inst),
        .inst_in_val(host_inst_val), .inst_in_rdy(host_rdy),
        .done(done), .error(error),
        .inst_out(inst), .inst_out_val(inst_val), .inst_out_rdy(core_rdy),
        .input_is_zero(input_data[6:0] == 0), .input_data_val(input_data_val)
    );

`endif

    decoder decode (
        .rst_n(internal_rst_n), .inst_in(inst), .inst_in_val(inst_val), .core_rdy(core_rdy),
        .mem_rdy(mem_rdy), .exe_rdy(exe_rdy),
        .mem_inst_out(mem_inst), .mem_inst_out_val(mem_inst_val),
        .exe_inst_out(exe_inst), .exe_inst_out_val(exe_inst_val)
    );

    mem_ctrl memory (
        .clk(clk), .rst_n(internal_rst_n), .mem_inst_in(mem_inst), .mem_inst_in_val(mem_inst_val),
        .mem_rdy(mem_rdy), .mem_itf_rdy(mem_itf_rdy),
        .read_en(read_en), .write_en(write_en), .copy_en(copy_en),
        .src_addr(src_addr), .dst_addr(dst_addr), .write_data(write_data),
        .read_data(read_data), .read_data_val(read_data_val),
        .weight_data(weight_data), .weight_data_val(weight_data_val),
        .input_data(input_data), .input_data_val(input_data_val), .act_res_in(act_result)
    );

    vpu compute (
        .clk(clk), .rst_n(internal_rst_n), .exe_inst_in(exe_inst), .exe_inst_in_val(exe_inst_val),
        .weight_data(weight_data), .weight_data_val(weight_data_val),
        .input_data(input_data), .input_data_val(input_data_val),
        .vpu_res_out(vpu_result), .act_op_out(act_op), .vpu_res_out_val(vpu_result_val)
    );

    act activation (
        .clk(clk), .rst_n(internal_rst_n), .vpu_res_in(vpu_result), .act_op_in(act_op),
        .vpu_res_in_val(vpu_result_val), .act_res_out(act_result), .act_res_out_val(act_result_val)
    );
    wire qspi_req_val,qspi_req_rdy,qspi_req_write,qspi_read_data_val;
    wire [24:0] qspi_req_addr;
    wire [`DATA_WIDTH-1:0] qspi_req_data,qspi_read_data;
    mem_itf itf (.clk(clk),.rst_n(internal_rst_n),.rdy(mem_itf_rdy),
        .read_en(read_en),.write_en(write_en),.copy_en(copy_en),
        .src_addr(src_addr),.dst_addr(dst_addr),.write_data(write_data),
        .read_data(read_data),.read_data_val(read_data_val),
        .qspi_req_val(qspi_req_val),.qspi_req_rdy(qspi_req_rdy),
        .qspi_req_write(qspi_req_write),.qspi_req_addr(qspi_req_addr),.qspi_req_data(qspi_req_data),
        .qspi_read_data(qspi_read_data),.qspi_read_data_val(qspi_read_data_val));

    wire sck, flash_cs, ram_a_cs, ram_b_cs;
    wire [3:0] dq_out, dq_oe;
    qspi_ctrl serial_memory (
        .clk(clk), .rst_n(internal_rst_n),
        .req_val(qspi_req_val), .req_rdy(qspi_req_rdy),
        .req_write(qspi_req_write), .req_addr(qspi_req_addr), .req_data(qspi_req_data),
        .read_data(qspi_read_data), .read_data_val(qspi_read_data_val),
        .sck(sck), .flash_sc_n(flash_cs),
        .psram_a_sc_n(ram_a_cs), .psram_b_sc_n(ram_b_cs),
        .dq_in({uio_in[5:4], uio_in[2:1]}), .dq_out(dq_out), .dq_oe(dq_oe)
    );

    // TinyQV-compatible QSPI Pmod pin order; UART retains the previous pins.
    assign uio_out = {ram_b_cs, ram_a_cs, dq_out[3:2], sck, dq_out[1:0], flash_cs};
    assign uio_oe = {2'b11, dq_oe[3:2], 1'b1, dq_oe[1:0], 1'b1};
    assign uo_out = {3'b0, tx, 1'b0, error, done, host_rdy};
    wire _unused = &{ui_in[7:4], ui_in[2:0], uio_in[7:6], uio_in[3], uio_in[0], ena, 1'b0};
endmodule
`default_nettype wire
