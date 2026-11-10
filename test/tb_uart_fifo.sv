`timescale 1ns/1ps
module tb_uart_fifo;
    reg clk = 0;
    always #50 clk = !clk;
    reg rst_n = 0, rx = 1, core_rdy = 0;
    wire tx, fifo_rdy, inst_val, inst_out_val;
    wire [63:0] inst, inst_out;
    uart_tx transmitter (.clk(clk), .rst_n(rst_n), .inst_fifo_rdy(fifo_rdy), .tx(tx));
    uart_rx receiver (.clk(clk), .rst_n(rst_n), .rx(rx), .inst(inst), .inst_val(inst_val));
    inst_fifo #(.FIFO_DEPTH(2)) fifo (.clk(clk), .rst_n(rst_n), .inst(inst), .inst_val(inst_val),
        .fifo_rdy(fifo_rdy), .core_rdy(core_rdy), .inst_out(inst_out), .inst_out_val(inst_out_val));

    integer received = 0;
    reg [63:0] expected [0:2];
    always @(posedge clk) if (rst_n && inst_out_val && core_rdy) begin
        if (received >= 3 || inst_out !== expected[received]) $fatal(1, "UART FIFO output mismatch");
        received++;
    end

    task automatic wait_ready;
        reg [7:0] value;
        begin
            wait (tx == 0);
            #4350;
            if (tx !== 0) $fatal(1, "Bad READY start bit");
            for (integer i=0; i<8; i++) begin
                #8700;
                value[i] = tx;
            end
            #8700;
            if (tx !== 1 || value !== 8'h01) $fatal(1, "Bad READY byte");
            #4350;
        end
    endtask
    task automatic send_instruction(input [63:0] word_value);
        begin
            for (integer byte_no=0; byte_no<8; byte_no++) begin
                rx = 0;
                #8680;
                for (integer bit_no=0; bit_no<8; bit_no++) begin
                    rx = word_value[byte_no*8+bit_no];
                    #8680;
                end
                rx = 1;
                #8680;
            end
        end
    endtask

    initial begin
        expected[0]=64'hfedcba9801234567;
        expected[1]=64'h1020304089abcdef;
        expected[2]=64'habcdef0176543210;
        repeat (3) @(negedge clk);
        rst_n = 1;
        wait_ready();
        // Host is slow: keep the request high for more than two UART frames.
        // TX must remain idle instead of repeatedly emitting READY bytes.
        repeat (2000) begin
            @(negedge clk);
            if (tx !== 1 || !fifo_rdy) $fatal(1, "Repeated READY or lost request while host waits");
        end
        send_instruction(expected[0]);
        wait_ready();
        send_instruction(expected[1]);
        // Core is stalled and both entries are occupied: no further READY.
        repeat (1200) begin
            @(negedge clk);
            if (tx !== 1 || fifo_rdy || !inst_out_val) $fatal(1, "Full FIFO failed to stop host");
        end
        core_rdy = 1;
        wait_ready();
        send_instruction(expected[2]);
        repeat (10) @(negedge clk);
        if (received != 3) $fatal(1, "Missing instruction");
        $display("PASS UART TX -> host -> UART RX -> FIFO: READY throttling and 64-bit instruction ordering");
        $finish;
    end
    initial begin #4000000; $fatal(1, "Timeout"); end
endmodule
