`timescale 1ns/1ps
module tb_exec;
    reg clk = 0;
    always #5 clk = !clk;
    reg rst_n = 0;
    reg [5:0] cmd = 0;
    reg cmd_val = 0;
    reg [7:0] data = 0;
    reg data_val = 0, weight = 0;
    wire rdy, out_val;
    wire [7:0] out;
    exec_unit dut(clk, rst_n, cmd, cmd_val, rdy, data, data_val, weight, 1'b0, 1'b0, out, out_val);
    reg [29:0] vectors [0:7279];
    string path;
    integer count;

    task operand(input [7:0] value, input bit is_weight);
        @(negedge clk);
        data = value; weight = is_weight; data_val = 1;
        @(negedge clk);
        data_val = 0;
    endtask

    initial begin
        if (!$value$plusargs("vectors=%s", path) || !$value$plusargs("count=%d", count))
            $fatal(1, "Missing vectors");
        $readmemh(path, vectors);
        repeat (2) @(negedge clk);
        rst_n = 1;
        for (integer i = 0; i < count; i++) begin
            operand(vectors[i][29:22], 0);
            operand(vectors[i][21:14], 1);
            cmd = vectors[i][13:8]; cmd_val = 1;
            @(negedge clk);
            if (!out_val || !rdy || out !== vectors[i][7:0])
                $fatal(1, "case %0d: got %h, expected %h", i, out, vectors[i][7:0]);
            cmd_val = 0;
            @(negedge clk);
            if (out_val || out !== vectors[i][7:0]) $fatal(1, "output hold/valid");
        end

        // A simultaneous operand load does NOT bypass the stationary register.
        operand(8'h38, 0); // 1
        operand(8'h40, 1); // 2
        data = 8'h48; weight = 0; data_val = 1; // new input = 4
        cmd = 6'b010000; cmd_val = 1; // MUL, overwrite, no activation
        @(negedge clk);
        if (out !== 8'h40) $fatal(1, "must use previous input");
        data_val = 0;
        @(negedge clk);
        if (out !== 8'h50) $fatal(1, "must use updated input on next EXEC");
        cmd_val = 0;
        rst_n = 0;
        @(negedge clk);
        if (out !== 0 || out_val || rdy) $fatal(1, "reset");
        $display("PASS EXEC: %0d rational-reference cases, stationary operands, simultaneous load/EXEC, valid and reset", count);
        $finish;
    end
endmodule
