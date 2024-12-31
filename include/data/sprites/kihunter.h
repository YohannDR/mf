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

extern const struct FrameData sKihunterFlyingOam_Idle[4];
extern const struct FrameData sKihunterWingsOam_Flapping[4];
extern const struct FrameData sKihunterWingsOam_Landed[2];
extern const struct FrameData sKihunterFlyingOam_LungingWithStinger[4];
extern const struct FrameData sKihunterWingsOam_Falling[9];
extern const struct FrameData sKihunterFlyingOam_Swiping[9];
extern const struct FrameData sKihunterGroundOam_StartLowJump[5];
extern const struct FrameData sKihunterGroundOam_StartHighJump[5];
extern const struct FrameData sKihunterGroundOam_Landing[2];
extern const struct FrameData sKihunterGroundOam_Idle[7];
extern const struct FrameData sKihunterFlyingOam_TurningAround1[3];
extern const struct FrameData sKihunterFlyingOam_TurningAround2[3];
extern const struct FrameData sKihunterHiveOam[2];
extern const struct FrameData sKihunterBugOam[4];
extern const struct FrameData sKihunterBarfOam_Moving[3];
extern const struct FrameData sKihunterBarfOam_Exploding[4];
extern const struct FrameData sKihunterGroundOam_Barfing[15];
extern const struct FrameData sKihunterGroundOam_JumpingLow[2];
extern const struct FrameData sKihunterGroundOam_JumpingHighOrFalling[3];

#endif /* KIHUNTER_DATA_H */
