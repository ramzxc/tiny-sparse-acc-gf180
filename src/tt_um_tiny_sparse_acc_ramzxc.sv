// UART host: ui_in[3]=RX, uo_out[4]=TX. Official QSPI Pmod pinout.
// Stop-and-wait commands: 01 + 8 LE bytes, 03 clear, 04 abort, 05 status.
// Every command returns two bytes: response code then status. See docs/uart_host.rst.
`default_nettype none

module tt_um_tiny_sparse_acc_ramzxc (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out, uio_oe,
    input  wire ena, clk, rst_n
);
    import tpu_pkg::*;

    wire rst = !rst_n;

    typedef enum logic [2:0] {
        COMMAND,
        PAYLOAD,
        PENDING,
        REPLY_CODE,
        REPLY_STATUS,
        DRAIN
    } host_state_t;

    host_state_t host_state;
    logic [2:0] byte_index;
    logic [63:0] inst_word;
    logic protocol_error, sync_seen;
    logic [7:0] reply_code, reply_status;
    logic [17:0] packet_timer;

    wire fifo_empty, fifo_full, synchronize, available, flash_busy, flash_error;
    wire [2:0] flash_error_code;
    wire [3:0] dq_out, dq_oe;
    wire sck, cs_n, psram_cs_n, uart_tx;
    wire [7:0] rx_data;
    wire rx_valid, rx_error, tx_ready;

    wire tx_valid = (host_state == REPLY_CODE || host_state == REPLY_STATUS);
    wire [7:0] tx_data = (host_state == REPLY_CODE) ? reply_code : reply_status;
    wire host_ready = ena && rst_n && host_state == COMMAND;
    wire inst_push = host_state == PENDING && ena && !fifo_full && available && !flash_error;
    wire [7:0] status_byte = {
        flash_error_code, (protocol_error || flash_error),
        sync_seen, flash_busy, available, host_ready
    };

    uart_byte uart (
        .clk      (clk),
        .rst      (rst),
        .rx       (ui_in[3]),
        .rx_data  (rx_data),
        .rx_valid (rx_valid),
        .rx_error (rx_error),
        .tx_data  (tx_data),
        .tx_valid (tx_valid),
        .tx_ready (tx_ready),
        .tx       (uart_tx)
    );

    // Shared Pmod bus: CS0 Flash, CS1 PSRAM, CS2 unused.
    assign uio_out = {1'b1, psram_cs_n, dq_out[3:2], sck, dq_out[1:0], cs_n};
    assign uio_oe = {2'b11, dq_oe[3:2], 1'b1, dq_oe[1:0], 1'b1};
    assign uo_out = {flash_error_code, uart_tx, sync_seen, flash_busy, available, host_ready};

    always_ff @(posedge clk) begin
        if (rst) begin
            host_state     <= COMMAND;
            byte_index     <= 0;
            inst_word      <= 0;
            protocol_error <= 0;
            sync_seen      <= 0;
            reply_code     <= 0;
            reply_status   <= 0;
            packet_timer   <= 0;
        end else begin
            if (synchronize) sync_seen <= 1;
            if (inst_push) sync_seen <= 0;
            if (rx_error) protocol_error <= 1;

            case (host_state)
                COMMAND: begin
                    packet_timer <= 0;

                    if (rx_valid && ena) begin
                        reply_code <= 8'h06;

                        case (rx_data)
                            8'h01: begin
                                host_state <= PAYLOAD;
                                byte_index <= 0;
                            end

                            8'h03: begin
                                protocol_error <= 0;
                                sync_seen <= 0;
                                host_state <= REPLY_CODE;
                            end

                            8'h04, 8'h05: host_state <= REPLY_CODE;

                            default: begin
                                protocol_error <= 1;
                                reply_code <= 8'h15;
                                host_state <= REPLY_CODE;
                            end
                        endcase
                    end
                end

                PAYLOAD: begin
                    packet_timer <= packet_timer + 1'b1;

                    if (rx_error || packet_timer == 18'd199999) begin
                        protocol_error <= 1;
                        reply_code <= 8'h15;
                        host_state <= REPLY_CODE;
                    end else if (rx_valid) begin
                        packet_timer <= 0;
                        inst_word[byte_index * 8 +: 8] <= rx_data;

                        if (byte_index == 7) host_state <= PENDING;
                        else byte_index <= byte_index + 1'b1;
                    end
                end

                PENDING: begin
                    if (flash_error) begin
                        reply_code <= 8'h15;
                        host_state <= REPLY_CODE;
                    end else if (inst_push) begin
                        reply_code <= 8'h06;
                        host_state <= REPLY_CODE;
                    end

                    if (rx_valid) protocol_error <= 1;
                end

                REPLY_CODE: begin
                    if (tx_ready) begin
                        reply_status <= status_byte;
                        host_state <= REPLY_STATUS;
                    end

                    if (rx_valid) protocol_error <= 1;
                end

                REPLY_STATUS: begin
                    if (tx_ready) host_state <= DRAIN;
                    if (rx_valid) protocol_error <= 1;
                end

                DRAIN: begin
                    if (tx_ready) host_state <= COMMAND;
                    if (rx_valid) protocol_error <= 1;
                end

                default: host_state <= COMMAND;
            endcase
        end
    end

    tpu core (
        .clk               (clk),
        .rst               (rst),
        .inst_word         (inst_type'(inst_word)),
        .inst_write_enable (inst_push),
        .inst_fifo_empty   (fifo_empty),
        .inst_fifo_full    (fifo_full),
        .synchronize       (synchronize),
        .flash_available   (available),
        .flash_busy        (flash_busy),
        .flash_error       (flash_error),
        .flash_error_code  (flash_error_code),
        .qspi_dq_in        ({uio_in[5:4], uio_in[2:1]}),
        .qspi_dq_out       (dq_out),
        .qspi_dq_oe        (dq_oe),
        .qspi_sck          (sck),
        .psram_cs_n (psram_cs_n),
        .qspi_cs_n         (cs_n)
    );
endmodule

`default_nettype wire
