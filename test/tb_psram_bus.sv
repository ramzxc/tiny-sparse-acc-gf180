`timescale 1ns/1ps
module tb_psram_bus;
    import tpu_pkg::*;
    logic clk = 0, rst = 1;
    always #50 clk = ~clk;
    psram_req_type [2:0] req;
    logic [2:0] req_valid, req_ready, rsp_valid;
    logic [2:0][31:0] rsp_data;
    logic [2:0] read_valid = 0, read_ready, read_rsp_valid, read_rsp_ready = 0;
    logic [2:0] write_valid = 0, write_ready, write_done, busy;
    logic [2:0][31:0] read_data, write_data;
    logic [3:0] dq_in, dq_out, dq_oe;
    logic sck, flash_cs, ram_cs;

    for (genvar i = 0; i < 3; i++) begin : clients
        psram_buffer_ctrl #(.BASE_ADDR(i * 65536), .DATA_WIDTH(32), .ADDR_WIDTH(2)) buffer (
            .clk(clk), .rst(rst),
            .read_req_addr(2'd0), .read_req_valid(read_valid[i]), .read_req_ready(read_ready[i]),
            .read_rsp_data(read_data[i]), .read_rsp_valid(read_rsp_valid[i]),
            .read_rsp_ready(read_rsp_ready[i]),
            .write_addr(2'd0), .write_data(write_data[i]), .write_valid(write_valid[i]),
            .write_ready(write_ready[i]), .write_done(write_done[i]), .busy(busy[i]),
            .psram_req(req[i]), .psram_req_valid(req_valid[i]), .psram_req_ready(req_ready[i]),
            .psram_rsp_data(rsp_data[i]), .psram_rsp_valid(rsp_valid[i])
        );
    end
    qspi_memory_bus bus (
        .clk(clk), .rst(rst),
        .dma_read_cmd_addr(32'd0), .dma_read_cmd_len(8'd0), .dma_read_cmd_valid(1'b0),
        .dma_read_data_ready(1'b0),
        .dma_write_cmd_addr(32'd0), .dma_write_cmd_len(8'd0), .dma_write_cmd_valid(1'b0),
        .dma_write_data(64'd0), .dma_write_strb(8'd0), .dma_write_data_last(1'b0),
        .dma_write_data_valid(1'b0), .dma_write_rsp_ready(1'b0),
        .psram_req(req), .psram_req_valid(req_valid), .psram_req_ready(req_ready),
        .psram_rsp_data(rsp_data), .psram_rsp_valid(rsp_valid),
        .qspi_dq_in(dq_in), .qspi_dq_out(dq_out), .qspi_dq_oe(dq_oe),
        .qspi_sck(sck), .qspi_cs_n(flash_cs), .psram_cs_n(ram_cs)
    );
    qspi_psram_model ram (.sck(sck), .cs_n(ram_cs), .dq_out(dq_out), .dq_oe(dq_oe), .dq_in(dq_in));

    logic [2:0] completed = 0;
    always @(posedge clk) begin
        if (rst) completed <= 0;
        else completed <= completed | write_done;
    end

    initial begin
        write_data = {32'hfedcba98, 32'h76543210, 32'h01234567};
        repeat (5) @(negedge clk);
        rst = 0;
        // All clients arrive together; each must complete without starvation.
        write_valid = 3'b111;
        @(negedge clk); write_valid = 0;
        wait (&completed);
        @(negedge clk); read_valid = 3'b111;
        @(negedge clk); read_valid = 0;
        wait (&read_rsp_valid);
        if (read_data !== write_data) $fatal(1, "Concurrent client data mismatch");
        // Keep responses stalled far longer than the refresh limit. CS must be high.
        repeat (100) begin
            @(negedge clk);
            if (!ram_cs || read_rsp_valid != 7 || read_data !== write_data)
                $fatal(1, "Stalled response held bus or changed data");
        end
        read_rsp_ready = 7;
        @(negedge clk); read_rsp_ready = 0;
        // Reset in the middle of a read; then verify retained external memory.
        read_valid = 1;
        @(negedge clk); read_valid = 0;
        wait (!ram_cs);
        repeat (5) @(negedge clk);
        rst = 1;
        repeat (3) @(negedge clk);
        if (!ram_cs || !flash_cs) $fatal(1, "Reset left a chip selected");
        rst = 0;
        read_valid = 7;
        @(negedge clk); read_valid = 0;
        wait (&read_rsp_valid);
        if (read_data !== write_data) $fatal(1, "Reset recovery data mismatch");
        $display("PSRAM BUS PASS: simultaneous clients, stalled responses, reset recovery");
        $finish;
    end
    initial begin #1000000; $fatal(1, "PSRAM bus test timeout"); end
endmodule
