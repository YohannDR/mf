#include "sprites_AI/super_missile_barrier.h"
#include "macros.h"
#include "globals.h"
#include "sprite_util.h"

#include "data/sprites/super_missile_barrier.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

/**
 * @brief 41e84 | 12c | Iniializes a super missile barrier
 * 
 */
void SuperMissileBarrierInit(void)
{
    u8 spriteId;
    u16 barrierBit;
    
    SpriteUtilTrySetAbsorbXFlag();

    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = ARRAY_SIZE(sXParasiteMosaicValues);
    }
    else
    {
        // All barrier sprite ids are next to each other numerically, so doing spriteId - firstBarrierId offsets the id to start at 0
        spriteId = gCurrentSprite.spriteId;
        spriteId -= PSPRITE_X_BARRIER_CORE_SUPER_1;

        // Get bit affected by the current barrier
        barrierBit = gSuperXBarrierCoresDestroyed >> spriteId;

        if (barrierBit & 1)
        {
            gCurrentSprite.status = 0;
            return;
        }

        gCurrentSprite.pose = SPRITE_POSE_IDLE;
    }

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_SOLID;

    gCurrentSprite.pOam = sSuperMissileBarrierOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
    {
        if (!(gCurrentSprite.status & SS_HIDDEN))
        {
            gCurrentSprite.status = 0;
            return;
        }

        gCurrentSprite.hitboxTop = -BLOCK_SIZE;
        gCurrentSprite.hitboxBottom = BLOCK_SIZE;
        gCurrentSprite.hitboxLeft = -(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
        gCurrentSprite.hitboxRight = BLOCK_SIZE - QUARTER_BLOCK_SIZE;
        return;
    }

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = BLOCK_SIZE - QUARTER_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -(HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;

    spriteId = SpriteSpawnSecondary(SSPRITE_X_BARRIER_CORE_SUPER_STEM, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);

    if (spriteId == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    XBarrierSetCollision(CAA_MAKE_SOLID_STOP_ENEMY);
}

/**
 * @brief 41fb0 | 20 | Initializes a super missile barrier to be idle
 * 
 */
void SuperMissileBarrierIdleInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sSuperMissileBarrierOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 41fd0 | 20 | Handles a super missile barrier being idle
 * 
 */
void SuperMissileBarrierIdle(void)
{
    return;
}

/**
 * @brief 41fd4 | 30 | Handles a super missile barrier dying
 * 
 */
void SuperMissileBarrierDying(void)
{
    u8 spriteId;
    u16 barrierBit;

    // All barrier sprite ids are next to each other numerically, so doing spriteId - firstBarrierId offsets the id to start at 0
    spriteId = gCurrentSprite.spriteId;
    spriteId -= PSPRITE_X_BARRIER_CORE_SUPER_1;

    // Get bit affected by the current barrier
    barrierBit = 1 << spriteId;

    gSuperXBarrierCoresDestroyed |= barrierBit;

    XBarrierSetCollision(CAA_REMOVE_SOLID);
}

/**
 * @brief 42004 | b0 | Super missile barrier AI
 * 
 */
void SuperMissileBarrier(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 0x4)
        SoundPlayNotAlreadyPlaying(0x160);

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_X_BARRIER_CORE_SUPER_STEM, gCurrentSprite.primarySpriteRamSlot);
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SuperMissileBarrierInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            SuperMissileBarrierIdleInit();

        case SPRITE_POSE_IDLE:
            SuperMissileBarrierIdle();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_X_BARRIER_CORE_SUPER_STEM, gCurrentSprite.primarySpriteRamSlot);
            SuperMissileBarrierDying();
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            SuperMissileBarrierInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
    }
}

/**
 * @brief 420b4 | 13c | Super missile barrier stem AI
 * 
 */
void SuperMissileBarrierStem(void)
{
    u8 ramSlot;
    
    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdatePrimarySpriteFreezeTimer();
        return;
    }

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;

            gCurrentSprite.pose = SPRITE_POSE_IDLE;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2);
            gCurrentSprite.hitboxBottom = BLOCK_SIZE * 2;
            gCurrentSprite.hitboxLeft = -QUARTER_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE;

            gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);

            gCurrentSprite.drawOrder = 6;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_SOLID;

            gCurrentSprite.pOam = sSuperMissileBarrierStemOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            break;

        case SPRITE_POSE_IDLE:
            if (gSpriteData[ramSlot].health == 0)
            {
                gCurrentSprite.pose = 0x18;

                gCurrentSprite.pOam = sSuperMissileBarrierStemOam_Destroyed;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;

                gCurrentSprite.health = 0;
                gCurrentSprite.ignoreSamusCollisionTimer = 1;
            }
            break;

        case 0x18:
            gCurrentSprite.ignoreSamusCollisionTimer = 1;

            if (SpriteUtilCheckEndCurrentSpriteAnim())
            {
                gCurrentSprite.status = 0;
            }
            break;
    }

    if (gSpriteData[ramSlot].status & SS_ENABLE_MOSAIC)
    {
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    }
    else
    {
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
}
