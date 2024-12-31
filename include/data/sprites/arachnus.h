#ifndef ARACHNUS_DATA_H
#define ARACHNUS_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sArachnusRollingSpeed[12];
extern const s16 sArachnusBonkingSpeed[36];

extern const u32 sArachnusGfx[512 * 8];
extern const u16 sArachnusPal[16 * 8];

extern const struct FrameData sArachnusOam_Walking[6];
extern const struct FrameData sArachnusShellOam_Walking[5];
extern const struct FrameData sArachnusHeadOam[5];
extern const struct FrameData sArachnusArm2Oam[5];
extern const struct FrameData sArachnusArm1Oam[5];
extern const struct FrameData sArachnusOam_Turning[8];
extern const struct FrameData sArachnusShellOam_Turning[8];
extern const struct FrameData sArachnusOam_ShootingFire[6];
extern const struct FrameData sArachnusShellOam_ShootingFire[6];
extern const struct FrameData sArachnusOam_Slashing[26];
extern const struct FrameData sArachnusShellOam_Slashing[26];
extern const struct FrameData sArachnusOam_Idle[5];
extern const struct FrameData sArachnusShellOam_Idle[5];
extern const struct FrameData sArachnusOam_Curling[6];
extern const struct FrameData sArachnusShellOam_Curling_Unused[6];
extern const struct FrameData sArachnusOam_Uncurling[6];
extern const struct FrameData sArachnusShellOam_Uncurling_Unused[6];
extern const struct FrameData sArachnusOam_Screaming[7];
extern const struct FrameData sArachnusShellOam_Screaming[7];
extern const struct FrameData sArachnusOam_Rolling[2];
extern const struct FrameData sArachnusHeadOam_Unused[13];

extern const struct FrameData sArachnusFireTrailOam_Tall[7];
extern const struct FrameData sArachnusFireTrailOam_Medium[7];
extern const struct FrameData sArachnusFireTrailOam_Short[7];
extern const struct FrameData sArachnusFireballOam[5];
extern const struct FrameData sArachnusSlashOam[4];
extern const struct FrameData sArachnusSlashTrailOam[5];

#endif /* ARACHNUS_DATA_H */
