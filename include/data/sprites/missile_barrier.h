#ifndef MISSILE_BARRIER_DATA_H
#define MISSILE_BARRIER_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sMissileBarrierGfx[512 * 1];
extern const u16 sMissileBarrierPal[16 * 1];

extern const struct FrameData sMissileBarrierStemOam_Idle[5];
extern const struct FrameData sMissileBarrierStemOam_Destroyed[5];
extern const struct FrameData sMissileBarrierOam_Idle[5];

#endif /* MISSILE_BARRIER_DATA_H */
