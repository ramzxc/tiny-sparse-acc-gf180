`timescale 1ns/1ps
`include "defs/defs.vh"
module tb_act;
    reg clk=0;
    always #5 clk=!clk;
    reg rst_n=0, vpu_res_in_val=0;
    reg [15:0] vpu_res_in=0;
    reg [2:0] act_op_in=0;
    wire [15:0] act_res_out;
    wire act_res_out_val;
    act dut (.*);
    // Independent exact-rational oracle vectors from acc/sim/fp8/reference.py.
    // Record: input FP8, FP16 conversion (unused), hard-sigmoid, hard-tanh.
    reg [39:0] vectors [0:255];
    function automatic [7:0] expected(input integer op, input integer x);
        case(op)
            0: expected=8'(x);
            1: expected=((x & 127)==127) ? 8'h7f : (x & 128) ? 0 : 8'(x);
            2: expected=vectors[x][15:8];
            3: expected=vectors[x][7:0];
            4: expected=((x & 127)==127) ? 8'h7f : (!(x & 128) && (x & 127)!=0) ? 8'h38 : 0;
        endcase
    endfunction
    reg [15:0] held;
    initial begin
        $readmemh("test/vectors/fp8_unary.hex",vectors);
        repeat (2) @(negedge clk);
        if (act_res_out !== 0 || act_res_out_val !== 0) $fatal(1,"Reset");
        rst_n=1;
        for(integer op=0;op<5;op++) begin
            for(integer x=0;x<256;x++) begin
                act_op_in=3'(op);
                vpu_res_in={8'(255-x),8'(x)};
                vpu_res_in_val=1;
                @(negedge clk);
                if (!act_res_out_val || act_res_out !== {expected(op,255-x),expected(op,x)})
                    $fatal(1,"Activation mismatch op=%0d x=%h got=%h",op,x,act_res_out);
            end
        end
        held=act_res_out;
        vpu_res_in_val=0;
        vpu_res_in=16'hffff;
        repeat(3) begin
            @(negedge clk);
            if(act_res_out_val || act_res_out !== held) $fatal(1,"Hold/valid");
        end
        rst_n=0; vpu_res_in_val=1;
        @(negedge clk);
        if(act_res_out_val || act_res_out !== 0) $fatal(1,"Reset priority");
        rst_n=1; act_op_in=0; vpu_res_in=16'hb838;
        @(negedge clk);
        if(!act_res_out_val || act_res_out !== 16'hb838) $fatal(1,"Recovery");
        $display("PASS act: all 256 FP8 inputs x 5 modes x 2 lanes, consecutive results, hold, reset");
        $finish;
    end
endmodule
