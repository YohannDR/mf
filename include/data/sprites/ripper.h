#ifndef RIPPER_DATA_H
#define RIPPER_DATA_H

#include "types.h"
#include "oam.h"

extern const u32 sRipperGfx[512];
extern const u16 sRipperPal[1 * 16];

extern const struct FrameData sRipperOam_Idle[5];
extern const struct FrameData sRipperOam_TurningAround[2];

#endif /* RIPPER_DATA_H */
