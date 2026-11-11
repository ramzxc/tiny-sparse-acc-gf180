`include "defs/defs.vh"

// Collect WORD_WIDTH/8 UART bytes, low byte first, into one external job.
module uart_rx # (
    parameter integer CLKS_PER_BIT = 87, // for 115200 baud, 10MHz clk
    parameter integer WORD_WIDTH = `HOST_INST_WIDTH
) (
    input clk,
    input rst_n,

    output reg [WORD_WIDTH-1:0] inst,
    output reg inst_val,

    input rx
);
    
    localparam integer TIMER_BITS = (CLKS_PER_BIT > 1) ? $clog2(CLKS_PER_BIT) : 1;
    localparam integer HALF_BIT_CLKS = CLKS_PER_BIT / 2;
    localparam integer BYTE_COUNT = WORD_WIDTH / `DATA_WIDTH;
    localparam integer BYTE_IDX_BITS = BYTE_COUNT > 1 ? $clog2(BYTE_COUNT) : 1;
    localparam [TIMER_BITS-1:0] BIT_LAST = TIMER_BITS'(CLKS_PER_BIT - 1);
    localparam [TIMER_BITS-1:0] HALF_BIT_LAST = TIMER_BITS'(HALF_BIT_CLKS - 1);
    localparam [BYTE_IDX_BITS-1:0] BYTE_LAST = BYTE_IDX_BITS'(BYTE_COUNT - 1);

    reg rx_meta;
    reg rx_sync;

    reg [BYTE_IDX_BITS-1:0] byte_idx;
    reg [TIMER_BITS-1:0] clk_cnt;
    reg [$clog2(`DATA_WIDTH+2)-1:0] bit_idx;

    reg [1:0] state;
    
    localparam RESET = 2'd0;
    localparam IDLE  = 2'd1;
    localparam DATA  = 2'd2;

    always @(posedge clk) begin
        if (!rst_n) begin
            inst_val <= 0;
            inst <= 0;
            rx_meta <= 0;
            rx_sync <= 0;
            clk_cnt <= 0;
            bit_idx <= 0;
            byte_idx <= 0;
            state <= RESET;
        end
        else begin
            rx_meta <= rx;
            rx_sync <= rx_meta;

            case (state)
                RESET: begin
                    inst_val <= 0;
                    clk_cnt <= 0;
                    bit_idx <= 0;
                    inst <= 0;
                    byte_idx <= 0;

                    if (rx_sync == 1) begin
                        state <= IDLE;
                    end
                end
                IDLE : begin
                    inst_val <= 0;
                    if (rx_sync == 0) begin
                        bit_idx <= 0;
                        state <= DATA;
                    end
                end
                DATA : begin
                    if (bit_idx == 0) begin
                        if (clk_cnt == HALF_BIT_LAST) begin
                            clk_cnt <= 0;

                            if (!rx_sync)
                                bit_idx <= bit_idx + 1;
                            else
                                // if it was just noise..
                                state <= IDLE;
                        end
                        else begin
                            clk_cnt <= clk_cnt + 1;
                        end
                    end
                    else begin
                        if (clk_cnt == BIT_LAST) begin
                            clk_cnt <= 0;

                            if (bit_idx <= `DATA_WIDTH) begin
                                // LSB-first bits and low-byte-first words end up
                                // in natural order after all WORD_WIDTH shifts.
                                inst <= {rx_sync, inst[WORD_WIDTH-1:1]};

                                bit_idx <= bit_idx + 1;
                            end
                            else begin
                                if (rx_sync) begin
                                    if (byte_idx == BYTE_LAST) begin
                                        inst_val <= 1;
                                        byte_idx <= 0;
                                    end else begin
                                        byte_idx <= byte_idx + 1'b1;
                                    end

                                    state <= IDLE;
                                end
                                else begin
                                    // error for PC..?
                                    state <= RESET;
                                end
                            end
                        end
                        else begin
                            clk_cnt <= clk_cnt + 1;
                        end
                    end
                end
                default: state <= RESET;
            endcase
        end
    end

endmodule
