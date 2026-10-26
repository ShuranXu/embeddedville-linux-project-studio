# Applied Embedded Linux Systems workspace

This directory is the build-system-neutral learner area for contract `2026.10-applied-linux-v1`. The authoritative target is `qemuarm64`; Raspberry Pi transfer work is optional.

The course keeps host tools, the pinned Arm cross-toolchain, sysroot, kernel build tree, modules, hardware description, root filesystem, and deployed artifacts as explicit compatibility boundaries. No image-construction framework is required.

Each activity directory contains an `evidence.json` starter. Replace the placeholder observation, add the artifacts named by the course lab, then run:

```sh
./lab check --activity ACTIVITY_ID
./lab submit --activity ACTIVITY_ID
```

Required labs: `boot-diagnostics`, `module-interface`, `virtual-sensor-driver`, and `profile-optimize`. The small final activity is `applied-linux-evidence-bundle`.
