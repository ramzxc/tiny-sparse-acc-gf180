`timescale 1ns/1ps
// Routing experiment: one 64-byte SRAM for weights; smaller buffers use flops.
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
    generate
        if (MACRO_BYTES == 64) begin : gen_sram64
            wire cen_pin, gwen_pin;
            wire [5:0] addr_pin;
            wire [7:0] data_pin;

`ifdef SYNTHESIS
            assign cen_pin = !enable;
            assign gwen_pin = !write_enable;
            assign addr_pin = addr;
            assign data_pin = write_data;
`else
            // Vendor model samples controls 100 ps after the clock edge.
            assign #1 cen_pin = !enable;
            assign #1 gwen_pin = !write_enable;
            assign #1 addr_pin = addr;
            assign #1 data_pin = write_data;
            supply1 vdd;
            supply0 vss;
`endif

            gf180mcu_fd_ip_sram__sram64x8m8wm1 mem (
                .CLK(clk), .CEN(cen_pin), .GWEN(gwen_pin), .WEN(8'h00),
                .A(addr_pin), .D(data_pin), .Q(read_data)
`ifndef SYNTHESIS
                ,.VDD(vdd), .VSS(vss)
`endif
            );

`ifndef SYNTHESIS
            initial begin
                #0.001;
                if ($test$plusargs("uninit_sram"))
                    for (int a = 0; a < MACRO_BYTES; a++)
                        mem.mem[a] = 'x;
            end
`endif
        end else begin : gen_flops
            logic [7:0] mem [0:MACRO_BYTES-1];

            always_ff @(posedge clk) begin
                if (enable) begin
                    if (write_enable)
                        mem[addr] <= write_data;
                    else
                        read_data <= mem[addr];
                end
            end
        end
    endgenerate
endmodule
