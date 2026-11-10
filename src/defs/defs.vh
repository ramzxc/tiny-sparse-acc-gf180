`ifndef ACC_DEFS_VH
`define ACC_DEFS_VH

`define DATA_WIDTH 8
`define COMPUTE_WIDTH 2

// External job: 64 bits, UART sends eight bytes, low byte first.
`define HOST_INST_WIDTH 64

// Internal instruction: [31:25] opcode, [24:0] payload.
`define INST_WIDTH 32
`define INST_OP_WIDTH 7
`define INST_PAYLOAD_WIDTH 25

`endif
