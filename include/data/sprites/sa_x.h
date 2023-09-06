#ifndef SA_X_DATA
#define SA_X_DATA

#include "types.h"
#include "oam.h"

extern const s16 sSaXBeamForwardYMovement[4];
extern const s16 sSaXBeamDiagonalYMovement[4];
extern const s16 sSaXBeamDiagonalXMovement[4];

extern const s16 sSaXWalkingSpeed[8];
extern const s16 sSaXRunningSpeed[8];

// ...

extern const struct FrameData sSaXBeamOam_Forward[2];
extern const struct FrameData sSaXBeamOam_Diagonal[2];

extern const struct FrameData sSaXMissileOam_Diagonal[2];
extern const struct FrameData sSaXMissileOam_Forward[2];

extern const struct FrameData sSaXPowerBombOam_SpinningSlow[6];
extern const struct FrameData sSaXPowerBombOam_SpinningFast[7];

#endif /* SA_X_DATA */
