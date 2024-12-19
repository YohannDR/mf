#ifndef FROZEN_RIDLEY_DATA_H
#define FROZEN_RIDLEY_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sFrozenRidleyXFlyingAwayYMovement[51];

extern const u32 sFrozenRidleyCorpseGfx[2 * 512];
extern const u16 sFrozenRidleyCorpsePal[2 * 16];

extern const struct FrameData sFrozenRidleyCorpseOam_Idle[2];
extern const struct FrameData sFrozenRidleyCorpseOam_OpeningEye[7];
extern const struct FrameData sFrozenRidleyCorpseOam_ClosingEye[4];
extern const struct FrameData sFrozenRidleyCorpseOam_Crumbling[10];
extern const struct FrameData sFrozenRidleyCorpseOam_Crumbled[2];

#endif /* FROZEN_RIDLEY_DATA_H */
