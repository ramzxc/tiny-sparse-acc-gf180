// Weight buffer: read and DMA write requests share one PSRAM row interface.
module weight_buffer
    import tpu_pkg::*;
#(
    parameter int COMPUTE_WIDTH = 2,
    parameter int DEPTH         = 4
)(
    output psram_req_type psram_req,
    output logic          psram_req_valid,
    input  logic          psram_req_ready,
    input  logic [31:0]   psram_rsp_data,
    input  logic          psram_rsp_valid,

    input logic clk,
    input logic rst,

    input  weight_addr_type              read_req_addr,
    input  logic                         read_req_valid,
    output logic                         read_req_ready,

    output fp8_type [COMPUTE_WIDTH-1:0] read_rsp_data,
    output logic                         read_rsp_valid,

    // DMA full-row write port.
    input  weight_addr_type              load_write_addr,
    input  fp8_type [COMPUTE_WIDTH-1:0] load_write_data,
    input  logic                         load_write_valid,
    output logic                         load_write_ready
);

    psram_buffer_ctrl #(
        .BASE_ADDR(24'h000000),
        .DATA_WIDTH(COMPUTE_WIDTH * FP8_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(WEIGHT_ADDR_WIDTH)
    ) memory (
        .psram_req       (psram_req),
        .psram_req_valid (psram_req_valid),
        .psram_req_ready (psram_req_ready),
        .psram_rsp_data  (psram_rsp_data),
        .psram_rsp_valid (psram_rsp_valid),

        .clk(clk),
        .rst(rst),
        .read_req_addr(read_req_addr),
        .read_req_valid(read_req_valid),
        .read_req_ready(read_req_ready),
        .read_rsp_data(read_rsp_data),
        .read_rsp_valid(read_rsp_valid),
        .read_rsp_ready(1'b1),
        .write_addr(load_write_addr),
        .write_data(load_write_data),
        .write_valid(load_write_valid),
        .write_ready(load_write_ready),
        .write_done(),
        .busy()
    );
`ifndef SYNTHESIS
    initial assert (COMPUTE_WIDTH * FP8_WIDTH == 16)
        else $fatal(1, "weight_buffer requires 16-bit rows");
`endif
endmodule
