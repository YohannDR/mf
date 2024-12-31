#ifndef PUYO_DATA_H
#define PUYO_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sPuyoJumpingUpSpeed[32];
extern const s16 sPuyoJumpingDownSpeed[16];

extern const u32 sPuyoGfx[1 * 512];
extern const u16 sPuyoPal[1 * 16];

extern const struct FrameData sPuyoOam_37ce44[5];
extern const struct FrameData sPuyoOam_37ce6c[7];
extern const struct FrameData sPuyoOam_37cea4[4];
extern const struct FrameData sPuyoOam_37cec4[2];
extern const struct FrameData sPuyoOam_37ced4[3];

#endif /* PUYO_DATA_H */
