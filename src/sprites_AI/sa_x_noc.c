#include "sprites_AI/sa_x_noc.h"
#include "sprites_AI/sa_x.h"
#include "macros.h"

#include "data/sprites/sa_x.h"

#include "constants/clipdata.h"
#include "constants/event.h"
#include "constants/sprite.h"
#include "constants/samus.h"
#include "constants/sa_x.h"

#include "structs/sprite.h"
#include "structs/sa_x.h"

/**
 * @brief 184e0 | 164 | Checks the walking collisions for the SA-X (noc)
 * 
 */
void SaXNocCheckCollisionWalking(void)
{
    gCurrentSprite.work2 = DIAG_AIM_NONE;

    SpriteUtilAdjustYPosOnSlope();

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
            gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE),
                    gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));
    
                if (gPreviousCollisionCheck == COLLISION_SOLID)
                {
                    gCurrentSprite.pose = 0x3;
                    return;
                }
    
                gCurrentSprite.work2 = 0x2;
                gCurrentSprite.pose = 0x37;
                return;
            }
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

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition - (BLOCK_SIZE * 4));
        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            gCurrentSprite.pose = 0x41;
        }
    }
}

/**
 * @brief 18644 | 200 | Checks the running collisions for the SA-X (noc)
 * 
 */
void SaXNocCheckCollisionRunning(void)
{
    gCurrentSprite.work2 = DIAG_AIM_NONE;

    SpriteUtilAdjustYPosOnSlope();

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
            gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE),
                    gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));
    
                if (gPreviousCollisionCheck == COLLISION_SOLID)
                {
                    gCurrentSprite.pose = 0x39;
                    return;
                }
    
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

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 3 + HALF_BLOCK_SIZE), gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));
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
            gCurrentSprite.work2 = 0x1;
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
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE),
                    gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));
    
                if (gPreviousCollisionCheck == COLLISION_SOLID)
                {
                    gCurrentSprite.pose = 0x39;
                    return;
                }
    
                gCurrentSprite.work2 = 0x2;
                gCurrentSprite.pose = 0x37;
                return;
            }

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE), gCurrentSprite.xPosition);
    
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
 * @brief 18844 | 4c | Checks the walking to lay power bomb collisions for the SA-X (noc)
 * 
 */
void SaXNocCheckCollisionWalkingToLayPowerBomb(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + (BLOCK_SIZE * 5));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.pose = 0x49;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition - (BLOCK_SIZE * 5));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.pose = 0x49;
    }
}

/**
 * @brief 18890 | 98 | Initializes the SA-X (noc)
 * 
 */
void SaXNocInit(void)
{
    gCurrentSprite.yPosition = gSaXSpawnPosition.y;
    gCurrentSprite.xPosition = gSaXSpawnPosition.x;

    SaXInit();

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        gCurrentSprite.xPosition -= (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
    else
        gCurrentSprite.xPosition += (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

    gCurrentSprite.samusCollision = SSC_NONE;

    if (EventCheckOn_NavigationRoomEnteringNoc())
    {
        gCurrentSprite.status |= SPRITE_STATUS_UNKNOWN_2000;
        gCurrentSprite.pose = 0x19;
        SaXSetPose(SA_X_POSE_WALKING);
    }
    else if (EventCheckOn_NocSaXEncounter())
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
 * @brief 18928 | 84 | Handles the SA-X (noc) waiting in a door during a chase
 * 
 */
void SaXNocWaitingInDoorDuringChase(void)
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
 * @brief 189ac | 40 | Handles the SA-X (noc) opening a door during a chase
 * 
 */
void SaXNocOpeningDoorDuringChase(void)
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
 * @brief 189ec | 98 | Handles the SA-X (noc) waiting in a door to lay a power bomb
 * 
 */
void SaXNocWaitingInDoorToLayPowerBomb(void)
{
    if (!EventCheckOn_NocSaXEncounter())
        return;

    SaXWalkingInit();

    gCurrentSprite.pose = 0x1A;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.status &= ~SPRITE_STATUS_UNKNOWN_2000;

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

    gCurrentSprite.work1 = 30;
}

/**
 * @brief 18a84 | 64 | Handles the SA-X (noc) walking to lay a power bomb
 * 
 */
void SaXNocWalkingToLayPowerBomb(void)
{
    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
            SubEventUpdateForSaXEncounter();

        return;
    }

    if (unk_15e88())
        return;

    SaXNocCheckCollisionWalkingToLayPowerBomb();
    if (gCurrentSprite.pose == 0x1A)
    {
        unk_11604(sSaXWalkingSpeed[gCurrentSprite.work3 / 8]);

        if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXWalkingSpeed) * 8 - 1)
            gCurrentSprite.work3++;
    }
}

/**
 * @brief 18ae8 | 28 | Initializes the SA-X (noc) to be idle before laying a power bomb
 * 
 */
void SaXNocIdleBeforeLayingPowerBombInit(void)
{
    gCurrentSprite.pose = 0x4A;

    gCurrentSprite.work1 = 24;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - PIXEL_SIZE * 2);

    SaXSetPose(SA_X_POSE_STANDING);
}

/**
 * @brief 18b10 | 24 | Handles the SA-X (noc) being idle before laying a power bomb
 * 
 */
void SaXNocIdleBeforeLayingPowerBomb(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x4B;
}

/**
 * @brief 18b34 | 24 | Initializes the SA-X (noc) to be morphing after laying a power bomb
 * 
 */
void SaXNocMorphingToLayPowerBombInit(void)
{
    gCurrentSprite.pose = 0x4C;

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);

    SaXSetPose(SA_X_POSE_MORPHING);
}

/**
 * @brief 18b58 | 20 | Handles the SA-X (noc) morphing to lay a power bomb
 * 
 */
void SaXNocMorphingToLayPowerBomb(void)
{
    if (gSaXData.pose == SA_X_POSE_MORPH_BALL)
        gCurrentSprite.pose = 0x4D;
}

/**
 * @brief 18b78 | 20 | Initializes the SA-X (noc) laying a power bomb
 * 
 */
void SaXNocLayingPowerBombInit(void)
{
    gCurrentSprite.pose = 0x4E;
    gCurrentSprite.hitboxTop = -(HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
    gCurrentSprite.work1 = 60 * 4;
}

/**
 * @brief 18b98 | 4c | Handles the SA-X (noc) laying a power bomb
 * 
 */
void SaXNocLayingPowerBomb(void)
{
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = 0x3F;
        return;
    }

    if (gCurrentSprite.work1 == 60 * 3 + 60 / 6)
    {
        SpriteSpawnSecondary(SSPRITE_SA_X_POWER_BOMB, 0, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    }
}

/**
 * @brief 18be4 | 4c | Handles the SA-X (noc) walking
 * 
 */
void SaXNocWalking(void)
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
 * @brief 18c30 | 4c | Handles the SA-X (noc) running
 * 
 */
void SaXNocRunning(void)
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

void SaXNocTurningAroundChase(void)
{
    if (gSaXData.pose == SA_X_POSE_STANDING)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        SaXSetDirection();
        gCurrentSprite.pose = 0x17;
    }
}

/**
 * @brief 18cac | 2a4 | SA-X (noc) AI
 * 
 */
void SaXNoc(void)
{
    if (SaXUpdateFreezeTimer())
        return;

    SaXSeeAndLocateSamus();

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SaXNocInit();
            break;

        case 0x19:
            SaXNocWaitingInDoorToLayPowerBomb();
            break;

        case 0x1A:
            SaXNocWalkingToLayPowerBomb();
            break;

        case 0x49:
            SaXNocIdleBeforeLayingPowerBombInit();

        case 0x4A:
            SaXNocIdleBeforeLayingPowerBomb();
            break;

        case 0x4B:
            SaXNocMorphingToLayPowerBombInit();

        case 0x4C:
            SaXNocMorphingToLayPowerBomb();
            break;

        case 0x4D:
            SaXNocLayingPowerBombInit();

        case 0x4E:
            SaXNocLayingPowerBomb();
            break;

        case 0x1:
            SaXWalkingInit();
            break;

        case 0x2:
            SaXNocWalking();
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
            {
                unk_372c(0x50, 3, 8);
                EventCheckAdvance(EVENT_ESCAPED_NOC_SA_X);
            }
            break;

        case 0x1B:
            SaXNocWaitingInDoorDuringChase();
            break;

        case 0x1C:
            SaXNocOpeningDoorDuringChase();
            break;

        case 0x17:
            SaXRunningInit();

        case 0x18:
            SaXNocRunning();
            break;

        case 0x39:
            SaXTurningAroundChaseInit();

        case 0x3A:
            SaXNocTurningAroundChase();
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

    SaXUpdateGraphics();

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
        MusicPlay(0x17, 0x9);
}
