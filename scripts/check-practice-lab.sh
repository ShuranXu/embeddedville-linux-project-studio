#!/usr/bin/env bash
set -euo pipefail
lab_id="${1:-}"
case "$lab_id" in
  target-boot-triage|input-faults-cleanup|performance-overflow-investigation) ;;
  *) echo "unknown practice lab: $lab_id" >&2; exit 2 ;;
esac
test -f "labs/$lab_id/README.md"
grep -qi "QEMU" "labs/$lab_id/README.md"
echo "$lab_id starter is ready"
