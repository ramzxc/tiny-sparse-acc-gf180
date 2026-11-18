`include "../defs/defs.vh"
`include "../defs/inst_defs.vh"

// Each accepted EXEC updates the accumulator and activated output together.
// Operands are stationary: data_in_val updates only the selected register.
module exec_unit (
    input  wire clk,
    input  wire rst_n,

    input  wire [`EXEC_INST_WIDTH-1:0] exec_inst_in,
    input  wire exec_inst_in_val,
    output wire exec_rdy,

    input  wire [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] data_in,
    input  wire data_in_val,
    input  wire is_weight,

    output reg [`DATA_WIDTH*`COMPUTE_WIDTH-1:0] data_out,
    output reg data_out_val
);
    `include "../defs/fp8_math.vh"

    wire       accumulate = exec_inst_in[5];
    wire [1:0] operation  = exec_inst_in[4:3];
    wire [2:0] activation = exec_inst_in[2:0];

    assign exec_rdy = rst_n;

    // Existing hard activation approximations, now encoded in FP8 E4M3FN.
    // SIGMOID = clamp(x/4 + 0.5, 0, 1); TANH = clamp(x, -1, 1).
    function automatic fp8_type activate(input fp8_type x, input [2:0] op);
        reg signed [6:0] quarter_scale;
        fp8_type quarter, sigmoid;
        begin
            quarter_scale = x[6:3] == 0 ? -7'sd11 :
                $signed({3'b0, x[6:3]}) - 7'sd12;
            quarter = fp8_pack8(x[7], {4'b0, (x[6:3] != 0), x[2:0]}, quarter_scale);
            sigmoid = fp8_add(quarter, 8'h30);

            case (op)
                `ACT_RELU:    activate = x[7] ? FP8_ZERO : x;
                `ACT_TANH:    activate = x[6:0] > 7'h38 ? {x[7], 7'h38} : x;
                `ACT_SIGMOID: activate = sigmoid[7] ? FP8_ZERO :
                    sigmoid[6:0] > 7'h38 ? 8'h38 : sigmoid;
                `ACT_STEP:    activate = !x[7] && x[6:0] != 0 ? 8'h38 : FP8_ZERO;
                default:      activate = x;
            endcase
            if (fp8_is_nan(x[6:0])) activate = FP8_QNAN;
        end
    endfunction

    // One multiplier and one arithmetic adder per lane. Default is one lane.
    // MUL rounds to FP8 before accumulation (not a fused multiply-add).
    genvar lane;
    generate for (lane = 0; lane < `COMPUTE_WIDTH; lane = lane + 1) begin : lanes
        reg [`DATA_WIDTH-1:0] input_reg;
        reg [`DATA_WIDTH-1:0] weight_reg;
        reg [`DATA_WIDTH-1:0] acc_reg;

        wire multiply = operation == `VPU_MUL;
        wire [`DATA_WIDTH-1:0] product = fp8_mul(input_reg, weight_reg);
        wire [`DATA_WIDTH-1:0] add_a = multiply ? product : input_reg;
        wire [`DATA_WIDTH-1:0] add_b = multiply ? acc_reg :
            {weight_reg[7] ^ (operation == `VPU_SUB), weight_reg[6:0]};
        wire [`DATA_WIDTH-1:0] sum = fp8_add(add_a, add_b);
        wire [`DATA_WIDTH-1:0] result = multiply && !accumulate ? product : sum;

        always @(posedge clk) begin
            if (!rst_n) begin
                input_reg  <= 0;
                weight_reg <= 0;
                acc_reg    <= 0;
                data_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <= 0;
            end else begin
                if (data_in_val) begin
                    if (is_weight)
                        weight_reg <= data_in[lane*`DATA_WIDTH +: `DATA_WIDTH];
                    else
                        input_reg <= data_in[lane*`DATA_WIDTH +: `DATA_WIDTH];
                end

                // Nonblocking assignments deliberately use OLD operands when
                // an operand update and EXEC arrive on the same clock edge.
                if (exec_inst_in_val) begin
                    acc_reg <= result;
                    data_out[lane*`DATA_WIDTH +: `DATA_WIDTH] <= activate(result, activation);
                end
            end
        end
    end endgenerate

    always @(posedge clk) begin
        if (!rst_n)
            data_out_val <= 1'b0;
        else
            data_out_val <= exec_inst_in_val;
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH < 1)
            $fatal(1, "exec_unit requires FP8 elements and at least one lane");
    end
    always @(posedge clk) begin
        if (rst_n && exec_inst_in_val) begin
            if (accumulate && operation != `VPU_MUL)
                $fatal(1, "Accumulation is supported only for MUL");
            if (operation == 2'b11 || activation > `ACT_STEP)
                $fatal(1, "Reserved EXEC operation");
        end
    end
`endif
endmodule
