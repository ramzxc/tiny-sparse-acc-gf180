`include "../defs/defs.vh"
`include "../defs/inst_defs.vh"
`include "../defs/mem_defs.vh"

module mem_ctrl (
    input clk,
    input rst_n,

    input [`MEM_INST_WIDTH-1:0] mem_inst_in,
    input mem_inst_in_val,
    output mem_rdy,

    // mem_itf: one 8-bit transfer, or one source-to-destination copy.
    input mem_itf_rdy,
    output reg read_en,
    output reg write_en,
    output reg copy_en,
    output reg [`MEM_ADDR_WIDTH-1:0] src_addr,
    output reg [`MEM_ADDR_WIDTH-1:0] dst_addr,
    output [`DATA_WIDTH-1:0] write_data,
    input [`DATA_WIDTH-1:0] read_data,
    input read_data_val,

    // Registered in VPU on the edge where the corresponding valid is HIGH.
    output [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] weight_data,
    output weight_data_val,
    output [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] input_data,
    output input_data_val,

    // Read activation's held result. No result buffer inside mem_ctrl.
    input [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] act_res_in
);

    // Each state directly identifies the request or completion condition.
    localparam [2:0] IDLE = 0, SEND_READ = 1, SEND_WRITE = 2,
        SEND_COPY = 3, WAIT_READ = 4, WAIT_OTHER = 5;
    reg [2:0] state;
    reg force_weight;

    wire [2:0] incoming_command = mem_inst_in[`MEM_INST_OP_MSB:`MEM_INST_OP_LSB];
    wire accept = state == IDLE && mem_inst_in_val;
    wire address_write = accept && incoming_command[2];
    wire transfer = accept && !incoming_command[2];
    // Shared reset data for both address banks, with independent half enables.
    wire [12:0] address_value = mem_inst_in[12:0] & {13{rst_n}};
    wire load_vpu = rst_n && state == WAIT_READ && read_data_val;

    // SRC/DST are retained throughout SEND/WAIT: mem_itf uses them directly.
    // HIGH only after the complete operation, including VPU operand capture.
    assign mem_rdy = (state == IDLE);
    assign write_data = act_res_in;
    assign weight_data = read_data;
    assign input_data = read_data;
    assign weight_data_val = load_vpu &&
        (force_weight || ((src_addr & `SRAM_REGION_MASK) == `WEIGHT_BASE_ADDR));
    assign input_data_val = load_vpu && !force_weight &&
        ((src_addr & `SRAM_REGION_MASK) == `UNIFIED_BASE_ADDR);

    always @(*) begin
        read_en = rst_n && state == SEND_READ;
        write_en = rst_n && state == SEND_WRITE;
        copy_en = rst_n && state == SEND_COPY;
    end

    always @(posedge clk) begin
        if (!rst_n || (address_write && !incoming_command[0] && !incoming_command[1]))
            src_addr[12:0] <= address_value;
        if (!rst_n || (address_write && !incoming_command[0] && incoming_command[1]))
            src_addr[24:13] <= address_value[11:0];
        if (!rst_n || (address_write && incoming_command[0] && !incoming_command[1]))
            dst_addr[12:0] <= address_value;
        if (!rst_n || (address_write && incoming_command[0] && incoming_command[1]))
            dst_addr[24:13] <= address_value[11:0];

        if (!rst_n) begin
            state <= IDLE;
            force_weight <= 0;
        end else begin
            if (transfer) begin
                force_weight <= mem_inst_in[`MEM_FORCE_WEIGHT_BIT];
            end

            case (state)
                IDLE: if (transfer) begin
                    case (incoming_command)
                        `MEM_CMD_SRAM_TO_VPU: state <= SEND_READ;
                        `MEM_CMD_ACT_TO_SRAM: state <= SEND_WRITE;
                        default: state <= SEND_COPY;
                    endcase
                end
                SEND_READ: if (mem_itf_rdy) state <= WAIT_READ;
                SEND_WRITE, SEND_COPY: if (mem_itf_rdy) state <= WAIT_OTHER;
                WAIT_READ: if (read_data_val) state <= IDLE;
                WAIT_OTHER: if (mem_itf_rdy) state <= IDLE;
                default: state <= IDLE;
            endcase
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 1)
            $fatal(1, "mem_ctrl transfers one data byte per instruction");
    end
`endif

endmodule
