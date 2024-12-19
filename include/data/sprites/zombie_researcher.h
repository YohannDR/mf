#ifndef ZOMBIE_RESEARCHER_DATA_H
#define ZOMBIE_RESEARCHER_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sZombieLungingSpeed[4];

extern const u32 sZombieGfx[512 * 3];
extern const u16 sZombiePal[16 * 3];

extern const struct FrameData sZombieOam_FormingFromBlob[21];
extern const struct FrameData sZombieOam_Idle[5];
extern const struct FrameData sZombieOam_Moving[29];
extern const struct FrameData sZombieOam_Turning[2];
extern const struct FrameData sZombieOam_Dying[8];
extern const struct FrameData sZombieOam_Lunging[5];
extern const struct FrameData sZombieOam_EndLunging[7];
extern const struct FrameData sZombieOam_2fb4c0[2];
extern const struct FrameData sZombieOam_FormingFromPieces[11];
extern const struct FrameData sZombieOam_Blob[21];
extern const struct FrameData sZombieOam_TurningIntoBlob[8];

#endif /* ZOMBIE_RESEARCHER_DATA_H */
