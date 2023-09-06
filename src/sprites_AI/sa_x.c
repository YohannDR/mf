#include "sprites_AI/sa_x.h"
#include "macros.h"
#include "globals.h"
#include "gba.h"

#include "data/sprite_data.h"
#include "data/sprites/sa_x.h"

#include "constants/clipdata.h"
#include "constants/sa_x.h"
#include "constants/samus.h"
#include "constants/sprite.h"

#include "structs/sprite.h"
#include "structs/samus.h"
#include "structs/sa_x.h"
#include "structs/power_bomb.h"

/**
 * @brief 157cc | 30 | Sets the direction of the SA-X
 * 
 */
void SaXSetDirection(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        gSaXData.direction = KEY_RIGHT;
    else
        gSaXData.direction = KEY_LEFT;
}

void SaXSeeAndLocateSamus(void)
{

}

/**
 * @brief 15dd4 | b4 | To document
 * 
 * @return u8 bool, pose changed
 */
u8 unk_15dd4(void)
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
                return TRUE;
            }
        }
        else
        {
            if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x29;
                gCurrentSprite.work2 = gSaXVision.unk_0;
                return TRUE;
            }
        }

        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 4, BLOCK_SIZE * 10);

        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x39;
                return TRUE;
            }
        }
        else
        {
            if (nslr == NSLR_RIGHT)
            {
                gCurrentSprite.pose = 0x39;
                return TRUE;
            }
        }
    }
    else
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (gSaXVision.samusOnRight != FALSE)
            {
                return FALSE;
            }

            if (gSaXVision.inXRange != FALSE)
            {
                gCurrentSprite.pose = 0x39;
                return TRUE;
            }
        }
        else
        {
            if (gSaXVision.samusOnRight != TRUE)
            {
                return FALSE;
            }

            if (gSaXVision.inXRange != FALSE)
            {
                gCurrentSprite.pose = 0x39;
                return TRUE;
            }
        }
    }

    return FALSE;
}

/**
 * @brief 15e88 | cc | To document
 * 
 * @return u8 bool, pose changed
 */
u8 unk_15e88(void)
{
    u8 prevPose;

    prevPose = gCurrentSprite.pose;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gSaXVision.inYRange == TRUE)
        {
            gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
            gCurrentSprite.xParasiteTimer = 0;

            if (gSaXVision.unk_1 != TRUE)
                gCurrentSprite.pose = 0x39;
            else
                gCurrentSprite.pose = 0x17;
        }
        else
        {
            if (SPRITE_HAS_ISFT(gCurrentSprite))
            {
                gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
                gCurrentSprite.xParasiteTimer = 0;

                if (gSaXVision.samusOnRight == FALSE)
                    gCurrentSprite.pose = 0x39;
                else
                    gCurrentSprite.pose = 0x17;
            }
        }
    }
    else
    {
        if (gSaXVision.inYRange == TRUE)
        {
            gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
            gCurrentSprite.xParasiteTimer = 0;

            if (gSaXVision.unk_1 != FALSE)
                gCurrentSprite.pose = 0x39;
            else
                gCurrentSprite.pose = 0x17;
        }
        else
        {
            if (SPRITE_HAS_ISFT(gCurrentSprite))
            {
                gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
                gCurrentSprite.xParasiteTimer = 0;

                if (gSaXVision.samusOnRight == TRUE)
                    gCurrentSprite.pose = 0x39;
            else
                gCurrentSprite.pose = 0x17;
            }
        }
    }

    if (prevPose == gCurrentSprite.pose)
        return FALSE;

    return TRUE;
}

/**
 * @brief 15f54 | 108 | To document
 * 
 * @return u8 bool, pose changed
 */
u8 unk_15f54(void)
{
    u8 prevPose;

    prevPose = gCurrentSprite.pose;

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
        }
        else
        {
            if (gSaXVision.samusOnRight == FALSE)
            {
                if (gSaXVision.inXRange != FALSE)
                    gCurrentSprite.pose = 0x3;
            }

            if (SPRITE_HAS_ISFT(gCurrentSprite))
            {
                gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
                gCurrentSprite.xParasiteTimer = 0;

                if (gSaXVision.samusOnRight == FALSE)
                    gCurrentSprite.pose = 0x39;
                else
                    gCurrentSprite.pose = 0x17;
            }
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
        }
        else
        {
            if (gSaXVision.samusOnRight == TRUE)
            {
                if (gSaXVision.inXRange != FALSE)
                    gCurrentSprite.pose = 0x3;
            }

            if (SPRITE_HAS_ISFT(gCurrentSprite))
            {
                gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
                gCurrentSprite.xParasiteTimer = 0;

                if (gSaXVision.samusOnRight == TRUE)
                    gCurrentSprite.pose = 0x39;
                else
                    gCurrentSprite.pose = 0x17;
            }
        }
    }

    if (prevPose == gCurrentSprite.pose)
        return FALSE;

    return TRUE;
}

void unk_1605c(void)
{
    // https://decomp.me/scratch/m8HAD

    gCurrentSprite.work2 = 0;
    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - QUARTER_BLOCK_SIZE);

            if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = 0x37;
                return;
            }

            if (gPreviousVerticalCollisionCheck != COLLISION_LEFT_STEEP_FLOOR_SLOPE && gPreviousVerticalCollisionCheck != COLLISION_LEFT_SLIGHT_FLOOR_SLOPE)
                return;
        }
        else
        {
            SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + QUARTER_BLOCK_SIZE);

            if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = 0x37;
                return;
            }

            if (gPreviousVerticalCollisionCheck != COLLISION_RIGHT_STEEP_FLOOR_SLOPE && gPreviousVerticalCollisionCheck != COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE)
                return;
        }

        gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        return;
    }

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (!(gPreviousVerticalCollisionCheck & 0xF0))
            return;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE),
            gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.work2 = 0x2;
                gCurrentSprite.pose = 0x37;
                return;
            }

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE),
                gCurrentSprite.xPosition);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = 0x3B;
                return;
            }

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 3 + HALF_BLOCK_SIZE),
                gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = 0x3B;
                return;
            }

            gCurrentSprite.work2 = 0x2;
            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));
        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            gCurrentSprite.work2 = 0x1;
            gCurrentSprite.pose = 0x37;
        }
    }
    else
    {
        if (!(gPreviousVerticalCollisionCheck & 0xF0))
            return;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE),
            gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.work2 = 0x2;
                gCurrentSprite.pose = 0x37;
                return;
            }

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE),
                gCurrentSprite.xPosition);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = 0x3B;
                return;
            }

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 3 + HALF_BLOCK_SIZE),
                gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = 0x3B;
                return;
            }

            gCurrentSprite.work2 = 0x2;
            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));
        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            gCurrentSprite.work2 = 0x1;
            gCurrentSprite.pose = 0x37;
        }
    }
}

/**
 * @brief 1621c | 8c | Initializes an SA-X sprite
 * 
 */
void SaXInit(void)
{
    gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
    
    gCurrentSprite.drawOrder = 4;
    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - PIXEL_SIZE * 2);
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -QUARTER_BLOCK_SIZE;
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE;

    // FIME
    // gCurrentSprite.pOam = sSaXOam_Idle;
    gCurrentSprite.pOam = (const struct FrameData*)0x82e7f70;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;

    gCurrentSprite.xParasiteTimer = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    SpriteUtilMakeSpriteFaceSamusDirection();
    SaXSetDirection();

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame = 0;
    gSaXData.diagonalAim = 0;
    gSaXData.missilesArmed = FALSE;
    gSaXData.mosaic = FALSE;

    gCurrentSprite.work0 = 0;
}

/**
 * @brief 162a8 | 18 | Initializes the SA-X elevator sprite
 * 
 */
void SaXElevatorInit(void)
{
    SaXInit();
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
}

/**
 * @brief 162c0 | 34 | Initializes the SA-X to be falling
 * 
 */
void SaXFallingInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - PIXEL_SIZE * 2);

    SaXSetPose(SA_X_POSE_FALLING);

    gCurrentSprite.work0 = FALSE;
}

/**
 * @brief 162f4 | d4 | Handles the SA-X falling
 * 
 */
void SaXFalling(void)
{
    u32 blockTop;
    u8 offset;
    s16 movement;

    if (gCurrentSprite.work0)
    {
        if (gSaXData.pose == SA_X_POSE_STANDING)
        {
            if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
            {
                gCurrentSprite.pose = 0x17;

                if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
                {
                    if (gSaXVision.samusOnRight == FALSE)
                        gCurrentSprite.pose = 0x39;
                }
                else
                {
                    if (gSaXVision.samusOnRight == TRUE)
                        gCurrentSprite.pose = 0x39;
                }
            }
            else
            {
                gCurrentSprite.pose = 0x7;
            }
        }

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
 * @brief 163c8 | 28 | Initializes the SA-X to be standing
 * 
 */
void SaXStandingInit(void)
{
    gCurrentSprite.pose = 0x8;
    gCurrentSprite.work1 = 24;

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - PIXEL_SIZE * 2);

    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 163f0 | a0 | Handles the SA-X standing
 * 
 */
void SaXStanding(void)
{
    u32 nslr;

    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }

    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 != 0)
        return;

    if (gSaXVision.inYRange == TRUE)
    {
        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;

        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 7 + HALF_BLOCK_SIZE,
            BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE);

        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (nslr == NSLR_RIGHT)
            {
                gCurrentSprite.pose = 0x29;
                gCurrentSprite.work2 = gSaXVision.unk_0;
            }
            else
            {
                gCurrentSprite.pose = 0x17;
            }
        }
        else
        {
            if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x29;
                gCurrentSprite.work2 = gSaXVision.unk_0;
            }
            else
            {
                gCurrentSprite.pose = 0x17;
            }
        }
    }
    else
    {
        gCurrentSprite.pose = 0x1;
    }
}

/**
 * @brief 16490 | 2c | Initializes the SA-X to be walking
 * 
 */
void SaXWalkingInit(void)
{
    gCurrentSprite.pose = 0x2;
    gCurrentSprite.work3 = 0;

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - PIXEL_SIZE * 2);

    SaXSetPose(SA_X_POSE_WALKING);
}

/**
 * @brief 164bc | 4c | Handles the SA-X walking
 * 
 */
void SaXWalking(void)
{
    if (unk_15f54())
        return;

    unk_1605c();

    if (gCurrentSprite.pose != 0x2)
        return;

    unk_11604(sSaXWalkingSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXWalkingSpeed) * 8 - 1)
        gCurrentSprite.work3++;
}

/**
 * @brief 16508 | 24 | Initializes the SA-X to turn around
 * 
 */
void SaXTurningAroundInit(void)
{
    gCurrentSprite.pose = 0x4;

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - PIXEL_SIZE * 2);

    SaXSetPose(SA_X_POSE_TURNING);
}

/**
 * @brief 1652c | 30 | Handles the SA-X turning around
 * 
 */
void SaXTurningAround(void)
{
    if (gSaXData.pose == SA_X_POSE_STANDING)
    {
        gCurrentSprite.pose = 0x1;

        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        SaXSetDirection();
    }
}

/**
 * @brief 1655c | 24 | Initializes the SA-X to be turning around (chase start)
 * 
 */
void SaXTurningAroundChaseInit(void)
{
    gCurrentSprite.pose = 0x3A;

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - PIXEL_SIZE * 2);

    SaXSetPose(SA_X_POSE_TURNING);
}

/**
 * @brief 16580 | 48 | Handles the SA-X turning around (chase start)
 * 
 */
void SaXTurningAroundChase(void)
{
    if (gSaXData.pose == SA_X_POSE_STANDING)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        SaXSetDirection();

        if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
            gCurrentSprite.pose = 0x17;
        else
            gCurrentSprite.pose = 0x1;
    }
}

/**
 * @brief 165c8 | 34 | Initializes the SA-X to be running
 * 
 */
void SaXRunningInit(void)
{
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - PIXEL_SIZE * 2);

    if (!unk_15dd4())
        SaXSetPose(SA_X_POSE_RUNNING);
}

/**
 * @brief 165fc | 4c | Handle the SA-X running
 * 
 */
void SaXRunning(void)
{
    if (unk_15f54())
        return;

    unk_1605c();

    if (gCurrentSprite.pose != 0x18)
        return;

    unk_11604(sSaXRunningSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXRunningSpeed) * 8 - 1)
        gCurrentSprite.work3++;
}

/**
 * @brief 16648 | 3c | Initializes the SA-X to be mid air
 * 
 */
void SaXMidAirInit(void)
{
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);

    gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;

    SaXSetPose(SA_X_POSE_MID_AIR);

    gCurrentSprite.work0 = 0;
}

void SaXMidAir(void)
{

}

/**
 * @brief 1685c | 44 | Initializes the SA-X to be aiming to shoot a beam
 * 
 */
void SaXDelayBeforeShootingBeamInit(void)
{
    gCurrentSprite.pose = 0x2A;
    gCurrentSprite.work1 = 16;

    SaXSetPose(SA_X_POSE_STANDING);

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == DIAG_AIM_NONE)
            gSaXData.diagonalAim = DIAG_AIM_NONE;
        else if (gCurrentSprite.work2 == DIAG_AIM_UP)
            gSaXData.diagonalAim = DIAG_AIM_UP;
        else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
            gSaXData.diagonalAim = DIAG_AIM_DOWN;
    }
    else
    {
        if (gCurrentSprite.work2 == DIAG_AIM_NONE)
            gSaXData.diagonalAim = DIAG_AIM_NONE;
        else if (gCurrentSprite.work2 == DIAG_AIM_UP)
            gSaXData.diagonalAim = DIAG_AIM_UP;
        else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
            gSaXData.diagonalAim = DIAG_AIM_DOWN;
    }
}

/**
 * @brief 168a0 | b8 | Handles the SA-X aiming to shoot a beam
 * 
 */
void SaXDelayBeforeShootingBeam(void)
{
    u32 nslr;

    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        return;
    }

    if (gSamusData.pose == SPOSE_FROZEN_AND_FALLING)
        return;

    if (gSamusData.pose == SPOSE_FROZEN)
    {
        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 7 + HALF_BLOCK_SIZE,
            BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE);

        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (nslr == NSLR_RIGHT)
            {
                gCurrentSprite.pose = 0x2D;
                gCurrentSprite.work2 = gSaXVision.unk_0;
            }
            else if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x39;
            }
            else
            {
                gCurrentSprite.pose = 0x17;
            }
        }
        else
        {
            if (nslr == NSLR_RIGHT)
            {
                gCurrentSprite.pose = 0x39;
            }
            else if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x2D;
                gCurrentSprite.work2 = gSaXVision.unk_0;
            }
            else
            {
                gCurrentSprite.pose = 0x17;
            }
        }
    }
    else
    {
        gCurrentSprite.pose = 0x2B;
    }
}

void SaXShootingBeamInit(void)
{
    gCurrentSprite.pose = 0x2C;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == DIAG_AIM_NONE)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_NONE, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition + BLOCK_SIZE + PIXEL_SIZE, SPRITE_STATUS_X_FLIP);
        }
        else if (gCurrentSprite.work2 == DIAG_AIM_UP)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_UP, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition + BLOCK_SIZE + PIXEL_SIZE, SPRITE_STATUS_X_FLIP);
        }
        else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_DOWN, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE - QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition + BLOCK_SIZE + PIXEL_SIZE, SPRITE_STATUS_X_FLIP);
        }
    }
    else
    {
        if (gCurrentSprite.work2 == DIAG_AIM_NONE)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_NONE, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition - (BLOCK_SIZE + PIXEL_SIZE), 0);
        }
        else if (gCurrentSprite.work2 == DIAG_AIM_UP)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_UP, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition - (BLOCK_SIZE + PIXEL_SIZE), 0);
        }
        else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_DOWN, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE - QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition - (BLOCK_SIZE + PIXEL_SIZE), 0);
        }
    }

    gSaXData.missilesArmed = FALSE;
    SaXSetPose(SA_X_POSE_SHOOTING);
}

/**
 * @brief 16a7c | a8 | Handles the SA-X shooting a beam
 * 
 */
void SaXShootingBeam(void)
{
    u32 nslr;

    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }

    if (gSaXData.pose != SA_X_POSE_STANDING)
        return;

    if (gSaXVision.inYRange == FALSE)
    {
        gCurrentSprite.pose = 0x17;
        return;
    }

    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 7 + HALF_BLOCK_SIZE,
        BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE);

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (nslr == NSLR_RIGHT)
        {
            gCurrentSprite.pose = 0x29;
            gCurrentSprite.work2 = gSaXVision.unk_0;
        }
        else if (nslr == NSLR_LEFT)
        {
            gCurrentSprite.pose = 0x39;
        }
        else
        {
            gCurrentSprite.pose = 0x17;
        }
    }
    else
    {
        if (nslr == NSLR_RIGHT)
        {
            gCurrentSprite.pose = 0x39;
        }
        else if (nslr == NSLR_LEFT)
        {
            gCurrentSprite.pose = 0x29;
            gCurrentSprite.work2 = gSaXVision.unk_0;
        }
        else
        {
            gCurrentSprite.pose = 0x17;
        }
    }
}

/**
 * @brief 16b24 | 64 | Initializes the SA-X to be aiming to shoot a missile
 * 
 */
void SaXDelayBeforeShootingMissileInit(void)
{
    u8 aim;

    gCurrentSprite.pose = 0x2E;
    gCurrentSprite.work1 = 0x28;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == DIAG_AIM_NONE)
            aim = DIAG_AIM_NONE;
        else if (gCurrentSprite.work2 == DIAG_AIM_UP)
            aim = DIAG_AIM_UP;
        else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
            aim = DIAG_AIM_DOWN;
    }
    else
    {
        if (gCurrentSprite.work2 == DIAG_AIM_NONE)
            aim = DIAG_AIM_NONE;
        else if (gCurrentSprite.work2 == DIAG_AIM_UP)
            aim = DIAG_AIM_UP;
        else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
            aim = DIAG_AIM_DOWN;
    }

    if (aim != gSaXData.diagonalAim)
        gSaXData.diagonalAim = aim;
}

/**
 * @brief 16b88 | 24 | Handles the SA-X aiming to shoot a missile
 * 
 */
void SaXDelayBeforeShootingMissile(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x2F;
}

/**
 * @brief 16bac | 104 | Initializes the SA-X to be shooting a missile
 * 
 */
void SaXShootingMissileInit(void)
{
    gCurrentSprite.pose = 0x30;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == DIAG_AIM_NONE)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_SUPER_MISSILE, DIAG_AIM_NONE, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition + BLOCK_SIZE + PIXEL_SIZE, SPRITE_STATUS_X_FLIP);
        }
        else if (gCurrentSprite.work2 == DIAG_AIM_UP)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_SUPER_MISSILE, DIAG_AIM_UP, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition + BLOCK_SIZE + PIXEL_SIZE, SPRITE_STATUS_X_FLIP);
        }
        else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_SUPER_MISSILE, DIAG_AIM_DOWN, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE - QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition + BLOCK_SIZE + PIXEL_SIZE, SPRITE_STATUS_X_FLIP);
        }
    }
    else
    {
        if (gCurrentSprite.work2 == DIAG_AIM_NONE)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_SUPER_MISSILE, DIAG_AIM_NONE, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition - (BLOCK_SIZE + PIXEL_SIZE), 0);
        }
        else if (gCurrentSprite.work2 == DIAG_AIM_UP)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_SUPER_MISSILE, DIAG_AIM_UP, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition - (BLOCK_SIZE + PIXEL_SIZE), 0);
        }
        else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
        {
            SpriteSpawnSecondary(SSPRITE_SA_X_SUPER_MISSILE, DIAG_AIM_DOWN, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE - QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition - (BLOCK_SIZE + PIXEL_SIZE), 0);
        }
    }

    gSaXData.missilesArmed = TRUE;
    SaXSetPose(SA_X_POSE_SHOOTING);
}

/**
 * @brief 16cb0 | 54 | Handles the SA-X shooting a missile
 * 
 */
void SaXShootingMissile(void)
{
    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }

    if (gSaXData.pose != SA_X_POSE_STANDING)
        return;

    if (gSaXVision.inYRange == FALSE)
        gCurrentSprite.pose = 0x17;
    else
        gCurrentSprite.pose = 0x31;
}

/**
 * @brief 16d04 | 18 | Initializes the SA-X to be idle after shoting a missile
 * 
 */
void SaXIdleAfterShootingMissileInit(void)
{
    gCurrentSprite.pose = 0x32;
    gCurrentSprite.work1 = 60;
}

/**
 * @brief 16d1c | 90 | Handles the SA-X being idle after shooting a missile
 * 
 */
void SaXIdleAfterShootingMissile(void)
{
    u32 nslr;

    gCurrentSprite.animationDurationCounter = 0;

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        return;
    }
    
    if (gSamusData.pose == SPOSE_FROZEN)
    {
        gCurrentSprite.pose = 0x17;
        return;
    }

    if (gSaXVision.inYRange == FALSE)
    {
        gCurrentSprite.pose = 0x17;
        return;
    }

    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 7 + HALF_BLOCK_SIZE,
        BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE);

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (nslr == NSLR_RIGHT)
        {
            gCurrentSprite.pose = 0x29;
            gCurrentSprite.work2 = gSaXVision.unk_0;
        }
        else if (nslr == NSLR_LEFT)
        {
            gCurrentSprite.pose = 0x39;
        }
        else
        {
            gCurrentSprite.pose = 0x17;
        }
    }
    else
    {
        if (nslr == NSLR_RIGHT)
        {
            gCurrentSprite.pose = 0x39;
        }
        else if (nslr == NSLR_LEFT)
        {
            gCurrentSprite.pose = 0x29;
            gCurrentSprite.work2 = gSaXVision.unk_0;
        }
        else
        {
            gCurrentSprite.pose = 0x17;
        }
    }
}

/**
 * @brief 16dac | 24 | Initializes the SA-X to be morphing
 * 
 */
void SaXMorphingInit(void)
{
    gCurrentSprite.pose = 0x3C;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);

    SaXSetPose(SA_X_POSE_MORPHING);
}

/**
 * @brief 16dd0 | 20 | Handles the SA-X morphing
 * 
 */
void SaXMorphing(void)
{
    if (gSaXData.pose == SA_X_POSE_MORPH_BALL)
        gCurrentSprite.pose = 0x3D;
}

/**
 * @brief 16df0 | 24 | Initializes the SA-X to be rolling
 * 
 */
void SaXRollingInit(void)
{
    gCurrentSprite.pose = 0x3E;
    gCurrentSprite.hitboxTop = -(HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_ROLLING);
}

/**
 * @brief 16e14 | b8 | Handles the SA-X rolling
 * 
 */
void SaXRolling(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition + (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
            SaXSetDirection();
        }
        else
        {
            gCurrentSprite.xPosition += QUARTER_BLOCK_SIZE / 2;
            gCurrentSprite.rotation += Q_8_8(.065f);
        }
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition - (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
            SaXSetDirection();
        }
        else
        {
            gCurrentSprite.xPosition -= QUARTER_BLOCK_SIZE / 2;
            gCurrentSprite.rotation -= Q_8_8(.065f);
        }
    }

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition - BLOCK_SIZE);

    if (gPreviousCollisionCheck == COLLISION_AIR)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition + BLOCK_SIZE);
        if (gPreviousCollisionCheck == COLLISION_AIR)
            gCurrentSprite.pose = 0x3F;
    }
}

/**
 * @brief 16ecc | 24 | Initializes the SA-X to be unmorphing
 * 
 */
void SaXUnmorphingInit(void)
{
    gCurrentSprite.pose = 0x40;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);

    SaXSetPose(SA_X_POSE_UNMORPHING);
}

/**
 * @brief 16ef0 | 34 | Handles the SA-X unmorphing
 * 
 */
void SaXUnmorphing(void)
{
    if (gSaXData.pose != SA_X_POSE_STANDING)
        return;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
        gCurrentSprite.pose = 0x17;
    else
        gCurrentSprite.pose = 0x1;
}

/**
 * @brief 16f24 | 2c | Initializes the SA-X to be aiming to shoot at a door
 * 
 */
void SaXIdleBeforeShootingDoorInit(void)
{
    gCurrentSprite.pose = 0x42;
    gCurrentSprite.work1 = 16;

    gSaXData.diagonalAim = DIAG_AIM_NONE;
    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 16f50 | 24 | Handles the SA-X aiming to shoot at a door
 * 
 */
void SaXIdleBeforeShootingDoor(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x43;
}

/**
 * @brief 16f74 | 4c | Initializes the SA-X to be shooting a door
 * 
 */
void SaXShootingDoorInit(void)
{
    gCurrentSprite.pose = 0x44;

    SpriteUtilSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, DIAG_AIM_NONE, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition - (BLOCK_SIZE + PIXEL_SIZE), 0);

    gSaXData.missilesArmed = FALSE;
    SaXSetPose(SA_X_POSE_SHOOTING);
}

/**
 * @brief 16fc0 | 20 | Handles the SA-X shooting a door
 * 
 */
void SaXShootingDoor(void)
{
    if (gSaXData.pose == SA_X_POSE_STANDING)
        gCurrentSprite.pose = 0x45;
}

/**
 * @brief 16fe0 | 28 | Initializes the SA-X to be idle after shooting a door
 * 
 */
void SaXIdleAfterShootingDoorInit(void)
{
    gCurrentSprite.pose = 0x46;
    gCurrentSprite.work1 = 24;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 17008 | 24 | Handles the SA-X being idle after shooting a door
 * 
 */
void SaXIdleAfterShootingDoor(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x47;
}

/**
 * @brief 1702c | 2c | Initializes the SA-X to be walking to a door
 * 
 */
void SaXWalkingToDoorInit(void)
{
    gCurrentSprite.pose = 0x48;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_WALKING);
}

/**
 * @brief 17058 | b8 | Handles the SA-X walking to a door
 * 
 */
void SaXWalkingToDoor(void)
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

    unk_11604(sSaXWalkingSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXWalkingSpeed) * 8 - 1)
        gCurrentSprite.work3++;
    
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);
    if (gPreviousCollisionCheck == COLLISION_SOLID)
        gCurrentSprite.status = 0;
}

/**
 * @brief 17110 | d0 | Initializes an SA-X ice beam sprite
 * 
 */
void SaXBeamInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_SA_X_ICE_BEAM;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE - PIXEL_SIZE);
    gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE - PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE - PIXEL_SIZE);
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE - PIXEL_SIZE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 60;
    gCurrentSprite.work4 = 0;

    gCurrentSprite.pose = 0x2;
    gCurrentSprite.drawOrder = 3;

    if (gCurrentSprite.roomSlot == DIAG_AIM_NONE)
    {
        gCurrentSprite.pOam = sSaXBeamOam_Forward;
    }
    else if (gCurrentSprite.roomSlot == DIAG_AIM_UP)
    {
        gCurrentSprite.pOam = sSaXBeamOam_Diagonal;
    }
    else if (gCurrentSprite.roomSlot == DIAG_AIM_DOWN)
    {
        gCurrentSprite.pOam = sSaXBeamOam_Diagonal;
        gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
    }
    else if (gCurrentSprite.roomSlot == 0x80)
    {
        gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.pOam = sSaXBeamOam_Forward;
        gCurrentSprite.samusCollision = SSC_NONE;
    }
    else
    {
        gCurrentSprite.status = 0;
        return;
    }

    SoundPlay(0x25C);
}

/**
 * @brief 171e0 | 130 | Handles an SA-X ice beam moving
 * 
 */
void SaXBeamMove(void)
{
    u8 offset;
    s16 yMovement;
    s16 xMovement;

    offset = gCurrentSprite.work4;

    switch (gCurrentSprite.roomSlot)
    {
        case DIAG_AIM_UP:
            gCurrentSprite.yPosition -= (QUARTER_BLOCK_SIZE - ONE_SUB_PIXEL);

            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            {
                gCurrentSprite.xPosition += (QUARTER_BLOCK_SIZE - ONE_SUB_PIXEL);

                yMovement = sSaXBeamDiagonalYMovement[offset];
                xMovement = yMovement;
                if (yMovement == SHORT_MAX)
                {
                    offset = 0;
                    yMovement = sSaXBeamDiagonalYMovement[0];
                    xMovement = yMovement;
                }
            }
            else
            {
                gCurrentSprite.xPosition -= (QUARTER_BLOCK_SIZE - ONE_SUB_PIXEL);

                yMovement = sSaXBeamDiagonalYMovement[offset];
                xMovement = sSaXBeamDiagonalXMovement[offset];
                if (yMovement == SHORT_MAX)
                {
                    offset = 0;
                    yMovement = sSaXBeamDiagonalYMovement[0];
                    xMovement = sSaXBeamDiagonalXMovement[0];
                }
            }

            gCurrentSprite.work4 = offset + 1;
            gCurrentSprite.yPosition += yMovement;
            gCurrentSprite.xPosition += xMovement;
            break;

        case DIAG_AIM_DOWN:
            gCurrentSprite.yPosition += (QUARTER_BLOCK_SIZE - ONE_SUB_PIXEL);

            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            {
                gCurrentSprite.xPosition += (QUARTER_BLOCK_SIZE - ONE_SUB_PIXEL);

                yMovement = sSaXBeamDiagonalYMovement[offset];
                xMovement = sSaXBeamDiagonalXMovement[offset];
                if (yMovement == SHORT_MAX)
                {
                    offset = 0;
                    yMovement = sSaXBeamDiagonalYMovement[0];
                    xMovement = sSaXBeamDiagonalXMovement[0];
                }
            }
            else
            {
                gCurrentSprite.xPosition -= (QUARTER_BLOCK_SIZE - ONE_SUB_PIXEL);

                yMovement = sSaXBeamDiagonalYMovement[offset];
                xMovement = yMovement;
                if (yMovement == SHORT_MAX)
                {
                    offset = 0;
                    yMovement = sSaXBeamDiagonalYMovement[0];
                    xMovement = yMovement;
                }
            }

            gCurrentSprite.work4 = offset + 1;
            gCurrentSprite.yPosition += yMovement;
            gCurrentSprite.xPosition += xMovement;
            break;

        default:
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.xPosition += QUARTER_BLOCK_SIZE + PIXEL_SIZE;
            else
                gCurrentSprite.xPosition -= QUARTER_BLOCK_SIZE + PIXEL_SIZE;

            yMovement = sSaXBeamForwardYMovement[offset];
            if (yMovement == SHORT_MAX)
            {
                offset = 0;
                yMovement = sSaXBeamForwardYMovement[0];
            }

            gCurrentSprite.work4 = offset + 1;
            gCurrentSprite.yPosition += yMovement;
            break;
    }

    gCurrentClipdataAffectingAction = 0x6;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (!(gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN))
    {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
            gCurrentSprite.status = 0;
    }
}

/**
 * @brief 17310 | a8 | Initializes an SA-X super missile sprite
 * 
 */
void SaXMissileInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_SA_X_SUPER_MISSILE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE - PIXEL_SIZE);
    gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE - PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE - PIXEL_SIZE);
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE - PIXEL_SIZE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 60;

    gCurrentSprite.pose = 0x2;
    gCurrentSprite.drawOrder = 3;

    if (gCurrentSprite.roomSlot == DIAG_AIM_NONE)
    {
        gCurrentSprite.pOam = sSaXMissileOam_Forward;
    }
    else if (gCurrentSprite.roomSlot == DIAG_AIM_UP)
    {
        gCurrentSprite.pOam = sSaXMissileOam_Diagonal;
    }
    else if (gCurrentSprite.roomSlot == DIAG_AIM_DOWN)
    {
        gCurrentSprite.pOam = sSaXMissileOam_Diagonal;
        gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
    }
    else
    {
        gCurrentSprite.status = 0;
        return;
    }

    SoundPlay(0x25D);
}

/**
 * @brief 173b8 | 34 | Handles an SA-X super missile exploding
 * 
 */
void SaXMissileExploding(void)
{
    gCurrentSprite.status = 0;
    ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0xD);
    SoundPlay(0x25E);

    ScreenShakeStartHorizontal(40, 0x80 | 1);
    ScreenShakeStartVertical(40, 0x80 | 1);
}

/**
 * @brief 173ec | ac | Handles an SA-X super missile moving
 * 
 */
void SaXMissileMoving(void)
{
    switch (gCurrentSprite.roomSlot)
    {
        case DIAG_AIM_UP:
            gCurrentSprite.yPosition -= SA_X_MISSILE_DIAGONAL_SPEED;
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.xPosition += SA_X_MISSILE_DIAGONAL_SPEED;
            else
                gCurrentSprite.xPosition -= SA_X_MISSILE_DIAGONAL_SPEED;
            break;

        case DIAG_AIM_DOWN:
            gCurrentSprite.yPosition += SA_X_MISSILE_DIAGONAL_SPEED;
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.xPosition += SA_X_MISSILE_DIAGONAL_SPEED;
            else
                gCurrentSprite.xPosition -= SA_X_MISSILE_DIAGONAL_SPEED;
            break;

        default:
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.xPosition += SA_X_MISSILE_SPEED;
            else
                gCurrentSprite.xPosition -= SA_X_MISSILE_SPEED;
    }

    gCurrentClipdataAffectingAction = 0x8;

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousCollisionCheck == COLLISION_SOLID)
    {
        SaXMissileExploding();
        return;
    }

    if (!(gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN))
    {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
            gCurrentSprite.status = 0;
    }
}

/**
 * @brief 17498 | 74 | Initializes an SA-X power bomb sprite
 * 
 */
void SaXPowerBombInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.pOam = sSaXPowerBombOam_SpinningSlow;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = 0x2;
    gCurrentSprite.work1 = 60;
    gCurrentSprite.bgPriority = 1;

    SoundPlay(0x260);
}

/**
 * @brief 1750c | 40 | Handles an SA-X power bomb spinning slowly
 * 
 */
void SaXPowerBombSpinningSlowly(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pOam = sSaXPowerBombOam_SpinningFast;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.work1 = 60;
        gCurrentSprite.pose = 0x18;
    }
}

/**
 * @brief 1754c | 50 | Handles an SA-X power bomb spinning quickly
 * 
 */
void SaXPowerBombSpinningQuickly(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
    {
        PowerBombExplosionStart(gCurrentSprite.xPosition, gCurrentSprite.yPosition, TRUE);

        gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.samusCollision = SSC_SA_X_POWER_BOMB;
        gCurrentSprite.pose = 0x1A;

        SoundPlay(0x261);
    }
}

/**
 * @brief 1759c | 2c | Handles an SA-X power bomb spinning exploding
 * 
 */
void SaXPowerBombExploding(void)
{
    gCurrentSprite.hitboxTop = gCurrentPowerBomb.hitboxTop;
    gCurrentSprite.hitboxBottom = gCurrentPowerBomb.hitboxBottom;
    gCurrentSprite.hitboxLeft = gCurrentPowerBomb.hitboxLeft;
    gCurrentSprite.hitboxRight = gCurrentPowerBomb.hitboxRight;

    if (gCurrentPowerBomb.animationState == 0)
        gCurrentSprite.status = 0;
}
