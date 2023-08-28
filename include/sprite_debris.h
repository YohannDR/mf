#ifndef SPRITE_DEBRIS_H
#define SPRITE_DEBRIS_H

#include "types.h"
#include "structs/sprite_debris.h"

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

void SpriteDebrisUpdateCurrent(void);
void SpriteDebrisUpdateAll(void);
void SpriteDebrisDraw(s32 debrisSlot);
void SpriteDebrisDrawAll(void);
void SpriteDebrisInit(u8 cloudType, u8 debrisType, u16 yPosition, u16 xPosition);

#endif /* SPRITE_DEBRIS_H */
