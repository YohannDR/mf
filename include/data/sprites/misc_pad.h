#ifndef MISC_PAD_DATA_H
#define MISC_PAD_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sControlPadGfx[2 * 512];
extern const u16 sControlPadPal[2 * 16];

extern const struct FrameData sControlPadOam_34a044[5];
extern const struct FrameData sControlPadOam_34a06c[5];
extern const struct FrameData sControlPadOam_34a094[5];
extern const struct FrameData sControlPadOam_34a0bc[5];
extern const struct FrameData sControlPadOam_34a0e4[2];
extern const struct FrameData sControlPadOam_34a0f4[2];

extern const u32 sHabitationPadGfx[1 * 512];
extern const u16 sHabitationPadPal[1 * 16];

extern const struct FrameData sHabitationPadOam_34acdc[5];
extern const struct FrameData sHabitationPadOam_34ad04[5];
extern const struct FrameData sHabitationPadOam_34ad2c[5];
extern const struct FrameData sHabitationPadOam_34ad54[5];
extern const struct FrameData sHabitationPadOam_34ad7c[2];
extern const struct FrameData sHabitationPadOam_34ad8c[2];

#endif /* MISC_PAD_DATA_H */
