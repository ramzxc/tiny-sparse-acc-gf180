## Current build variant

The Actions build currently selects `direct` in src/build_mode.txt. UART accepts
two little-endian bytes per READY credit, carrying the internal 16-bit ISA.
Normal instructions use opcode[15:9] (0..63) and payload[8:0].
Address instructions use command[15:13] (4..7) and fragment[12:0].
micro_ctrl is omitted. This format is incompatible with the old four-byte stream.

| Address command | [15:13] | Updated bits |
| --- | --- | --- |
| SET_SRC_LO | 4 | SRC[12:0] |
| SET_DST_LO | 5 | DST[12:0] |
| SET_SRC_HI | 6 | SRC[24:13] from payload[11:0] |
| SET_DST_HI | 7 | DST[24:13] from payload[11:0] |

SRC/DST remain 25-bit absolute byte addresses, including memory selection.
Each half preserves the other half; HIGH payload[12] is ignored.
There is no extra base register or base-plus-offset adder. Set both halves before
a transfer, or update only the changed half. Address updates wait for mem_rdy.
EXE_SYNC/MEM_SYNC/NOP opcodes are now 60/61/62; other normal opcodes are unchanged.
For example PSRAM A address 0x1000020 in SRC is encoded as words 0x8020, 0xC800
(UART bytes 20 80, then 00 C8, each word requiring its own READY credit).

The host supplies address setup, transfers, execution and EXE_SYNC/MEM_SYNC.
Done/error outputs are tied low because this mode has no high-level job boundary.
VPU, activation and PSRAM operations use one signed fixed8 element per request.
The single VPU lane has one signed multiplier and one adder; each instruction
produces its result on the accepting clock edge. Simultaneous operand updates
use the previous operand values for that instruction. Only MUL supports
accumulation; ADD/SUB/RSUB ignore the accumulate bit.

`FIXED_FRAC_BITS` in `src/defs/defs.vh` is a compile-time setting from 1 to 6.
Real value = signed(byte) / 2**FIXED_FRAC_BITS. The default is 4: range
-8 through 7.9375, resolution 0.0625. No runtime format register or new opcode.
All operands, accumulator and activation results use the same scale. The
16-bit product is combinational only; it does not widen registers or memory.
Multiplication rescales with nearest rounding (ties toward positive infinity),
then adds the old accumulator if enabled, and saturates once to [-128,127].
ADD/SUB/RSUB saturate too. There is no wraparound, NaN or negative zero.
Software must re-encode FP8 model data before using this design.

Activation registers one result per accepting edge: NONE, ReLU, hard sigmoid
(clamp(x/4 + 0.5, 0, 1), nearest rounding), hard tanh (clamp(x,-1,1)), and STEP
(x>0). The top holds exe_rdy low until activation completes.
`bash test/run_fixed8.sh` checks every operand pair for ADD/SUB/RSUB/MUL/MAC
at all six supported fractional widths, plus all activation byte inputs.
The FP8 reference/helper remains only for historical numerical comparisons.

Memory addresses are stored only in mem_ctrl and held until transfer completion.
mem_ctrl states directly identify read/write/copy dispatch and read/other
completion waits, without a separate saved command. Address-half writes use
shared reset-masked data. Request and completion timing remain unchanged.
mem_itf captures direct write data and COPY readback but uses SRC/DST directly.
QSPI also borrows this held address: req_addr must remain stable from request
acceptance through read_data_val, including Flash status polling and retries.
It selects address bits/nibbles using the existing counter instead of a 24-bit
address shift register. Flash and PSRAM share the address nibble selector;
Flash selects one bit from that nibble while PSRAM outputs all four bits.
Commands are selected similarly, without an 8-bit
command shift register. req_write and req_data are still captured on acceptance.
Simulation checks enforce the address-hold contract. VPU is unchanged by this
QSPI optimization.
QSPI exposes its 8-bit data shift register as the read result, valid from
read completion until the next transaction is accepted. mem_itf forwards that
result on read_data_val; consumers must not use it as persistent storage during
later transfers. Each memory payload now occupies two QSPI clocks (one byte);
command, address, dummy and Flash status-poll protocols are unchanged.

The instruction FIFO has one waiting slot. UART RX assembles the two-byte
words by shifting; UART TX generates the unchanged READY=0x01 frame directly.

Sparse weight-fetch skipping and matrix loops must be managed by the host.
Low-level Flash transfers remain reachable through the internal ISA.

Set src/build_mode.txt to `micro` and regenerate Verilog to restore the 64-bit
job interface described below. `bash syn/run_synth.sh micro` and
`bash syn/run_synth.sh direct` independently select the DC comparison variant;
`--check` validates paths without running DC. Reports are written under
syn/runs/<variant>/<run>/reports, including module_area.csv and area.rpt.
The DC constraints retain the earlier board-delay assumptions and are not
external-memory timing signoff. GF180_STD_DB overrides the local library path.

## How it works

Single-lane signed fixed8 accelerator with external QSPI PSRAM and 64-bit UART jobs.
No on-chip SRAM macros are instantiated. Products, accumulation, activation
results and stored elements use fixed8. The core clock is 10 MHz and QSPI SCK is
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
Storage is packed column-major, one byte per element, with no padding.

Vector jobs set bit 63. Bit 62 enables sparse multiplication; bits 61:60
are zero; bits 59:52 encode length; bits 51:50 select ADD, SUB (A-B), MUL
or PASS(B). Bits 49:47 select activation and bits 46:36 are zero.
Offsets occupy the same low 36 bits, all relative to PSRAM B.
Output storage must not overlap inputs. Odd lengths and odd byte addresses are supported.

Activation codes are 0 NONE, 1 ReLU, 2 hard sigmoid, 3 hard tanh and 4 STEP.
Matrix jobs can apply STEP with a following vector PASS job.

## How to test

Run bash test/check_import.sh for unit tests and complete UART/QSPI pin-level
integration. Run make -C test for the RTL/GL-compatible UART admission smoke test.

bash test/run_egru_layer.sh uses the local MAZE dataset for an actual EGRU first
timestep, comparing all intermediates against an independent fixed8 oracle.
python3 test/evaluate_egru_accuracy.py evaluates three full trials in software.
These dataset-dependent tests are optional and do not run in GitHub CI.

src/sources.f lists editable RTL. scripts/generate_verilog.py uses sv2v 0.0.13
to produce src/generated/design.v, which Tiny Tapeout synthesizes. Regenerate it
after RTL changes; CI checks that it matches the source.

## External hardware

QSPI Flash plus two PSRAM chips on a compatible Pmod. The current Flash controller
assumes the board has prepared the required Flash configuration; see qspi_ctrl.v.
This is a development checkpoint, not a complete standalone inference system.

## Historical single-lane FP8 area experiment

At 10 MHz with the same GF180 DC flow, total cell area decreased from
45,157.46 to 35,142.96 um² (10,014.50 um² / 22.2%). This exceeds the
1,000 um² retention threshold. QSPI reads/writes and COPY now transfer one
byte, and host software must issue one operation per element rather than
per pair. UART instructions remained 16 bits in that experiment.
This is synthesis area, not a completed placement/routing result.

## Fixed-point area experiment

Same Synopsys/GF180/10 MHz synthesis: FP8 single lane 35,142.96 um² ->
fixed8 (4 fractional bits) 32,497.74 um², saving 2,645.22 um² (7.5%).
VPU: 10,528.18 -> 8,725.92; activation: 2,307.16 -> 1,464.20 um².
These are cell areas, not an Actions placement/routing pass or a 70% density guarantee.

For a fast numerical comparison on the actual maze EGRU export, run:

```sh
python3 test/compare_fixed8_egru.py --output /tmp/fixed8-comparison.json
bash test/run_egru_layer.sh
```

The comparison sweeps fractional widths 1..6 against floating arithmetic on
fixed16-exported weights/input, using the same hard activations. It covers the
first timestep with initial state zero, not recurrent sequence or FC/label accuracy.
For the default F=4, this sample gives h R²=99.35%, y R²=99.55%, and event
agreement=99.61%. These figures do not establish full-network task accuracy.
After changing defs, regenerate `src/generated/design.v` before synthesis/push.
