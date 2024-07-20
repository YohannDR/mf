#ifndef SAVE_PAD_DATA_H
#define SAVE_PAD_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sSavePlatformFloatingYMovement[49];

extern const u32 sSavePadGfx[3 * 512];
extern const u16 sSavePadPal[3 * 16];

extern const struct FrameData sSavePlatformOam_Floating[7];
extern const struct FrameData sSavePadOam_Idle[2];
extern const struct FrameData sSavePadOam_LockedIn[6];
extern const struct FrameData sSavePadHologramOam_Opening[6];
extern const struct FrameData sSavePadHologramOam_Closing[6];
extern const struct FrameData sSavePadHologramOam_Flashing[3];
extern const struct FrameData sSavePadOam_Disabled[2];

#endif /* SAVE_PAD_DATA_H */
