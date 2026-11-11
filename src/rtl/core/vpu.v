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

    localparam W = `DATA_WIDTH;
    localparam F = `FIXED_FRAC_BITS;
    localparam signed [2*W:0] MAX_VALUE = (1 << (W-1)) - 1;
    localparam signed [2*W:0] MIN_VALUE = -(1 << (W-1));

    wire signed [W-1:0] x = inputs;
    wire signed [W-1:0] w = weights;
    wire signed [W-1:0] sum = vpu_res_out;

    // Keep the full product until rescaling; no additional storage bits.
    // Nearest rounding, exact half-way cases toward +infinity.
    wire signed [2*W-1:0] product = x * w;
    wire signed [2*W:0] rounded_product =
        {product[2*W-1], product} + ( (2*W+1)'(1) << (F-1) );
    wire signed [2*W:0] scaled_product = rounded_product >>> F;

    // A single adder serves ADD/SUB/RSUB and MUL accumulation.
    wire signed [W-1:0] first_operand = reverse_sub ? w : x;
    wire signed [W-1:0] second_operand = reverse_sub ? x : w;
    wire signed [2*W:0] add_a = multiply ? scaled_product :
        {{(W+1){first_operand[W-1]}}, first_operand};
    wire signed [2*W:0] add_b = multiply
        ? (accumulate ? {{(W+1){sum[W-1]}}, sum} : {(2*W+1){1'b0}})
        : {{(W+1){second_operand[W-1]}}, second_operand};
    wire do_subtract = !multiply && subtract;
    wire signed [2*W:0] arithmetic_result =
        add_a + (add_b ^ {(2*W+1){do_subtract}}) + {{(2*W){1'b0}}, do_subtract};
    wire [W-1:0] saturated_result = arithmetic_result > MAX_VALUE ? MAX_VALUE[W-1:0] :
        arithmetic_result < MIN_VALUE ? MIN_VALUE[W-1:0] : arithmetic_result[W-1:0];
    // Fixed point has only one zero encoding: 0x80 is the most negative value.
    wire [W-1:0] mac_result = sparse && multiply && x == 0
        ? (accumulate ? sum : {W{1'b0}}) : saturated_result;

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
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 1 || F < 1 || F > 6)
            $fatal(1, "Fixed MAC requires one 8-bit lane and FIXED_FRAC_BITS=1..6");
    end
`endif

endmodule
