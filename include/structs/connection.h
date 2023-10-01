#ifndef CONNECTION_STRUCTS_H
#define CONNECTION_STRUCTS_H

#include "types.h"

struct Hatch {
    u8 status;
    u8 unk_1_0:2;
    u8 unk_1_2:6;
    u8 xPosition;
    u8 yPosition;
};

extern struct Hatch gHatchData[6];

#endif /* CONNECTION_STRUCTS_H */
