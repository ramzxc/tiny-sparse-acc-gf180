`timescale 1ns/1ps
`include "defs/defs.vh"
module tb_sparse_egru;
    localparam W = `COMPUTE_WIDTH * `DATA_WIDTH;
    reg clk = 0, rst_n = 0;
    always #5 clk = !clk;
    reg [15:0] inst = 0;
    reg valid = 0;
    wire ready, exec_rdy, data_rdy, ev, dv;
    wire [5:0] ei;
    wire [15:0] di;
    wire [W-1:0] operand, result, wd;
    wire ov, weight, rv, scalar;
    wire [`CUR_WIDTH-1:0] cur;
    wire re, we;
    wire [23:0] addr;
    wire [1:0] device;
    reg mrdy = 1, rdval = 0;
    reg [W-1:0] rd = 0;
    reg [7:0] memory [0:1048575];
    integer delay_left = 0, reads = 0, writes = 0, cycles = 0, checks = 0;
    reg pending_read;
    reg [23:0] saved_addr;
    inst_decoder decoder(rst_n, inst, valid, ready, exec_rdy, data_rdy, ei, ev, di, dv);
    data_ctrl data(clk, rst_n, di, dv, data_rdy, result, rv, operand, ov, weight,
                   scalar, cur, mrdy, re, we, addr, device, wd, rd, rdval);
    exec_unit exec(clk, rst_n, ei, ev, exec_rdy, operand, ov, weight, scalar, cur, result, rv);

    // Vector-wide, single-port RAM model. Variable latency exercises waiting.
    // QSPI/UART electrical timing is covered by the existing integration tests.
    always @(posedge clk) begin
        cycles <= cycles + 1;
        rdval <= 0;
        if (rst_n) begin
            if ((re || we) && mrdy) begin
                if (re && we) $fatal(1, "simultaneous read/write");
                if (device != 2'b10) $fatal(1, "unexpected device");
                if (addr + `COMPUTE_WIDTH > 1048576) $fatal(1, "memory range");
                mrdy <= 0;
                delay_left <= 1 + cycles % 4;
                saved_addr <= addr;
                pending_read <= re;
                if (re) reads <= reads + 1;
                if (we) begin
                    writes <= writes + 1;
                    for (integer i=0; i<`COMPUTE_WIDTH; i=i+1)
                        memory[addr+i] <= wd[i*8 +: 8];
                end
            end else if (!mrdy) begin
                if (delay_left != 0) delay_left <= delay_left - 1;
                else begin
                    mrdy <= 1;
                    rdval <= pending_read;
                    if (pending_read)
                        for (integer i=0; i<`COMPUTE_WIDTH; i=i+1)
                            rd[i*8 +: 8] <= memory[saved_addr+i];
                end
            end
        end
    end

    task issue(input [15:0] word);
        integer timeout;
        @(negedge clk);
        inst = word; valid = 1;
        timeout = 0;
        @(posedge clk);
        while (!ready) begin
            timeout = timeout + 1;
            if (timeout > 100) $fatal(1, "instruction timeout %h", word);
            @(posedge clk);
        end
        @(negedge clk);
        valid = 0;
    endtask

    string filename;
    reg [7:0] command;
    integer f, status, a, value, expected_reads, expected_writes;
    initial begin
        if (!$value$plusargs("program=%s", filename)) $fatal(1, "missing program");
        f = $fopen(filename, "r");
        if (!f) $fatal(1, "cannot open program");
        repeat (3) @(negedge clk);
        rst_n = 1;
        while (!$feof(f)) begin
            status = $fscanf(f, "%s", command);
            if (status == 1) case (command)
                "L": begin
                    status = $fscanf(f, "%h %h", a, value);
                    memory[a] = value;
                end
                "I": begin
                    status = $fscanf(f, "%h", value);
                    issue(value);
                end
                "C": begin
                    status = $fscanf(f, "%h %h", a, value);
                    if (memory[a] !== value[7:0])
                        $fatal(1, "check %0d addr=%h got=%h expected=%h", checks, a, memory[a], value[7:0]);
                    checks = checks + 1;
                end
                "R": begin
                    status = $fscanf(f, "%d %d", expected_reads, expected_writes);
                    if (reads != expected_reads || writes != expected_writes)
                        $fatal(1, "bus count got R/W %0d/%0d expected %0d/%0d", reads, writes, expected_reads, expected_writes);
                end
                default: $fatal(1, "unknown command %s", command);
            endcase
        end
        $display("PASS lanes=%0d checks=%0d reads=%0d writes=%0d cycles=%0d", `COMPUTE_WIDTH, checks, reads, writes, cycles);
        $finish;
    end
    initial begin
        #1000000000;
        $fatal(1, "watchdog");
    end
endmodule
