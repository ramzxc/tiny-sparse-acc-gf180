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

    wire [1:0] operation = exe_inst_in[`EXE_OP_MSB:`EXE_OP_LSB];
    wire [1:0] mode = exe_inst_in[`EXE_MODE_MSB:`EXE_MODE_LSB];
    wire accumulate = exe_inst_in[`EXE_ACC_BIT];
    wire sparse_mul = exe_inst_in[`EXE_SPARSE_BIT] && operation == `EXE_OP_MUL;
    wire [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] mac_result;

    // Two combinational MAC lanes: one multiplier and one shared adder per lane.
    // ADD/SUB select operands at the adder input; only MUL can accumulate.
    for (genvar lane = 0; lane < `COMPUTE_WIDTH; lane = lane + 1) begin : mac
        wire [`DATA_WIDTH-1:0] x = inputs[lane*`DATA_WIDTH +: `DATA_WIDTH];
        wire [`DATA_WIDTH-1:0] w = weights[lane*`DATA_WIDTH +: `DATA_WIDTH];
        wire [`DATA_WIDTH-1:0] sum = vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH];
        wire multiply = operation == `EXE_OP_MUL;
        wire reverse_sub = operation == `EXE_OP_RSUB;
        wire subtract = operation == `EXE_OP_SUB || reverse_sub;
        wire [`DATA_WIDTH-1:0] product = fp8_mul(x, w);
        wire [`DATA_WIDTH-1:0] add_a = multiply ? product : (reverse_sub ? w : x);
        wire [`DATA_WIDTH-1:0] operand_b = reverse_sub ? x : w;
        wire [`DATA_WIDTH-1:0] add_b = multiply ? sum :
            {operand_b[`DATA_WIDTH-1] ^ subtract, operand_b[`DATA_WIDTH-2:0]};
        wire [`DATA_WIDTH-1:0] added = fp8_add(add_a, add_b);
        // Bypass addition for plain MUL to preserve signed zero.
        assign mac_result[lane*`DATA_WIDTH +: `DATA_WIDTH] =
            multiply && !accumulate ? product : added;
    end

    always @(posedge clk) begin
        if (!rst_n) begin
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
            if (exe_inst_in_val && mode == `EXE_MODE_CLEAR) begin
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
                for (integer lane = 0; lane < `COMPUTE_WIDTH; lane = lane + 1) begin
                    if (sparse_mul && inputs[lane*`DATA_WIDTH +: 7] == 0) begin
                        if (!accumulate)
                            vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <= FP8_ZERO;
                    end else begin
                        vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <=
                            mac_result[lane*`DATA_WIDTH +: `DATA_WIDTH];
                    end
                end
                act_op_out <= exe_inst_in[`EXE_ACT_MSB:`EXE_ACT_LSB];
                vpu_res_out_val <= 1;
            end
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8)
            $fatal(1, "FP8 VPU requires DATA_WIDTH=8");
    end
`endif

endmodule
