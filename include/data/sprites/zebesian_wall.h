#ifndef ZEBESIAN_WALL_DATA_H
#define ZEBESIAN_WALL_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sZebesianWallJumpYVelocity[34];
extern const s16 sZebesianWallJumpXVelocity[34];

extern const u32 sZebesianWallGfx[2 * 512];
extern const u16 sZebesianWallPal[2 * 16];

extern const struct FrameData sZebesianWallOam_Crawling[9];
extern const struct FrameData sZebesianWallOam_Idle[13];
extern const struct FrameData sZebesianWallOam_323790[8];
extern const struct FrameData sZebesianWallOam_TurningAround[16];
extern const struct FrameData sZebesianWallOam_Jumping[8];
extern const struct FrameData sZebesianWallOam_Shooting[27];
extern const struct FrameData sZebesianWallBeamOam_Extended[6];
extern const struct FrameData sZebesianWallBeamOam_Spawning[5];
extern const struct FrameData sZebesianWallBeamOam_Extending[6];

#endif /* ZEBESIAN_WALL_DATA_H */
