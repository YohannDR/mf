#include "sprites_AI/sa_x.h"
#include "macros.h"
#include "gba.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"

#include "structs/sprite.h"
#include "structs/sa_x.h"

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

void SaXInit(void)
{

}

void SaXElevatorInit(void)
{

}

void SaXFallingInit(void)
{

}

void SaXFalling(void)
{

}

void SaXStandingInit(void)
{

}

void SaXStanding(void)
{

}

void SaXWalkingInit(void)
{

}

void SaXWalking(void)
{

}

void SaXTurningAroundInit(void)
{

}

void SaXTurningAround(void)
{

}

void SaXTurningAroundChaseInit(void)
{

}

void SaXTurningAroundChase(void)
{

}

void SaXRunningInit(void)
{

}

void SaXRunning(void)
{

}

void SaXMidAirInit(void)
{

}

void SaXMidAir(void)
{

}

void SaXDelayBeforeShootingBeamInit(void)
{

}

void SaXDelayBeforeShootingBeam(void)
{

}

void SaXShootingBeamInit(void)
{

}

void SaXShootingBeam(void)
{

}

void SaXDelayBeforeShootingMissileInit(void)
{

}

void SaXDelayBeforeShootingMissile(void)
{

}

void SaXShootingMissileInit(void)
{

}

void SaXShootingMissile(void)
{

}

void SaXIdleAfterShootingMissileInit(void)
{

}

void SaXIdleAfterShootingMissile(void)
{

}

void SaXMorphingInit(void)
{

}

void SaXMorphing(void)
{

}

void SaXRollingInit(void)
{

}

void SaXRolling(void)
{

}

void SaXUnmorphingInit(void)
{

}

void SaXUnmorphing(void)
{

}

void SaXIdleBeforeShootingDoorInit(void)
{

}

void SaXIdleBeforeShootingDoor(void)
{

}

void SaXShootingDoorInit(void)
{

}

void SaXShootingDoor(void)
{

}

void SaXIdleAfterShootingDoorInit(void)
{

}

void SaXIdleAfterShootingDoor(void)
{

}

void SaXWalkingToDoorInit(void)
{

}

void SaXWalkingToDoor(void)
{

}

void SaXBeamInit(void)
{

}

void SaXBeamMove(void)
{

}

void SaXMissileInit(void)
{

}

void SaXMissileExploding(void)
{

}

void SaXMissileMoving(void)
{

}

void SaXPowerBombInit(void)
{

}

void SaXPowerBombSpinningSlowly(void)
{

}

void SaXPowerBombSpinningQuickly(void)
{

}

void SaXPowerBombSyncWithProjectile(void)
{

}
