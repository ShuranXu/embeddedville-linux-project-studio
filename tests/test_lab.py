import importlib.machinery, importlib.util
from pathlib import Path
import unittest
ROOT = Path(__file__).parents[1]
loader = importlib.machinery.SourceFileLoader("embeddedville_lab", str(ROOT / "lab"))
spec = importlib.util.spec_from_loader(loader.name, loader)
lab = importlib.util.module_from_spec(spec)
loader.exec_module(lab)

class LabSnapshotTests(unittest.TestCase):
    def test_snapshot_is_deterministic(self):
        cfg = lab.config(); a, az = lab.snapshot(cfg); b, bz = lab.snapshot(cfg)
        self.assertEqual(a, b); self.assertEqual(az, bz)
    def test_private_paths_are_not_allowlisted(self):
        paths = {p.relative_to(ROOT).as_posix() for p in lab.selected_files(lab.config())}
        self.assertTrue(paths); self.assertFalse(any(p.startswith(".git/") for p in paths))
