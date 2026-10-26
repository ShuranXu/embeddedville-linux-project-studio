from __future__ import annotations
import json
from pathlib import Path
import re

ROOT = Path(__file__).parents[1]
DENIED_PARTS = {"evaluator", "private-evaluator", "solutions", "staff", "authoring", "release-evidence"}
SECRET_PATTERNS = [re.compile(rb"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----"), re.compile(rb"(?i)(?:api[_-]?key|token|password)\s*[:=]\s*['\"][^'\"]{12,}")]
cfg = json.loads((ROOT / ".embeddedville-workspace.json").read_text())
assert cfg["repository"] == "ShuranXu/embeddedville-linux-project-studio"
assert cfg["starterVersion"] == "2026.10-qemu-workspace-v2"
assert cfg["authoritativeTarget"] == "qemu"
activities = cfg["activities"]
assert [key for key, value in activities.items() if value["courseId"] == "advanced"] == [
    "boot-diagnostics", "module-interface", "virtual-sensor-driver", "profile-optimize", "applied-linux-evidence-bundle"
]
assert all(activities[key]["starterVersion"] == "2026.10-applied-linux-v1" for key in activities if activities[key]["courseId"] == "advanced")
assert [key for key, value in activities.items() if value["courseId"] == "projects" and value["kind"] == "practice"] == [
    "target-boot-triage", "input-faults-cleanup", "performance-overflow-investigation"
]
assert [key for key, value in activities.items() if value["courseId"] == "projects" and value["kind"] == "project"] == [
    "module-autoload", "operator-buttons", "sensor-controller", "sdk-debug-tool", "fibonacci-profile"
]
for path in ROOT.rglob("*"):
    if ".git" in path.parts or not path.is_file(): continue
    lowered = {part.lower() for part in path.relative_to(ROOT).parts}
    assert not lowered.intersection(DENIED_PARTS), f"denied public path: {path}"
    data = path.read_bytes()
    for pattern in SECRET_PATTERNS: assert not pattern.search(data), f"credential-like content: {path}"
active_applied = "\n".join(path.read_text(errors="ignore") for path in (ROOT / "applied").rglob("*") if path.is_file())
assert not re.search(r"\b(?:Yocto|Poky|BitBake|OpenEmbedded|bbappend|recipes?|layers?)\b", active_applied, re.IGNORECASE)
print("Public workspace boundary validated.")
