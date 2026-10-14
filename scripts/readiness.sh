#!/usr/bin/env bash
set -euo pipefail
command -v python3 >/dev/null
command -v cc >/dev/null
python3 -m py_compile ./lab
python3 tests/validate_workspace.py
printf 'Workspace ready: starter 2026.10-qemu-workspace-v1\n'
