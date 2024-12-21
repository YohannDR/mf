#include "sprites_AI/power_bomb_barrier.h"
#include "macros.h"
#include "globals.h"
#include "sprite_util.h"

#include "data/sprites/power_bomb_barrier.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

/**
 * @brief 421f0 | 130 | Initializes a power bomb barrier
 * 
 */
void PowerBombBarrierInit(void)
{
    u8 spriteId;
    u16 barrierBit;

    SpriteUtilTrySetAbsorbXFlag();

    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    }
    else
    {
        // All barrier sprite idsx are next to each other numerically, so doing spriteId - firstBarrierId offsets the id to start at 0
        // For some reason this offsets to the super missile barrier ids
        spriteId = gCurrentSprite.spriteId;
        spriteId -= PSPRITE_X_BARRIER_CORE_SUPER_1;

        // Get bit affected by the current barrier
        barrierBit = gPowerBombXBarrierCoresDestroyed >> spriteId;

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
    gCurrentSprite.frozenPaletteRowOffset = 1;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_SOLID;

    gCurrentSprite.pOam = sPowerBombBarrierOam_Idle;
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
        gCurrentSprite.hitboxLeft = -(BLOCK_SIZE - EIGHTH_BLOCK_SIZE);
        gCurrentSprite.hitboxRight = BLOCK_SIZE - EIGHTH_BLOCK_SIZE;
    }
    else
    {
        gCurrentSprite.hitboxTop = -BLOCK_SIZE;
        gCurrentSprite.hitboxBottom = BLOCK_SIZE;
        gCurrentSprite.hitboxLeft = -(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
        gCurrentSprite.hitboxRight = BLOCK_SIZE - QUARTER_BLOCK_SIZE;

        spriteId = SpriteSpawnSecondary(SSPRITE_X_BARRIER_CORE_POWER_BOMB_STEM, gCurrentSprite.roomSlot,
            gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);

        if (spriteId == UCHAR_MAX)
        {
            gCurrentSprite.status = 0;
            return;
        }

        XBarrierSetCollision(CAA_MAKE_SOLID_STOP_ENEMY);
    }
}

/**
 * @brief 42320 | 20 | Initializes a power bomb barrier to be idle
 * 
 */
void PowerBombBarrierIdleInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sPowerBombBarrierOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 42340 | 20 | Handles a power bomb X barrier being idle
 * 
 */
void PowerBombBarrierIdle(void)
{
    if (gCurrentSprite.currentAnimationFrame == 36 && gCurrentSprite.animationDurationCounter == 1)
        SoundPlayNotAlreadyPlaying(SOUND_POWER_BOMB_GERON_IDLE);
}

/**
 * @brief 42360 | 30 | Handles a power bomb X barrier dying
 * 
 */
void PowerBombBarrierDying(void)
{
    u8 spriteId;
    u16 barrierBit;

    // All barrier sprite ids are next to each other numerically, so doing spriteId - firstBarrierId offsets the id to start at 0
    // For some reason this offsets to the super missile barrier ids
    spriteId = gCurrentSprite.spriteId - PSPRITE_X_BARRIER_CORE_SUPER_1;

    // Get bit affected by the current barrier
    barrierBit = 1 << spriteId;

    gPowerBombXBarrierCoresDestroyed |= barrierBit;

    XBarrierSetCollision(CAA_REMOVE_SOLID);
}

/**
 * @brief 42390 | b0 | Power bomb barrier AI
 * 
 */
void PowerBombBarrier(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_GERON_HURT);

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_X_BARRIER_CORE_POWER_BOMB_STEM, gCurrentSprite.primarySpriteRamSlot);
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            PowerBombBarrierInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            PowerBombBarrierIdleInit();

        case SPRITE_POSE_IDLE:
            PowerBombBarrierIdle();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_X_BARRIER_CORE_POWER_BOMB_STEM, gCurrentSprite.primarySpriteRamSlot);
            PowerBombBarrierDying();
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            PowerBombBarrierInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
            break;
    }
}

/**
 * @brief 42440 | 13c | Power bomb barrier stem AI
 * 
 */
void PowerBombBarrierStem(void)
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
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2);
            gCurrentSprite.hitboxBottom = BLOCK_SIZE * 2;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

            gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
            gCurrentSprite.drawOrder = 6;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_SOLID;

            gCurrentSprite.pOam = sPowerBombBarrierStemOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            break;

        case SPRITE_POSE_IDLE:
            if (gSpriteData[ramSlot].health == 0)
            {
                gCurrentSprite.pose = 0x18;

                gCurrentSprite.pOam = sPowerBombBarrierStemOam_Destroyed;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;

                gCurrentSprite.health = 0;
                gCurrentSprite.ignoreSamusCollisionTimer = 1;
            }
            break;

        case 0x18:
            gCurrentSprite.ignoreSamusCollisionTimer = 1;

            if (SpriteUtilCheckEndCurrentSpriteAnim())
                gCurrentSprite.status = 0;
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
