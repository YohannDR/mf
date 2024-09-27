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
    DEBRIS_TYPE_NONE,
    DEBRIS_TYPE_HOPPING_SLOW_LEFT,
    DEBRIS_TYPE_HOPPING_SLOW_RIGHT,
    DEBRIS_TYPE_HOPPING_FAST_RIGHT,
    DEBRIS_TYPE_HOPPING_FAST_LEFT,
    
    DEBRIS_TYPE_LIGHT_SLOW_LEFT,
    DEBRIS_TYPE_HEAVY_SLOW_RIGHT,
    DEBRIS_TYPE_LIGHT_SLOW_RIGHT,
    DEBRIS_TYPE_HEAVY_SLOW_LEFT,

    DEBRIS_TYPE_FALLING = (1 << 4),
    DEBRIS_TYPE_BOUNCING = (1 << 7),
};

extern struct SpriteDebris gSpriteDebris[MAX_AMOUNT_OF_SPRITE_DEBRIS];
extern struct SpriteDebris gCurrentSpriteDebris;

#endif /* SPRITE_DEBRIS_STRUCTS_H */
