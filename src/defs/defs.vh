`ifndef ACC_DEFS_VH
`define ACC_DEFS_VH

`define DATA_WIDTH 8
`define COMPUTE_WIDTH 1

// External job: 64 bits, UART sends eight bytes, low byte first.
`define HOST_INST_WIDTH 64

// Normal: opcode[15:9], payload[8:0]. Address: command[15:13], fragment[12:0].
`define INST_WIDTH 16
`define INST_OP_WIDTH 7
`define INST_PAYLOAD_WIDTH 9

`endif
