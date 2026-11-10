`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
`include "defs/mem_defs.vh"
module tb_mem_ctrl;
    reg clk=0;
    always #50 clk=!clk;
    reg rst_n=0;
    reg [`MEM_INST_WIDTH-1:0] mem_inst_in=0;
    reg mem_inst_in_val=0;
    wire mem_rdy, mem_itf_rdy, read_en, write_en, copy_en, read_data_val;
    wire [24:0] src_addr,dst_addr;
    wire [7:0] read_data,write_data,weight_data,input_data,act_res_in;
    wire weight_data_val,input_data_val;
    mem_ctrl dut (.*);

    wire qspi_req_val,qspi_req_rdy,qspi_req_write,qspi_read_data_val;
    wire [24:0] qspi_req_addr;
    wire [7:0] qspi_req_data,qspi_read_data;
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
    qspi_psram_model #(.DEPTH(512)) ram_a (
        .sck(sck), .cs_n(ram_a_cs), .dq_out(dq_out), .dq_oe(dq_oe), .dq_in(a_in)
    );
    qspi_psram_model #(.DEPTH(512)) ram_b (
        .sck(sck), .cs_n(ram_b_cs), .dq_out(dq_out), .dq_oe(dq_oe), .dq_in(b_in)
    );
    qspi_nor_model #(.DEPTH(512), .BOARD_PREPARED(1), .PROGRAM_TIME(15000ns)) flash (
        .clk(clk), .sck(sck), .cs_n(flash_cs), .dq_out(dq_out), .dq_oe(dq_oe), .dq_in(flash_in),
        .stuck_busy(1'b0), .reject_wren(1'b0), .ignore_qe(1'b0)
    );

    reg [`EXE_INST_WIDTH-1:0] exe_inst_in=0;
    reg exe_inst_in_val=0;
    wire [7:0] vpu_res_out;
    wire [2:0] act_op_out;
    wire vpu_res_out_val,act_res_out_val;
    vpu compute (.*);
    act activation (.clk(clk),.rst_n(rst_n),.vpu_res_in(vpu_res_out),
        .act_op_in(act_op_out),.vpu_res_in_val(vpu_res_out_val),
        .act_res_out(act_res_in),.act_res_out_val(act_res_out_val));
    integer weight_loads=0,input_loads=0,transactions=0;
    always @(posedge clk) if(rst_n) begin
        if(weight_data_val) weight_loads++;
        if(input_data_val) input_loads++;
        if(qspi_req_val && qspi_req_rdy) transactions++;
        if(weight_data_val && input_data_val) $fatal(1,"Both operand banks updated");
    end

    // The slim mem_itf borrows these persistent address registers.
    reg memory_was_active=0;
    reg [49:0] saved_addresses;
    always @(posedge clk) begin
        if (!rst_n) memory_was_active <= 0;
        else begin
            if (memory_was_active && {src_addr,dst_addr} !== saved_addresses)
                $fatal(1,"mem_ctrl changed addresses before transfer completion");
            memory_was_active <= !mem_rdy;
            saved_addresses <= {src_addr,dst_addr};
        end
    end

    task automatic issue(input [2:0] command,input [24:0] address);
        begin
            @(negedge clk);
            if(!mem_rdy) $fatal(1,"Command while not ready");
            mem_inst_in={command,address[12:0]};mem_inst_in_val=1;
            if (command == 4 || command == 5) begin
                @(negedge clk);
                mem_inst_in={(command + 3'd2),1'b0,address[24:13]};
            end
            @(negedge clk);mem_inst_in_val=0;
            // The producer is free to change its bus after acceptance.
            mem_inst_in='1;
        end
    endtask
    task automatic fragment(input [2:0] command, input [12:0] value);
        begin
            @(negedge clk);
            if (!mem_rdy) $fatal(1,"Fragment while busy");
            mem_inst_in = {command,value}; mem_inst_in_val = 1;
            @(negedge clk); mem_inst_in_val = 0;
        end
    endtask
    task automatic finish_mem;
        begin
            while(!mem_rdy) @(negedge clk);
            if(!mem_itf_rdy) $fatal(1,"Early memory completion");
        end
    endtask
    task automatic execute(input [5:0] control,input [7:0] result);
        begin
            @(negedge clk);exe_inst_in={`EXE_MODE_COMPUTE,1'b0,control};exe_inst_in_val=1;
            @(negedge clk);exe_inst_in_val=0;
            repeat(1) @(negedge clk);
            if(!act_res_out_val || act_res_in !== result) $fatal(1,"Compute/activation expected %h got %h",result,act_res_in);
            @(negedge clk);
            if(act_res_out_val || act_res_in !== result) $fatal(1,"Held activation result");
        end
    endtask
    integer start_transactions;
    initial begin
        repeat(3) @(negedge clk);
        // Flash fixture: weights=(2,3), inputs=(4,5), low lane first.
        flash.mem[0]=8'h40;flash.mem[1]=8'h44;
        flash.mem[2]=8'h48;flash.mem[3]=8'h4a;
        rst_n=1;
        // Full address range, including chip selection; each half must preserve
        // the other half and never initiate a physical transaction.
        for (integer i=0; i<25; i++) begin
            issue(`MEM_CMD_SET_SRC_LO,25'(1 << i));
            issue(`MEM_CMD_SET_DST_LO,~25'(1 << i));
            if (src_addr !== 25'(1 << i) || dst_addr !== ~25'(1 << i))
                $fatal(1,"Split address lost bit %0d",i);
        end
        fragment(`MEM_CMD_SET_SRC_HI,13'h1abc);
        fragment(`MEM_CMD_SET_SRC_LO,13'h1234);
        fragment(`MEM_CMD_SET_DST_HI,13'h1456);
        fragment(`MEM_CMD_SET_DST_LO,13'h789);
        if (src_addr !== {12'habc,13'h1234} || dst_addr !== {12'h456,13'h789})
            $fatal(1,"LOW overwrote HIGH or reserved HIGH bit used");
        fragment(`MEM_CMD_SET_SRC_HI,13'h321);
        fragment(`MEM_CMD_SET_DST_HI,13'h654);
        if (src_addr !== {12'h321,13'h1234} || dst_addr !== {12'h654,13'h789})
            $fatal(1,"HIGH overwrote LOW");
        issue(`MEM_CMD_SET_SRC_LO,0);
        issue(`MEM_CMD_SET_DST_LO,`WEIGHT_BASE_ADDR+25'h20);
        if(transactions!=0 || !mem_rdy) $fatal(1,"SET accessed memory");
        issue(`MEM_CMD_FLASH_TO_SRAM,0);finish_mem();
        if(ram_a.mem[32] !== 8'h40) $fatal(1,"Flash to weight");
        issue(`MEM_CMD_SET_SRC_LO,2);
        issue(`MEM_CMD_SET_DST_LO,`UNIFIED_BASE_ADDR+25'h40);
        issue(`MEM_CMD_FLASH_TO_SRAM,0);finish_mem();
        if(ram_b.mem[64] !== 8'h48) $fatal(1,"Flash to unified");

        issue(`MEM_CMD_SET_SRC_LO,`WEIGHT_BASE_ADDR+25'h20);
        issue(`MEM_CMD_SRAM_TO_VPU,0);finish_mem();
        if(weight_loads!=1 || input_loads!=0 || compute.weights !== 8'h40) $fatal(1,"Weight load/ready timing");
        issue(`MEM_CMD_SET_SRC_LO,`UNIFIED_BASE_ADDR+25'h40);
        allow_qspi=0;
        issue(`MEM_CMD_SRAM_TO_VPU,0);
        repeat(20) begin
            @(negedge clk);
            if(mem_rdy || input_loads!=0) $fatal(1,"Read stall");
        end
        allow_qspi=1;finish_mem();
        if(input_loads!=1 || compute.inputs !== 8'h48 || compute.weights !== 8'h40)
            $fatal(1,"Input load/weight persistence");
        // MUL: 4*2=8. Then accumulate -> 16.
        execute({`ACT_NONE,1'b0,`EXE_OP_MUL},8'h50);
        execute({`ACT_NONE,1'b1,`EXE_OP_MUL},8'h58);
        issue(`MEM_CMD_SET_DST_LO,`UNIFIED_BASE_ADDR+25'h60);
        issue(`MEM_CMD_ACT_TO_SRAM,0);finish_mem();
        if(ram_b.mem[96] !== 8'h58) $fatal(1,"Activation store");
        // No automatic address increment; another store overwrites the same word.
        execute({`ACT_RELU,1'b0,`EXE_OP_SUB},8'h40);
        issue(`MEM_CMD_ACT_TO_SRAM,0);finish_mem();
        if(ram_b.mem[96] !== 8'h40 || dst_addr !== (`UNIFIED_BASE_ADDR+25'h60))
            $fatal(1,"Persistent destination");
        issue(`MEM_CMD_SET_SRC_LO,`UNIFIED_BASE_ADDR+25'h60);
        issue(`MEM_CMD_SET_DST_LO,25'h100);
        issue(`MEM_CMD_SRAM_TO_FLASH,0);finish_mem();
        if(flash.mem[256] !== 8'h40) $fatal(1,"SRAM to flash");

        // Reset a pending request before QSPI accepts it.
        allow_qspi=0;
        issue(`MEM_CMD_SET_SRC_LO,`WEIGHT_BASE_ADDR+25'h20);
        issue(`MEM_CMD_SRAM_TO_VPU,0);
        repeat(5) @(negedge clk);
        rst_n=0;
        repeat(3) @(negedge clk);
        if(src_addr || dst_addr || read_en || write_en || copy_en || weight_data_val || input_data_val)
            $fatal(1,"Reset");
        rst_n=1;allow_qspi=1;
        issue(`MEM_CMD_SET_SRC_LO,`WEIGHT_BASE_ADDR+25'h20);
        issue(`MEM_CMD_SRAM_TO_VPU,0);finish_mem();
        if(compute.weights !== 8'h40) $fatal(1,"Reset recovery");
        start_transactions=transactions;
        issue(3'd7,0);
        repeat(3) @(negedge clk);
        if(!mem_rdy || transactions!=start_transactions) $fatal(1,"Reserved command");
        $display("PASS mem_ctrl + mem_itf + QSPI + VPU + ACT: address setup, four transfers, both operand banks, compute/accumulate, stalls, reset");
        $finish;
    end
    initial begin #5000000;$fatal(1,"Timeout");end
endmodule
