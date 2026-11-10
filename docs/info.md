## How it works

Two-lane FP8 E4M3FN accelerator with external QSPI PSRAM and 64-bit UART jobs.
No on-chip SRAM macros are instantiated. Products, accumulation, activation
results and stored elements use FP8. The core clock is 10 MHz and QSPI SCK is
5 MHz. UART is 8N1, approximately 115200 baud (87 clocks per bit).

UART RX is ui[3], TX is uo[4]. The chip sends READY byte 0x01 once for each
available instruction slot; the host then sends exactly eight bytes, least
significant byte first. READY is admission credit, not job completion.
uo[0] reports sequencer ready, uo[1] pulses on completion, and uo[2] reports
invalid-job error until another job is accepted. Reset discards queued jobs.

The QSPI Pmod uses uio[0] Flash CS_n, uio[1:2] DQ0/1, uio[3] SCK,
uio[4:5] DQ2/3, uio[6] PSRAM A CS_n, uio[7] PSRAM B CS_n.
PSRAM A holds matrix weights; PSRAM B holds inputs, vector operands and outputs.
The current host jobs assume memories have been populated externally. Automatic
Flash staging, host data-upload commands and result-download commands are not
implemented in this checkpoint.

## Job formats

Matrix jobs compute C[M,N] = activation(A[M,K] * B[K,N]). Bit 63 is zero;
bit 62 enables B-zero skipping; bits 61:60 select activation; bits 59:52,
51:44 and 43:36 encode M, K and N (1..255). Bits 35:24, 23:12 and 11:0
are A, B and C byte offsets from the bases in src/defs/micro_defs.vh.
Storage is column-major with each column padded to an even byte count.

Vector jobs set bit 63. Bit 62 enables sparse multiplication; bits 61:60
are zero; bits 59:52 encode length; bits 51:50 select ADD, SUB (A-B), MUL
or PASS(B). Bits 49:47 select activation and bits 46:36 are zero.
Offsets occupy the same low 36 bits, all relative to PSRAM B.
Output storage must not overlap inputs. Odd lengths require padding storage.

Activation codes are 0 NONE, 1 ReLU, 2 hard sigmoid, 3 hard tanh and 4 STEP.
Matrix jobs can apply STEP with a following vector PASS job.

## How to test

Run bash test/check_import.sh for unit tests and complete UART/QSPI pin-level
integration. Run make -C test for the RTL/GL-compatible UART admission smoke test.

bash test/run_egru_layer.sh uses the local MAZE dataset for an actual EGRU first
timestep, comparing all intermediates against an independent FP8 oracle.
python3 test/evaluate_egru_accuracy.py evaluates three full trials in software.
These dataset-dependent tests are optional and do not run in GitHub CI.

src/sources.f lists editable RTL. scripts/generate_verilog.py uses sv2v 0.0.13
to produce src/generated/design.v, which Tiny Tapeout synthesizes. Regenerate it
after RTL changes; CI checks that it matches the source.

## External hardware

QSPI Flash plus two PSRAM chips on a compatible Pmod. The current Flash controller
assumes the board has prepared the required Flash configuration; see qspi_ctrl.v.
This is a development checkpoint, not a complete standalone inference system.
