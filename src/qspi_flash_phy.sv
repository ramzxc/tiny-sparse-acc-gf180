// Mode-0 transaction engine, SCK=clk/2. Headers can use SPI or QPI;
// payload can use one or four data pins. No flash-specific state in this layer.
// Streams pause with SCK low. tx_end closes a stream only at a byte boundary.
module qspi_flash_phy (
    input  logic        clk, rst,
    input  logic        cmd_valid,
    output logic        cmd_ready,
    input  logic [7:0]  cmd_opcode,
    input  logic [23:0] cmd_addr,
    input  logic        cmd_has_addr,
    input  logic [3:0]  cmd_dummy,
    input  logic [1:0]  cmd_dir,         // 0: command only, 1: read, 2: write
    input  logic        cmd_quad, cmd_header_quad,
    input  logic [15:0] cmd_read_count,
    input  logic [7:0]  tx_data,
    input  logic        tx_valid, tx_last, tx_end,
    output logic        tx_ready,
    output logic [7:0]  rx_data,
    output logic        rx_valid,
    input  logic        rx_ready,
    output logic        done,
    input  logic [3:0]  dq_in,
    output logic [3:0]  dq_out, dq_oe,
    output logic        sck, cs_n
);
    typedef enum logic [2:0] {
        IDLE,
        HEADER,
        DUMMY,
        RX_BITS,
        RX_WAIT,
        TX_WAIT,
        TX_BITS
    } state_t;
    state_t state;
    logic [31:0] header_shift;
    logic [7:0] byte_shift;
    logic [5:0] left;
    logic [3:0] dummy_cycles;
    logic [1:0] direction;
    logic quad, header_quad, last_byte;
    logic [15:0] reads_left;

    assign cmd_ready = !rst && state == IDLE;
    assign tx_ready  = !rst && state == TX_WAIT && !tx_end;
    assign rx_valid  = !rst && state == RX_WAIT;
    assign rx_data   = byte_shift;

    always_comb begin
        dq_out = 4'b1100;
        dq_oe  = 4'b1101;
        if (state == HEADER) begin
            if (header_quad) begin
                dq_out = header_shift[31:28];
                dq_oe = 4'b1111;
            end else dq_out[0] = header_shift[31];
        end
        if (state == DUMMY && quad) dq_oe = 4'b0000;
        if (state == RX_BITS || state == RX_WAIT) begin
            if (quad) dq_oe = 4'b0000;
        end
        if (state == TX_BITS) begin
            if (quad) begin
                dq_oe  = 4'b1111;
                dq_out = byte_shift[7:4];
            end else dq_out[0] = byte_shift[7];
        end
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            cs_n <= 1;
            sck <= 0;
            done <= 0;
            header_shift <= 0;
            byte_shift <= 0;
            left <= 0;
            dummy_cycles <= 0;
            direction <= 0;
            quad <= 0;
            header_quad <= 0;
            last_byte <= 0;
            reads_left <= 0;
        end else begin
            done <= 0;

            case (state)
                IDLE:
                    if (cmd_valid) begin
                        header_shift <= cmd_has_addr ? {cmd_opcode, cmd_addr} : {cmd_opcode, 24'b0};
                        left <= cmd_header_quad ? (cmd_has_addr ? 6'd8 : 6'd2)
                                                : (cmd_has_addr ? 6'd32 : 6'd8);
                        header_quad <= cmd_header_quad;
                        dummy_cycles <= cmd_dummy;
                        direction <= cmd_dir;
                        quad <= cmd_quad;
                        reads_left <= cmd_read_count;
                        cs_n <= 0;
                        sck <= 0;
                        state <= HEADER;
                    end

                HEADER:
                    if (!sck) sck <= 1;
                    else begin
                        sck <= 0;
                        if (left == 1) begin
                            if (dummy_cycles != 0) begin
                                state <= DUMMY;
                                left  <= {2'b0, dummy_cycles};
                            end else begin
                                if (direction == 1 && reads_left != 0) begin
                                    state <= RX_BITS;
                                    left <= quad ? 6'd2 : 6'd8;
                                    byte_shift <= 0;
                                end else if (direction == 2) state <= TX_WAIT;
                                else begin
                                    state <= IDLE;
                                    cs_n  <= 1;
                                    sck   <= 0;
                                    done  <= 1;
                                end
                            end
                        end else begin
                            header_shift <= header_shift << (header_quad ? 4 : 1);
                            left <= left - 1'b1;
                        end
                    end

                DUMMY:
                    if (!sck) sck <= 1;
                    else begin
                        sck <= 0;
                        if (left == 1) begin
                            if (direction == 1 && reads_left != 0) begin
                                state <= RX_BITS;
                                left <= quad ? 6'd2 : 6'd8;
                                byte_shift <= 0;
                            end else if (direction == 2) state <= TX_WAIT;
                            else begin
                                state <= IDLE;
                                cs_n  <= 1;
                                sck   <= 0;
                                done  <= 1;
                            end
                        end else left <= left - 1'b1;
                    end

                RX_BITS:
                    if (!sck) begin
                        sck <= 1;
                        byte_shift <= quad ? {byte_shift[3:0], dq_in} : {byte_shift[6:0], dq_in[1]};
                    end else begin
                        sck <= 0;
                        if (left == 1) state <= RX_WAIT;
                        else left <= left - 1'b1;
                    end

                RX_WAIT:
                    if (rx_ready) begin
                        if (reads_left == 1) begin
                            state <= IDLE;
                            cs_n  <= 1;
                            sck   <= 0;
                            done  <= 1;
                        end else begin
                            reads_left <= reads_left - 1'b1;
                            state <= RX_BITS;
                            left <= quad ? 6'd2 : 6'd8;
                            byte_shift <= 0;
                        end
                    end

                TX_WAIT:
                    if (tx_end) begin
                        state <= IDLE;
                        cs_n  <= 1;
                        sck   <= 0;
                        done  <= 1;
                    end else if (tx_valid) begin
                        byte_shift <= tx_data;
                        last_byte <= tx_last;
                        left <= quad ? 6'd2 : 6'd8;
                        state <= TX_BITS;
                    end

                TX_BITS:
                    if (!sck) sck <= 1;
                    else begin
                        sck <= 0;
                        if (left == 1) begin
                            if (last_byte) begin
                                state <= IDLE;
                                cs_n  <= 1;
                                sck   <= 0;
                                done  <= 1;
                            end else state <= TX_WAIT;
                        end else begin
                            byte_shift <= quad ? byte_shift << 4 : byte_shift << 1;
                            left <= left - 1'b1;
                        end
                    end

                default: begin
                    state <= IDLE;
                    cs_n  <= 1;
                    sck   <= 0;
                    done  <= 1;
                end
            endcase
        end
    end
endmodule
