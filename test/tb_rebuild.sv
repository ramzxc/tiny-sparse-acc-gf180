`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
`include "defs/mem_defs.vh"
module tb_rebuild;
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
    task expect_result(input [7:0] expected);
        send(`INST_SYNC);
        if (dut.result !== expected) $fatal(1, "result got=%h expected=%h", dut.result, expected);
    endtask
    integer before_reads;
    initial begin
        #1;
        ram_a.mem[0] = 8'h00;
        ram_a.mem[1] = 8'h80; // -0
        ram_a.mem[2] = 8'h40; // 2
        ram_b.mem[0] = 8'h44; // 3
        ram_b.mem[1] = 8'h7f; // NaN
        flash.mem[0] = 8'h38;
        repeat (5) @(negedge clk); rst_n = 1;

        read_operand(`INST_DATA_LOAD_INPUT_SPARSE, 0, `MEM_PSRAM_A);
        before_reads = ram_b.reads;
        read_operand(`INST_DATA_LOAD_WEIGHT_SPARSE, 0, `MEM_PSRAM_B);
        send(`INST_EXEC_MUL_NOP);
        expect_result(8'h00);
        // Zero flag survives multiple weight requests.
        send(`INST_MEM_READ_DEVICE(`MEM_PSRAM_B));
        send(`INST_SYNC);
        if (ram_b.reads != before_reads) $fatal(1, "sparse zero must skip physical read");

        read_operand(`INST_DATA_LOAD_INPUT_DENSE, 2, `MEM_PSRAM_A);
        read_operand(`INST_DATA_LOAD_WEIGHT_SPARSE, 0, `MEM_PSRAM_B);
        if (ram_b.reads != before_reads + 1) $fatal(1, "new input must clear zero flag");
        send(`INST_EXEC_MUL_NOP);
        expect_result(8'h4c); // 6
        send(`INST_EXEC_MUL_ACC_NOP);
        expect_result(8'h54); // 12
        send(`INST_EXEC_MUL_RELU);
        expect_result(8'h4c);
        send(`INST_DATA_STORE); // snapshot 6
        send(`INST_EXEC_ADD_NOP); // result now 5; snapshot must remain 6
        expect_result(8'h4a);
        address(16);
        send(`INST_MEM_WRITE_DEVICE(`MEM_PSRAM_A));
        send(`INST_SYNC);
        if (ram_a.mem[16] !== 8'h4c) $fatal(1, "STORE snapshot was overwritten");
        send(`INST_DATA_STORE);
        send(`INST_MEM_WRITE_DEVICE(`MEM_PSRAM_B));
        send(`INST_SYNC);
        if (ram_b.mem[16] !== 8'h4a) $fatal(1, "PSRAM B store");
        address(32);
        send(`INST_MEM_WRITE_DEVICE(`MEM_FLASH));
        send(`INST_SYNC);
        if (flash.mem[32] !== 8'h4a) $fatal(1, "Flash store");
        read_operand(`INST_DATA_LOAD_INPUT_DENSE, 32, `MEM_FLASH);
        send(`INST_EXEC_ADD_NOP); // 5 + 3 = 8
        expect_result(8'h50);

        // Dense weight requests are never skipped, even for zero input.
        read_operand(`INST_DATA_LOAD_INPUT_SPARSE, 1, `MEM_PSRAM_A);
        before_reads = ram_b.reads;
        read_operand(`INST_DATA_LOAD_WEIGHT_DENSE, 1, `MEM_PSRAM_B);
        if (ram_b.reads != before_reads + 1) $fatal(1, "dense read skipped");
        send(`INST_EXEC_MUL_NOP);
        expect_result(8'h7f);
        // Sparse path overwrites stale NaN weight with zero without reading.
        read_operand(`INST_DATA_LOAD_WEIGHT_SPARSE, 0, `MEM_PSRAM_B);
        if (ram_b.reads != before_reads + 1) $fatal(1, "negative zero must skip");
        send(`INST_EXEC_MUL_NOP);
        expect_result(8'h80); // -0 * +0 = -0
        $display("PASS rebuilt UART/FIFO/decoder/data/exec/mem_itf/QSPI: sparse skip, zero refresh, stationary operands, accumulation, snapshots, Flash and both PSRAMs");
        $finish;
    end
    initial begin #100000000; $fatal(1, "timeout"); end
endmodule
