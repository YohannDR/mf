#ifndef MISSILE_HATCH_DATA_H
#define MISSILE_HATCH_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sMissileHatchDebrisFallingXMovement[16];

extern const u32 sMissileHatchGfx[512];
extern const u16 sMissileHatchPal[1 * 16];

extern const struct FrameData sMissileHatchOam_Idle[2];
extern const struct FrameData sMissileHatchDebrisOam_Falling0[5];
extern const struct FrameData sMissileHatchDebrisOam_Falling1[2];
extern const struct FrameData sMissileHatchDebrisOam_Falling2[2];
extern const struct FrameData sMissileHatchDebrisOam_Falling3[2];

#endif /* MISSILE_HATCH_DATA_H */
