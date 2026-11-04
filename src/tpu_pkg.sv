// THIS TPU consists of following components
// - DRAM
// - Weight Buffer (WB) / Weight Cache
// - Unified Buffer (UB): Stores Input & Output
// - Accumulation Buffer (AB): Stores partial output
// - Activation (Act): Activation functional unit
// - Vector Processor (VPU): Vector processor
package tpu_pkg;

    // DRAM remains byte-addressable. BYTE_WIDTH is the addressable storage unit,
    // while operands/weights are E4M3FN FP8 and accumulator state is binary16.
    parameter int BYTE_WIDTH              = 8;
    parameter int FP16_WIDTH              = 16;
    parameter int FP16_BYTES              = FP16_WIDTH / BYTE_WIDTH;

    ////////////////////////////////========
    //                                    //
    //      Instruction format bitwidth   //
    //                                    //
    ////////////////////////////////========

    parameter int INSTRUCTION_WIDTH      = 64;
    parameter int BUFFER_ADDR_WIDTH      = 16;
    parameter int ACCUMULATOR_ADDR_WIDTH = 8;
    parameter int WEIGHT_ADDR_WIDTH      = 24;
    parameter int DRAM_ADDR_WIDTH        = 32;
    parameter int OPCODE_WIDTH           = 8;
    parameter int LENGTH_WIDTH           = 8;

    ////////////////////////////
    //                        //
    //      ISA OPCODE LIST   //
    //                        //
    ////////////////////////////

    // Nop
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_NOP        = 8'h00;
    // Halt the operation
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_HALT       = 8'h02;

    // Perform an activation function
    // From AB -> Act -> UB
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_ACTIVATE    = 8'h80;
    // Execute VPU (Vector MAC Unit)
    // - (Use preloaded weight)
    // - Load data from the UB
    // - Store/Accumulate results to the AB
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_VPU        = 8'h20;
    // Transfer data from the WB -> VPU
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_WEIGHT     = 8'h08;
    // Transfer data from the UB -> VPU
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_INPUT      = 8'h10;

    localparam logic [OPCODE_WIDTH-1:0] OPCODE_VPU_VEC_MUL = 8'h20; // 0010_0000
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_VPU_VEC_ADD = 8'h22; // 0010_0010
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_VPU_VEC_SUB = 8'h24; // 0010_0100

    localparam logic [OPCODE_WIDTH-1:0] OPCODE_VPU_SCALAR_MUL = 8'h30; // 0011_0000
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_VPU_SCALAR_ADD = 8'h32; // 0011_0010
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_VPU_SCALAR_SUB = 8'h34; // 0011_0100

    // Memory transfer ISA
    // SRC_TO_DST
    // the last three bits become the sub-opcode
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_MEM            = 8'h40;
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_DRAM_TO_BUFFER = 8'h40;
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_DRAM_TO_WEIGHT = 8'h41;
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_BUFFER_TO_DRAM = 8'h42;
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_ACC_TO_DRAM    = 8'h43;
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_DRAM_TO_ACC    = 8'h44;

    // Synchronize
    // The host waits for the TPU until it flushes the instructions
    localparam logic [OPCODE_WIDTH-1:0] OPCODE_SYNCHRONIZE = 8'hFF;

    ////////////////////////////
    //                        //
    //      TYPE DEFINITION   //
    //                        //
    ////////////////////////////

    // Byte type is used only by the byte-addressable DRAM model and beat packers.
    typedef logic [BYTE_WIDTH-1:0] byte_type;

    // Binary16 is retained for accumulator state and exact DMA save/restore.
    typedef logic [FP16_WIDTH-1:0] fp16_type;
    typedef longint unsigned uint64_type;
    typedef longint signed   int64_type;

    // Address types for the buffers and dram
    typedef logic [BUFFER_ADDR_WIDTH-1:0]      buffer_addr_type;
    typedef logic [DRAM_ADDR_WIDTH-1:0]        dram_addr_type;
    typedef logic [ACCUMULATOR_ADDR_WIDTH-1:0] accumulator_addr_type;
    typedef logic [WEIGHT_ADDR_WIDTH-1:0]      weight_addr_type;

    // Cache Replacement Policy Type (3 bits for 5 policies)
    typedef enum logic [2:0] {
        POLICY_DECAYED_LFU, // Baseline 1: Decayed LFU
        POLICY_SLRU,        // Baseline 2: Segmented LRU (Scan-Resistant)
        POLICY_FIFO,        // Ultra-low power fallback
        POLICY_CUSTOM,      // Custom Hybrid Policy (Transplanted from C++)
        POLICY_RANDOM       // Random Replacement
    } repl_policy_e;

    ////////////////////////////////
    //                            //
    //      CONSTANT DEFINITION   //
    //                            //
    ////////////////////////////////

    localparam fp16_type FP16_ZERO    = 16'h0000;
    localparam fp16_type FP16_HALF    = 16'h3800;
    localparam fp16_type FP16_ONE     = 16'h3C00;
    localparam fp16_type FP16_NEG_ONE = 16'hBC00;
    localparam fp16_type FP16_POS_INF = 16'h7C00;
    localparam fp16_type FP16_QNAN    = 16'h7E00;

    ////////////////////////////////////
    //                                //
    //      SYNTHESIZABLE FP PACKER   //
    //                                //
    ////////////////////////////////////

    // Pack an exact value sign * magnitude * 2^scale into binary16 using
    // round-to-nearest-even. This helper keeps the FP arithmetic functions
    // synthesizable and independent of real/shortreal simulation types.
    function automatic fp16_type fp16_pack_scaled(
        input logic            sign,
        input longint unsigned magnitude,
        input integer          scale
    );
        integer msb;
        integer exp_unbiased;
        integer exp_field;
        integer shift;
        integer k;
        longint unsigned rounded;
        longint unsigned truncated;
        longint unsigned remainder;
        longint unsigned halfway;
        longint unsigned frac_value;
        logic round_up;
    begin
        if (magnitude == 0) begin
            fp16_pack_scaled = {sign, 15'h0000};
        end
        else begin
            msb = -1;
            for (int i = 63; i >= 0; i--) begin
                if ((msb < 0) && magnitude[i])
                    msb = i;
            end

            exp_unbiased = msb + scale;

            if (exp_unbiased > 15) begin
                fp16_pack_scaled = {sign, 5'h1F, 10'h000};
            end
            else if (exp_unbiased >= -14) begin
                shift = msb - 10;
                if (shift > 0) begin
                    truncated = magnitude >> shift;
                    remainder = magnitude - (truncated << shift);
                    halfway   = 64'd1 << (shift - 1);
                    round_up  = (remainder > halfway) ||
                                ((remainder == halfway) && truncated[0]);
                    rounded = truncated + round_up;
                end
                else begin
                    rounded = magnitude << (-shift);
                end

                if (rounded >= 2048) begin
                    rounded = rounded >> 1;
                    exp_unbiased = exp_unbiased + 1;
                end

                if (exp_unbiased > 15) begin
                    fp16_pack_scaled = {sign, 5'h1F, 10'h000};
                end
                else begin
                    exp_field = exp_unbiased + 15;
                    fp16_pack_scaled = {
                        sign,
                        exp_field[4:0],
                        rounded[9:0]
                    };
                end
            end
            else begin
                k = scale + 24;
                if (k >= 0) begin
                    if (k >= 63)
                        frac_value = 64'hFFFF_FFFF_FFFF_FFFF;
                    else
                        frac_value = magnitude << k;
                end
                else begin
                    shift = -k;
                    if (shift >= 64) begin
                        frac_value = 0;
                    end
                    else if (shift == 0) begin
                        frac_value = magnitude;
                    end
                    else begin
                        truncated = magnitude >> shift;
                        remainder = magnitude - (truncated << shift);
                        halfway   = 64'd1 << (shift - 1);
                        round_up  = (remainder > halfway) ||
                                    ((remainder == halfway) && truncated[0]);
                        frac_value = truncated + round_up;
                    end
                end

                if (frac_value >= 1024)
                    fp16_pack_scaled = {sign, 5'h01, 10'h000};
                else
                    fp16_pack_scaled = {sign, 5'h00, frac_value[9:0]};
            end
        end
    end
    endfunction

    /////////////////////
    //                 //
    //      FP ADDER   //
    //                 //
    /////////////////////

    function automatic fp16_type fp16_add(
        input fp16_type a,
        input fp16_type b
    );
        logic sign_a, sign_b, sign_r;
        logic [4:0] exp_a, exp_b;
        logic [9:0] frac_a, frac_b;
        longint unsigned sig_a, sig_b;
        integer scale_a, scale_b, common_scale;
        longint signed aligned_a, aligned_b, sum_signed;
        longint unsigned magnitude;
    begin
        sign_a = a[15];
        exp_a = a[14:10];
        frac_a = a[9:0];
        sign_b = b[15];
        exp_b = b[14:10];
        frac_b = b[9:0];

        if ((exp_a == 5'h1F && frac_a != 0) ||
            (exp_b == 5'h1F && frac_b != 0)) begin
            fp16_add = FP16_QNAN;
        end
        else if ((exp_a == 5'h1F) && (exp_b == 5'h1F) && (sign_a != sign_b)) begin
            fp16_add = FP16_QNAN;
        end
        else if (exp_a == 5'h1F) begin
            fp16_add = {sign_a, 5'h1F, 10'h000};
        end
        else if (exp_b == 5'h1F) begin
            fp16_add = {sign_b, 5'h1F, 10'h000};
        end
        else begin
            if (exp_a == 0) begin
                sig_a   = uint64_type'(frac_a);
                scale_a = -24;
            end
            else begin
                sig_a   = 64'd1024 + uint64_type'(frac_a);
                scale_a = integer'(exp_a) - 25;
            end

            if (exp_b == 0) begin
                sig_b   = uint64_type'(frac_b);
                scale_b = -24;
            end
            else begin
                sig_b   = 64'd1024 + uint64_type'(frac_b);
                scale_b = integer'(exp_b) - 25;
            end

            common_scale = (scale_a < scale_b) ? scale_a : scale_b;
            aligned_a = int64_type'(sig_a << (scale_a - common_scale));
            aligned_b = int64_type'(sig_b << (scale_b - common_scale));
            if (sign_a) aligned_a = -aligned_a;
            if (sign_b) aligned_b = -aligned_b;

            sum_signed = aligned_a + aligned_b;
            sign_r = (sum_signed < 0) || ((sum_signed == 0) && sign_a && sign_b);
            if (sum_signed < 0)
                magnitude = uint64_type'(-sum_signed);
            else
                magnitude = uint64_type'(sum_signed);

            fp16_add = fp16_pack_scaled(sign_r, magnitude, common_scale);
        end
    end
    endfunction

    //////////////////////////
    //                      //
    //      FP MULTIPLIER   //
    //                      //
    //////////////////////////

    function automatic fp16_type fp16_mul(
        input fp16_type a,
        input fp16_type b
    );
        logic sign_r;
        logic [4:0] exp_a, exp_b;
        logic [9:0] frac_a, frac_b;
        longint unsigned sig_a, sig_b, product;
        integer scale_a, scale_b;
    begin
        sign_r = a[15] ^ b[15];
        exp_a = a[14:10]; frac_a = a[9:0];
        exp_b = b[14:10]; frac_b = b[9:0];

        if ((exp_a == 5'h1F && frac_a != 0) ||
            (exp_b == 5'h1F && frac_b != 0)) begin
            fp16_mul = FP16_QNAN;
        end
        else if (((exp_a == 5'h1F) && ((exp_b == 0) && (frac_b == 0))) ||
                 ((exp_b == 5'h1F) && ((exp_a == 0) && (frac_a == 0)))) begin
            fp16_mul = FP16_QNAN;
        end
        else if ((exp_a == 5'h1F) || (exp_b == 5'h1F)) begin
            fp16_mul = {sign_r, 5'h1F, 10'h000};
        end
        else if (((exp_a == 0) && (frac_a == 0)) ||
                 ((exp_b == 0) && (frac_b == 0))) begin
            fp16_mul = {sign_r, 15'h0000};
        end
        else begin
            if (exp_a == 0) begin
                sig_a   = uint64_type'(frac_a);
                scale_a = -24;
            end
            else begin
                sig_a   = 64'd1024 + uint64_type'(frac_a);
                scale_a = integer'(exp_a) - 25;
            end

            if (exp_b == 0) begin
                sig_b   = uint64_type'(frac_b);
                scale_b = -24;
            end
            else begin
                sig_b   = 64'd1024 + uint64_type'(frac_b);
                scale_b = integer'(exp_b) - 25;
            end

            product = sig_a * sig_b;
            fp16_mul = fp16_pack_scaled(sign_r, product, scale_a + scale_b);
        end
    end
    endfunction

    /////////////////////////////
    //                         //
    //      FP RIGHT SHIFTER   //
    //                         //
    /////////////////////////////

    function automatic fp16_type fp16_shift_right(
        input fp16_type a,
        input integer   k
    );
        logic           sign_a;
        logic [4:0]     exp_a;
        logic [9:0]     frac_a;
        longint unsigned sig_a;
        integer         scale_a;
    begin
        sign_a = a[15];
        exp_a  = a[14:10];
        frac_a = a[9:0];

        if ((exp_a == 5'h1F) && (frac_a != 0)) begin
            fp16_shift_right = FP16_QNAN;
        end
        else if (exp_a == 5'h1F) begin
            fp16_shift_right = a;
        end
        else if ((exp_a == 0) && (frac_a == 0)) begin
            fp16_shift_right = a;
        end
        else begin
            if (exp_a == 0) begin
                sig_a   = uint64_type'(frac_a);
                scale_a = -24;
            end
            else begin
                sig_a   = 64'd1024 + uint64_type'(frac_a);
                scale_a = integer'(exp_a) - 25;
            end
            fp16_shift_right = fp16_pack_scaled(sign_a, sig_a, scale_a - k);
        end
    end
    endfunction

    //////////////////
    //              //
    //      FP RELU //
    //              //
    //////////////////

    function automatic fp16_type fp16_relu(input fp16_type x);
    begin
        if ((x[14:10] == 5'h1F) && (x[9:0] != 0))
            fp16_relu = FP16_QNAN;
        else if (x[15])
            fp16_relu = FP16_ZERO;
        else
            fp16_relu = x;
    end
    endfunction

    ///////////////////////
    //                   //
    //      FP SIGMOID   //
    //                   //
    ///////////////////////

    function automatic fp16_type fp16_sigmoid(input fp16_type x);
        fp16_type abs_x;
        fp16_type pwl_pos;
        fp16_type neg_pwl;
    begin
        if ((x[14:10] == 5'h1F) && (x[9:0] != 0)) begin
            fp16_sigmoid = FP16_QNAN;
        end
        else if ({1'b0, x[14:0]} >= 16'h4500)  begin
            fp16_sigmoid = x[15] ? FP16_ZERO : FP16_ONE;
        end
        else begin
            abs_x = {1'b0, x[14:0]};
            if (abs_x < 16'h3C00) begin
                pwl_pos = fp16_add(fp16_shift_right(abs_x, 2), FP16_HALF);
            end
            else if (abs_x < 16'h40C0) begin
                pwl_pos = fp16_add(fp16_shift_right(abs_x, 3), 16'h3900);
            end
            else begin
                pwl_pos = fp16_add(fp16_shift_right(abs_x, 5), 16'h3AC0);
            end

            if (x[15]) begin
                neg_pwl = {~pwl_pos[15], pwl_pos[14:0]};
                fp16_sigmoid = fp16_add(FP16_ONE, neg_pwl);
            end
            else begin
                fp16_sigmoid = pwl_pos;
            end
        end
    end
    endfunction

    //////////////////
    //              //
    //      FP TANH //
    //              //
    //////////////////

    function automatic fp16_type fp16_tanh(input fp16_type x);
        fp16_type x_mult2;
        fp16_type sig_val;
        fp16_type two_sig;
    begin
        if ((x[14:10] == 5'h1F) && (x[9:0] != 0)) begin
            fp16_tanh = FP16_QNAN;
        end
        else if ({1'b0, x[14:0]} >= 16'h4200) begin
            fp16_tanh = x[15] ? FP16_NEG_ONE : FP16_ONE;
        end
        else begin
            x_mult2 = fp16_shift_right(x, -1);
            sig_val = fp16_sigmoid(x_mult2);

            two_sig = fp16_shift_right(sig_val, -1);

            fp16_tanh = fp16_add(two_sig, FP16_NEG_ONE);
        end
    end
    endfunction

    //////////////////////////////
    //                          //
    //    FP16 Heaviside Step   //
    //                          //
    //////////////////////////////

    function automatic fp16_type fp16_heaviside_step(input fp16_type x);
    begin
        if (x[15] == 1'b0 && (x[14:0] != '0)) 
            fp16_heaviside_step = FP16_ONE;
        else
            fp16_heaviside_step = FP16_ZERO;
    end
    endfunction

    // E4M3FN: bias 7, signed zero/subnormals, max finite +/-448, no infinity.
    // All finite operations use nearest-even rounding and saturate overflow.
    parameter int FP8_WIDTH = 8;
    parameter int FP8_BYTES = 1;
    typedef logic [7:0] fp8_type;
    localparam fp8_type FP8_ZERO = 8'h00, FP8_HALF = 8'h30, FP8_ONE = 8'h38;
    localparam fp8_type FP8_NEG_ONE = 8'hb8, FP8_MAX = 8'h7e, FP8_QNAN = 8'h7f;

    function automatic logic fp8_is_nan(input fp8_type x);
        return x[6:0] == 7'h7f;
    endfunction
    function automatic logic fp8_is_zero(input fp8_type x);
        return x[6:0] == 0;
    endfunction

    function automatic fp8_type fp8_pack_scaled(input logic sign, input logic [19:0] magnitude,
                                                input integer scale);
        integer msb, exponent, shift, encoded;
        logic [20:0] truncated, remainder, halfway, rounded;
        begin
            msb = -1;
            truncated = 0;
            remainder = 0;
            halfway = 0;
            rounded = 0;
            exponent = 0;
            shift = 0;
            encoded = 0;
            for (int i = 19; i >= 0; i--)
                if (msb < 0 && magnitude[i]) msb = i;
            if (msb < 0) return {sign, 7'd0};
            exponent = msb + scale;
            if (exponent > 8) return {sign, 7'h7e};
            // Normal: retain four significant bits. Subnormal quantum is 2^-9.
            shift = (exponent >= -6) ? msb - 3 : -9 - scale;
            if (shift > 20) rounded = 0;
            else if (shift > 0) begin
                truncated = {1'b0, magnitude} >> shift;
                remainder = {1'b0, magnitude} - (truncated << shift);
                halfway   = 21'd1 << (shift - 1);
                rounded   = truncated + 21'((remainder > halfway) || (remainder == halfway && truncated[0]));
            end else rounded = {1'b0, magnitude} << (-shift);
            if (exponent < -6) begin
                if (rounded >= 8) return {sign, 7'h08};
                return {sign, 4'd0, rounded[2:0]};
            end
            if (rounded >= 16) begin
                rounded = rounded >> 1;
                exponent++;
            end
            if (exponent > 8 || (exponent == 8 && rounded > 14)) return {sign, 7'h7e};
            encoded = exponent + 7;
            return {sign, encoded[3:0], rounded[2:0]};
        end
    endfunction

    // Eight-bit alignment with sticky-bit jamming (4-bit significand + G/R/S).
    function automatic logic [7:0] fp8_jam8(input logic [7:0] x, input logic [4:0] n);
        case (n)
            0: return x;
            1: return {1'b0, x[7:2], (x[1] | x[0])};
            2: return {2'b0, x[7:3], (|x[2:0])};
            3: return {3'b0, x[7:4], (|x[3:0])};
            4: return {4'b0, x[7:5], (|x[4:0])};
            5: return {5'b0, x[7:6], (|x[5:0])};
            6: return {6'b0, x[7], (|x[6:0])};
            default: return {7'b0, (|x)};
        endcase
    endfunction

    function automatic fp8_type fp8_add(input fp8_type a, b);
        fp8_type hi_operand, lo_operand;
        logic [4:0] el, es, exponent, rounded;
        logic [3:0] ml, ms;
        logic [7:0] aligned, total;
        begin
            if (fp8_is_nan(a) || fp8_is_nan(b)) return FP8_QNAN;
            hi_operand = (a[6:0] >= b[6:0]) ? a : b;
            lo_operand = (a[6:0] >= b[6:0]) ? b : a;
            el = (hi_operand[6:3] == 0) ? 5'd1 : {1'b0, hi_operand[6:3]};
            es = (lo_operand[6:3] == 0) ? 5'd1 : {1'b0, lo_operand[6:3]};
            ml = {(hi_operand[6:3] != 0), hi_operand[2:0]};
            ms = {(lo_operand[6:3] != 0), lo_operand[2:0]};
            aligned = fp8_jam8({1'b0, ms, 3'b000}, el - es);
            total = (hi_operand[7] == lo_operand[7]) ?
                ({1'b0, ml, 3'b000} + aligned) : ({1'b0, ml, 3'b000} - aligned);
            if (total == 0) return (a[7] && b[7]) ? 8'h80 : FP8_ZERO;
            exponent = el;
            if (total[7]) begin
                total = fp8_jam8(total, 5'd1);
                exponent = exponent + 1'b1;
            end
            // Cancellation normalization needs at most six shifts; no 20-bit sum.
            for (int i = 0; i < 6; i++)
            if (!total[6] && exponent > 1) begin
                total = total << 1;
                exponent = exponent - 1'b1;
            end
            rounded = {1'b0, total[6:3]} + 5'(total[2] && (total[1] || total[0] || total[3]));
            if (rounded[4]) begin
                rounded  = rounded >> 1;
                exponent = exponent + 1'b1;
            end
            if (exponent > 15 || (exponent == 15 && rounded > 14)) return {hi_operand[7], 7'h7e};
            if (exponent == 1 && rounded < 8) return {hi_operand[7], 4'b0, rounded[2:0]};
            return {hi_operand[7], exponent[3:0], rounded[2:0]};
        end
    endfunction

    // Product/scaling packer specialized to at most eight magnitude bits.
    function automatic fp8_type fp8_pack8(input logic sign, input logic [7:0] magnitude,
                                          input logic signed [6:0] scale);
        logic signed [4:0] msb;
        logic signed [6:0] exponent, shift;
        logic [8:0] truncated, remainder, halfway, rounded;
        logic [4:0] encoded;
        begin
            msb = -5'sd1;
            truncated = 0;
            remainder = 0;
            halfway = 0;
            rounded = 0;
            encoded = 0;
            for (int i = 0; i < 8; i++)
                if (magnitude[i]) msb = 5'(i);
            if (msb < 0) return {sign, 7'b0};
            exponent = 7'(msb) + scale;
            if (exponent > 8) return {sign, 7'h7e};
            shift = (exponent >= -6) ? 7'(msb) - 7'sd3 : -7'sd9 - scale;
            if (shift > 8) rounded = 0;
            else if (shift > 0) begin
                truncated = {1'b0, magnitude} >> shift;
                remainder = {1'b0, magnitude} - (truncated << shift);
                halfway   = 9'd1 << (shift - 1'b1);
                rounded   = truncated + 9'((remainder > halfway) || (remainder == halfway && truncated[0]));
            end else rounded = {1'b0, magnitude} << (-shift);
            if (exponent < -6) begin
                if (rounded >= 8) return {sign, 7'h08};
                return {sign, 4'b0, rounded[2:0]};
            end
            if (rounded >= 16) begin
                rounded  = rounded >> 1;
                exponent = exponent + 1'b1;
            end
            if (exponent > 8 || (exponent == 8 && rounded > 14)) return {sign, 7'h7e};
            encoded = 5'(exponent + 7'sd7);
            return {sign, encoded[3:0], rounded[2:0]};
        end
    endfunction

    function automatic fp8_type fp8_mul(input fp8_type a, b);
        logic [3:0] ma, mb;
        logic [7:0] product;
        logic signed [6:0] ea, eb;
        begin
            if (fp8_is_nan(a) || fp8_is_nan(b)) return FP8_QNAN;
            ma = {(a[6:3] != 0), a[2:0]};
            mb = {(b[6:3] != 0), b[2:0]};
            ea = (a[6:3] == 0) ? -7'sd9 : $signed({3'b0, a[6:3]}) - 7'sd10;
            eb = (b[6:3] == 0) ? -7'sd9 : $signed({3'b0, b[6:3]}) - 7'sd10;
            product = ma * mb;
            return fp8_pack8(a[7] ^ b[7], product, ea + eb);
        end
    endfunction

    function automatic fp8_type fp16_to_fp8(input fp16_type x);
        logic [10:0] mantissa;
        integer scale;
        begin
            if (x[14:10] == 31) return (x[9:0] != 0) ? FP8_QNAN : {x[15], 7'h7e};
            mantissa = (x[14:10] == 0) ? {1'b0, x[9:0]} : {1'b1, x[9:0]};
            scale = (x[14:10] == 0) ? -24 : int'(x[14:10]) - 25;
            return fp8_pack_scaled(x[15], {9'd0, mantissa}, scale);
        end
    endfunction

    function automatic fp16_type fp8_to_fp16(input fp8_type x);
        integer exponent, msb;
        logic [3:0] mantissa;
        logic [9:0] fraction;
        begin
            if (fp8_is_nan(x)) return FP16_QNAN;
            if (x[6:0] == 0) return {x[7], 15'd0};
            if (x[6:3] != 0) begin
                exponent = int'(x[6:3]) + 8;
                return {x[7], exponent[4:0], x[2:0], 7'd0};
            end
            msb = 0;
            for (int i = 0; i < 3; i++)
                if (x[i]) msb = i;
            exponent = msb + 6;
            mantissa = {1'b0, x[2:0]} << (3 - msb);
            fraction = {mantissa[2:0], 7'd0};
            return {x[7], exponent[4:0], fraction};
        end
    endfunction

    function automatic fp8_type fp8_shift_right(input fp8_type x, input integer k);
        logic [3:0] m;
        integer e;
        begin
            if (fp8_is_nan(x)) return FP8_QNAN;
            m = (x[6:3] == 0) ? {1'b0, x[2:0]} : {1'b1, x[2:0]};
            e = (x[6:3] == 0) ? -9 : int'(x[6:3]) - 10;
            if (k > 32) return {x[7], 7'b0};
            if (k < -32) return fp8_is_zero(x) ? x : {x[7], 7'h7e};
            return fp8_pack8(x[7], {4'b0, m}, 7'(e - k));
        end
    endfunction
    function automatic fp8_type fp8_relu(input fp8_type x);
        return fp8_is_nan(x) ? FP8_QNAN : x[7] ? FP8_ZERO : x;
    endfunction
    function automatic fp8_type fp8_heaviside_step(input fp8_type x);
        return fp8_is_nan(x) ? FP8_QNAN : (!x[7] && !fp8_is_zero(x)) ? FP8_ONE : FP8_ZERO;
    endfunction
    // Same piecewise-linear structure as the FP16 implementation, rounding
    // each operation and constants to E4M3FN. Threshold 2.375 becomes 2.5:
    // there is no representable FP8 input strictly between 2.25 and 2.5.
    // Hard activations: same FP8 rounding as the MAZE accuracy experiment.
    function automatic fp8_type fp8_sigmoid(input fp8_type x);
        begin
            if (fp8_is_nan(x)) return FP8_QNAN;
            if (x[6:0] >= 7'h40) return x[7] ? FP8_ZERO : FP8_ONE;
            return fp8_add(fp8_shift_right(x, 2), FP8_HALF);
        end
    endfunction
    function automatic fp8_type fp8_tanh(input fp8_type x);
        begin
            if (fp8_is_nan(x)) return FP8_QNAN;
            if (x[6:0] >= 7'h38) return x[7] ? FP8_NEG_ONE : FP8_ONE;
            return x;
        end
    endfunction

    typedef enum logic [3:0] {
        no_activation,
        relu,
        relu6,
        crelu,
        elu,
        selu,
        softplus,
        softsign,
        dropout,
        sigmoid,
        tanh,
        heaviside_step
    } activation_type;

    typedef enum logic [2:0] {
        mem_op_load_buffer,
        mem_op_load_weight,
        mem_op_store_buffer,
        mem_op_store_acc,
        mem_op_load_acc,
        mem_op_none
    } memory_op_type;

    typedef enum logic [2:0] {
        vpu_op_mul,
        vpu_op_add,
        vpu_op_sub,
        vpu_op_none
    } vpu_op_type;

    typedef struct packed {
        logic [INSTRUCTION_WIDTH-LENGTH_WIDTH-OPCODE_WIDTH-1:0] empty;
        logic [LENGTH_WIDTH-1:0] length;
        logic [OPCODE_WIDTH-1:0] opcode;
    } inst_type;

    typedef struct packed {
        logic [INSTRUCTION_WIDTH-WEIGHT_ADDR_WIDTH-BUFFER_ADDR_WIDTH-1-OPCODE_WIDTH-1:0] empty;
        logic [WEIGHT_ADDR_WIDTH-1:0] weight_addr;
        logic [BUFFER_ADDR_WIDTH-1:0] unified_addr;
        logic is_unified;
        logic [OPCODE_WIDTH-1:0] opcode;
    } weight_inst_type;

    typedef struct packed {
        logic [INSTRUCTION_WIDTH-BUFFER_ADDR_WIDTH-OPCODE_WIDTH-1:0] empty;
        logic [BUFFER_ADDR_WIDTH-1:0] input_addr;
        logic [OPCODE_WIDTH-1:0] opcode;
    } input_inst_type;

    typedef struct packed {
        logic [INSTRUCTION_WIDTH-BUFFER_ADDR_WIDTH-ACCUMULATOR_ADDR_WIDTH-LENGTH_WIDTH-OPCODE_WIDTH-1:0] empty;
        logic [BUFFER_ADDR_WIDTH-1:0] buffer_addr;
        logic [ACCUMULATOR_ADDR_WIDTH-1:0] acc_addr;
        logic [LENGTH_WIDTH-1:0] length;
        logic [OPCODE_WIDTH-1:0] opcode;
    } vpu_inst_type;

    typedef struct packed {
        logic [DRAM_ADDR_WIDTH-1:0] dram_addr;
        logic [BUFFER_ADDR_WIDTH-1:0] sram_addr;
        logic [LENGTH_WIDTH-1:0] length;
        logic [OPCODE_WIDTH-1:0] opcode;
    } dram_inst_type;

    typedef struct packed {
        logic [INSTRUCTION_WIDTH-BUFFER_ADDR_WIDTH-ACCUMULATOR_ADDR_WIDTH-LENGTH_WIDTH-OPCODE_WIDTH-1:0] empty;
        logic [BUFFER_ADDR_WIDTH-1:0] buffer_addr;
        logic [ACCUMULATOR_ADDR_WIDTH-1:0] acc_addr;
        logic [LENGTH_WIDTH-1:0] length;
        logic [OPCODE_WIDTH-1:0] opcode;
    } activate_inst_type;

    typedef union packed {
        inst_type          generic;
        weight_inst_type   weight;
        vpu_inst_type      vpu;
        dram_inst_type     dram;
        activate_inst_type activate;
        logic [INSTRUCTION_WIDTH-1:0] raw;
    } instruction_union_type;

endpackage
