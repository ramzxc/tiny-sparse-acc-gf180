`timescale 1ns/1ps
module tb_uart_checkpoint;
    reg clk = 0;
    always #50 clk = !clk;
    reg rst_n = 0, rx = 1, core_rdy = 0;
    wire tx, fifo_rdy, inst_val, inst_out_val;
    wire [63:0] inst, inst_out;
    uart_tx transmitter (.clk(clk), .rst_n(rst_n), .inst_fifo_rdy(fifo_rdy), .tx(tx));
    uart_rx receiver (.clk(clk), .rst_n(rst_n), .rx(rx), .inst(inst), .inst_val(inst_val));
    inst_fifo fifo (.clk(clk), .rst_n(rst_n), .inst(inst), .inst_val(inst_val),
        .fifo_rdy(fifo_rdy), .core_rdy(core_rdy), .inst_out(inst_out), .inst_out_val(inst_out_val));
    integer received = 0, decoded = 0;
    reg expect_word = 0;
    reg [63:0] expected;
    always @(posedge clk) if (rst_n) begin
        if (inst_val) begin
            if (!expect_word || inst !== expected) $fatal(1, "Unexpected/corrupted RX word %h", inst);
            decoded++;
        end
        if (inst_out_val && core_rdy) begin
            if (!expect_word || inst_out !== expected) $fatal(1, "Unexpected/corrupted FIFO word");
            received++;
        end
    end
    task automatic reset_link;
        begin
            @(negedge clk);
            rst_n = 0;
            rx = 1; // Host aborts its old frame and restarts after reset/READY.
            core_rdy = 0;
            repeat (4) @(negedge clk);
            if (tx !== 1 || inst_val || inst_out_val || fifo_rdy) $fatal(1, "Reset outputs");
            received = 0;
            decoded = 0;
            expect_word = 0;
            rst_n = 1;
        end
    endtask
    task automatic wait_ready;
        reg [7:0] value;
        begin
            wait (tx == 0);
            #4350;
            if (tx !== 0) $fatal(1, "READY start");
            for (integer i=0; i<8; i++) begin #8700; value[i] = tx; end
            #8700;
            if (tx !== 1 || value !== 1) $fatal(1, "READY frame");
            #4350;
        end
    endtask
    task automatic send_byte(input [7:0] value, input integer period_ns);
        begin
            rx = 0;
            #(period_ns);
            for (integer i=0; i<8; i++) begin
                rx = value[i];
                #(period_ns);
            end
            rx = 1;
            #(period_ns);
        end
    endtask
    task automatic send_word(input [63:0] value, input integer period_ns);
        begin
            expected = value;
            expect_word = 1;
            for (integer i=0; i<8; i++) send_byte(value[i*8+:8], period_ns);
        end
    endtask
    task automatic check_delivery;
        begin
            repeat (20) @(negedge clk);
            if (decoded != 1 || received != 1) $fatal(1, "Missing/duplicate instruction");
        end
    endtask
    task automatic recovery;
        begin
            reset_link();
            wait_ready();
            core_rdy = 1;
            send_word(64'h96a53cc3a55a0ff0, 8681);
            check_delivery();
        end
    endtask
    integer period_ns, cases = 0;
    initial begin
        // Baud offsets relative to 115200, asynchronous phases across a 100 ns clock.
        for (integer offset=-2; offset<=2; offset++) begin
            period_ns = 1000000000.0 / (115200.0 * (1.0 + offset/100.0));
            for (integer phase=0; phase<100; phase+=13) begin
                reset_link();
                wait_ready();
                #(phase);
                core_rdy = 1;
                send_word((phase & 1) ? 64'h55aa00ffff0055aa : 64'haa55ff0000ffaa55, period_ns);
                check_delivery();
                cases++;
            end
        end
        // Reset during READY transmission: start, data, and stop portions.
        for (integer segment=0; segment<3; segment++) begin
            reset_link();
            wait (tx == 0);
            #(segment == 0 ? 2000 : segment == 1 ? 25000 : 80000);
            recovery();
        end
        // Reset after one through seven bytes of a partial instruction.
        for (integer bytes=1; bytes<=7; bytes++) begin
            reset_link();
            wait_ready();
            for (integer i=0; i<bytes; i++) send_byte(8'ha5, 8681);
            recovery();
        end
        // Reset in the middle of an RX byte, while the line is LOW.
        reset_link();
        wait_ready();
        rx = 0;
        #17000;
        recovery();
        // Reset discards a queued instruction that the core has not consumed.
        reset_link();
        wait_ready();
        send_word(32'hdeadbeef, 8681);
        repeat (10) @(negedge clk);
        if (decoded != 1 || received != 0) $fatal(1, "Queued reset setup");
        recovery();
        $display("PASS UART checkpoint: %0d baud/phase cases (-2..+2%%), 12 interrupted/queued reset recovery cases", cases);
        $finish;
    end
    initial begin #80000000; $fatal(1, "Timeout"); end
endmodule
