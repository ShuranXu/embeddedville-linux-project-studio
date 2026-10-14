#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
test -f "$root/projects/module-autoload/meta-embeddedville-product/recipes-kernel/hello/hello_1.0.bb"
grep -Eq 'KERNEL_MODULE_AUTOLOAD.*hello' "$root/projects/module-autoload/meta-embeddedville-product/recipes-kernel/hello/hello_1.0.bb"
grep -Eq 'IMAGE_INSTALL.*hello' "$root/projects/module-autoload/meta-embeddedville-product/recipes-core/images/embeddedville-project-image.bbappend"
printf 'Public module-autoload checks passed. Run the course guide for target evidence.\n'
