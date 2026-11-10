`include "defs/defs.vh"

// Protocol reference: TinyQV TT06 cpu/qspi_ctrl.v, commit
// dfbd5e3882442c07e4627bfb5f627ba7bff00baf (Michael Bell).
// Uses its QPI PSRAM commands, shared CS selection and shift-register approach.
// This is an adaptation, not the silicon-tested TinyQV RTL: Flash programming
// and fixed 16-bit request/response handling are our own additions.
//
// One aligned 16-bit request at a time. Mode 0, SCK = clk / 2.
// Board setup: PSRAMs in QPI; Flash in SPI with QE=1, not continuous read.
// Flash program targets must already be erased/unprotected. No erase interface.
// Address map: 0xxxxxx=Flash, 10xxxxx=PSRAM A, 11xxxxx=PSRAM B.
// Fixed 8-bit bytes; req_data[7:0] goes to the lower byte address.
// Status polling has no timeout/error port: failed WREN or permanent busy waits.
// Reset aborts the bus transaction; it cannot undo a memory write already made.
module qspi_ctrl (
    input clk,
    input rst_n,

    input req_val,
    output req_rdy,
    input req_write,
    input [24:0] req_addr,
    input [`DATA_WIDTH*2-1:0] req_data,

    output reg [`DATA_WIDTH*2-1:0] read_data,
    output reg read_data_val,

    output reg sck,
    output reg flash_sc_n,
    output reg psram_a_sc_n,
    output reg psram_b_sc_n,
    input [3:0] dq_in,
    output reg [3:0] dq_out,
    output reg [3:0] dq_oe
);

    localparam [3:0]
        IDLE = 0, SELECT = 1, CMD = 2, ADDR = 3,
        DUMMY = 4, DATA = 5, STATUS = 6, DESELECT = 7,
        CHECK = 8;

    // Each Flash operation may require several separate CS transactions.
    localparam [2:0]
        MEMORY = 0, WAIT_READY = 1, WRITE_ENABLE = 2,
        CHECK_ENABLE = 3, WAIT_PROGRAM = 4;

    reg [3:0] state;
    reg [2:0] operation;
    reg [1:0] chip;
    reg [23:0] addr_shift;
    reg write_reg;
    reg [7:0] cmd_shift;
    reg [15:0] data_shift;
    reg [1:0] status_shift; // Keep only the last two status bits: WEL and WIP.
    reg [4:0] cycles_left;

    wire is_ram = chip[1];
    wire [7:0] memory_opcode = is_ram
        ? (write_reg ? 8'h02 : 8'h0b)
        : (write_reg ? 8'h32 : 8'h6b);

    // Odd byte addresses are unsupported, so they are not accepted.
    assign req_rdy = rst_n && state == IDLE && !req_addr[0];

    // SPI headers/status keep Flash WP_n and HOLD_n high.
    // QPI headers and payloads use all four pins. Reads release the bus.
    always @(*) begin
        dq_out = 4'b1100;
        dq_oe = 4'b0000;

        case (state)
            CMD: begin
                if (is_ram) begin
                    dq_out = cmd_shift[7:4];
                    dq_oe = 4'b1111;
                end else begin
                    dq_out[0] = cmd_shift[7];
                    dq_oe = 4'b1101;
                end
            end
            ADDR: begin
                if (is_ram) begin
                    dq_out = addr_shift[23:20];
                    dq_oe = 4'b1111;
                end else begin
                    dq_out[0] = addr_shift[23];
                    dq_oe = 4'b1101;
                end
            end
            DATA: begin
                if (write_reg) begin
                    dq_out = data_shift[15:12];
                    dq_oe = 4'b1111;
                end
            end
            STATUS: dq_oe = 4'b1101; // Status returned on IO1.
            default: begin end
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            operation <= MEMORY;
            chip <= 0;
            addr_shift <= 0;
            write_reg <= 0;
            cmd_shift <= 0;
            data_shift <= 0;
            status_shift <= 0;
            cycles_left <= 0;
            read_data <= 0;
            read_data_val <= 0;
            sck <= 0;
            flash_sc_n <= 1;
            psram_a_sc_n <= 1;
            psram_b_sc_n <= 1;
        end else begin
            read_data_val <= 0;

            case (state)
                IDLE: begin
                    if (req_val && req_rdy) begin
                        chip <= req_addr[24:23];
                        addr_shift <= req_addr[24]
                            ? {1'b0, req_addr[22:0]} : req_addr[23:0];
                        write_reg <= req_write;
                        // Low byte is sent first, most significant nibble first.
                        data_shift <= {req_data[7:0], req_data[15:8]};
                        operation <= req_addr[24] ? MEMORY : WAIT_READY;
                        state <= SELECT;
                    end
                end

                SELECT: begin
                    flash_sc_n <= is_ram;
                    psram_a_sc_n <= chip != 2'b10;
                    psram_b_sc_n <= chip != 2'b11;
                    sck <= 0;

                    if (operation == MEMORY)
                        cmd_shift <= memory_opcode;
                    else
                        cmd_shift <= operation == WRITE_ENABLE ? 8'h06 : 8'h05;

                    cycles_left <= is_ram ? 1 : 7;
                    state <= CMD;
                end

                CMD, ADDR, DUMMY, DATA, STATUS: begin
                    // Mode 0: sample inputs on rising SCK; change outputs
                    // on falling SCK. Each half-cycle is one core clock.
                    sck <= !sck;
                    if (!sck) begin
                        if (state == DATA && !write_reg)
                            data_shift <= {data_shift[11:0], dq_in};
                        if (state == STATUS)
                            status_shift <= {status_shift[0], dq_in[1]};
                    end else begin
                        if (cycles_left != 0) begin
                            cycles_left <= cycles_left - 1'b1;
                            case (state)
                                CMD: cmd_shift <= cmd_shift << (is_ram ? 4 : 1);
                                ADDR: addr_shift <= addr_shift << (is_ram ? 4 : 1);
                                DATA: if (write_reg)
                                    data_shift <= {data_shift[11:0], 4'b0};
                                default: begin end
                            endcase
                        end else begin
                            case (state)
                                CMD: begin
                                    if (operation == MEMORY) begin
                                        cycles_left <= is_ram ? 5 : 23;
                                        state <= ADDR;
                                    end else if (operation == WRITE_ENABLE) begin
                                        state <= DESELECT;
                                    end else begin
                                        cycles_left <= 7;
                                        state <= STATUS;
                                    end
                                end
                                ADDR: begin
                                    if (write_reg) begin
                                        cycles_left <= 3;
                                        state <= DATA;
                                    end else begin
                                        cycles_left <= is_ram ? 3 : 7;
                                        state <= DUMMY;
                                    end
                                end
                                DUMMY: begin
                                    cycles_left <= 3;
                                    state <= DATA;
                                end
                                DATA: begin
                                    if (!write_reg)
                                        read_data <= {data_shift[7:0], data_shift[15:8]};
                                    state <= DESELECT;
                                end
                                STATUS: state <= DESELECT;
                                default: state <= DESELECT;
                            endcase
                        end
                    end
                end

                DESELECT: begin
                    // One core clock of hold time after the final falling SCK.
                    flash_sc_n <= 1;
                    psram_a_sc_n <= 1;
                    psram_b_sc_n <= 1;
                    state <= CHECK;
                end

                // CS has been high for one core clock on entry.
                // A following SELECT occurs one clock later (200 ns at 10 MHz).
                CHECK: begin
                    case (operation)
                        MEMORY: begin
                            if (!is_ram && write_reg) begin
                                operation <= WAIT_PROGRAM;
                                state <= SELECT;
                            end else begin
                                read_data_val <= 1;
                                state <= IDLE;
                            end
                        end
                        WAIT_READY: begin
                            if (!status_shift[0])
                                operation <= write_reg ? WRITE_ENABLE : MEMORY;
                            state <= SELECT;
                        end
                        WRITE_ENABLE: begin
                            operation <= CHECK_ENABLE;
                            state <= SELECT;
                        end
                        CHECK_ENABLE: begin
                            if (!status_shift[0] && status_shift[1])
                                operation <= MEMORY;
                            else
                                operation <= WAIT_READY;
                            state <= SELECT;
                        end
                        WAIT_PROGRAM: begin
                            if (status_shift[0])
                                state <= SELECT;
                            else begin
                                read_data_val <= 1;
                                state <= IDLE;
                            end
                        end
                        default: state <= IDLE;
                    endcase
                end

                default: begin
                    state <= IDLE;
                    sck <= 0;
                    flash_sc_n <= 1;
                    psram_a_sc_n <= 1;
                    psram_b_sc_n <= 1;
                end
            endcase
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8)
            $fatal(1, "qspi_ctrl implements 16-bit transfers with 8-bit bytes");
    end
`endif
endmodule
