#ifndef KAGO_DATA_H
#define KAGO_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sKagoInsectHighJumpVelocity[10];
extern const s16 sKagoInsectMediumJumpVelocity[10];
extern const s16 sKagoInsectLowJumpVelocity[10];

extern const u32 sKagoGfx[2 * 512];
extern const u16 sKagoPal[2 * 16];

extern const struct FrameData sKagoOam_IdleShort[5];
extern const struct FrameData sKagoOam_IdleTallVerySlow[14];
extern const struct FrameData sKagoOam_IdleTallSlow[15];
extern const struct FrameData sKagoOam_IdleTallMedium[14];
extern const struct FrameData sKagoOam_IdleTallFast[14];
extern const struct FrameData sKagoOam_IdleTallVeryFast[14];
extern const struct FrameData sKagoInsectOam_JumpWarning[4];
extern const struct FrameData sKagoInsectOam_Midair[2];
extern const struct FrameData sKagoInsectOam_TurningAround[2];
extern const struct FrameData sKagoInsectOam_Exploding[4];

#endif /* KAGO_DATA_H */
