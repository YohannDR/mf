#ifndef SCISER_DATA_H
#define SCISER_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sSciserBackgroundSpeedLeft[12];
extern const s16 sSciserBackgroundSpeedRight[12];
extern const s16 sSciserProjectileFallingSpeed1[25];
extern const s16 sSciserProjectileFallingSpeed2[25];

extern const u32 sSciserGfx[512 * 2];
extern const u16 sSciserPal[16 * 2];

extern const struct FrameData sFrameData_318e50[5];
extern const struct FrameData sFrameData_318e78[5];
extern const struct FrameData sFrameData_318ea0[5];
extern const struct FrameData sFrameData_318ec8[5];
extern const struct FrameData sFrameData_318ef0[3];
extern const struct FrameData sFrameData_318f08[5];
extern const struct FrameData sFrameData_318f30[3];
extern const struct FrameData sFrameData_318f48[6];
extern const struct FrameData sFrameData_318f78[3];
extern const struct FrameData sFrameData_318f90[6];
extern const struct FrameData sFrameData_318fc0[5];
extern const struct FrameData sFrameData_318fe8[3];
extern const struct FrameData sFrameData_319000[6];
extern const struct FrameData sFrameData_319030[3];
extern const struct FrameData sFrameData_319048[6];
extern const struct FrameData sFrameData_319078[5];
extern const struct FrameData sFrameData_3190a0[5];
extern const struct FrameData sFrameData_3190c8[5];
extern const struct FrameData sFrameData_3190f0[5];

extern const u32 sGoldSciserGfx[512 * 2];
extern const u16 sGoldSciserPal[16 * 2];

#endif /* SCISER_DATA_H */
