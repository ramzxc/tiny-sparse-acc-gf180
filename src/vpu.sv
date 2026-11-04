// One parallel FP8 multiply/add datapath per vector lane.
// An input-valid edge registers the complete result, with no intermediate stage.
// vpu_ctrl blocks the next compute until the accumulator accepts this result.
module vpu
    import tpu_pkg::*;
#(
    parameter int COMPUTE_WIDTH = 2
) (
    input  logic                       clk, rst,
    input  fp8_type [COMPUTE_WIDTH-1:0] weight_data,
    input  logic                       load_weight,
    input  fp8_type [COMPUTE_WIDTH-1:0] input_data,
    input  logic                       input_valid,
    input  fp8_type [COMPUTE_WIDTH-1:0] last_sum_data,
    input  logic                       last_sum_valid,
    output fp8_type [COMPUTE_WIDTH-1:0] result,
    output logic                       result_valid
);
    fp8_type [COMPUTE_WIDTH-1:0] weights;

    always_ff @(posedge clk) begin
        if (rst) begin
            weights      <= '0;
            result       <= '0;
            result_valid <= 1'b0;
        end else begin
            if (load_weight)
                weights <= weight_data;

            result_valid <= input_valid;

            if (input_valid) begin
                // A simultaneous weight load takes effect on the next edge.
                // Keep FP8 rounding after both multiplication and addition.
                for (int lane = 0; lane < COMPUTE_WIDTH; lane++) begin
                    result[lane] <= fp8_add(
                        fp8_mul(input_data[lane], weights[lane]),
                        last_sum_valid ? last_sum_data[lane] : FP8_ZERO
                    );
                end
            end
        end
    end
endmodule
