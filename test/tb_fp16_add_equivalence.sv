// Test-only reference: preserves the old wide implementation for bitwise comparison.
module tb_fp16_narrow;
import tpu_pkg::*;
    function automatic fp16_type reference_pack(
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
            reference_pack = {sign, 15'h0000};
        end
        else begin
            msb = -1;
            for (int i = 63; i >= 0; i--) begin
                if ((msb < 0) && magnitude[i])
                    msb = i;
            end

            exp_unbiased = msb + scale;

            if (exp_unbiased > 15) begin
                reference_pack = {sign, 5'h1F, 10'h000};
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
                    reference_pack = {sign, 5'h1F, 10'h000};
                end
                else begin
                    exp_field = exp_unbiased + 15;
                    reference_pack = {
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
                    reference_pack = {sign, 5'h01, 10'h000};
                else
                    reference_pack = {sign, 5'h00, frac_value[9:0]};
            end
        end
    end
    endfunction
    function automatic fp16_type reference_add(
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
            reference_add = FP16_QNAN;
        end
        else if ((exp_a == 5'h1F) && (exp_b == 5'h1F) && (sign_a != sign_b)) begin
            reference_add = FP16_QNAN;
        end
        else if (exp_a == 5'h1F) begin
            reference_add = {sign_a, 5'h1F, 10'h000};
        end
        else if (exp_b == 5'h1F) begin
            reference_add = {sign_b, 5'h1F, 10'h000};
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

            reference_add = reference_pack(sign_r, magnitude, common_scale);
        end
    end
    endfunction
logic [15:0] edge_values [0:23];
logic [31:0] rng = 32'h81234567;
int count = 0;
task automatic check(input logic [15:0] a, b);
 logic [15:0] actual, expected;
 actual = fp16_add(a,b); expected = reference_add(a,b);
 if (actual !== expected) $fatal(1,"mismatch a=%h b=%h actual=%h expected=%h",a,b,actual,expected);
 count++;
endtask
initial begin
 edge_values = '{16'h0000,16'h8000,16'h0001,16'h8001,16'h03ff,16'h83ff,
                 16'h0400,16'h8400,16'h0401,16'h8401,16'h3c00,16'hbc00,
                 16'h3bff,16'hbbff,16'h3c01,16'hbc01,16'h7bff,16'hfbff,
                 16'h7c00,16'hfc00,16'h7e00,16'hfe00,16'h3555,16'hb555};
 for(int a=0;a<65536;a++) begin
  for(int j=0;j<24;j++) begin check(16'(a),edge_values[j]); check(edge_values[j],16'(a)); end
  check(16'(a),16'(a)^16'h8000);
  check(16'(a),(16'(a)+16'd1)^16'h8000);
 end
 for(int i=0;i<2000000;i++) begin
  rng = rng ^ (rng << 13); rng = rng ^ (rng >> 17); rng = rng ^ (rng << 5);
  check(rng[15:0],rng[31:16]);
 end
 $display("FP16 NARROW PASS: %0d comparisons",count);$finish;
end
endmodule
