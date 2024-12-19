#ifndef DESSGEEGA_DATA_H
#define DESSGEEGA_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sDessgeegaBigHopVelocity[10];

extern const s16 sDessgeegaLittleHopVelocity[10];

extern const u32 sDessgeegaGfx[512 * 1];
extern const u16 sDessgeegaPal[16 * 1];

extern const struct FrameData sDessgeegaOam_Idle[5];
extern const struct FrameData sDessgeegaOam_ShakingHead[9];
extern const struct FrameData sDessgeegaOam_JumpWarning[4];
extern const struct FrameData sDessgeegaOam_Jumping[4];
extern const struct FrameData sDessgeegaOam_Landing[4];
extern const struct FrameData sDessgeegaSpikeOam_Moving[2];
extern const struct FrameData sDessgeegaSpikeOam_Exploding[4];

#endif /* DESSGEEGA_DATA_H */
