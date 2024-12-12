#ifndef ZEELA_DATA_H
#define ZEELA_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sZeelaProjectileMovement[32];

extern const u32 sZeelaGfx[2 * 512];
extern const u16 sZeelaPal[2 * 16];

extern const struct FrameData sZeelaOam_CrawlingHorizontal[6];
extern const struct FrameData sZeelaOam_FallingHorizontal[5];
extern const struct FrameData sZeelaOam_CrawlingVertical[6];
extern const struct FrameData sZeelaOam_FallingVertical[5];
extern const struct FrameData sZeelaProjectileOam_Moving[3];
extern const struct FrameData sZeelaProjectileOam_35064c[4];
extern const struct FrameData sZeelaProjectileOam_Exploding1[5];
extern const struct FrameData sZeelaProjectileOam_Exploding2[5];

extern const u32 sRedZeelaGfx[2 * 512];
extern const u16 sRedZeelaPal[2 * 16];

#endif /* ZEELA_DATA_H */
