`ifndef ACC_DEFS_VH
`define ACC_DEFS_VH

`define DATA_WIDTH 8
`define COMPUTE_WIDTH 1

// Signed 8-bit fixed point: real value = signed(byte) / 2**FIXED_FRAC_BITS.
// Compile-time setting, 1..6. Default: -8 .. 7.9375 in steps of 1/16.
`ifndef FIXED_FRAC_BITS
`define FIXED_FRAC_BITS 4
`endif

// External job: 64 bits, UART sends eight bytes, low byte first.
`define HOST_INST_WIDTH 64

// Normal: opcode[15:9], payload[8:0]. Address: command[15:13], fragment[12:0].
`define INST_WIDTH 16
`define INST_OP_WIDTH 7
`define INST_PAYLOAD_WIDTH 9

`endif
