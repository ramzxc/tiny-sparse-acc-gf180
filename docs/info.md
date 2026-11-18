## Overview

A single-lane FP8 E4M3FN accelerator. The current build integrates a hardened core generated from the rebuild RTL in
`src/rtl`, with no micro controller or on-chip SRAM macro.
Clock: 10 MHz. QSPI SCK: 5 MHz. External devices follow the TinyQV Pmod pinout.

## How to test

Send each 16-bit instruction as two UART bytes, least-significant byte first,
8N1, approximately 115200 baud (87 clocks per bit at 10 MHz).
Wait for one READY byte (0x01) before sending each instruction.

The host sets a 24-bit byte address using two 12-bit ADDR instructions.
DATA LOAD selects input/weight and dense/sparse mode; MEM READ fetches the
operand. EXEC performs ADD/SUB/MUL plus activation. Accumulation is supported
for MUL only. DATA STORE snapshots the result, then MEM WRITE stores it.
Use SYNC before consuming a pending read/result. The host schedules loops.

Sparse mode records whether the input vector is zero and skips subsequent
sparse weight reads until the input changes. There is no compressed storage.

See [Architecture and ISA](architecture.md) for bit fields and instruction presets.
Run `bash test/check_import.sh` for arithmetic, QSPI, UART and vector tests.
Actions runs pin-level RTL/GL tests, GDS generation and Tiny Tapeout precheck.

## IO

| Signal | Pin |
|---|---|
| UART RX | ui_in[3] |
| UART TX / READY | uo_out[4] |
| Decoder ready (not a job-completion signal) | uo_out[0] |
| Flash CS_n | uio[0] |
| QSPI DQ0 / DQ1 | uio[1] / uio[2] |
| QSPI clock | uio[3] |
| QSPI DQ2 / DQ3 | uio[4] / uio[5] |
| PSRAM A / B CS_n | uio[6] / uio[7] |

## External hardware

QSPI Flash and PSRAM Pmod. Flash writes require erased storage and the supported
quad-mode setup; this interface does not provide a general erase command.

The current rebuild core GDS, LEF and netlists are packaged in
`macro/tiny_sparse_acc_core/`. Actions implements the surrounding wrapper. Earlier experiments are in [Development history](archive/history.md).
