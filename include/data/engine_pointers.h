#ifndef ENGINE_POINTERS_DATA_H
#define ENGINE_POINTERS_DATA_H

#include "types.h"
#include "macros.h"

#include "constants/sprite.h"

extern const Func_T sPrimarySpritesAiPointers[PSPRITE_END];

extern const u32* const sSpritesGraphicsPointers[PSPRITE_END - 0x10];
extern const u16* const sSpritesPalettePointers[PSPRITE_END - 0x10];

extern const Func_T sSecondarySpritesAiPointers[SSPRITE_END];

extern const u8* const sSpritesetPointers[130];

#endif /* ENGINE_POINTERS_DATA_H */
