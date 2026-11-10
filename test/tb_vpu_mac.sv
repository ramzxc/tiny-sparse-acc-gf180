`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
module tb_vpu_mac;
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
    string path;
    integer fd, parsed, count=0;
    reg [7:0] x,w,previous,expected;
    reg [6:0] control;
    initial begin
        if (!$value$plusargs("vectors=%s",path)) $fatal(1,"Missing vectors");
        fd=$fopen(path,"r");
        if (!fd) $fatal(1,"Cannot open vectors");
        repeat(2) @(negedge clk);
        rst_n=1;
        forever begin
            parsed=$fscanf(fd,"%h %h %h %h %h",x,w,previous,control,expected);
            if (parsed!=5) begin
                if (!$feof(fd)) $fatal(1,"Malformed vector");
                $display("PASS single-lane MAC: %0d exact-FP8 cases, ADD/SUB ignore accumulate, MUL accumulation, signed zero, NaN, saturation, sparse",count);
                $finish;
            end
            // Seed the live accumulator using PASS; no extra arithmetic/rounding.
            input_data=previous; input_data_val=1;
            @(negedge clk);
            input_data_val=0;
            exe_inst_in={`EXE_MODE_INPUT,7'b0}; exe_inst_in_val=1;
            @(negedge clk);
            exe_inst_in_val=0;
            input_data=x; weight_data=w; input_data_val=1; weight_data_val=1;
            @(negedge clk);
            input_data_val=0; weight_data_val=0;
            exe_inst_in={`EXE_MODE_COMPUTE,control}; exe_inst_in_val=1;
            @(negedge clk);
            if (!vpu_res_out_val || vpu_res_out!==expected || act_op_out!==control[5:3])
                $fatal(1,"Case %0d x=%h w=%h old=%h ctrl=%h got=%h expected=%h",count,x,w,previous,control,vpu_res_out,expected);
            exe_inst_in_val=0; exe_inst_in=0;
            input_data=~x; weight_data=~w; input_data_val=1; weight_data_val=1;
            @(negedge clk);
            input_data_val=0; weight_data_val=0;
            if (vpu_res_out_val || vpu_res_out!==expected) $fatal(1,"Result hold/valid");
            count++;
        end
    end
    initial begin #10000000; $fatal(1,"Timeout"); end
endmodule
