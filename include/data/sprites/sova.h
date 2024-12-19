#ifndef SOVA_DATA_H
#define SOVA_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sSova_3516fc[16];

extern const u32 sSovaGfx[3 * 512];
extern const u16 sSovaPal[3 * 16];

extern const struct FrameData sSovaOam_CrawlingOnFlatGround[5];
extern const struct FrameData sSovaOam_CrawlingOnWall[5];
extern const struct FrameData sSovaOam_CrawlingOnCeiling[5];
extern const struct FrameData sSovaOam_CrawlingOnSlope[5];
extern const struct FrameData sSovaGroundFlameOam_Big[5];
extern const struct FrameData sSovaGroundFlameOam_Small[5];
extern const struct FrameData sSovaGroundFlameOam_Disappearing[9];
extern const struct FrameData sSovaFallingFlameOam_Falling[5];
extern const struct FrameData sSovaFallingFlameOam_Exploding[6];

#endif /* SOVA_DATA_H */
