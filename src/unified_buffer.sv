// Unified FP8 row buffer.
// The instruction decoder guarantees that at most
// one internal reader and one internal writer are active at a time.

module unified_buffer
    import tpu_pkg::*;
#(
    parameter int COMPUTE_WIDTH = 2,
    parameter int DEPTH         = 4
)(
    input logic clk,
    input logic rst,

    // -------------------------------------------------------------------------
    // VPU read request/response
    // -------------------------------------------------------------------------
    input  buffer_addr_type              vpu_read_req_addr,
    input  logic                         vpu_read_req_valid,
    output logic                         vpu_read_req_ready,

    output fp8_type [COMPUTE_WIDTH-1:0] vpu_read_rsp_data,
    output logic                         vpu_read_rsp_valid,
    input  logic                         vpu_read_rsp_ready,

    // -------------------------------------------------------------------------
    // Weight-load controller read request/response
    // -------------------------------------------------------------------------
    input  buffer_addr_type              weight_read_req_addr,
    input  logic                         weight_read_req_valid,
    output logic                         weight_read_req_ready,

    output fp8_type [COMPUTE_WIDTH-1:0] weight_read_rsp_data,
    output logic                         weight_read_rsp_valid,
    input  logic                         weight_read_rsp_ready,

    // -------------------------------------------------------------------------
    // Sparse controller read request/response
    // Scalar only
    // -------------------------------------------------------------------------
    input  buffer_addr_type              sparse_read_req_addr,
    input  logic                         sparse_read_req_valid,
    output logic                         sparse_read_req_ready,

    output fp8_type                     sparse_read_rsp_data,
    output logic                         sparse_read_rsp_valid,
    input  logic                         sparse_read_rsp_ready,

    // -------------------------------------------------------------------------
    // DMA DRAM-store read request/response
    // -------------------------------------------------------------------------
    input  buffer_addr_type              store_read_req_addr,
    input  logic                         store_read_req_valid,
    output logic                         store_read_req_ready,

    output fp8_type [COMPUTE_WIDTH-1:0] store_read_rsp_data,
    output logic                         store_read_rsp_valid,
    input  logic                         store_read_rsp_ready,

    // -------------------------------------------------------------------------
    // Activation-output write request
    // -------------------------------------------------------------------------
    input  buffer_addr_type              activation_write_addr,
    input  fp8_type [COMPUTE_WIDTH-1:0] activation_write_data,
    input  logic                         activation_write_valid,
    output logic                         activation_write_ready,

    // -------------------------------------------------------------------------
    // DMA DRAM-load full-row write request
    // -------------------------------------------------------------------------
    input  buffer_addr_type              load_write_addr,
    input  fp8_type [COMPUTE_WIDTH-1:0] load_write_data,
    input  logic                         load_write_valid,
    output logic                         load_write_ready
);


    typedef enum logic [1:0] {
        READ_OWNER_VPU, READ_OWNER_SPARSE, READ_OWNER_STORE, READ_OWNER_WEIGHT
    } read_owner_type;
    read_owner_type request_owner, response_owner_cs;
    buffer_addr_type internal_read_addr, internal_write_addr;
    logic internal_read_valid, internal_read_ready, internal_read_fire;
    logic internal_write_valid, internal_write_ready;
    fp8_type [COMPUTE_WIDTH-1:0] internal_write_data, internal_read_rsp_data;
    logic internal_read_rsp_valid, internal_read_rsp_ready;
    assign internal_read_fire = internal_read_valid && internal_read_ready;
    always_comb begin

        internal_read_addr  = '0;
        internal_read_valid = 1'b0;
        request_owner       = READ_OWNER_VPU;

        vpu_read_req_ready    = 1'b0;
        sparse_read_req_ready = 1'b0;
        weight_read_req_ready = 1'b0;
        store_read_req_ready  = 1'b0;


        // Priority:
        //
        // VPU > Sparse > Weight > Store
        //
        if (vpu_read_req_valid) begin

            internal_read_addr  = vpu_read_req_addr;
            internal_read_valid = 1'b1;
            request_owner       = READ_OWNER_VPU;

            vpu_read_req_ready = internal_read_ready;
        end

        else if (sparse_read_req_valid) begin

            internal_read_addr  = sparse_read_req_addr;
            internal_read_valid = 1'b1;
            request_owner       = READ_OWNER_SPARSE;

            sparse_read_req_ready = internal_read_ready;
        end

        else if (weight_read_req_valid) begin

            internal_read_addr  = weight_read_req_addr;
            internal_read_valid = 1'b1;
            request_owner       = READ_OWNER_WEIGHT;

            weight_read_req_ready = internal_read_ready;
        end

        else if (store_read_req_valid) begin

            internal_read_addr  = store_read_req_addr;
            internal_read_valid = 1'b1;
            request_owner       = READ_OWNER_STORE;

            store_read_req_ready = internal_read_ready;
        end

    end


    always_comb begin

        internal_write_addr  = '0;
        internal_write_data  = '0;
        internal_write_valid = 1'b0;

        activation_write_ready = 1'b0;
        load_write_ready       = 1'b0;


        // Activation write has priority over DMA load write.
        //
        if (activation_write_valid) begin

            internal_write_addr  = activation_write_addr;
            internal_write_data  = activation_write_data;
            internal_write_valid = 1'b1;

            activation_write_ready =
                internal_write_ready;
        end

        else if (load_write_valid) begin

            internal_write_addr  = load_write_addr;
            internal_write_data  = load_write_data;
            internal_write_valid = 1'b1;

            load_write_ready =
                internal_write_ready;
        end

    end


    assign vpu_read_rsp_data =
        internal_read_rsp_data;

    // Sparse controller consumes only element 0.
    //
    assign sparse_read_rsp_data =
        internal_read_rsp_data[0];

    assign weight_read_rsp_data =
        internal_read_rsp_data;

    assign store_read_rsp_data =
        internal_read_rsp_data;


    // =========================================================================
    // Read response routing
    // =========================================================================

    always_comb begin

        vpu_read_rsp_valid      = 1'b0;
        sparse_read_rsp_valid   = 1'b0;
        weight_read_rsp_valid   = 1'b0;
        store_read_rsp_valid    = 1'b0;

        internal_read_rsp_ready = 1'b0;


        if (internal_read_rsp_valid) begin

            case (response_owner_cs)

                READ_OWNER_VPU: begin

                    vpu_read_rsp_valid =
                        internal_read_rsp_valid;

                    internal_read_rsp_ready =
                        vpu_read_rsp_ready;
                end


                READ_OWNER_SPARSE: begin

                    sparse_read_rsp_valid =
                        internal_read_rsp_valid;

                    internal_read_rsp_ready =
                        sparse_read_rsp_ready;
                end


                READ_OWNER_WEIGHT: begin

                    weight_read_rsp_valid =
                        internal_read_rsp_valid;

                    internal_read_rsp_ready =
                        weight_read_rsp_ready;
                end


                READ_OWNER_STORE: begin

                    store_read_rsp_valid =
                        internal_read_rsp_valid;

                    internal_read_rsp_ready =
                        store_read_rsp_ready;
                end


                default: begin
                end

            endcase

        end

    end



    sram_ctrl #(
        .MACRO_BYTES(64),
        .DATA_WIDTH(COMPUTE_WIDTH * FP8_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(BUFFER_ADDR_WIDTH)
    ) memory (
        .clk(clk),
        .rst(rst),
        .read_req_addr(internal_read_addr),
        .read_req_valid(internal_read_valid),
        .read_req_ready(internal_read_ready),
        .read_rsp_data(internal_read_rsp_data),
        .read_rsp_valid(internal_read_rsp_valid),
        .read_rsp_ready(internal_read_rsp_ready),
        .write_addr(internal_write_addr),
        .write_data(internal_write_data),
        .write_valid(internal_write_valid),
        .write_ready(internal_write_ready),
        .write_done(),
        .busy()
    );
    always_ff @(posedge clk) begin
        if (rst) response_owner_cs <= READ_OWNER_VPU;
        else if (internal_read_fire) response_owner_cs <= request_owner;
    end
`ifndef SYNTHESIS
    initial assert (COMPUTE_WIDTH * FP8_WIDTH == 16)
        else $fatal(1, "unified_buffer requires 16-bit rows");
    always @(posedge clk) if (!rst) begin
        assert ($onehot0({vpu_read_req_valid, sparse_read_req_valid,
                          weight_read_req_valid, store_read_req_valid}))
            else $fatal(1, "Multiple unified-buffer readers are active");
        assert ($onehot0({activation_write_valid, load_write_valid}))
            else $fatal(1, "Multiple unified-buffer writers are active");
    end
`endif
endmodule
