#!/usr/bin/env bash
set -euo pipefail
# This is the only setting needed for installation.
CONFIG_DIR="${CONFIG_DIR:-$HOME/.config}"
exec python3 "$(dirname -- "$(readlink -f -- "$0")")/install.py" "$CONFIG_DIR" "$@"
