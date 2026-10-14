from __future__ import annotations
import json
from pathlib import Path
import re

ROOT = Path(__file__).parents[1]
DENIED_PARTS = {"evaluator", "private-evaluator", "solutions", "staff", "authoring", "release-evidence"}
SECRET_PATTERNS = [re.compile(rb"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----"), re.compile(rb"(?i)(?:api[_-]?key|token|password)\s*[:=]\s*['\"][^'\"]{12,}")]
cfg = json.loads((ROOT / ".embeddedville-workspace.json").read_text())
assert cfg["repository"] == "ShuranXu/embeddedville-linux-project-studio"
assert cfg["starterVersion"] == "2026.10-qemu-workspace-v1"
for path in ROOT.rglob("*"):
    if ".git" in path.parts or not path.is_file(): continue
    lowered = {part.lower() for part in path.relative_to(ROOT).parts}
    assert not lowered.intersection(DENIED_PARTS), f"denied public path: {path}"
    data = path.read_bytes()
    for pattern in SECRET_PATTERNS: assert not pattern.search(data), f"credential-like content: {path}"
print("Public workspace boundary validated.")
