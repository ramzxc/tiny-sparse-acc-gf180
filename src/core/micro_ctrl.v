`include "../defs/defs.vh"
`include "../defs/inst_defs.vh"
`include "../defs/mem_defs.vh"
`include "../defs/micro_defs.vh"

// One A[M,K] * B[K,N] job at a time; two output rows per tile.
// No instruction queue here: inst_out remains stable until inst_out_rdy.
module micro_ctrl (
    input clk,
    input rst_n,

    // High-level FIFO head: pop on inst_in_val && inst_in_rdy.
    input [`HOST_INST_WIDTH-1:0] inst_in,
    input inst_in_val,
    output inst_in_rdy,
    output reg done,
    output reg error,

    output reg [`INST_WIDTH-1:0] inst_out,
    output reg inst_out_val,
    input inst_out_rdy,

    // Observe mem_ctrl's scalar load into VPU, not the UART input.
    input input_is_zero,
    input input_data_val
);

    localparam [4:0]
        IDLE = 0, CLEAR = 1, CLEAR_SYNC = 2,
        SET_INPUT = 3, LOAD_INPUT = 4, INPUT_SYNC = 5, CHECK_INPUT = 6,
        SET_WEIGHT = 7, LOAD_WEIGHT = 8, WEIGHT_SYNC = 9,
        MAC = 10, MAC_SYNC = 11, NEXT_COLUMN = 12,
        APPLY_ACT = 13, ACT_SYNC = 14,
        SET_OUTPUT = 15, STORE = 16, STORE_SYNC = 17, NEXT_TILE = 18, VALIDATE = 19;

    reg [4:0] state;
    reg [`MICRO_DIM_WIDTH-1:0] rows, cols, column, vectors, vector_index, validate_left;
    reg [`MICRO_DIM_WIDTH:0] row, column_stride, input_stride;
    reg [`MEM_ADDR_WIDTH-1:0] input_base, input_addr, output_addr, weight_tile, weight_base;
    // Extra bit detects address overflow before issuing a weight access.
    reg [`MEM_ADDR_WIDTH:0] weight_addr;
    reg sparse_en;
    reg [2:0] act_op;
    reg elementwise;
    reg [1:0] vector_op;
    reg input_seen, input_zero;

    // All job fields come from one 64-bit FIFO word; bases are compile-time.
    wire req_elementwise = inst_in[`HOST_VECTOR_BIT];
    wire [1:0] req_vector_op = inst_in[`HOST_VEC_OP_MSB:`HOST_VEC_OP_LSB];
    wire [2:0] req_activation = req_elementwise ? inst_in[`HOST_VEC_ACT_MSB:`HOST_VEC_ACT_LSB]
        : {1'b0, inst_in[`HOST_ACT_MSB:`HOST_ACT_LSB]};
    wire [`MICRO_DIM_WIDTH-1:0] req_rows = inst_in[`HOST_M_MSB:`HOST_M_LSB];
    wire [`MICRO_DIM_WIDTH-1:0] req_cols = req_elementwise ? 8'd1 : inst_in[`HOST_K_MSB:`HOST_K_LSB];
    wire [`MICRO_DIM_WIDTH-1:0] req_vectors = req_elementwise ? 8'd1 : inst_in[`HOST_N_MSB:`HOST_N_LSB];
    wire [`MEM_ADDR_WIDTH:0] weight_start = {1'b0, (req_elementwise ? `HOST_VEC_A_BASE : `HOST_WEIGHT_BASE)} +
        (`MEM_ADDR_WIDTH+1)'(inst_in[`HOST_WEIGHT_MSB:`HOST_WEIGHT_LSB]);
    wire [`MEM_ADDR_WIDTH:0] input_start = {1'b0, `HOST_INPUT_BASE} +
        (`MEM_ADDR_WIDTH+1)'(inst_in[`HOST_INPUT_MSB:`HOST_INPUT_LSB]);
    wire [`MEM_ADDR_WIDTH:0] output_start = {1'b0, `HOST_OUTPUT_BASE} +
        (`MEM_ADDR_WIDTH+1)'(inst_in[`HOST_OUTPUT_MSB:`HOST_OUTPUT_LSB]);
    wire [`MEM_ADDR_WIDTH-1:0] req_weight_addr = weight_start[`MEM_ADDR_WIDTH-1:0];
    wire [`MEM_ADDR_WIDTH-1:0] req_input_addr = input_start[`MEM_ADDR_WIDTH-1:0];
    wire [`MEM_ADDR_WIDTH-1:0] req_output_addr = output_start[`MEM_ADDR_WIDTH-1:0];
    wire [`MICRO_DIM_WIDTH:0] padded_rows =
        {1'b0, req_rows} + {{`MICRO_DIM_WIDTH{1'b0}}, req_rows[0]};
    wire [`MICRO_DIM_WIDTH:0] padded_cols =
        {1'b0, req_cols} + {{`MICRO_DIM_WIDTH{1'b0}}, req_cols[0]};

    wire valid_vector_fields = !req_elementwise || (inst_in[61:60] == 0 && inst_in[46:36] == 0 && req_activation <= `ACT_STEP);
    wire valid_request = valid_vector_fields && req_rows != 0 && req_cols != 0 && req_vectors != 0 &&
        !weight_start[`MEM_ADDR_WIDTH] && !input_start[`MEM_ADDR_WIDTH] && !output_start[`MEM_ADDR_WIDTH] &&
        !req_weight_addr[0] && !req_input_addr[0] && !req_output_addr[0] &&
        ((req_weight_addr & `SRAM_REGION_MASK) == (req_elementwise ? `UNIFIED_BASE_ADDR : `WEIGHT_BASE_ADDR)) &&
        ((req_input_addr & `SRAM_REGION_MASK) == `UNIFIED_BASE_ADDR) &&
        ((req_output_addr & `SRAM_REGION_MASK) == `UNIFIED_BASE_ADDR);

    // Validate B/C extents by repeated addition, avoiding hardware multipliers.
    // No memory access is emitted until all N columns pass range/overlap checks.
    reg [`MEM_ADDR_WIDTH:0] input_end, output_end;
    wire [`MEM_ADDR_WIDTH:0] next_input_end = input_end + (`MEM_ADDR_WIDTH+1)'(input_stride);
    wire [`MEM_ADDR_WIDTH:0] next_output_end = output_end + (`MEM_ADDR_WIDTH+1)'(column_stride);
    wire [`MEM_ADDR_WIDTH:0] vector_a_end = {1'b0, weight_base} + (`MEM_ADDR_WIDTH+1)'(column_stride);
    wire valid_vector_a = !elementwise || vector_op == `VEC_PASS ||
        (vector_a_end <= 26'h2000000 &&
         ((vector_a_end <= {1'b0, output_addr}) || (next_output_end <= {1'b0, weight_base})));
    wire valid_extents = valid_vector_a && next_input_end <= 26'h2000000 && next_output_end <= 26'h2000000 &&
        ((next_input_end <= {1'b0, output_addr}) || (next_output_end <= {1'b0, input_base}));

    wire valid_weight_addr = !weight_addr[`MEM_ADDR_WIDTH] &&
        ((weight_addr[`MEM_ADDR_WIDTH-1:0] & `SRAM_REGION_MASK) == (elementwise ? `UNIFIED_BASE_ADDR : `WEIGHT_BASE_ADDR));
    wire accepted = inst_out_val && inst_out_rdy;
    assign inst_in_rdy = rst_n && state == IDLE;

    always @(*) begin
        inst_out = {`INST_NOP, 25'b0};
        inst_out_val = rst_n;
        case (state)
            CLEAR:       inst_out = {`ACC_CLEAR, 25'b0};
            CLEAR_SYNC:  inst_out = {`EXE_SYNC, 25'b0};
            SET_INPUT:   inst_out = {`SET_SRC, input_addr[`MEM_ADDR_WIDTH-1:1], 1'b0};
            LOAD_INPUT:  inst_out = {`SRAM_TO_VPU, 23'b0, input_addr[0], !elementwise};
            INPUT_SYNC:  inst_out = {`MEM_SYNC, 25'b0};
            SET_WEIGHT: begin
                inst_out = {`SET_SRC, weight_addr[`MEM_ADDR_WIDTH-1:0]};
                inst_out_val = rst_n && valid_weight_addr;
            end
            LOAD_WEIGHT: inst_out = {`SRAM_TO_VPU, 22'b0, elementwise, 2'b0};
            WEIGHT_SYNC: inst_out = {`MEM_SYNC, 25'b0};
            MAC: begin
                if (elementwise && vector_op == `VEC_PASS)
                    inst_out = {`VECTOR_PASS, 25'b0};
                else
                    inst_out = {`EXECUTE, 18'b0,
                        (elementwise && sparse_en && vector_op == `VEC_MUL),
                        `ACT_NONE, !elementwise,
                        (elementwise ? ((vector_op == `VEC_SUB) ? `EXE_OP_RSUB : vector_op) : `EXE_OP_MUL)};
            end
            MAC_SYNC:    inst_out = {`EXE_SYNC, 25'b0};
            APPLY_ACT:   inst_out = {`ACTIVATE, 19'b0, act_op, 3'b0};
            ACT_SYNC:    inst_out = {`EXE_SYNC, 25'b0};
            SET_OUTPUT:  inst_out = {`SET_DST, output_addr};
            STORE:       inst_out = {`ACT_TO_SRAM, 25'b0};
            STORE_SYNC:  inst_out = {`MEM_SYNC, 25'b0};
            default:     inst_out_val = 0;
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= IDLE;
            rows <= 0; cols <= 0; column <= 0;
            vectors <= 0; vector_index <= 0; validate_left <= 0;
            input_stride <= 0; input_end <= 0; output_end <= 0; weight_base <= 0;
            row <= 0; column_stride <= 0;
            input_base <= 0; input_addr <= 0; output_addr <= 0;
            weight_tile <= 0; weight_addr <= 0;
            sparse_en <= 0; act_op <= 0;
            elementwise <= 0; vector_op <= 0;
            input_seen <= 0; input_zero <= 0;
            done <= 0; error <= 0;
        end else begin
            done <= 0;

            if (state == INPUT_SYNC && input_data_val) begin
                input_seen <= 1;
                // FP8 +0 and -0 are both absent sparse terms.
                input_zero <= input_is_zero;
            end

            case (state)
                IDLE: if (inst_in_val) begin
                    error <= !valid_request;
                    if (!valid_request) begin
                        done <= 1;
                    end else begin
                        rows <= req_rows; cols <= req_cols; vectors <= req_vectors;
                        column <= 0; row <= 0; vector_index <= 0;
                        column_stride <= padded_rows;
                        input_stride <= req_elementwise ? padded_rows : padded_cols;
                        input_base <= req_input_addr;
                        input_addr <= req_input_addr;
                        output_addr <= req_output_addr;
                        weight_base <= req_weight_addr;
                        weight_tile <= req_weight_addr;
                        weight_addr <= weight_start;
                        sparse_en <= inst_in[`HOST_SPARSE_BIT];
                        act_op <= req_activation;
                        elementwise <= req_elementwise;
                        vector_op <= req_vector_op;
                        input_seen <= 0;
                        input_end <= input_start;
                        output_end <= output_start;
                        validate_left <= req_vectors;
                        state <= VALIDATE;
                    end
                end
                VALIDATE: begin
                    input_end <= next_input_end;
                    output_end <= next_output_end;
                    validate_left <= validate_left - 1'b1;
                    if (validate_left == 1) begin
                        if (valid_extents) begin
                            state <= CLEAR;
                        end else begin
                            error <= 1; done <= 1; state <= IDLE;
                        end
                    end
                end
                CLEAR: if (accepted) state <= CLEAR_SYNC;
                CLEAR_SYNC: if (accepted) state <= SET_INPUT;
                SET_INPUT: if (accepted) state <= LOAD_INPUT;
                LOAD_INPUT: if (accepted) begin
                    input_seen <= 0;
                    state <= INPUT_SYNC;
                end
                INPUT_SYNC: if (accepted) state <= CHECK_INPUT;
                CHECK_INPUT: if (input_seen) begin
                    if (elementwise && vector_op == `VEC_PASS)
                        state <= MAC;
                    else if (sparse_en && input_zero && (!elementwise || vector_op == `VEC_MUL))
                        state <= elementwise ? APPLY_ACT : NEXT_COLUMN;
                    else
                        state <= SET_WEIGHT;
                end
                SET_WEIGHT: begin
                    if (!valid_weight_addr) begin
                        // Earlier output tiles may already have been stored.
                        error <= 1; done <= 1; state <= IDLE;
                    end else if (accepted) state <= LOAD_WEIGHT;
                end
                LOAD_WEIGHT: if (accepted) state <= WEIGHT_SYNC;
                WEIGHT_SYNC: if (accepted) state <= MAC;
                MAC: if (accepted) begin
                    if (elementwise || column == cols - 1'b1) begin
                        // The final MAC must finish before final activation.
                        state <= MAC_SYNC;
                    end else begin
                        // VPU captured both operands on this edge. Start loading
                        // the next input while its result passes through ACT.
                        // A later MAC still waits for decoder's exe_rdy.
                        column <= column + 1'b1;
                        input_addr <= input_addr + 1'b1;
                        weight_addr <= weight_addr + (`MEM_ADDR_WIDTH+1)'(column_stride);
                        state <= SET_INPUT;
                    end
                end
                MAC_SYNC: if (accepted) state <= NEXT_COLUMN;
                NEXT_COLUMN: begin
                    if (elementwise || column == cols - 1'b1) begin
                        state <= APPLY_ACT;
                    end else begin
                        column <= column + 1'b1;
                        input_addr <= input_addr + 1'b1;
                        weight_addr <= weight_addr + (`MEM_ADDR_WIDTH+1)'(column_stride);
                        state <= SET_INPUT;
                    end
                end
                APPLY_ACT: if (accepted) state <= ACT_SYNC;
                ACT_SYNC: if (accepted) state <= SET_OUTPUT;
                SET_OUTPUT: if (accepted) state <= STORE;
                STORE: if (accepted) state <= STORE_SYNC;
                STORE_SYNC: if (accepted) state <= NEXT_TILE;
                NEXT_TILE: begin
                    if (row + 9'd2 >= {1'b0, rows}) begin
                        if (vector_index == vectors - 1'b1) begin
                            done <= 1;
                            state <= IDLE;
                        end else begin
                            // Next B column: reuse A and restart output-row tiling.
                            vector_index <= vector_index + 1'b1;
                            row <= 0; column <= 0;
                            input_base <= input_base + `MEM_ADDR_WIDTH'(input_stride);
                            input_addr <= input_base + `MEM_ADDR_WIDTH'(input_stride);
                            output_addr <= output_addr + 2;
                            weight_tile <= weight_base;
                            weight_addr <= {1'b0, weight_base};
                            state <= CLEAR;
                        end
                    end else begin
                        row <= row + 2;
                        column <= 0;
                        input_addr <= elementwise ? input_addr + 2 : input_base;
                        output_addr <= output_addr + 2;
                        weight_tile <= weight_tile + 2;
                        weight_addr <= {1'b0, weight_tile} + 2;
                        state <= CLEAR;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 2 || `MICRO_DIM_WIDTH != 8)
            $fatal(1, "Matrix engine currently uses two FP8 lanes and 8-bit dimensions");
    end
`endif
endmodule
