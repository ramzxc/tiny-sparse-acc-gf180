`include "../defs/defs.vh"
`include "../defs/inst_defs.vh"

module act (
    input clk,
    input rst_n,

    // Connect directly to VPU result, activation selection and valid.
    input [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] vpu_res_in,
    input [`EXE_ACT_MSB-`EXE_ACT_LSB:0] act_op_in,
    input vpu_res_in_val,

    // Held for mem_ctrl to read; overwritten by the next valid result.
    output reg [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] act_res_out,
    output reg act_res_out_val
);

    localparam W = `DATA_WIDTH;
    localparam F = `FIXED_FRAC_BITS;
    localparam signed [W:0] ONE = (W+1)'(1) << F;
    localparam signed [W:0] HALF = (W+1)'(1) << (F-1);
    wire signed [W-1:0] x = vpu_res_in;
    wire signed [W:0] extended_x = {x[W-1], x};
    // hard sigmoid: clamp(x/4 + 1/2, 0, 1), same nearest rounding as MUL.
    wire signed [W:0] sigmoid_value = ((extended_x + (W+1)'(2)) >>> 2) + HALF;
    reg [W-1:0] result;

    always_comb begin
        case (act_op_in)
            `ACT_RELU: result = x < 0 ? {W{1'b0}} : x;
            `ACT_SIGMOID: result = sigmoid_value < 0 ? {W{1'b0}} :
                sigmoid_value > ONE ? ONE[W-1:0] : sigmoid_value[W-1:0];
            `ACT_TANH: result = extended_x > ONE ? ONE[W-1:0] :
                extended_x < -ONE ? W'(-ONE) : x;
            `ACT_STEP: result = x > 0 ? ONE[W-1:0] : {W{1'b0}};
            default: result = x;
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            act_res_out <= 0;
            act_res_out_val <= 0;
        end else begin
            act_res_out_val <= vpu_res_in_val;
            if (vpu_res_in_val)
                act_res_out <= result;
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 1 || F < 1 || F > 6)
            $fatal(1, "Activation requires one fixed8 lane and FIXED_FRAC_BITS=1..6");
    end
`endif
endmodule
