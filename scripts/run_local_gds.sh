#!/usr/bin/env bash
# Run from the host (or an environment that permits unprivileged namespaces).
# Never changes container permissions, commits, or pushes.
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
MODE="${1:-build}"
if [[ "$MODE" != build && "$MODE" != --check-only ]]; then
    echo "Usage: bash scripts/run_local_gds.sh [--check-only]" >&2
    exit 2
fi
CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/tiny-sparse-tt"
RUN_ID="local_$(date +%Y%m%d_%H%M%S)_$$"
LOG_DIR="$ROOT/test/output/local_gds/$RUN_ID"
mkdir -p "$LOG_DIR" "$CACHE"
printf '%s\n' "$LOG_DIR" > "$ROOT/test/output/local_gds/LATEST"
exec > >(tee "$LOG_DIR/console.log") 2>&1
trap 'code=$?; printf "Exit code: %s\nLogs: %s\n" "$code" "$LOG_DIR"; exit "$code"' EXIT
printf 'Project: %s\nLogs: %s\n' "$ROOT" "$LOG_DIR"

# Test the same namespace class needed by the AppImage before any downloads.
if command -v unshare >/dev/null 2>&1; then
    if ! unshare --user --map-root-user --mount true; then
        echo "BLOCKED: this environment cannot create the required user/mount namespaces."
        echo "Run this script on the host or another permitted environment."
        echo "No build, privilege change, or GitHub operation was performed."
        exit 3
    fi
fi

ARCH="$(uname -m)"
case "$ARCH" in x86_64|aarch64) ;; *) echo "Unsupported architecture: $ARCH"; exit 2;; esac
APP="${TT_LIBRELANE_APPIMAGE:-$CACHE/librelane-3.0.14-$ARCH.AppImage}"
if [[ ! -f "$APP" ]]; then
    # Reuse the already downloaded image on the current machine when possible.
    if [[ "$ARCH" == x86_64 && -f /tmp/tiny-sparse-librelane.AppImage && -z "${TT_LIBRELANE_APPIMAGE:-}" ]]; then
        APP=/tmp/tiny-sparse-librelane.AppImage
    else
        mkdir -p "$(dirname "$APP")"
        echo "Downloading LibreLane 3.0.14 (about 1.4 GB)..."
        python3 - "$ARCH" "$APP" <<'PY'
import os, sys, urllib.request
arch, target = sys.argv[1:]
url = f'https://github.com/librelane/librelane/releases/download/3.0.14/librelane-devshell-{arch}.AppImage'
urllib.request.urlretrieve(url, target + '.part')
os.replace(target + '.part', target)
PY
    fi
fi
chmod u+x "$APP"
# Extract-and-run avoids a dependency on FUSE; namespaces are still required.
"$APP" --appimage-extract-and-run librelane --version
if [[ "$MODE" == --check-only ]]; then
    echo 'Environment check passed. Run without --check-only to build GDS.'
    exit 0
fi

TT_REF=62b629281188f336ffee4255e67766d001401d23
TT_DIR="$CACHE/tt-support-$TT_REF"
if [[ ! -d "$TT_DIR/.git" ]]; then
    git clone https://github.com/TinyTapeout/tt-support-tools.git "$TT_DIR"
    git -C "$TT_DIR" checkout --detach "$TT_REF"
fi
[[ "$(git -C "$TT_DIR" rev-parse HEAD)" == "$TT_REF" ]] || { echo 'Unexpected TT tools revision'; exit 2; }
# Ciel may download its GF180 PDK on the first run. Never use the raw source PDK.
PDK_CACHE="${PDK_ROOT:-$CACHE/pdk}"
mkdir -p "$PDK_CACHE"
"$APP" --appimage-extract-and-run python "$ROOT/scripts/local_gds.py" \
    "$ROOT" "$TT_DIR" "$PDK_CACHE" "$RUN_ID" "$LOG_DIR"
