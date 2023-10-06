#include "sprites_AI/halzyn.h"
#include "sprite_util.h"
#include "sprite.h"
#include "macros.h"

#include "data/sprite_data.h"
#include "data/sprites/halzyn.h"

#include "constants/sprite.h"

#include "structs/sprite.h"

/**
 * @brief 1db0c | 138 | Initializes an halzyn sprite
 * 
 */
void HalzynInit(void)
{
    u8 ramSlot;

    SpriteUtilTrySetAbsorbXFlag();

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(QUARTER_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.pOam = sHalzynOam_Swinging;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
    {
        if (!(gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000))
        {
            gCurrentSprite.status = 0;
            return;
        }

        gCurrentSprite.work5 = 0x2;

        gCurrentSprite.hitboxTop = -BLOCK_SIZE;
        gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
        gCurrentSprite.hitboxLeft = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
        gCurrentSprite.hitboxRight = (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
    }
    else
    {
        gCurrentSprite.hitboxTop = -(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
        gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;
    }

    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.work1 = 44;
        return;
    }

    gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;

    gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
    gCurrentSprite.unk_8 = gCurrentSprite.xPosition;

    gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;

    ramSlot = SpriteSpawnSecondary(SSPRITE_HALZYN_WING, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_HALZYN_WING, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);

    if (ramSlot == UCHAR_MAX)
        gCurrentSprite.status = 0;
}

void HalzynSpawningFromX(void)
{

}

/**
 * @brief 1dc9c | 44 | Handles an halzyn turning into an X
 * 
 */
void HalzynTurningIntoX(void)
{
    gCurrentSprite.yPosition -= (QUARTER_BLOCK_SIZE + PIXEL_SIZE);
    gCurrentSprite.xPosition -= (QUARTER_BLOCK_SIZE + PIXEL_SIZE);

    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - (QUARTER_BLOCK_SIZE + PIXEL_SIZE),
        gCurrentSprite.xPosition + (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE), SPRITE_STATUS_X_FLIP);
}

void HalzynSwingingInit(void)
{

}

void HalzynSwinging(void)
{

}

void HalzynLungingInit(void)
{

}

void HalzynLunging(void)
{

}

void HalzynLandingInit(void)
{

}

void HalzynLanding(void)
{

}

void HalzynFlyingUpInit(void)
{

}

void HalzynFlyingUp(void)
{

}

void HalzynWingIdleInit(void)
{

}

void HalzynWingFlappingInit(void)
{

}

void HalzynWingInit(void)
{

}

void HalzynWingIdle(void)
{

}

void HalzynWingFalling(void)
{

}

/**
 * @brief 1e400 | 228 | Halzyn AI
 * 
 */
void Halzyn(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 0x4)
        SoundPlayNotAlreadyPlaying(0x150);

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_HALZYN_WING, gCurrentSprite.primarySpriteRamSlot);
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            HalzynInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            HalzynSwingingInit();

        case SPRITE_POSE_IDLE:
            HalzynSwinging();
            break;

        case 0x29:
            HalzynLungingInit();

        case 0x2A:
            HalzynLunging();
            break;

        case 0x2B:
            HalzynLandingInit();

        case 0x2C:
            HalzynLanding();
            break;

        case 0x2D:
            HalzynFlyingUpInit();

        case 0x2E:
            HalzynFlyingUp();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_HALZYN_WING, gCurrentSprite.primarySpriteRamSlot);
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            HalzynInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            HalzynSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            HalzynTurningIntoX();
            XParaisteInit();
    }
}

/**
 * @brief 1e628 | 88 | Halzyn wing AI
 * 
 */
void HalzynWing(void)
{
    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdatePrimarySpriteFreezeTimer();
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case 0x38:
            HalzynWingFalling();
            break;

        case 0x3A:
            break;

        case SPRITE_POSE_UNITIALIZED:
            HalzynWingInit();

        default:
            HalzynWingIlde();
    }

    if (gCurrentSprite.health == 0 && gCurrentSprite.status & SPRITE_STATUS_EXISTS)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        {
            unk_12160(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);
        }
        else
        {
            unk_12160(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition - HALF_BLOCK_SIZE);
        }
    }
}
