#ifndef LAVA_PLUME_DATA_H
#define LAVA_PLUME_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sLavaPlumeGfx[1 * 512];
extern const u16 sLavaPlumePal[1 * 16];

extern const struct FrameData sLavaPlumeWarningOam_Idle0[5];
extern const struct FrameData sLavaPlumeWarningOam_Idle1[6];
extern const struct FrameData sLavaPlumeOam_GoingUp[16];
extern const struct FrameData sLavaPlumeOam_Idle[2];
extern const struct FrameData sLavaPlumeOam_Stopping[8];

#endif /* LAVA_PLUME_DATA_H */
