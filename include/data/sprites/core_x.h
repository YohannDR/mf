#ifndef CORE_X_DATA_H
#define CORE_X_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sCoreXIdleYSpeed[65];
extern const s16 sCoreXIdleXSpeed[81];

extern const u32 sMorphBallCoreXGfx[512 * 5];
extern const u16 sMorphBallCoreXPal[16 * 5];

extern const struct FrameData sCoreXAbilityOam_Idle[9];
extern const struct FrameData sCoreXAbilityOam_IdleFast[9];
extern const struct FrameData sCoreXAbilityOam_GettingAbsorbed[3];
extern const struct FrameData sCoreXStaticOam_0[5];
extern const struct FrameData sCoreXStaticOam_1[5];
extern const struct FrameData sCoreXStaticOam_2[5];
extern const struct FrameData sCoreXStaticOam_Unused[19];
extern const struct FrameData sCoreXShellOam_Breaking[9];
extern const struct FrameData sCoreXAbilityAuraOam_Slow[41];
extern const struct FrameData sCoreXAbilityAuraOam_Fast[41];
extern const struct FrameData sCoreXShellOam_White[2];
extern const struct FrameData sCoreXShellOam_Yellow[2];
extern const struct FrameData sCoreXShellOam_Red[2];

extern const u32 sHiJumpCoreXGfx[512 * 5];
extern const u16 sHiJumpCoreXPal[16 * 5];
extern const u32 sSpeedBoosterCoreXGfx[512 * 5];
extern const u16 sSpeedBoosterCoreXPal[16 * 5];
extern const u32 sSpaceJumpCoreXGfx[512 * 5];
extern const u16 sSpaceJumpCoreXPal[16 * 5];
extern const u32 sGravityCoreXGfx[512 * 5];
extern const u16 sGravityCoreXPal[16 * 5];
extern const u32 sScrewAttackCoreXGfx[512 * 5];
extern const u16 sScrewAttackCoreXPal[16 * 5];

#endif /* CORE_X_DATA_H */
