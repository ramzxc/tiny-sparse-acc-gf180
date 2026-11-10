`include "../defs/defs.vh"
`include "../defs/inst_defs.vh"
`include "../defs/mem_defs.vh"

module mem_ctrl (
    input clk,
    input rst_n,

    input [`MEM_INST_WIDTH-1:0] mem_inst_in,
    input mem_inst_in_val,
    output mem_rdy,

    // mem_itf: one 16-bit transfer, or one source-to-destination copy.
    input mem_itf_rdy,
    output reg read_en,
    output reg write_en,
    output reg copy_en,
    output reg [`MEM_ADDR_WIDTH-1:0] src_addr,
    output reg [`MEM_ADDR_WIDTH-1:0] dst_addr,
    output [`DATA_WIDTH*2-1:0] write_data,
    input [`DATA_WIDTH*2-1:0] read_data,
    input read_data_val,

    // Registered in VPU on the edge where the corresponding valid is HIGH.
    output [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] weight_data,
    output weight_data_val,
    output [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] input_data,
    output input_data_val,

    // Read activation's held result. No result buffer inside mem_ctrl.
    input [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] act_res_in
);

    localparam [1:0] IDLE = 0, SEND = 1, WAIT = 2;
    reg [1:0] state;
    reg [2:0] command;
    reg scalar_load;
    reg high_byte;
    reg force_weight;

    wire [2:0] incoming_command = mem_inst_in[`MEM_INST_OP_MSB:`MEM_INST_OP_LSB];
    wire [`MEM_ADDR_WIDTH-1:0] address = mem_inst_in[`MEM_ADDR_WIDTH-1:0];
    wire load_vpu = rst_n && (state == WAIT) &&
        (command == `MEM_CMD_SRAM_TO_VPU) && read_data_val;

    // HIGH only after the complete operation, including VPU operand capture.
    assign mem_rdy = (state == IDLE);
    assign write_data = act_res_in;
    assign weight_data = read_data;
    wire [`DATA_WIDTH-1:0] scalar_data = high_byte
        ? read_data[`DATA_WIDTH +: `DATA_WIDTH] : read_data[0 +: `DATA_WIDTH];
    assign input_data = scalar_load ? {`COMPUTE_WIDTH{scalar_data}} : read_data;
    assign weight_data_val = load_vpu &&
        (force_weight || ((src_addr & `SRAM_REGION_MASK) == `WEIGHT_BASE_ADDR));
    assign input_data_val = load_vpu && !force_weight &&
        ((src_addr & `SRAM_REGION_MASK) == `UNIFIED_BASE_ADDR);

    always @(*) begin
        read_en = 0;
        write_en = 0;
        copy_en = 0;

        if (rst_n && state == SEND) begin
            case (command)
                `MEM_CMD_FLASH_TO_SRAM,
                `MEM_CMD_SRAM_TO_FLASH: copy_en = 1;
                `MEM_CMD_SRAM_TO_VPU: read_en = 1;
                `MEM_CMD_ACT_TO_SRAM: write_en = 1;
                default: begin end
            endcase
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            command <= 0;
            scalar_load <= 0;
            high_byte <= 0;
            force_weight <= 0;
            src_addr <= 0;
            dst_addr <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (mem_inst_in_val) begin
                        case (incoming_command)
                            `MEM_CMD_SET_SRC: src_addr <= address;
                            `MEM_CMD_SET_DST: dst_addr <= address;
                            `MEM_CMD_FLASH_TO_SRAM, `MEM_CMD_SRAM_TO_FLASH,
                            `MEM_CMD_SRAM_TO_VPU, `MEM_CMD_ACT_TO_SRAM: begin
                                command <= incoming_command;
                                scalar_load <= mem_inst_in[`MEM_SCALAR_BIT];
                                high_byte <= mem_inst_in[`MEM_HIGH_BYTE_BIT];
                                force_weight <= mem_inst_in[`MEM_FORCE_WEIGHT_BIT];
                                state <= SEND;
                            end
                            default: begin end
                        endcase
                    end
                end

                SEND: begin
                    // mem_itf captures addresses and write_data on this edge.
                    // Software must keep ACT result stable until accepted.
                    if (mem_itf_rdy)
                        state <= WAIT;
                end

                WAIT: begin
                    if (command == `MEM_CMD_SRAM_TO_VPU) begin
                        // This edge also loads the selected VPU operand register.
                        if (read_data_val)
                            state <= IDLE;
                    end else if (mem_itf_rdy) begin
                        state <= IDLE;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 2)
            $fatal(1, "mem_ctrl currently transfers two FP8 lanes per instruction");
    end
`endif

endmodule
