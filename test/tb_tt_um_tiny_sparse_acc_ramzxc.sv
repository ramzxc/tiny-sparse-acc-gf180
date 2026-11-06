`timescale 1ns/1ps
module tb_tt_um_tiny_sparse_acc_ramzxc;
    import tpu_pkg::*;
    logic clk=0,rst_n=0,ena=1;
    always #50 clk=~clk;
    logic [7:0] ui_in=8'h08;
    wire [7:0] uo_out,uio_in,uio_out,uio_oe;
    wire [3:0] dq_in, flash_dq, ram_dq;
    assign dq_in = !uio_out[6] ? ram_dq : flash_dq;
    assign uio_in={2'b11,dq_in[3:2],1'b0,dq_in[1:0],1'b1};
    tt_um_tiny_sparse_acc_ramzxc dut(.*);
    qspi_nor_model #(.DEPTH(16384),.BOARD_PREPARED(1)) flash(
        .clk(clk),.sck(uio_out[3]),.cs_n(uio_out[0]),.dq_in(flash_dq),
        .dq_out({uio_out[5:4],uio_out[2:1]}),.dq_oe({uio_oe[5:4],uio_oe[2:1]}),
        .stuck_busy(1'b0),.reject_wren(1'b0),.ignore_qe(1'b0));
    qspi_psram_model ram (
        .sck(uio_out[3]), .cs_n(uio_out[6]), .dq_in(ram_dq),
        .dq_out({uio_out[5:4],uio_out[2:1]}),
        .dq_oe({uio_oe[5:4],uio_oe[2:1]})
    );
    always @(posedge clk) if (rst_n) begin
        assert (uio_out[0] || uio_out[6]) else $fatal(1, "Flash/PSRAM collision");
        assert (uio_out[7]) else $fatal(1, "Unused RAM selected");
    end
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
    weight_inst_type weight_word;
    input_inst_type input_word;
    vpu_inst_type vpu_word;
    activate_inst_type activate_word;
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
        // Restore/save FP16 accumulator rows through PSRAM, including last row.
        for (int b=0; b<16; b++) flash.mem[128+b] = 8'(b*13+7);
        send_inst(dma_inst(OPCODE_DRAM_TO_ACC,128,0,4));
        send_inst(dma_inst(OPCODE_ACC_TO_DRAM,12544,0,4));
        sync_wait();
        for (int b=0; b<16; b++)
            assert(flash.mem[12544+b] === flash.mem[128+b])
                else $fatal(1,"PSRAM FP16 restore/save mismatch");

        // Real WB -> VPU -> accumulator RMW -> activation -> UB -> Flash path.
        flash.mem[64]=8'h38; flash.mem[65]=8'h40; // weights 1, 2
        flash.mem[80]=8'h40; flash.mem[81]=8'h44; // input 2, 3
        send_inst(dma_inst(OPCODE_DRAM_TO_WEIGHT,64,0,1));
        send_inst(dma_inst(OPCODE_DRAM_TO_BUFFER,80,0,1));
        input_word='0; input_word.opcode=OPCODE_INPUT;
        send_inst(inst_type'(input_word));
        weight_word='0; weight_word.opcode=OPCODE_WEIGHT;
        send_inst(inst_type'(weight_word));
        vpu_word='0; vpu_word.opcode=OPCODE_VPU_VEC_MUL; vpu_word.length=1;
        send_inst(inst_type'(vpu_word));
        vpu_word.opcode=OPCODE_VPU_VEC_MUL | 8'h01;
        send_inst(inst_type'(vpu_word)); // accumulate again: 4, 12
        activate_word='0; activate_word.opcode=OPCODE_ACTIVATE;
        activate_word.length=1; activate_word.buffer_addr=1;
        send_inst(inst_type'(activate_word));
        send_inst(dma_inst(OPCODE_ACC_TO_DRAM,12400,0,1));
        send_inst(dma_inst(OPCODE_BUFFER_TO_DRAM,12416,1,1));
        sync_wait();
        assert({flash.mem[12403],flash.mem[12402],flash.mem[12401],flash.mem[12400]} === 32'h4a004400)
            else $fatal(1,"PSRAM vector MAC/accumulate mismatch");
        assert({flash.mem[12417],flash.mem[12416]} === 16'h5448)
            else $fatal(1,"PSRAM activation writeback mismatch");
        assert({ram.mem[1],ram.mem[0]} === 16'h4038)
            else $fatal(1,"PSRAM weight region overwritten");
        $display("PSRAM PIPELINE PASS: DMA, weight stationary, FP16 RMW, activation, address isolation; max CS=%0t", ram.max_active);

        // Reset a partial UART packet; subsequent packet must start cleanly.
        send_byte(8'h01); send_byte(8'h55);
        @(negedge clk); rst_n=0; repeat(4) @(negedge clk); rst_n=1;
        command(8'h05,8'h06,status);
        if(status[4:3]!=0) $fatal(1,"reset sticky status");
        if(uo_out[4]!==1) $fatal(1,"TX not idle high");
        $display("TT WRAPPER PASS: UART RX/TX, baud mismatch, framing/timeout recovery, delayed ACK, QSPI DMA, reset");
        $finish;
    end
    initial begin
        #100000000;
        $display("TIMEOUT accepted=%0d host=%0d flash=%0d bus=%b owner=%b phy=%0d psram=%0d req=%b rsp=%b", accepted, dut.host_state, dut.core.memory_bus.flash_adapter.state, dut.core.memory_bus.active, dut.core.memory_bus.owner, dut.core.memory_bus.phy.state, dut.core.memory_bus.ram_controller.state, dut.core.psram_req_valid, dut.core.psram_rsp_valid);
        $display("flash bytes=%0d beats=%0d phy reads=%0d valid=%b rxready=%b", dut.core.memory_bus.flash_adapter.bytes_left,dut.core.memory_bus.flash_adapter.beats_left,dut.core.memory_bus.phy.reads_left,dut.core.memory_bus.flash_adapter.dma_read_data_valid,dut.core.memory_bus.rx_ready);
        $fatal(1,"wrapper timeout");
    end
endmodule
