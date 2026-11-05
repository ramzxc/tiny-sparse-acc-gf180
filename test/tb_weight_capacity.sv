`timescale 1ns/1ps
module tb_weight_capacity;
    import tpu_pkg::*;
    logic clk = 0, rst = 1;
    always #5 clk = ~clk;
    weight_addr_type read_addr, write_addr;
    logic read_valid = 0, read_ready, rsp_valid;
    logic write_valid = 0, write_ready;
    fp8_type [1:0] write_data, read_data;

    weight_buffer dut (
        .clk(clk), .rst(rst),
        .read_req_addr(read_addr), .read_req_valid(read_valid),
        .read_req_ready(read_ready), .read_rsp_data(read_data),
        .read_rsp_valid(rsp_valid), .load_write_addr(write_addr),
        .load_write_data(write_data), .load_write_valid(write_valid),
        .load_write_ready(write_ready)
    );

    task automatic write_row(input int address, input logic [15:0] value);
        @(negedge clk);
        write_addr = weight_addr_type'(address);
        write_data = value;
        write_valid = 1;
        do @(posedge clk); while (!write_ready);
        @(negedge clk);
        write_valid = 0;
    endtask

    task automatic check_row(input int address, input logic [15:0] expected);
        @(negedge clk);
        read_addr = weight_addr_type'(address);
        read_valid = 1;
        do @(posedge clk); while (!read_ready);
        @(negedge clk);
        read_valid = 0;
        do @(negedge clk); while (!rsp_valid);
        assert (read_data === expected)
            else $fatal(1, "row %0d: got %h expected %h", address, read_data, expected);
    endtask

    initial begin
        repeat (3) @(negedge clk);
        rst = 0;
        // Distinct contents across every row detect truncated address aliases.
        for (int row = 0; row < 128; row++)
            write_row(row, 16'(row * 257) ^ 16'ha55a);
        for (int row = 0; row < 128; row++)
            check_row(row, 16'(row * 257) ^ 16'ha55a);
        $display("WEIGHT CAPACITY PASS: 128 distinct two-byte rows");
        $finish;
    end
    initial begin
        #100000;
        $fatal(1, "weight capacity test timed out");
    end
endmodule
