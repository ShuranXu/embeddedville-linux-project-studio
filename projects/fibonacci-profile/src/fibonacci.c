#include <stdbool.h>
#include <stdint.h>

bool fibonacci_u64(unsigned n, uint64_t *value) {
    if (!value) return false;
    uint64_t a = 0, b = 1;
    for (unsigned i = 0; i < n; ++i) {
        if (UINT64_MAX - a < b) return false;
        uint64_t next = a + b;
        a = b;
        b = next;
    }
    *value = a;
    return true;
}
