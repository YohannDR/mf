#include "sprites_AI/sa_x_tro_1.h"
#include "sprites_AI/sa_x.h"
#include "macros.h"

#include "data/sprites/sa_x.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"
#include "constants/sa_x.h"

#include "structs/sprite.h"
#include "structs/sa_x.h"

/**
 * @brief 17f50 | 68 | Checks for the blocks in front of the SA-X (tro 1)
 * 
 */
void SaXTro1CheckBlockInFront(void)
{
    gCurrentSprite.work2 = DIAG_AIM_NONE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.pose = 0x3;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition - (BLOCK_SIZE * 4));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.pose = 0x41;
    }
}

/**
 * @brief 17fb8 | 50 | Checks if the SA-X (tro 1) should start the chase
 * 
 */
void SaXTro1CheckBlockInFrontChase(void)
{
    gCurrentSprite.work2 = DIAG_AIM_NONE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.pose = 0x39;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.pose = 0x39;
    }
}

/**
 * @brief 18008 | 30 | Initializes the SA-X (tro 1)
 * 
 */
void SaXTro1Init(void)
{
    if (!EventCheckOn_HighJumpRecovered())
    {
        gCurrentSprite.status = 0;
        return;
    }

    SaXInit();
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    UpdateSubEventCounterForSA_XEncounter();
}

/**
 * @brief 18038 | f4 | Handles the SA-X (tro 1) walking
 * 
 */
void SaXTro1Walking(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gSaXVision.inYRange == TRUE)
        {
            gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
            gCurrentSprite.xParasiteTimer = 0;

            if (gSaXVision.unk_1 == TRUE)
                gCurrentSprite.pose = 0x17;
            else
                gCurrentSprite.pose = 0x39;

            return;
        }
        
        if (SPRITE_HAS_ISFT(gCurrentSprite))
        {
            gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
            gCurrentSprite.xParasiteTimer = 0;

            if (gSaXVision.samusOnRight == FALSE)
                gCurrentSprite.pose = 0x39;
            else
                gCurrentSprite.pose = 0x17;

            return;
        }
    }
    else
    {
        if (gSaXVision.inYRange == TRUE)
        {
            gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
            gCurrentSprite.xParasiteTimer = 0;

            if (gSaXVision.unk_1 == FALSE)
                gCurrentSprite.pose = 0x17;
            else
                gCurrentSprite.pose = 0x39;

            return;
        }
        
        if (SPRITE_HAS_ISFT(gCurrentSprite))
        {
            gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
            gCurrentSprite.xParasiteTimer = 0;

            if (gSaXVision.samusOnRight == TRUE)
                gCurrentSprite.pose = 0x39;
            else
                gCurrentSprite.pose = 0x17;

            return;
        }
    }

    SaXTro1CheckBlockInFront();

    if (gCurrentSprite.pose != 0x2)
        return;

    unk_11604(sSaXWalkingSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXWalkingSpeed) * 8 - 1)
        gCurrentSprite.work3++;
}

/**
 * @brief 1812c | e4 | Handles the SA-X (tro 1) running
 * 
 */
void SaXTro1Running(void)
{
    u32 nslr;

    if (gSaXVision.inYRange == TRUE)
    {
        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 7 + HALF_BLOCK_SIZE,
            BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE);

        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (nslr == NSLR_RIGHT)
            {
                gCurrentSprite.pose = 0x29;
                gCurrentSprite.work2 = gSaXVision.unk_0;
                return;
            }
        }
        else
        {
            if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x29;
                gCurrentSprite.work2 = gSaXVision.unk_0;
                return;
            }
        }

        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 4, BLOCK_SIZE * 10);

        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x39;
                return;
            }
        }
        else
        {
            if (nslr == NSLR_RIGHT)
            {
                gCurrentSprite.pose = 0x39;
                return;
            }
        }
    }
    else
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (gSaXVision.samusOnRight == FALSE && gSaXVision.inXRange)
            {
                gCurrentSprite.pose = 0x39;
                return;
            }
        }
        else
        {
            if (gSaXVision.samusOnRight == TRUE && gSaXVision.inXRange)
            {
                gCurrentSprite.pose = 0x39;
                return;
            }
        }
    }

    SaXTro1CheckBlockInFrontChase();

    if (gCurrentSprite.pose != 0x18)
        return;

    unk_11604(sSaXRunningSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXRunningSpeed) * 8 - 1)
        gCurrentSprite.work3++;
}

/**
 * @brief 18210 | 54 | Handles the SA-X (tro 1) turning around (chase start)
 * 
 */
void SaXTro1TurningAroundChase(void)
{
    if (gSaXData.pose == SA_X_POSE_STANDING)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        SaXSetDirection();

        if (gSaXVision.inYRange == TRUE)
        {
            gCurrentSprite.pose = 0x17;
        }
        else
        {
            gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
            gCurrentSprite.pose = 0x7;
        }
    }
}

/**
 * @brief 18264 | 27c | SA-X (tro 1) AI
 * 
 */
void SaXTro1(void)
{
    if (SaXUpdateFreezeTimer())
        return;

    SaXSeeAndLocateSamus();

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gSaXVision.inYRange == TRUE)
        {
            gCurrentSprite.xParasiteTimer = 0;
        }
        else
        {
            if (gCurrentSprite.xParasiteTimer >= 60 * 20)
            {
                gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
            }
            else
            {
                if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
                    gCurrentSprite.xParasiteTimer += 4;
                else
                    gCurrentSprite.xParasiteTimer += 1;
            }
        }
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            SaXTro1Init();

        case 0x1:
            SaXWalkingInit();
            break;

        case 0x2:
            SaXTro1Walking();
            break;

        case 0x17:
            SaXRunningInit();

        case 0x18:
            SaXTro1Running();
            break;

        case 0x39:
            SaXTurningAroundChaseInit();

        case 0x3A:
            SaXTro1TurningAroundChase();
            break;

        case 0x41:
            SaXIdleBeforeShootingDoorInit();

        case 0x42:
            SaXIdleBeforeShootingDoor();
            break;

        case 0x43:
            SaXShootingDoorInit();

        case 0x44:
            SaXShootingDoor();
            break;

        case 0x45:
            SaXIdleAfterShootingDoorInit();

        case 0x46:
            SaXIdleAfterShootingDoor();
            break;

        case 0x47:
            SaXWalkingToDoorInit();

        case 0x48:
            SaXWalkingToDoor();
            
            if (gCurrentSprite.status == 0)
                unk_372c(0xC8, 3, 8);
            break;

        case 0x3:
            SaXTurningAroundInit();

        case 0x4:
            SaXTurningAround();
            break;

        case SPRITE_POSE_FALLING_INIT:
            SaXFallingInit();

        case SPRITE_POSE_FALLING:
            SaXFalling();
            break;

        case 0x7:
            SaXStandingInit();

        case 0x8:
            SaXStanding();
            break;

        case 0x29:
            SaXDelayBeforeShootingBeamInit();

        case 0x2A:
            SaXDelayBeforeShootingBeam();
            break;

        case 0x2B:
            SaXShootingBeamInit();

        case 0x2C:
            SaXShootingBeam();
            break;

        case 0x2D:
            SaXDelayBeforeShootingMissileInit();

        case 0x2E:
            SaXDelayBeforeShootingMissile();
            break;

        case 0x2F:
            SaXShootingMissileInit();

        case 0x30:
            SaXShootingMissile();
            break;

        case 0x31:
            SaXDelayAfterShootingMissileInit();

        case 0x32:
            SaXDelayAfterShootingMissile();
            break;
    }

    SaXUpdateGraphics();

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
        MusicPlay(0x17, 0x9);
}
