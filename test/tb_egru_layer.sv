`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
`include "defs/mem_defs.vh"
`include "defs/micro_defs.vh"
module tb_egru_layer;
    reg clk=0;
    always #50 clk=!clk;
    reg rst_n=0;
    wire done,error;
    wire mem_itf_rdy,read_en,write_en,copy_en,read_data_val;
    wire [24:0] src_addr,dst_addr;
    wire [15:0] read_data,write_data;
    reg [63:0] host_inst=0;
    reg host_inst_val=0;
    wire host_rdy;
    micro_core_fixture core (.*);
    wire qspi_req_val,qspi_req_rdy,qspi_req_write,qspi_read_data_val;
    wire [24:0] qspi_req_addr;
    wire [15:0] qspi_req_data,qspi_read_data;
    mem_itf itf (.clk(clk),.rst_n(rst_n),.rdy(mem_itf_rdy),
        .read_en(read_en),.write_en(write_en),.copy_en(copy_en),
        .src_addr(src_addr),.dst_addr(dst_addr),.write_data(write_data),
        .read_data(read_data),.read_data_val(read_data_val),
        .qspi_req_val(qspi_req_val),.qspi_req_rdy(qspi_req_rdy),
        .qspi_req_write(qspi_req_write),.qspi_req_addr(qspi_req_addr),.qspi_req_data(qspi_req_data),
        .qspi_read_data(qspi_read_data),.qspi_read_data_val(qspi_read_data_val));
    reg allow_qspi=1;
    wire ctrl_ready;
    assign qspi_req_rdy=allow_qspi && ctrl_ready;
    wire sck,flash_cs,ram_a_cs,ram_b_cs;
    wire [3:0] dq_out,dq_oe,flash_in,a_in,b_in;
    wire [3:0] dq_in=!flash_cs ? flash_in : !ram_a_cs ? a_in : !ram_b_cs ? b_in : 4'hf;
    qspi_ctrl ctrl (
        .clk(clk), .rst_n(rst_n), .req_val(qspi_req_val && allow_qspi), .req_rdy(ctrl_ready),
        .req_write(qspi_req_write), .req_addr(qspi_req_addr), .req_data(qspi_req_data),
        .read_data(qspi_read_data), .read_data_val(qspi_read_data_val),
        .sck(sck), .flash_sc_n(flash_cs), .psram_a_sc_n(ram_a_cs), .psram_b_sc_n(ram_b_cs),
        .dq_in(dq_in), .dq_out(dq_out), .dq_oe(dq_oe)
    );
    qspi_psram_model #(.DEPTH(4096)) ram_a (
        .sck(sck), .cs_n(ram_a_cs), .dq_out(dq_out), .dq_oe(dq_oe), .dq_in(a_in)
    );
    qspi_psram_model #(.DEPTH(4096)) ram_b (
        .sck(sck), .cs_n(ram_b_cs), .dq_out(dq_out), .dq_oe(dq_oe), .dq_in(b_in)
    );
    qspi_nor_model #(.DEPTH(4096), .BOARD_PREPARED(1), .PROGRAM_TIME(15000ns)) flash (
        .clk(clk), .sck(sck), .cs_n(flash_cs), .dq_out(dq_out), .dq_oe(dq_oe), .dq_in(flash_in),
        .stuck_busy(1'b0), .reject_wren(1'b0), .ignore_qe(1'b0)
    );

    integer weight_reads=0,input_reads=0,stores=0,macs=0;
    reg held=0;
    reg [31:0] held_inst;
    integer cycles=0;
    always @(negedge clk) begin
        cycles++;
        allow_qspi=(cycles%31)>12;
    end
    always @(posedge clk) begin
        if(!rst_n) held<=0;
        else begin
            if(held && (!core.inst_val || core.inst !== held_inst)) $fatal(1,"Instruction changed under stall");
            held<=core.inst_val && !core.core_rdy;
            held_inst<=core.inst;
            if(qspi_req_val && qspi_req_rdy) begin
                if(qspi_req_write) stores++;
                else if(qspi_req_addr[24:23]==2'b10) weight_reads++;
                else if(qspi_req_addr[24:23]==2'b11) input_reads++;
                else $fatal(1,"Unexpected Flash access");
            end
            if(core.exe_inst_val && core.inst[15:9]==`EXECUTE) macs++;
        end
    end
    task automatic send_command(input [63:0] word_value);
        begin
            @(negedge clk);
            if(!host_rdy) $fatal(1,"Core not ready");
            host_inst=word_value;host_inst_val=1;
            @(negedge clk);host_inst_val=0;host_inst='1;
        end
    endtask

    string path;
    reg [7:0] operation;
    integer fd, parsed, bank, addr, length, value, jobs=0, checked=0;
    reg [63:0] command;
    initial begin
        if (!$value$plusargs("vectors=%s", path)) $fatal(1, "Missing vectors");
        fd = $fopen(path, "r");
        if (!fd) $fatal(1, "Cannot open vectors");
        repeat (3) @(negedge clk);
        rst_n = 1;
        forever begin
            parsed = $fscanf(fd, "%s", operation);
            if (parsed != 1) $fatal(1, "Unexpected end of test stream");
            case (operation)
                "L": begin
                    parsed = $fscanf(fd, "%d %d %d", bank, addr, length);
                    for (integer i=0; i<length; i++) begin
                        parsed = $fscanf(fd, "%h", value);
                        if (bank == 0) ram_a.mem[addr+i] = 8'(value);
                        else ram_b.mem[addr+i] = 8'(value);
                    end
                end
                "J": begin
                    parsed = $fscanf(fd, "%h", command);
                    send_command(command);
                    while (!done) @(negedge clk);
                    if (error) $fatal(1, "Job %0d rejected: %h", jobs, command);
                    jobs++;
                end
                "C": begin
                    parsed = $fscanf(fd, "%d %d", addr, length);
                    for (integer i=0; i<length; i++) begin
                        parsed = $fscanf(fd, "%h", value);
                        if (ram_b.mem[addr+i] !== 8'(value))
                            $fatal(1, "Job %0d addr %0d: got %h expected %h", jobs, addr+i, ram_b.mem[addr+i], 8'(value));
                        checked++;
                    end
                end
                "E": begin
                    $display("PASS EGRU/vector: jobs=%0d checked_bytes=%0d cycles=%0d", jobs, checked, cycles);
                    $finish;
                end
                default: $fatal(1, "Unknown directive %s", operation);
            endcase
        end
    end
    initial begin
        #2000000000;
        $fatal(1, "EGRU timeout");
    end
endmodule
