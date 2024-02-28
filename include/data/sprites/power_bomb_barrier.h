#ifndef POWER_BOMB_BARRIER_DATA_H
#define POWER_BOMB_BARRIER_DATA_H

#include "types.h"
#include "oam.h"

extern const u32 sPowerBombBarrierGfx[1024];
extern const u16 sPowerBombBarrierPal[2 * 16];

extern const struct FrameData sPowerBombBarrierStemOam_Idle[41];
extern const struct FrameData sPowerBombBarrierStemOam_Destroyed[6];
extern const struct FrameData sPowerBombBarrierOam_Idle[41];

#endif /* POWER_BOMB_BARRIER_DATA_H */
