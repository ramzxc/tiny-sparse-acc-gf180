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

    async def word_sync(self):
        await self.word(0xe000)

    async def address(self, addr):
        await self.word(0x2000 | (addr & 0xfff))
        await self.word(0x3000 | ((addr >> 12) & 0xfff))

    async def load(self, addr, device=2, weight=False, sparse=False, scalar=False):
        # Submitted 1-lane core: scalar=1 selects cur=0.
        await self.word(0x8000 | (int(sparse)<<11) | (int(weight)<<10) | (int(scalar)<<8))
        await self.address(addr)
        await self.word(0x4000 | (device<<10))
        await self.word_sync()

    async def execute(self, op=2, acc=False, act=0):
        await self.word(0x6000 | (int(acc)<<12) | (op<<10) | (act<<7))
        await self.word_sync()

    async def store(self, addr, device=3):
        await self.word(0x9000)
        await self.address(addr)
        await self.word(0x5000 | (device<<10))
        await self.word_sync()
        await Timer(20, unit="us")

async def start_host(dut):
    cocotb.start_soon(Clock(dut.clk, 100, unit="ns").start())
    dut.ena.value=1
    host=Host(dut)
    await host.reset()
    return host

@cocotb.test()
async def memory_compute_roundtrip(dut):
    host=await start_host(dut)
    dut.flash.mem[16].value=0x40
    dut.ram_b.mem[128].value=0x44
    dut.flash.mem[512].value=0xff
    await host.load(16,device=0,weight=True)
    await host.load(128,device=3)
    expected=0
    cases=[(2,False,0),(2,True,0),(0,False,0),(1,False,1)]
    cases += [(2,False,a) for a in range(5)]
    for i,(op,acc,act) in enumerate(cases):
        expected=(mac8(0x44,0x40,expected,acc) if op==2 else
                  add8(0x44,0x40) if op==0 else sub8(0x44,0x40))
        await host.execute(op,acc,act)
        await host.store(256+i)
        assert int(dut.ram_b.mem[256+i].value)==activate(expected,act), f"case {i}"
    await host.execute()
    await host.store(512,device=0)
    assert int(dut.flash.mem[512].value)==0x4c
    await host.load(512,device=0)
    await host.execute(op=0)
    await host.store(32,device=2)
    assert int(dut.ram_a.mem[32].value)==0x50  # 6+2=8
    host.receiver.cancel()

@cocotb.test()
async def sparse_skip_and_snapshot(dut):
    host=await start_host(dut)
    dut.ram_a.mem[0].value=0
    dut.ram_a.mem[1].value=0x40
    dut.ram_b.mem[0].value=0x44
    await host.load(0,device=2,sparse=True)
    before=int(dut.ram_b.reads.value)
    await host.load(0,device=3,weight=True,sparse=True)
    await host.execute()
    await host.store(100)
    assert int(dut.ram_b.reads.value)==before
    assert int(dut.ram_b.mem[100].value)==0
    await host.load(1,device=2)
    await host.load(0,device=3,weight=True,sparse=True)
    await host.execute()
    await host.word(0x9000)  # Snapshot 6 before next EXEC changes the result.
    await host.execute(op=0)
    await host.address(101)
    await host.word(0x5c00)
    await host.word_sync()
    await Timer(20,unit="us")
    assert int(dut.ram_b.mem[101].value)==0x4c
    host.receiver.cancel()

@cocotb.test()
async def interrupted_uart_and_qspi_reset(dut):
    host=await start_host(dut)
    await with_timeout(host.credits.get(),300,"us")
    await send_byte(dut,0xff)
    await host.reset()
    dut.ram_a.mem[32].value=0x38
    dut.ram_b.mem[128].value=0xc0
    await host.address(32)
    async def interrupt_read():
        await FallingEdge(dut.ram_a_cs)
        await Timer(350,unit="ns")
        dut.rst_n.value=0
    interrupt=cocotb.start_soon(interrupt_read())
    await host.word(0x4800)
    await with_timeout(interrupt,300,"us")
    await host.reset()
    await host.load(32,weight=True)
    await host.load(128,device=3)
    await host.execute()
    await host.store(600)
    assert int(dut.ram_b.mem[600].value)==0xc0
    host.receiver.cancel()

@cocotb.test()
async def stalled_memory_and_queued_commands(dut):
    host=await start_host(dut)
    dut.ram_a.mem[0].value=0x38
    dut.ram_b.mem[0].value=0x40
    dut.flash.mem[64].value=0xff
    await host.load(0,weight=True)
    await host.load(0,device=3)
    await host.execute()
    await host.word(0x9000)
    await host.address(64)
    dut.flash_stuck_busy.value=1
    await host.word(0x5000)
    async def queued():
        await host.word_sync()
        for _ in range(5):
            await host.word(0)
    sender=cocotb.start_soon(queued())
    await Timer(1200,unit="us")
    assert not sender.done(), "FIFO failed to backpressure during NOR busy"
    dut.flash_stuck_busy.value=0
    await with_timeout(sender,3,"ms")
    await host.word_sync()
    await Timer(20,unit="us")
    assert int(dut.flash.mem[64].value)==0x40
    host.receiver.cancel()


@cocotb.test()
async def scalar_sparse_cur_zero(dut):
    host = await start_host(dut)
    dut.ram_a.mem[0].value = 0
    dut.ram_a.mem[1].value = 0x40
    dut.ram_b.mem[0].value = 0x44
    await host.load(0)
    before = int(dut.ram_b.reads.value)
    await host.load(0, device=3, weight=True, sparse=True, scalar=True)
    await host.execute()
    await host.store(120)
    assert int(dut.ram_b.reads.value) == before
    assert int(dut.ram_b.mem[120].value) == 0
    await host.load(1)
    await host.load(0, device=3, weight=True, sparse=True, scalar=True)
    await host.execute()
    await host.store(121)
    assert int(dut.ram_b.reads.value) == before + 1
    assert int(dut.ram_b.mem[121].value) == 0x4c
    host.receiver.cancel()
