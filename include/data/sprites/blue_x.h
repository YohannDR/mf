#ifndef BLUE_X_DATA_H
#define BLUE_X_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sBlueXUnusedYMovement[65];
extern const s16 sBlueXUnusedXMovement[81];
extern const s16 sBlueXIdleYMovement[65];
extern const s16 sBlueXIdleXMovement[81];

extern const u32 sBlueXGfx[1024];
extern const u16 sBlueXPal[2 * 16];

extern const struct FrameData sBlueXOam_Moving[7];
extern const struct FrameData sBlueXOam_Idle[7];
extern const struct FrameData sBlueXAbsorbtionOam_Absorbing[33];
extern const struct FrameData sBlueXAbsorbtionOam_FadingAway[16];
extern const struct FrameData sBlueXOam_Stunned[5];

#endif /* BLUE_X_DATA_H */
