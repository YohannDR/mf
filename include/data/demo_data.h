#ifndef DEMO_DATA_H
#define DEMO_DATA_H

#include "constants/demo.h"

#include "structs/demo.h"

extern const struct DemoData sDemoData[DEMO_ID_END];
extern const struct DemoRam sDemoRam[DEMO_ID_END];
extern const u8 sDemoNumbers[DEMO_ID_END];

extern const u8 sDemo_3e40c8[5 * 4];

#endif /* DEMO_DATA_H */
