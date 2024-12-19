#ifndef KIHUNTER_DATA_H
#define KIHUNTER_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sKihunterBugIdleYMovement[65];
extern const s16 sKihunterBugIdleXMovement[81];
extern const s16 sKihunterSpitFallingSpeed[21];
extern const s16 sKihunterGroundHighJumpSpeed[10];
extern const s16 sKihunterGroundLowJumpSpeed[10];
extern const s16 sKihunterFlyingIdleYMovement[49];
extern const s16 sKihunterFlyingSwoopingDownYSpeed[16];
extern const s16 sKihunterFlyingSwoopingAcrossYSpeed[8];
extern const s16 sKihunterFlyingAfterSwoopingAcceleratingYSpeed[12];
extern const s16 sKihunterFlyingAfterSwoopingDeceleratingYSpeed[12];

extern const u32 sKihunterGfx[3 * 512];
extern const u16 sKihunterPal[3 * 16];

extern const struct FrameData sKihunterOam_33e454[4];
extern const struct FrameData sKihunterOam_33e474[4];
extern const struct FrameData sKihunterOam_33e494[2];
extern const struct FrameData sKihunterOam_33e4a4[4];
extern const struct FrameData sKihunterOam_33e4c4[9];
extern const struct FrameData sKihunterOam_33e50c[9];
extern const struct FrameData sKihunterOam_33e554[5];
extern const struct FrameData sKihunterOam_33e57c[5];
extern const struct FrameData sKihunterOam_33e5a4[2];
extern const struct FrameData sKihunterOam_33e5b4[7];
extern const struct FrameData sKihunterOam_33e5ec[3];
extern const struct FrameData sKihunterOam_33e604[3];
extern const struct FrameData sKihunterOam_33e61c[2];
extern const struct FrameData sKihunterOam_33e62c[4];
extern const struct FrameData sKihunterOam_33e64c[3];
extern const struct FrameData sKihunterOam_33e664[4];
extern const struct FrameData sKihunterOam_33e684[15];
extern const struct FrameData sKihunterOam_33e6fc[2];
extern const struct FrameData sKihunterOam_33e70c[3];

#endif /* KIHUNTER_DATA_H */
