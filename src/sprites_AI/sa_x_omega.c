#include "sprites_AI/sa_x_omega.h"
#include "sprites_AI/sa_x.h"
#include "macros.h"
#include "globals.h"
#include "sprite_util.h"

#include "data/sprite_data.h"
#include "data/sprites/x_parasite.h"
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
 * @brief 1b518 | 4c | Initializes the SA-X (omega) sprite
 * 
 */
void SaXOmegaInit(void)
{
    SaXInit();
    SpriteUtilMakeSpriteFaceAwayFromSamusDirection();
    SaXSetDirection();

    gCurrentSprite.health = 0;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.work0 = 0;

    gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
    gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
    gCurrentSprite.yPosition += (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_FALLING);
    gSaXData.mosaic = TRUE;
}

/**
 * @brief 1b564 | 54 | Handles the SA-X (omega) forming
 * 
 */
void SaXOmegaForming(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 != 0)
    {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
        return;
    }

    gCurrentSprite.pose = 0x16;
    gCurrentSprite.work4 = 0;
    gSaXData.mosaic = FALSE;
}

/**
 * @brief 1b5b8 | 90 | Handles the SA-X (omega) falling
 * 
 */
void SaXOmegaFalling(void)
{
    u16 blockTop;
    u8 offset;
    s16 movement;

    if (gCurrentSprite.work0)
    {
        if (gSaXData.pose == SA_X_POSE_STANDING)
            gCurrentSprite.pose = 0x7;

        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.work0 = TRUE;
        SaXSetPose(SA_X_POSE_LANDING);
        return;
    }

    offset = gCurrentSprite.work4;
    movement = sSpritesFallingSpeed[offset];

    if (movement == SHORT_MAX)
    {
        movement = sSpritesFallingSpeed[offset - 1];
        gCurrentSprite.yPosition += movement;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }
}

/**
 * @brief 1b648 | 18 | Initializes the SA-X (omega) to be standing
 * 
 */
void SaXOmegaStandingInit(void)
{
    gCurrentSprite.pose = 0x8;
    gCurrentSprite.work1 = 24;
}

/**
 * @brief 1b660 | 24 | Handles the SA-X (omega) standing
 * 
 */
void SaXOmegaStanding(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x3F;
}

/**
 * @brief 1b684 | 2c | Initializes the SA-X (omega) to be running
 * 
 */
void SaXOmegaRunningInit(void)
{
    gCurrentSprite.pose = 0x40;
    gCurrentSprite.work3 = 0;

    SaXSetPose(SA_X_POSE_RUNNING);

    gCurrentSprite.work1 = 30;
}

/**
 * @brief 1b6b0 | 48 | Handles the SA-X (omega) running
 * 
 */
void SaXOmegaRunning(void)
{
    unk_11604(sSaXRunningSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXRunningSpeed) * 8 - 1)
        gCurrentSprite.work3++;

    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x41;
}

/**
 * @brief 1b6f8 | 2c | Initializes the SA-X (omega) to have a delay before shooting at the omega
 * 
 */
void SaXOmegaDelayBeforeShootingOmegaInit(void)
{
    gCurrentSprite.pose = 0x42;
    gCurrentSprite.work1 = 16;
    gSaXData.diagonalAim = DIAG_AIM_UP;

    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 1b724 | 24 | Handles the SA-X (omega) having a delay before shooting the omega
 * 
 */
void SaXOmegaDelayBeforeShootingOmega(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x43;
}

/**
 * @brief 1b748 | 50 | Initializes the SA-X (omega) to be shooting at the omega
 * 
 */
void SaXOmegaShootingOmegaInit(void)
{
    gCurrentSprite.pose = 0x44;

    SpriteSapwnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_UP, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition + (BLOCK_SIZE + PIXEL_SIZE), SS_X_FLIP);

    gSaXData.missilesArmed = FALSE;
    SaXSetPose(SA_X_POSE_SHOOTING);
}

/**
 * @brief 1b798 | 20 | Handles the SA-X (omega) shooting the omega
 * 
 */
void SaXOmegaShootingOmega(void)
{
    if (gSaXData.pose == SA_X_POSE_STANDING)
        gCurrentSprite.pose = 0x45;
}

/**
 * @brief 1b7b8 | 30 | Initializes the SA-X (omega) after shooting the omega
 * 
 */
void SaXOmegaAfterShootingOmegaInit(void)
{
    gCurrentSprite.pose = 0x46;
    gCurrentSprite.work1 = 50;
    gCurrentSprite.work4 = 0;

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 1b7e8 | d4 | Handles the SA-X (omega) after shooting the omega
 * 
 */
void SaXOmegaAfterShootingOmega(void)
{
    switch (gCurrentSprite.work4)
    {
        case 26:
            if (gSaXData.pose == SA_X_POSE_STANDING)
            {
                gSaXData.diagonalAim = SSC_NONE;
                SaXSetPose(SA_X_POSE_RUNNING);
                gCurrentSprite.work3 = 0;
                gCurrentSprite.work4--;
            }
            break;

        default:
            unk_11604(sSaXRunningSpeed[gCurrentSprite.work3 / 8]);

            if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXRunningSpeed) * 8 - 1)
                gCurrentSprite.work3++;

            gCurrentSprite.work4--;
            if (gCurrentSprite.work4 == 0)
            {
                gCurrentSprite.work1 = 0x7;
                gSaXData.diagonalAim = DIAG_AIM_UP;
                SaXSetPose(SA_X_POSE_STANDING);
            }
            break;

        case 0: 
            gCurrentSprite.work1--;
            if (gCurrentSprite.work1 == 0)
            {
                gCurrentSprite.work1 = 40;

                SpriteSapwnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_UP, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition + (BLOCK_SIZE + PIXEL_SIZE), SS_X_FLIP);

                gSaXData.missilesArmed = FALSE;
                SaXSetPose(SA_X_POSE_SHOOTING);
            }
            break;
    }
}

/**
 * @brief 1b8bc | 28 | Initializes the SA-X (omega) to be hit by the omega
 * 
 */
void SaXOmegaHitByOmegaInit(void)
{
    gCurrentSprite.pose = 0x48;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;

    SaXSetPose(SA_X_POSE_GETTING_HURT);
}

/**
 * @brief 1b8e4 | 4c | Handles the SA-X (omega) getting hit by the omega
 * 
 */
void SaXOmegaHitByOmega(void)
{
    u8 offset;
    s16 movement;

    offset = gCurrentSprite.work4;
    movement = sSaXBossKnockbackYMovement[offset];

    if (movement == SHORT_MAX)
    {
        gCurrentSprite.pose = 0x49;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }

    gCurrentSprite.xPosition -= QUARTER_BLOCK_SIZE;
}

/**
 * @brief 1b930 | 2c | Initializes the SA-X (omega) to be reverting to an X
 * 
 */
void SaXOmegaRevertingToXInit(void)
{
    gCurrentSprite.pose = 0x4A;
    gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
    gSaXData.mosaic = TRUE;

    EventCheckAdvance(EVENT_SA_X_KILLED_BY_OMEGA_METROID);
}

/**
 * @brief 1b95c | 44 | Handles the SA-X (omega) reverting to an X
 * 
 */
void SaXOmegaRevertingToX(void)
{
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
        gCurrentSprite.spriteId = PSPRITE_ICE_BEAM_ABILITY;
    }
}

/**
 * @brief 1b9a0 | 1f8 | SA-X (omega) AI
 * 
 */
void SaXOmega(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            SaXOmegaInit();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X:
            SaXOmegaForming();
            break;

        case SPRITE_POSE_FALLING_INIT:
            SaXFallingInit();

        case SPRITE_POSE_FALLING:
            SaXOmegaFalling();
            break;

        case 0x7:
            SaXOmegaStandingInit();

        case 0x8:
            SaXOmegaStanding();
            break;

        case 0x3F:
            SaXOmegaRunningInit();

        case 0x40:
            SaXOmegaRunning();
            break;

        case 0x41:
            SaXOmegaDelayBeforeShootingOmegaInit();

        case 0x42:
            SaXOmegaDelayBeforeShootingOmega();
            break;

        case 0x43:
            SaXOmegaShootingOmegaInit();

        case 0x44:
            SaXOmegaShootingOmega();
            break;

        case 0x45:
            SaXOmegaAfterShootingOmegaInit();

        case 0x46:
            SaXOmegaAfterShootingOmega();
            break;

        case 0x47:
            SaXOmegaHitByOmegaInit();

        case 0x48:
            SaXOmegaHitByOmega();
            break;

        case 0x49:
            SaXOmegaRevertingToXInit();

        case 0x4A:
            SaXOmegaRevertingToX();
    }

    if (gCurrentSprite.spriteId == PSPRITE_ICE_BEAM_ABILITY)
    {
        gSaXData.screenFlag = SA_X_SCREEN_FLAG_NOT_PRESENT;
        gSaXData.mosaic = FALSE;
    }
    else
    {
        SaXUpdateGraphics();
    }
}
