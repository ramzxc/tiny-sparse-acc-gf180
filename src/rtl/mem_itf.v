`include "defs/defs.vh"
`include "defs/mem_defs.vh"

// One vector request from data_ctrl, serialized into QSPI byte requests.
// data_ctrl holds addr/device stable until rdy returns high.
module mem_itf (
    input  wire clk,
    input  wire rst_n,
    input  wire read_en,
    input  wire write_en,
    output wire rdy,

    input  wire [`MEM_ADDR_WIDTH-1:0] addr,
    input  wire [`MEM_DEVICE_WIDTH-1:0] device,
    input  wire [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] write_data,
    output reg [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] read_data,
    output reg read_data_val,

    output wire qspi_req_val,
    input  wire qspi_req_rdy,
    output reg qspi_req_write,
    output wire [`MEM_ADDR_WIDTH-1:0] qspi_req_addr,
    output wire [`MEM_DEVICE_WIDTH-1:0] qspi_req_device,
    output wire [`DATA_WIDTH-1:0] qspi_req_data,
    input  wire [`DATA_WIDTH-1:0] qspi_read_data,
    input  wire qspi_read_data_val
);
    localparam [1:0] IDLE = 0, SEND = 1, WAIT = 2;
    reg [1:0] state;
    localparam integer LANE_BITS = `COMPUTE_WIDTH > 1 ? $clog2(`COMPUTE_WIDTH) : 1;
    reg [LANE_BITS-1:0] lane_index;
    reg [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] write_buffer;

    assign rdy             = rst_n && state == IDLE;
    assign qspi_req_val    = rst_n && state == SEND;
    assign qspi_req_addr   = addr + `MEM_ADDR_WIDTH'(lane_index);
    assign qspi_req_device = device;
    assign qspi_req_data = write_buffer[lane_index*`DATA_WIDTH +: `DATA_WIDTH];

    always @(posedge clk) begin
        if (!rst_n) begin
            state          <= IDLE;
            qspi_req_write <= 0;
            lane_index     <= 0;
            write_buffer   <= 0;
            read_data      <= 0;
            read_data_val  <= 0;
        end else begin
            read_data_val <= 0;
            case (state)
                IDLE: if (read_en || write_en) begin
                    qspi_req_write <= write_en;
                    write_buffer  <= write_data;
                    lane_index    <= 0;
                    state          <= SEND;
                end

                SEND: if (qspi_req_rdy) state <= WAIT;

                WAIT: if (qspi_read_data_val) begin
                    // QSPI's completion pulse covers READ and WRITE.
                    if (!qspi_req_write)
                        read_data[lane_index*`DATA_WIDTH +: `DATA_WIDTH] <= qspi_read_data;
                    if (lane_index == LANE_BITS'(`COMPUTE_WIDTH - 1)) begin
                        read_data_val <= !qspi_req_write;
                        state <= IDLE;
                    end else begin
                        lane_index <= lane_index + 1'b1;
                        state <= SEND;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule
