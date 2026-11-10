`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
module tb_fixed8_exhaustive;
    reg clk=0, rst_n=0;
    always #5 clk=!clk;
    reg [8:0] exe_inst_in=0;
    reg exe_inst_in_val=0;
    reg [7:0] weight_data=0, input_data=0;
    reg weight_data_val=0, input_data_val=0;
    wire [7:0] vpu_res_out;
    wire [2:0] act_op_out;
    wire vpu_res_out_val;
    vpu dut (.*);
    localparam SCALE=1 << `FIXED_FRAC_BITS;
    integer a,b,c,value,n,checks=0;
    reg [7:0] old;
    initial begin
        repeat(2) @(negedge clk);
        rst_n=1;
        for(integer x=0;x<256;x++) begin
            for(integer w=0;w<256;w++) begin
                for(integer op=0;op<5;op++) begin
                    // Alternating extremes exercise cancellation before saturation.
                    old=(x+w)%2 ? 8'h80 : 8'h7f;
                    input_data=old; input_data_val=1;
                    @(negedge clk);
                    input_data_val=0;
                    exe_inst_in={`EXE_MODE_INPUT,7'b0};exe_inst_in_val=1;
                    @(negedge clk);
                    exe_inst_in_val=0;input_data=8'(x);weight_data=8'(w);
                    input_data_val=1;weight_data_val=1;
                    @(negedge clk);
                    input_data_val=0;weight_data_val=0;
                    exe_inst_in={2'b0,1'b1,3'b0,op==4,2'(op==4 ? 2 : op)};
                    exe_inst_in_val=1;
                    a=x>=128 ? x-256 : x;b=w>=128 ? w-256 : w;
                    c=old[7] ? int'(old)-256 : int'(old);
                    case(op)
                        0: value=a+b;
                        1: value=a-b;
                        3: value=b-a;
                        default: begin
                            n=a*b+SCALE/2;
                            value=n<0 ? -((-n+SCALE-1)/SCALE) : n/SCALE;
                            if(op==4) value=value+c;
                        end
                    endcase
                    if(value>127) value=127;
                    if(value< -128) value= -128;
                    @(negedge clk);
                    if(!vpu_res_out_val || vpu_res_out!==8'(value))
                        $fatal(1,"F=%0d x=%0d w=%0d op=%0d expected=%0d got=%h",`FIXED_FRAC_BITS,a,b,op,value,vpu_res_out);
                    exe_inst_in_val=0;
                    checks++;
                end
            end
        end
        // Operand writes concurrent with Execute use the previous operands.
        input_data=0;weight_data=0;input_data_val=1;weight_data_val=1;
        exe_inst_in={`EXE_MODE_COMPUTE,7'b0};exe_inst_in_val=1;
        @(negedge clk);
        if(vpu_res_out !== 8'hfe) $fatal(1,"Simultaneous load/execute changed semantics");
        rst_n=0;
        @(negedge clk);
        if(vpu_res_out_val || vpu_res_out!==0) $fatal(1,"Reset priority");
        $display("PASS fixed8 F=%0d: %0d exhaustive arithmetic cases, old-operand semantics, reset",`FIXED_FRAC_BITS,checks);
        $finish;
    end
endmodule
