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

    typedef logic [7:0] fp8_type;
    localparam fp8_type FP8_ZERO = 8'h00, FP8_QNAN = 8'h7f;
    function automatic logic fp8_is_nan(input logic [6:0] magnitude);
        return magnitude == 7'h7f;
    endfunction

    // Exact E4M3FN mapping of clamp(round_fp8(x/4) + 0.5, 0, 1).
    // Constant combinational logic, not a memory macro. Exhaustively tested.
    function automatic fp8_type fp8_sigmoid(input fp8_type x);
        case (x)
                8'hc0, 8'hc1, 8'hc2, 8'hc3, 8'hc4, 8'hc5, 8'hc6, 8'hc7,
                8'hc8, 8'hc9, 8'hca, 8'hcb, 8'hcc, 8'hcd, 8'hce, 8'hcf,
                8'hd0, 8'hd1, 8'hd2, 8'hd3, 8'hd4, 8'hd5, 8'hd6, 8'hd7,
                8'hd8, 8'hd9, 8'hda, 8'hdb, 8'hdc, 8'hdd, 8'hde, 8'hdf,
                8'he0, 8'he1, 8'he2, 8'he3, 8'he4, 8'he5, 8'he6, 8'he7,
                8'he8, 8'he9, 8'hea, 8'heb, 8'hec, 8'hed, 8'hee, 8'hef,
                8'hf0, 8'hf1, 8'hf2, 8'hf3, 8'hf4, 8'hf5, 8'hf6, 8'hf7,
                8'hf8, 8'hf9, 8'hfa, 8'hfb, 8'hfc, 8'hfd, 8'hfe: fp8_sigmoid = 8'h00;
                8'hbf: fp8_sigmoid = 8'h10;
                8'hbe: fp8_sigmoid = 8'h18;
                8'hbd: fp8_sigmoid = 8'h1c;
                8'hbc: fp8_sigmoid = 8'h20;
                8'hbb: fp8_sigmoid = 8'h22;
                8'hba: fp8_sigmoid = 8'h24;
                8'hb9: fp8_sigmoid = 8'h26;
                8'hb7, 8'hb8: fp8_sigmoid = 8'h28;
                8'hb6: fp8_sigmoid = 8'h29;
                8'hb3, 8'hb4, 8'hb5: fp8_sigmoid = 8'h2a;
                8'hb2: fp8_sigmoid = 8'h2b;
                8'hae, 8'haf, 8'hb0, 8'hb1: fp8_sigmoid = 8'h2c;
                8'hab, 8'hac, 8'had: fp8_sigmoid = 8'h2d;
                8'ha4, 8'ha5, 8'ha6, 8'ha7, 8'ha8, 8'ha9, 8'haa: fp8_sigmoid = 8'h2e;
                8'h99, 8'h9a, 8'h9b, 8'h9c, 8'h9d, 8'h9e, 8'h9f, 8'ha0,
                8'ha1, 8'ha2, 8'ha3: fp8_sigmoid = 8'h2f;
                8'h00, 8'h01, 8'h02, 8'h03, 8'h04, 8'h05, 8'h06, 8'h07,
                8'h08, 8'h09, 8'h0a, 8'h0b, 8'h0c, 8'h0d, 8'h0e, 8'h0f,
                8'h10, 8'h11, 8'h12, 8'h13, 8'h14, 8'h15, 8'h16, 8'h17,
                8'h18, 8'h19, 8'h1a, 8'h1b, 8'h1c, 8'h1d, 8'h1e, 8'h1f,
                8'h20, 8'h80, 8'h81, 8'h82, 8'h83, 8'h84, 8'h85, 8'h86,
                8'h87, 8'h88, 8'h89, 8'h8a, 8'h8b, 8'h8c, 8'h8d, 8'h8e,
                8'h8f, 8'h90, 8'h91, 8'h92, 8'h93, 8'h94, 8'h95, 8'h96,
                8'h97, 8'h98: fp8_sigmoid = 8'h30;
                8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28,
                8'h29, 8'h2a, 8'h2b: fp8_sigmoid = 8'h31;
                8'h2c, 8'h2d, 8'h2e, 8'h2f, 8'h30, 8'h31, 8'h32: fp8_sigmoid = 8'h32;
                8'h33, 8'h34, 8'h35: fp8_sigmoid = 8'h33;
                8'h36, 8'h37, 8'h38, 8'h39: fp8_sigmoid = 8'h34;
                8'h3a: fp8_sigmoid = 8'h35;
                8'h3b, 8'h3c, 8'h3d: fp8_sigmoid = 8'h36;
                8'h3e: fp8_sigmoid = 8'h37;
                8'h3f, 8'h40, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46,
                8'h47, 8'h48, 8'h49, 8'h4a, 8'h4b, 8'h4c, 8'h4d, 8'h4e,
                8'h4f, 8'h50, 8'h51, 8'h52, 8'h53, 8'h54, 8'h55, 8'h56,
                8'h57, 8'h58, 8'h59, 8'h5a, 8'h5b, 8'h5c, 8'h5d, 8'h5e,
                8'h5f, 8'h60, 8'h61, 8'h62, 8'h63, 8'h64, 8'h65, 8'h66,
                8'h67, 8'h68, 8'h69, 8'h6a, 8'h6b, 8'h6c, 8'h6d, 8'h6e,
                8'h6f, 8'h70, 8'h71, 8'h72, 8'h73, 8'h74, 8'h75, 8'h76,
                8'h77, 8'h78, 8'h79, 8'h7a, 8'h7b, 8'h7c, 8'h7d, 8'h7e: fp8_sigmoid = 8'h38;
                8'h7f, 8'hff: fp8_sigmoid = 8'h7f;
            default: fp8_sigmoid = FP8_QNAN;
        endcase
    endfunction

    // Same hard-tanh approximation as the original tpu_pkg: clamp(x, -1, 1).
    function automatic fp8_type fp8_tanh(input fp8_type x);
        begin
            if (fp8_is_nan(x[6:0])) return FP8_QNAN;
            if (x[6:0] >= 7'h38) return x[7] ? 8'hb8 : 8'h38;
            return x;
        end
    endfunction

    reg second_lane;
    reg [`DATA_WIDTH-1:0] saved_input;
    reg [2:0] saved_op;
    wire [`DATA_WIDTH-1:0] x = second_lane ? saved_input : vpu_res_in[0 +: `DATA_WIDTH];
    wire [2:0] operation = second_lane ? saved_op : act_op_in;
    reg [`DATA_WIDTH-1:0] result;

    // One activation datapath; result registers still hold both lanes.
    always @(*) begin
        case (operation)
            `ACT_RELU: result = fp8_is_nan(x[6:0]) ? FP8_QNAN : x[7] ? FP8_ZERO : x;
            `ACT_SIGMOID: result = fp8_sigmoid(x);
            `ACT_TANH: result = fp8_tanh(x);
            `ACT_STEP: result = fp8_is_nan(x[6:0]) ? FP8_QNAN :
                (!x[7] && x[6:0] != 0) ? 8'h38 : FP8_ZERO;
            default: result = x;
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            second_lane <= 0;
            saved_input <= 0;
            saved_op <= 0;
            act_res_out <= 0;
            act_res_out_val <= 0;
        end else begin
            act_res_out_val <= 0;
            if (second_lane) begin
                act_res_out[`DATA_WIDTH +: `DATA_WIDTH] <= result;
                act_res_out_val <= 1;
                second_lane <= 0;
            end else if (vpu_res_in_val) begin
                act_res_out[0 +: `DATA_WIDTH] <= result;
                saved_input <= vpu_res_in[`DATA_WIDTH +: `DATA_WIDTH];
                saved_op <= act_op_in;
                second_lane <= 1;
            end
        end
    end

`ifndef SYNTHESIS
    initial begin
        if (`DATA_WIDTH != 8 || `COMPUTE_WIDTH != 2)
            $fatal(1, "Serial activation requires two FP8 lanes");
    end
`endif
endmodule
