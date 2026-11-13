#!/usr/bin/env python3
"""Connect hard-macro data to TT's existing summary, without changing its renderer."""
import ast
from pathlib import Path
import sys
import textwrap


def patch(path):
    source = path.read_text()
    tree = ast.parse(source)
    methods = {node.name: node for node in ast.walk(tree)
               if isinstance(node, ast.FunctionDef)}
    method = methods['get_cell_counts_from_gl']
    replacement = '''
    def get_cell_counts_from_gl(self):
        # Imported macro instances are absent from the wrapper netlist.
        import gdstk
        import hashlib
        from collections import Counter
        from pathlib import Path
        layout = gdstk.read_gds(self.get_final_gds())
        tops = layout.top_level()
        if len(tops) != 1:
            raise ValueError("Expected one final GDS top")
        counts = Counter()
        cell_area = 0.0
        core_copies = 0
        categories = json.loads((Path(SCRIPT_DIR) / "tech" / self.pdk / "categories.json").read_text())
        def visit(cell, multiplicity=1):
            nonlocal cell_area, core_copies
            for ref in cell.references:
                copies = multiplicity * (ref.repetition.size or 1)
                if ref.cell_name.startswith("gf180mcu_fd_sc_mcu7t5v0__"):
                    name = ref.cell_name.split("__", 1)[1]
                    base = re.sub(r"_\\d+$", "", name)
                    counts[base] += copies
                    category = categories["categories"][categories["map"][base]]
                    if category not in ("Fill", "Tap"):
                        boundaries = [p for p in ref.cell.polygons if (p.layer, p.datatype) == (0, 0)]
                        if len(boundaries) != 1:
                            raise ValueError("Expected one standard-cell PR boundary: " + ref.cell_name)
                        cell_area += copies * boundaries[0].area() * (layout.unit / 1e-6) ** 2
                else:
                    if not isinstance(ref.cell, gdstk.Cell):
                        raise ValueError("Unresolved GDS reference: " + ref.cell_name)
                    if ref.cell_name == "tiny_sparse_acc_core":
                        core_copies += copies
                    visit(ref.cell, copies)
        visit(tops[0])
        self._physical_cell_area = cell_area
        macro_dir = Path(self.local_dir) / "src/physical/macros/tiny_sparse_acc_core"
        metrics = json.loads((macro_dir / "core.metrics.json").read_text())
        if hashlib.sha256((macro_dir / "core.gds").read_bytes()).hexdigest() != metrics["packaged_gds_sha256"]:
            raise ValueError("Core route metrics do not match the packaged GDS; repackage the export")
        if core_copies != 1:
            raise ValueError("Expected one physical accelerator core")
        self._physical_core_wire_length = core_copies * float(metrics["wire_length_um"])
        return dict(counts)
    '''
    lines = source.splitlines(keepends=True)
    lines[method.lineno - 1:method.end_lineno] = [
        textwrap.indent(textwrap.dedent(replacement).strip(), '    ') + '\n'
    ]
    source = ''.join(lines)
    # Treat the hierarchy as one design: cell PR area / top-level core area.
    # Do not count the macro footprint again on top of its internal cells.
    start = source.index('            util_glob =', source.index('    def print_stats('))
    end_text = '            util = re.sub(util_regexp, "", util_line).strip()'
    end = source.index(end_text, start) + len(end_text)
    source = (source[:start] +
              '            self.get_cell_counts_from_gl()\n'
              '            util = f\'{100 * self._physical_cell_area / float(self.metrics["design__core__area"]):.2f}\'' +
              source[end:])
    # Add imported signal/clock routing to LibreLane's new wrapper routing.
    start = source.index('    def print_stats(')
    end = source.index('        except (IndexError, KeyError, StopIteration):', start)
    source = (source[:end] +
              '            wire_length = f\'{float(wire_length) + self._physical_core_wire_length:.2f}\'\n\n' +
              source[end:])
    ast.parse(source)
    path.write_text(source)


if __name__ == '__main__':
    patch(Path(sys.argv[1]))
