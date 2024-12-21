#ifndef GEEMER_DATA_H
#define GEEMER_DATA_H

#include "types.h"
#include "oam.h"

extern const u32 sGeemerGfx[512 * 2];
extern const u16 sGeemerPal[16 * 2];

extern const struct FrameData sGeemerOam_2fcc58[5];
extern const struct FrameData sGeemerOam_2fcc80[6];
extern const struct FrameData sGeemerOam_2fccb0[7];
extern const struct FrameData sGeemerOam_2fcce8[6];
extern const struct FrameData sGeemerOam_2fcd18[5];
extern const struct FrameData sGeemerOam_2fcd40[7];
extern const struct FrameData sGeemerFlashingLightOam_Idle[4];
extern const struct FrameData sGeemerOam_IdleHorizontal[9];
extern const struct FrameData sGeemerOam_2fcde0[4];
extern const struct FrameData sGeemerOam_CrawlingHorizontal[7];
extern const struct FrameData sGeemerOam_2fce38[15];
extern const struct FrameData sGeemerOam_2fceb0[3];
extern const struct FrameData sGeemerOam_HidingHorizontal[8];
extern const struct FrameData sGeemerOam_UncoveringHorizontal[4];
extern const struct FrameData sGeemerOam_IdleVertical[9];
extern const struct FrameData sGeemerOam_2fcf70[4];
extern const struct FrameData sGeemerOam_CrawlingVertical[7];
extern const struct FrameData sGeemerOam_2fcfc8[15];
extern const struct FrameData sGeemerOam_2fd040[3];
extern const struct FrameData sGeemerOam_HidingVertical[8];
extern const struct FrameData sGeemerOam_UncoveringVertical[4];

#endif /* GEEMER_DATA_H */
