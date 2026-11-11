`ifndef MEM_DEFS_VH
`define MEM_DEFS_VH

`define MEM_ADDR_WIDTH   25
// Byte addresses in the shared QSPI address space.
`define FLASH_BASE_ADDR   25'h0000000
`define PSRAM_A_BASE_ADDR 25'h1000000
`define PSRAM_B_BASE_ADDR 25'h1800000

// Initial logical mapping: one PSRAM chip for each operand kind.
// Match address[24:23]; the lower 23 bits select a byte within that chip.
`define SRAM_REGION_MASK 25'h1800000
`define WEIGHT_BASE_ADDR `PSRAM_A_BASE_ADDR
`define UNIFIED_BASE_ADDR `PSRAM_B_BASE_ADDR

`endif
