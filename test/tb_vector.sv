`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
`include "defs/mem_defs.vh"
module tb_vector;
    localparam integer N = `COMPUTE_WIDTH;
    reg clk = 0;
    always #50 clk = !clk;
    reg rst_n = 0;
    reg [7:0] ui = 8'h08;
    wire [7:0] uo, uio_out, uio_oe;
    wire [3:0] dq_out = {uio_out[5:4], uio_out[2:1]};
    wire [3:0] dq_oe = {uio_oe[5:4], uio_oe[2:1]};
    wire [3:0] fi, ai, bi;
    wire [3:0] dq_in = !uio_out[0] ? fi : !uio_out[6] ? ai : !uio_out[7] ? bi : 4'hf;
    wire [7:0] uio_in = {2'b0, dq_in[3:2], 1'b0, dq_in[1:0], 1'b0};
    tt_um_tiny_sparse_acc_ramzxc dut(ui, uo, uio_in, uio_out, uio_oe, 1'b1, clk, rst_n);
    qspi_psram_model #(.DEPTH(512)) ram_a(uio_out[3], uio_out[6], dq_out, dq_oe, ai);
    qspi_psram_model #(.DEPTH(512)) ram_b(uio_out[3], uio_out[7], dq_out, dq_oe, bi);
    qspi_nor_model #(.DEPTH(512), .BOARD_PREPARED(1), .PROGRAM_TIME(15000ns)) flash(
        clk, uio_out[3], uio_out[0], dq_out, dq_oe, fi, 1'b0, 1'b0, 1'b0);

    integer credits = 0, used_credits = 0;
    reg [7:0] credit_byte;
    // PC side really decodes READY bytes; no DUT register forcing.
    initial forever begin
        @(negedge uo[4]);
        if (rst_n) begin
            repeat (43) @(posedge clk);
            if (uo[4] !== 0) $fatal(1, "bad READY start");
            for (integer i = 0; i < 8; i++) begin
                repeat (87) @(posedge clk);
                credit_byte[i] = uo[4];
            end
            repeat (87) @(posedge clk);
            if (uo[4] !== 1 || credit_byte !== 8'h01) $fatal(1, "bad READY byte");
            credits++;
        end
    end
    task byte_in(input [7:0] value);
        @(negedge clk); ui[3] = 0;
        repeat (87) @(negedge clk);
        for (integer i = 0; i < 8; i++) begin
            ui[3] = value[i];
            repeat (87) @(negedge clk);
        end
        ui[3] = 1;
        repeat (87) @(negedge clk);
    endtask
    task send(input [15:0] word);
        wait (credits > used_credits);
        used_credits++;
        byte_in(word[7:0]);
        byte_in(word[15:8]);
    endtask
    task address(input [23:0] value);
        send(`INST_ADDR_LOW(value[11:0]));
        send(`INST_ADDR_HIGH(value[23:12]));
    endtask
    task read_operand(input [15:0] mode, input [23:0] value, input [1:0] chip);
        send(mode);
        address(value);
        send(`INST_MEM_READ_DEVICE(chip));
        send(`INST_SYNC);
    endtask
    task expect_result(input [8*N-1:0] expected);
        send(`INST_SYNC);
        if (dut.result !== expected) $fatal(1, "result got=%h expected=%h", dut.result, expected);
    endtask
    integer before_reads;
    integer vector_reads = 0, vector_writes = 0, vector_responses = 0;
    always @(posedge clk) if (dut.core_rst_n) begin
        if (dut.read_en && dut.mem_rdy) vector_reads++;
        if (dut.write_en && dut.mem_rdy) vector_writes++;
        if (dut.read_data_val) vector_responses++;
    end
    reg [8*N-1:0] expected;
    initial begin
        #1;
        for (integer i=0; i<N; i++) begin
            ram_a.mem[i] = i == N-1 ? 8'h40 : 0; // only final lane is nonzero
            ram_a.mem[16+i] = i == N-1 ? 8'h80 : 0; // all zero, including -0
            ram_b.mem[i] = 8'h44; // 3
        end
        repeat (5) @(negedge clk); rst_n = 1;

        read_operand(`INST_DATA_LOAD_INPUT_SPARSE, 0, `MEM_PSRAM_A);
        before_reads = ram_b.reads;
        read_operand(`INST_DATA_LOAD_WEIGHT_SPARSE, 0, `MEM_PSRAM_B);
        if (ram_a.reads != N || ram_b.reads != before_reads + N)
            $fatal(1, "must transfer every lane, including non-power-of-two widths");
        expected = 0;
        expected[(N-1)*8 +: 8] = 8'h4c; // 2*3 = 6 in final lane
        send(`INST_EXEC_MUL_NOP);
        expect_result(expected);
        expected[(N-1)*8 +: 8] = 8'h54; // accumulated 12
        send(`INST_EXEC_MUL_ACC_NOP);
        expect_result(expected);
        send(`INST_DATA_STORE);
        address(32);
        send(`INST_MEM_WRITE_DEVICE(`MEM_PSRAM_A));
        send(`INST_SYNC);
        for (integer i=0; i<N; i++)
            if (ram_a.mem[32+i] !== expected[8*i +: 8]) $fatal(1, "lane store %0d", i);
        if (ram_a.writes != N) $fatal(1, "wrong byte count on STORE");
        // Reuse the complete held snapshot for another memory device.
        address(64);
        send(`INST_MEM_WRITE_DEVICE(`MEM_FLASH));
        send(`INST_SYNC);
        for (integer i=0; i<N; i++)
            if (flash.mem[64+i] !== expected[8*i +: 8]) $fatal(1, "Flash lane %0d", i);

        read_operand(`INST_DATA_LOAD_INPUT_SPARSE, 16, `MEM_PSRAM_A);
        before_reads = ram_b.reads;
        read_operand(`INST_DATA_LOAD_WEIGHT_SPARSE, 0, `MEM_PSRAM_B);
        if (ram_b.reads != before_reads) $fatal(1, "all-zero vector must skip every weight byte");
        expected = 0;
        expected[(N-1)*8 +: 8] = 8'h80;
        send(`INST_EXEC_MUL_NOP);
        expect_result(expected);
        read_operand(`INST_DATA_LOAD_WEIGHT_DENSE, 0, `MEM_PSRAM_B);
        if (ram_b.reads != before_reads + N) $fatal(1, "dense must read every weight byte");
        if (vector_reads != 4 || vector_responses != 4 || vector_writes != 2)
            $fatal(1, "one request/response per vector: reads=%0d responses=%0d writes=%0d", vector_reads, vector_responses, vector_writes);
        $display("PASS COMPUTE_WIDTH=%0d: lane assembly, MAC, byte order, vector STORE, Flash, all-zero sparse bypass", N);
        $finish;
    end
    initial begin #100000000; $fatal(1, "timeout"); end
endmodule
