#!/usr/bin/env bash
set -euo pipefail
test -f projects/operator-buttons/src/operator_buttons.c
cc -std=c11 -Wall -Wextra -Werror -c projects/operator-buttons/src/operator_buttons.c -o /tmp/operator-buttons.o
echo "operator-buttons starter checks passed"
