#ifndef GERUDA_DATA_H
#define GERUDA_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sGerudaIdleUpwardsMovement[36];
extern const s16 sGerudaIdleDownwardsMovement[29];

extern const u32 sGerudaGfx[512 * 1];
extern const u16 sGerudaPal[16 * 1];

extern const struct FrameData sGerudaOam_Idle[5];
extern const struct FrameData sGerudaOam_AttackWarning[2];
extern const struct FrameData sGerudaOam_Lunging[2];
extern const struct FrameData sGerudaOam_Swiping[6];
extern const struct FrameData sGerudaOam_TurningAround[2];

#endif /* GERUDA_DATA_H */
