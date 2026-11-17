"""Pin-level RTL/GL checks with independent external QSPI memory models."""
from pathlib import Path
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer, with_timeout

BIT_NS = 8700  # 87 clocks at 10 MHz

async def send_byte(dut, value):
    dut.ui_in.value = 0
    await Timer(BIT_NS, unit="ns")
    for bit in range(8):
        dut.ui_in.value = ((value >> bit) & 1) << 3
        await Timer(BIT_NS, unit="ns")
    dut.ui_in.value = 8
    await Timer(BIT_NS, unit="ns")

async def receive_byte(dut):
    # Only TX is meaningful here. Empty FIFO data may leave core_rdy (bit 0)
    # unknown in gate simulation. An unknown TX still fails this test.
    while int(dut.uo_out.value[4]):
        await Timer(100, unit="ns")
    await Timer(BIT_NS * 1.5, unit="ns")
    value = 0
    for bit in range(8):
        value |= (int(dut.uo_out.value[4])) << bit
        await Timer(BIT_NS, unit="ns")
    assert int(dut.uo_out.value[4]), "UART stop bit missing"
    return value

async def receive_reply(dut):
    return await receive_byte(dut), await receive_byte(dut)

@cocotb.test()
async def uart_ready(dut):
    cocotb.start_soon(Clock(dut.clk, 100, unit="ns").start())
    dut.ena.value = 1
    dut.ui_in.value = 8
    dut.flash_stuck_busy.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    receiver = cocotb.start_soon(receive_byte(dut))
    dut.rst_n.value = 1
    assert await with_timeout(receiver, 300, "us") == 1
    assert all(int(dut.uio_out.value[bit]) == 1 for bit in (0, 6, 7))
    direct = (Path(__file__).resolve().parents[1] / "src/build_mode.txt").read_text().strip() == "direct"
    # Direct mode: send one NOP. Micro mode: reject zero dimensions.
    word = (62 << 9) if direct else 0
    receiver = cocotb.start_soon(receive_byte(dut))
    for i in range(2 if direct else 8):
        await send_byte(dut, (word >> (8*i)) & 255)
    assert await with_timeout(receiver, 300, "us") == 1
    assert bool(int(dut.uo_out.value[2])) == (not direct)
    assert all(int(dut.uio_out.value[bit]) == 1 for bit in (0, 6, 7))

from cocotb.queue import Queue
from cocotb.triggers import FallingEdge
from fp8_reference import mac8, add8, sub8, activate

WEIGHT = 0x1000000
UNIFIED = 0x1800000


class Host:
    """Obey each READY credit; all requests go through physical UART pins."""
    def __init__(self, dut):
        self.dut = dut
        self.credits = Queue()
        self.receiver = None

    async def listen(self):
        while True:
            value = await receive_byte(self.dut)
            assert value == 1, f"Unexpected READY byte {value:#x}"
            self.credits.put_nowait(value)

    async def reset(self):
        if self.receiver is not None:
            self.receiver.cancel()
        self.credits = Queue()
        self.dut.rst_n.value = 0
        self.dut.ui_in.value = 8
        self.dut.flash_stuck_busy.value = 0
        await ClockCycles(self.dut.clk, 12)
        await Timer(20, unit="ns")
        self.receiver = cocotb.start_soon(self.listen())
        self.dut.rst_n.value = 1
        await Timer(100, unit="us")
        assert not self.credits.empty(), "No READY after reset"

    async def word(self, word):
        await with_timeout(self.credits.get(), 2, "ms")
        await Timer(37, unit="ns")
        await send_byte(self.dut, word & 255)
        await send_byte(self.dut, word >> 8)
        if self.receiver.done():
            await self.receiver  # Surface protocol monitor failures.

    async def command(self, opcode, payload=0):
        await self.word((opcode << 9) | payload)

    async def address(self, addr, destination=False):
        lo, hi = (5, 7) if destination else (4, 6)
        await self.word((lo << 13) | (addr & 8191))
        await self.word((hi << 13) | (addr >> 13))

    async def sync(self, memory=False):
        await self.command(61 if memory else 60)

    async def load(self, addr):
        await self.address(addr)
        await self.command(1)
        await self.sync(memory=True)

    async def store(self, addr):
        await self.address(addr, destination=True)
        await self.command(2)
        await self.sync(memory=True)
        await Timer(20, unit="us")

    def check_idle(self):
        assert not int(self.dut.uo_out.value[2]), "Core error asserted"
        assert all(int(self.dut.uio_out.value[b]) for b in (0, 6, 7)), "Memory CS remains active"
        assert not self.receiver.done(), "Host monitor stopped"


async def start_host(dut):
    cocotb.start_soon(Clock(dut.clk, 100, unit="ns").start())
    dut.ena.value = 1
    host = Host(dut)
    await host.reset()
    return host


@cocotb.test()
async def memory_compute_roundtrip(dut):
    """Flash -> PSRAM -> FP8 MAC/activation -> PSRAM -> Flash."""
    host = await start_host(dut)
    a_writes = int(dut.ram_a.writes.value)
    b_writes = int(dut.ram_b.writes.value)
    programs = int(dut.flash.program_ops.value)
    dut.flash.mem[16].value = 0x40  # weight 2
    dut.ram_b.mem[128].value = 0x44  # input 3
    dut.flash.mem[512].value = 0xff
    await host.address(16)
    await host.address(WEIGHT + 32, destination=True)
    await host.command(0)
    await host.sync(memory=True)
    await host.load(WEIGHT + 32)
    await host.load(UNIFIED + 128)
    assert int(dut.ram_a.mem[32].value) == 0x40

    expected = 0
    # MUL, accumulate, ADD, SUB, RSUB, then MUL with every activation.
    cases = [(2, 0, 0), (2, 1, 0), (0, 0, 0), (1, 0, 1), (3, 0, 0)]
    cases += [(2, 0, act) for act in range(5)]
    for i, (op, acc, act) in enumerate(cases):
        expected = (mac8(0x44, 0x40, expected, bool(acc)) if op == 2 else
                    add8(0x44, 0x40) if op == 0 else
                    sub8(0x44, 0x40) if op == 1 else sub8(0x40, 0x44))
        await host.command(32, op | (acc << 2) | (act << 3))
        await host.sync()
        await host.store(UNIFIED + 256 + i)
        assert int(dut.ram_b.mem[256+i].value) == activate(expected, act), f"Case {i}"

    # Read the stored result back through PSRAM, then program and read back NOR.
    await host.address(UNIFIED + 256)
    await host.address(512, destination=True)
    await host.command(3)
    await host.sync(memory=True)
    await host.address(512)
    await host.address(UNIFIED + 400, destination=True)
    await host.command(0)
    await host.sync(memory=True)
    await Timer(20, unit="us")
    assert int(dut.flash.mem[512].value) == 0x4c
    assert int(dut.ram_b.mem[400].value) == 0x4c
    assert int(dut.flash.program_ops.value) - programs == 1
    assert int(dut.ram_a.writes.value) - a_writes == 1
    assert int(dut.ram_b.writes.value) - b_writes == len(cases) + 1
    host.check_idle()
    host.receiver.cancel()


@cocotb.test()
async def stalled_memory_and_queued_commands(dut):
    """Hold NOR busy while UART fills the FIFO; verify ordered recovery."""
    host = await start_host(dut)
    dut.flash.mem[24].value = 0xb8
    dut.ram_b.mem[500].value = 0xa5
    await host.address(24)
    await host.address(UNIFIED + 500, destination=True)
    dut.flash_stuck_busy.value = 1
    await host.command(0)
    await host.sync(memory=True)
    # Keep sending at READY rate; the sender must stall when admission fills.
    async def queued():
        for _ in range(5):
            await host.command(62)
    sender = cocotb.start_soon(queued())
    await Timer(1200, unit="us")
    assert not sender.done(), "FIFO did not backpressure during stalled memory"
    assert int(dut.ram_b.mem[500].value) == 0xa5, "Copy completed while NOR busy"
    dut.flash_stuck_busy.value = 0
    await with_timeout(sender, 3, "ms")
    await host.sync(memory=True)
    await Timer(20, unit="us")
    assert int(dut.ram_b.mem[500].value) == 0xb8
    host.check_idle()
    host.receiver.cancel()


@cocotb.test()
async def interrupted_uart_and_qspi_reset(dut):
    """Abort an incomplete UART word and a QSPI read, then run a fresh MAC."""
    host = await start_host(dut)
    await with_timeout(host.credits.get(), 300, "us")
    await send_byte(dut, 0xff)  # Only half of a 16-bit instruction.
    await host.reset()
    await host.command(62)
    dut.ram_a.mem[32].value = 0x38
    dut.ram_b.mem[128].value = 0xc0  # -2
    await host.address(WEIGHT + 32)
    async def reset_during_read():
        await FallingEdge(dut.ram_a_cs)
        await Timer(350, unit="ns")
        dut.rst_n.value = 0
    interrupt = cocotb.start_soon(reset_during_read())
    await host.command(1)
    await with_timeout(interrupt, 300, "us")
    await host.reset()
    await host.load(WEIGHT + 32)
    await host.load(UNIFIED + 128)
    await host.command(32, 2)
    await host.sync()
    await host.store(UNIFIED + 600)
    assert int(dut.ram_b.mem[600].value) == 0xc0
    host.check_idle()
    host.receiver.cancel()
