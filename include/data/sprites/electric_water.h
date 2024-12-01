#ifndef ELECTRIC_WATER_DATA_H
#define ELECTRIC_WATER_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sElectricWaterGfx[2 * 512];
extern const u16 sElectricWaterPal[2 * 16];

extern const struct FrameData sElectricWaterDamageOam_Idle[14];
extern const struct FrameData sElectricWaterDamageOam_Stopping[10];
extern const struct FrameData sElectricWireOam[47];
extern const struct FrameData sElectricWaterOam[9];

#endif /* ELECTRIC_WATER_DATA_H */
