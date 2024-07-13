#ifndef MOTO_DATA_H
#define MOTO_DATA_H

#include "types.h"
#include "oam.h"

extern const u32 sMotoGfx[1536];
extern const u16 sMotoPal[48];

extern const struct FrameData sMotoOam_Idle[5];
extern const struct FrameData sMotoOam_Walking[7];
extern const struct FrameData sMotoOam_TurningAroundFirstPart[3];
extern const struct FrameData sMotoOam_TurningAroundSecondPart[3];
extern const struct FrameData sMotoOam_WalkingSlowing[3];
extern const struct FrameData sMotoOam_Falling[3];
extern const struct FrameData sMotoOam_Charging[14];
extern const struct FrameData sMotoOam_WalkingCharged[7];
extern const struct FrameData sMotoFrontOam_Idle[2];

#endif /* MOTO_DATA_H */
