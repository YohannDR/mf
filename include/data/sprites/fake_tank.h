#ifndef FAKE_TANK_DATA_H
#define FAKE_TANK_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sFakeTankFlyingYMovement[65];

extern const u32 sFakeEnergyTankGfx[1 * 512];
extern const u16 sFakeEnergyTankPal[1 * 16];

extern const struct FrameData sFakeEnergyTankOam_37d85c[5];
extern const struct FrameData sFakeEnergyTankOam_37d884[7];
extern const struct FrameData sFakeEnergyTankOam_37d8bc[5];

extern const u32 sFakeMissileTankGfx[1 * 512];
extern const u16 sFakeMissileTankPal[1 * 16];

extern const struct FrameData sFakeMissileTankOam_37e214[5];
extern const struct FrameData sFakeMissileTankOam_37e23c[8];
extern const struct FrameData sFakeMissileTankOam_37e27c[5];

#endif /* FAKE_TANK_DATA_H */
