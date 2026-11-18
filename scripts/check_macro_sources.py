#!/usr/bin/env python3
"""Fail if the packaged core no longer matches its recorded RTL inputs."""
import hashlib
import json
from pathlib import Path

root = Path(__file__).resolve().parents[1]
provenance = json.loads((root / 'macro/tiny_sparse_acc_core/provenance.json').read_text())
inputs = provenance['rtl_sha256']
assert inputs, 'Missing RTL provenance'
for name, expected in inputs.items():
    actual = hashlib.sha256((root / name).read_bytes()).hexdigest()
    if actual != expected:
        raise SystemExit(f'Hard macro is stale: {name} differs from packaged RTL')
print(f'PASS: packaged macro matches {len(inputs)} RTL input files')
