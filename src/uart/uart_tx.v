`include "defs/defs.vh"

module uart_tx #(
    parameter integer CLKS_PER_BIT = 87 // for 115200 baud, 10MHz clk
) (
    input clk,
    input rst_n,

    input                   inst_fifo_rdy,

    output                  tx
);

    localparam integer TIMER_BITS = (CLKS_PER_BIT > 1) ? $clog2(CLKS_PER_BIT) : 1;

    localparam [TIMER_BITS-1:0] BIT_LAST = TIMER_BITS'(CLKS_PER_BIT - 1);

    reg [`DATA_WIDTH+1:0] data_reg;
    reg [TIMER_BITS-1:0] clk_cnt;
    reg [$clog2(`DATA_WIDTH+2)-1:0] bit_idx;

    localparam IDLE = 0;
    localparam DATA = 1;

    reg state;
    reg ready_sent; // Send once per HIGH request; a LOW cycle re-arms TX.

    assign tx = (state == DATA) ? data_reg[bit_idx] : 1'b1;

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            clk_cnt <= 0;
            bit_idx <= 0;
            data_reg <= 0;
            ready_sent <= 0;
        end
        else begin
            if (!inst_fifo_rdy)
                ready_sent <= 0;

            case(state)
                IDLE: begin
                    if (inst_fifo_rdy && !ready_sent) begin
                        data_reg <= {1'b1, 8'h01, 1'b0};
                        ready_sent <= 1'b1;
                        bit_idx <= 0;
                        state <= DATA;
                    end
                end
                DATA: begin
                    if (clk_cnt == BIT_LAST) begin
                        clk_cnt <= 0;
                        if (bit_idx == `DATA_WIDTH+1) begin
                            state <= IDLE;
                        end
                        else begin
                            bit_idx <= bit_idx + 1'b1;
                        end
                    end
                    else begin
                        clk_cnt <= clk_cnt + 1'b1;
                    end
                end
                default: begin end
            endcase
        end
    end

endmodule
