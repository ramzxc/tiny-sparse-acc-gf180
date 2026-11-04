// 8N1 UART, nearest integer divider: 10 MHz / 87 = 114943 baud.
module uart_byte #(
    parameter int CLKS_PER_BIT = 87
) (
    input  logic       clk, rst, rx,
    output logic [7:0] rx_data,
    output logic       rx_valid, rx_error,
    input  logic [7:0] tx_data,
    input  logic       tx_valid,
    output logic       tx_ready, tx
);
    localparam int CW = $clog2(CLKS_PER_BIT + 1);
    (* async_reg = "true" *) logic rx_meta, rx_sync;
    logic [CW-1:0] rc, tc;
    logic [2:0] rb;
    logic [3:0] tb;
    logic [7:0] rshift;
    logic [9:0] tshift;
    typedef enum logic [2:0] {
        IDLE,
        START,
        DATA,
        STOP,
        RECOVER
    } rs_t;
    rs_t rs;

    assign tx_ready = (tb == 0);
    assign tx = (tb == 0) ? 1'b1 : tshift[0];

    always_ff @(posedge clk) begin
        if (rst) begin
            rx_meta <= 1;
            rx_sync <= 1;
            rc <= 0;
            rb <= 0;
            rshift <= 0;
            rs <= IDLE;
            rx_data <= 0;
            rx_valid <= 0;
            rx_error <= 0;
            tc <= 0;
            tb <= 0;
            tshift <= '1;
        end else begin
            rx_meta  <= rx;
            rx_sync  <= rx_meta;
            rx_valid <= 0;
            rx_error <= 0;

            case (rs)
                IDLE:
                    if (!rx_sync) begin
                        rc <= CW'(CLKS_PER_BIT / 2 - 1);
                        rs <= START;
                    end

                START:
                    if (rc != 0) rc <= rc - 1'b1;
                    else if (rx_sync) rs <= IDLE;
                    else begin
                        rc <= CW'(CLKS_PER_BIT - 1);
                        rb <= 0;
                        rs <= DATA;
                    end

                DATA:
                    if (rc != 0) rc <= rc - 1'b1;
                    else begin
                        rshift[rb] <= rx_sync;
                        rc <= CW'(CLKS_PER_BIT - 1);
                        if (rb == 7) rs <= STOP;
                        else rb <= rb + 1'b1;
                    end

                STOP:
                    if (rc != 0) rc <= rc - 1'b1;
                    else begin
                        if (rx_sync) begin
                            rx_data <= rshift;
                            rx_valid <= 1;
                            rs <= IDLE;
                        end else begin
                            rx_error <= 1;
                            rs <= RECOVER;
                        end
                    end

                RECOVER: if (rx_sync) rs <= IDLE;

                default: rs <= IDLE;
            endcase
            if (tx_ready) begin
                if (tx_valid) begin
                    tshift <= {1'b1, tx_data, 1'b0};
                    tb <= 10;
                    tc <= CW'(CLKS_PER_BIT - 1);
                end
            end else if (tc != 0) tc <= tc - 1'b1;
            else begin
                tc <= CW'(CLKS_PER_BIT - 1);
                tshift <= {1'b1, tshift[9:1]};
                tb <= tb - 1'b1;
            end
        end
    end
endmodule
