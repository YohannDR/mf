#ifndef GUNSHIP_DATA_H
#define GUNSHIP_DATA_H

#include "types.h"
#include "oam.h"

extern const u32 sGunshipGfx[6 * 512];
extern const u16 sGunshipPal[6 * 16];

extern const struct FrameData sGunshipOam_Idle[2];
extern const struct FrameData sGunshipBeamOam_Idle[5];
extern const struct FrameData sGunshipPartOam_Idle[2];

extern const u16 sGunshipFlashingPal[7 * 16];

#endif /* GUNSHIP_DATA_H */
