#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
activity="${1:?usage: ./scripts/check-applied.sh ACTIVITY}"
activity_root="$root/applied/$activity"
test -d "$activity_root"
test -s "$activity_root/evidence.json"
python3 - "$activity_root/evidence.json" "$activity" <<'PY'
import json, pathlib, sys
path, activity = pathlib.Path(sys.argv[1]), sys.argv[2]
record = json.loads(path.read_text())
assert record["courseId"] == "advanced"
assert record["contractVersion"] == "2026.10-applied-linux-v1"
assert record["itemId"] == activity
assert record["target"] == "qemuarm64"
assert record.get("observations") and all(len(item.strip()) >= 40 for item in record["observations"])
assert all("REPLACE" not in item.upper() for item in record["observations"])
assert record.get("artifacts") and all(pathlib.Path(path.parent, item).is_file() for item in record["artifacts"])
PY
printf 'Applied Linux public check passed: %s\n' "$activity"
