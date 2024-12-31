#ifndef CHOOT_DATA_H
#define CHOOT_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sChootJumpVelocity[53];

extern const u32 sChootGfx[512 * 1];
extern const u16 sChootPal[16 * 1];

extern const struct FrameData sChootOam_Idle[2];
extern const struct FrameData sChootOam_Launching[3];
extern const struct FrameData sChootOam_Jumping[2];
extern const struct FrameData sChootOam_Opening[5];
extern const struct FrameData sChootOam_FloatingDown[5];
extern const struct FrameData sChootSpitOam_Spawning[2];
extern const struct FrameData sChootSpitOam_Falling[2];
extern const struct FrameData sChootSpitOam_ExplodingMidair[5];
extern const struct FrameData sChootSpitOam_ExplodingOnGround[6];

#endif /* CHOOT_DATA_H */
