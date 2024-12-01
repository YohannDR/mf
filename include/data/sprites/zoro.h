#ifndef ZORO_DATA_H
#define ZORO_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sZoroGfx[1 * 512];
extern const u32 sBlueZoroGfx[1 * 512];
extern const u16 sZoroPal[1 * 16];
extern const u16 sBlueZoroPal[1 * 16];

extern const struct FrameData sZoroOam_33c034[7];
extern const struct FrameData sZoroOam_33c06c[3];
extern const struct FrameData sZoroOam_33c084[3];
extern const struct FrameData sZoroOam_33c09c[7];
extern const struct FrameData sZoroOam_33c0d4[3];
extern const struct FrameData sZoroOam_33c0ec[3];

#endif /* ZORO_DATA_H */
