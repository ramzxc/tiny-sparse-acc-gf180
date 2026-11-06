// APS6404L-3SQR-SN, as used by tinyQV's QSPI Pmod.
// Board must enter QPI mode (SPI 35h) while ASIC pins are disconnected.
// A transaction transfers one complete 16/32-bit row without backpressure.
// At 10MHz clk, SCK=5MHz and CS-low time stays below the 8us limit (-40..85C).
module psram_ctrl
    import tpu_pkg::*;
(
    input  logic clk, rst,
    input  psram_req_type [2:0] req,
    input  logic [2:0] req_valid,
    output logic [2:0] req_ready,
    output logic [2:0][31:0] rsp_data,
    output logic [2:0] rsp_valid,

    output qspi_cmd_type bus_cmd,
    output logic bus_cmd_valid,
    input  logic bus_cmd_ready,
    output qspi_tx_type bus_tx,
    input  logic bus_tx_ready,
    input  logic [7:0] bus_rx_data,
    input  logic bus_rx_valid,
    output logic bus_rx_ready,
    input  logic bus_done
);
    typedef enum logic [1:0] {IDLE, COMMAND, TRANSFER} state_type;
    state_type state;
    psram_req_type saved_req;
    logic [1:0] owner, next_owner, selected, byte_index;
    logic found;
    logic [31:0] read_data;

    // Round robin over the three buffers. A request is captured before bus use.
    always_comb begin
        found = 0;
        selected = next_owner;
        req_ready = '0;
        case (next_owner)
            0: begin
                if (req_valid[0]) begin found = 1; selected = 0; end
                else if (req_valid[1]) begin found = 1; selected = 1; end
                else if (req_valid[2]) begin found = 1; selected = 2; end
            end
            1: begin
                if (req_valid[1]) begin found = 1; selected = 1; end
                else if (req_valid[2]) begin found = 1; selected = 2; end
                else if (req_valid[0]) begin found = 1; selected = 0; end
            end
            default: begin
                if (req_valid[2]) begin found = 1; selected = 2; end
                else if (req_valid[0]) begin found = 1; selected = 0; end
                else if (req_valid[1]) begin found = 1; selected = 1; end
            end
        endcase
        if (!rst && state == IDLE && found) req_ready[selected] = 1;
    end

    always_comb begin
        bus_cmd = '0;
        bus_cmd.opcode = saved_req.write ? 8'h02 : 8'h0b;
        bus_cmd.addr = saved_req.addr;
        bus_cmd.has_addr = 1;
        bus_cmd.header_quad = 1;
        bus_cmd.dummy = saved_req.write ? 0 : 4;
        bus_cmd.direction = saved_req.write ? 2 : 1;
        bus_cmd.quad = 1;
        bus_cmd.count = saved_req.wide ? 4 : 2;
        bus_cmd_valid = !rst && state == COMMAND;

        bus_tx = '0;
        bus_tx.valid = state == TRANSFER && saved_req.write;
        bus_tx.data = saved_req.data[byte_index*8 +: 8];
        bus_tx.last = byte_index == (saved_req.wide ? 3 : 1);
        bus_rx_ready = state == TRANSFER && !saved_req.write;
        rsp_data = {3{read_data}};
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            saved_req <= '0;
            owner <= 0;
            next_owner <= 0;
            byte_index <= 0;
            read_data <= 0;
            rsp_valid <= 0;
        end else begin
            rsp_valid <= 0;
            case (state)
                IDLE: if (found) begin
                    saved_req <= req[selected];
                    owner <= selected;
                    next_owner <= selected == 2 ? 0 : selected + 1'b1;
                    byte_index <= 0;
                    read_data <= 0;
                    state <= COMMAND;
                end

                COMMAND: if (bus_cmd_ready) state <= TRANSFER;

                TRANSFER: begin
                    if (bus_rx_valid && bus_rx_ready) begin
                        read_data[byte_index*8 +: 8] <= bus_rx_data;
                        byte_index <= byte_index + 1'b1;
                    end
                    if (bus_tx.valid && bus_tx_ready) byte_index <= byte_index + 1'b1;
                    if (bus_done) begin
                        rsp_valid[owner] <= 1;
                        state <= IDLE;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end
endmodule
