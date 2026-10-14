#pragma once
enum zone { ZONE_NEAR, ZONE_MIDDLE, ZONE_CLEAR, ZONE_FAULT };
enum zone classify_distance_mm(int distance_mm, enum zone previous);
