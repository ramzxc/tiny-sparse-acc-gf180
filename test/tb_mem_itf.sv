`timescale 1ns/1ps
`include "defs/defs.vh"
`include "defs/mem_defs.vh"
// Test-only commands for exercising mem_itf's low-level action/address ports.
// Not the core ISA implemented by decoder.
`define MEM_READ 7'd0
`define MEM_WRITE 7'd1
`define MEM_COPY 7'd2
`define MEM_SET_SRC 7'd3
`define MEM_SET_DST 7'd4

module tb_mem_itf;
    reg clk = 0;
    always #50 clk = !clk;
    reg rst_n = 0, req_val = 0;
    reg [`INST_WIDTH-1:0] request_word = 0;
    reg use_uart = 0, rx = 1;
    wire [`INST_WIDTH-1:0] uart_inst;
    wire uart_inst_val;
    wire [31:0] fifo_inst;
    wire fifo_valid, fifo_rdy, tx;
    reg stall_core = 0;
    wire core_rdy = rdy && !stall_core;
    wire [`INST_WIDTH-1:0] core_inst = use_uart ? fifo_inst : request_word;
    wire core_inst_val = use_uart ? (fifo_valid && core_rdy) : req_val;
    inst_fifo #(.WORD_WIDTH(32)) fifo (.clk(clk), .rst_n(rst_n), .inst(uart_inst), .inst_val(uart_inst_val),
        .fifo_rdy(fifo_rdy), .core_rdy(core_rdy), .inst_out(fifo_inst), .inst_out_val(fifo_valid));
    uart_tx transmitter (.clk(clk), .rst_n(rst_n), .inst_fifo_rdy(use_uart && fifo_rdy), .tx(tx));
    uart_rx #(.WORD_WIDTH(32)) receiver (.clk(clk), .rst_n(rst_n), .rx(rx), .inst(uart_inst), .inst_val(uart_inst_val));
    wire rdy, read_data_val;
    wire [15:0] read_data;
    wire qspi_req_val, qspi_req_rdy, qspi_req_write, qspi_read_data_val;
    wire [24:0] qspi_req_addr;
    wire [15:0] qspi_req_data, qspi_read_data;
    reg allow_qspi = 1;
    wire ctrl_ready;
    wire sck, flash_cs, ram_a_cs, ram_b_cs;
    wire [3:0] dq_out, dq_oe, flash_in, a_in, b_in;
    wire [3:0] dq_in = !flash_cs ? flash_in : !ram_a_cs ? a_in : !ram_b_cs ? b_in : 4'hf;

    // Test-only stand-in for the future core mem_ctrl.
    // ISA decoding AND persistent addresses live outside mem_itf.
    reg [24:0] core_src_addr = 0, core_dst_addr = 0;
    reg change_inputs = 0;
    always @(posedge clk) begin
        if (!rst_n) begin
            core_src_addr <= 0;
            core_dst_addr <= 0;
        end else if (rdy) begin
            if (set_src) core_src_addr <= core_inst[24:0];
            if (set_dst) core_dst_addr <= core_inst[24:0];
        end
    end
    wire set_src = core_inst_val && core_inst[31:25] == `MEM_SET_SRC;
    wire set_dst = core_inst_val && core_inst[31:25] == `MEM_SET_DST;
    wire read_en = core_inst_val && core_inst[31:25] == `MEM_READ;
    wire write_en = core_inst_val && core_inst[31:25] == `MEM_WRITE;
    wire copy_en = core_inst_val && core_inst[31:25] == `MEM_COPY;

    mem_itf dut (
        .clk(clk), .rst_n(rst_n), .rdy(rdy),
        .read_en(read_en), .write_en(write_en), .copy_en(copy_en),
        .src_addr(change_inputs ? 25'h1fffffe : core_src_addr),
        .dst_addr(change_inputs ? 25'h1fffffe : core_dst_addr),
        .write_data(change_inputs ? 16'hdead : core_inst[15:0]),
        .read_data(read_data), .read_data_val(read_data_val),
        .qspi_req_val(qspi_req_val), .qspi_req_rdy(qspi_req_rdy),
        .qspi_req_write(qspi_req_write), .qspi_req_addr(qspi_req_addr), .qspi_req_data(qspi_req_data),
        .qspi_read_data(qspi_read_data), .qspi_read_data_val(qspi_read_data_val)
    );
    assign qspi_req_rdy = allow_qspi && ctrl_ready;
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

    integer accepts = 0, completions = 0;
    reg stalled = 0;
    reg [41:0] held_request;
    always @(posedge clk) begin
        if (!rst_n) begin
            stalled <= 0;
        end else begin
            if (stalled && (!qspi_req_val || held_request !== {qspi_req_write, qspi_req_addr, qspi_req_data}))
                $fatal(1, "Request changed under QSPI backpressure");
            stalled <= qspi_req_val && !qspi_req_rdy;
            held_request <= {qspi_req_write, qspi_req_addr, qspi_req_data};
            if (qspi_req_val && qspi_req_rdy) accepts = accepts + 1;
            if (qspi_read_data_val) completions = completions + 1;
        end
    end

    // SET commands accept in one cycle, without generating a memory access.
    task automatic set_address(input [6:0] op, input [24:0] addr);
        integer before_count;
        begin
            @(negedge clk);
            if (!rdy) $fatal(1, "SET while busy");
            before_count = accepts;
            request_word = {op, addr};
            req_val = 1;
            @(negedge clk);
            req_val = 0;
            if (!rdy || qspi_req_val || read_data_val || accepts != before_count)
                $fatal(1, "SET unexpectedly accessed memory");
        end
    endtask

    task automatic execute(input [6:0] op, input [24:0] payload, input [15:0] expected);
        integer start_accepts, start_completions, timeout_count;
        begin
            @(negedge clk);
            if (!rdy) $fatal(1, "Request issued while busy");
            start_accepts = accepts;
            start_completions = completions;
            request_word = {op, payload};
            req_val = 1;
            @(negedge clk);
            if (rdy) $fatal(1, "rdy did not deassert on acceptance");
            req_val = 0;
            change_inputs = 1; // All address/data inputs can change while busy.
            request_word = {`MEM_SET_DST, 25'h1fffffe};
            timeout_count = 0;
            while (!rdy && timeout_count < 5000) begin
                if (read_data_val) $fatal(1, "Early core read response");
                @(negedge clk);
                timeout_count++;
            end
            if (!rdy) $fatal(1, "Request timeout");
            change_inputs = 0;
            if (accepts-start_accepts != (op == `MEM_COPY ? 2 : 1) ||
                completions-start_completions != (op == `MEM_COPY ? 2 : 1))
                $fatal(1, "Wrong QSPI count or early rdy assertion");
            if (op == `MEM_READ) begin
                if (!read_data_val || read_data !== expected)
                    $fatal(1, "Expected %h got %h valid=%b", expected, read_data, read_data_val);
            end else if (read_data_val) $fatal(1, "WRITE/COPY emitted read response");
            @(negedge clk);
            if (read_data_val) $fatal(1, "Read valid is not a pulse");
        end
    endtask

    integer uart_words = 0;
    reg [31:0] last_uart_word;
    reg [15:0] last_core_read;
    integer uart_read_count = 0;
    always @(posedge clk) if (rst_n && use_uart) begin
        if (uart_inst_val) begin
            
            uart_words = uart_words + 1;
            last_uart_word = uart_inst;
        end
        if (read_data_val) begin
            if (read_data !== 16'habc1) $fatal(1, "UART memory readback mismatch");
            last_core_read = read_data;
            uart_read_count = uart_read_count + 1;
        end
    end

    integer delivered = 0;
    reg [31:0] sent_words [0:31];
    integer sent_count = 0;
    always @(posedge clk) if (rst_n && use_uart && fifo_valid && core_rdy) begin
        if (delivered >= sent_count || fifo_inst !== sent_words[delivered])
            $fatal(1, "FIFO to fake core command ordering");
        delivered++;
    end

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

    // Independent transmitter: 115200 baud, a little faster than 87 core clocks.
    task automatic uart_byte(input [7:0] value);
        begin
            rx = 0;
            #8680;
            for (integer bit_no=0; bit_no<8; bit_no++) begin
                rx = value[bit_no];
                #8680;
            end
            rx = 1;
            #8680;
        end
    endtask

    task automatic uart_command(input [6:0] op, input [24:0] payload);
        reg [31:0] word_value;
        integer previous_words;
        begin
            word_value = {op, payload};
            wait_ready();
            sent_words[sent_count] = word_value;
            sent_count++;
            previous_words = uart_words;
            uart_byte(word_value[7:0]);
            uart_byte(word_value[15:8]);
            if (uart_words != previous_words) $fatal(1, "UART completed before four bytes");
            uart_byte(word_value[23:16]);
            uart_byte(word_value[31:24]);
            if (uart_words != previous_words+1 || last_uart_word !== word_value)
                $fatal(1, "UART instruction assembly/byte order");
        end
    endtask

    initial begin
        repeat (3) @(negedge clk);
        rst_n = 1;
        set_address(`MEM_SET_DST, `FLASH_BASE_ADDR + 25'hfe);
        execute(`MEM_WRITE, 25'hb35a, 0);
        set_address(`MEM_SET_SRC, `FLASH_BASE_ADDR + 25'hfe);
        set_address(`MEM_SET_DST, `PSRAM_A_BASE_ADDR + 25'h20);
        execute(`MEM_COPY, 0, 0);
        set_address(`MEM_SET_SRC, `PSRAM_A_BASE_ADDR + 25'h20);
        execute(`MEM_READ, 0, 16'hb35a);
        execute(`MEM_READ, 0, 16'hb35a); // Source persists, no auto increment.
        set_address(`MEM_SET_DST, `PSRAM_B_BASE_ADDR + 25'h40);
        execute(`MEM_COPY, 0, 0);
        set_address(`MEM_SET_SRC, `PSRAM_B_BASE_ADDR + 25'h40);
        execute(`MEM_READ, 0, 16'hb35a);
        set_address(`MEM_SET_DST, `FLASH_BASE_ADDR + 25'h100);
        execute(`MEM_COPY, 0, 0);
        set_address(`MEM_SET_SRC, `FLASH_BASE_ADDR + 25'h100);
        execute(`MEM_READ, 0, 16'hb35a);

        set_address(`MEM_SET_DST, `PSRAM_A_BASE_ADDR + 25'h20);
        execute(`MEM_WRITE, 25'h01fe, 0);
        execute(`MEM_WRITE, 25'h02fd, 0); // Destination persists.
        set_address(`MEM_SET_SRC, `PSRAM_A_BASE_ADDR + 25'h20);
        set_address(`MEM_SET_DST, `PSRAM_A_BASE_ADDR + 25'h22);
        execute(`MEM_COPY, 0, 0);
        set_address(`MEM_SET_SRC, `PSRAM_A_BASE_ADDR + 25'h22);
        execute(`MEM_READ, 0, 16'h02fd);

        allow_qspi = 0;
        fork
            execute(`MEM_READ, 0, 16'h02fd);
            begin
                repeat (15) @(negedge clk);
                allow_qspi = 1;
            end
        join

        // Hold a pending SET while a read executes. It must not change SRC early.
        @(negedge clk);
        request_word = {`MEM_READ, 25'b0};
        req_val = 1;
        @(negedge clk);
        request_word = {`MEM_SET_SRC, (`PSRAM_B_BASE_ADDR + 25'h40)};
        wait (rdy);
        @(negedge clk);
        if (!read_data_val || read_data !== 16'h02fd) $fatal(1, "Pending SET changed active read");
        @(negedge clk); // SET accepted on intervening rising edge.
        req_val = 0;
        if (!rdy) $fatal(1, "SET should complete immediately");
        execute(`MEM_READ, 0, 16'hb35a);

        // Joint reset cancels an unsent request and clears both saved addresses.
        allow_qspi = 0;
        @(negedge clk);
        request_word = {`MEM_READ, 25'b0};
        req_val = 1;
        @(negedge clk);
        req_val = 0;
        rst_n = 0;
        repeat (3) @(negedge clk);
        if (qspi_req_val || read_data_val || !rdy) $fatal(1, "Reset outputs");
        if (core_src_addr !== 0 || core_dst_addr !== 0 || dut.copy_dst_addr !== 0)
            $fatal(1, "Reset addresses");
        rst_n = 1;
        allow_qspi = 1;
        set_address(`MEM_SET_SRC, `PSRAM_B_BASE_ADDR + 25'h40);
        execute(`MEM_READ, 0, 16'hb35a);

        // Four bytes per instruction, feeding the same 7+25-bit interface.
        use_uart = 1;
        repeat (10) @(negedge clk);
        stall_core = 1;
        uart_command(`MEM_SET_DST, `PSRAM_A_BASE_ADDR + 25'h80);
        uart_command(`MEM_WRITE, 25'habc1);
        repeat (1200) begin
            @(negedge clk);
            if (fifo_rdy || tx !== 1 || delivered != 0) $fatal(1, "Core stall/full FIFO");
        end
        allow_qspi = 0;
        stall_core = 0;
        uart_command(`MEM_SET_SRC, `PSRAM_A_BASE_ADDR + 25'h80);
        uart_command(`MEM_READ, 0);
        repeat (1200) begin
            @(negedge clk);
            if (rdy || fifo_rdy || tx !== 1 || delivered != 2)
                $fatal(1, "Memory stall did not backpressure FIFO/host");
        end
        allow_qspi = 1;
        // Cross-chip copy and readback, all commands through UART and FIFO.
        uart_command(`MEM_SET_DST, `PSRAM_B_BASE_ADDR + 25'h90);
        uart_command(`MEM_COPY, 0);
        uart_command(`MEM_SET_SRC, `PSRAM_B_BASE_ADDR + 25'h90);
        uart_command(`MEM_READ, 0);
        uart_command(`MEM_SET_DST, `FLASH_BASE_ADDR + 25'h120);
        uart_command(`MEM_COPY, 0);
        uart_command(`MEM_SET_SRC, `FLASH_BASE_ADDR + 25'h120);
        uart_command(`MEM_READ, 0);
        repeat (1000) @(negedge clk);
        if (uart_words != 12 || delivered != 12 || uart_read_count != 3 || last_core_read !== 16'habc1)
            $fatal(1, "UART -> FIFO -> mem_itf -> QSPI integration");
        $display("PASS mem_itf: direct ports plus UART -> FIFO -> fake core -> QSPI; core/memory stalls, PSRAM A/B and Flash copy/readback");
        $finish;
    end
    initial begin
        #10000000;
        $fatal(1, "Timeout");
    end
endmodule
