// One scalar activation engine shared across all lanes; vector ports unchanged.
module activation
    import tpu_pkg::*;
#(
    parameter int COMPUTE_WIDTH = 2
) (
    input  logic                        clk, rst,
    input  fp8_type [COMPUTE_WIDTH-1:0] data_in,
    input  logic                        data_in_valid,
    output logic                        data_in_ready,
    input  activation_type              activation_function,
    output fp8_type [COMPUTE_WIDTH-1:0] data_out,
    output logic                        data_out_valid,
    input  logic                        data_out_ready
);
    localparam int LANE_BITS = (COMPUTE_WIDTH > 1) ? $clog2(COMPUTE_WIDTH) : 1;
    typedef enum logic [1:0] {
        IDLE,
        SEND,
        WAIT_RESULT,
        DONE
    } state_type;
    state_type state;
    logic [LANE_BITS-1:0] lane_cs;
    fp8_type [COMPUTE_WIDTH-1:0] saved_input, output_cs;
    activation_type saved_function;
    fp8_type scalar_result;
    logic scalar_ready, scalar_valid;

    assign data_in_ready = !rst && state == IDLE;
    assign data_out_valid = !rst && state == DONE;
    assign data_out = output_cs;

    activation_lane #(
        .COMPUTE_WIDTH(1)
    ) scalar_engine (
        .clk                (clk),
        .rst                (rst),
        .data_in            (saved_input[lane_cs]),
        .data_in_valid      (state == SEND),
        .data_in_ready      (scalar_ready),
        .activation_function(saved_function),
        .data_out           (scalar_result),
        .data_out_valid     (scalar_valid),
        .data_out_ready     (state == WAIT_RESULT)
    );

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            lane_cs <= '0;
            saved_input <= '0;
            output_cs <= '0;
            saved_function <= no_activation;
        end else
            case (state)
                IDLE:
                    if (data_in_valid && data_in_ready) begin
                        saved_input <= data_in;
                        saved_function <= activation_function;
                        lane_cs <= '0;
                        state <= SEND;
                    end

                SEND: if (scalar_ready) state <= WAIT_RESULT;

                WAIT_RESULT:
                    if (scalar_valid) begin
                        output_cs[lane_cs] <= scalar_result;
                        if (lane_cs == LANE_BITS'(COMPUTE_WIDTH - 1)) state <= DONE;
                        else begin
                            lane_cs <= lane_cs + 1'b1;
                            state   <= SEND;
                        end
                    end

                DONE: if (data_out_ready) state <= IDLE;

                default: state <= IDLE;
            endcase
    end
endmodule

// Scalar hard-activation engine. Sigmoid uses a registered divide-by-four
// followed by one FP8 addition. Tanh is clamp/pass-through, with no adder.
module activation_lane
    import tpu_pkg::*;
#(
    parameter int COMPUTE_WIDTH = 2
) (
    input  logic                        clk, rst,
    input  fp8_type [COMPUTE_WIDTH-1:0] data_in,
    input  logic                        data_in_valid,
    output logic                        data_in_ready,
    input  activation_type              activation_function,
    output fp8_type [COMPUTE_WIDTH-1:0] data_out,
    output logic                        data_out_valid,
    input  logic                        data_out_ready
);
    typedef enum logic {
        IDLE,
        SIGMOID_ADD
    } state_type;
    state_type state;
    fp8_type [COMPUTE_WIDTH-1:0] output_cs, scaled_cs, special_result_cs;
    logic [COMPUTE_WIDTH-1:0] special_cs;
    logic output_valid_cs;

    assign data_out = output_cs;
    assign data_out_valid = !rst && output_valid_cs;
    assign data_in_ready = !rst && state == IDLE && (!output_valid_cs || data_out_ready);

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            output_cs <= '0;
            output_valid_cs <= 0;
            scaled_cs <= '0;
            special_cs <= '0;
            special_result_cs <= '0;
        end else begin
            if (output_valid_cs && data_out_ready) output_valid_cs <= 0;

            case (state)
                IDLE:
                    if (data_in_valid && data_in_ready) begin
                        for (int i = 0; i < COMPUTE_WIDTH; i++) begin
                            case (activation_function)
                                sigmoid: begin
                                    scaled_cs[i] <= fp8_shift_right(data_in[i], 2);
                                    special_cs[i] <= fp8_is_nan(data_in[i]) || data_in[i][6:0] >= 7'h40;
                                    special_result_cs[i] <= fp8_is_nan(data_in[i])
                                        ? FP8_QNAN : (data_in[i][7] ? FP8_ZERO : FP8_ONE);
                                end
                                tanh: output_cs[i] <= fp8_tanh(data_in[i]);
                                relu: output_cs[i] <= fp8_relu(data_in[i]);
                                heaviside_step: output_cs[i] <= fp8_heaviside_step(data_in[i]);

                                default: output_cs[i] <= data_in[i];
                            endcase
                        end
                        if (activation_function == sigmoid) state <= SIGMOID_ADD;
                        else output_valid_cs <= 1;
                    end

                SIGMOID_ADD: begin
                    for (int i = 0; i < COMPUTE_WIDTH; i++)
                        output_cs[i] <= special_cs[i] ? special_result_cs[i] : fp8_add(scaled_cs[i], FP8_HALF);
                    output_valid_cs <= 1;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule
