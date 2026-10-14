#!/usr/bin/env bash
set -euo pipefail
manifest="${1:?usage: verify-kit.sh MANIFEST}"
python3 - "$manifest" <<'PY'
import json, pathlib, sys
data=json.loads(pathlib.Path(sys.argv[1]).read_text())
required={"schemaVersion","buildId","targetArchitecture","imageSha256","sdkSha256","binarySha256","symbolsSha256"}
missing=sorted(required-data.keys())
if missing: raise SystemExit(f"missing manifest keys: {', '.join(missing)}")
if data["schemaVersion"] != 1: raise SystemExit("unsupported manifest schema")
print("Manifest shape is valid; replace placeholders and add artifact verification for your project.")
PY
