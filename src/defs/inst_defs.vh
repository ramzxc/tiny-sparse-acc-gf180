`ifndef INST_DEFS_VH
`define INST_DEFS_VH

// 32-bit ISA: [31:25] opcode, [24:0] payload.
// SRC/DST address registers belong to mem_ctrl; SET commands carry a byte address.
// Weight and unified memory are selected by address, not by separate opcodes.
`define FLASH_TO_SRAM 7'd0
`define SRAM_TO_VPU   7'd1
`define ACT_TO_SRAM   7'd2
`define SRAM_TO_FLASH 7'd3
`define SET_SRC       7'd4
`define SET_DST       7'd5
`define EXECUTE       7'd32
`define ACC_CLEAR     7'd33
`define ACTIVATE      7'd34
`define VECTOR_PASS   7'd35
`define EXE_SYNC      7'd124
`define MEM_SYNC      7'd125
`define INST_NOP      7'd126

// Compact mem_ctrl command: [27:25] action, [24:0] address.
// Address is used only by SET_SRC/SET_DST. Transfers use saved SRC/DST.
`define MEM_INST_WIDTH 28
`define MEM_CMD_FLASH_TO_SRAM 3'd0
`define MEM_CMD_SRAM_TO_VPU   3'd1
`define MEM_CMD_ACT_TO_SRAM   3'd2
`define MEM_CMD_SRAM_TO_FLASH 3'd3
`define MEM_CMD_SET_SRC       3'd4
`define MEM_CMD_SET_DST       3'd5
`define MEM_INST_OP_MSB 27
`define MEM_INST_OP_LSB 25

// EXECUTE payload: [6] sparse MUL, [5:3] activation, [2] accumulate,
// [1:0] arithmetic operation. Instruction payload[24:7] is reserved.
// MUL: accumulate=0 replaces result_data; accumulate=1 adds the old result.
// ADD/SUB/RSUB ignore accumulate and always replace result_data.
// Activation is part of Execute. Datapath/operand details belong to exe_ctrl.
`define EXE_INST_WIDTH 9
// Decoder-only mode bits; low seven bits carry the execution payload.
`define EXE_MODE_MSB 8
`define EXE_MODE_LSB 7
`define EXE_MODE_COMPUTE 2'd0
`define EXE_MODE_CLEAR 2'd1
`define EXE_MODE_ACTIVATE 2'd2
`define EXE_MODE_INPUT 2'd3
`define EXE_SPARSE_BIT 6
`define EXE_OP_MSB 1
`define EXE_OP_LSB 0
`define EXE_ACC_BIT 2
`define EXE_ACT_MSB 5
`define EXE_ACT_LSB 3
`define EXE_OP_ADD 2'd0
`define EXE_OP_SUB 2'd1
`define EXE_OP_MUL 2'd2
// Internal reverse subtraction: weight - input (external vector A - B).
`define EXE_OP_RSUB 2'd3
`define ACT_NONE    3'd0
`define ACT_RELU    3'd1
`define ACT_SIGMOID 3'd2
`define ACT_TANH    3'd3
`define ACT_STEP    3'd4

// SRAM_TO_VPU: payload[0]=scalar broadcast, payload[1]=select high byte.
// For scalar loads SRC is an aligned Unified address; both lanes receive x[k].
`define MEM_SCALAR_BIT 0
`define MEM_HIGH_BYTE_BIT 1
// Route a Unified read into the weight register for vector operand A.
`define MEM_FORCE_WEIGHT_BIT 2

// Software must synchronize accesses to shared input/result registers.
// Example: SRAM_TO_VPU, MEM_SYNC, EXECUTE, EXE_SYNC, ACT_TO_SRAM,
//          MEM_SYNC before another Execute may overwrite the saved result.
`endif
