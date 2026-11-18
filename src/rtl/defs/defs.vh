`ifndef ACC_DEFS_VH
`define ACC_DEFS_VH

`ifndef DATA_WIDTH
`define DATA_WIDTH 8
`endif
`ifndef COMPUTE_WIDTH
`define COMPUTE_WIDTH 1
`endif

// FP8 E4M3FN: sign=1, exponent=4, mantissa=3; exponent bias=7.
// Round to nearest, ties to even. Finite overflow saturates to +/-448.
// UART directly accepts one 16-bit instruction, low byte first.
`define INST_WIDTH 16
`define INST_OP_WIDTH 3
`define INST_PAYLOAD_WIDTH 13

// Decoder outputs: packed EXEC fields and full ADDR/MEM/DATA word.
`define EXEC_INST_WIDTH 6
`define DATA_INST_WIDTH 16

// DATA scalar selector: at least one bit, including a single-lane build.
`define CUR_WIDTH ((`COMPUTE_WIDTH > 1) ? $clog2(`COMPUTE_WIDTH) : 1)

`endif
