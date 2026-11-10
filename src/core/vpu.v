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

    wire [`EXE_OP_MSB-`EXE_OP_LSB:0] operation = exe_inst_in[`EXE_OP_MSB:`EXE_OP_LSB];
    wire [`EXE_MODE_MSB-`EXE_MODE_LSB:0] mode =
        exe_inst_in[`EXE_MODE_MSB:`EXE_MODE_LSB];
    wire accumulate = exe_inst_in[`EXE_ACC_BIT];
    wire sparse_mul = exe_inst_in[`EXE_SPARSE_BIT] && operation == `EXE_OP_MUL;

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
                // Store the result directly; the RHS uses the previous sum.
                for (integer lane = 0; lane < `COMPUTE_WIDTH; lane = lane + 1) begin
                    if (sparse_mul && inputs[lane*`DATA_WIDTH +: 7] == 0) begin
                        // Sparse B zero suppresses even a NaN weight in this lane.
                        if (!accumulate)
                            vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <= FP8_ZERO;
                    end else case (operation)
                        `EXE_OP_ADD:
                            vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <= accumulate
                                ? fp8_add(fp8_add(
                                    inputs[lane*`DATA_WIDTH +: `DATA_WIDTH],
                                    weights[lane*`DATA_WIDTH +: `DATA_WIDTH]),
                                    vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH])
                                : fp8_add(
                                    inputs[lane*`DATA_WIDTH +: `DATA_WIDTH],
                                    weights[lane*`DATA_WIDTH +: `DATA_WIDTH]);

                        `EXE_OP_SUB:
                            vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <= accumulate
                                ? fp8_add(fp8_add(
                                    inputs[lane*`DATA_WIDTH +: `DATA_WIDTH],
                                    weights[lane*`DATA_WIDTH +: `DATA_WIDTH] ^ 8'h80),
                                    vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH])
                                : fp8_add(
                                    inputs[lane*`DATA_WIDTH +: `DATA_WIDTH],
                                    weights[lane*`DATA_WIDTH +: `DATA_WIDTH] ^ 8'h80);

                        `EXE_OP_MUL:
                            vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <= accumulate
                                ? fp8_add(fp8_mul(
                                    inputs[lane*`DATA_WIDTH +: `DATA_WIDTH],
                                    weights[lane*`DATA_WIDTH +: `DATA_WIDTH]),
                                    vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH])
                                : fp8_mul(
                                    inputs[lane*`DATA_WIDTH +: `DATA_WIDTH],
                                    weights[lane*`DATA_WIDTH +: `DATA_WIDTH]);

                        `EXE_OP_RSUB:
                            vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <= accumulate
                                ? fp8_add(fp8_add(
                                    weights[lane*`DATA_WIDTH +: `DATA_WIDTH],
                                    inputs[lane*`DATA_WIDTH +: `DATA_WIDTH] ^ 8'h80),
                                    vpu_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH])
                                : fp8_add(
                                    weights[lane*`DATA_WIDTH +: `DATA_WIDTH],
                                    inputs[lane*`DATA_WIDTH +: `DATA_WIDTH] ^ 8'h80);

                        default: begin end
                    endcase
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
