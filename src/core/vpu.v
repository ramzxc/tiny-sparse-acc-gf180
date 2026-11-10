`include "../defs/defs.vh"
`include "../defs/inst_defs.vh"

module vpu (
    input clk,
    input rst_n,

    // Decoder -> VPU: arithmetic, accumulation and activation selection.
    input [`EXE_INST_WIDTH-1:0] exe_inst_in,
    input exe_inst_in_val,

    // mem_ctrl -> operand registers. Each valid independently updates one bank.
    input [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] weight_data,
    input weight_data_val,
    input [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] input_data,
    input input_data_val,

    // VPU -> activation: one DATA_WIDTH-bit value per compute lane.
    // act_op_out must accompany the corresponding result, not the next command.
    output reg [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] vpu_res_out,
    output reg [`EXE_ACT_MSB-`EXE_ACT_LSB:0] act_op_out,
    output reg vpu_res_out_val
);

    `include "../defs/fp8_math.vh"

    reg [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] weights;
    reg [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] inputs;

    // The first edge computes lane 0; the next edge computes lane 1.
    // Keep only lane 1's operands so memory can already load the next pair.
    reg second_lane;
    reg [`DATA_WIDTH-1:0] saved_input, saved_weight;
    reg [3:0] saved_control; // sparse, accumulate, operation

    wire [`EXE_MODE_MSB-`EXE_MODE_LSB:0] mode =
        exe_inst_in[`EXE_MODE_MSB:`EXE_MODE_LSB];
    wire [1:0] operation = second_lane ? saved_control[1:0] :
        exe_inst_in[`EXE_OP_MSB:`EXE_OP_LSB];
    wire accumulate = second_lane ? saved_control[2] : exe_inst_in[`EXE_ACC_BIT];
    wire sparse = second_lane ? saved_control[3] : exe_inst_in[`EXE_SPARSE_BIT];
    wire multiply = operation == `EXE_OP_MUL;
    wire reverse_sub = operation == `EXE_OP_RSUB;
    wire subtract = operation == `EXE_OP_SUB || reverse_sub;

    wire [`DATA_WIDTH-1:0] x = second_lane ? saved_input : inputs[0 +: `DATA_WIDTH];
    wire [`DATA_WIDTH-1:0] w = second_lane ? saved_weight : weights[0 +: `DATA_WIDTH];
    wire [`DATA_WIDTH-1:0] sum = second_lane ?
        vpu_res_out[`DATA_WIDTH +: `DATA_WIDTH] : vpu_res_out[0 +: `DATA_WIDTH];

    // One multiplier and one adder shared by both lanes and all operations.
    wire [`DATA_WIDTH-1:0] product = fp8_mul(x, w);
    wire [`DATA_WIDTH-1:0] add_a = multiply ? product : (reverse_sub ? w : x);
    wire [`DATA_WIDTH-1:0] operand_b = reverse_sub ? x : w;
    wire [`DATA_WIDTH-1:0] add_b = multiply ? sum :
        {operand_b[`DATA_WIDTH-1] ^ subtract, operand_b[`DATA_WIDTH-2:0]};
    wire [`DATA_WIDTH-1:0] added = fp8_add(add_a, add_b);
    wire [`DATA_WIDTH-1:0] arithmetic_result =
        multiply && !accumulate ? product : added;
    // Suppress zero B even for NaN weights; preserve the old sum when skipping.
    wire [`DATA_WIDTH-1:0] mac_result = sparse && multiply && x[`DATA_WIDTH-2:0] == 0
        ? (accumulate ? sum : FP8_ZERO) : arithmetic_result;

    always @(posedge clk) begin
        if (!rst_n) begin
            second_lane <= 0;
            saved_input <= 0;
            saved_weight <= 0;
            saved_control <= 0;
            weights <= 0;
            inputs <= 0;
            vpu_res_out <= 0;
            act_op_out <= 0;
            vpu_res_out_val <= 0;
        end else begin
            if (weight_data_val)
                weights <= weight_data;
            if (input_data_val)
                inputs <= input_data;

            vpu_res_out_val <= 0;

            // Simultaneous operand updates take effect on the next Execute.
            if (second_lane) begin
                vpu_res_out[`DATA_WIDTH +: `DATA_WIDTH] <= mac_result;
                vpu_res_out_val <= 1;
                second_lane <= 0;
            end else if (exe_inst_in_val && mode == `EXE_MODE_CLEAR) begin
                vpu_res_out <= 0;
                act_op_out <= `ACT_NONE;
                vpu_res_out_val <= 1;
            end else if (exe_inst_in_val && mode == `EXE_MODE_ACTIVATE) begin
                // Re-emit the held sum without modifying it.
                act_op_out <= exe_inst_in[`EXE_ACT_MSB:`EXE_ACT_LSB];
                vpu_res_out_val <= 1;
            end else if (exe_inst_in_val && mode == `EXE_MODE_INPUT) begin
                vpu_res_out <= inputs;
                act_op_out <= exe_inst_in[`EXE_ACT_MSB:`EXE_ACT_LSB];
                vpu_res_out_val <= 1;
            end else if (exe_inst_in_val && mode == `EXE_MODE_COMPUTE) begin
                vpu_res_out[0 +: `DATA_WIDTH] <= mac_result;
                saved_input <= inputs[`DATA_WIDTH +: `DATA_WIDTH];
                saved_weight <= weights[`DATA_WIDTH +: `DATA_WIDTH];
                saved_control <= {exe_inst_in[`EXE_SPARSE_BIT],
                    exe_inst_in[`EXE_ACC_BIT], exe_inst_in[`EXE_OP_MSB:`EXE_OP_LSB]};
                act_op_out <= exe_inst_in[`EXE_ACT_MSB:`EXE_ACT_LSB];
                second_lane <= 1;
                // Valid stays LOW until both lanes have been updated.
            end
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 2)
            $fatal(1, "Serial MAC requires DATA_WIDTH=8 and COMPUTE_WIDTH=2");
    end
`endif

endmodule
