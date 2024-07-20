#ifndef AREA_BANNER_DATA_H
#define AREA_BANNER_DATA_H

#include "types.h"
#include "oam.h"

extern const u32 sAreaBannerGfx[1 * 512];
extern const u16 sAreaBannerPal[1 * 16];
extern const u16 sAreaBannerLocationPal[1 * 16];

extern const struct FrameData sAreaBannerOam_StaticMiddle[2];
extern const struct FrameData sAreaBannerOam_SpawningMiddle[9];
extern const struct FrameData sAreaBannerOam_DespawningMiddle[9];
extern const struct FrameData sAreaBannerOam_StaticBottom[2];
extern const struct FrameData sAreaBannerOam_SpawningBottom[8];
extern const struct FrameData sAreaBannerOam_DespawningBottom[8];

#endif /* AREA_BANNER_DATA_H */
