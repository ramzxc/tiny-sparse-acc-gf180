`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/mem_defs.vh"
`include "defs/micro_defs.vh"
module tb_tt_checkpoint;
    reg clk=0;
    always #50 clk=!clk;
    reg rst_n=0,rx=1;
    wire tx,done,error;
    wire [7:0] uo_out, uio_out, uio_oe;
    wire [3:0] flash_in, a_in, b_in;
    wire sck = uio_out[3];
    wire flash_cs = uio_out[0], ram_a_cs = uio_out[6], ram_b_cs = uio_out[7];
    wire [3:0] dq_out = {uio_out[5:4], uio_out[2:1]};
    wire [3:0] dq_oe = {uio_oe[5:4], uio_oe[2:1]};
    wire [3:0] dq_in = !flash_cs ? flash_in : !ram_a_cs ? a_in : !ram_b_cs ? b_in : 4'hf;
    tt_um_tiny_sparse_acc_ramzxc dut (
        .clk(clk), .rst_n(rst_n), .ena(1'b1), .ui_in({4'b0, rx, 3'b0}),
        .uo_out(uo_out), .uio_in({2'b0, dq_in[3:2], 1'b0, dq_in[1:0], 1'b0}),
        .uio_out(uio_out), .uio_oe(uio_oe)
    );
    assign tx = uo_out[4];
    assign done = uo_out[1];
    assign error = uo_out[2];
    wire rx_inst_val = dut.rx_inst_val;
    wire [63:0] rx_inst = dut.rx_inst;
    wire host_inst_val = dut.host_inst_val, host_rdy = dut.host_rdy;
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

    integer credits=0,completed=0,failed=0;
    integer starts=0,rx_words=0;
    always @(posedge clk) if(rst_n) begin
        if(rx_inst_val) rx_words++;
        if(done) begin
            if(error) failed++;else completed++;
        end
        if(host_inst_val && host_rdy && dut.sequencer.valid_request) starts++;
    end
    // Independent host RX: consume every READY even while waiting for a job.
    reg [7:0] ready_byte;
    initial forever begin
        @(negedge tx);
        #4350;
        if(tx !== 0) $fatal(1,"READY start");
        for(integer i=0;i<8;i++) begin #8700;ready_byte[i]=tx;end
        #8700;
        if(tx !== 1 || ready_byte !== 1) $fatal(1,"READY frame");
        credits++;
        #4350;
    end
    task automatic send_word(input [63:0] word_value);
        integer before_words;
        begin
            before_words=rx_words;
            wait(credits>0);
            credits--;
            // PC byte timing is not phase-locked to the chip clock.
            #37;
            for(integer byte_no=0;byte_no<8;byte_no++) begin
                rx=0;#8681;
                for(integer bit_no=0;bit_no<8;bit_no++) begin
                    rx=word_value[byte_no*8+bit_no];#8681;
                end
                rx=1;#8681;
                if(byte_no<7 && rx_words!=before_words) $fatal(1,"Early UART64 completion");
            end
            if(rx_words!=before_words+1 || rx_inst !== word_value) $fatal(1,"UART64 assembly/byte order");
        end
    endtask
    initial begin
        repeat(3) @(negedge clk);
        rst_n=1;
        // Zero M is invalid and must not issue memory traffic.
        send_word({1'b0,1'b1,2'd0,8'd0,8'd3,8'd1,12'd32,12'd128,12'd256});
        repeat(5) @(negedge clk);
        if(failed!=1 || completed!=0 || starts!=0) $fatal(1,"Invalid shape rejection");
        for(integer i=0;i<12;i++) ram_a.mem[32+i]=8'h10;
        ram_a.mem[33]=8'h20;ram_a.mem[34]=8'h30;ram_a.mem[35]=8'h40;
        ram_b.mem[128]=8'h20;ram_b.mem[129]=0;ram_b.mem[130]=8'h10;ram_b.mem[131]=8'h10;
        ram_b.mem[132]=8'h10;ram_b.mem[133]=0;ram_b.mem[134]=0;ram_b.mem[135]=0;
        send_word({1'b0,1'b1,2'd0,8'd4,8'd3,8'd1,12'd32,12'd128,12'd256});
        // Two complete jobs queue while job 1 is stalled.
        send_word({1'b0,1'b1,2'd2,8'd4,8'd3,8'd1,12'd32,12'd128,12'd288});
        send_word({1'b0,1'b1,2'd0,8'd4,8'd3,8'd2,12'd32,12'd128,12'd320});
        wait(completed==3);
        @(negedge clk);
        if(failed!=1 || starts!=3) $fatal(1,"Duplicate/missing job");
        if({ram_b.mem[259],ram_b.mem[258],ram_b.mem[257],ram_b.mem[256]} !== 32'h7f705030)
            $fatal(1,"UART MATVEC result");
        if({ram_b.mem[291],ram_b.mem[290],ram_b.mem[289],ram_b.mem[288]} !== 32'h10101010)
            $fatal(1,"Queued activation/output selection");
        if({ram_b.mem[323],ram_b.mem[322],ram_b.mem[321],ram_b.mem[320]} !== 32'h7f705030 ||
           {ram_b.mem[327],ram_b.mem[326],ram_b.mem[325],ram_b.mem[324]} !== 32'h50403020)
            $fatal(1,"Multi-column matrix output");
        // Reserved bit and zero N are invalid.
        send_word({1'b1,1'b0,2'd3,8'd4,8'd3,8'd1,12'd32,12'd128,12'd256});
        send_word({1'b0,1'b0,2'd0,8'd4,8'd3,8'd0,12'd32,12'd128,12'd256});
        repeat(10) @(negedge clk);
        if(failed!=3 || starts!=3 || !error) $fatal(1,"Invalid host commands");
        $display("PASS UART64 -> FIFO -> micro_ctrl -> decoder -> QSPI/VPU/ACT: three jobs, eight-byte assembly, backpressure, B-sparse matrix results, malformed commands");
        $finish;
    end
    initial begin #10000000;$fatal(1,"Timeout");end
endmodule
