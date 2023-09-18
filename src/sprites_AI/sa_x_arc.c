#include "sprites_AI/sa_x_arc.h"
#include "sprites_AI/sa_x.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/sa_x.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"
#include "constants/sa_x.h"

#include "structs/sprite.h"
#include "structs/samus.h"
#include "structs/sa_x.h"

/**
 * @brief 18f50 | 158 | Checks the walking collisions for the SA-X (arc)
 * 
 */
void SaXArcCheckCollisionWalking(void)
{
    gCurrentSprite.work2 = DIAG_AIM_NONE;

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

            if (gPreviousVerticalCollisionCheck == COLLISION_LEFT_STEEP_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            else if (gPreviousVerticalCollisionCheck == COLLISION_LEFT_SLIGHT_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        }
        else
        {
            SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + QUARTER_BLOCK_SIZE);

            if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = 0x37;
                return;
            }

            if (gPreviousVerticalCollisionCheck == COLLISION_RIGHT_STEEP_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            else if (gPreviousVerticalCollisionCheck == COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        }

        return;
    }

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (!(gPreviousVerticalCollisionCheck & 0xF0))
            return;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            gCurrentSprite.work2 = 0x1;
            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE),
            gCurrentSprite.xPosition + (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition + (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = 0x49;
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
            gCurrentSprite.work2 = 0x1;
            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE),
            gCurrentSprite.xPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = 0x49;
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
 * @brief 19098 | 32c | Checks the walking to lay power bomb collisions for the SA-X (arc)
 * 
 */
void SaXArcCheckCollisionRunning(void)
{
    gCurrentSprite.work2 = DIAG_AIM_NONE;

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

            if (gPreviousVerticalCollisionCheck == COLLISION_LEFT_STEEP_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            else if (gPreviousVerticalCollisionCheck == COLLISION_LEFT_SLIGHT_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        }
        else
        {
            SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + QUARTER_BLOCK_SIZE);

            if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = 0x37;
                return;
            }

            if (gPreviousVerticalCollisionCheck == COLLISION_RIGHT_STEEP_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            else if (gPreviousVerticalCollisionCheck == COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        }

        return;
    }
    
    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (!(gPreviousVerticalCollisionCheck & 0xF0))
            return;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);
        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE),
                gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

            if (gPreviousCollisionCheck == COLLISION_AIR)
                gCurrentSprite.work2 = 0x1;
            else
                gCurrentSprite.work2 = 0x4;

            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE),
            gCurrentSprite.xPosition + (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition + (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 5 + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                    gCurrentSprite.xPosition + (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

                if (gPreviousCollisionCheck == COLLISION_SOLID)
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 7 + QUARTER_BLOCK_SIZE - PIXEL_SIZE),
                        gCurrentSprite.xPosition + (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

                    if (gPreviousCollisionCheck == COLLISION_AIR)
                    {
                        gCurrentSprite.work2 = 0x3;
                        gCurrentSprite.pose = 0x37;
                        gCurrentSprite.work3 = 0x8;
                    }
                    else
                    {
                        gCurrentSprite.pose = 0x39;
                    }
                }
                else
                {
                    gCurrentSprite.work2 = 0x2;;
                    gCurrentSprite.pose = 0x37;
                }
            }
            else
            {
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
            }
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.work2 = 0x1;
                gCurrentSprite.pose = 0x37;
            }
        }
    }
    else
    {
        if (!(gPreviousVerticalCollisionCheck & 0xF0))
            return;

        if (gCurrentRoom == 43 && gCurrentSprite.xPosition < BLOCK_SIZE * 44)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 7 + QUARTER_BLOCK_SIZE - PIXEL_SIZE),
                gCurrentSprite.xPosition - (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

            if (gPreviousCollisionCheck != COLLISION_AIR && gSaXVision.samusOnRight == FALSE)
            {
                gCurrentSprite.pose = 0x2D;
                gCurrentSprite.work2 = gSaXVision.unk_0;
                return;
            }
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - HALF_BLOCK_SIZE);
        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE),
                gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

            if (gPreviousCollisionCheck == COLLISION_AIR)
                gCurrentSprite.work2 = 0x1;
            else
                gCurrentSprite.work2 = 0x4;

            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE),
            gCurrentSprite.xPosition - (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition - (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 5 + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                    gCurrentSprite.xPosition - (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

                if (gPreviousCollisionCheck == COLLISION_SOLID)
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 7 + QUARTER_BLOCK_SIZE - PIXEL_SIZE),
                        gCurrentSprite.xPosition - (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2));

                    if (gPreviousCollisionCheck == COLLISION_AIR)
                    {
                        gCurrentSprite.work2 = 0x3;
                        gCurrentSprite.pose = 0x37;
                        gCurrentSprite.work3 = 0x8;
                    }
                    else
                    {
                        gCurrentSprite.pose = 0x39;
                    }
                }
                else
                {
                    gCurrentSprite.work2 = 0x2;
                    gCurrentSprite.pose = 0x37;
                }
            }
            else
            {
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
            }
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.work2 = 0x1;
                gCurrentSprite.pose = 0x37;
            }
        }
    }
}

/**
 * @brief 193c4 | 96 |  Initializes the SA-X (arc)
 * 
 */
void SaXArcInit(void)
{
    gCurrentSprite.yPosition = gSaXSpawnPosition.y;
    gCurrentSprite.xPosition = gSaXSpawnPosition.x;

    SaXInit();

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        gCurrentSprite.xPosition -= (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
    else
        gCurrentSprite.xPosition += (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

    gCurrentSprite.samusCollision = SSC_NONE;

    if (EventCheckOn_PowerBombDataDownloaded())
    {
        gCurrentSprite.status |= SPRITE_STATUS_UNKNOWN_2000;
        gCurrentSprite.pose = 0x19;
        SaXSetPose(SA_X_POSE_WALKING);
    }
    else if (EventCheckOn_ArcSaXEncounter())
    {
        gCurrentSprite.status |= SPRITE_STATUS_UNKNOWN_2000;
        gCurrentSprite.pose = 0x1B;
        gCurrentSprite.work1 = 60;
        SaXSetPose(SA_X_POSE_RUNNING);
    }
    else
    {
        gCurrentSprite.status = 0;
    }
}

/**
 * @brief 1945c | 84 | Handles the SA-X (arc) waiting in a door during a chase
 * 
 */
void SaXArcWaitingInDoorDuringChase(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 != 0)
        return;

    gCurrentSprite.pose = 0x1C;
    gCurrentSprite.work1 = 30;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, 0x80, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    }
    else
    {
        SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, 0x80, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition, 0);
    }
}

/**
 * @brief 194e0 | 40 | Handles the SA-X (arc) opening a door during a chase
 * 
 */
void SaXArcOpeningDoorDuringChase(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 != 0)
        return;

    SaXRunningInit();
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;

    gCurrentSprite.status &= ~SPRITE_STATUS_UNKNOWN_2000;
    gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
}

/**
 * @brief 19520 | 7c | Handles the SA-X (arc) waiting in a door
 * 
 */
void SaXArcWaitingInDoor(void)
{
    if (!EventCheckOn_NocSaXEncounter())
        return;

    gCurrentSprite.pose = 0x1A;
    gCurrentSprite.work1 = 30;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, 0x80, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    }
    else
    {
        SpriteSpawnSecondary(SSPRITE_SA_X_ICE_BEAM, 0x80, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition, 0);
    }
}

/**
 * @brief 1959c | 3c | Handles the SA-X (arc) opening a door
 * 
 */
void SaXArcOpeningDoor(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 != 0)
        return;

    SaXWalkingInit();

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.status &= ~SPRITE_STATUS_UNKNOWN_2000;

    SubEventUpdateForSaXEncounter();
}

/**
 * @brief 195d8 | 88 | Handles the SA-X (arc) walking
 * 
 */
void SaXArcWalking(void)
{
    if (unk_15e88())
        return;

    SaXArcCheckCollisionWalking();

    if (gCurrentSprite.pose != 0x2)
        return;

    if (gSamusData.newProjectile != 0x0)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (gSaXVision.samusOnRight == FALSE)
            {
                gCurrentSprite.pose = 0x4D;
            }
        }
        else
        {
            if (gSaXVision.samusOnRight == TRUE)
            {
                gCurrentSprite.pose = 0x4D;
            }
        }
    }

    unk_11604(sSaXWalkingSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXWalkingSpeed) * 8 - 1)
        gCurrentSprite.work3++;
}

/**
 * @brief 19660 | 28 | Initializes the SA-X (arc) to be stopped at the pillar
 * 
 */
void SaXArcStoppedAtPillarInit(void)
{
    gCurrentSprite.pose = 0x4A;
    gCurrentSprite.work1 = 60 * 2;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 19688 | 24 | Handles the SA-X (arc) being stopped at the pillar
 * 
 */
void SaXArcStoppedAtPillar(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x3;
}

/**
 * @brief 196ac | 28 | Initializes the SA-X (arc) to be idle after hearing a weapon
 * 
 */
void SaXArcIdleAfterHearingWeaponInit(void)
{
    gCurrentSprite.pose = 0x4C;
    gCurrentSprite.work1 = 60 * 2;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 196d4 | 24 | Handles the SA-X (arc) being idle after hearing a weapon
 * 
 */
void SaXArcIdleAfterHearingWeapon(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x1;
}

/**
 * @brief 196f8 | 24 | Initializes the SA-X (arc) to be turning after hearing a weapon
 * 
 */
void SaXArcTurningAroundAfterHearingWeaponInit(void)
{
    gCurrentSprite.pose = 0x4E;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_TURNING);
}

/**
 * @brief 1971c | 50 | Handles the SA-X (arc) turning around after hearing a weapon
 * 
 */
void SaXArcTurningAroundAfterHearingWeapon(void)
{
    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = 0x15;
        return;
    }

    if (gSaXData.pose == SA_X_POSE_STANDING)
    {
        gCurrentSprite.pose = 0x4B;
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        SaXSetDirection();
    }
}

/**
 * @brief 1976c | 4c | Handles the SA-X (arc) running
 * 
 */
void SaXArcRunning(void)
{
    if (unk_15dd4())
        return;

    SaXArcCheckCollisionRunning();

    if (gCurrentSprite.pose != 0x18)
        return;

    unk_11604(sSaXRunningSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXRunningSpeed) * 8 - 1)
        gCurrentSprite.work3++;
}

/**
 * @brief 197b8 | 50 | Handles the SA-X (arc) turning around during a chase
 * 
 */
void SaXArcTurningAroundChase(void)
{
    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = 0x15;
        return;
    }

    if (gSaXData.pose == SA_X_POSE_STANDING)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        SaXSetDirection();
        gCurrentSprite.pose = 0x17;
    }
}

/**
 * @brief 19808 | 4c | Initializes the SA-X (arc) to be idle before shooting a beam
 * 
 */
void SaXArcDelayBeforeShootingBeamInit(void)
{
    gCurrentSprite.pose = 0x2E;
    gCurrentSprite.work1 = 32;

    if (gCurrentSprite.work2 == DIAG_AIM_NONE)
        gSaXData.diagonalAim = DIAG_AIM_NONE;
    else if (gCurrentSprite.work2 == DIAG_AIM_UP)
        gSaXData.diagonalAim = DIAG_AIM_UP;
    else if (gCurrentSprite.work2 == DIAG_AIM_DOWN)
        gSaXData.diagonalAim = DIAG_AIM_DOWN;

    gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
    SaXSetDirection();
    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 19854 | 40 | Handles the SA-X (arc) being idle before shooting a beam
 * 
 */
void SaXArcDelayBeforeShootingBeam(void)
{
    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = 0x15;
        return;
    }

    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x2F;
}

/**
 * @brief 19894 | a8 | Handles the SA-X (arc) shooting a beam
 * 
 */
void SaXArcShootingBeamInit(void)
{
    gCurrentSprite.pose = 0x30;

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

    gSaXData.missilesArmed = FALSE;
    SaXSetPose(SA_X_POSE_SHOOTING);
}

/**
 * @brief 1993c | 6c | Handles the SA-X (arc) shooting a beam
 * 
 */
void SaXArcShootingBeam(void)
{
    unk_1129c();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = 0x15;
        return;
    }

    if (gSaXData.pose == SA_X_POSE_STANDING)
    {
        if (gPreviousCollisionCheck != COLLISION_AIR && gSaXVision.samusOnRight == FALSE)
        {
            gCurrentSprite.pose = 0x2D;
            gCurrentSprite.work2 = gSaXVision.unk_0;
        }
        else
        {
            gCurrentSprite.pose = 0x39;
        }
    }
}

/**
 * @brief 199a8 | 280 | SA-X (arc) AI
 * 
 */
void SaXArc(void)
{
    if (SaXUpdateFreezeTimer())
        return;

    SaXSeeAndLocateSamus();

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            SaXArcInit();
            break;

        case 0x19:
            SaXArcWaitingInDoor();
            break;

        case 0x1A:
            SaXArcOpeningDoor();
            break;

        case 0x1:
            SaXWalkingInit();
            break;

        case 0x2:
            SaXArcWalking();
            break;

        case 0x49:
            SaXArcStoppedAtPillarInit();

        case 0x4A:
            SaXArcStoppedAtPillar();
            break;

        case 0x4B:
            SaXArcIdleAfterHearingWeaponInit();

        case 0x4C:
            SaXArcIdleAfterHearingWeapon();
            break;

        case 0x4D:
            SaXArcTurningAroundAfterHearingWeaponInit();

        case 0x4E:
            SaXArcTurningAroundAfterHearingWeapon();
            break;

        case 0x1B:
            SaXArcWaitingInDoorDuringChase();
            break;

        case 0x1C:
            SaXArcOpeningDoorDuringChase();
            break;

        case 0x17:
            SaXRunningInit();

        case 0x18:
            SaXArcRunning();
            break;

        case 0x39:
            SaXTurningAroundChaseInit();

        case 0x3A:
            SaXArcTurningAroundChase();
            break;

        case 0x2D:
            SaXArcDelayBeforeShootingBeamInit();

        case 0x2E:
            SaXArcDelayBeforeShootingBeam();
            break;

        case 0x2F:
            SaXArcShootingBeamInit();

        case 0x30:
            SaXArcShootingBeam();
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

        case 0x37:
            SaXMidAirInit();

        case 0x38:
            SaXMidAir();
            break;

        case 0x3B:
            SaXMorphingInit();

        case 0x3C:
            SaXMorphing();
            break;

        case 0x3D:
            SaXRollingInit();

        case 0x3E:
            SaXRolling();
            break;

        case 0x3F:
            SaXUnmorphingInit();

        case 0x40:
            SaXUnmorphing();
    }

    if (gSaXData.pose == SA_X_POSE_MID_AIR)
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
    else
        gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;

    SaXUpdateGraphics();

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
        MusicPlay(0x17, 0x9);
}
