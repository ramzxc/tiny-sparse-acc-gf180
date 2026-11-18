`ifndef MEM_DEFS_VH
`define MEM_DEFS_VH

// A device-local byte address, independent of chip selection.
`define MEM_ADDR_WIDTH 24
`define MEM_DEVICE_WIDTH 2
`define MEM_FLASH   2'b00
`define MEM_PSRAM_A 2'b10
`define MEM_PSRAM_B 2'b11

`endif
