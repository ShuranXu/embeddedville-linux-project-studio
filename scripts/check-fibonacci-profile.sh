#!/usr/bin/env bash
set -euo pipefail
test -f projects/fibonacci-profile/src/fibonacci.c
cc -std=c11 -Wall -Wextra -Werror -c projects/fibonacci-profile/src/fibonacci.c -o /tmp/fibonacci-profile.o
echo "fibonacci-profile starter checks passed"
