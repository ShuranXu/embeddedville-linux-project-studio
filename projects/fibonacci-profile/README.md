# Fibonacci Performance and Overflow Dossier

Compare recursive and iterative Fibonacci implementations with the same QEMU workload, preserve before/after profiles, and reject any input whose result cannot fit in unsigned 64-bit storage. Keep code in `src/`, boundary tests in `tests/`, and raw evidence in `evidence/`.

Required demonstration: recursive call-stack evidence, comparable performance measurements, correct F(93), explicit rejection of F(94), and an evidence-led engineering conclusion.
