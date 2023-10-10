#ifndef HALZYN_DATA_H
#define HALZYN_DATA_H

#include "types.h"
#include "oam.h"

extern const u16 sHalzynSwingingXVelocity[16];
extern const u16 sHalzynSwingingYVelocity[16];
extern const s16 sHalzynLungingVelocity[28];

extern const u32 sHalzynGfx[1024];
extern const u16 sHalzynPal[16 * 2];

extern const struct FrameData sHalzynOam_Swinging[5];
extern const struct FrameData sHalzynWingOam_Idle[5];
extern const struct FrameData sHalzynOam_FlyingUp[7];
extern const struct FrameData sHalzynWingOam_Flapping[7];
extern const struct FrameData sHalzynOam_Lunging[8];

extern const struct FrameData sHalzynWingOam_Lunging[8];

extern const struct FrameData sHalzynOam_Landing[4];


extern const struct FrameData sHalzynWingOam_Landing[4];

extern const struct FrameData sHalzynWingOam_Falling[4];

#endif /* HALZYN_DATA_H */
