#ifndef INFANT_METROID_DATA_H
#define INFANT_METROID_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sMetroidFloatingInTubeYMovement_Background[32];
extern const s16 sMetroidFloatingInTubeXMovement_Background[40];
extern const s16 sMetroidFloatingInTubeYMovement[32];
extern const s16 sMetroidFloatingInTubeXMovement[40];
extern const s16 sMetroidSwayingYMovement[64];
extern const s16 sMetroidSwayingXMovement[80];

extern const u32 sMetroidGfx[1 * 512];
extern const u16 sMetroidPal[1 * 16];

extern const struct FrameData sMetroidOam_385294[5];
extern const struct FrameData sMetroidOam_3852bc[5];
extern const struct FrameData sMetroidOam_3852e4[5];
extern const struct FrameData sMetroidOam_38530c[2];
extern const struct FrameData sMetroidOam_38531c[5];
extern const struct FrameData sMetroidOam_385344[5];
extern const struct FrameData sMetroidOam_38536c[2];

#endif /* INFANT_METROID_DATA_H */
