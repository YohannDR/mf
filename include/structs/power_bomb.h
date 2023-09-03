#ifndef POWER_BOMB_STRUCTS_H
#define POWER_BOMB_STRUCTS_H

#include "types.h"
#include "oam.h"

struct PowerBomb {
    u8 animationState;
    u8 unk_1;
    u8 semiMinorAxis;
    u8 unk_3;
    u16 xPosition;
    u16 yPosition;
    s16 hitboxLeft;
    s16 hitboxRight;
    s16 hitboxTop;
    s16 hitboxBottom;
    u8 powerBombPlaced;
    u8 ownedBySaX;
    u8 unk_12;
};

extern struct PowerBomb gCurrentPowerBomb;

#endif /* POWER_BOMB_STRUCTS_H */
