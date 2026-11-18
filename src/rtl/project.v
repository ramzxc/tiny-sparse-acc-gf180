/* Copyright (c) 2024 Aram Yun. SPDX-License-Identifier: Apache-2.0 */
`include "defs/defs.vh"
`include "defs/mem_defs.vh"
`default_nettype none

module tt_um_tiny_sparse_acc_ramzxc (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);
    (* ASYNC_REG = "TRUE" *) reg [1:0] reset_sync;
    wire core_rst_n = reset_sync[1];
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) reset_sync <= 0;
        else        reset_sync <= {reset_sync[0], 1'b1};
    end

    wire tx, fifo_rdy, rx_inst_val, inst_val, decoder_rdy;
    wire [`INST_WIDTH-1:0] rx_inst, inst;
    wire [`EXEC_INST_WIDTH-1:0] exec_inst;
    wire [`DATA_INST_WIDTH-1:0] data_inst;
    wire exec_inst_val, data_inst_val, exec_rdy, data_rdy;
    wire [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] operand, result;
    wire input_scalar_mode;
    wire [`CUR_WIDTH-1:0] input_select;
    wire operand_val, operand_is_weight, result_val;
    wire mem_rdy, read_en, write_en, read_data_val;
    wire [`MEM_ADDR_WIDTH-1:0] addr;
    wire [`MEM_DEVICE_WIDTH-1:0] device;
    wire [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] write_data, read_data;
    wire qspi_req_val, qspi_req_rdy, qspi_req_write, qspi_read_data_val;
    wire [`MEM_ADDR_WIDTH-1:0] qspi_addr;
    wire [`MEM_DEVICE_WIDTH-1:0] qspi_device;
    wire [`DATA_WIDTH-1:0] qspi_write_data, qspi_read_data;
    wire sck, flash_cs, ram_a_cs, ram_b_cs;
    wire [3:0] dq_out, dq_oe;

    uart_rx receiver (
        .clk(clk), .rst_n(core_rst_n), .rx(ui_in[3]),
        .inst(rx_inst), .inst_val(rx_inst_val)
    );
    uart_tx transmitter (
        .clk(clk), .rst_n(core_rst_n), .inst_fifo_rdy(fifo_rdy), .tx(tx)
    );
    inst_fifo fifo (
        .clk(clk), .rst_n(core_rst_n),
        .inst_in(rx_inst), .inst_in_val(rx_inst_val), .fifo_rdy(fifo_rdy),
        .decoder_rdy(decoder_rdy), .inst_out(inst), .inst_out_val(inst_val)
    );
    inst_decoder decode (
        .rst_n(core_rst_n), .inst_in(inst), .inst_in_val(inst_val),
        .decoder_rdy(decoder_rdy), .exec_rdy(exec_rdy), .data_rdy(data_rdy),
        .exec_inst_out(exec_inst), .exec_inst_out_val(exec_inst_val),
        .data_inst_out(data_inst), .data_inst_out_val(data_inst_val)
    );
    data_ctrl data (
        .clk(clk), .rst_n(core_rst_n),
        .data_inst_in(data_inst), .data_inst_in_val(data_inst_val), .data_rdy(data_rdy),
        .exec_data_in(result), .exec_data_in_val(result_val),
        .exec_data_out(operand), .exec_data_out_val(operand_val),
        .exec_data_is_weight(operand_is_weight),
        .input_scalar_mode(input_scalar_mode), .input_select(input_select),
        .mem_itf_rdy(mem_rdy), .read_en(read_en), .write_en(write_en),
        .addr(addr), .device(device), .write_data(write_data),
        .read_data(read_data), .read_data_val(read_data_val)
    );
    exec_unit exec (
        .clk(clk), .rst_n(core_rst_n),
        .exec_inst_in(exec_inst), .exec_inst_in_val(exec_inst_val), .exec_rdy(exec_rdy),
        .data_in(operand), .data_in_val(operand_val), .is_weight(operand_is_weight),
        .input_scalar_mode(input_scalar_mode), .input_select(input_select),
        .data_out(result), .data_out_val(result_val)
    );
    mem_itf itf (
        .clk(clk), .rst_n(core_rst_n), .rdy(mem_rdy),
        .read_en(read_en), .write_en(write_en), .addr(addr), .device(device),
        .write_data(write_data), .read_data(read_data), .read_data_val(read_data_val),
        .qspi_req_val(qspi_req_val), .qspi_req_rdy(qspi_req_rdy),
        .qspi_req_write(qspi_req_write), .qspi_req_addr(qspi_addr),
        .qspi_req_device(qspi_device), .qspi_req_data(qspi_write_data),
        .qspi_read_data(qspi_read_data), .qspi_read_data_val(qspi_read_data_val)
    );
    qspi_ctrl serial_memory (
        .clk(clk), .rst_n(core_rst_n),
        .req_val(qspi_req_val), .req_rdy(qspi_req_rdy), .req_write(qspi_req_write),
        .req_addr(qspi_addr), .req_device(qspi_device), .req_data(qspi_write_data),
        .read_data(qspi_read_data), .read_data_val(qspi_read_data_val),
        .sck(sck), .flash_sc_n(flash_cs), .psram_a_sc_n(ram_a_cs), .psram_b_sc_n(ram_b_cs),
        .dq_in({uio_in[5:4], uio_in[2:1]}), .dq_out(dq_out), .dq_oe(dq_oe)
    );

    // TinyQV Pmod order, preserved from the original wrapper.
    assign uio_out = {ram_b_cs, ram_a_cs, dq_out[3:2], sck, dq_out[1:0], flash_cs};
    assign uio_oe  = {2'b11, dq_oe[3:2], 1'b1, dq_oe[1:0], 1'b1};
    assign uo_out  = {3'b0, tx, 3'b0, decoder_rdy};
    wire _unused = &{ui_in[7:4], ui_in[2:0], uio_in[7:6], uio_in[3], uio_in[0], ena, 1'b0};
endmodule
`default_nettype wire
