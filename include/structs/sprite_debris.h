#ifndef SPRITE_DEBRIS_STRUCTS_H
#define SPRITE_DEBRIS_STRUCTS_H

#include "types.h"
#include "oam.h"

#define MAX_AMOUNT_OF_SPRITE_DEBRIS 8

struct SpriteDebris {
    const struct FrameData* pOam;
    u16 unk_4;
    u16 yPosition;
    u16 xPosition;
    u8 unk_A;
    u8 exists;
    u8 type;
    u8 fallingTimer;
    u8 arrayOffset;
};

extern struct SpriteDebris gSpriteDebris[MAX_AMOUNT_OF_SPRITE_DEBRIS];
extern struct SpriteDebris gCurrentSpriteDebris;

#endif /* SPRITE_DEBRIS_STRUCTS_H */
