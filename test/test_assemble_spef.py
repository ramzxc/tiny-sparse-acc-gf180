"""RC conservation/alias regressions, independent of EDA tool installation."""
import importlib.util
from pathlib import Path
import sys
import tempfile
import unittest
from decimal import Decimal

spec = importlib.util.spec_from_file_location('assemble_spef', Path(__file__).resolve().parents[1] / 'scripts/assemble_spef.py')
spef = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = spef
spec.loader.exec_module(spef)

HEADER = '''*SPEF "1481-1998"
*DESIGN "top"
*DIVIDER /
*DELIMITER :
*C_UNIT 1 PF
*R_UNIT 1 {unit}
*PORTS
p O
q O
'''
WRAPPER = '''*D_NET p 0.6
*CONN
*P p O
*I core:p O
*CAP
1 p 0.1
2 core:p 0.2
3 p q 0.3
*RES
1 p core:p 10
*END
*D_NET q 1.2
*CONN
*P q O
*I core:q O
*CAP
1 q 0.4
2 core:q 0.5
3 q p 0.3
*RES
1 q core:q 20
*END
'''
MACRO = '''*D_NET p 0.6
*CONN
*P p O
*P q O
*I buf:Z O
*CAP
1 buf:Z 0.6
*RES
1 buf:Z p 0.01
2 buf:Z q 0.02
*END
'''


class AssemblyTest(unittest.TestCase):
    def test_unused_macro_port_keeps_wrapper_rc_as_numeric_junction(self):
        wrapper = WRAPPER.replace('3 p q 0.3\n', '').replace('3 q p 0.3\n', '')
        macro = MACRO.replace('*P q O\n', '').replace('2 buf:Z q 0.02\n', '')
        summary, nets = self.assemble(wrapper, macro)
        q = next(n for n in nets if n.name == 'q')
        self.assertEqual(sum(v for _, v in q.resistors), Decimal(20))
        self.assertEqual(sum(v for _, v in q.caps), Decimal('.9'))
        self.assertFalse(any('core:q' in ns for ns, _ in q.resistors + q.caps))

    def assemble(self, wrapper=WRAPPER, macro=MACRO, ground=False):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        d = Path(tmp.name)
        (d/'w').write_text(HEADER.format(unit='OHM') + wrapper)
        (d/'m').write_text(HEADER.format(unit='KOHM') + macro)
        summary = spef.assemble(d/'w', d/'m', 'core', d/'out', ground_coupling=ground)
        return summary, spef.read_spef(d/'out')[2]

    def test_alias_keeps_two_distinct_port_branches(self):
        summary, nets = self.assemble()
        self.assertEqual(summary['merged_wrapper_nets'], [['p', 'q']])
        self.assertEqual(len(nets), 1)
        self.assertEqual(len(nets[0].resistors), 4)
        self.assertEqual(Decimal(summary['resistance_sum_ohm']), Decimal(60))
        self.assertEqual(Decimal(summary['ground_capacitance_sum_pf']), Decimal('1.8'))
        cc = [(nodes, value) for nodes, value in nets[0].caps if len(nodes) == 2]
        self.assertEqual(cc, [(('p', 'q'), Decimal('.3'))])
        self.assertEqual(set(n for _, n, _ in nets[0].conn), {'p', 'q', 'core/buf:Z'})

    def test_grounded_model_is_explicit_and_conserves_each_endpoint(self):
        summary, nets = self.assemble(ground=True)
        self.assertEqual(summary['coupling_model'], 'fully_grounded')
        self.assertTrue(all(len(nodes) == 1 for nodes, _ in nets[0].caps))
        self.assertEqual(sum(v for _, v in nets[0].caps), Decimal('2.4'))
        self.assertEqual(len(nets[0].resistors), 4)

    def test_internal_node_uses_joined_net_instead_of_def_dummy_name(self):
        macro = MACRO.replace('*D_NET p ', '*D_NET _dummynet0 ')
        macro = macro.replace('1 buf:Z p 0.01', '1 buf:Z _dummynet0:7 0.009\n3 _dummynet0:7 p 0.001')
        _, nets = self.assemble(macro=macro)
        nodes = {n for ns, _ in nets[0].resistors for n in ns}
        self.assertFalse(any('_dummynet' in n for n in nodes))
        self.assertEqual(sum(v for _, v in nets[0].resistors), Decimal(60))

    def test_missing_branch_is_error(self):
        with self.assertRaisesRegex(ValueError, 'Disconnected terminals'):
            self.assemble(macro=MACRO.replace('2 buf:Z q 0.02\n', ''))

    def test_conflicting_coupling_is_error(self):
        with self.assertRaisesRegex(ValueError, 'mismatched coupling'):
            self.assemble(wrapper=WRAPPER.replace('3 q p 0.3', '3 q p 0.4'))

    def test_missing_port_is_error(self):
        with self.assertRaisesRegex(ValueError, 'Macro port absent'):
            self.assemble(wrapper=WRAPPER.replace('core:q', 'core:bad'))

    def test_parallel_coupling_is_not_silently_deduplicated(self):
        with self.assertRaisesRegex(ValueError, 'Ambiguous parallel'):
            self.assemble(wrapper=WRAPPER.replace('3 p q 0.3', '3 p q 0.3\n4 p q 0.3'))


if __name__ == '__main__':
    unittest.main()
