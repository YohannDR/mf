#include "macros.h"
#include "globals.h"

#include "data/sprites/missile_barrier.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void XBarrierSetCollision(u8 caa) {
    u16 y = gCurrentSprite.yPosition - HALF_BLOCK_SIZE;
    u16 x = gCurrentSprite.xPosition;

    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_SIZE, x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y, x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y + BLOCK_SIZE, x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y + 2 * BLOCK_SIZE, x);
}

void XBarrierCoreInit(void) {
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
        // All barrier sprite ids are next to each other numerically, so doing spriteId - firstBarrierId offsets the id to start at 0
        spriteId = gCurrentSprite.spriteId;
        spriteId -= PSPRITE_X_BARRIER_CORE_NORMAL_1;

        // Get bit affected by the current barrier
        barrierBit = gNormalXBarrierCoresDestroyed >> spriteId;

        if (barrierBit & 1)
        {
            gCurrentSprite.status = 0;
            return;
        }

        gCurrentSprite.pose = SPRITE_POSE_IDLE;
    }

    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_SOLID;

    gCurrentSprite.pOam = sMissileBarrierOam_Idle;
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

    spriteId = SpriteSpawnSecondary(SSPRITE_X_BARRIER_STEM, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);

    if (spriteId == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    XBarrierSetCollision(CAA_MAKE_SOLID_STOP_ENEMY);
}

void XBarrierCoreIdleInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sMissileBarrierOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void XBarrierCoreIdle(void)
{
    return;
}

void XBarrierCoreDeath(void)
{
    u8 spriteId;
    u16 barrierBit;

    // All barrier sprite ids are next to each other numerically, so doing spriteId - firstBarrierId offsets the id to start at 0
    spriteId = gCurrentSprite.spriteId;
    spriteId -= PSPRITE_X_BARRIER_CORE_NORMAL_1;

    // Get bit affected by the current barrier
    barrierBit = 1 << spriteId;

    gNormalXBarrierCoresDestroyed |= barrierBit;

    XBarrierSetCollision(CAA_REMOVE_SOLID);
}

void XBarrierCore(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 0x4)
        SoundPlayNotAlreadyPlaying(SOUND_GERON_HURT);

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_X_BARRIER_STEM, gCurrentSprite.primarySpriteRamSlot);
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            XBarrierCoreInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            XBarrierCoreIdleInit();

        case SPRITE_POSE_IDLE:
            XBarrierCoreIdle();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_X_BARRIER_STEM, gCurrentSprite.primarySpriteRamSlot);
            XBarrierCoreDeath();
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            XBarrierCoreInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
    }
}

void XBarrierStem(void)
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

            gCurrentSprite.pOam = sMissileBarrierStemOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            break;

        case SPRITE_POSE_IDLE:
            if (gSpriteData[ramSlot].health == 0)
            {
                gCurrentSprite.pose = 0x18;

                gCurrentSprite.pOam = sMissileBarrierStemOam_Destroyed;
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
