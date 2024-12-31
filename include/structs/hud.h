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

#define CREATE_ENERGY_DIGITS(var, n)\
{\
    (var).ones = n % 10;\
    (var).tens = (n / 10) % 10;\
    (var).hundreds = (n / 100) % 10;\
    (var).thousands = (n / 1000) % 10;\
}

#define CREATE_AMMO_DIGITS(var, n)\
{\
    (var).ones = n % 10;\
    (var).tens = (n / 10) % 10;\
    (var).hundreds = (n / 100) % 10;\
}

extern u8 gAmmoDigitsGfx[64];

extern u8 gMissileHighlightStatus;
extern u8 gPowerBombHighlightStatus;

#endif /* HUD_STRUCTS_H */