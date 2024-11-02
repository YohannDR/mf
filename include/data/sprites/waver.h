#ifndef WAVER_DATA_H
#define WAVER_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sWaverDebrisFallingSpeed[30];
extern const s16 sWaverFlyingYMovement[12];

extern const u32 sWaverGfx[512 * 2];
extern const u16 sWaverPal[16 * 2];

extern const struct FrameData sWaverOam_FlyingUp[2];
extern const struct FrameData sWaverOam_FlyingDown[6];
extern const struct FrameData sWaverOam_BackingOut[3];
extern const struct FrameData sWaverOam_Charging[6];
extern const struct FrameData sWaverDebrisOam[5];

#endif /* WAVER_DATA_H */
