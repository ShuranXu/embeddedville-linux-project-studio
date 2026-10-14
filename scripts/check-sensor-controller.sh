#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p /tmp/embeddedville-sensor-check
cc -std=c11 -Wall -Wextra -Werror "$root/projects/sensor-controller/src/zone_policy.c" "$root/projects/sensor-controller/tests/test_zone_policy.c" -o /tmp/embeddedville-sensor-check/test-zone
/tmp/embeddedville-sensor-check/test-zone
