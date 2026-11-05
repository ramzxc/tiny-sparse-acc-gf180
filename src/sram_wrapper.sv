`timescale 1ns/1ps
// One byte-wide GF180 SRAM macro, selected by physical capacity.
// No power-up contents or reset clearing are assumed.
module sram_wrapper #(
    parameter int MACRO_BYTES = 64
)(
    input  logic                           clk,
    input  logic                           enable,
    input  logic                           write_enable,
    input  logic [$clog2(MACRO_BYTES)-1:0] addr,
    input  logic [7:0]                     write_data,
    output wire  [7:0]                     read_data
);
    // The vendor model samples live controls 100 ps after the clock edge.
    // Retain pre-edge values through that sampling point in simulation.
    wire cen_pin, gwen_pin;
    wire [$clog2(MACRO_BYTES)-1:0] addr_pin;
    wire [7:0] data_pin;

`ifdef SYNTHESIS
    assign cen_pin = !enable;
    assign gwen_pin = !write_enable;
    assign addr_pin = addr;
    assign data_pin = write_data;
`else
    assign #1 cen_pin = !enable;
    assign #1 gwen_pin = !write_enable;
    assign #1 addr_pin = addr;
    assign #1 data_pin = write_data;

    supply1 vdd;
    supply0 vss;

    initial begin
        assert (MACRO_BYTES == 64 || MACRO_BYTES == 256 || MACRO_BYTES == 512)
            else $fatal(1, "Unsupported GF180 SRAM macro capacity");
    end
`endif

    generate
        if (MACRO_BYTES == 64) begin : gen_sram64
            gf180mcu_fd_ip_sram__sram64x8m8wm1 mem (
                .CLK(clk),
                .CEN(cen_pin),
                .GWEN(gwen_pin),
                .WEN(8'h00),
                .A(addr_pin),
                .D(data_pin),
                .Q(read_data)
`ifndef SYNTHESIS
                ,.VDD(vdd), .VSS(vss)
`endif
            );

`ifndef SYNTHESIS
            initial begin
                #0.001;
                if ($test$plusargs("uninit_sram") || $test$plusargs("uninit_accum_sram"))
                    for (int a = 0; a < MACRO_BYTES; a++)
                        mem.mem[a] = 'x;
            end
`endif
        end else if (MACRO_BYTES == 256) begin : gen_sram256
            gf180mcu_fd_ip_sram__sram256x8m8wm1 mem (
                .CLK(clk),
                .CEN(cen_pin),
                .GWEN(gwen_pin),
                .WEN(8'h00),
                .A(addr_pin),
                .D(data_pin),
                .Q(read_data)
`ifndef SYNTHESIS
                ,.VDD(vdd), .VSS(vss)
`endif
            );

`ifndef SYNTHESIS
            initial begin
                #0.001;
                if ($test$plusargs("uninit_sram") || $test$plusargs("uninit_accum_sram"))
                    for (int a = 0; a < MACRO_BYTES; a++)
                        mem.mem[a] = 'x;
            end
`endif        end else if (MACRO_BYTES == 512) begin : gen_sram512
            gf180mcu_fd_ip_sram__sram512x8m8wm1 mem (
                .CLK(clk),
                .CEN(cen_pin),
                .GWEN(gwen_pin),
                .WEN(8'h00),
                .A(addr_pin),
                .D(data_pin),
                .Q(read_data)
`ifndef SYNTHESIS
                ,.VDD(vdd), .VSS(vss)
`endif
            );

`ifndef SYNTHESIS
            initial begin
                #0.001;
                if ($test$plusargs("uninit_sram") || $test$plusargs("uninit_accum_sram"))
                    for (int a = 0; a < MACRO_BYTES; a++)
                        mem.mem[a] = 'x;
            end
`endif
        end
    endgenerate
endmodule
