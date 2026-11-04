// Held scalar input and zero detection. INPUT explicitly refreshes the value.
module sparsity_ctrl
    import tpu_pkg::*;
(
    input logic clk,
    input logic rst,

    // Instruction decoder -> sparsity_ctrl (input load inst)
    input  input_inst_type  input_inst,
    input  logic            input_inst_enable,

    // Controller status -> instruction decoder
    output logic            busy,
    output logic            resource_busy,
    output logic            read_busy,

    // sparsity_ctrl -> vpu_ctrl
    output fp8_type        vpu_input_data,
    output logic            vpu_input_valid,
    input  logic            vpu_input_ready,

    // weight_load_ctrl -> sparsity_ctrl
    input  logic            sparse_req_valid,
    output logic            sparse_req_ready,
    output logic            sparse_rsp_data,   // = mask_cs
    output logic            sparse_rsp_valid,

    // Address-only read request -> unified buffer
    output buffer_addr_type              input_read_req_addr,
    output logic                         input_read_req_valid,
    input  logic                         input_read_req_ready,

    // Data-only read response <- unified buffer
    input  fp8_type                     input_read_rsp_data,
    input  logic                         input_read_rsp_valid,
    output logic                         input_read_rsp_ready,

    // Config
    input logic sparsity_en
);

    typedef enum logic [1:0] {
        IDLE,
        READ_REQUEST,
        READ_RESPONSE
    } state_type;

    state_type state;
    buffer_addr_type input_addr_cs;
    fp8_type input_data_cs;
    logic input_valid_cs;
    logic input_update;
    logic value_available;

    // The decoder waits for preceding weight/VPU operations before INPUT.
    // Holding a loaded value does not reserve the SRAM or block synchronize.
    assign busy = (state != IDLE);
    assign resource_busy = busy;
    assign read_busy = busy;
    assign input_update = input_inst_enable && !busy && !rst;

    assign input_read_req_addr = input_addr_cs;
    assign input_read_req_valid = !rst && (state == READ_REQUEST);
    assign input_read_rsp_ready = !rst && (state == READ_RESPONSE);

    // Hide the previous value during a refresh, including its accepting edge.
    // Consumer handshakes never invalidate or advance the held input.
    assign value_available = !rst && input_valid_cs && !busy && !input_update;
    assign vpu_input_data = input_data_cs;
    assign vpu_input_valid = value_available;
    assign sparse_req_ready = value_available;
    assign sparse_rsp_valid = sparse_req_valid && sparse_req_ready;
    assign sparse_rsp_data = sparsity_en ? !fp8_is_zero(input_data_cs) : 1'b1;

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            input_addr_cs <= '0;
            input_data_cs <= FP8_ZERO;
            input_valid_cs <= 1'b0;
        end
        else begin
            case (state)
                IDLE: begin
                    if (input_update) begin
                        input_addr_cs <= input_inst.input_addr;
                        state <= READ_REQUEST;
                    end
                end

                READ_REQUEST: begin
                    if (input_read_req_ready)
                        state <= READ_RESPONSE;
                end

                READ_RESPONSE: begin
                    if (input_read_rsp_valid) begin
                        input_data_cs <= input_read_rsp_data;
                        input_valid_cs <= 1'b1;
                        state <= IDLE;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule
