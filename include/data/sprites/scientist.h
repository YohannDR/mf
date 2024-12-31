#ifndef SCIENTIST_DATA_H
#define SCIENTIST_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sScientistGfx[2 * 512];
extern const u16 sScientistPal[2 * 16];

extern const struct FrameData sScientistOam_Idle[13];
extern const struct FrameData sScientistOam_34da54[4];
extern const struct FrameData sScientistOam_TurningHead1[5];
extern const struct FrameData sScientistOam_TurningHead2[5];
extern const struct FrameData sScientistOam_TurningBody[5];
extern const struct FrameData sScientistOam_TransformingIntoZebesian[65];

#endif /* SCIENTIST_DATA_H */
