`include "defs/defs.vh"
`include "defs/mem_defs.vh"

// No instruction decoding here: the core's mem_ctrl supplies action enables.
// Assert at most one enable and hold the request until rdy at a rising edge.
// Addresses are absolute, BYTE addresses (base macro + offset).
// SRC/DST must stay stable from acceptance until rdy returns HIGH.
// mem_ctrl already enforces this by blocking new commands during a transfer.
// Write data is captured on acceptance and may change afterward.
// Address setup/persistence belongs to the core's mem_ctrl, not this module.
// The core must not issue requests during reset.
module mem_itf (
    input clk,
    input rst_n,

    // Core mem_ctrl -> mem_itf: enables also serve as request-valid signals.
    input read_en,
    input write_en,
    input copy_en,
    output reg rdy,

    input [`MEM_ADDR_WIDTH-1:0] src_addr, // READ/COPY source.
    input [`MEM_ADDR_WIDTH-1:0] dst_addr, // WRITE/COPY destination.
    input [`DATA_WIDTH-1:0] write_data, // Direct WRITE only.

    // mem_itf -> core: one-clock valid pulse on READ completion.
    // WRITE/COPY completion is indicated by rdy returning high.
    output [`DATA_WIDTH-1:0] read_data,
    output reg read_data_val,

    // mem_itf -> qspi_ctrl: address held through completion, including Flash polls.
    output reg qspi_req_val,
    input qspi_req_rdy,
    output reg qspi_req_write,
    output [`MEM_ADDR_WIDTH-1:0] qspi_req_addr,
    output reg [`DATA_WIDTH-1:0] qspi_req_data,

    // qspi_read_data_val currently signals BOTH read and write completion.
    input [`DATA_WIDTH-1:0] qspi_read_data,
    input qspi_read_data_val
);

    localparam [1:0]
        IDLE = 2'd0,
        SEND = 2'd1,
        WAIT = 2'd2;

    reg [1:0] state;
    reg copy_pending;
    // Address registers live only in mem_ctrl. COPY selects DST on its write leg.
    assign qspi_req_addr = qspi_req_write ? dst_addr : src_addr;
    // QSPI holds its completed read until the next accepted transaction.
    // Our next request cannot reach QSPI before read_data_val is consumed.
    // Consumers sample read_data only when read_data_val is HIGH.
    assign read_data = qspi_read_data;

    always @(*) begin
        rdy = (state == IDLE);
        qspi_req_val = rst_n && (state == SEND);
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            copy_pending <= 0;
            qspi_req_write <= 0;
            qspi_req_data <= 0;
            read_data_val <= 0;
        end else begin
            read_data_val <= 0;

            case (state)
                IDLE: begin
                    if (read_en || write_en || copy_en) begin
                        qspi_req_write <= write_en;
                        qspi_req_data <= write_data;
                        copy_pending <= copy_en;
                        state <= SEND;
                    end
                end

                SEND: begin
                    // Keep request and data stable until QSPI accepts them.
                    if (qspi_req_rdy)
                        state <= WAIT;
                end

                WAIT: begin
                    if (qspi_read_data_val) begin
                        if (copy_pending) begin
                            // Source read finished: now write that word to destination.
                            qspi_req_write <= 1;
                            qspi_req_data <= qspi_read_data;
                            copy_pending <= 0;
                            state <= SEND;
                        end else begin
                            if (!qspi_req_write) begin
                                read_data_val <= 1;
                            end

                            // Direct request or COPY destination write completed.
                            state <= IDLE;
                        end
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule
