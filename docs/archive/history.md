# Development history

This file preserves earlier interfaces and experiment results. It is not the
interface specification for the current submitted core; see [the current design](../info.md).

## Earlier 64-bit micro mode

In micro mode, the host sends a matrix/vector job and `micro_ctrl` generates
low-level memory and execution instructions. The current **direct** build omits
this sequencer: the host sends 16-bit instructions instead. The eight-byte
protocol, job status pins and job formats below apply only to the earlier mode.
`micro_ctrl.v` and `micro_defs.vh` remain as optional sources, not instantiated
logic in the current core. Selecting another RTL mode does not replace the
already packaged ICC2 GDS; that requires a new implementation and export.

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
are A, B and C byte offsets from the bases in src/rtl/defs/micro_defs.vh.
Storage is packed column-major, one byte per element, with no padding.

Vector jobs set bit 63. Bit 62 enables sparse multiplication; bits 61:60
are zero; bits 59:52 encode length; bits 51:50 select ADD, SUB (A-B), MUL
or PASS(B). Bits 49:47 select activation and bits 46:36 are zero.
Offsets occupy the same low 36 bits, all relative to PSRAM B.
Output storage must not overlap inputs. Odd lengths and odd byte addresses are supported.

Activation codes are 0 NONE, 1 ReLU, 2 hard sigmoid, 3 hard tanh and 4 STEP.
Matrix jobs can apply STEP with a following vector PASS job.

## Earlier optimization notes

- The UART instruction format was reduced from four bytes to two. Address
  setup was split into LOW/HIGH commands while retaining 25-bit byte addresses.
- The datapath was reduced from two lanes to one. Transfers now carry one byte
  per element; old two-element memory layouts are incompatible.
- Operand addresses are held by `mem_ctrl` through transaction completion.
  QSPI selects address bits/nibbles directly instead of keeping another address
  shift register, and shares its data shift register with the read result.
- FP8 arithmetic was replaced by signed fixed8 to reduce cell area. FP8 helper
  code is retained for historical numerical comparisons only.
- An RTL-only Actions comparison was pushed as commit `9108d16`. The main build
  subsequently returned to the manually placed-and-routed ICC2 core.

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
After changing defs, regenerate `src/rtl/generated/design.v` before synthesis/push.
