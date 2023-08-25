#ifndef SPRITE_DATA_H
#define SPRITE_DATA_H

#include "types.h"
#include "constants/sprite.h"

extern const u16 sSuitDamageReductionPercent[4][3];

// ...

extern const s16 sSpritesFallingSpeed[16];

// ...

extern const u16 sPrimarySpriteStats[PSPRITE_END][7];
extern const u16 sSecondarySpriteStats[130][4]; // FIXME : use SSPRITE_END

#endif /* SPRITE_DATA_H */
