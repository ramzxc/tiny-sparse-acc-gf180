## How it works

Two-lane sparse neural-network accelerator with FP8 E4M3 operands and weights,
FP16 accumulation, and a 64-bit instruction stream. All three buffers reside in
external QPI PSRAM, sharing the QSPI pins with NOR Flash. No SRAM macro is
instantiated. The current small test configuration keeps four rows per buffer:
8 bytes of weights, 8 bytes of unified data, and 16 bytes of accumulations.
PSRAM addresses are byte addresses; rows are little endian.

| Buffer | Base address | Bytes per row | Rows |
| --- | --- | --- | --- |
| Weight | 0x000000 | 2 | 4 |
| Unified | 0x010000 | 2 | 4 |
| Accumulation | 0x020000 | 4 | 4 |

The regions reserve 64 KiB each, but this does not enlarge the current logical
buffer depths. Instructions must stay within the configured row counts.
An INPUT instruction reads unified-buffer lane zero and holds that scalar until
the next INPUT or reset. Zero inputs skip weight reads and scalar multiplication.

The host interface is 8N1 UART at approximately 115200 baud with a 10 MHz clock.
RX is ui_in[3], TX is uo_out[4]. The UART divider is 87 clocks per bit.
QSPI SCK is 5 MHz at the 10 MHz core clock. Each PSRAM access transfers a complete
16- or 32-bit row, then releases the bus. Three buffers arbitrate round robin;
Flash and PSRAM alternate at transaction boundaries when both need the bus.
Flash DMA transfers close CS after each 8-byte beat so that PSRAM can service
the same DMA without deadlock. Responses are held locally under backpressure.

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
The integration tests cover DMA in both directions, weight retention, FP16
accumulation, activation, simultaneous buffer requests, response stalls and reset.
The functional PSRAM model checks QPI direction and CS timing. It does not replace
hardware validation or timing signoff. The 1x1 tile setting has not been validated
for area, timing, DRC or LVS with this design.

## External hardware

A 3.3 V UART adapter and a QSPI Flash + PSRAM Pmod compatible with
[tinyQV](https://github.com/MichaelBell/tinyQV#qspi-memory-interface) are required.
The reference parts are W25Q128JVSIQ Flash and APS6404L-3SQR-SN PSRAM.
Pin/protocol reference: tinyQV commit `858986b72975157ebf27042779b6caaed164c57b`.

| Pin | Function |
| --- | --- |
| uio[0] | Flash CS_n |
| uio[1], uio[2], uio[4], uio[5] | Shared IO0, IO1, IO2, IO3 |
| uio[3] | Shared SCK |
| uio[6] | PSRAM 0 CS_n |
| uio[7] | Unused PSRAM 1 CS_n, held high |

The board prepares both memories before selecting the ASIC project:

1. Disconnect the ASIC from the Pmod pins using the board/project selection
   controls. Merely holding ASIC reset does not tri-state its QSPI output pins.
2. Initialize PSRAM from its known power-on SPI state, then send SPI command
   `35h` to enter QPI mode. On a warm restart, first establish the device's actual
   mode according to its datasheet; do not blindly resend SPI commands in QPI.
3. Keep Flash in SPI command mode with QE enabled and WIP clear. Prepare input
   data and erase any Flash output region before the ASIC programs it.
4. Release the board controller's shared pins, select the ASIC, apply 10 MHz,
   reset and then release reset with UART RX idle high.

Like tinyQV, PSRAM uses QPI `0Bh` reads with four dummy clocks and `02h` writes.
Unlike tinyQV's Flash continuous-read path, this accelerator retains SPI-header
`6Bh` quad reads and `32h` quad page programs, plus status/WREN commands. Do not
use tinyQV's Flash continuous-read initialization unchanged. This retains DMA
writes to Flash; Flash erase remains the host's responsibility.

The APS6404L-3SQR-SN CS-low limit is 8 us for the standard -40 to 85 C grade.
The tested maximum row transaction is 4.4 us at 10 MHz. This implementation
assumes that clock rate; slowing the clock can violate PSRAM refresh timing.
No memory initialization commands are issued automatically by the ASIC.

## Build sources

`src/*.sv` contains the readable original RTL. TT's default Yosys parser cannot
read all of its SystemVerilog constructs, so `scripts/generate_verilog.py` uses
sv2v v0.0.13 to produce `src/generated/design.v`, the source listed in info.yaml.
Regenerate it after RTL edits; CI checks that the generated copy is current.
The RTL test uses the original SystemVerilog. The GDS and gate-level flows use
the generated Verilog. Legacy SRAM RTL and views remain in the repository for
reference but are excluded from the active source manifest and physical config.
