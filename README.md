# EmbeddedVille Linux Project Studio

This v2 workspace contains three formative practice labs and five required portfolio projects. QEMU is the authoritative target for all checks and submissions; Raspberry Pi work is optional. Practice attempts unlock only their matching protected solution and never count toward private completion.

Public, course-scoped starter workspace for the three assessed Embedded Linux Project Studio projects. It contains learner starter code and public checks only. Private evaluator scenarios, reference solutions, licensed authoring sources, staff notes, and credentials are intentionally absent.

## Start in Codespaces

Open the immutable course link from EmbeddedVille. A fresh workspace installs the QEMU and cross-debug tools and runs `./scripts/readiness.sh`.

Choose one project:

```bash
./lab check --activity module-autoload
./lab check --activity sensor-controller
./lab check --activity sdk-debug-tool
```

Follow the matching project guide on EmbeddedVille. QEMU proves the package, userspace, and debug contracts that it models; it does not prove Raspberry Pi electrical or timing behavior.

Submit the current allowlisted workspace, including uncommitted edits:

```bash
./lab submit --activity module-autoload
```

The command prints a short-lived verification URL and code. Sign in, verify the repository, activity, starter version, source state, and snapshot digest, then approve the one-time transfer.

Saving a file is not submission. Stopping and restarting a Codespace normally preserves saved workspace files, while deleting the Codespace or allowing retention to expire can remove unpushed work. Stop compute when finished. GitHub account, Codespaces availability, quota, billing, and retention follow your GitHub plan and organization policy.

Only paths declared in `.embeddedville-workspace.json` enter a submission. `.git`, environment files, credentials, keys, caches, build output, symlinks, and private evaluator paths are rejected. Do not place secrets in this repository or workspace.
