#ifndef CORE_X_DATA_H
#define CORE_X_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sCoreXIdleYSpeed[65];
extern const s16 sCoreXIdleXSpeed[81];

extern const u32 sMorphBallCoreXGfx[512 * 5];
extern const u16 sMorphBallCoreXPal[16 * 5];

extern const struct FrameData sFrameData_306008[9];
extern const struct FrameData sFrameData_306050[9];
extern const struct FrameData sFrameData_306098[3];
extern const struct FrameData sFrameData_3060b0[5];
extern const struct FrameData sFrameData_3060d8[5];
extern const struct FrameData sFrameData_306100[5];
extern const struct FrameData sFrameData_306128[19];
extern const struct FrameData sFrameData_3061c0[9];
extern const struct FrameData sFrameData_306208[41];
extern const struct FrameData sFrameData_306350[41];
extern const struct FrameData sFrameData_306498[2];
extern const struct FrameData sFrameData_3064a8[2];
extern const struct FrameData sFrameData_3064b8[2];

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
