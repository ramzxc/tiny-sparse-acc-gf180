`ifndef INST_DEFS_VH
`define INST_DEFS_VH

// opcode
`define OPCODE_NOP    3'b000
`define OPCODE_ADDR   3'b001
`define OPCODE_MEM    3'b010
`define OPCODE_EXEC   3'b011
`define OPCODE_DATA   3'b100
`define OPCODE_SYNC   3'b111

// opcode: nop
`define NOP 16'b0000000000000000

// opcode: addr
`define ADDR_LOW  1'b0
`define ADDR_HIGH 1'b1

// opcode: mem
`define MEM_READ  1'b0
`define MEM_WRITE 1'b1

// opcode: execute -> VPU
`define VPU_ADD 2'b00
`define VPU_SUB 2'b01
`define VPU_MUL 2'b10

`define VPU_OVERWRITE  1'b0
`define VPU_ACCUMULATE 1'b1

// opcode: execute -> ACT
`define ACT_NOP     3'b000
`define ACT_RELU    3'b001
`define ACT_TANH    3'b010
`define ACT_SIGMOID 3'b011
`define ACT_STEP    3'b100

// opcode: DATA
`define DATA_LOAD  1'b0 // load data for exec_unit
`define DATA_STORE 1'b1 // store to SRAM

`define DATA_DENSE 1'b0
`define DATA_SPARSE 1'b1

`define DATA_INPUT  1'b0
`define DATA_WEIGHT 1'b1

// opcode: SYNC
`define SYNC 16'b1111111111111111

// INST PRESET: complete 16-bit instructions.
// ADDR arguments must be 12 bits (for example, 12'h123).
// These layouts define the new ISA; the decoder must use the same fields.

// NOP / SYNC
`define INST_NOP  `NOP
`define INST_SYNC `SYNC

// ADDR: [15:13] opcode, [12] low/high, [11:0] address fragment
`define INST_ADDR_LOW(addr)  {`OPCODE_ADDR, `ADDR_LOW,  (addr)}
`define INST_ADDR_HIGH(addr) {`OPCODE_ADDR, `ADDR_HIGH, (addr)}

// MEM: [15:13] opcode, [12] read/write, [11:10] device, [9:0] reserved.
// Device: 00=Flash, 10=PSRAM A, 11=PSRAM B (see mem_defs.vh).
`define INST_MEM_READ_DEVICE(dev)  {`OPCODE_MEM, `MEM_READ,  (dev), 10'b0}
`define INST_MEM_WRITE_DEVICE(dev) {`OPCODE_MEM, `MEM_WRITE, (dev), 10'b0}
`define INST_MEM_READ  `INST_MEM_READ_DEVICE(2'b00)
`define INST_MEM_WRITE `INST_MEM_WRITE_DEVICE(2'b00)

// EXEC: VPU and ACT travel together in one instruction.
// [15:13] opcode, [12] accumulate, [11:10] VPU operation,
// [9:7] activation, [6:0] reserved.
// ACT_NOP passes the VPU result through without activation.
// Arguments must be 1-bit accumulate, 2-bit VPU op and 3-bit ACT op.
`define INST_EXEC(acc, vpu, act) {`OPCODE_EXEC, (acc), (vpu), (act), 7'b0}

// Accumulation is supported for MUL only.

// ADD with overwrite
`define INST_EXEC_ADD_NOP              `INST_EXEC(`VPU_OVERWRITE, `VPU_ADD, `ACT_NOP)
`define INST_EXEC_ADD_RELU             `INST_EXEC(`VPU_OVERWRITE, `VPU_ADD, `ACT_RELU)
`define INST_EXEC_ADD_TANH             `INST_EXEC(`VPU_OVERWRITE, `VPU_ADD, `ACT_TANH)
`define INST_EXEC_ADD_SIGMOID          `INST_EXEC(`VPU_OVERWRITE, `VPU_ADD, `ACT_SIGMOID)
`define INST_EXEC_ADD_STEP             `INST_EXEC(`VPU_OVERWRITE, `VPU_ADD, `ACT_STEP)

// SUB with overwrite
`define INST_EXEC_SUB_NOP              `INST_EXEC(`VPU_OVERWRITE, `VPU_SUB, `ACT_NOP)
`define INST_EXEC_SUB_RELU             `INST_EXEC(`VPU_OVERWRITE, `VPU_SUB, `ACT_RELU)
`define INST_EXEC_SUB_TANH             `INST_EXEC(`VPU_OVERWRITE, `VPU_SUB, `ACT_TANH)
`define INST_EXEC_SUB_SIGMOID          `INST_EXEC(`VPU_OVERWRITE, `VPU_SUB, `ACT_SIGMOID)
`define INST_EXEC_SUB_STEP             `INST_EXEC(`VPU_OVERWRITE, `VPU_SUB, `ACT_STEP)

// MUL with overwrite
`define INST_EXEC_MUL_NOP              `INST_EXEC(`VPU_OVERWRITE, `VPU_MUL, `ACT_NOP)
`define INST_EXEC_MUL_RELU             `INST_EXEC(`VPU_OVERWRITE, `VPU_MUL, `ACT_RELU)
`define INST_EXEC_MUL_TANH             `INST_EXEC(`VPU_OVERWRITE, `VPU_MUL, `ACT_TANH)
`define INST_EXEC_MUL_SIGMOID          `INST_EXEC(`VPU_OVERWRITE, `VPU_MUL, `ACT_SIGMOID)
`define INST_EXEC_MUL_STEP             `INST_EXEC(`VPU_OVERWRITE, `VPU_MUL, `ACT_STEP)

// MUL with accumulation
`define INST_EXEC_MUL_ACC_NOP          `INST_EXEC(`VPU_ACCUMULATE, `VPU_MUL, `ACT_NOP)
`define INST_EXEC_MUL_ACC_RELU         `INST_EXEC(`VPU_ACCUMULATE, `VPU_MUL, `ACT_RELU)
`define INST_EXEC_MUL_ACC_TANH         `INST_EXEC(`VPU_ACCUMULATE, `VPU_MUL, `ACT_TANH)
`define INST_EXEC_MUL_ACC_SIGMOID      `INST_EXEC(`VPU_ACCUMULATE, `VPU_MUL, `ACT_SIGMOID)
`define INST_EXEC_MUL_ACC_STEP         `INST_EXEC(`VPU_ACCUMULATE, `VPU_MUL, `ACT_STEP)

// DATA: [15:13] opcode, [12] load/store, [11] dense/sparse,
//       [10] input/weight (LOAD only). Legacy presets use vector mode.
// Scalar mode: cur starts at bit 9; the next bit enables broadcast.
// For 1/2 lanes: [9] cur, [8] scalar, [7:0] reserved.
`define INST_DATA(mode, sparse, target) {`OPCODE_DATA, (mode), (sparse), (target), 10'b0}
`define INST_DATA_LOAD_INPUT_DENSE  `INST_DATA(`DATA_LOAD, `DATA_DENSE,  `DATA_INPUT)
`define INST_DATA_LOAD_INPUT_SPARSE `INST_DATA(`DATA_LOAD, `DATA_SPARSE, `DATA_INPUT)
`define INST_DATA_LOAD_WEIGHT_DENSE `INST_DATA(`DATA_LOAD, `DATA_DENSE,  `DATA_WEIGHT)
`define INST_DATA_LOAD_WEIGHT_SPARSE `INST_DATA(`DATA_LOAD, `DATA_SPARSE, `DATA_WEIGHT)
`define INST_DATA_STORE             `INST_DATA(`DATA_STORE, `DATA_DENSE, `DATA_INPUT)

// Cast cur so unsized arguments cannot change the instruction width.
`define INST_DATA_SCALAR(sparse, target, cur) {`OPCODE_DATA, `DATA_LOAD, (sparse), (target), `CUR_WIDTH'(cur), 1'b1, {(9-`CUR_WIDTH){1'b0}}}
`define INST_DATA_WEIGHT_SCALAR(cur) `INST_DATA_SCALAR(`DATA_DENSE, `DATA_WEIGHT, cur)
`define INST_DATA_WEIGHT_SCALAR_SPARSE(cur) `INST_DATA_SCALAR(`DATA_SPARSE, `DATA_WEIGHT, cur)

`endif
