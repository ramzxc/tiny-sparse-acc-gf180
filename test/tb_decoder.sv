`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
module tb_decoder;
    reg clk = 0;
    always #5 clk = !clk;
    reg rst_n = 0, mem_rdy = 0, exe_rdy = 0;
    reg use_fifo = 0, direct_valid = 0;
    reg [31:0] direct_inst = 0, inst = 0;
    reg inst_val = 0;
    wire [31:0] inst_out;
    wire [`MEM_INST_WIDTH-1:0] mem_inst_out;
    wire [`EXE_INST_WIDTH-1:0] exe_inst_out;
    wire inst_out_val, fifo_rdy, core_rdy, mem_inst_out_val, exe_inst_out_val;
    wire [31:0] inst_in = use_fifo ? inst_out : direct_inst;
    wire inst_in_val = use_fifo ? inst_out_val : direct_valid;
    inst_fifo #(.WORD_WIDTH(32)) fifo (.*);
    decoder dut (.rst_n(rst_n), .inst_in(inst_in), .inst_in_val(inst_in_val),
        .core_rdy(core_rdy), .mem_rdy(mem_rdy), .exe_rdy(exe_rdy),
        .mem_inst_out(mem_inst_out), .exe_inst_out(exe_inst_out), .mem_inst_out_val(mem_inst_out_val), .exe_inst_out_val(exe_inst_out_val));
    reg expected_ready, expected_mem, expected_exe;
    integer accepted = 0;
    reg [31:0] expected [0:7];
    always @(posedge clk) if (use_fifo && rst_n && inst_out_val && core_rdy) begin
        if (accepted >= 8 || inst_out !== expected[accepted]) $fatal(1, "FIFO ordering/duplicate");
        accepted++;
    end
    task automatic enqueue(input [31:0] value);
        begin
            @(negedge clk);
            if (!fifo_rdy) $fatal(1, "FIFO unexpectedly full");
            inst = value; inst_val = 1;
            @(negedge clk); inst_val = 0;
        end
    endtask
    initial begin
        #1; rst_n = 1;
        #1; rst_n = 0;
        repeat (2) @(negedge clk);
        // Exhaustive opcode/ready/valid/reset combinations, no extra clock latency.
        for (integer op=0; op<128; op++) begin
            for (integer bits=0; bits<16; bits++) begin
                {rst_n, direct_valid, mem_rdy, exe_rdy} = 4'(bits);
                direct_inst = {7'(op),25'h123456};
                expected_ready = 0; expected_mem = 0; expected_exe = 0;
                if (rst_n) begin
                    if (op <= 5) begin
                        expected_ready = mem_rdy;
                        expected_mem = direct_valid && mem_rdy;
                    end else if (op == 32 || op == 33 || op == 34 || op == 35) begin
                        expected_ready = exe_rdy;
                        expected_exe = direct_valid && exe_rdy;
                    end else if (op == 124) expected_ready = exe_rdy;
                    else if (op == 125) expected_ready = mem_rdy;
                    else expected_ready = 1;
                end
                #1;
                if ({core_rdy,mem_inst_out_val,exe_inst_out_val} !== {expected_ready,expected_mem,expected_exe})
                    $fatal(1, "Decode mismatch opcode=%0d combination=%0d", op, bits);
                if (expected_mem && mem_inst_out !== {3'(op),25'h123456}) $fatal(1, "Memory fields");
                if (expected_exe && exe_inst_out !==
                    ((op == 33) ? 9'h080 : (op == 34) ? 9'h110 : (op == 35) ? 9'h190 : 9'h056)) $fatal(1, "Execution fields");
            end
        end
        // All defined arithmetic/accumulate/activation encodings.
        rst_n = 1; direct_valid = 1; exe_rdy = 1; mem_rdy = 0;
        for (integer act=0; act<5; act++)
            for (integer acc=0; acc<2; acc++)
                for (integer alu=0; alu<4; alu++) begin
                    direct_inst = {`EXECUTE,19'd0,3'(act),1'(acc),2'(alu)};
                    #1;
                    if (!exe_inst_out_val || mem_inst_out_val || !core_rdy ||
                        exe_inst_out !== {3'b0,3'(act),1'(acc),2'(alu)}) $fatal(1, "Execute options");
                end
        // Preserve all address bits, including PSRAM chip selection.
        for (integer address_bit=0; address_bit<25; address_bit++) begin
            mem_rdy = 1; exe_rdy = 0;
            direct_inst = {`SET_SRC,25'd1 << address_bit};
            #1;
            if (!mem_inst_out_val || mem_inst_out !== {3'd4,25'd1 << address_bit}) $fatal(1, "SRC address");
            direct_inst = {`SET_DST,25'd1 << address_bit};
            #1;
            if (!mem_inst_out_val || mem_inst_out !== {3'd5,25'd1 << address_bit}) $fatal(1, "DST address");
        end
        @(negedge clk); rst_n = 0;
        repeat (2) @(negedge clk);
        use_fifo = 1; rst_n = 1; mem_rdy = 1; exe_rdy = 0;
        expected[0] = {`EXE_SYNC,25'd0};
        expected[1] = {`FLASH_TO_SRAM,25'd1};
        expected[2] = {`MEM_SYNC,25'd0};
        expected[3] = {`EXECUTE,25'd2};
        expected[4] = {`INST_NOP,25'd0};
        expected[5] = {`SRAM_TO_VPU,25'd3};
        expected[6] = {`ACT_TO_SRAM,25'd4};
        expected[7] = {`SRAM_TO_FLASH,25'd5};
        enqueue(expected[0]); enqueue(expected[1]);
        repeat (5) @(negedge clk);
        if (accepted != 0 || !inst_out_val || mem_inst_out_val) $fatal(1, "Passed blocked EXE_SYNC");
        exe_rdy = 1;
        repeat (3) @(negedge clk);
        if (accepted != 2) $fatal(1, "EXE_SYNC failed to release");
        mem_rdy = 0;
        enqueue(expected[2]); enqueue(expected[3]);
        repeat (5) @(negedge clk);
        if (accepted != 2 || !inst_out_val || exe_inst_out_val) $fatal(1, "Passed blocked MEM_SYNC");
        mem_rdy = 1;
        repeat (3) @(negedge clk);
        if (accepted != 4) $fatal(1, "MEM_SYNC failed to release");
        mem_rdy = 0; exe_rdy = 0;
        enqueue(expected[4]);
        repeat (2) @(negedge clk);
        if (accepted != 5) $fatal(1, "NOP stalled");
        mem_rdy = 1; // Memory operations must proceed even while EXE is busy.
        for (integer i=5; i<8; i++) enqueue(expected[i]);
        repeat (3) @(negedge clk);
        if (accepted != 8 || inst_out_val || mem_inst_out_val || exe_inst_out_val) $fatal(1, "Missing/extra instruction");
        $display("PASS decoder: 2048 combinations; FIFO head, independent readiness, EXE_SYNC/MEM_SYNC ordering, NOP, no empty dispatch");
        $finish;
    end
    initial begin #100000; $fatal(1, "Timeout"); end
endmodule
