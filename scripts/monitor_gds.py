#!/usr/bin/env python3
"""Run a GDS build with bounded console output and periodic diagnostics."""

import argparse
from datetime import datetime, timezone
from pathlib import Path
import os
import signal
import subprocess
import time


def tail(path, count=10):
    # Read only the end, even when synthesis produces a very large log.
    try:
        with path.open('rb') as stream:
            stream.seek(0, 2)
            stream.seek(max(0, stream.tell() - 8192))
            return stream.read().decode(errors='replace').splitlines()[-count:]
    except OSError as error:
        return [str(error)]


def command_output(command):
    try:
        result = subprocess.run(command, capture_output=True, text=True, timeout=10)
        return result.stdout.strip() or result.stderr.strip()
    except (OSError, subprocess.TimeoutExpired) as error:
        return str(error)


def snapshot(console, report, started):
    lines = [
        f'\n[GDS monitor] {datetime.now(timezone.utc).isoformat()} '
        f'elapsed={time.monotonic() - started:.0f}s',
        'Host memory:',
        command_output(['free', '-m']),
        'Processes: PID PPID lifetime-CPU% RSS-KiB elapsed state name',
        '\n'.join(command_output([
            'ps', '-eo', 'pid,ppid,pcpu,rss,etime,stat,comm', '--sort=-pcpu'
        ]).splitlines()[:13]),
        'Docker containers (if available):',
        command_output([
            'docker', 'stats', '--no-stream', '--format',
            '{{.Name}} CPU={{.CPUPerc}} memory={{.MemUsage}}'
        ]),
        'Build console tail:',
        *tail(console),
    ]
    logs = []
    for path in Path('runs/wokwi').rglob('*.log'):
        try:
            logs.append((path.stat().st_mtime, path))
        except OSError:
            pass
    for modified, path in sorted(logs, reverse=True)[:2]:
        lines.append(f'Internal log: {path} '
                     f'(modified {datetime.fromtimestamp(modified, timezone.utc).isoformat()})')
        lines.extend(tail(path))
    message = '\n'.join(lines) + '\n'
    print(message, flush=True)
    report.write(message)
    report.flush()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--interval', type=float, default=30)
    parser.add_argument('--output', type=Path, default=Path('test/output/gds_diagnostics'))
    parser.add_argument('command', nargs=argparse.REMAINDER)
    args = parser.parse_args()
    command = args.command
    if command and command[0] == '--':
        command = command[1:]
    if not command or args.interval <= 0:
        parser.error('a command and a positive interval are required')

    args.output.mkdir(parents=True, exist_ok=True)
    console = args.output / 'build-console.log'
    started = time.monotonic()
    with console.open('w') as output, (args.output / 'monitor.log').open('w') as report:
        process = subprocess.Popen(command, stdout=output, stderr=subprocess.STDOUT,
                                   start_new_session=True)

        def forward_signal(number, frame):
            try:
                os.killpg(process.pid, number)
            except ProcessLookupError:
                pass
            raise SystemExit(128 + number)

        signal.signal(signal.SIGTERM, forward_signal)
        signal.signal(signal.SIGINT, forward_signal)
        while True:
            snapshot(console, report, started)
            try:
                code = process.wait(timeout=args.interval)
                break
            except subprocess.TimeoutExpired:
                pass
        snapshot(console, report, started)
        print(f'[GDS monitor] Build exit code: {code}', flush=True)
        return code if code >= 0 else 128 - code


if __name__ == '__main__':
    raise SystemExit(main())
