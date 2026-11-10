// Include inside each module that uses FP8 arithmetic.
    // FP8 E4M3FN arithmetic adapted from acc/lib/tpu_pkg.sv.
    // Round to nearest, ties to even; finite saturation and canonical NaN.
    typedef logic [7:0] fp8_type;
    localparam fp8_type FP8_ZERO = 8'h00, FP8_QNAN = 8'h7f;

    function automatic logic fp8_is_nan(input logic [6:0] magnitude);
        return magnitude == 7'h7f;
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
            if (fp8_is_nan(a[6:0]) || fp8_is_nan(b[6:0])) return FP8_QNAN;
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
        logic [3:0] encoded;
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
            encoded = 4'(exponent + 7'sd7);
            return {sign, encoded[3:0], rounded[2:0]};
        end
    endfunction

    function automatic fp8_type fp8_mul(input fp8_type a, b);
        logic [3:0] ma, mb;
        logic [7:0] product;
        logic signed [6:0] ea, eb;
        begin
            if (fp8_is_nan(a[6:0]) || fp8_is_nan(b[6:0])) return FP8_QNAN;
            ma = {(a[6:3] != 0), a[2:0]};
            mb = {(b[6:3] != 0), b[2:0]};
            ea = (a[6:3] == 0) ? -7'sd9 : $signed({3'b0, a[6:3]}) - 7'sd10;
            eb = (b[6:3] == 0) ? -7'sd9 : $signed({3'b0, b[6:3]}) - 7'sd10;
            product = ma * mb;
            return fp8_pack8(a[7] ^ b[7], product, ea + eb);
        end
    endfunction
