## Overview

A single-lane FP8 E4M3FN accelerator with UART instruction input and external
QSPI Flash / PSRAM. The core clock is 10 MHz; QSPI SCK is 5 MHz. No on-chip SRAM
macros are used. Operands and results are stored in registers or external PSRAM.

The current design uses **direct mode**: the PC sends low-level 16-bit
instructions for address setup, memory transfers, arithmetic and synchronization.
The PC constructs matrix loops and schedules operations; there is no on-chip
high-level job sequencer (`micro_ctrl`) in this build. This reduces hardware area.

The current Tiny Tapeout build integrates the manually placed-and-routed ICC2
core as a hard macro. Actions places and routes the surrounding wrapper; it does
not re-synthesize or re-route the core. Editable RTL remains available for
simulation and future implementation. Earlier micro-mode interfaces and numerical
experiments are documented separately in [Development history](archive/history.md).

## Data flow

```text
PC UART -> uart_rx -> inst_fifo -> decoder
                                    |-> mem_ctrl -> mem_itf -> qspi_ctrl -> Flash / PSRAM
                                    |      |                         |
                                    |      +<- read data <------------+
                                    |      +-> VPU operand registers
                                    +-> vpu -> act -> mem_ctrl -> PSRAM

inst_fifo READY request -> uart_tx -> PC UART
```

The FIFO holds one waiting instruction. The decoder dispatches its head when the
relevant memory or execution path is ready, without storing another instruction.
Memory and execution can progress independently; software must synchronize shared
operand/result accesses. VPU weight and input registers retain their values until
updated. The VPU result register is also the accumulator; activation has a
separate result register used by memory stores.

A typical operation is: set SRC, load a weight, MEM_SYNC; set SRC, load an input,
MEM_SYNC; EXECUTE, EXE_SYNC; set DST, ACT_TO_SRAM, MEM_SYNC. Synchronize the store
before another execution can overwrite the activation result.

## Repository layout

```text
src/rtl/                         Editable accelerator RTL and generated Verilog
src/wrapper/project.v            Tiny Tapeout hard-macro wrapper
src/config.json                  Build, macro placement and PDN parameters
src/tcl/pdn.tcl                  Required macro-specific power connections
macro/tiny_sparse_acc_core/      Packaged ICC2 GDS, LEF, netlists, SPEF and metadata
scripts/                         Packaging, validation and Actions summary tools
test/                            RTL and gate-level tests
docs/info.md                    Current design and usage
docs/archive/                   Earlier interfaces and experiment records
```

`syn/`, `pnr/`, `sta/` and `sim/` are local-only workspaces excluded from Git.
The submission uses the packaged files under `macro/`, so these local workspaces
are not required by Actions. The PDN Tcl remains necessary for same-layer Metal4
macro feeds and full-height supply pins; grid parameters are in `src/config.json`.

## RTL used by the current design

Paths below are relative to `src/rtl/`.

| File | Role |
| --- | --- |
| `project.v` | Accelerator top: reset synchronization, module connections, execution completion tracking and Tiny Tapeout pin mapping. |
| `uart/uart_rx.v` | Synchronizes UART RX, receives bytes and assembles a 16-bit instruction. |
| `uart/uart_tx.v` | Sends the READY credit byte to the host. |
| `core/inst_fifo.v` | Holds one waiting instruction and advances when the decoder accepts it. |
| `core/decoder.v` | Decodes instructions, dispatches memory/execution requests and handles synchronization. |
| `core/mem_ctrl.v` | Holds SRC/DST addresses, schedules transfers and routes read data to input or weight registers. |
| `core/vpu.v` | One FP8 lane with operand registers, a multiplier, a shared adder and an accumulator/result register. |
| `core/act.v` | Applies the selected activation and registers its result. |
| `mem_itf.v` | Converts read/write/copy requests into QSPI transactions; copies read then write one byte. |
| `qspi_ctrl.v` | Controls serial memory commands, addresses, data, Flash polling and chip selects. |
| `../wrapper/project.v` | Current Actions top: connects Tiny Tapeout ports to the packaged `tiny_sparse_acc_core`. |

Shared definitions are `defs/defs.vh` (widths and numeric format),
`defs/inst_defs.vh` (instructions and execution options), and `defs/mem_defs.vh`
(memory map). `generated/design.v` is the sv2v-generated Verilog representation of
the editable RTL, not another hardware block.

`src/sources.f` also lists `core/micro_ctrl.v`, but `TT_DIRECT_UCODE` excludes its
instance. `defs/micro_defs.vh` and `defs/fp8_math.vh` are not part of the active
direct FP8 datapath.

## Host interface and instructions

UART uses 8N1, approximately 115200 baud at 10 MHz (87 clocks per bit).
The chip sends READY `0x01` for each instruction admission credit. The host then
sends **exactly two bytes**, least-significant byte first. READY means that an
instruction can be received, not that a computation has completed. Reset clears
the instruction and datapath state.

Normal instructions use opcode `[15:9]` and payload `[8:0]`. Address commands use
command `[15:13]` and fragment `[12:0]`.

| Instruction | Opcode | Purpose |
| --- | --- | --- |
| FLASH_TO_SRAM | 0 | Copy one byte from saved SRC to saved DST. |
| SRAM_TO_VPU | 1 | Load an operand from saved SRC. |
| ACT_TO_SRAM | 2 | Store one activation-result byte at saved DST. |
| SRAM_TO_FLASH | 3 | Copy one byte from saved SRC to saved DST. |
| EXECUTE | 32 | Arithmetic, optional MUL accumulation and activation selection. |
| ACC_CLEAR | 33 | Clear the VPU accumulator/result. |
| ACTIVATE | 34 | Apply activation to the held VPU result. |
| VECTOR_PASS | 35 | Pass the input register through the selected activation. |
| EXE_SYNC | 60 | Wait for the VPU/activation path to finish. |
| MEM_SYNC | 61 | Wait for the memory path to finish. |
| INST_NOP | 62 | No operation. |

The historical `SRAM` instruction names refer to **external PSRAM** here.
EXECUTE payload `[1:0]` selects ADD, SUB, MUL or RSUB; bit 2 enables MUL
accumulation, `[5:3]` selects activation and bit 6 enables sparse MUL behavior.
ADD/SUB/RSUB ignore accumulation. Sparse MUL with zero input returns zero, or
preserves the accumulator when accumulating; avoiding the weight fetch and
scheduling sparse loops remain host responsibilities.

| Address command | `[15:13]` | Updated address bits |
| --- | --- | --- |
| SET_SRC_LO | 4 | SRC `[12:0]` |
| SET_DST_LO | 5 | DST `[12:0]` |
| SET_SRC_HI | 6 | SRC `[24:13]` from fragment `[11:0]` |
| SET_DST_HI | 7 | DST `[24:13]` from fragment `[11:0]` |

SRC/DST are 25-bit absolute byte addresses. Each command preserves the other
half; HIGH fragment bit 12 is ignored. Address changes wait for `mem_rdy`.
For example, SRC `0x1000020` uses words `0x8020`, `0xC800`: UART bytes
`20 80`, then `00 C8`, with a separate READY credit for each word.

## Arithmetic and activation

`DATA_WIDTH=8`, `COMPUTE_WIDTH=1`. Operands, accumulation, activation and
memory use FP8 E4M3FN (1 sign, 4 exponent, 3 fraction bits). Finite range is
-448..448; subnormals and signed zeros are supported. Arithmetic rounds to
nearest, ties to even, saturates overflow to the largest finite value and
propagates canonical NaN (0x7f). Examples: 1 = 0x38, 2 = 0x40, 0.5 = 0x30.

The VPU registers its result on the accepting edge. Operand updates on that same
edge affect the next execution. MUL rounds its product to FP8, then optionally
adds the previous accumulator using FP8 addition; this is not a fused MAC.
ADD/SUB/RSUB replace the accumulator and ignore the accumulation flag.

Activation registers the next stage's result. Codes are 0 NONE, 1 ReLU,
2 hard sigmoid (clamp(x/4 + 0.5, 0, 1), with FP8 rounding at each operation),
3 hard tanh (clamp(x,-1,1)), and 4 STEP (x>0). The top holds execution ready
low until this stage completes. Fixed-point data must be converted to FP8
before use; byte width and memory addressing remain unchanged.

## Memory and external pins

| Region | Base byte address | Default role |
| --- | --- | --- |
| Flash | `0x0000000` | Nonvolatile data, accessed through memory instructions. |
| PSRAM A | `0x1000000` | Weight operands. |
| PSRAM B | `0x1800000` | Inputs, other vector operands and stored results. |

PSRAM selection uses address `[24:23]`; lower 23 bits address a byte within a chip.
SRAM_TO_VPU normally routes PSRAM A reads to the weight register and PSRAM B reads
to the input register. Payload bit 2 can force a read into the weight register.
Each transfer carries one byte. `mem_ctrl` holds addresses until completion;
QSPI read data is valid at completion and must not be treated as persistent
storage across later transactions.

| Pin | Function |
| --- | --- |
| `ui[3]` | UART RX |
| `uo[4]` | UART TX / READY credit |
| `uo[0]` | Decoder ready status; use UART credits for host transmission |
| `uo[1]`, `uo[2]` | Tied low in direct mode; no high-level job done/error interface |
| `uio[0]` | Flash CS_n |
| `uio[1]`, `uio[2]` | QSPI DQ0, DQ1 |
| `uio[3]` | QSPI SCK |
| `uio[4]`, `uio[5]` | QSPI DQ2, DQ3 |
| `uio[6]`, `uio[7]` | PSRAM A CS_n, PSRAM B CS_n |

Use a compatible QSPI Flash + two-PSRAM Pmod. Flash configuration must match
`qspi_ctrl.v`; memory contents and host instruction scheduling are external
responsibilities. There is no general UART data-upload/result-download protocol.

## Build and verification

The current `info.yaml` selects `wrapper/project.v`. Macro GDS, LEF,
netlists and SPEF reside in `macro/tiny_sparse_acc_core/`;
`src/config.json` and `src/tcl/pdn.tcl` configure their integration.
The core export is `20261117_175536_1794905736922050` (339.92 x 141.12 um), inside
one Tiny Tapeout GF180 tile. Source hashes are recorded in `provenance.json`.

PnR treats the core as a hard macro. Magic DRC examines the complete GDS; full
LVS extracts and compares core internals as well as the wrapper. `core.lvs.v`
adds explicit well supply connections and unambiguous net names for LVS only.
The GDS and simulation netlist are unchanged by those compatibility edits.
KLayout DRC is enabled in configuration, but the current Actions PDK has no
`KLAYOUT_DRC_RUNSET`, so that step is skipped; it is not a KLayout DRC pass.
The packaged SPEF is nominal 25C RC reused across flow corners, not a separate
RC extraction for each corner.

The Actions summary combines internal core and wrapper cell counts, cell area
utilisation and signal/clock wire length. Fill/tap categories are excluded from
the cell-area utilisation; PG wiring is excluded from wire length. Core wire
length comes from the matching ICC2 DEF and is checked against the packaged GDS
hash before being added to wrapper routing metrics.

Editable RTL is listed in `src/sources.f`; `src/build_mode.txt` selects `direct`.
Run `python3 scripts/generate_verilog.py` after RTL edits (sv2v 0.0.13 required).
CI checks that `src/rtl/generated/design.v` matches those sources. **Regenerating
Verilog does not update the hard macro**: changes intended for the physical chip
require a new implementation/export and `scripts/package_icc2_macro.py`.

## How to test

Run commands from the repository root:

```sh
bash test/check_import.sh       # Unit and UART/QSPI integration tests
make -C test                   # RTL UART admission smoke test
bash test/run_fp8_math.sh       # Exhaustive FP8 arithmetic checks
```

The FP8 math test checks all operand pairs; integration tests also cover
MAC accumulation, every activation input and memory transfers. Actions additionally runs the gate-level UART smoke test with GF180 cell
models and the packaged powered core netlist. That smoke test does not establish
full-network accuracy.

Historical fixed8 dataset experiments (not validated for the current FP8 RTL;
the fixed8 reference and fixtures must be adapted before reuse):

```sh
bash test/run_egru_layer.sh
python3 test/evaluate_egru_accuracy.py
python3 test/compare_fixed8_egru.py --output /tmp/fixed8-comparison.json
```

These cover different numerical experiments; see [Development history](archive/history.md)
for their scope and earlier results. Local Synopsys setup uses
`bash syn/run_synth.sh --check` for path validation and `bash syn/run_synth.sh direct`
for synthesis, with reports under `syn/runs/<run>/reports`. See the local
`pnr/` documentation for manual ICC2 steps. These directories are local-only and excluded from Git; their scripts require
the corresponding tools, libraries and environment.
