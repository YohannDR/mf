#ifndef HUD_STRUCTS_H
#define HUD_STRUCTS_H

#include "types.h"
#include "macros.h"

struct Digits {
    u8 ones;
    u8 tens;
    u8 hundreds;
    u8 thousands;
};

extern struct Digits gEnergyDigits;
extern struct Digits gMaxEnergyDigits;
extern struct Digits gMissileDigits;
extern struct Digits gPowerBombDigits;

extern u8 gAmmoDigitsGfx[66];

extern u8 gMissileHighlightStatus;
extern u8 gPowerBombHighlightStatus;

#endif /* HUD_STRUCTS_H */