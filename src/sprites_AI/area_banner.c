#include "sprites_AI/area_banner.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "data/sprites/area_banner.h"
#include "data/samus_data.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/clipdata.h"

#include "structs/samus.h"
#include "structs/sprite.h"

/**
 * @brief 217dc | 78 | Initializes an area banner
 * 
 */
void AreaBannerInit(void)
{
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 8);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 7;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    if (gCurrentSprite.roomSlot >= 0xC) // TODO enum
        gCurrentSprite.pOam = sAreaBannerOam_SpawningMiddle;
    else
        gCurrentSprite.pOam = sAreaBannerOam_SpawningBottom;
}

/**
 * @brief 21854 | 70 | Handles an area banner spawning
 * 
 */
void AreaBannerMovingUp(void)
{
    do {
    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.animationDurationCounter--;
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
            gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
        return;
    }

    if (SpriteUtilCheckEndCurrentSpriteAnim())
    {
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = 0x18;

        if (gCurrentSprite.roomSlot >= 0xC) // TODO enum
        {
            gCurrentSprite.pOam = sAreaBannerOam_StaticMiddle;
            gCurrentSprite.work1 = 60;
        }
        else
        {
            gCurrentSprite.pOam = sAreaBannerOam_StaticBottom;
            gCurrentSprite.work1 = 120;
        }
    }
    }while(0);
}

/**
 * @brief 218c4 | 40 | Handles an area banner being static
 * 
 */
void AreaBannerStatic(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1A;

        if (gCurrentSprite.roomSlot >= 0xC) // TODO enum
            gCurrentSprite.pOam = sAreaBannerOam_DespawningMiddle;
        else
            gCurrentSprite.pOam = sAreaBannerOam_DespawningBottom;
    }
}

/**
 * @brief 21904 | 18 | Handles an area banner disappearing
 * 
 */
void AreaBannerMovingDown(void)
{
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

/**
 * @brief 2191c | 64 | Area banner AI
 * 
 */
void AreaBanner(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            AreaBannerInit();
            break;

        case 0x2:
            AreaBannerMovingUp();
            break;

        case 0x18:
            AreaBannerStatic();
            break;

        case 0x1A:
            AreaBannerMovingDown();
    }

    if (gCurrentSprite.roomSlot >= 0xC) // TODO enum
        gCurrentSprite.yPosition = SCREEN_SIZE_Y / 3 + ONE_SUB_PIXEL;
    else
        gCurrentSprite.yPosition = SCREEN_SIZE_Y - EIGHTH_BLOCK_SIZE;

    gCurrentSprite.xPosition = SCREEN_SIZE_X / 2;
}
