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

    // Same hard-sigmoid approximation as the original tpu_pkg:
    // clamp(x / 4 + 0.5, 0, 1), with FP8 rounding at each operation.
    function automatic fp8_type fp8_sigmoid(input fp8_type x);
        logic [3:0] mantissa;
        logic signed [6:0] scale;
        begin
            if (fp8_is_nan(x[6:0])) return FP8_QNAN;
            if (x[6:0] >= 7'h40) return x[7] ? 8'h00 : 8'h38;

            mantissa = {(x[6:3] != 0), x[2:0]};
            scale = (x[6:3] == 0) ? -7'sd11
                : $signed({3'b0, x[6:3]}) - 7'sd12;
            return fp8_add(fp8_pack8(x[7], {4'b0, mantissa}, scale), 8'h30);
        end
    endfunction

    // Same hard-tanh approximation as the original tpu_pkg: clamp(x, -1, 1).
    function automatic fp8_type fp8_tanh(input fp8_type x);
        begin
            if (fp8_is_nan(x[6:0])) return FP8_QNAN;
            if (x[6:0] >= 7'h38) return x[7] ? 8'hb8 : 8'h38;
            return x;
        end
    endfunction

    always @(posedge clk) begin
        if (!rst_n) begin
            act_res_out <= 0;
            act_res_out_val <= 0;
        end else begin
            // Completion pulse; data remains stored after valid returns LOW.
            act_res_out_val <= vpu_res_in_val;

            if (vpu_res_in_val) begin
                for (integer lane = 0; lane < `COMPUTE_WIDTH; lane = lane + 1) begin
                    case (act_op_in)
                        `ACT_NONE:
                            act_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <=
                                vpu_res_in[lane*`DATA_WIDTH +: `DATA_WIDTH];

                        `ACT_RELU:
                            act_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <=
                                fp8_is_nan(vpu_res_in[lane*`DATA_WIDTH +: 7]) ? FP8_QNAN :
                                vpu_res_in[(lane+1)*`DATA_WIDTH-1] ? FP8_ZERO :
                                vpu_res_in[lane*`DATA_WIDTH +: `DATA_WIDTH];

                        `ACT_SIGMOID:
                            act_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <=
                                fp8_sigmoid(vpu_res_in[lane*`DATA_WIDTH +: `DATA_WIDTH]);

                        `ACT_STEP:
                            act_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <=
                                fp8_is_nan(vpu_res_in[lane*`DATA_WIDTH +: 7]) ? FP8_QNAN :
                                (!vpu_res_in[(lane+1)*`DATA_WIDTH-1] &&
                                 vpu_res_in[lane*`DATA_WIDTH +: 7] != 0) ? 8'h38 : FP8_ZERO;

                        `ACT_TANH:
                            act_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <=
                                fp8_tanh(vpu_res_in[lane*`DATA_WIDTH +: `DATA_WIDTH]);
                        default:
                            act_res_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <=
                                vpu_res_in[lane*`DATA_WIDTH +: `DATA_WIDTH];
                    endcase
                end
            end
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8)
            $fatal(1, "FP8 activation requires DATA_WIDTH=8");
    end
`endif

endmodule
