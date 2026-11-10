`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
`include "defs/mem_defs.vh"
`include "defs/micro_defs.vh"
module tb_micro_ctrl;
    reg clk=0;
    always #50 clk=!clk;
    reg rst_n=0, req_val=0;
    wire req_rdy,done,error;
    reg req_reserved=0;
    reg [24:0] req_weight_addr,req_input_addr,req_output_addr;
    reg [7:0] req_rows,req_cols,req_vectors;
    reg req_sparse_en;
    reg [1:0] req_act_op;
    wire mem_itf_rdy,read_en,write_en,copy_en,read_data_val;
    wire [24:0] src_addr,dst_addr;
    wire [15:0] read_data,write_data;
    reg [63:0] host_inst=0;
    reg host_inst_val=0;
    wire host_rdy;
    assign req_rdy=host_rdy;
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

    integer weight_reads=0,input_reads=0,stores=0,macs=0;
    reg held=0;
    reg [31:0] held_inst;
    integer cycles=0;
    integer case_start=0, total_cycles=0, overlap_loads=0;
    reg require_overlap=0;
    reg no_stalls=0;
    reg stall_enable=1;
    always @(negedge clk) begin
        cycles++;
        if(stall_enable && !no_stalls) allow_qspi=(cycles%31)>12;
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
            if(core.exe_inst_val && core.inst[31:25]==`EXECUTE) macs++;
            if(core.mem_inst_val && core.inst[31:25]==`SRAM_TO_VPU &&
                core.inst[`MEM_SCALAR_BIT] && core.exe_active) overlap_loads++;
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
    task automatic submit;
        begin
            send_command({req_reserved,req_sparse_en,req_act_op,req_rows,req_cols,req_vectors,
                12'(req_weight_addr-`HOST_WEIGHT_BASE),12'(req_input_addr-`HOST_INPUT_BASE),
                12'(req_output_addr-`HOST_OUTPUT_BASE)});
        end
    endtask
    task automatic wait_done;
        begin
            while(!done) @(negedge clk);
            if(!req_rdy) $fatal(1,"Done without ready");
        end
    endtask
    task automatic invalid_request;
        integer before_count;
        begin
            before_count=weight_reads+input_reads+stores;
            submit();
            wait_done();
            if(!error || before_count!=weight_reads+input_reads+stores) $fatal(1,"Invalid request accessed memory");
            @(negedge clk);
            if(done) $fatal(1,"Done must pulse");
        end
    endtask
    string vector_path;
    integer fd,count,rows,cols,vectors,activation,sparse,nnz,stride,n,value;
    integer expected_result[0:255];
    integer dense_reads=0,sparse_reads=0;
    initial begin
        require_overlap=$test$plusargs("require_overlap");
        no_stalls=$test$plusargs("no_stalls");
        if(!$value$plusargs("vectors=%s",vector_path)) $fatal(1,"Missing vectors");
        fd=$fopen(vector_path,"r");
        if(!fd) $fatal(1,"Cannot open vectors");
        n=$fscanf(fd,"%d",count);
        repeat(3) @(negedge clk);
        rst_n=1;
        for(integer test_no=0;test_no<count;test_no++) begin
            n=$fscanf(fd,"%d %d %d %d %d %d",rows,cols,vectors,activation,sparse,nnz);
            if(n!=6) $fatal(1,"Bad vector header");
            stride=((rows+1)/2)*2;
            for(integer i=0;i<512;i++) begin ram_a.mem[i]=8'ha5;ram_b.mem[i]=8'ha5;end
            for(integer i=0;i<stride*cols;i++) begin
                n=$fscanf(fd,"%h",value);ram_a.mem[32+i]=8'(value);
            end
            for(integer i=0;i<((cols+1)/2)*2*vectors;i++) begin
                n=$fscanf(fd,"%h",value);ram_b.mem[128+i]=8'(value);
            end
            for(integer i=0;i<stride*vectors;i++) n=$fscanf(fd,"%h",expected_result[i]);
            req_reserved=0;
            req_weight_addr=`WEIGHT_BASE_ADDR+25'd32;
            req_input_addr=`UNIFIED_BASE_ADDR+25'd128;
            req_output_addr=`UNIFIED_BASE_ADDR+25'd256;
            req_rows=8'(rows);req_cols=8'(cols);req_vectors=8'(vectors);
            req_act_op=2'(activation);req_sparse_en=1'(sparse);
            weight_reads=0;input_reads=0;stores=0;macs=0;
            case_start=cycles;
            submit();
            // Change every request field while active: the accepted request is latched.
            req_weight_addr='1;req_input_addr='1;req_output_addr='1;
            req_rows=0;req_cols=0;req_act_op=0;req_sparse_en=0;
            wait_done();
            total_cycles+=cycles-case_start;
            if(error) $fatal(1,"Valid request failed");
            for(integer i=0;i<stride*vectors;i++)
                if(ram_b.mem[256+i] !== 8'(expected_result[i]))
                    $fatal(1,"Matrix case=%0d row=%0d expected=%h got=%h",test_no,i,8'(expected_result[i]),ram_b.mem[256+i]);
            if(ram_b.mem[255] !== 8'ha5 || ram_b.mem[256+stride*vectors] !== 8'ha5) $fatal(1,"Store overrun");
            if(weight_reads != (stride/2)*(sparse ? nnz : cols*vectors) || macs != weight_reads ||
                input_reads != (stride/2)*cols*vectors || stores != (stride/2)*vectors)
                $fatal(1,"Wrong traffic w=%0d x=%0d stores=%0d macs=%0d",weight_reads,input_reads,stores,macs);
            if(sparse) sparse_reads+=weight_reads;else dense_reads+=weight_reads;
            @(negedge clk);
            if(done) $fatal(1,"Repeated done");
        end
        $fclose(fd);
        if(require_overlap && overlap_loads==0) $fatal(1,"No input load overlapped execution");
        $display("MATVEC cycles=%0d overlapped input requests=%0d",total_cycles,overlap_loads);
        // Invalid high-level requests must produce an error without side effects.
        req_reserved=0;req_rows=2;req_cols=2;req_vectors=1;req_act_op=0;req_sparse_en=0;
        req_weight_addr=`WEIGHT_BASE_ADDR+32;
        req_input_addr=`UNIFIED_BASE_ADDR+128;
        req_output_addr=`UNIFIED_BASE_ADDR+256;
        req_rows=0;invalid_request();req_rows=2;
        req_reserved=1;invalid_request();req_reserved=0;
        req_vectors=0;invalid_request();req_vectors=1;
        req_weight_addr=req_weight_addr+1;invalid_request();req_weight_addr=req_weight_addr-1;
        req_output_addr=req_input_addr;invalid_request();req_output_addr=`UNIFIED_BASE_ADDR+256;
        // A later B column overlapping C must also be rejected before access.
        req_input_addr=`UNIFIED_BASE_ADDR+128;req_cols=4;req_vectors=40;
        invalid_request();
        req_vectors=1;
        // Abort while a memory request is stalled, then verify a fresh operation.
        stall_enable=0;allow_qspi=0;
        req_weight_addr=`WEIGHT_BASE_ADDR+32;req_sparse_en=0;req_rows=2;req_cols=1;
        submit();
        wait(qspi_req_val);
        repeat(5) @(negedge clk);
        rst_n=0;repeat(3) @(negedge clk);
        if(done || core.inst_val || qspi_req_val) $fatal(1,"Reset outputs");
        rst_n=1;allow_qspi=1;
        ram_a.mem[32]=8'h38;ram_a.mem[33]=8'h40;ram_b.mem[128]=8'h40;
        submit();wait_done();
        if(error || {ram_b.mem[257],ram_b.mem[256]} !== 16'h4840) $fatal(1,"Reset recovery");
        $display("PASS 64-bit matrix jobs: %0d exact-FP8 cases, sparse/dense, odd dimensions, zero input, all activations, stalls, invalid requests, reset",count);
        $display("Weight reads over paired cases: dense=%0d sparse=%0d",dense_reads,sparse_reads);
        $finish;
    end
    initial begin #100000000;$fatal(1,"Timeout");end
endmodule
