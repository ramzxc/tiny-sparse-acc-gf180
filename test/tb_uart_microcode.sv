`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/inst_defs.vh"
`include "defs/mem_defs.vh"
`include "defs/micro_defs.vh"
module tb_uart_microcode;
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
    wire [15:0] rx_inst = dut.rx_inst;
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

    integer credits=0, rx_words=0;
    always @(posedge clk) if (rst_n && rx_inst_val) rx_words++;
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
    task automatic send_word(input [15:0] word_value);
        integer before_words;
        begin
            before_words=rx_words;
            wait(credits>0);
            credits--;
            // PC byte timing is not phase-locked to the chip clock.
            #37;
            for(integer byte_no=0;byte_no<2;byte_no++) begin
                rx=0;#8681;
                for(integer bit_no=0;bit_no<8;bit_no++) begin
                    rx=word_value[byte_no*8+bit_no];#8681;
                end
                rx=1;#8681;
                if(byte_no<1 && rx_words!=before_words) $fatal(1,"Early UART16 completion");
            end
            if(rx_words!=before_words+1 || rx_inst !== word_value) $fatal(1,"UART16 assembly/byte order");
        end
    endtask
    task automatic instruction(input [6:0] op, input [24:0] payload);
        begin
            if (op == 4 || op == 5) begin
                send_word({op[2:0], payload[12:0]});
                send_word({(op[2:0] + 3'd2), 1'b0, payload[24:13]});
            end else send_word({op, payload[8:0]});
        end
    endtask
    initial begin
        repeat(3) @(negedge clk);
        rst_n=1;
        ram_a.mem[32]=8'h38; ram_a.mem[33]=8'h40; // weights 1,2
        ram_b.mem[128]=8'h44; ram_b.mem[129]=0;   // input 3
        instruction(7'd4, `WEIGHT_BASE_ADDR+25'd32);
        instruction(`SRAM_TO_VPU, 0);
        instruction(`MEM_SYNC, 0);
        instruction(7'd4, `UNIFIED_BASE_ADDR+25'd128);
        instruction(`SRAM_TO_VPU, 1); // broadcast scalar input
        instruction(`MEM_SYNC, 0);
        instruction(`EXECUTE, 2); // MUL, overwrite: 3,6
        instruction(`EXE_SYNC, 0);
        instruction(7'd5, `UNIFIED_BASE_ADDR+25'd256);
        instruction(`ACT_TO_SRAM, 0);
        instruction(`MEM_SYNC, 0);
        if (ram_b.mem[256] !== 8'h44)
            $fatal(1, "Direct microcode multiply/store mismatch");
        instruction(`EXECUTE, 6); // MUL + accumulate: 6,12
        instruction(`EXE_SYNC, 0);
        instruction(7'd5, `UNIFIED_BASE_ADDR+25'd258);
        instruction(`ACT_TO_SRAM, 0);
        instruction(`MEM_SYNC, 0);
        if (ram_b.mem[258] !== 8'h4c)
            $fatal(1, "Direct microcode accumulation mismatch");
        instruction(`ACTIVATE, 25'd16); // hard sigmoid: 1,1
        instruction(`EXE_SYNC, 0);
        instruction(7'd5, `UNIFIED_BASE_ADDR+25'd260);
        instruction(`ACT_TO_SRAM, 0);
        instruction(`MEM_SYNC, 0);
        if (ram_b.mem[260] !== 8'h38)
            $fatal(1, "Direct microcode activation mismatch");
        if (rx_words != 26 || error || done) $fatal(1, "Direct protocol mismatch");
        $display("PASS UART16 microcode: 26 instructions, memory loads, multiply, accumulation, activation, PSRAM stores and sync");
        $finish;
    end
    initial begin #15000000; $fatal(1,"Timeout"); end
endmodule
