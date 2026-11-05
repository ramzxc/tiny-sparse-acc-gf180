// 16-bit or 32-bit words serialized over one 64x8, 256x8 or 512x8 single-port GF180 macro.
// MACRO_BYTES selects physical capacity; DEPTH limits the usable word count.
// The caller must not assert read and write requests together. Scheduling is
// handled upstream; each accepted request owns all byte accesses.
module sram_ctrl #(
    parameter int MACRO_BYTES = 64,
    parameter int DATA_WIDTH = 16,
    parameter int DEPTH = MACRO_BYTES / (DATA_WIDTH / 8),
    parameter int ADDR_WIDTH = $clog2(MACRO_BYTES / (DATA_WIDTH / 8))
)(
    input  logic                  clk,
    input  logic                  rst,

    input  logic [ADDR_WIDTH-1:0] read_req_addr,
    input  logic                  read_req_valid,
    output logic                  read_req_ready,
    output logic [DATA_WIDTH-1:0] read_rsp_data,
    output logic                  read_rsp_valid,
    input  logic                  read_rsp_ready,

    input  logic [ADDR_WIDTH-1:0] write_addr,
    input  logic [DATA_WIDTH-1:0] write_data,
    input  logic                  write_valid,
    output logic                  write_ready,
    output logic                  write_done,
    output logic                  busy
);
    localparam int MACRO_ADDR_WIDTH = $clog2(MACRO_BYTES);
    localparam int WORD_BYTES = DATA_WIDTH / 8;
    localparam int BYTE_INDEX_WIDTH = $clog2(WORD_BYTES);
    localparam int WORD_ADDR_WIDTH = MACRO_ADDR_WIDTH - BYTE_INDEX_WIDTH;

    typedef enum logic [1:0] { IDLE, READ_BYTES, WRITE_BYTES } state_type;
    state_type state;
    logic read_fire, write_fire, last_byte;
    logic [WORD_ADDR_WIDTH-1:0] saved_addr;
    logic [DATA_WIDTH-1:0] saved_data;
    logic [BYTE_INDEX_WIDTH-1:0] byte_index;
    logic [MACRO_ADDR_WIDTH-1:0] macro_addr;
    logic [7:0] macro_data, macro_write_data;
    logic macro_enable, macro_write;

    assign busy = state != IDLE;
    assign read_req_ready = !rst && state == IDLE &&
                            (!read_rsp_valid || read_rsp_ready);
    assign write_ready = !rst && state == IDLE;
    assign read_fire = read_req_valid && read_req_ready;
    assign write_fire = write_valid && write_ready;
    assign last_byte = byte_index == BYTE_INDEX_WIDTH'(WORD_BYTES - 1);

    // Byte zero is accessed on acceptance. A read captures the preceding
    // SRAM response while issuing the next byte access.
    assign macro_enable = !rst && (read_fire || write_fire ||
        (state == READ_BYTES && !last_byte) || state == WRITE_BYTES);
    assign macro_write = write_fire || state == WRITE_BYTES;
    assign macro_write_data = state == WRITE_BYTES
        ? saved_data[byte_index * 8 +: 8] : write_data[7:0];

    always_comb begin
        if (state == READ_BYTES)
            macro_addr = {saved_addr, BYTE_INDEX_WIDTH'(byte_index + 1'b1)};
        else if (state == WRITE_BYTES)
            macro_addr = {saved_addr, byte_index};
        else if (write_fire)
            macro_addr = {write_addr[WORD_ADDR_WIDTH-1:0], {BYTE_INDEX_WIDTH{1'b0}}};
        else
            macro_addr = {read_req_addr[WORD_ADDR_WIDTH-1:0], {BYTE_INDEX_WIDTH{1'b0}}};
    end

    sram_wrapper #(
        .MACRO_BYTES(MACRO_BYTES)
    ) storage (
        .clk(clk),
        .enable(macro_enable),
        .write_enable(macro_write),
        .addr(macro_addr),
        .write_data(macro_write_data),
        .read_data(macro_data)
    );

    always_ff @(posedge clk) begin
        if (rst) begin
            state          <= IDLE;
            saved_addr     <= '0;
            saved_data     <= '0;
            byte_index     <= '0;
            read_rsp_data  <= '0;
            read_rsp_valid <= 1'b0;
            write_done     <= 1'b0;
        end else begin
            write_done <= 1'b0;

            if (read_rsp_valid && read_rsp_ready)
                read_rsp_valid <= 1'b0;

            case (state)
                IDLE: begin
                    if (read_fire) begin
                        saved_addr <= read_req_addr[WORD_ADDR_WIDTH-1:0];
                        byte_index <= '0;
                        state <= READ_BYTES;
                    end else if (write_fire) begin
                        saved_addr <= write_addr[WORD_ADDR_WIDTH-1:0];
                        saved_data <= write_data;
                        byte_index <= BYTE_INDEX_WIDTH'(1);
                        state <= WRITE_BYTES;
                    end
                end

                READ_BYTES: begin
                    read_rsp_data[byte_index * 8 +: 8] <= macro_data;
                    if (last_byte) begin
                        read_rsp_valid <= 1'b1;
                        state <= IDLE;
                    end else byte_index <= byte_index + 1'b1;
                end

                WRITE_BYTES: begin
                    if (last_byte) begin
                        write_done <= 1'b1;
                        state <= IDLE;
                    end else byte_index <= byte_index + 1'b1;
                end

                default: state <= IDLE;
            endcase
        end
    end

`ifndef SYNTHESIS
    always @(posedge clk) begin
        if (!rst) begin
            assert (!(read_req_valid && write_valid))
                else $fatal(1, "Simultaneous SRAM read/write requests");

            if (read_fire)
                assert (int'(read_req_addr) < DEPTH)
                    else $fatal(1, "SRAM read address outside depth");

            if (write_fire)
                assert (int'(write_addr) < DEPTH)
                    else $fatal(1, "SRAM write address outside depth");
        end
    end

    initial begin
        assert ((MACRO_BYTES == 64 || MACRO_BYTES == 256 || MACRO_BYTES == 512) && (DATA_WIDTH == 16 || DATA_WIDTH == 32) &&
                DEPTH > 0 && DEPTH <= MACRO_BYTES / WORD_BYTES && ADDR_WIDTH >= WORD_ADDR_WIDTH)
            else $fatal(1, "Unsupported GF180 SRAM controller geometry");
    end
`endif
endmodule
