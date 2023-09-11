#ifndef SA_X_DATA
#define SA_X_DATA

#include "types.h"
#include "oam.h"

#include "constants/sa_x.h"

typedef u8 (*SaXGfxFunc_T)(void);

extern const SaXGfxFunc_T sSaXPoseGfxFunctionPointers[SA_X_POSE_END];

// ...

extern const s16 sSaXBeamForwardYMovement[4];
extern const s16 sSaXBeamDiagonalYMovement[4];
extern const s16 sSaXBeamDiagonalXMovement[4];

extern const s16 sSaXWalkingSpeed[8];
extern const s16 sSaXRunningSpeed[8];

extern const s16 sSaXJumpYVelocity_0[10];
extern const s16 sSaXJumpYVelocity_1[10];
extern const s16 sSaXJumpYVelocity_2[10];
extern const s16 sSaXJumpYVelocity_3[18];
extern const s16 sSaXJumpYVelocity_4[10];

extern const s16 sSaXBossSpinJumpYVelocity_2[11];
extern const s16 sSaXBossSpinJumpYVelocity_5[18];

extern const s16 sSaXBossJumpYVelocity_1[10];
extern const s16 sSaXBossJumpYVelocity_2[10];
extern const s16 sSaXBossJumpYVelocity_3[10];

// ...

extern const struct FrameData sSaXBeamOam_Forward[2];
extern const struct FrameData sSaXBeamOam_Diagonal[2];

extern const struct FrameData sSaXMissileOam_Diagonal[2];
extern const struct FrameData sSaXMissileOam_Forward[2];

extern const struct FrameData sSaXPowerBombOam_SpinningSlow[6];
extern const struct FrameData sSaXPowerBombOam_SpinningFast[7];

extern const struct FrameData sLabExplosionOam_Idle[49];

// ...

extern const u16 sSaXMosaicValues[30];

// ...

extern const s16 sSaXBossKnockbackYMovement[12];

#endif /* SA_X_DATA */
