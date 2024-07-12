#ifndef SUPER_MISSILE_BARRIER_DATA_H
#define SUPER_MISSILE_BARRIER_DATA_H

#include "types.h"
#include "oam.h"

extern const u32 sSuperMissileBarrierGfx[512];
extern const u16 sSuperMissileBarrierPal[1 * 16];

extern const struct FrameData sSuperMissileBarrierStemOam_Idle[5];
extern const struct FrameData sSuperMissileBarrierStemOam_Destroyed[5];
extern const struct FrameData sSuperMissileBarrierOam_Idle[5];

#endif /* SUPER_MISSILE_BARRIER_DATA_H */
