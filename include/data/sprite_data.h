#ifndef SPRITE_DATA_H
#define SPRITE_DATA_H

#include "types.h"
#include "constants/sprite.h"

extern const u8 sOamXFlipOffsets[3][4];
extern const u8 sOamYFlipOffsets[3][4];

extern const u8 sRandomNumberTable[32];
extern const u16 sSuitDamageReductionPercent[4][3];

// ...

extern const s16 sSpritesFallingSpeed[16];

// ...

extern const u32 sSpritesGraphicsLength[PSPRITE_END - 0x10];

extern const u16 sPrimarySpriteStats[PSPRITE_END][7];
extern const u16 sSecondarySpriteStats[SSPRITE_END][4];




// ......

extern const Func_T sPrimarySpritesAiPointers[PSPRITE_END];
extern const u32* const sSpritesGraphicsPointers[PSPRITE_END - 0x10];
extern const u16* const sSpritesPalettePointers[PSPRITE_END - 0x10];

// ...

extern const Func_T sSecondarySpritesAiPointers[SSPRITE_END];

extern const u8* const sSpritesetPointers[130];

#endif /* SPRITE_DATA_H */
