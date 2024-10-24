#ifndef MEMU_DATA_H
#define MEMU_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sMemuIdleYSpeed[65];
extern const s16 sMemuIdleXSpeed[81];

extern const u32 sMemuGfx[512 * 1];
extern const u16 sMemuPal[16 * 1];

extern const struct FrameData sMemuOam_357f14[5];
extern const struct FrameData sMemuOam_357f3c[5];

#endif /* MEMU_DATA_H */
