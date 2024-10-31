#include "sprites_AI/moto.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/moto.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

#define MOTO_POSE_TURNING_AROUND_INIT 0x3
#define MOTO_POSE_TURNING_AROUND_FIRST_PART 0x4
#define MOTO_POSE_TURNING_AROUND_SECOND_PART 0x5
#define MOTO_POSE_IDLE_INIT 0x7
#define MOTO_POSE_IDLE 0x8
#define MOTO_POSE_HITTING_WALL_INIT 0x9
#define MOTO_POSE_HITTING_WALL 0xA
#define MOTO_POSE_CHARGING_INIT 0x29
#define MOTO_POSE_CHARGING 0x2A
#define MOTO_POSE_WALKING_FASTER 0x2C
#define MOTO_POSE_WALKING_SLOWER 0x2E

/**
 * @brief 1e794 | 54 | Handles a moto spawning from an X
 * 
 */
void MotoSpawningFromX(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    gCurrentSprite.xParasiteTimer--;

    if (gCurrentSprite.xParasiteTimer != 0)
    {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    }
    else
    {
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.pose = MOTO_POSE_IDLE;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
}

/**
 * @brief 1e7e8 | 130 | Initializes a moto
 * 
 */
void MotoInit(void)
{
    u8 spriteSlot;
    
    SpriteUtilTrySetAbsorbXFlag();

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;

    gCurrentSprite.pOam = sMotoOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
    {
        if (!(gCurrentSprite.status & SS_HIDDEN))
        {
            gCurrentSprite.status = 0;
            return;
        }

        gCurrentSprite.hitboxTop = -(BLOCK_SIZE + HALF_BLOCK_SIZE);
        gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE;
        gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
        gCurrentSprite.hitboxRight = BLOCK_SIZE;
    }
    else
    {
        gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -(HALF_BLOCK_SIZE - PIXEL_SIZE);
        gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE - PIXEL_SIZE;
    }

    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        return;
    }

    gCurrentSprite.pose = MOTO_POSE_IDLE;
    SpriteUtilChooseRandomXFlip();

    if (gCurrentSprite.status & SS_X_FLIP)
    {
        spriteSlot = SpriteSpawnSecondary(SSPRITE_MOTO_FRONT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition,
            gCurrentSprite.xPosition + (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE), 0
        );
    }
    else
    {
        spriteSlot = SpriteSpawnSecondary(SSPRITE_MOTO_FRONT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition,
            gCurrentSprite.xPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE), 0
        );
    }

    if (spriteSlot == UCHAR_MAX)
        gCurrentSprite.status = 0;
}

/**
 * @brief 1e918 | 24 | Initializes a moto to be falling
 * 
 */
void MotoFallingInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.work4 = 0;

    gCurrentSprite.pOam = sMotoOam_Falling;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 1e93c | 1c | Initializes a moto to be idle
 * 
 */
void MotoIdleInit(void)
{
    gCurrentSprite.pOam = sMotoOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = MOTO_POSE_IDLE;
}

/**
 * @brief 1e958 | 54 | Handles a moto being idle
 * 
 */
void MotoIdle(void)
{
    SpriteUtilAlignYPosOnSlope();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }

    if (!SpriteUtilCheckNearEndCurrentSpriteAnim())
        return;

    if (SpriteUtilCheckSamusNearSpriteFrontBehind(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE, BLOCK_SIZE * 5, BLOCK_SIZE * 5) == NSFB_BEHIND)
        gCurrentSprite.pose = MOTO_POSE_TURNING_AROUND_INIT;
    else
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

/**
 * @brief 1e9ac | 1c | Initializes a moto to be hitting a wall
 * 
 */
void MotoHittingWallInit(void)
{
    gCurrentSprite.pOam = sMotoOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = MOTO_POSE_HITTING_WALL;
}

/**
 * @brief 1e9c8 | 38 | Handles a moto hitting a wall
 * 
 */
void MotoHittingWall(void)
{
    SpriteUtilAlignYPosOnSlope();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }

    if (!SpriteUtilCheckNearEndCurrentSpriteAnim())
        return;

    gCurrentSprite.pose = MOTO_POSE_TURNING_AROUND_INIT;
}

/**
 * @brief 1ea00 | 20 | Initializes a moto to be walking
 * 
 */
void MotoWalkingInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sMotoOam_Walking;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 1ea20 | 214 | Handles a moto walking
 * 
 */
void MotoWalking(void)
{
    u8 speed;
    u32 nsfb;

    nsfb = NSFB_OUT_OF_RANGE;
    
    SpriteUtilAlignYPosOnSlope();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
        {
            SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - BLOCK_SIZE);

            if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
                return;
            }

            if (gPreviousVerticalCollisionCheck == COLLISION_LEFT_STEEP_FLOOR_SLOPE || gPreviousVerticalCollisionCheck == COLLISION_LEFT_SLIGHT_FLOOR_SLOPE)
            {
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            }
        }
        else
        {
            SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + BLOCK_SIZE);

            if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
                return;
            }

            if (gPreviousVerticalCollisionCheck == COLLISION_RIGHT_STEEP_FLOOR_SLOPE || gPreviousVerticalCollisionCheck == COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE)
            {
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            }
        }
    }
    else if (gPreviousVerticalCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + BLOCK_SIZE);

            if (gPreviousCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = MOTO_POSE_HITTING_WALL_INIT;
                return;
            }

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition + BLOCK_SIZE);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = MOTO_POSE_HITTING_WALL_INIT;
                return;
            }
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - BLOCK_SIZE);
            
            if (gPreviousCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = MOTO_POSE_HITTING_WALL_INIT;
                return;
            }

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition - BLOCK_SIZE);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = MOTO_POSE_HITTING_WALL_INIT;
                return;
            }
        }
    }

    if (gCurrentSprite.pose == MOTO_POSE_WALKING_FASTER)
    {
        speed = DIV_SHIFT(gCurrentSprite.work3, 4);

        if (gCurrentSprite.work3 < 45)
            gCurrentSprite.work3++;

        if (gCurrentSprite.work3 == 1)
        {
            SoundPlayNotAlreadyPlaying(0x155);
        }
        else if (gCurrentSprite.work3 == 17)
        {
            SoundPlayNotAlreadyPlaying(0x156);
        }
        else if (gCurrentSprite.work3 == 33)
        {
            gCurrentSprite.work1 = 0;
            SoundPlayNotAlreadyPlaying(0x157);
        }
        else if (gCurrentSprite.work3 > 33)
        {
            gCurrentSprite.work1++;

            if (MOD_AND(gCurrentSprite.work1, 16) == 0)
                SoundPlayNotAlreadyPlaying(0x157);
        }
    }
    else if (gCurrentSprite.pose == MOTO_POSE_WALKING_SLOWER)
    {
        if (MOD_AND(gCurrentSprite.work1, 16) == 0)
        {
            if (gCurrentSprite.status & SS_X_FLIP)
                ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_DUST_1);
            else
                ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_DUST_2);

            SoundPlayNotAlreadyPlaying(0x159);
        }

        gCurrentSprite.work1++;
        speed = DIV_SHIFT(gCurrentSprite.work3, 4);

        if (gCurrentSprite.work3 != 0)
            gCurrentSprite.work3--;
        else
            gCurrentSprite.pose = MOTO_POSE_IDLE_INIT;
    }
    else
    {
        speed = PIXEL_SIZE / 2;
    }

    unk_1169c(speed);

    if (gCurrentSprite.pose == SPRITE_POSE_IDLE)
    {
        if (!(gCurrentSprite.status & SS_HIDDEN))
        {
            nsfb = SpriteUtilCheckSamusNearSpriteFrontBehind(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE, BLOCK_SIZE * 5, BLOCK_SIZE * 5);
        }

        if (nsfb == NSFB_IN_FRONT)
        {
            gCurrentSprite.pose = MOTO_POSE_CHARGING_INIT;
        }
        else if (nsfb == NSFB_BEHIND)
        {
            gCurrentSprite.pose = MOTO_POSE_TURNING_AROUND_INIT;
        }
        else
        {
            if (gCurrentSprite.status & SS_SAMUS_DETECTED)
            {
                if (gCurrentSprite.status & SS_X_FLIP)
                {
                    if (gCurrentSprite.xPosition > gSamusData.xPosition)
                        gCurrentSprite.pose = MOTO_POSE_TURNING_AROUND_INIT;
                    else
                        gCurrentSprite.pose = MOTO_POSE_CHARGING_INIT;
                }
                else
                {
                    if (gCurrentSprite.xPosition < gSamusData.xPosition)
                        gCurrentSprite.pose = MOTO_POSE_TURNING_AROUND_INIT;
                    else
                        gCurrentSprite.pose = MOTO_POSE_CHARGING_INIT;
                }
            }
            else
            {
                if (SpriteUtilCheckNearEndCurrentSpriteAnim())
                {
                    if (gSpriteRandomNumber > 12)
                        gCurrentSprite.pose = MOTO_POSE_IDLE_INIT;
                }
            }
        }

        if (gCurrentSprite.status & SS_SAMUS_DETECTED)
            gCurrentSprite.status &= ~SS_SAMUS_DETECTED;
    }
    else if (gCurrentSprite.pose == MOTO_POSE_WALKING_FASTER)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
        {
            if (gCurrentSprite.xPosition > gSamusData.xPosition)
            {
                if (gCurrentSprite.xPosition - gSamusData.xPosition > BLOCK_SIZE * 4)
                    nsfb = TRUE;
            }
        }
        else
        {
            if (gCurrentSprite.xPosition < gSamusData.xPosition)
            {
                if (gSamusData.xPosition - gCurrentSprite.xPosition > BLOCK_SIZE * 4)
                    nsfb = TRUE;
            }
        }

        if (nsfb)
        {
            gCurrentSprite.pose = MOTO_POSE_WALKING_SLOWER;

            gCurrentSprite.pOam = sMotoOam_WalkingSlowing;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;

            gCurrentSprite.work1 = 0;
        }
    }
}

/**
 * @brief 1ed14 | 20 | Initializes a moto to be charging
 * 
 */
void MotoChargingInit(void)
{
    gCurrentSprite.pose = MOTO_POSE_CHARGING;

    gCurrentSprite.pOam = sMotoOam_Charging;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 1ed34 | a4 | Handle a moto to be charging
 * 
 */
void MotoCharging(void)
{
    if (gCurrentSprite.currentAnimationFrame == 2 && gCurrentSprite.animationDurationCounter == 2)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_DUST_1);
        else
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_DUST_2);

        SoundPlayNotAlreadyPlaying(0x158);
    }
    else if (gCurrentSprite.currentAnimationFrame == 7 && gCurrentSprite.animationDurationCounter == 2)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_DUST_1);
        else
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_DUST_2);

        SoundPlayNotAlreadyPlaying(0x158);
    }

    if (SpriteUtilCheckEndCurrentSpriteAnim())
    {
        gCurrentSprite.pose = MOTO_POSE_WALKING_FASTER;

        gCurrentSprite.pOam = sMotoOam_WalkingCharged;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.work3 = 0;
    }
}

/**
 * @brief 1edd8 | 20 | Initializes a moto to be turning
 * 
 */
void MotoTurningInit(void)
{
    gCurrentSprite.pose = MOTO_POSE_TURNING_AROUND_FIRST_PART;

    gCurrentSprite.pOam = sMotoOam_TurningAroundFirstPart;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 1edf8 | 34 | Handles the first part of a moto turning
 * 
 */
void MotoTurning(void)
{
    if (SpriteUtilCheckEndCurrentSpriteAnim())
    {
        gCurrentSprite.pose = MOTO_POSE_TURNING_AROUND_SECOND_PART;

        gCurrentSprite.pOam = sMotoOam_TurningAroundSecondPart;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.status ^= SS_X_FLIP;
    }
}

/**
 * @brief 1ee2c | 1c | Handles the second part of a moto turning
 * 
 */
void MotoTurningEnd(void)
{
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

/**
 * @brief 1ee48 | 94 | Initializes a moto front
 * 
 */
void MotoFrontInit(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;
    
    if (gSpriteData[ramSlot].status & SS_HIDDEN)
        gCurrentSprite.status |= SS_HIDDEN;

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.drawOrder = 3;

    gCurrentSprite.pOam = sMotoFrontOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 1eedc | f4 | Handles a moto front being idle
 * 
 */
void MotoFrontIdle(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].status & SS_HIDDEN)
        gCurrentSprite.status |= SS_HIDDEN;
    else
        gCurrentSprite.status &= ~SS_HIDDEN;

    if (gCurrentSprite.health == 0)
    {
        if (gSpriteData[ramSlot].pose < SPRITE_POSE_DYING_INIT)
        {
            gSpriteData[ramSlot].pose = SPRITE_POSE_DYING_INIT;
            gSpriteData[ramSlot].ignoreSamusCollisionTimer = 1;

            gSpriteData[ramSlot].health = 0;

            gSpriteData[ramSlot].properties |= SP_DESTROYED;
            gSpriteData[ramSlot].freezeTimer = 0;
            gSpriteData[ramSlot].paletteRow = 0;

            gCurrentSprite.status = 0;
            return;
        }
    }

    gCurrentSprite.yPosition = gSpriteData[ramSlot].yPosition;

    if (gSpriteData[ramSlot].status & SS_X_FLIP)
        gCurrentSprite.xPosition = gSpriteData[ramSlot].xPosition + (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE);
    else
        gCurrentSprite.xPosition = gSpriteData[ramSlot].xPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE);

    switch (gSpriteData[ramSlot].pose)
    {
        case SPRITE_POSE_DYING_INIT:
        case SPRITE_POSE_DYING:
            gCurrentSprite.status = 0;
            break;
            
        default:
            if (gSpriteData[ramSlot].status & SS_ENABLE_MOSAIC)
            {
                gCurrentSprite.ignoreSamusCollisionTimer = 1;
                gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            }
            else
            {
                gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
            }
    }
}

/**
 * @brief 1efd0 | 26c | Moto AI
 * 
 */
void Moto(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x154);

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_MOTO_FRONT, gCurrentSprite.primarySpriteRamSlot);
        return;
    }

    if (SPRITE_HAS_ISFT(gCurrentSprite))
    {
        if (gCurrentSprite.status & SS_ON_SCREEN)
            gCurrentSprite.status |= SS_SAMUS_DETECTED;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            MotoInit();
            break;

        case 0x7:
            MotoIdleInit();

        case 0x8:
            MotoIdle();
            break;

        case MOTO_POSE_HITTING_WALL_INIT:
            MotoHittingWallInit();

        case MOTO_POSE_HITTING_WALL:
            MotoHittingWall();
            break;

        case SPRITE_POSE_IDLE_INIT:
            MotoWalkingInit();

        case SPRITE_POSE_IDLE:
        case MOTO_POSE_WALKING_FASTER:
        case MOTO_POSE_WALKING_SLOWER:
            MotoWalking();
            break;

        case MOTO_POSE_CHARGING_INIT:
            MotoChargingInit();

        case MOTO_POSE_CHARGING:
            MotoCharging();
            break;

        case MOTO_POSE_TURNING_AROUND_INIT:
            MotoTurningInit();

        case MOTO_POSE_TURNING_AROUND_FIRST_PART:
            MotoTurning();
            break;

        case MOTO_POSE_TURNING_AROUND_SECOND_PART:
            MotoTurningEnd();
            break;

        case SPRITE_POSE_FALLING_INIT:
            MotoFallingInit();

        case SPRITE_POSE_FALLING:
            SpriteUtilCurrentSpriteFalling();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_MOTO_FRONT, gCurrentSprite.primarySpriteRamSlot);
            SpriteDyingInit();
            
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            MotoInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            MotoSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
            gCurrentSprite.yPosition -= BLOCK_SIZE - QUARTER_BLOCK_SIZE;
            break;
    }
}

/**
 * @brief 1f23c | 84 | Moto front AI
 * 
 */
void MotoFront(void)
{
    if (SPRITE_HAS_ISFT(gSpriteData[gCurrentSprite.primarySpriteRamSlot]) < SPRITE_HAS_ISFT(gCurrentSprite))
    {
        SPRITE_CLEAR_AND_SET_ISFT(gSpriteData[gCurrentSprite.primarySpriteRamSlot], (gCurrentSprite.invincibilityStunFlashTimer + 1) & 0x7F);
    }

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdatePrimarySpriteFreezeTimer();
        return;
    }
    
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            MotoFrontInit();

        default:
            MotoFrontIdle();
    }
}
