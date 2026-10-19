#!/usr/bin/env bash
set -euo pipefail
command -v python3 >/dev/null
command -v cc >/dev/null
python3 -m py_compile ./lab
python3 tests/validate_workspace.py
for activity in target-boot-triage input-faults-cleanup performance-overflow-investigation; do
  ./scripts/check-practice-lab.sh "$activity"
done
./scripts/check-operator-buttons.sh
./scripts/check-fibonacci-profile.sh
printf 'Workspace ready: starter 2026.10-qemu-workspace-v2\n'
