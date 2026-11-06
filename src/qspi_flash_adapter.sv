// W25Q128JV-compatible profile: 24-bit addresses, 16 MiB, 256-byte pages,
// Board prepares QE/erased storage before releasing reset. 6Bh read, 32h program.
// Host owns allocation/erase: writes require previously erased storage.
// DMA interface is unchanged (64-bit little-endian beats, len=beats-1).
// No automatic erase or flash instruction-fetch client.
// Close CS after every DMA beat so PSRAM can share the physical bus.
module qspi_flash_adapter
    import tpu_pkg::*;
#(
    parameter int POLL_LIMIT = 1048576
) (
    input  logic        clk, rst,
    input  logic [31:0] dma_read_cmd_addr,
    input  logic [7:0]  dma_read_cmd_len,
    input  logic        dma_read_cmd_valid,
    output logic        dma_read_cmd_ready,
    output logic [63:0] dma_read_data,
    output logic        dma_read_data_last, dma_read_data_valid,
    input  logic        dma_read_data_ready,
    input  logic [31:0] dma_write_cmd_addr,
    input  logic [7:0]  dma_write_cmd_len,
    input  logic        dma_write_cmd_valid,
    output logic        dma_write_cmd_ready,
    input  logic [63:0] dma_write_data,
    input  logic [7:0]  dma_write_strb,
    input  logic        dma_write_data_last, dma_write_data_valid,
    output logic        dma_write_data_ready,
    output logic        dma_write_rsp_valid,
    input  logic        dma_write_rsp_ready,
    output logic        available, busy, error,
    output logic [2:0]  error_code,            // 1=address, 2=LAST, 3=poll timeout, 4=WEL
    output qspi_cmd_type bus_cmd,
    output logic        bus_cmd_valid,
    input  logic        bus_cmd_ready,
    output qspi_tx_type bus_tx,
    input  logic        bus_tx_ready,
    input  logic [7:0]  bus_rx_data,
    input  logic        bus_rx_valid,
    output logic        bus_rx_ready,
    input  logic        bus_done
);
    localparam int POLL_BITS = $clog2(POLL_LIMIT + 1);
    typedef enum logic [4:0] {
        POLL_START,
        POLL_WAIT,
        WREN,
        WREN_WAIT,
        WEL_READ,
        WEL_WAIT,
        IDLE,
        READ_START,
        READ_DATA,
        READ_CLOSE,
        READ_HOLD,
        WRITE_GET,
        WRITE_SCAN,
        PROGRAM_START,
        WRITE_SEND,
        WRITE_BYTE_WAIT,
        CLOSE_WAIT,
        WRITE_RESPONSE,
        FAULT
    } state_t;
    state_t state, poll_return;
    logic [POLL_BITS-1:0] poll_count;
    logic [7:0] status_reg;
    logic program_open;
    logic [23:0] addr;
    logic [8:0] beats_left;
    logic [3:0] bytes_left;
    logic [2:0] read_byte;
    logic [63:0] write_buf;
    logic [7:0] write_mask;
    logic phy_valid, phy_ready, phy_has_addr, phy_quad, phy_tx_valid, phy_tx_ready, phy_tx_last, phy_tx_end;
    logic [7:0] phy_opcode, phy_tx_data, phy_rx_data;
    logic [3:0] phy_dummy;
    logic [1:0] phy_dir;
    logic [15:0] phy_count;
    logic phy_rx_valid, phy_rx_ready, phy_done;
    logic [32:0] read_end, write_end;

    assign read_end = {1'b0, dma_read_cmd_addr} + (({25'b0, dma_read_cmd_len} + 33'd1) << 3);
    assign write_end = {1'b0, dma_write_cmd_addr} + (({25'b0, dma_write_cmd_len} + 33'd1) << 3);
    assign error = state == FAULT;
    assign busy = state != IDLE;
    assign available = !rst && !error;
    assign dma_read_cmd_ready = !rst && state == IDLE;
    assign dma_write_cmd_ready = !rst && state == IDLE && !dma_read_cmd_valid;
    assign dma_write_data_ready = !rst && state == WRITE_GET;
    assign dma_write_rsp_valid = !rst && state == WRITE_RESPONSE;

    always_comb begin
        phy_valid = 0;
        phy_opcode = 0;
        phy_has_addr = 0;
        phy_dummy = 0;
        phy_dir = 0;
        phy_quad = 0;
        phy_count = 1;
        phy_tx_data = write_buf[7:0];
        phy_tx_valid = 0;
        phy_tx_last = 0;
        phy_tx_end = 0;
        phy_rx_ready = 0;

        case (state)
            POLL_START, WEL_READ: begin
                phy_valid = 1;
                phy_opcode = 8'h05;
                phy_dir = 1;
            end

            WREN: begin
                phy_valid  = 1;
                phy_opcode = 8'h06;
            end

            POLL_WAIT, WEL_WAIT: phy_rx_ready = 1;

            READ_START: begin
                phy_valid = 1;
                phy_opcode = 8'h6b;
                phy_has_addr = 1;
                phy_dummy = 8;
                phy_dir = 1;
                phy_quad = 1;
                phy_count = 16'd8;
            end

            READ_DATA: phy_rx_ready = 1;

            PROGRAM_START: begin
                phy_valid = 1;
                phy_opcode = 8'h32;
                phy_has_addr = 1;
                phy_dir = 2;
                phy_quad = 1;
            end

            WRITE_SEND: begin
                phy_tx_valid = 1;
                phy_tx_last  = addr[7:0] == 8'hff || bytes_left == 1;
            end

            WRITE_SCAN:
                if (program_open && ((bytes_left == 0 && beats_left == 0) || (bytes_left != 0 && !write_mask[0])))
                    phy_tx_end = 1;

            default: ;
        endcase
    end

    assign bus_cmd = {phy_opcode, addr, phy_has_addr, 1'b0,
                      phy_dummy, phy_dir, phy_quad, phy_count};
    assign bus_cmd_valid = phy_valid;
    assign phy_ready = bus_cmd_ready;
    assign bus_tx = {phy_tx_valid, phy_tx_data, phy_tx_last, phy_tx_end};
    assign phy_tx_ready = bus_tx_ready;
    assign phy_rx_data = bus_rx_data;
    assign phy_rx_valid = bus_rx_valid;
    assign bus_rx_ready = phy_rx_ready;
    assign phy_done = bus_done;

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            poll_return <= IDLE;
            poll_count <= 0;
            status_reg <= 0;
            program_open <= 0;
            error_code <= 0;
            addr <= 0;
            beats_left <= 0;
            bytes_left <= 0;
            read_byte <= 0;
            write_buf <= 0;
            write_mask <= 0;
            dma_read_data <= 0;
            dma_read_data_valid <= 0;
            dma_read_data_last <= 0;
        end else begin
            case (state)
                POLL_START: if (phy_ready) state <= POLL_WAIT;

                POLL_WAIT: begin
                    if (phy_rx_valid) status_reg <= phy_rx_data;
                    if (phy_done) begin
                        if (!status_reg[0]) state <= poll_return;
                        else if (poll_count == POLL_BITS'(POLL_LIMIT - 1)) begin
                            state <= FAULT;
                            error_code <= 3'd3;
                            dma_read_data_valid <= 0;
                        end else begin
                            poll_count <= poll_count + 1'b1;
                            state <= POLL_START;
                        end
                    end
                end

                WREN: if (phy_ready) state <= WREN_WAIT;

                WREN_WAIT: if (phy_done) state <= WEL_READ;

                WEL_READ: if (phy_ready) state <= WEL_WAIT;

                WEL_WAIT: begin
                    if (phy_rx_valid) status_reg <= phy_rx_data;
                    if (phy_done) begin
                        if (!status_reg[1]) begin
                            state <= FAULT;
                            error_code <= 3'd4;
                            dma_read_data_valid <= 0;
                        end else state <= PROGRAM_START;
                    end
                end

                IDLE: begin
                    if (dma_read_cmd_valid) begin
                        if (read_end > 33'h1000000) begin
                            state <= FAULT;
                            error_code <= 3'd1;
                            dma_read_data_valid <= 0;
                        end else begin
                            addr <= dma_read_cmd_addr[23:0];
                            beats_left <= {1'b0, dma_read_cmd_len} + 9'd1;
                            read_byte <= 0;
                            state <= READ_START;
                        end
                    end else if (dma_write_cmd_valid) begin
                        if (write_end > 33'h1000000) begin
                            state <= FAULT;
                            error_code <= 3'd1;
                            dma_read_data_valid <= 0;
                        end else begin
                            addr <= dma_write_cmd_addr[23:0];
                            beats_left <= {1'b0, dma_write_cmd_len} + 9'd1;
                            program_open <= 0;
                            state <= WRITE_GET;
                        end
                    end
                end

                READ_START: if (phy_ready) state <= READ_DATA;

                READ_DATA:
                    if (phy_rx_valid) begin
                        dma_read_data[read_byte*8+:8] <= phy_rx_data;
                        if (read_byte == 7) begin
                            dma_read_data_last <= beats_left == 1;
                            beats_left <= beats_left - 1'b1;
                            read_byte <= 0;
                            state <= READ_CLOSE;
                        end else read_byte <= read_byte + 1'b1;
                    end

                READ_CLOSE:
                    if (phy_done) begin
                        dma_read_data_valid <= 1;
                        addr <= addr + 24'd8;
                        state <= READ_HOLD;
                    end

                READ_HOLD:
                    if (dma_read_data_ready) begin
                        dma_read_data_valid <= 0;
                        state <= dma_read_data_last ? IDLE : READ_START;
                    end

                WRITE_GET:
                    if (dma_write_data_valid) begin
                        if (dma_write_data_last != (beats_left == 1)) begin
                            state <= FAULT;
                            error_code <= 3'd2;
                            dma_read_data_valid <= 0;
                        end else begin
                            write_buf <= dma_write_data;
                            write_mask <= dma_write_strb;
                            bytes_left <= 8;
                            beats_left <= beats_left - 1'b1;
                            state <= WRITE_SCAN;
                        end
                    end

                WRITE_SCAN: begin
                    if (bytes_left == 0) begin
                        if (beats_left != 0) state <= WRITE_GET;
                        else if (program_open) begin
                            poll_return <= WRITE_RESPONSE;
                            state <= CLOSE_WAIT;
                        end else state <= WRITE_RESPONSE;
                    end else if (!write_mask[0]) begin
                        if (program_open) begin
                            poll_return <= WRITE_SCAN;
                            state <= CLOSE_WAIT;
                        end else begin
                            addr <= addr + 1'b1;
                            bytes_left <= bytes_left - 1'b1;
                            write_buf <= write_buf >> 8;
                            write_mask <= write_mask >> 1;
                        end
                    end else if (program_open) state <= WRITE_SEND;
                    else state <= WREN;
                end

                PROGRAM_START:
                    if (phy_ready) begin
                        program_open <= 1;
                        state <= WRITE_SEND;
                    end

                WRITE_SEND:
                    if (phy_tx_ready) begin
                        addr <= addr + 1'b1;
                        bytes_left <= bytes_left - 1'b1;
                        write_buf <= write_buf >> 8;
                        write_mask <= write_mask >> 1;
                        state <= WRITE_BYTE_WAIT;
                    end

                WRITE_BYTE_WAIT: begin
                    if (phy_done) begin
                        program_open <= 0;
                        begin
                            state <= POLL_START;
                            poll_return <= WRITE_SCAN;
                            poll_count <= 0;
                        end
                    end else if (phy_tx_ready) state <= WRITE_SCAN;
                end

                CLOSE_WAIT:
                    if (phy_done) begin
                        program_open <= 0;
                        state <= POLL_START;
                        poll_count <= 0;
                    end

                WRITE_RESPONSE: if (dma_write_rsp_ready) state <= IDLE;

                FAULT: ;  // no false success; host must inspect error and reset

                default: begin
                    state <= FAULT;
                    error_code <= 3'd3;
                    dma_read_data_valid <= 0;
                end
            endcase
        end
    end
endmodule
