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

    `include "../defs/fp8_math.vh"
    wire [7:0] x = vpu_res_in;
    wire nan = fp8_is_nan(x[6:0]);
    // Keep the existing hard activations: clamp(x/4+0.5,0,1), clamp(x,-1,1).
    wire signed [6:0] quarter_scale = x[6:3] == 0 ? -7'sd11 :
        $signed({3'b0,x[6:3]}) - 7'sd12;
    wire [7:0] quarter = fp8_pack8(x[7], {4'b0,(x[6:3]!=0),x[2:0]}, quarter_scale);
    wire [7:0] sigmoid = fp8_add(quarter, 8'h30);
    reg [7:0] result;
    always_comb begin
        case (act_op_in)
            `ACT_RELU: result = x[7] ? 8'h00 : x;
            `ACT_SIGMOID: result = sigmoid[7] ? 8'h00 :
                sigmoid[6:0] > 7'h38 ? 8'h38 : sigmoid;
            `ACT_TANH: result = x[6:0] > 7'h38 ? {x[7],7'h38} : x;
            `ACT_STEP: result = !x[7] && x[6:0]!=0 ? 8'h38 : 8'h00;
            default: result = x;
        endcase
        if (nan) result = FP8_QNAN;
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
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 1)
            $fatal(1, "Activation requires one FP8 lane");
    end
`endif
endmodule
