#ifndef REO_DATA_H
#define REO_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sReoIdleYMovement[49];
extern const s16 sReoGoingDownYSpeed[12];
extern const s16 sReoSlidingYSpeed[16];
extern const s16 sReoGoingUpAccceleratingYSpeed[12];
extern const s16 sReoGoingUpDeceleratingYSpeed[16];

extern const u32 sReoGfx[1 * 512];
extern const u16 sReoPal[1 * 16];

extern const struct FrameData sReoOam_33f128[5];
extern const struct FrameData sReoOam_33f150[5];
extern const struct FrameData sReoOam_33f178[4];

#endif /* REO_DATA_H */
