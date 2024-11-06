#ifndef SIDEHOPPER_DATA_H
#define SIDEHOPPER_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sSidehopperBigHopVelocity[10];

extern const s16 sSidehopperLittleHopVelocity[10];

extern const u32 sSidehopperGfx[512 * 1];
extern const u16 sSidehopperPal[16 * 1];

extern const struct FrameData sSidehopperOam_31aca0[5];
extern const struct FrameData sSidehopperOam_31acc8[9];
extern const struct FrameData sSidehopperOam_31ad10[4];
extern const struct FrameData sSidehopperOam_31ad30[4];
extern const struct FrameData sSidehopperOam_31ad50[4];

#endif /* SIDEHOPPER_DATA_H */
