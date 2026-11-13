#!/usr/bin/env python3
"""Measure signal/clock route centerlines in ICC2 DEF (not PG or cell-internal metal)."""
import hashlib
import json
import re
from pathlib import Path


def wire_length(def_text):
    units = int(re.search(r'UNITS DISTANCE MICRONS (\d+)\s*;', def_text)[1])
    section = re.search(r'^NETS (\d+)\s*;(.*?)^END NETS', def_text, re.M | re.S)
    if not section:
        raise ValueError('Missing NETS section')
    length = 0
    routed_nets = 0
    for net in section[2].split(';'):
        if re.search(r'\+ USE (POWER|GROUND)\b', net):
            continue
        routes = re.findall(r'\+ (?:ROUTED|FIXED|COVER)\s+([^+]+)', net)
        if routes:
            routed_nets += 1
        for route in routes:
            for path in re.split(r'\bNEW\s+', route):
                if re.search(r'\b(?:RECT|POLYGON|VIRTUAL)\b', path):
                    raise ValueError('Unsupported route geometry; review DEF before reporting length')
                previous = None
                for point in re.findall(r'\(([^()]+)\)', path):
                    coords = point.split()
                    if len(coords) not in (2, 3):
                        raise ValueError('Unexpected route point: ' + point)
                    xy = []
                    for axis, value in enumerate(coords[:2]):
                        if value == '*':
                            if previous is None:
                                raise ValueError('Wildcard at start of route')
                            xy.append(previous[axis])
                        else:
                            xy.append(int(value))
                    if previous is not None:
                        dx, dy = abs(xy[0] - previous[0]), abs(xy[1] - previous[1])
                        if dx and dy:
                            raise ValueError('Non-Manhattan route')
                        length += dx + dy
                    previous = xy
    return {'wire_length_um': length / units, 'routed_nets': routed_nets}


def write_metrics(def_path, gds_path, output):
    metrics = wire_length(def_path.read_text())
    metrics.update(
        definition='NETS signal/clock route centerline length; excludes PG, via height and cell-internal metal',
        source_def_sha256=hashlib.sha256(def_path.read_bytes()).hexdigest(),
        packaged_gds_sha256=hashlib.sha256(gds_path.read_bytes()).hexdigest(),
    )
    output.write_text(json.dumps(metrics, indent=2) + '\n')
    return metrics


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('def_path', type=Path)
    parser.add_argument('gds_path', type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    print(write_metrics(args.def_path, args.gds_path, args.output))
