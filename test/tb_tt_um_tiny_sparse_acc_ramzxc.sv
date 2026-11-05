`timescale 1ns/1ps
module tb_tt_um_tiny_sparse_acc_ramzxc;
    import tpu_pkg::*;
    logic clk=0,rst_n=0,ena=1;
    always #50 clk=~clk;
    logic [7:0] ui_in=8'h08;
    wire [7:0] uo_out,uio_in,uio_out,uio_oe;
    wire [3:0] dq_in;
    assign uio_in={2'b11,dq_in[3:2],1'b0,dq_in[1:0],1'b1};
    tt_um_tiny_sparse_acc_ramzxc dut(.*);
    qspi_nor_model #(.DEPTH(16384),.BOARD_PREPARED(1)) flash(
        .clk(clk),.sck(uio_out[3]),.cs_n(uio_out[0]),.dq_in(dq_in),
        .dq_out({uio_out[5:4],uio_out[2:1]}),.dq_oe({uio_oe[5:4],uio_oe[2:1]}),
        .stuck_busy(1'b0),.reject_wren(1'b0),.ignore_qe(1'b0));
    int accepted=0;
    byte replies[$];
    logic [7:0] sampled;
    always @(posedge clk) if(rst_n && dut.inst_push) accepted++;
    // Independent serial decoder at nominal 115200 baud, not DUT divider.
    initial forever begin
        @(negedge uo_out[4]);
        if(rst_n) begin
            #13020;
            for(int b=0;b<8;b++) begin sampled[b]=uo_out[4]; #8680; end
            if(uo_out[4]!==1) $fatal(1,"TX stop bit");
            replies.push_back(sampled);
        end
    end
    // Asynchronous phase and +/-1.5 percent host baud variation.
    task automatic send_byte(input logic [7:0] value,input int bit_ns=8680,input bit bad_stop=0);
        #137; ui_in[3]=0; #(bit_ns);
        for(int b=0;b<8;b++) begin ui_in[3]=value[b]; #(bit_ns); end
        ui_in[3]=!bad_stop; #(bit_ns); ui_in[3]=1;
    endtask
    task automatic response(input logic [7:0] expected,output logic [7:0] status);
        byte code;
        wait(replies.size()>=2);
        code=replies.pop_front(); status=replies.pop_front();
        if(code!==expected) $fatal(1,"response %h expected %h",code,expected);
        // Decoder samples stop midpoint; wait through full stop before next request.
        #10000;
    endtask
    task automatic command(input logic [7:0] op,input logic [7:0] expected,output logic [7:0] status);
        send_byte(op); response(expected,status);
    endtask
    task automatic send_inst(input inst_type word);
        logic [63:0] bits; logic [7:0] status;
        bits=word; send_byte(8'h01);
        for(int b=0;b<8;b++) send_byte(bits[b*8+:8],(b%2)?8550:8810);
        response(8'h06,status);
        if(status[4]) $fatal(1,"instruction status error %h",status);
    endtask
    function automatic inst_type dma_inst(input logic [7:0] op,input int flash_addr,input int local_addr,input int rows);
        dram_inst_type d;
        d='0; d.opcode=op; d.dram_addr=32'(flash_addr); d.sram_addr=16'(local_addr); d.length=8'(rows);
        return inst_type'(d);
    endfunction
    task automatic sync_wait;
        inst_type word; logic [7:0] status;
        word='0; word.opcode=OPCODE_SYNCHRONIZE; send_inst(word);
        do begin command(8'h05,8'h06,status); if(status[4]) $fatal(1,"status error"); end while(!status[3]);
    endtask
    logic [7:0] status;
    int before_count;
    inst_type pending_word;
    initial begin
        #1; for(int a=0;a<64;a++) flash.mem[a]=8'(a^8'h5a);
        repeat(5) @(negedge clk); rst_n=1;
        repeat(100) begin @(negedge clk); if(!uio_out[0] || uio_out[3]) $fatal(1,"startup traffic"); end
        if(uio_out[7:6]!==2'b11 || uio_oe[7:6]!==2'b11) $fatal(1,"RAM CS pin mapping");
        command(8'h02,8'h15,status); if(!status[4]) $fatal(1,"unknown command not rejected");
        command(8'h03,8'h06,status); if(status[4]) $fatal(1,"clear failed");
        // Invalid stop inside a partial instruction must never enqueue it.
        send_byte(8'h01); send_byte(8'h55,8680,1); response(8'h15,status);
        command(8'h03,8'h06,status);
        // Packet timeout and recovery.
        send_byte(8'h01); response(8'h15,status);
        command(8'h03,8'h06,status);
        // Inject FIFO backpressure at wrapper boundary and verify delayed ACK.
        before_count=accepted; pending_word='0; pending_word.opcode=OPCODE_SYNCHRONIZE;
        force dut.fifo_full=1'b1;
        send_byte(8'h01);
        for(int b=0;b<8;b++) send_byte(pending_word[b*8+:8]);
        #200000;
        if(replies.size()!=0 || accepted!=before_count) $fatal(1,"premature ACK/enqueue");
        release dut.fifo_full;
        response(8'h06,status);
        if(accepted!=before_count+1) $fatal(1,"pending instruction lost");
        before_count=accepted;
        send_inst(dma_inst(OPCODE_DRAM_TO_BUFFER,0,0,4));
        for(int n=0;n<8;n++) send_inst(dma_inst(OPCODE_BUFFER_TO_DRAM,8192+64*n,0,4));
        sync_wait();
        if(accepted!=before_count+10) $fatal(1,"duplicate/lost instructions");
        for(int n=0;n<8;n++) for(int b=0;b<8;b++)
            if(flash.mem[8192+64*n+b]!==8'(b^8'h5a)) $fatal(1,"DMA result mismatch");
        if(flash.erase_ops!=0) $fatal(1,"unexpected erase");
        send_inst(dma_inst(OPCODE_BUFFER_TO_DRAM,12289,0,3)); sync_wait();
        for(int b=0;b<6;b++) if(flash.mem[12289+b]!==8'(b^8'h5a)) $fatal(1,"tail store mismatch");
        if(flash.mem[12288]!==8'hff || flash.mem[12295]!==8'hff) $fatal(1,"tail mask");
        // Reset a partial UART packet; subsequent packet must start cleanly.
        send_byte(8'h01); send_byte(8'h55);
        @(negedge clk); rst_n=0; repeat(4) @(negedge clk); rst_n=1;
        command(8'h05,8'h06,status);
        if(status[4:3]!=0) $fatal(1,"reset sticky status");
        if(uo_out[4]!==1) $fatal(1,"TX not idle high");
        $display("TT WRAPPER PASS: UART RX/TX, baud mismatch, framing/timeout recovery, delayed ACK, QSPI DMA, reset");
        $finish;
    end
    initial begin #100000000; $fatal(1,"wrapper timeout"); end
endmodule
