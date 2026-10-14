#include "zone_policy.h"

enum zone classify_distance_mm(int distance_mm, enum zone previous)
{
    (void)previous;
    if (distance_mm < 0) return ZONE_FAULT;
    /* TODO: implement the course's 15 cm / 50 cm policy and measured hysteresis. */
    return ZONE_CLEAR;
}
