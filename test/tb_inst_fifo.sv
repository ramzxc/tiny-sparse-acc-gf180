`timescale 1ns/1ps
`include "defs/defs.vh"
module tb_inst_fifo #(parameter integer DEPTH = 2);
    reg clk = 0;
    always #5 clk = !clk;
    reg rst_n = 0, inst_val = 0, core_rdy = 0;
    reg [31:0] inst = 0;
    wire fifo_rdy, inst_out_val;
    wire [31:0] inst_out;
    inst_fifo #(.FIFO_DEPTH(DEPTH), .WORD_WIDTH(32)) dut (.*);

    reg [31:0] expected [0:4095];
    integer head = 0, tail = 0, used = 0, deliveries = 0;
    reg will_pop, will_push;
    always @(posedge clk) begin
        if (!rst_n) begin
            head = 0;
            tail = 0;
            used = 0;
        end else begin
            will_pop = core_rdy && used != 0;
            will_push = inst_val && used < DEPTH;
            if (inst_out_val !== (used != 0)) $fatal(1, "Core valid mismatch");
            if (used != 0 && inst_out !== expected[head]) $fatal(1, "FIFO ordering/data mismatch");
            // Empty FIFO data is unspecified; inst_out_val must be LOW.
            if (will_pop) begin
                head++;
                used--;
                deliveries++;
            end
            if (will_push) begin
                expected[tail] = inst;
                tail++;
                used++;
            end
        end
    end

    task automatic receive_word(input [31:0] word_value);
        begin
            @(negedge clk);
            if (!fifo_rdy) $fatal(1, "Missing READY request");
            repeat (9) begin
                @(negedge clk);
                if (!fifo_rdy) $fatal(1, "Request dropped before RX arrival");
            end
            inst = word_value;
            inst_val = 1;
            #1;
            if (fifo_rdy) $fatal(1, "Request did not drop on RX response");
            @(negedge clk);
            inst_val = 0;
        end
    endtask

    integer seed = 32'h982b;
    initial begin
        repeat (3) @(negedge clk);
        rst_n = 1;
        for (integer i=0; i<DEPTH; i++) receive_word(32'h12340000+i);
        #1;
        if (fifo_rdy) $fatal(1, "Full FIFO advertised a free slot");
        // Full receive is rejected without corrupting the queued words.
        inst_val = 1;
        inst = 32'hbadbad00;
        @(negedge clk);
        inst_val = 0;
        // A full FIFO rejects input even when a word is popped on this edge.
        core_rdy = 1;
        inst_val = 1;
        inst = 32'h5678ffff;
        @(negedge clk);
        inst_val = 0;
        repeat (DEPTH+2) @(negedge clk);
        if (used != 0) $fatal(1, "FIFO did not drain");

        // Stress pointers, simultaneous pop/push and backpressure.
        for (integer i=0; i<1000; i++) begin
            core_rdy = ($random(seed) & 3) == 0;
            inst_val = ($random(seed) & 1) != 0;
            inst = 32'h80000000 + i;
            @(negedge clk);
        end
        inst_val = 0;
        core_rdy = 1;
        repeat (DEPTH+2) @(negedge clk);
        if (used != 0) $fatal(1, "Random traffic did not drain");

        // Reset clears the FIFO and suppresses the request while reset is asserted.
        core_rdy = 0;
        repeat (3) @(negedge clk);
        rst_n = 0;
        repeat (2) @(negedge clk);
        if (fifo_rdy || inst_out_val) $fatal(1, "Activity during reset");
        rst_n = 1;
        receive_word(32'h12345678);
        core_rdy = 1;
        repeat (3) @(negedge clk);
        $display("PASS inst_fifo depth=%0d: request/response, full, simultaneous push/pop, wrap, reset (%0d deliveries)", DEPTH, deliveries);
        $finish;
    end
    initial begin #1000000; $fatal(1, "Timeout"); end
endmodule
