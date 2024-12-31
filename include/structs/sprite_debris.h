#ifndef SPRITE_DEBRIS_STRUCTS_H
#define SPRITE_DEBRIS_STRUCTS_H

#include "types.h"
#include "oam.h"

#define MAX_AMOUNT_OF_SPRITE_DEBRIS 8

struct SpriteDebris {
    const struct FrameData* pOam;
    u16 currentAnimationFrame;
    u16 yPosition;
    u16 xPosition;
    u8 animationDurationCounter;
    u8 exists;
    u8 type;
    u8 fallingTimer;
    u8 arrayOffset;
};

enum SpriteDebrisType {
    DEBRIS_TYPE_NONE, // 0
    DEBRIS_TYPE_HOPPING_SLOW_LEFT, // 1
    DEBRIS_TYPE_HOPPING_SLOW_RIGHT, // 2
    DEBRIS_TYPE_HOPPING_FAST_RIGHT, // 3
    DEBRIS_TYPE_HOPPING_FAST_LEFT, // 4

    DEBRIS_TYPE_LIGHT_SLOW_LEFT, // 5
    DEBRIS_TYPE_HEAVY_SLOW_RIGHT, // 6
    DEBRIS_TYPE_LIGHT_SLOW_RIGHT, // 7
    DEBRIS_TYPE_HEAVY_SLOW_LEFT, // 8

    DEBRIS_TYPE_FALLING = (1 << 4), // 0x10
    DEBRIS_TYPE_BOUNCING = (1 << 7), // 0x80
};

extern struct SpriteDebris gSpriteDebris[MAX_AMOUNT_OF_SPRITE_DEBRIS];
extern struct SpriteDebris gCurrentSpriteDebris;

#endif /* SPRITE_DEBRIS_STRUCTS_H */
