#include "sprites_AI/halzyn.h"
#include "sprite_util.h"
#include "sprite.h"
#include "macros.h"
#include "sprite_debris.h"

#include "data/sprite_data.h"
#include "data/sprites/halzyn.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"

#include "structs/samus.h"
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

/**
 * @brief 1dce0 | 2c | Initializes an halzyn to be swinging
 * 
 */
void HalzynSwingingInit(void)
{
    gCurrentSprite.pOam = sHalzynOam_Swinging;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

void HalzynSwinging(void)
{
    // https://decomp.me/scratch/uefFZ

    u8 bounce;
    s32 xMovement;
    s32 yMovement;

    bounce = FALSE;

    if (gCurrentSprite.work4 == 0)
    {
        xMovement = sHalzynSwingingXVelocity[gCurrentSprite.work3 / 4];
        yMovement = sHalzynSwingingYVelocity[gCurrentSprite.work3 / 4];

        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition + (BLOCK_SIZE + HALF_BLOCK_SIZE));

            if (gPreviousCollisionCheck != COLLISION_SOLID)
            {
                if (gCurrentSprite.xPosition <= gCurrentSprite.unk_8 + BLOCK_SIZE * 4)
                {
                    gCurrentSprite.xPosition += xMovement;

                    if (gCurrentSprite.work3 < ARRAY_SIZE(sHalzynSwingingXVelocity) * 4 - 1)
                        gCurrentSprite.work3++;
                    else
                        bounce = TRUE;
                }
                else
                    bounce = TRUE;
            }
            else
                bounce = TRUE;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE));

            if (gPreviousCollisionCheck != COLLISION_SOLID)
            {
                if (gCurrentSprite.xPosition >= gCurrentSprite.unk_8)
                {
                    gCurrentSprite.xPosition -= xMovement;

                    if (gCurrentSprite.work3 < ARRAY_SIZE(sHalzynSwingingXVelocity) * 4 - 1)
                        gCurrentSprite.work3++;
                    else
                        bounce = TRUE;
                }
                else
                    bounce = TRUE;
            }
            else
                bounce = TRUE;
        }

        gCurrentSprite.yPosition += yMovement;

        if (bounce)
        {
            gCurrentSprite.work3 = 0;

            gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;

            if (gCurrentSprite.xParasiteTimer < gCurrentSprite.yPosition)
                gCurrentSprite.work4 = 1;
            else if (gCurrentSprite.xParasiteTimer > gCurrentSprite.yPosition)
                gCurrentSprite.work4 = 2;
            else
                gCurrentSprite.work4 = 0;
        }
    }
    else if (gCurrentSprite.work4 == 1)
    {
        gCurrentSprite.yPosition -= ONE_SUB_PIXEL;

        if (gCurrentSprite.yPosition == gCurrentSprite.xParasiteTimer)
            gCurrentSprite.work4 = 0;
    }
    else if (gCurrentSprite.work4 == 2)
    {
        gCurrentSprite.yPosition += ONE_SUB_PIXEL;

        if (gCurrentSprite.yPosition == gCurrentSprite.xParasiteTimer)
            gCurrentSprite.work4 = 0;
    }

    if (gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000)
        return;

    if (gSamusData.yPosition > gCurrentSprite.yPosition + (BLOCK_SIZE * 3 + QUARTER_BLOCK_SIZE / 2))
    {
        if (gSamusData.xPosition > gCurrentSprite.xPosition - BLOCK_SIZE && gSamusData.xPosition < gCurrentSprite.xPosition + BLOCK_SIZE)
        {
            gCurrentSprite.pose = 0x29;
        }
    }
}

/**
 * @brief 1de74 | 34 | Initializes an halzyn to be lunging
 * 
 */
void HalzynLungingInit(void)
{
    gCurrentSprite.pose = 0x2A;

    gCurrentSprite.pOam = sHalzynOam_Lunging;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work4 = 0;

    SoundPlay(0x151);
}

/**
 * @brief 1dea8 | c8 | Handles an halzyn lunging
 * 
 */
void HalzynLunging(void)
{
    u32 blockTop;
    u16 yPosition;
    u16 xPosition;
    u8 offset;
    s16 movement;

    if (gCurrentSprite.currentAnimationFrame != FRAME_DATA_LAST_ANIM_FRAME(sHalzynOam_Lunging))
        return;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.pose = 0x2B;

        yPosition = gCurrentSprite.yPosition;
        xPosition = gCurrentSprite.xPosition;

        SpriteDebrisInit(0, DEBRIS_TYPE_FALLING | DEBRIS_TYPE_HOPPING_SLOW_LEFT, yPosition - PIXEL_SIZE, xPosition);
        SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT, yPosition - (PIXEL_SIZE + PIXEL_SIZE / 2), xPosition - (QUARTER_BLOCK_SIZE - ONE_SUB_PIXEL));
        SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_RIGHT, yPosition - PIXEL_SIZE / 2, xPosition + PIXEL_SIZE * 2);
        SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_RIGHT, yPosition - PIXEL_SIZE * 2, xPosition + (QUARTER_BLOCK_SIZE + PIXEL_SIZE / 2));
        SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition - PIXEL_SIZE * 2, xPosition - (PIXEL_SIZE * 2 - ONE_SUB_PIXEL));

        SoundPlay(0x152);
        return;
    }

    offset = gCurrentSprite.work4;
    movement = sHalzynLungingVelocity[offset];

    if (movement == SHORT_MAX)
    {
        movement = sHalzynLungingVelocity[offset - 1];
        gCurrentSprite.yPosition += movement;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }
}

/**
 * @brief 1df70 | 30 | Initializes an halzyn to be landing
 * 
 */
void HalzynLandingInit(void)
{
    gCurrentSprite.pose = 0x2C;

    gCurrentSprite.pOam = sHalzynOam_Landing;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 30;
    gCurrentSprite.work4 = 0;
}

/**
 * @brief 1dfa0 | 24 | Handles an halzyn landing
 * 
 */
void HalzynLanding(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x2D;
}

/**
 * @brief 1dfc4 | 20 | Initializes an halzyn to fly up
 * 
 */
void HalzynFlyingUpInit(void)
{
    gCurrentSprite.pose = 0x2E;

    gCurrentSprite.pOam = sHalzynOam_FlyingUp;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 1dfe4 | 60 | Handle an halzyn flying up
 * 
 */
void HalzynFlyingUp(void)
{
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE * 2, gCurrentSprite.xPosition);

    if (gPreviousCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    }
    else if (gCurrentSprite.xParasiteTimer < gCurrentSprite.yPosition)
    {
        gCurrentSprite.yPosition -= PIXEL_SIZE / 2;
    }
    else if (SpriteUtilCheckNearEndOfCurrentSpriteAnimation())
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    }

    if (gCurrentSprite.currentAnimationFrame == 3 && gCurrentSprite.animationDurationCounter == 2)
        SoundPlay(0x153);
}

void HalzynWingIdleInit(void)
{

}

void HalzynWingFlappingInit(void)
{

}

/**
 * @brief 1e0d4 | 9c | Initializes an halzyn wing sprite
 * 
 */
void HalzynWingInit(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].status & SPRITE_STATUS_UNKNOWN_2000)
        gCurrentSprite.status |= SPRITE_STATUS_UNKNOWN_2000;

    if (gSpriteData[ramSlot].status & SPRITE_STATUS_ENABLE_MOSAIC)
        gCurrentSprite.status |= SPRITE_STATUS_ENABLE_MOSAIC;

    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.drawOrder = 3;

    HalzynWingIdleInit();
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
