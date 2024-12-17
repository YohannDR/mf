#ifndef ZORO_DATA_H
#define ZORO_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sZoroGfx[1 * 512];
extern const u32 sBlueZoroGfx[1 * 512];
extern const u16 sZoroPal[1 * 16];
extern const u16 sBlueZoroPal[1 * 16];

extern const struct FrameData sZoroOam_CrawlingHorizontal[7];
extern const struct FrameData sZoroOam_TurningAroundHorizontal1[3];
extern const struct FrameData sZoroOam_TurningAroundHorizontal2[3];
extern const struct FrameData sZoroOam_CrawlingVertical[7];
extern const struct FrameData sZoroOam_TurningAroundVertical1[3];
extern const struct FrameData sZoroOam_TurningAroundVertical2[3];

#endif /* ZORO_DATA_H */
