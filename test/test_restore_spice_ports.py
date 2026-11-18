"""Reject fabricated connectivity while restoring a lost extraction alias."""
import importlib.util
from pathlib import Path
import tempfile
import unittest

spec = importlib.util.spec_from_file_location(
    "restore_ports", Path(__file__).parents[1] / "scripts/restore_spice_ports.py"
)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

SPICE = """.subckt tiny_sparse_acc_core a b
R0 a b 0
.ends
.subckt wrapper b
Xcore b core/b tiny_sparse_acc_core
.ends
"""
EXT = """port "a" 1 0 0 0 0 m4
port "b" 2 0 0 0 0 m4
use tiny_sparse_acc_core core 0 1 0 0 0 1 0
merge "a" "b"
merge "b" "core/a"
"""


class RestorePortsTest(unittest.TestCase):
    def exercise(self, ext=EXT, core='equiv "a" "b"\n', spice=SPICE, reject=False):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            s, e = root / "wrapper.spice", root / "wrapper.ext"
            s.write_text(spice)
            e.write_text(ext)
            (root / "tiny_sparse_acc_core.ext").write_text(core)
            if reject:
                with self.assertRaises(ValueError):
                    module.restore(s, e)
                self.assertEqual(s.read_text(), spice)
            else:
                module.restore(s, e)
                self.assertIn("Xcore a b tiny_sparse_acc_core", s.read_text())
                fixed = s.read_text()
                self.assertEqual(module.restore(s, e), [])
                self.assertEqual(s.read_text(), fixed)

    def test_proven_alias_and_idempotence(self):
        self.exercise()

    def test_disconnected_port_is_not_repaired(self):
        self.exercise(ext=EXT.replace('merge "a" "b"\n', ''), reject=True)

    def test_missing_macro_alias_is_not_repaired(self):
        self.exercise(core="", reject=True)

    def test_nonzero_resistor_is_not_a_short(self):
        self.exercise(spice=SPICE.replace("R0 a b 0", "R0 a b 100"), reject=True)


if __name__ == "__main__":
    unittest.main()
