#ifndef SKREE_DATA_H
#define SKREE_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sSkreeGoingDownYVelocity[];
extern const u32 sSkreeGfx[512];
extern const u16 sSkreePal[16 * 1];

extern const struct FrameData sSkreeOam_WaitingForX[5];
extern const struct FrameData sSkreeOam_Idle[3];
extern const struct FrameData sSkreeOam_GoingDown[5];
extern const struct FrameData sSkreeOam_Crashing[5];

#endif /* SKREE_DATA_H */
