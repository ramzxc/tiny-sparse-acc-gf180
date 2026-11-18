#!/usr/bin/env python3
"""Restore macro-boundary port aliases using only Magic extraction evidence."""
import argparse
from pathlib import Path
import re
import shlex


def restore(spice_path, ext_path):
    source = spice_path.read_text()
    parent = {}
    ports = set()

    def find(node):
        parent.setdefault(node, node)
        if parent[node] != node:
            parent[node] = find(parent[node])
        return parent[node]

    def join(a, b):
        parent[find(a)] = find(b)

    # Raw layout connectivity; never use the reference schematic to add wires.
    lines = [shlex.split(line) for line in ext_path.read_text().splitlines()]
    for fields in lines:
        if fields and fields[0] == "port":
            ports.add(fields[1])
        elif fields and fields[0] in ("merge", "equiv"):
            join(fields[1], fields[2])

    name = ext_path.stem
    header_pattern = r"(?im)^\.subckt\s+{}\s+[^\n]*(?:\n\+[^\n]*)*"
    headers = list(re.finditer(header_pattern.format(re.escape(name)), source))
    if len(headers) != 1:
        raise ValueError(f"Expected exactly one subcircuit {name}")
    header = headers[0]
    present = set(header.group().replace("\n+", " ").split()[2:])
    missing = sorted(ports - present)
    if not missing:
        print(f"SPICE ports intact: {name}")
        return []

    # This workaround is scoped to the one hard macro used by this wrapper.
    uses = [f for f in lines if f and f[0] == "use" and f[1] == "tiny_sparse_acc_core"]
    if len(uses) != 1:
        raise ValueError("Expected one extracted tiny_sparse_acc_core instance")
    instance = uses[0][2]
    core_ext = ext_path.parent / "tiny_sparse_acc_core.ext"
    for line in core_ext.read_text().splitlines():
        f = shlex.split(line)
        if f and f[0] == "equiv":
            join(instance + "/" + f[1], instance + "/" + f[2])

    core_header = re.search(header_pattern.format("tiny_sparse_acc_core"), source)
    if core_header is None:
        raise ValueError("Missing extracted macro subcircuit")
    core_pins = core_header.group().replace("\n+", " ").split()[2:]
    core_end = re.search(r"(?im)^\.ends\b", source[core_header.end():])
    if core_end is None:
        raise ValueError("Missing macro .ends")
    core_body = source[core_header.end():core_header.end() + core_end.start()]
    alias_edges = {}
    for line in core_body.splitlines():
        f = line.split()
        if len(f) == 4 and f[0].upper().startswith("R") and float(f[-1]) == 0:
            alias_edges.setdefault(f[1], set()).add(f[2])
            alias_edges.setdefault(f[2], set()).add(f[1])
    alias_pins = set(missing)
    pending = list(missing)
    while pending:
        for pin in alias_edges.get(pending.pop(), ()):
            if pin not in alias_pins:
                alias_pins.add(pin)
                pending.append(pin)

    end = re.search(r"(?im)^\.ends\b[^\n]*", source[header.end():])
    if end is None:
        raise ValueError("Missing .ends")
    end_pos = header.end() + end.start()
    body = source[header.end():end_pos]
    pattern = r"(?im)^X" + re.escape(instance) + r"\s+[^\n]*(?:\n\+[^\n]*)*"
    matches = list(re.finditer(pattern, body))
    if len(matches) != 1:
        raise ValueError("Missing or duplicate macro instance")
    call = matches[0]
    tokens = call.group().replace("\n+", " ").split()
    if tokens[-1] != "tiny_sparse_acc_core" or len(tokens) != len(core_pins) + 2:
        raise ValueError("Unexpected macro port list")

    repaired = []
    affected = {find(pin) for pin in missing}
    for index, pin in enumerate(core_pins, 1):
        if pin not in ports or find(pin) not in affected:
            continue
        if pin not in alias_pins or not alias_edges.get(pin):
            raise ValueError(f"Macro SPICE does not prove an existing zero-ohm alias for {pin}")
        old = tokens[index]
        terminal = instance + "/" + pin
        # All three names must already denote the SAME extracted conductor.
        if find(old) != find(pin) or find(terminal) != find(pin):
            raise ValueError(f"Layout does not prove alias {old} = {pin} = {terminal}")
        if old != pin:
            tokens[index] = pin
            repaired.append((old, pin))

    if not set(missing) <= {new for _, new in repaired}:
        raise ValueError("Not all missing ports can be restored from layout")
    # Keep the macro's existing zero-ohm aliases, devices and other wiring.
    body = body[:call.start()] + " ".join(tokens) + body[call.end():]
    corrected = (
        source[:header.end()] + "\n+ " + " ".join(missing)
        + body + source[end_pos:]
    )
    spice_path.with_suffix(spice_path.suffix + ".before-port-aliases").write_text(source)
    spice_path.write_text(corrected)
    for old, new in repaired:
        print(f"Restored layout-proven port alias: {old} -> {new}")
    return repaired


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("spice", type=Path)
    parser.add_argument("ext", type=Path)
    args = parser.parse_args()
    restore(args.spice, args.ext)
