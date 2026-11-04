// One 64-byte SRAM, 16 two-element FP16 rows, one shared FP16 adder.
// The core widens FP8 VPU writes and rounds activation reads; DMA stays FP16.
module accumulation_buffer
    import tpu_pkg::*;
#(
    parameter int COMPUTE_WIDTH = 2, REGISTER_DEPTH = 16
) (
    input  logic                        clk, rst,
    input  accumulator_addr_type        write_addr,
    input  fp16_type [COMPUTE_WIDTH-1:0] data_in,
    input  logic                        write_enable,
    output logic                        write_ready,
    input  logic                        accumulate,
    output logic                        busy,
    input  accumulator_addr_type        read_req_addr,
    input  logic                        read_req_valid,
    output logic                        read_req_ready,
    output fp16_type [COMPUTE_WIDTH-1:0] read_rsp_data,
    output logic                        read_rsp_valid,
    input  logic                        read_rsp_ready
);
    typedef enum logic [2:0] {
        IDLE,
        READ_WAIT,
        RESPONSE,
        RMW_WAIT,
        RMW_CALC,
        WRITE_REQ,
        WRITE_WAIT
    } state_type;
    state_type state_cs;
    logic prefer_write, choose_write, write_fire, read_fire, lane_cs;
    accumulator_addr_type saved_addr;
    fp16_type [COMPUTE_WIDTH-1:0] saved_data, old_data, result_data, mem_rsp;
    logic mem_rvalid, mem_rready, mem_rspvalid, mem_rspready;
    logic mem_wvalid, mem_wready, mem_done, mem_busy;
    logic sram_write_enable;

    assign choose_write = write_enable && (!read_req_valid || prefer_write);
    assign mem_rvalid = !rst && state_cs == IDLE &&
        ((choose_write && accumulate) || (!choose_write && read_req_valid));

    assign mem_wvalid = !rst && ((state_cs == IDLE && choose_write && !accumulate) || state_cs == WRITE_REQ);
    assign write_ready = !rst && state_cs == IDLE && (!read_req_valid || prefer_write) &&
        (accumulate ? mem_rready : mem_wready);

    assign read_req_ready = !rst && state_cs == IDLE && !(write_enable && prefer_write) && mem_rready;
    assign write_fire = write_enable && write_ready;
    assign read_fire = read_req_valid && read_req_ready;
    assign mem_rspready = state_cs == READ_WAIT || state_cs == RMW_WAIT;
    assign read_rsp_valid = !rst && state_cs == RESPONSE;
    assign busy = state_cs != IDLE || mem_busy;
    assign sram_write_enable = mem_wvalid && mem_wready;

    sram_ctrl #(
        .MACRO_BYTES(64),
        .DATA_WIDTH(32),
        .DEPTH(REGISTER_DEPTH),
        .ADDR_WIDTH(ACCUMULATOR_ADDR_WIDTH)
    ) memory (
        .clk           (clk),
        .rst           (rst),
        .read_req_addr (choose_write ? write_addr : read_req_addr),
        .read_req_valid(mem_rvalid),
        .read_req_ready(mem_rready),
        .read_rsp_data (mem_rsp),
        .read_rsp_valid(mem_rspvalid),
        .read_rsp_ready(mem_rspready),
        .write_addr    (state_cs == WRITE_REQ ? saved_addr : write_addr),
        .write_data    (state_cs == WRITE_REQ ? result_data : data_in),
        .write_valid   (mem_wvalid),
        .write_ready   (mem_wready),
        .write_done    (mem_done),
        .busy          (mem_busy)
    );

    always_ff @(posedge clk) begin
        if (rst) begin
            state_cs <= IDLE;
            prefer_write <= 0;
            lane_cs <= 0;
            saved_addr <= '0;
            saved_data <= '0;
            old_data <= '0;
            result_data <= '0;
            read_rsp_data <= '0;
        end else
            case (state_cs)
                IDLE: begin
                    if (read_fire) begin
                        prefer_write <= 1;
                        state_cs <= READ_WAIT;
                    end
                    if (write_fire) begin
                        prefer_write <= 0;
                        if (accumulate) begin
                            saved_addr <= write_addr;
                            saved_data <= data_in;
                            state_cs   <= RMW_WAIT;
                        end else state_cs <= WRITE_WAIT;
                    end
                end

                READ_WAIT:
                    if (mem_rspvalid) begin
                        read_rsp_data <= mem_rsp;
                        state_cs <= RESPONSE;
                    end

                RESPONSE: if (read_rsp_ready) state_cs <= IDLE;

                RMW_WAIT:
                    if (mem_rspvalid) begin
                        old_data <= mem_rsp;
                        lane_cs  <= 0;
                        state_cs <= RMW_CALC;
                    end

                RMW_CALC: begin
                    result_data[lane_cs] <= fp16_add(saved_data[lane_cs], old_data[lane_cs]);
                    if (lane_cs) state_cs <= WRITE_REQ;
                    else lane_cs <= 1;
                end

                WRITE_REQ: if (mem_wready) state_cs <= WRITE_WAIT;

                WRITE_WAIT: if (mem_done) state_cs <= IDLE;

                default: state_cs <= IDLE;
            endcase
    end
`ifndef SYNTHESIS
    initial
        assert (COMPUTE_WIDTH == 2 && REGISTER_DEPTH > 0 && REGISTER_DEPTH <= 16)
        else $fatal(1, "Unsupported small accumulator geometry");
`endif
endmodule
