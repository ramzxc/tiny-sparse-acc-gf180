// Flash and all three PSRAM-backed buffers share one physical QSPI engine.
// Bus ownership lasts for one CS assertion, never for a whole DMA burst.
module qspi_memory_bus
    import tpu_pkg::*;
(
    input  logic        clk, rst,
    input  logic [31:0] dma_read_cmd_addr,
    input  logic [7:0]  dma_read_cmd_len,
    input  logic        dma_read_cmd_valid,
    output logic        dma_read_cmd_ready,
    output logic [63:0] dma_read_data,
    output logic        dma_read_data_last, dma_read_data_valid,
    input  logic        dma_read_data_ready,
    input  logic [31:0] dma_write_cmd_addr,
    input  logic [7:0]  dma_write_cmd_len,
    input  logic        dma_write_cmd_valid,
    output logic        dma_write_cmd_ready,
    input  logic [63:0] dma_write_data,
    input  logic [7:0]  dma_write_strb,
    input  logic        dma_write_data_last, dma_write_data_valid,
    output logic        dma_write_data_ready,
    output logic        dma_write_rsp_valid,
    input  logic        dma_write_rsp_ready,
    output logic        available, busy, error,
    output logic [2:0]  error_code,            // 1=address, 2=LAST, 3=poll timeout, 4=WEL
    input  psram_req_type [2:0] psram_req,
    input  logic [2:0] psram_req_valid,
    output logic [2:0] psram_req_ready,
    output logic [2:0][31:0] psram_rsp_data,
    output logic [2:0] psram_rsp_valid,
    input  logic [3:0] qspi_dq_in,
    output logic [3:0] qspi_dq_out, qspi_dq_oe,
    output logic qspi_sck, qspi_cs_n, psram_cs_n
);
    qspi_cmd_type [1:0] commands;
    qspi_tx_type [1:0] tx;
    logic [1:0] cmd_valid, cmd_ready, tx_ready, rx_valid, rx_ready, done;
    logic [7:0] rx_data;
    logic active, owner, prefer_ram, selected;
    logic phy_ready, phy_tx_ready, phy_rx_valid, phy_done, phy_cs_n;
    qspi_cmd_type selected_cmd;
    qspi_tx_type selected_tx;

    assign selected = active ? owner :
                      (cmd_valid[1] && (!cmd_valid[0] || prefer_ram));
    assign selected_cmd = commands[selected];
    assign selected_tx = tx[selected];
    assign qspi_cs_n = active && !owner ? phy_cs_n : 1'b1;
    assign psram_cs_n = active && owner ? phy_cs_n : 1'b1;

    always_comb begin
        cmd_ready = 0;
        tx_ready = 0;
        rx_valid = 0;
        done = 0;
        if (!active && !rst) cmd_ready[selected] = phy_ready;
        if (active && !rst) begin
            tx_ready[owner] = phy_tx_ready;
            rx_valid[owner] = phy_rx_valid;
            done[owner] = phy_done;
        end
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            active <= 0;
            owner <= 0;
            prefer_ram <= 0;
        end else begin
            if (!active && cmd_valid[selected] && phy_ready) begin
                active <= 1;
                owner <= selected;
            end else if (active && phy_done) begin
                active <= 0;
                prefer_ram <= !owner;
            end
        end
    end

    qspi_flash_phy phy (
        .clk(clk), .rst(rst),
        .cmd_valid(!active && cmd_valid[selected]), .cmd_ready(phy_ready),
        .cmd_opcode(selected_cmd.opcode), .cmd_addr(selected_cmd.addr),
        .cmd_has_addr(selected_cmd.has_addr), .cmd_dummy(selected_cmd.dummy),
        .cmd_dir(selected_cmd.direction), .cmd_quad(selected_cmd.quad),
        .cmd_header_quad(selected_cmd.header_quad), .cmd_read_count(selected_cmd.count),
        .tx_data(selected_tx.data), .tx_valid(active && selected_tx.valid),
        .tx_last(selected_tx.last), .tx_end(active && selected_tx.end_stream),
        .tx_ready(phy_tx_ready), .rx_data(rx_data), .rx_valid(phy_rx_valid),
        .rx_ready(active && rx_ready[owner]), .done(phy_done),
        .dq_in(qspi_dq_in), .dq_out(qspi_dq_out), .dq_oe(qspi_dq_oe),
        .sck(qspi_sck), .cs_n(phy_cs_n)
    );

    qspi_flash_adapter flash_adapter (
        .clk(clk),
        .rst(rst),
        .dma_read_cmd_addr(dma_read_cmd_addr),
        .dma_read_cmd_len(dma_read_cmd_len),
        .dma_read_cmd_valid(dma_read_cmd_valid),
        .dma_read_cmd_ready(dma_read_cmd_ready),
        .dma_read_data(dma_read_data),
        .dma_read_data_last(dma_read_data_last),
        .dma_read_data_valid(dma_read_data_valid),
        .dma_read_data_ready(dma_read_data_ready),
        .dma_write_cmd_addr(dma_write_cmd_addr),
        .dma_write_cmd_len(dma_write_cmd_len),
        .dma_write_cmd_valid(dma_write_cmd_valid),
        .dma_write_cmd_ready(dma_write_cmd_ready),
        .dma_write_data(dma_write_data),
        .dma_write_strb(dma_write_strb),
        .dma_write_data_last(dma_write_data_last),
        .dma_write_data_valid(dma_write_data_valid),
        .dma_write_data_ready(dma_write_data_ready),
        .dma_write_rsp_valid(dma_write_rsp_valid),
        .dma_write_rsp_ready(dma_write_rsp_ready),
        .available(available),
        .busy(busy),
        .error(error),
        .error_code(error_code),
        .bus_cmd(commands[0]), .bus_cmd_valid(cmd_valid[0]), .bus_cmd_ready(cmd_ready[0]),
        .bus_tx(tx[0]), .bus_tx_ready(tx_ready[0]),
        .bus_rx_data(rx_data), .bus_rx_valid(rx_valid[0]), .bus_rx_ready(rx_ready[0]),
        .bus_done(done[0])
    );

    psram_ctrl ram_controller (
        .clk(clk), .rst(rst),
        .req(psram_req), .req_valid(psram_req_valid), .req_ready(psram_req_ready),
        .rsp_data(psram_rsp_data), .rsp_valid(psram_rsp_valid),
        .bus_cmd(commands[1]), .bus_cmd_valid(cmd_valid[1]), .bus_cmd_ready(cmd_ready[1]),
        .bus_tx(tx[1]), .bus_tx_ready(tx_ready[1]),
        .bus_rx_data(rx_data), .bus_rx_valid(rx_valid[1]), .bus_rx_ready(rx_ready[1]),
        .bus_done(done[1])
    );

`ifndef SYNTHESIS
    // At 10MHz a PSRAM transaction must finish in fewer than 80 core cycles.
    integer ram_cycles;
    always @(posedge clk) begin
        if (rst || psram_cs_n) ram_cycles <= 0;
        else begin
            ram_cycles <= ram_cycles + 1;
            assert (ram_cycles < 79) else $fatal(1, "PSRAM CS-low exceeds 8us at 10MHz");
        end
        if (!rst)
            assert (qspi_cs_n || psram_cs_n) else $fatal(1, "Two QSPI chips selected");
    end
`endif
endmodule
