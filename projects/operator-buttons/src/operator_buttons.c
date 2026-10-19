#include <stdbool.h>
#include <stddef.h>

struct button_state { bool stable; bool sampled; unsigned consecutive; };

bool button_update(struct button_state *state, bool sample, unsigned debounce_samples) {
    if (!state || debounce_samples == 0) return false;
    state->consecutive = sample == state->sampled ? state->consecutive + 1 : 1;
    state->sampled = sample;
    if (state->consecutive < debounce_samples || state->stable == sample) return false;
    state->stable = sample;
    return true;
}
