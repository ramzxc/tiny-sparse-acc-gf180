// Adapts a buffer's row interface to one external PSRAM word transaction.
// Responses are captured locally, so a stalled consumer never holds CS low.
module psram_buffer_ctrl
    import tpu_pkg::*;
#(
    parameter logic [23:0] BASE_ADDR = 0,
    parameter int DATA_WIDTH = 16,
    parameter int DEPTH = 4,
    parameter int ADDR_WIDTH = 16
)(
    input  logic                  clk, rst,
    input  logic [ADDR_WIDTH-1:0] read_req_addr,
    input  logic                  read_req_valid,
    output logic                  read_req_ready,
    output logic [DATA_WIDTH-1:0] read_rsp_data,
    output logic                  read_rsp_valid,
    input  logic                  read_rsp_ready,
    input  logic [ADDR_WIDTH-1:0] write_addr,
    input  logic [DATA_WIDTH-1:0] write_data,
    input  logic                  write_valid,
    output logic                  write_ready, write_done, busy,

    output psram_req_type psram_req,
    output logic          psram_req_valid,
    input  logic          psram_req_ready,
    input  logic [31:0]   psram_rsp_data,
    input  logic          psram_rsp_valid
);
    localparam int WORD_BYTES = DATA_WIDTH / 8;
    typedef enum logic [1:0] {IDLE, REQUEST, WAIT_RESPONSE} state_type;
    state_type state;

    assign busy = state != IDLE;
    assign read_req_ready = !rst && state == IDLE &&
                            (!read_rsp_valid || read_rsp_ready);
    assign write_ready = !rst && state == IDLE;
    assign psram_req_valid = !rst && state == REQUEST;

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            psram_req <= '0;
            read_rsp_data <= '0;
            read_rsp_valid <= 0;
            write_done <= 0;
        end else begin
            write_done <= 0;
            if (read_rsp_valid && read_rsp_ready) read_rsp_valid <= 0;

            case (state)
                IDLE: begin
                    if (read_req_valid && read_req_ready) begin
                        psram_req.write <= 0;
                        psram_req.wide <= DATA_WIDTH == 32;
                        psram_req.addr <= BASE_ADDR + 24'(read_req_addr) * 24'(WORD_BYTES);
                        psram_req.data <= '0;
                        state <= REQUEST;
                    end else if (write_valid && write_ready) begin
                        psram_req.write <= 1;
                        psram_req.wide <= DATA_WIDTH == 32;
                        psram_req.addr <= BASE_ADDR + 24'(write_addr) * 24'(WORD_BYTES);
                        psram_req.data <= 32'(write_data);
                        state <= REQUEST;
                    end
                end

                REQUEST: if (psram_req_ready) state <= WAIT_RESPONSE;

                WAIT_RESPONSE: if (psram_rsp_valid) begin
                    if (psram_req.write) write_done <= 1;
                    else begin
                        read_rsp_data <= psram_rsp_data[DATA_WIDTH-1:0];
                        read_rsp_valid <= 1;
                    end
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

`ifndef SYNTHESIS
    initial begin
        assert (DATA_WIDTH == 16 || DATA_WIDTH == 32)
            else $fatal(1, "PSRAM word width must be 16 or 32 bits");
        assert (DEPTH > 0 && DEPTH * WORD_BYTES <= 65536 &&
                int'(BASE_ADDR) + DEPTH * WORD_BYTES <= 24'h800000)
            else $fatal(1, "PSRAM region exceeds its allocation");
    end
    always @(posedge clk) if (!rst) begin
        assert (!(read_req_valid && write_valid))
            else $fatal(1, "Simultaneous buffer read and write");
        if (read_req_valid && read_req_ready)
            assert (int'(read_req_addr) < DEPTH) else $fatal(1, "PSRAM read outside buffer");
        if (write_valid && write_ready)
            assert (int'(write_addr) < DEPTH) else $fatal(1, "PSRAM write outside buffer");
        if (psram_rsp_valid)
            assert (state == WAIT_RESPONSE) else $fatal(1, "Unexpected PSRAM response");
    end
`endif
endmodule
