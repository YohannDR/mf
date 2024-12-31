#ifndef TARGET_DATA_H
#define TARGET_DATA_H

#include "types.h"
#include "oam.h"

extern const struct FrameData sTargetOam_Idle[3];
extern const struct FrameData sTargetOam_Unused[2];

extern const s16 sTargetCircles_Unused[17];
extern const s16 sTargetCirclesYMovement[65];
extern const s16 sTargetCirclesXMovement[81];

extern const u32 sSpritePlaceholderGfx[1 * 512];
extern const u16 sSpritePlaceholderPal[1 * 16];

#endif /* TARGET_DATA_H */
