`timescale 1ns/1ps
// Pin-level checks against the existing independent Flash/PSRAM models.
module tb_qspi_ctrl #(
    parameter time OUT_DELAY = 0ns,
    parameter time IN_DELAY = 0ns
);
    reg clk = 0;
    always #50 clk = !clk; // 10 MHz
    reg rst_n = 0;
    reg req_val = 0, req_write = 0;
    reg [24:0] req_addr = 0;
    reg [15:0] req_data = 0;
    wire req_rdy, read_data_val, sck, flash_cs, ram_a_cs, ram_b_cs;
    wire [15:0] read_data;
    wire [3:0] dq_out, dq_oe, flash_in, a_in, b_in;
    // Delays represent an illustrative outbound pad/mux delay and inbound
    // memory+pad delay, not a substitute for board/PDK timing signoff.
    wire pad_sck, pad_flash_cs, pad_a_cs, pad_b_cs;
    wire [3:0] pad_dq_out, pad_dq_oe;
    assign #(OUT_DELAY) pad_sck = sck;
    assign #(OUT_DELAY) pad_flash_cs = flash_cs;
    assign #(OUT_DELAY) pad_a_cs = ram_a_cs;
    assign #(OUT_DELAY) pad_b_cs = ram_b_cs;
    assign #(OUT_DELAY) pad_dq_out = dq_out;
    assign #(OUT_DELAY) pad_dq_oe = dq_oe;
    wire [3:0] dq_in;
    assign #(IN_DELAY) dq_in = !pad_flash_cs ? flash_in : !pad_a_cs ? a_in : !pad_b_cs ? b_in : 4'hf;
    reg stuck_busy = 0, reject_wren = 0;
    integer completions = 0;
    reg previous_read_data_val = 0;
    time last_sck_edge = 0;

    qspi_ctrl dut (
        .clk(clk), .rst_n(rst_n), .req_val(req_val), .req_rdy(req_rdy),
        .req_write(req_write), .req_addr(req_addr), .req_data(req_data),
        .read_data(read_data), .read_data_val(read_data_val), .sck(sck),
        .flash_sc_n(flash_cs), .psram_a_sc_n(ram_a_cs), .psram_b_sc_n(ram_b_cs),
        .dq_in(dq_in), .dq_out(dq_out), .dq_oe(dq_oe)
    );
    qspi_psram_model #(.DEPTH(512)) ram_a (
        .sck(pad_sck), .cs_n(pad_a_cs), .dq_out(pad_dq_out), .dq_oe(pad_dq_oe), .dq_in(a_in)
    );
    qspi_psram_model #(.DEPTH(512)) ram_b (
        .sck(pad_sck), .cs_n(pad_b_cs), .dq_out(pad_dq_out), .dq_oe(pad_dq_oe), .dq_in(b_in)
    );
    qspi_nor_model #(.DEPTH(512), .BOARD_PREPARED(1), .PROGRAM_TIME(15000ns)) flash (
        .clk(clk), .sck(pad_sck), .cs_n(pad_flash_cs), .dq_out(pad_dq_out), .dq_oe(pad_dq_oe),
        .dq_in(flash_in), .stuck_busy(stuck_busy), .reject_wren(reject_wren), .ignore_qe(1'b0)
    );

    always @(negedge clk) if (rst_n) begin
        if ((!flash_cs + !ram_a_cs + !ram_b_cs) > 1)
            $fatal(1, "Multiple chip selects");
        if (previous_read_data_val && read_data_val) $fatal(1, "read_data_val is not a pulse");
        if (read_data_val) begin
            if (!flash_cs || !ram_a_cs || !ram_b_cs || sck)
                $fatal(1, "Completion before bus released");
            completions = completions + 1;
        end
        previous_read_data_val = read_data_val;
    end
    always @(sck) if (rst_n) begin
        if (last_sck_edge != 0 && $time - last_sck_edge < 100ns)
            $fatal(1, "SCK pulse shorter than one core period");
        last_sck_edge = $time;
    end

    task automatic access(input bit wr, input [24:0] addr, input [15:0] value);
        integer timeout_count;
        begin
            @(negedge clk);
            req_addr = addr;
            req_write = wr;
            req_data = value;
            req_val = 1;
            #1;
            if (!req_rdy) $fatal(1, "Not ready for aligned request");
            @(posedge clk);
            @(negedge clk);
            req_val = 0;
            // Inputs need not remain stable after acceptance.
            req_addr = 25'h1fffffe;
            req_data = ~value;
            req_write = !wr;
            timeout_count = 0;
            while (!read_data_val && timeout_count < 5000) begin
                if (req_rdy) $fatal(1, "Accepted another request while busy");
                @(negedge clk);
                timeout_count++;
            end
            if (!read_data_val) $fatal(1, "Request timeout at %h", addr);
            if (!wr && read_data !== value)
                $fatal(1, "Read %h: expected %h got %h", addr, value, read_data);
            if (!addr[24] && wr && flash.busy)
                $fatal(1, "Flash read_data_val before program completion");
        end
    endtask

    initial begin
        repeat (3) @(negedge clk);
        rst_n = 1;
        access(1, 25'h1000000, 16'h1234);
        access(1, 25'h1800000, 16'habcd);
        if (ram_a.mem[0] !== 8'h34 || ram_a.mem[1] !== 8'h12 || ram_b.mem[0] !== 8'hcd)
            $fatal(1, "Wrong bank or byte ordering");
        access(0, 25'h1000000, 16'h1234);
        access(0, 25'h1800000, 16'habcd);
        for (integer i = 0; i < 16; i++) begin
            access(1, 25'h1000020 + 2*i, 16'h9e37 ^ (i*7919));
            access(0, 25'h1000020 + 2*i, 16'h9e37 ^ (i*7919));
            access(1, 25'h1800020 + 2*i, 16'hf081 ^ (i*997));
            access(0, 25'h1800020 + 2*i, 16'hf081 ^ (i*997));
        end
        access(0, 25'h0000000, 16'hffff);
        access(1, 25'h00000fe, 16'h1023); // Last aligned word in a Flash page.
        access(0, 25'h00000fe, 16'h1023);
        access(1, 25'h0000100, 16'h4567);
        access(0, 25'h0000100, 16'h4567);
        if (flash.mem[254] !== 8'h23 || flash.mem[255] !== 8'h10)
            $fatal(1, "Flash byte ordering");

        // Retry WREN if the device did not set WEL; do not falsely complete.
        reject_wren = 1;
        fork
            access(1, 25'h0000102, 16'h0081);
            begin
                repeat (300) @(negedge clk);
                if (read_data_val) $fatal(1, "Completion while WREN rejected");
                reject_wren = 0;
            end
        join
        access(0, 25'h0000102, 16'h0081);

        // Flash busy after an earlier operation: read must wait.
        stuck_busy = 1;
        fork
            access(0, 25'h0000100, 16'h4567);
            begin
                repeat (200) @(negedge clk);
                if (read_data_val) $fatal(1, "Read completed while Flash busy");
                stuck_busy = 0;
            end
        join

        @(negedge clk);
        req_addr = 1;
        req_val = 1;
        repeat (5) begin
            @(negedge clk);
            if (req_rdy || !flash_cs || !ram_a_cs || !ram_b_cs)
                $fatal(1, "Odd address accepted");
        end
        req_val = 0;
        req_addr = 0;

        // Reset cancels an in-flight read and releases all chip selects.
        @(negedge clk);
        req_addr = 25'h1800000;
        req_write = 0;
        req_val = 1;
        @(negedge clk);
        req_val = 0;
        repeat (20) @(negedge clk);
        rst_n = 0;
        repeat (3) @(negedge clk);
        if (!flash_cs || !ram_a_cs || !ram_b_cs || sck || read_data_val || req_rdy)
            $fatal(1, "Bad reset state");
        rst_n = 1;
        access(0, 25'h1800000, 16'habcd);
        if (flash.program_ops != 3) $fatal(1, "Unexpected Flash programs");
        $display("PASS qspi_ctrl: banks, endian, reads/writes, Flash WEL/WIP, alignment, reset");
        $finish;
    end
    initial begin
        #10000000;
        $fatal(1, "Global timeout");
    end
endmodule
