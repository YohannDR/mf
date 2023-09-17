#ifndef HORNOAD_DATA_H
#define HORNOAD_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sHornoadSpitYMovement[21];
extern const s16 sHornoadJumpVelocityHigh[10];
extern const s16 sHornoadJumpVelocityLow[11];

extern const struct FrameData sHornoadOam_2eb44c[3];
extern const struct FrameData sHornoadOam_2eb474[3];
extern const struct FrameData sHornoadOam_2eb4bc[3];
extern const struct FrameData sHornoadOam_TurningAroundHidden[3];
extern const struct FrameData sHornoadOam_TurninSecondPartHidden[3];
extern const struct FrameData sHornoadOam_IdleHidden[5];
extern const struct FrameData sHornoadOam_JumpingHidden[5];
extern const struct FrameData sHornoadOam_LandingHidden[3];
extern const struct FrameData sHornoadOam_FallingHidden[3];
extern const struct FrameData sHornoadOam_2eb594[3];

extern const struct FrameData sHornoadSpawnerOam_Idle[4];
extern const struct FrameData sHornoadSpawnerOam_BeforeSpawning[7];

extern const struct FrameData sHornoadOam_2eb604[3];
extern const struct FrameData sHornoadOam_2eb62c[3];
extern const struct FrameData sHornoadOam_2eb674[3];
extern const struct FrameData sHornoadOam_TurningAround[3];
extern const struct FrameData sHornoadOam_TurninSecondPart[3];
extern const struct FrameData sHornoadOam_Idle[5];
extern const struct FrameData sHornoadOam_Jumping[5];
extern const struct FrameData sHornoadOam_Landing[3];
extern const struct FrameData sHornoadOam_Spitting[7];

extern const struct FrameData sHornoadSpitOam_Idle[3];
extern const struct FrameData sHornoadSpitOam_2eb784[4];
extern const struct FrameData sHornoadSpitOam_2eb7a4[4];
extern const struct FrameData sHornoadSpitOam_Exploding[6];

extern const struct FrameData sHornoadSpawnerOam_Spawning[4];

extern const struct FrameData sHornoadOam_Falling[3];
extern const struct FrameData sHornoadOam_2eb82c[3];
extern const struct FrameData sHornoadOam_2eb844[3];

#endif /* HORNOAD_DATA_H */
