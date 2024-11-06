#ifndef DESSGEEGA_DATA_H
#define DESSGEEGA_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sDessgeegaBigHopVelocity[10];

extern const s16 sDessgeegaLittleHopVelocity[10];

extern const u32 sDessgeegaGfx[512 * 1];
extern const u16 sDessgeegaPal[16 * 1];

extern const struct FrameData sDessgeegaOam_31b8f0[5];
extern const struct FrameData sDessgeegaOam_31b918[9];
extern const struct FrameData sDessgeegaOam_31b960[4];
extern const struct FrameData sDessgeegaOam_31b980[4];
extern const struct FrameData sDessgeegaOam_31b9a0[4];
extern const struct FrameData sDessgeegaOam_31b9c0[2];
extern const struct FrameData sDessgeegaOam_31b9d0[4];

#endif /* DESSGEEGA_DATA_H */
