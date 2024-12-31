#ifndef YAMEBA_DATA_H
#define YAMEBA_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sYamebaIdleHiddenYMovement[65];
extern const s16 sYamebaIdleHiddenXMovement[81];

extern const u32 sYamebaGfx[2 * 512];
extern const u16 sYamebaPal[2 * 16];

extern const struct FrameData sYamebaOam_IdleHidden[9];
extern const struct FrameData sYamebaOam_Idle[9];

#endif /* YAMEBA_DATA_H */
