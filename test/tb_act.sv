`timescale 1ns/1ps
`include "defs/defs.vh"
module tb_act;
    reg clk=0;
    always #5 clk=!clk;
    reg rst_n=0, vpu_res_in_val=0;
    reg [7:0] vpu_res_in=0;
    reg [2:0] act_op_in=0;
    wire [7:0] act_res_out;
    wire act_res_out_val;
    act dut (.*);
    // Integer oracle: divide with floor after the half-LSB rounding offset.
    function automatic [7:0] expected(input integer op, input integer x);
        integer v, n, value;
        begin
            v = x >= 128 ? x-256 : x;
            n = 1 << `FIXED_FRAC_BITS;
            case(op)
                0: value=v;
                1: value=v < 0 ? 0 : v;
                2: begin
                    value = v+2;
                    value = (value < 0 ? -((-value+3)/4) : value/4) + n/2;
                    if(value<0) value=0;
                    if(value>n) value=n;
                end
                3: value=v < -n ? -n : v > n ? n : v;
                4: value=v > 0 ? n : 0;
                default: value=v;
            endcase
            expected=8'(value);
        end
    endfunction
    reg [7:0] held;
    initial begin
        repeat (2) @(negedge clk);
        if (act_res_out !== 0 || act_res_out_val !== 0) $fatal(1,"Reset");
        rst_n=1;
        for(integer op=0;op<5;op++) begin
            for(integer x=0;x<256;x++) begin
                act_op_in=3'(op);
                vpu_res_in=8'(x);
                vpu_res_in_val=1;
                @(negedge clk);
                if (!act_res_out_val || act_res_out !== expected(op,x))
                    $fatal(1,"Activation mismatch op=%0d x=%h got=%h",op,x,act_res_out);
            end
        end
        held=act_res_out;
        vpu_res_in_val=0;
        vpu_res_in=8'hff;
        repeat(3) begin
            @(negedge clk);
            if(act_res_out_val || act_res_out !== held) $fatal(1,"Hold/valid");
        end
        rst_n=0; vpu_res_in_val=1;
        @(negedge clk);
        if(act_res_out_val || act_res_out !== 0) $fatal(1,"Reset priority");
        rst_n=1; act_op_in=0; vpu_res_in=8'h38;
        @(negedge clk);
        if(!act_res_out_val || act_res_out !== 8'h38) $fatal(1,"Recovery");
        rst_n=0; vpu_res_in_val=0;
        @(negedge clk);
        if(act_res_out_val || act_res_out !== 0) $fatal(1,"Reset");
        rst_n=1;
        repeat(2) begin
            @(negedge clk);
            if(act_res_out_val) $fatal(1,"Stale result after reset");
        end
        $display("PASS act: all 256 fixed8 inputs x 5 modes, one-cycle results, hold, reset");
        $finish;
    end
endmodule
