#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p /tmp/embeddedville-sdk-check
cc -g3 -Og -fno-omit-frame-pointer "$root/projects/sdk-debug-tool/src/hello.c" -o /tmp/embeddedville-sdk-check/hello
file /tmp/embeddedville-sdk-check/hello | grep -q 'not stripped'
"$root/projects/sdk-debug-tool/tools/verify-kit.sh" "$root/projects/sdk-debug-tool/kit-manifest.example.json"
printf 'Public SDK/debug-kit checks passed.\n'
