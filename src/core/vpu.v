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

    wire [`EXE_MODE_MSB-`EXE_MODE_LSB:0] mode =
        exe_inst_in[`EXE_MODE_MSB:`EXE_MODE_LSB];
    wire [1:0] operation = exe_inst_in[`EXE_OP_MSB:`EXE_OP_LSB];
    wire accumulate = exe_inst_in[`EXE_ACC_BIT];
    wire sparse = exe_inst_in[`EXE_SPARSE_BIT];
    wire multiply = operation == `EXE_OP_MUL;
    wire reverse_sub = operation == `EXE_OP_RSUB;
    wire subtract = operation == `EXE_OP_SUB || reverse_sub;

    wire [`DATA_WIDTH-1:0] x = inputs;
    wire [`DATA_WIDTH-1:0] w = weights;
    wire [`DATA_WIDTH-1:0] sum = vpu_res_out;

    // One multiplier and one adder shared by all operations.
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

    // One lane completes on the accepting clock edge. Simultaneous operand
    // updates apply to the next Execute, as with the original two-lane VPU.
    always @(posedge clk) begin
        if (!rst_n) begin
            weights <= 0;
            inputs <= 0;
            vpu_res_out <= 0;
            act_op_out <= 0;
            vpu_res_out_val <= 0;
        end else begin
            if (weight_data_val) weights <= weight_data;
            if (input_data_val) inputs <= input_data;
            vpu_res_out_val <= exe_inst_in_val;

            if (exe_inst_in_val) begin
                act_op_out <= mode == `EXE_MODE_CLEAR ? `ACT_NONE :
                    exe_inst_in[`EXE_ACT_MSB:`EXE_ACT_LSB];
                case (mode)
                    `EXE_MODE_CLEAR: vpu_res_out <= 0;
                    `EXE_MODE_INPUT: vpu_res_out <= inputs;
                    `EXE_MODE_COMPUTE: vpu_res_out <= mac_result;
                    default: begin end // ACTIVATE re-emits the held accumulator.
                endcase
            end
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 1)
            $fatal(1, "Single-lane MAC requires DATA_WIDTH=8 and COMPUTE_WIDTH=1");
    end
`endif

endmodule
