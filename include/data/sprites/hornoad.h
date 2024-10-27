#ifndef HORNOAD_DATA_H
#define HORNOAD_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sHornoadSpitYMovement[21];
extern const s16 sHornoadJumpVelocityHigh[10];
extern const s16 sHornoadJumpVelocityLow[10];

extern const u32 sHornoadGfx[512 * 3];
extern const u16 sHornoadPal[16 * 3];

extern const struct FrameData sHornoadOam_TiltingHeadHidden[5];
extern const struct FrameData sHornoadOam_MunchingHidden[9];
extern const struct FrameData sHornoadOam_MouthHangingOpenHidden[5];
extern const struct FrameData sHornoadOam_TurningAroundHidden[3];
extern const struct FrameData sHornoadOam_TurninSecondPartHidden[3];
extern const struct FrameData sHornoadOam_IdleHidden[5];
extern const struct FrameData sHornoadOam_JumpingHidden[5];
extern const struct FrameData sHornoadOam_LandingHidden[3];
extern const struct FrameData sHornoadOam_FallingHidden[3];
extern const struct FrameData sHornoadOam_2eb594[3];

extern const struct FrameData sHornoadSpawnerOam_Idle[4];
extern const struct FrameData sHornoadSpawnerOam_BeforeSpawning[7];

extern const struct FrameData sHornoadOam_TiltingHead[5];
extern const struct FrameData sHornoadOam_Munching[9];
extern const struct FrameData sHornoadOam_MouthHangingOpen[5];
extern const struct FrameData sHornoadOam_TurningAround[3];
extern const struct FrameData sHornoadOam_TurninSecondPart[3];
extern const struct FrameData sHornoadOam_Idle[5];
extern const struct FrameData sHornoadOam_Jumping[5];
extern const struct FrameData sHornoadOam_Landing[3];
extern const struct FrameData sHornoadOam_Spitting[7];

extern const struct FrameData sHornoadSpitOam_Idle[3];
extern const struct FrameData sHornoadSpitOam_2eb784[4];
extern const struct FrameData sHornoadSpitOam_2eb7a4[4];
extern const struct FrameData sHornoadSpitOam_Exploding[4];

extern const struct FrameData sHornoadSpawnerOam_2eb7e4[2];
extern const struct FrameData sHornoadSpawnerOam_Spawning[4];

extern const struct FrameData sHornoadOam_Falling[3];
extern const struct FrameData sHornoadOam_2eb82c[3];
extern const struct FrameData sHornoadOam_2eb844[13];

#endif /* HORNOAD_DATA_H */
