"""TT pin-level UART smoke test; no SRAM initialization is assumed."""
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
    while (int(dut.uo_out.value) >> 4) & 1:
        await Timer(100, unit="ns")
    await Timer(BIT_NS * 1.5, unit="ns")
    value = 0
    for bit in range(8):
        value |= ((int(dut.uo_out.value) >> 4) & 1) << bit
        await Timer(BIT_NS, unit="ns")
    assert (int(dut.uo_out.value) >> 4) & 1, "UART stop bit missing"
    return value

async def receive_reply(dut):
    return await receive_byte(dut), await receive_byte(dut)

@cocotb.test()
async def uart_ready(dut):
    cocotb.start_soon(Clock(dut.clk, 100, unit="ns").start())
    dut.ena.value = 1
    dut.ui_in.value = 8
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    receiver = cocotb.start_soon(receive_byte(dut))
    dut.rst_n.value = 1
    assert await with_timeout(receiver, 300, "us") == 1
    assert int(dut.uio_out.value) & 0xc1 == 0xc1
    # Zero dimensions are rejected without touching external memory.
    receiver = cocotb.start_soon(receive_byte(dut))
    for _ in range(8):
        await send_byte(dut, 0)
    assert await with_timeout(receiver, 300, "us") == 1
    assert int(dut.uo_out.value) & 4, "Malformed job must set error"
    assert int(dut.uio_out.value) & 0xc1 == 0xc1
