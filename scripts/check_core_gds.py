#!/usr/bin/env python3
"""Reject a final GDS whose wrapper references an empty hard macro."""

import argparse
from pathlib import Path

import gdstk


def check(path):
    layout = gdstk.read_gds(path)
    cells = {cell.name: cell for cell in layout.cells}
    top = cells.get("tt_um_tiny_sparse_acc_ramzxc")
    core = cells.get("tiny_sparse_acc_core")
    if top is None or core is None or core not in top.dependencies(True):
        raise ValueError("wrapper does not reference tiny_sparse_acc_core")

    polygons = core.get_polygons()
    # PR boundary alone is not evidence of a physical implementation.
    if not any(p.layer in (34, 36, 42, 46) for p in polygons):
        raise ValueError("core has no GF180 metal geometry")

    source_path = Path(__file__).resolve().parents[1] / (
        "src/physical/macros/tiny_sparse_acc_core/core.gds"
    )
    source = gdstk.read_gds(source_path)
    original = next(c for c in source.cells if c.name == core.name)
    actual_box = core.bounding_box()
    expected_box = original.bounding_box()
    for actual_point, expected_point in zip(actual_box, expected_box):
        for actual, expected in zip(actual_point, expected_point):
            if abs(actual * layout.unit - expected * source.unit) > 1e-9:
                raise ValueError("core bounding box differs from input GDS")
    print(f"PASS: {path}: reachable core, {len(polygons)} polygons, bbox={actual_box}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("gds", nargs="+")
    args = parser.parse_args()
    for filename in args.gds:
        try:
            check(filename)
        except ValueError as error:
            parser.exit(1, f"FAIL: {filename}: {error}\n")
