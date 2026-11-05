`timescale 1ns/1ps
// Temporary routing experiment: tiny standard-cell memory, no SRAM macro.
// Preserve synchronous reads, output hold, and byte-write timing.
// No power-up contents or reset clearing are assumed.
module sram_wrapper #(
    parameter int MACRO_BYTES = 8
)(
    input  logic                          clk,
    input  logic                          enable,
    input  logic                          write_enable,
    input  logic [$clog2(MACRO_BYTES)-1:0] addr,
    input  logic [7:0]                    write_data,
    output logic [7:0]                    read_data
);
    logic [7:0] mem [0:MACRO_BYTES-1];

    always_ff @(posedge clk) begin
        if (enable) begin
            if (write_enable)
                mem[addr] <= write_data;
            else
                read_data <= mem[addr];
        end
    end
endmodule
