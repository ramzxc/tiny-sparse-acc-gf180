## How it works

Two-lane sparse neural-network accelerator with FP8 E4M3 operands and weights,
FP16 accumulation, and a 64-bit instruction stream. Weight storage is 512 bytes;
unified and accumulation storage are 64 bytes each, using GF180 SRAM macros.
An INPUT instruction reads unified-buffer lane zero and holds that scalar until
the next INPUT or reset. Zero inputs skip weight reads and scalar multiplication.

The host interface is 8N1 UART at approximately 115200 baud with a 10 MHz clock.
RX is ui_in[3], TX is uo_out[4]. The UART divider is 87 clocks per bit.
QSPI connects to an external NOR Flash using the Pmod mapping below.

## How to test

Reset with rst_n low, then release it with ena high and UART RX idle high.
Command 0x05 requests status; the reply is 0x06 followed by a status byte.
Command 0x01 followed by eight little-endian bytes submits a 64-bit instruction.
Wait for its two-byte reply before sending the next command.
Command 0x03 clears host error/synchronization flags; 0x04 aborts a partial packet.
The SYNCHRONIZE instruction (opcode 0xff) waits for outstanding operations.

Status bits: [7:5] Flash error code, [4] protocol/Flash error, [3] synchronization
seen, [2] Flash busy, [1] TPU available, [0] host ready.

Run `make -C test` with cocotb 2.1 and a compatible Verilator for the UART smoke
test. `bash test/check_import.sh` checks the imported full UART/QSPI testbench.
The physical SRAM integration and GDS flow are still under validation; a passing
RTL test alone does not establish tapeout readiness.

## External hardware

A 3.3 V UART adapter and compatible QSPI NOR Flash are required for host-driven
memory/compute programs. uio[0] is Flash CS_n, uio[3] is SCK, and
uio[1], uio[2], uio[4], uio[5] are IO0, IO1, IO2, IO3 respectively.
uio[6:7] stay high to deselect the optional PSRAM chips.

## Build sources

`src/*.sv` contains the readable original RTL. TT's default Yosys parser cannot
read all of its SystemVerilog constructs, so `scripts/generate_verilog.py` uses
sv2v v0.0.13 to produce `src/generated/design.v`, the source listed in info.yaml.
Regenerate it after RTL edits; CI checks that the generated copy is current.
The RTL test uses the original SystemVerilog. The GDS and gate-level flows use
the generated Verilog and physical SRAM views from src/macros.
