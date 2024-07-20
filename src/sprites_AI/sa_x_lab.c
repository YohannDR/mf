#include "sprites_AI/sa_x_arc.h"
#include "sprites_AI/sa_x.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/sa_x.h"

#include "constants/clipdata.h"
#include "constants/event.h"
#include "constants/sprite.h"
#include "constants/samus.h"
#include "constants/sa_x.h"

#include "structs/sprite.h"
#include "structs/samus.h"
#include "structs/sa_x.h"

/**
 * @brief 19c28 | 38 | Initializes the SA-X (lab)
 * 
 */
void SaXLabInit(void)
{
    SaXInit();
    gCurrentSprite.samusCollision = SSC_NONE;

    SpriteSpawnSecondary(SSPRITE_SA_X_SHOOTING_AT_LAB_EXPLOSION, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
}

/**
 * @brief 19c60 | 20 | Initializes the SA-X (lab) to be shooting at the laboratory
 * 
 */
void SaXLabShootingLabInit(void)
{
    gCurrentSprite.pose = 0x2;
    gCurrentSprite.work1 = 100;

    SaXSetPose(SA_X_POSE_SHOOTING_RESTRICTED_LABORATORY);
}

/**
 * @brief 19c80 | 1c | Sets the X parasite target
 * 
 */
void SaXLabSetTarget(void)
{
    gXParasiteTargetYPosition = gCurrentSprite.yPosition;
    gXParasiteTargetXPosition = gCurrentSprite.xPosition;
}

/**
 * @brief 19c9c | 30 | Handles the SA-X (lab) getting covered by metroids
 * 
 */
void SaXLabGettingCoveredByMetroids(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = 0x1A;
        SaXSetPose(SA_X_POSE_COVERED_BY_METROIDS);
        gCurrentSprite.work1 = 100;
    }
}

/**
 * @brief 19ccc | 5c | Handles the SA-X (lab) covered by metroids
 * 
 */
void SaXLabCoveredByMetroids(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 70)
    {
        gPreventMovementTimer = 1000;
        EventCheckAdvance(EVENT_60_SECONDS_TO_DETACHMENT);
        TrySpawnMessageBanner(0xA);
    }
    else if (gCurrentSprite.work1 == 60)
    {
        SoundPlay(0x23C);
    }
    else if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = 0x1C;
        gCurrentSprite.work1 = 60;
    }
}

/**
 * @brief 19d28 | 34 | Handles the SA-X (lab) covered by metroids after detachment
 * 
 */
void SaXLabCoveredByMetroidsAfterDetachment(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.work1 = 60;

        if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
            SoundPlay(0x23C);
    }
}

/**
 * @brief 19d5c | d8 | SA-X (lab) AI
 * 
 */
void SaXLab(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SaXLabInit();

        case 0x1:
            SaXLabShootingLabInit();
            break;

        case 0x2:
            SaXLabSetTarget();
            break;

        case 0x18:
            SaXLabGettingCoveredByMetroids();
            break;

        case 0x1A:
            SaXLabCoveredByMetroids();
            break;

        case 0x1C:
            SaXLabCoveredByMetroidsAfterDetachment();
            break;
    }

    SaXUpdateGraphics();

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
}
