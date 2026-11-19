#!/usr/bin/env python3
"""Join a wrapper and one macro SPEF without hierarchical alias stitching.

Strictly supports the extracted D_NET/CONN/CAP/RES dialect used by ICC2 and
OpenRCX here. Boundary pins become RC junctions, not ideal shorts to top ports.
Outputs PF/OHM; never changes extraction values or external SDC loads.
"""
import argparse
from collections import defaultdict
from dataclasses import dataclass, field
from decimal import Decimal
import hashlib
import json
from pathlib import Path
import re


@dataclass
class Net:
    name: str
    conn: list = field(default_factory=list)
    caps: list = field(default_factory=list)
    resistors: list = field(default_factory=list)


def read_spef(path):
    names, nets, ports = {}, [], {}
    section = None
    cscale = rscale = None
    design = None
    def expand(token):
        return re.sub(r'\*(\d+)', lambda m: names[m[1]], token)
    for raw in Path(path).read_text().splitlines():
        line = raw.split('//')[0].strip()
        if not line:
            continue
        t = line.split()
        if t[0] == '*DESIGN':
            design = line.split('"')[1]
        elif t[0] == '*DIVIDER' and t[1] != '/':
            raise ValueError('Only hierarchy divider / supported')
        elif t[0] == '*DELIMITER' and t[1] != ':':
            raise ValueError('Only pin delimiter : supported')
        elif t[0] == '*C_UNIT':
            cscale = Decimal(t[1]) * {'PF': Decimal(1), 'FF': Decimal('.001')}[t[2]]
        elif t[0] == '*R_UNIT':
            rscale = Decimal(t[1]) * {'OHM': Decimal(1), 'KOHM': Decimal(1000)}[t[2]]
        elif t[0] in ('*NAME_MAP', '*PORTS', '*CONN', '*CAP', '*RES'):
            section = t[0]
        elif t[0] == '*D_NET':
            if cscale is None or rscale is None:
                raise ValueError('Missing units')
            nets.append(Net(expand(t[1])))
            section = None
        elif t[0] == '*END':
            section = None
        elif section == '*NAME_MAP':
            names[t[0][1:]] = t[1]
        elif section == '*PORTS':
            ports[expand(t[0])] = t[1]
        elif section == '*CONN':
            if t[0] in ('*I', '*P'):
                nets[-1].conn.append((t[0], expand(t[1]), t[2]))
        elif section == '*CAP':
            if len(t) not in (3, 4):
                raise ValueError(f'Unsupported capacitor: {line}')
            nets[-1].caps.append((tuple(expand(x) for x in t[1:-1]), Decimal(t[-1]) * cscale))
        elif section == '*RES':
            if len(t) != 4:
                raise ValueError(f'Unsupported resistor: {line}')
            nets[-1].resistors.append((tuple(expand(x) for x in t[1:3]), Decimal(t[3]) * rscale))
        elif t[0] in ('*R_NET', '*D_PNET', '*R_PNET', '*INDUC'):
            raise ValueError(f'Unsupported SPEF section {t[0]}')
    if not design or not nets:
        raise ValueError('Empty or malformed SPEF')
    return design, ports, nets


def assemble(wrapper, macro, instance, output, ground_coupling=False):
    design, ports, wn = read_spef(wrapper)
    _, declared_ports, mn = read_spef(macro)
    nets = wn + mn
    parent = list(range(len(nets)))
    def root(i):
        while i != parent[i]:
            parent[i] = parent[parent[i]]
            i = parent[i]
        return i
    def union(a, b):
        a, b = root(a), root(b)
        parent[max(a, b)] = min(a, b)
    macro_ports = {}
    for i, n in enumerate(mn, len(wn)):
        for kind, name, direction in n.conn:
            if kind == '*P':
                if name in macro_ports:
                    raise ValueError(f'Duplicate macro port {name}')
                macro_ports[name] = i
    boundary = {}
    unused_boundary = {}
    for i, n in enumerate(wn):
        for kind, name, direction in n.conn:
            if kind == '*I' and name.startswith(instance + ':'):
                port = name[len(instance) + 1:]
                if port not in macro_ports:
                    if port in declared_ports:
                        unused_boundary[port] = i
                        continue  # Declared unused input: no extracted macro wire.
                    raise ValueError(f'Macro port absent from extraction: {port}')
                boundary[port] = i
                union(i, macro_ports[port])
    missing = macro_ports.keys() - boundary.keys()
    if missing:
        raise ValueError(f'Unconnected extracted macro ports: {sorted(missing)}')
    groups = defaultdict(list)
    for i in range(len(nets)):
        groups[root(i)].append(i)
    net_names = {r: (nets[r].name if r < len(wn) else instance + '/' + nets[r].name) for r in groups}
    # Use numeric RC nodes at boundaries, so STA cannot resolve a hierarchical
    # alias port as the external port and discard its resistive branch.
    junctions = {p: net_names[root(i)] + ':' + str(1000000 + j)
                 for j, (p, i) in enumerate(sorted((boundary | unused_boundary).items()))}
    # Internal RC node labels must refer to a real top-level net after joining.
    # In particular, DEF's unused-port _dummynet names are not logical netlist
    # names. Re-label numeric junctions bijectively, retaining all R/C edges.
    internal_nodes = {}
    for i, n in enumerate(nets):
        endpoints = [ns for ns, _ in n.resistors]
        endpoints += [ns for ns, _ in n.caps if len(ns) == 1]
        terminals = {name for _, name, _ in n.conn}
        for ns in endpoints:
            for name in ns:
                if name in terminals or ':' not in name or not name.rsplit(':', 1)[1].isdigit():
                    continue
                key = (i >= len(wn), name)
                if key not in internal_nodes:
                    internal_nodes[key] = net_names[root(i)] + ':' + str(2000000 + len(internal_nodes))
    def node(i, name):
        key = (i >= len(wn), name)
        if key in internal_nodes:
            return internal_nodes[key]
        if i < len(wn):
            if name.startswith(instance + ':'):
                return junctions.get(name[len(instance) + 1:], name)
            return name
        if name in junctions:
            return junctions[name]
        return instance + '/' + name
    conns, caps, resistors = defaultdict(list), defaultdict(list), defaultdict(list)
    # Coupling is conventionally repeated once in each participating D_NET.
    # Deduplicate only those mirrored records, not independent parallel edges.
    coupling = {}
    before_r = Decimal(0)
    before_ground = Decimal(0)
    for i, n in enumerate(nets):
        r = root(i)
        for kind, name, direction in n.conn:
            if (i < len(wn) and name.startswith(instance + ':')) or (i >= len(wn) and kind == '*P'):
                continue
            conns[r].append((kind, node(i, name), direction))
        for nodes, value in n.resistors:
            resistors[r].append((tuple(node(i, x) for x in nodes), value))
            before_r += value
        for nodes, value in n.caps:
            mapped = tuple(node(i, x) for x in nodes)
            if len(nodes) == 1:
                caps[r].append((mapped, value))
                before_ground += value
            else:
                key = tuple(sorted(mapped))
                rec = coupling.setdefault(key, {'value': value, 'owners': []})
                if rec['value'] != value or i in rec['owners']:
                    raise ValueError(f'Ambiguous parallel/mismatched coupling {key}')
                rec['owners'].append(i)
    owner = {}
    for r in groups:
        for nodes, _ in resistors[r] + caps[r]:
            for n in nodes:
                if n in owner and owner[n] != r:
                    raise ValueError(f'RC node belongs to different nets: {n}')
                owner[n] = r
    for nodes, rec in coupling.items():
        if len(rec['owners']) > 2:
            raise ValueError(f'Multiply defined coupling {nodes}')
        if ground_coupling:
            # Explicit grounded approximation, one full C at EACH endpoint.
            # Even same-net coupling is retained as grounded load (pessimistic).
            # Keep the coupled SPEF separately; this is not a SI analysis.
            for n in nodes:
                if n not in owner:
                    raise ValueError(f'Coupling endpoint has no RC owner: {n}')
                caps[owner[n]].append(((n,), rec['value']))
        else:
            for r in {root(i) for i in rec['owners']}:
                caps[r].append((nodes, rec['value']))
    # Every explicit terminal must be reachable through the original resistor
    # network. This detects omitted alias branches before handing data to STA.
    for r in groups:
        graph = defaultdict(set)
        for (a, b), _ in resistors[r]:
            graph[a].add(b)
            graph[b].add(a)
        terminals = {n for _, n, _ in conns[r]}
        if terminals:
            visited, todo = set(), [next(iter(terminals))]
            while todo:
                n = todo.pop()
                if n not in visited:
                    visited.add(n)
                    todo.extend(graph[n] - visited)
            if terminals - visited:
                raise ValueError(f'Disconnected terminals on {net_names[r]}: {terminals - visited}')
    header = ['*SPEF "IEEE 1481-1998"', f'*DESIGN "{design}"', '*DATE "assembled"', '*VENDOR "RC assembly"',
              '*PROGRAM "assemble_spef.py"', '*VERSION "1"', '*DESIGN_FLOW "PIN_CAP NONE"',
              '*DIVIDER /', '*DELIMITER :', '*BUS_DELIMITER [ ]', '*T_UNIT 1 NS',
              '*C_UNIT 1 PF', '*R_UNIT 1 OHM', '*L_UNIT 1 HENRY', '*PORTS']
    header += [f'{p} {d}' for p, d in ports.items()]
    for r in groups:
        header += [f'*D_NET {net_names[r]} {sum(v for _, v in caps[r])}', '*CONN']
        header += [' '.join(c) for c in conns[r]]
        header += ['*CAP'] + [f'{j} {" ".join(ns)} {v}' for j, (ns, v) in enumerate(caps[r], 1)]
        header += ['*RES'] + [f'{j} {" ".join(ns)} {v}' for j, (ns, v) in enumerate(resistors[r], 1)]
        header += ['*END', '']
    Path(output).write_text('\n'.join(header))
    summary = {
        'wrapper_sha256': hashlib.sha256(Path(wrapper).read_bytes()).hexdigest(),
        'macro_sha256': hashlib.sha256(Path(macro).read_bytes()).hexdigest(),
        'coupling_model': 'fully_grounded' if ground_coupling else 'preserved',
        'boundary_ports': len(boundary), 'nets': len(groups),
        'resistors': sum(len(x) for x in resistors.values()),
        'resistance_sum_ohm': str(before_r),
        'ground_capacitance_sum_pf': str(before_ground),
        'unique_coupling_edges': len(coupling),
        'unique_coupling_sum_pf': str(sum(x['value'] for x in coupling.values())),
        'merged_wrapper_nets': [[nets[i].name for i in group if i < len(wn)]
                                for group in groups.values() if sum(i < len(wn) for i in group) > 1],
        'connected_terminals': True,
        'note': 'Assembly preserves input RC models; it is not re-extraction or SI signoff.',
    }
    Path(str(output) + '.json').write_text(json.dumps(summary, indent=2) + '\n')
    return summary


if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--wrapper', required=True)
    p.add_argument('--macro', required=True)
    p.add_argument('--instance', default='core')
    p.add_argument('--output', required=True)
    p.add_argument('--ground-coupling', action='store_true', help='Explicit grounded static approximation; keep the coupled original too')
    a = p.parse_args()
    print(json.dumps(assemble(a.wrapper, a.macro, a.instance, a.output, a.ground_coupling), indent=2))
