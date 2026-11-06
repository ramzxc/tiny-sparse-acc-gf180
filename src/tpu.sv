// TPU system top level.
//
// Responsibilities:
//   * Queue 64-bit host instructions
//   * Connect the instruction core to the DMA and local memories (with Multi-Row Burst Weight Cache Refill)
//   * Expose tensor-memory traffic through a QSPI NOR Flash interface
module tpu
    import tpu_pkg::*;
#(
    parameter int COMPUTE_WIDTH          = 2,
    parameter int WEIGHT_BUFFER_DEPTH    = 4,
    parameter int UNIFIED_BUFFER_DEPTH   = 4,
    parameter int AXI_DATA_BYTES         = 8,
    parameter int AXI_ID_WIDTH           = 4,
    parameter int REGISTER_DEPTH         = 4,
    parameter int INST_FIFO_DEPTH        = 4
)(
    input logic clk,rst,
    input inst_type inst_word,
    input logic inst_write_enable,
    output logic inst_fifo_empty,inst_fifo_full,
    output logic synchronize,
    output logic flash_available,flash_busy,flash_error,
    output logic [2:0] flash_error_code,
    input logic [3:0] qspi_dq_in,
    output logic [3:0] qspi_dq_out,qspi_dq_oe,
    output logic qspi_sck,qspi_cs_n,psram_cs_n
);

    psram_req_type [2:0] psram_req;
    logic [2:0] psram_req_valid, psram_req_ready, psram_rsp_valid;
    logic [2:0][31:0] psram_rsp_data;

    // ------------------------------------------------------------------
    // Instruction FIFO -> TPU core
    // ------------------------------------------------------------------

    inst_type inst;
    logic inst_pop;
    logic core_busy;

    // ------------------------------------------------------------------
    // TPU core <-> DMA command/status interface
    // ------------------------------------------------------------------

    dram_inst_type dma_inst;
    logic          dma_inst_enable;
    logic dma_busy;
    logic dma_weight_resource_busy;
    logic dma_buffer_resource_busy;
    logic dma_acc_resource_busy;

    // ------------------------------------------------------------------
    // DMA <-> local memories inside TPU core (UB & ACC)
    // ------------------------------------------------------------------
    
    weight_addr_type              dma_weight_write_addr;
    fp8_type [COMPUTE_WIDTH-1:0] dma_weight_write_data;
    logic                         dma_weight_write_valid;
    logic                         dma_weight_write_ready;

    buffer_addr_type              dma_buffer_write_addr;
    fp8_type [COMPUTE_WIDTH-1:0] dma_buffer_write_data;
    logic                         dma_buffer_write_valid;
    logic                         dma_buffer_write_ready;

    buffer_addr_type              dma_buffer_read_req_addr;
    logic                         dma_buffer_read_req_valid;
    logic                         dma_buffer_read_req_ready;
    fp8_type [COMPUTE_WIDTH-1:0] dma_buffer_read_rsp_data;
    logic                         dma_buffer_read_rsp_valid;
    logic                         dma_buffer_read_rsp_ready;

    accumulator_addr_type         dma_acc_read_req_addr;
    logic                         dma_acc_read_req_valid;
    logic                         dma_acc_read_req_ready;
    fp16_type [COMPUTE_WIDTH-1:0] dma_acc_read_rsp_data;
    logic                         dma_acc_read_rsp_valid;
    logic                         dma_acc_read_rsp_ready;

    accumulator_addr_type         dma_acc_write_addr;
    fp16_type [COMPUTE_WIDTH-1:0] dma_acc_write_data;
    logic                         dma_acc_write_valid;
    logic                         dma_acc_write_ready;

    // ------------------------------------------------------------------
    // DMA <-> AXI adapter channels
    // ------------------------------------------------------------------

    dram_addr_type                            dma_read_cmd_addr;
    logic [7:0]                               dma_read_cmd_len;
    logic                                     dma_read_cmd_valid;
    logic                                     dma_read_cmd_ready;
    logic [AXI_DATA_BYTES*BYTE_WIDTH-1:0]     dma_read_data;
    logic                                     dma_read_data_last;
    logic                                     dma_read_data_valid;
    logic                                     dma_read_data_ready;

    dram_addr_type                            dma_write_cmd_addr;
    logic [7:0]                               dma_write_cmd_len;
    logic                                     dma_write_cmd_valid;
    logic                                     dma_write_cmd_ready;
    logic [AXI_DATA_BYTES*BYTE_WIDTH-1:0]     dma_write_data;
    logic [AXI_DATA_BYTES-1:0]                 dma_write_strb;
    logic                                     dma_write_data_last;
    logic                                     dma_write_data_valid;
    logic                                     dma_write_data_ready;
    logic                                     dma_write_rsp_valid;
    logic                                     dma_write_rsp_ready;

    // ------------------------------------------------------------------
    // Instruction queue
    // ------------------------------------------------------------------

    inst_fifo #(
        .FIFO_DEPTH (INST_FIFO_DEPTH)
    ) instruction_fifo (
        .clk        (clk),
        .rst        (rst),
        .word       (inst_word),
        .write_en   (inst_write_enable),
        .core_busy  (core_busy),
        .data_out   (inst),
        .inst_pop   (inst_pop),
        .empty      (inst_fifo_empty),
        .full       (inst_fifo_full)
    );

    // ------------------------------------------------------------------
    // TPU Core (with Multi-Row Burst Weight Cache)
    // ------------------------------------------------------------------

    tpu_core #(
        .COMPUTE_WIDTH         (COMPUTE_WIDTH),
        .WEIGHT_BUFFER_DEPTH   (WEIGHT_BUFFER_DEPTH),
        .UNIFIED_BUFFER_DEPTH  (UNIFIED_BUFFER_DEPTH),
        .REGISTER_DEPTH        (REGISTER_DEPTH)
    ) tpu_core_tpu (
        .psram_req       (psram_req),
        .psram_req_valid (psram_req_valid),
        .psram_req_ready (psram_req_ready),
        .psram_rsp_data  (psram_rsp_data),
        .psram_rsp_valid (psram_rsp_valid),

        .clk                          (clk),
        .rst                          (rst),
        .inst_port                    (inst),
        .inst_enable                  (inst_pop),
        .dma_busy                     (dma_busy),
        .dma_weight_resource_busy     (dma_weight_resource_busy),
        .dma_buffer_resource_busy     (dma_buffer_resource_busy),
        .dma_acc_resource_busy        (dma_acc_resource_busy),
        .dma_inst                     (dma_inst),
        .dma_inst_enable              (dma_inst_enable),

        // Weight Buffer Ports
        .dma_weight_write_addr        (dma_weight_write_addr),
        .dma_weight_write_data        (dma_weight_write_data),
        .dma_weight_write_valid       (dma_weight_write_valid),
        .dma_weight_write_ready       (dma_weight_write_ready),

        // Unified Buffer Ports
        .dma_buffer_write_addr        (dma_buffer_write_addr),
        .dma_buffer_write_data        (dma_buffer_write_data),
        .dma_buffer_write_valid       (dma_buffer_write_valid),
        .dma_buffer_write_ready       (dma_buffer_write_ready),
        .dma_buffer_read_req_addr     (dma_buffer_read_req_addr),
        .dma_buffer_read_req_valid    (dma_buffer_read_req_valid),
        .dma_buffer_read_req_ready    (dma_buffer_read_req_ready),
        .dma_buffer_read_rsp_data     (dma_buffer_read_rsp_data),
        .dma_buffer_read_rsp_valid    (dma_buffer_read_rsp_valid),
        .dma_buffer_read_rsp_ready    (dma_buffer_read_rsp_ready),

        // Accumulation Buffer Ports
        .dma_acc_read_req_addr        (dma_acc_read_req_addr),
        .dma_acc_read_req_valid       (dma_acc_read_req_valid),
        .dma_acc_read_req_ready       (dma_acc_read_req_ready),
        .dma_acc_read_rsp_data        (dma_acc_read_rsp_data),
        .dma_acc_read_rsp_valid       (dma_acc_read_rsp_valid),
        .dma_acc_read_rsp_ready       (dma_acc_read_rsp_ready),
        .dma_acc_write_addr           (dma_acc_write_addr),
        .dma_acc_write_data           (dma_acc_write_data),
        .dma_acc_write_valid          (dma_acc_write_valid),
        .dma_acc_write_ready          (dma_acc_write_ready),

        .busy                         (core_busy),
        .synchronize                  (synchronize)
    );

    // ------------------------------------------------------------------
    // DMA Engine
    // ------------------------------------------------------------------

    dma #(
        .COMPUTE_WIDTH   (COMPUTE_WIDTH),
        .DRAM_DATA_BYTES (AXI_DATA_BYTES)
    ) dma_engine (
        .clk                   (clk),
        .rst                   (rst),
        .inst                  (dma_inst),
        .inst_enable           (dma_inst_enable),
        .busy                  (dma_busy),
        .weight_resource_busy  (dma_weight_resource_busy),
        .buffer_resource_busy  (dma_buffer_resource_busy),
        .acc_resource_busy     (dma_acc_resource_busy),

        // DRAM AXI Channels
        .dram_read_cmd_addr    (dma_read_cmd_addr),
        .dram_read_cmd_len     (dma_read_cmd_len),
        .dram_read_cmd_valid   (dma_read_cmd_valid),
        .dram_read_cmd_ready   (dma_read_cmd_ready),
        .dram_read_data        (dma_read_data),
        .dram_read_data_last   (dma_read_data_last),
        .dram_read_data_valid  (dma_read_data_valid),
        .dram_read_data_ready  (dma_read_data_ready),
        .dram_write_cmd_addr   (dma_write_cmd_addr),
        .dram_write_cmd_len    (dma_write_cmd_len),
        .dram_write_cmd_valid  (dma_write_cmd_valid),
        .dram_write_cmd_ready  (dma_write_cmd_ready),
        .dram_write_data       (dma_write_data),
        .dram_write_strb       (dma_write_strb),
        .dram_write_data_last  (dma_write_data_last),
        .dram_write_data_valid (dma_write_data_valid),
        .dram_write_data_ready (dma_write_data_ready),
        .dram_write_rsp_valid  (dma_write_rsp_valid),
        .dram_write_rsp_ready  (dma_write_rsp_ready),

        // Buffer & Accumulator Ports
        .weight_write_addr     (dma_weight_write_addr),
        .weight_write_data     (dma_weight_write_data),
        .weight_write_valid    (dma_weight_write_valid),
        .weight_write_ready    (dma_weight_write_ready),
        .buffer_write_addr     (dma_buffer_write_addr),
        .buffer_write_data     (dma_buffer_write_data),
        .buffer_write_valid    (dma_buffer_write_valid),
        .buffer_write_ready    (dma_buffer_write_ready),
        .buffer_read_req_addr  (dma_buffer_read_req_addr),
        .buffer_read_req_valid (dma_buffer_read_req_valid),
        .buffer_read_req_ready (dma_buffer_read_req_ready),
        .buffer_read_rsp_data  (dma_buffer_read_rsp_data),
        .buffer_read_rsp_valid (dma_buffer_read_rsp_valid),
        .buffer_read_rsp_ready (dma_buffer_read_rsp_ready),
        .acc_read_req_addr     (dma_acc_read_req_addr),
        .acc_read_req_valid    (dma_acc_read_req_valid),
        .acc_read_req_ready    (dma_acc_read_req_ready),
        .acc_read_rsp_data     (dma_acc_read_rsp_data),
        .acc_read_rsp_valid    (dma_acc_read_rsp_valid),
        .acc_read_rsp_ready    (dma_acc_read_rsp_ready),
        .acc_write_addr        (dma_acc_write_addr),
        .acc_write_data        (dma_acc_write_data),
        .acc_write_valid       (dma_acc_write_valid),
        .acc_write_ready       (dma_acc_write_ready)
    );

    // ------------------------------------------------------------------
    // Shared Flash / PSRAM bus
    // ------------------------------------------------------------------

    qspi_memory_bus memory_bus (
        .psram_req       (psram_req),
        .psram_req_valid (psram_req_valid),
        .psram_req_ready (psram_req_ready),
        .psram_rsp_data  (psram_rsp_data),
        .psram_rsp_valid (psram_rsp_valid),
        .psram_cs_n      (psram_cs_n),
        .clk                  (clk),
        .rst                  (rst),
        .dma_read_cmd_addr    (dma_read_cmd_addr),
        .dma_read_cmd_len     (dma_read_cmd_len),
        .dma_read_cmd_valid   (dma_read_cmd_valid),
        .dma_read_cmd_ready   (dma_read_cmd_ready),
        .dma_read_data        (dma_read_data),
        .dma_read_data_last   (dma_read_data_last),
        .dma_read_data_valid  (dma_read_data_valid),
        .dma_read_data_ready  (dma_read_data_ready),
        .dma_write_cmd_addr   (dma_write_cmd_addr),
        .dma_write_cmd_len    (dma_write_cmd_len),
        .dma_write_cmd_valid  (dma_write_cmd_valid),
        .dma_write_cmd_ready  (dma_write_cmd_ready),
        .dma_write_data       (dma_write_data),
        .dma_write_strb       (dma_write_strb),
        .dma_write_data_last  (dma_write_data_last),
        .dma_write_data_valid (dma_write_data_valid),
        .dma_write_data_ready (dma_write_data_ready),
        .dma_write_rsp_valid  (dma_write_rsp_valid),
        .dma_write_rsp_ready  (dma_write_rsp_ready),
        .available            (flash_available),
        .busy                 (flash_busy),
        .error                (flash_error),
        .error_code           (flash_error_code),
        .qspi_dq_in           (qspi_dq_in),
        .qspi_dq_out          (qspi_dq_out),
        .qspi_dq_oe           (qspi_dq_oe),
        .qspi_sck             (qspi_sck),
        .qspi_cs_n            (qspi_cs_n)
    );
`ifndef SYNTHESIS
    initial assert(AXI_DATA_BYTES==8) else $fatal(1,"Flash adapter requires 64-bit DMA beats");
`endif
endmodule
