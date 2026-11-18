#!/usr/bin/env python3
"""Reuse pin-level regression with explicit chip select instead of address tags."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
with tempfile.TemporaryDirectory(prefix='rebuild-qspi-') as tmp:
    tmp = Path(tmp)
    # Legacy test vectors still encode device/address together; split at DUT.
    source = (ROOT / 'test/tb_qspi_ctrl.sv').read_text().replace(
        '.req_addr(req_addr),',
        ".req_addr(req_addr[24] ? {1'b0, req_addr[22:0]} : req_addr[23:0]), "
        ".req_device(req_addr[24] ? req_addr[24:23] : 2'b00),")
    tb = tmp / 'tb.sv'
    tb.write_text(source)
    for label, delays in [('normal', []), ('delayed', [
            '-Ptb_qspi_ctrl.OUT_DELAY=10', '-Ptb_qspi_ctrl.IN_DELAY=40'])]:
        binary = tmp / label
        subprocess.run(['iverilog', '-g2012', '-I', 'src/rtl', '-s', 'tb_qspi_ctrl',
                        *delays, '-o', str(binary), 'src/rtl/qspi_ctrl.v',
                        'test/qspi_psram_model.sv', 'test/qspi_nor_model.sv', str(tb)],
                       cwd=ROOT, check=True)
        subprocess.run(['vvp', str(binary)], cwd=ROOT, check=True)
