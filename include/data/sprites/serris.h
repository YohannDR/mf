#ifndef SERRIS_DATA
#define SERRIS_DATA

#include "types.h"
#include "oam.h"

extern const struct FrameData sSerrisOam_Left[6];
extern const struct FrameData sSerrisOam_Right[6];
extern const struct FrameData sSerrisOam_SpeedboostingLeft[2];
extern const struct FrameData sSerrisOam_SpeedboostingRight[2];

extern const struct FrameData sSerrisPartOam_Left[5];
extern const struct FrameData sSerrisPartOam_Right[5];

extern const struct FrameData sSerrisBlockOam_Idle1[2];
extern const struct FrameData sSerrisBlockOam_Crumbling1[9];
extern const struct FrameData sSerrisBlockOam_Falling1[2];

extern const struct FrameData sSerrisBlockOam_Idle0[2];
extern const struct FrameData sSerrisBlockOam_Crumbling0[9];
extern const struct FrameData sSerrisBlockOam_Falling0[2];

extern const u16 sSerrisSecondPhasePal[16 * 2];
extern const u16 sSerrisThirdPhasePal[16 * 2];

#endif /* SERRIS_DATA */
