#ifndef SCISER_DATA_H
#define SCISER_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sSciserDancingSidewaysMovementLeft[12];
extern const s16 sSciserDancingSidewaysMovementRight[12];
extern const s16 sSciserProjectileThrownDownVelocity[25];
extern const s16 sSciserProjectileThrownUpVelocity[25];

extern const u32 sSciserGfx[512 * 2];
extern const u16 sSciserPal[16 * 2];

extern const struct FrameData sSciserOam_CrawlingHorizontal_Uninfected[5];
extern const struct FrameData sSciserOam_IdleHorizontal_Uninfected[5];
extern const struct FrameData sSciserOam_CrawlingVertical_Uninfected[5];
extern const struct FrameData sSciserOam_IdleVertical_Uninfected[5];
extern const struct FrameData sSciserProjectileOam_Moving[3];
extern const struct FrameData sSciserOam_CrawlingHorizontal[5];
extern const struct FrameData sSciserOam_IdleHorizontal[3];
extern const struct FrameData sSciserOam_ShootingHorizontal[6];
extern const struct FrameData sSciserOam_PreparingToShootHorizontal[3];
extern const struct FrameData sSciserOam_PullingClawsDownHorizontal[6];
extern const struct FrameData sSciserOam_CrawlingVertical[5];
extern const struct FrameData sSciserOam_IdleVertical[3];
extern const struct FrameData sSciserOam_ShootingVertical[6];
extern const struct FrameData sSciserOam_PreparingToShootVertical[3];
extern const struct FrameData sSciserOam_PullingClawsDownVertical[6];
extern const struct FrameData sSciserOam_DancingInBackgroundHorizontal[5];
extern const struct FrameData sSciserOam_DancingInBackgroundVertical[5];
extern const struct FrameData sSciserProjectileOam_Exploding1[5];
extern const struct FrameData sSciserProjectileOam_Exploding2[5];

extern const u32 sGoldSciserGfx[512 * 2];
extern const u16 sGoldSciserPal[16 * 2];

#endif /* SCISER_DATA_H */
