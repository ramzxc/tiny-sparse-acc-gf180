`ifndef MICRO_DEFS_VH
`define MICRO_DEFS_VH

`define MICRO_DIM_WIDTH 8

// External job: C[M,N] = activation(A[M,K] * B[K,N]).
// N=1 is a matrix-vector product; all N columns use the same algorithm.
// 64-bit word, transmitted as eight UART bytes, least-significant byte first.
// Matrix [63]=0, [62] sparse, [61:60] activation,
// [59:52] M, [51:44] K, [43:36] N,
// [35:24] weight offset, [23:12] input offset, [11:0] output offset.
`define HOST_SPARSE_BIT 62
`define HOST_ACT_MSB 61
`define HOST_ACT_LSB 60
`define HOST_M_MSB 59
`define HOST_M_LSB 52
`define HOST_K_MSB 51
`define HOST_K_LSB 44
`define HOST_N_MSB 43
`define HOST_N_LSB 36
`define HOST_WEIGHT_MSB 35
`define HOST_WEIGHT_LSB 24
`define HOST_INPUT_MSB 23
`define HOST_INPUT_LSB 12
`define HOST_OUTPUT_MSB 11
`define HOST_OUTPUT_LSB 0

// Compile-time byte bases; offsets specify starting addresses (0..4095 bytes).
// These defaults use PSRAM, not Flash. Automatic Flash staging is not implemented.
`define HOST_WEIGHT_BASE `WEIGHT_BASE_ADDR
`define HOST_INPUT_BASE  `UNIFIED_BASE_ADDR
`define HOST_OUTPUT_BASE `UNIFIED_BASE_ADDR

// Packed column-major bytes: A/C column stride = M; B column stride = K.
// Dimensions are 1..255. No bias. Odd addresses need no padding.
// B and C storage ranges must not overlap.
// sparse treats FP8 +0/-0 as absent terms even if the skipped weight is NaN.
// Vector [63]=1. [62]=sparse MUL, [61:60]=0, [59:52]=length,
// [51:50]=operation, [49:47]=activation(0..4), [46:36]=0.
// Low 36 bits remain A/B/C byte offsets. All three vector bases use Unified.
// ADD/SUB/MUL are elementwise; PASS copies B and applies activation without A.
`define HOST_VECTOR_BIT 63
`define HOST_VEC_OP_MSB 51
`define HOST_VEC_OP_LSB 50
`define HOST_VEC_ACT_MSB 49
`define HOST_VEC_ACT_LSB 47
`define HOST_VEC_A_BASE `UNIFIED_BASE_ADDR
`define VEC_ADD 2'd0
`define VEC_SUB 2'd1
`define VEC_MUL 2'd2
`define VEC_PASS 2'd3
// Matrix activation field remains 2 bits; STEP can be applied by vector PASS.
`endif
