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
        from collections import Counter
        layout = gdstk.read_gds(self.get_final_gds())
        tops = layout.top_level()
        if len(tops) != 1:
            raise ValueError("Expected one final GDS top")
        counts = Counter()
        def visit(cell, multiplicity=1):
            for ref in cell.references:
                copies = multiplicity * (ref.repetition.size or 1)
                if ref.cell_name.startswith("gf180mcu_fd_sc_mcu7t5v0__"):
                    name = ref.cell_name.split("__", 1)[1]
                    counts[re.sub(r"_\\d+$", "", name)] += copies
                else:
                    if not isinstance(ref.cell, gdstk.Cell):
                        raise ValueError("Unresolved GDS reference: " + ref.cell_name)
                    visit(ref.cell, copies)
        visit(tops[0])
        return dict(counts)
    '''
    lines = source.splitlines(keepends=True)
    lines[method.lineno - 1:method.end_lineno] = [
        textwrap.indent(textwrap.dedent(replacement).strip(), '    ') + '\n'
    ]
    source = ''.join(lines)
    # Macro-only placement need not print GPL-0019. Use the final flow metric;
    # leave the existing routing table and error handling unchanged.
    start = source.index('            util_glob =', source.index('    def print_stats('))
    end_text = '            util = re.sub(util_regexp, "", util_line).strip()'
    end = source.index(end_text, start) + len(end_text)
    source = (source[:start] +
              '            util = f\'{100 * float(self.metrics["design__instance__utilization"]):.2f}\'' +
              source[end:])
    ast.parse(source)
    path.write_text(source)


if __name__ == '__main__':
    patch(Path(sys.argv[1]))
