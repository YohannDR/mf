#ifndef ZEBESIAN_GROUND_DATA_H
#define ZEBESIAN_GROUND_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sZebesianGroundJumpingSpeedHigh[10];
extern const s16 sZebesianGroundJumpingSpeedLow[10];

extern const u32 sZebesianGroundGfx[512 * 3];
extern const u16 sZebesianGroundPal[16 * 3];

extern const struct FrameData sZebesianGroundOam_Idle[9];
extern const struct FrameData sZebesianGroundOam_Waiting[5];
extern const struct FrameData sZebesianGroundOam_Falling[2];
extern const struct FrameData sZebesianGroundOam_ShootingWhileStanding[13];
extern const struct FrameData sZebesianGroundOam_ShootingWhileCrouching[12];
extern const struct FrameData sZebesianGroundOam_StartJumping[5];
extern const struct FrameData sZebesianGroundOam_Jumping[2];
extern const struct FrameData sZebesianGroundOam_Landing[3];
extern const struct FrameData sZebesianGroundOam_TurningAround[4];
extern const struct FrameData sZebesianGroundOam_TurningAroundSecondPart[4];
extern const struct FrameData sZebesianGroundBeamOam_Fired[6];
extern const struct FrameData sZebesianGroundBeamOam_Spawning[5];
extern const struct FrameData sZebesianGroundBeamOam_SpawningSecondPart[6];

extern const u32 sGoldZebesianGfx[512 * 3];
extern const u16 sGoldZebesianPal[16 * 3];

#endif /* ZEBESIAN_GROUND_DATA_H */
