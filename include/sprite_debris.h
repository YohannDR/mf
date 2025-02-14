#ifndef SPRITE_DEBRIS_H
#define SPRITE_DEBRIS_H

#include "types.h"
#include "constants/sprite_debris.h"
#include "structs/sprite_debris.h"

void SpriteDebrisUpdateCurrent(void);
void SpriteDebrisUpdateAll(void);
void SpriteDebrisDraw(s32 debrisSlot);
void SpriteDebrisDrawAll(void);
void SpriteDebrisInit(u8 cloudType, u8 debrisType, u16 yPosition, u16 xPosition);

#endif /* SPRITE_DEBRIS_H */
