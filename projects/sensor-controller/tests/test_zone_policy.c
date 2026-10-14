#include <assert.h>
#include <stdio.h>
#include "../src/zone_policy.h"

int main(void)
{
    assert(classify_distance_mm(-1, ZONE_CLEAR) == ZONE_FAULT);
    assert(classify_distance_mm(800, ZONE_CLEAR) == ZONE_CLEAR);
    puts("Starter checks passed; complete boundary and hysteresis cases from the course guide.");
    return 0;
}
