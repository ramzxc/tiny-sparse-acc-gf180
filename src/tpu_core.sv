// TPU execution core.
//
// Responsibilities:
//   * Decode and dispatch 64-bit instructions with resource dependencies
//   * Connect the weight, VPU, activation, and element-wise VPU pipelines
//   * Connect DMA traffic to the weight, unified, and accumulation memories
module tpu_core
    import tpu_pkg::*;
#(
    parameter int COMPUTE_WIDTH                = 2,
    parameter int MAX_COLUMN_ROWS              = COMPUTE_WIDTH,
    parameter int WEIGHT_BUFFER_DEPTH          = 4,
    parameter int UNIFIED_BUFFER_DEPTH         = 4,
    parameter int REGISTER_DEPTH               = 4,
    parameter int WEIGHT_REQ_FIFO_DEPTH        = 4,
    parameter int VPU_META_FIFO_DEPTH          = 4,
    parameter int ACTIVATION_META_FIFO_DEPTH   = 4,
    parameter int WEIGHT_CTR_WIDTH =
        (COMPUTE_WIDTH > 1) ? $clog2(COMPUTE_WIDTH) : 1,
    
    // Weight Cache Parameters
    parameter int CACHE_LINES                  = 128,
    parameter int CACHE_WAY_COUNT              = 32,
    parameter repl_policy_e CACHE_POLICY       = POLICY_CUSTOM,
    parameter bit SPARSITY_EN                  = 1'b1
)(
    output psram_req_type [2:0] psram_req,
    output logic [2:0]          psram_req_valid,
    input  logic [2:0]          psram_req_ready,
    input  logic [2:0][31:0]    psram_rsp_data,
    input  logic [2:0]          psram_rsp_valid,

    input logic clk,
    input logic rst,

    input inst_type inst_port,
    input logic     inst_enable,

    // DMA status consumed by the instruction decoder.
    input logic dma_busy,
    input logic dma_weight_resource_busy,
    input logic dma_buffer_resource_busy,
    input logic dma_acc_resource_busy,

    // DMA command dispatched by the core decoder.
    output dram_inst_type dma_inst,
    output logic          dma_inst_enable,

    // DMA -> unified-buffer load-write path.
    input  buffer_addr_type              dma_buffer_write_addr,
    input  fp8_type [COMPUTE_WIDTH-1:0] dma_buffer_write_data,
    input  logic                         dma_buffer_write_valid,
    output logic                         dma_buffer_write_ready,

    // DMA -> unified-buffer store-read request/response path.
    input  buffer_addr_type              dma_buffer_read_req_addr,
    input  logic                         dma_buffer_read_req_valid,
    output logic                         dma_buffer_read_req_ready,
    output fp8_type [COMPUTE_WIDTH-1:0] dma_buffer_read_rsp_data,
    output logic                         dma_buffer_read_rsp_valid,
    input  logic                         dma_buffer_read_rsp_ready,

    // DMA -> weight-buffer load-write path.
    input  weight_addr_type              dma_weight_write_addr,
    input  fp8_type [COMPUTE_WIDTH-1:0] dma_weight_write_data,
    input  logic                         dma_weight_write_valid,
    output logic                         dma_weight_write_ready,

    // DMA -> accumulation-buffer store-read request/response.
    input  accumulator_addr_type         dma_acc_read_req_addr,
    input  logic                         dma_acc_read_req_valid,
    output logic                         dma_acc_read_req_ready,
    output fp16_type [COMPUTE_WIDTH-1:0] dma_acc_read_rsp_data,
    output logic                         dma_acc_read_rsp_valid,
    input  logic                         dma_acc_read_rsp_ready,

    // DMA -> accumulation-buffer restore-write path.
    input  accumulator_addr_type         dma_acc_write_addr,
    input  fp16_type [COMPUTE_WIDTH-1:0] dma_acc_write_data,
    input  logic                         dma_acc_write_valid,
    output logic                         dma_acc_write_ready,

    output logic busy,
    output logic synchronize
);

    // ---------------------------------------------------------------------
    // Sparse-Ctrl 
    // ---------------------------------------------------------------------
    logic            sparsity_en;

    // ---------------------------------------------------------------------
    // Weight buffer / Flow-ctrl -> VPU path
    // ---------------------------------------------------------------------

    fp8_type        sparse_vpu_input_data;
    logic            sparse_vpu_input_valid;
    logic            sparse_vpu_input_ready;

    logic            sparse_req_valid;
    logic            sparse_req_ready;
    buffer_addr_type sparse_req_addr;
    logic            sparse_rsp_data;
    logic            sparse_rsp_valid;

    logic            weight_req_valid;
    logic            weight_req_ready;
    weight_addr_type weight_req_addr;
    fp8_type [COMPUTE_WIDTH-1:0] weight_rsp_data;
    logic                         weight_rsp_valid;

    fp8_type [COMPUTE_WIDTH-1:0] vpu_weight_data;
    logic                         vpu_weight_valid;

    // ---------------------------------------------------------------------
    // Unified-buffer clients
    // ---------------------------------------------------------------------

    buffer_addr_type              vpu_buffer_req_addr;
    logic                         vpu_buffer_req_valid;
    logic                         vpu_buffer_req_ready;
    fp8_type [COMPUTE_WIDTH-1:0] vpu_buffer_rsp_data;
    logic                         vpu_buffer_rsp_valid;
    logic                         vpu_buffer_rsp_ready;

    buffer_addr_type              sparse_buffer_req_addr;
    logic                         sparse_buffer_req_valid;
    logic                         sparse_buffer_req_ready;
    fp8_type                     sparse_buffer_rsp_data;
    logic                         sparse_buffer_rsp_valid;
    logic                         sparse_buffer_rsp_ready;

    buffer_addr_type              weight_buffer_req_addr;
    logic                         weight_buffer_req_valid;
    logic                         weight_buffer_req_ready;
    fp8_type [COMPUTE_WIDTH-1:0] weight_buffer_rsp_data;
    logic                         weight_buffer_rsp_valid;
    logic                         weight_buffer_rsp_ready;

    buffer_addr_type              activation_buffer_write_addr;
    fp8_type [COMPUTE_WIDTH-1:0] activation_buffer_write_data;
    logic                         activation_buffer_write_valid;
    logic                         activation_buffer_write_ready;

    // ---------------------------------------------------------------------
    // VPU datapath
    // ---------------------------------------------------------------------

    fp8_type [COMPUTE_WIDTH-1:0] input_data;
    logic                         input_valid;
    fp8_type [COMPUTE_WIDTH-1:0] last_sum_data;
    logic                         last_sum_valid;

    fp8_type [COMPUTE_WIDTH-1:0] vpu_result_data;
    logic                         vpu_result_valid;

    fp8_type [COMPUTE_WIDTH-1:0] vpu_acc_write_data;
    accumulator_addr_type         vpu_acc_write_addr;
    logic                         vpu_acc_write_valid;
    logic                         vpu_acc_accumulate;

    // ---------------------------------------------------------------------
    // Physical accumulation-buffer write port arbitration
    // ---------------------------------------------------------------------

    fp16_type [COMPUTE_WIDTH-1:0] acc_buf_write_data;
    accumulator_addr_type         acc_buf_write_addr;
    logic                         acc_buf_write_en;
    logic                         acc_buf_accumulate;

    accumulator_addr_type         acc_buf_read_req_addr;
    logic                         acc_buf_read_req_valid;
    logic                         acc_buf_read_req_ready;
    fp16_type [COMPUTE_WIDTH-1:0] acc_buf_read_rsp_data;
    logic                         acc_buf_read_rsp_valid;
    logic                         acc_buf_read_rsp_ready;

    accumulator_addr_type         activation_acc_req_addr;
    logic                         activation_acc_req_valid;
    logic                         activation_acc_req_ready;
    fp8_type [COMPUTE_WIDTH-1:0]  activation_acc_rsp_data;
    logic                         activation_acc_rsp_valid;
    logic                         activation_acc_rsp_ready;

    fp8_type [COMPUTE_WIDTH-1:0]  activation_input_data;
    logic                         activation_input_valid;
    logic                         activation_input_ready;
    activation_type               activation_input_function;

    fp8_type [COMPUTE_WIDTH-1:0]  activation_output_data;
    logic                         activation_output_valid;
    logic                         activation_output_ready;

    // ---------------------------------------------------------------------
    // Instruction dispatch and resource state
    // ---------------------------------------------------------------------

    inst_type          dispatch_inst;
    weight_inst_type   dispatch_weight_inst;
    input_inst_type    dispatch_input_inst;
    vpu_inst_type      dispatch_vpu_inst;
    dram_inst_type     dispatch_dram_inst;
    activate_inst_type dispatch_activate_inst;

    logic dispatch_weight_en;
    logic dispatch_input_en;
    logic dispatch_vpu_en;
    logic dispatch_activation_en;
    logic dispatch_dma_en;

    logic weight_busy;
    logic weight_resource_busy;
    logic input_busy;
    logic input_resource_busy;
    logic input_read_busy;
    logic vpu_busy;
    logic vpu_resource_busy;
    logic acc_buf_write_ready;
    logic acc_buf_busy;
    logic activation_busy;
    logic activation_resource_busy;

    assign dispatch_weight_inst   = weight_inst_type'(dispatch_inst);
    assign dispatch_input_inst    = input_inst_type'(dispatch_inst);
    assign dispatch_vpu_inst      = vpu_inst_type'(dispatch_inst);
    assign dispatch_dram_inst     = dram_inst_type'(dispatch_inst);
    assign dispatch_activate_inst = activate_inst_type'(dispatch_inst);

    assign dma_inst        = dispatch_dram_inst;
    assign dma_inst_enable = dispatch_dma_en;
    assign sparsity_en     = SPARSITY_EN;

    // ---------------------------------------------------------------------
    // Decoder
    // ---------------------------------------------------------------------

    inst_decoder decoder (
        .clk                         (clk),
        .rst                         (rst),
        .inst_in                     (inst_port),
        .inst_write                  (inst_enable),
        .decoder_busy                (busy),
        .weight_busy                 (weight_busy),
        .weight_resource_busy        (weight_resource_busy),
        .input_busy                  (input_busy),
        .input_resource_busy         (input_resource_busy),
        .input_read_busy             (input_read_busy),
        .vpu_busy                    (vpu_busy),
        .vpu_resource_busy           (vpu_resource_busy || acc_buf_busy),
        .activation_busy             (activation_busy),
        .activation_resource_busy    (activation_resource_busy),
        .dma_busy                    (dma_busy),
        .dma_weight_resource_busy    (dma_weight_resource_busy),
        .dma_buffer_resource_busy    (dma_buffer_resource_busy),
        .dma_acc_resource_busy       (dma_acc_resource_busy),
        .dispatch_inst               (dispatch_inst),
        .dispatch_weight_en          (dispatch_weight_en),
        .dispatch_input_en           (dispatch_input_en),
        .dispatch_vpu_en             (dispatch_vpu_en),
        .dispatch_activation_en      (dispatch_activation_en),
        .dispatch_dma_en             (dispatch_dma_en),
        .synchronize                 (synchronize)
    );

    // ---------------------------------------------------------------------
    // Weight load controller, Sparsity Controller, and Weight Cache
    // ---------------------------------------------------------------------

    sparsity_ctrl sparsity_flow_controller (
        .clk                   (clk),
        .rst                   (rst),
        .input_inst            (dispatch_input_inst),
        .input_inst_enable     (dispatch_input_en),
        .busy                  (input_busy),
        .resource_busy         (input_resource_busy),
        .read_busy             (input_read_busy),
        .vpu_input_data        (sparse_vpu_input_data),
        .vpu_input_valid       (sparse_vpu_input_valid),
        .vpu_input_ready       (sparse_vpu_input_ready),
        .sparse_req_valid      (sparse_req_valid),
        .sparse_req_ready      (sparse_req_ready),
        .sparse_rsp_data       (sparse_rsp_data),
        .sparse_rsp_valid      (sparse_rsp_valid),
        .input_read_req_addr   (sparse_buffer_req_addr),
        .input_read_req_valid  (sparse_buffer_req_valid),
        .input_read_req_ready  (sparse_buffer_req_ready),
        .input_read_rsp_data   (sparse_buffer_rsp_data),
        .input_read_rsp_valid  (sparse_buffer_rsp_valid),
        .input_read_rsp_ready  (sparse_buffer_rsp_ready),
        .sparsity_en           (sparsity_en)
    );

    weight_load_ctrl #(
        .COMPUTE_WIDTH   (COMPUTE_WIDTH),
        .REQ_FIFO_DEPTH  (WEIGHT_REQ_FIFO_DEPTH)
    ) weight_flow_controller (
        .clk               (clk),
        .rst               (rst),
        .weight_inst       (dispatch_weight_inst),
        .weight_inst_enable(dispatch_weight_en),
        .busy              (weight_busy),
        .resource_busy     (weight_resource_busy),
        .sparse_req_valid  (sparse_req_valid),
        .sparse_req_ready  (sparse_req_ready),
        .sparse_rsp_data   (sparse_rsp_data),
        .sparse_rsp_valid  (sparse_rsp_valid),
        .weight_req_valid  (weight_req_valid),
        .weight_req_ready  (weight_req_ready),
        .weight_req_addr   (weight_req_addr),
        .weight_rsp_data   (weight_rsp_data),
        .weight_rsp_valid  (weight_rsp_valid),
        .unified_req_addr  (weight_buffer_req_addr),
        .unified_req_valid (weight_buffer_req_valid),
        .unified_req_ready (weight_buffer_req_ready),
        .unified_rsp_data  (weight_buffer_rsp_data),
        .unified_rsp_valid (weight_buffer_rsp_valid),
        .unified_rsp_ready (weight_buffer_rsp_ready),
        .vpu_weight_data   (vpu_weight_data),
        .vpu_weight_valid  (vpu_weight_valid)
    );

    // =====================================================================
    // 32-Way Ultra-Low Power Sequential Weight Cache (Dynamic Multi-Row Burst Fill)
    // =====================================================================
    weight_buffer #(
        .COMPUTE_WIDTH (COMPUTE_WIDTH),
        .DEPTH        (WEIGHT_BUFFER_DEPTH)
    ) weight_buffer_core (
        .psram_req       (psram_req[0]),
        .psram_req_valid (psram_req_valid[0]),
        .psram_req_ready (psram_req_ready[0]),
        .psram_rsp_data  (psram_rsp_data[0]),
        .psram_rsp_valid (psram_rsp_valid[0]),

        .clk              (clk),
        .rst              (rst),
        .read_req_addr    (weight_req_addr),
        .read_req_valid   (weight_req_valid),
        .read_req_ready   (weight_req_ready),
        .read_rsp_data    (weight_rsp_data),
        .read_rsp_valid   (weight_rsp_valid),
        .load_write_addr  (dma_weight_write_addr),
        .load_write_data  (dma_weight_write_data),
        .load_write_valid (dma_weight_write_valid),
        .load_write_ready (dma_weight_write_ready)
    );

    // ---------------------------------------------------------------------
    // Unified buffer
    // ---------------------------------------------------------------------

    unified_buffer #(
        .COMPUTE_WIDTH (COMPUTE_WIDTH),
        .DEPTH         (UNIFIED_BUFFER_DEPTH)
    ) unified_buffer_core (
        .psram_req       (psram_req[1]),
        .psram_req_valid (psram_req_valid[1]),
        .psram_req_ready (psram_req_ready[1]),
        .psram_rsp_data  (psram_rsp_data[1]),
        .psram_rsp_valid (psram_rsp_valid[1]),

        .clk                   (clk),
        .rst                   (rst),
        .vpu_read_req_addr     (vpu_buffer_req_addr),
        .vpu_read_req_valid    (vpu_buffer_req_valid),
        .vpu_read_req_ready    (vpu_buffer_req_ready),
        .vpu_read_rsp_data     (vpu_buffer_rsp_data),
        .vpu_read_rsp_valid    (vpu_buffer_rsp_valid),
        .vpu_read_rsp_ready    (vpu_buffer_rsp_ready),
        .weight_read_req_addr  (weight_buffer_req_addr),
        .weight_read_req_valid (weight_buffer_req_valid),
        .weight_read_req_ready (weight_buffer_req_ready),
        .weight_read_rsp_data  (weight_buffer_rsp_data),
        .weight_read_rsp_valid (weight_buffer_rsp_valid),
        .weight_read_rsp_ready (weight_buffer_rsp_ready),
        .sparse_read_req_addr  (sparse_buffer_req_addr),
        .sparse_read_req_valid (sparse_buffer_req_valid),
        .sparse_read_req_ready (sparse_buffer_req_ready),
        .sparse_read_rsp_data  (sparse_buffer_rsp_data),
        .sparse_read_rsp_valid (sparse_buffer_rsp_valid),
        .sparse_read_rsp_ready (sparse_buffer_rsp_ready),
        .store_read_req_addr   (dma_buffer_read_req_addr),
        .store_read_req_valid  (dma_buffer_read_req_valid),
        .store_read_req_ready  (dma_buffer_read_req_ready),
        .store_read_rsp_data   (dma_buffer_read_rsp_data),
        .store_read_rsp_valid  (dma_buffer_read_rsp_valid),
        .store_read_rsp_ready  (dma_buffer_read_rsp_ready),
        .activation_write_addr (activation_buffer_write_addr),
        .activation_write_data (activation_buffer_write_data),
        .activation_write_valid(activation_buffer_write_valid),
        .activation_write_ready(activation_buffer_write_ready),
        .load_write_addr       (dma_buffer_write_addr),
        .load_write_data       (dma_buffer_write_data),
        .load_write_valid      (dma_buffer_write_valid),
        .load_write_ready      (dma_buffer_write_ready)
    );

    // ---------------------------------------------------------------------
    // VPU execution path
    // ---------------------------------------------------------------------

    vpu_ctrl #(
        .COMPUTE_WIDTH   (COMPUTE_WIDTH),
        .META_FIFO_DEPTH (VPU_META_FIFO_DEPTH)
    ) vpu_flow_controller (
        .clk                 (clk),
        .rst                 (rst),
        .inst                (dispatch_vpu_inst),
        .inst_enable         (dispatch_vpu_en),
        .buffer_req_addr     (vpu_buffer_req_addr),
        .buffer_req_valid    (vpu_buffer_req_valid),
        .buffer_req_ready    (vpu_buffer_req_ready),
        .buffer_rsp_data     (vpu_buffer_rsp_data),
        .buffer_rsp_valid    (vpu_buffer_rsp_valid),
        .buffer_rsp_ready    (vpu_buffer_rsp_ready),
        .sparse_input_data   (sparse_vpu_input_data),
        .sparse_input_valid  (sparse_vpu_input_valid),
        .sparse_input_ready  (sparse_vpu_input_ready),
        .sparsity_en         (sparsity_en),
        .input_data          (input_data),
        .input_data_valid    (input_valid),
        .last_sum_data       (last_sum_data),
        .last_sum_valid      (last_sum_valid),
        .vpu_result_data     (vpu_result_data),
        .vpu_result_valid    (vpu_result_valid),
        .acc_data            (vpu_acc_write_data),
        .acc_addr            (vpu_acc_write_addr),
        .accumulate          (vpu_acc_accumulate),
        .acc_enable          (vpu_acc_write_valid),
        .acc_ready           (acc_buf_write_ready),
        .busy                (vpu_busy),
        .resource_busy       (vpu_resource_busy)
    );

    vpu #(
        .COMPUTE_WIDTH     (COMPUTE_WIDTH)
    ) vpu_core (
        .clk             (clk),
        .rst             (rst),
        .weight_data     (vpu_weight_data),
        .load_weight     (vpu_weight_valid),
        .input_data      (input_data),
        .input_valid     (input_valid),
        .last_sum_data   (last_sum_data),
        .last_sum_valid  (last_sum_valid),
        .result          (vpu_result_data),
        .result_valid    (vpu_result_valid)
    );

    // ---------------------------------------------------------------------
    // Accumulation-buffer write arbitration
    // ---------------------------------------------------------------------
    assign dma_acc_write_ready = !vpu_acc_write_valid && acc_buf_write_ready;

    always_comb begin
        acc_buf_write_addr = vpu_acc_write_addr;
        for (int lane = 0; lane < COMPUTE_WIDTH; lane++)
            acc_buf_write_data[lane] = fp8_to_fp16(vpu_acc_write_data[lane]);
        acc_buf_write_en   = vpu_acc_write_valid;
        acc_buf_accumulate = vpu_acc_accumulate;

        if (!vpu_acc_write_valid && dma_acc_write_valid) begin
            acc_buf_write_addr = dma_acc_write_addr;
            acc_buf_write_data = dma_acc_write_data;
            acc_buf_write_en   = 1'b1;
            acc_buf_accumulate = 1'b0;
        end
    end

    assign acc_buf_read_req_addr = dma_acc_resource_busy
        ? dma_acc_read_req_addr : activation_acc_req_addr;
    assign acc_buf_read_req_valid = dma_acc_resource_busy
        ? dma_acc_read_req_valid : activation_acc_req_valid;
    assign acc_buf_read_rsp_ready = dma_acc_resource_busy
        ? dma_acc_read_rsp_ready : activation_acc_rsp_ready;

    assign activation_acc_req_ready =
        !dma_acc_resource_busy && acc_buf_read_req_ready;
    assign dma_acc_read_req_ready =
        dma_acc_resource_busy && acc_buf_read_req_ready;

    for (genvar lane = 0; lane < COMPUTE_WIDTH; lane++) begin : activation_read_convert
        assign activation_acc_rsp_data[lane] = fp16_to_fp8(acc_buf_read_rsp_data[lane]);
    end
    assign dma_acc_read_rsp_data    = acc_buf_read_rsp_data;
    assign activation_acc_rsp_valid =
        acc_buf_read_rsp_valid && activation_resource_busy;
    assign dma_acc_read_rsp_valid =
        acc_buf_read_rsp_valid && dma_acc_resource_busy;

    accumulation_buffer #(
        .COMPUTE_WIDTH   (COMPUTE_WIDTH),
        .REGISTER_DEPTH  (REGISTER_DEPTH)
    ) accumulation_buffer (
        .psram_req       (psram_req[2]),
        .psram_req_valid (psram_req_valid[2]),
        .psram_req_ready (psram_req_ready[2]),
        .psram_rsp_data  (psram_rsp_data[2]),
        .psram_rsp_valid (psram_rsp_valid[2]),

        .clk                  (clk),
        .rst                  (rst),
        .write_addr           (acc_buf_write_addr),
        .data_in              (acc_buf_write_data),
        .write_enable         (acc_buf_write_en),
        .write_ready          (acc_buf_write_ready),
        .busy                 (acc_buf_busy),
        .accumulate           (acc_buf_accumulate),
        .read_req_addr        (acc_buf_read_req_addr),
        .read_req_valid       (acc_buf_read_req_valid),
        .read_req_ready       (acc_buf_read_req_ready),
        .read_rsp_data        (acc_buf_read_rsp_data),
        .read_rsp_valid       (acc_buf_read_rsp_valid),
        .read_rsp_ready       (acc_buf_read_rsp_ready)
    );

    // ---------------------------------------------------------------------
    // Activation path
    // ---------------------------------------------------------------------

    activation_ctrl #(
        .COMPUTE_WIDTH   (COMPUTE_WIDTH),
        .META_FIFO_DEPTH (ACTIVATION_META_FIFO_DEPTH)
    ) activation_flow_controller (
        .clk                    (clk),
        .rst                    (rst),
        .inst                   (dispatch_activate_inst),
        .inst_enable            (dispatch_activation_en),
        .acc_req_addr           (activation_acc_req_addr),
        .acc_req_valid          (activation_acc_req_valid),
        .acc_req_ready          (activation_acc_req_ready),
        .acc_rsp_data           (activation_acc_rsp_data),
        .acc_rsp_valid          (activation_acc_rsp_valid),
        .acc_rsp_ready          (activation_acc_rsp_ready),
        .activation_data        (activation_input_data),
        .activation_data_valid  (activation_input_valid),
        .activation_data_ready  (activation_input_ready),
        .activation_function    (activation_input_function),
        .activation_rsp_data    (activation_output_data),
        .activation_rsp_valid   (activation_output_valid),
        .activation_rsp_ready   (activation_output_ready),
        .buffer_write_addr      (activation_buffer_write_addr),
        .buffer_write_data      (activation_buffer_write_data),
        .buffer_write_valid     (activation_buffer_write_valid),
        .buffer_write_ready     (activation_buffer_write_ready),
        .busy                   (activation_busy),
        .resource_busy          (activation_resource_busy)
    );

    activation #(
        .COMPUTE_WIDTH (COMPUTE_WIDTH)
    ) activation_core (
        .clk                 (clk),
        .rst                 (rst),
        .data_in             (activation_input_data),
        .data_in_valid       (activation_input_valid),
        .data_in_ready       (activation_input_ready),
        .activation_function (activation_input_function),
        .data_out            (activation_output_data),
        .data_out_valid      (activation_output_valid),
        .data_out_ready      (activation_output_ready)
    );

endmodule
