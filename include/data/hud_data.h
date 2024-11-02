#ifndef HUD_DATA_H
#define HUD_DATA_H

#include "types.h"

extern const u16 sCommonOamPal[6 * 16];
extern const u8 sCommonOamGfx[14 * 32 * 32];

extern const u8 sMissileIconGfx[4 * 32];
extern const u8 sPowerBombIconGfx[4 * 32];
extern const u8 sAmmoDigitsGfx[1152];
extern const u8 sEnergyDigitsGfx[32 * 10];
extern const u8 sEnergyTanksGfx_Full[256 * 5];
extern const u8 sEnergyTanksGfx_Empty[256 * 11];
extern const u8 sEnergyTankGfx_OneFull[32 * 1];
extern const u8 sEnergyTankGfx_OneFullOneEmpty[32 * 1];

#endif /* HUD_DATA_H */
