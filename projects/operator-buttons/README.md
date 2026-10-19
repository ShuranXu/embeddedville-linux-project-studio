# Four-Button Linux Input Panel

Build a QEMU-testable four-button input panel with stable key mappings, measured debounce, bounded fault handling, and cleanup that prevents stale key state. Keep implementation in `src/`, deterministic checks in `tests/`, and evidence in `evidence/`.

Required demonstration: normal press/release order, bounce suppression, stuck/noisy input injection, signal-driven cleanup, and a concise portfolio walkthrough. Raspberry Pi wiring is optional and must never replace the QEMU acceptance evidence.
