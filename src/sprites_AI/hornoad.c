#include "sprites_AI/hornoad.h"
#include "sprite_util.h"
#include "macros.h"

#include "data/sprites/hornoad.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/event.h"
#include "constants/sprite.h"

#include "structs/sprite.h"

enum HornoadRangeAction {
    HRANGE_NONE,
    HRANGE_JUMP,
    HRANGE_TURN,
};

#define HORNOAD_HEAD_HITBOX (BLOCK_SIZE - QUARTER_BLOCK_SIZE)
#define HORNOAD_BACK_HITBOX (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2)

/**
 * @brief 1c8d4 | 54 | Checks if samus is in the spitting range of an hornoad
 * 
 * @return u8 bool, in range
 */
u8 HornoadCheckSamusInSpittingRange(void)
{
    u8 inRange;
    u32 nslr;

    inRange = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000)
        return FALSE;

    // Check on screen and alive
    if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN && gCurrentSprite.health != 0)
    {
        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2,
            BLOCK_SIZE * 5 - QUARTER_BLOCK_SIZE - PIXEL_SIZE);

        // Check in front
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        {
            if (nslr == NSLR_RIGHT)
                inRange = TRUE;
        }
        else
        {
            if (nslr == NSLR_LEFT)
                inRange = TRUE;
        }
    }

    return inRange;
}

/**
 * @brief 1c928 | c4 | Checks if samus is in the jumping range of an hornoad
 * 
 * @return u8 hornoad range action
 */
u8 HornoadCheckSamusInJumpingRange(void)
{
    u8 inRange;
    u32 nslr;
    u16 yRange;
    u16 xRange;

    inRange = HRANGE_NONE;
    
    if (gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000)
        return HRANGE_NONE;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        return HRANGE_NONE;

    yRange = BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE - PIXEL_SIZE;
    xRange = BLOCK_SIZE * 8 - QUARTER_BLOCK_SIZE + PIXEL_SIZE;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        xRange = BLOCK_SIZE * 11 - PIXEL_SIZE;
        yRange = BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE;

        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
    }

    if (gCurrentSprite.health != 0)
    {
        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(yRange, xRange);

        // Check in front or behind
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        {
            if (nslr == NSLR_RIGHT)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE * 2,
                    gCurrentSprite.xPosition + BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

                if (gPreviousCollisionCheck != COLLISION_SOLID)
                    inRange = HRANGE_JUMP;
            }
            else if (nslr == NSLR_LEFT)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE * 2,
                    gCurrentSprite.xPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2));

                if (gPreviousCollisionCheck != COLLISION_SOLID)
                    inRange = HRANGE_TURN;
            }
        }
        else
        {
            if (nslr == NSLR_LEFT)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE * 2,
                    gCurrentSprite.xPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2));

                if (gPreviousCollisionCheck != COLLISION_SOLID)
                    inRange = HRANGE_JUMP;
            }
            else if (nslr == NSLR_RIGHT)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE * 2,
                    gCurrentSprite.xPosition + BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

                if (gPreviousCollisionCheck != COLLISION_SOLID)
                    inRange = HRANGE_TURN;
            }
        }
    }

    return inRange;
}

/**
 * @brief 1c9ec | 30 | Sets the side hitboxes of an hornoad
 * 
 */
void HornoadSetSideHitboxes(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        gCurrentSprite.hitboxLeft = -HORNOAD_BACK_HITBOX;
        gCurrentSprite.hitboxRight = HORNOAD_HEAD_HITBOX;
    }
    else
    {
        gCurrentSprite.hitboxLeft = -HORNOAD_HEAD_HITBOX;
        gCurrentSprite.hitboxRight = HORNOAD_BACK_HITBOX;
    }
}

/**
 * @brief 1ca1c | 118 | Initializes an hornoad
 * 
 */
void HornoadInit(void)
{
    if (gCurrentSprite.spriteId == PSPRITE_QUARANTINE_BAY_HORNOAD)
    {
        if (!EventCheckOn_NavigationBeforeQuarantineBayHornoad())
        {
            gCurrentSprite.status = 0;
            return;
        }
    }

    SpriteUtilTrySetAbsorbXFlag();

    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.work2 = 0;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + QUARTER_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -BLOCK_SIZE;
    gCurrentSprite.hitboxBottom = 0;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
    {
        gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
        gCurrentSprite.drawOrder = 12;
        gCurrentSprite.bgPriority = 3;
        gCurrentSprite.samusCollision = SSC_NONE;

        if (gCurrentSprite.spritesetSlotAndProperties == 0x10)
        {
            gCurrentSprite.pOam = sHornoadOam_JumpingHidden;
            gCurrentSprite.work4 = 0;
            gCurrentSprite.pose = 0x18;
        }
        else
        {
            gCurrentSprite.pOam = sHornoadOam_IdleHidden;
            SpriteUtilChooseRandomXFlip();
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
        }
    }
    else
    {
        gCurrentSprite.frozenPaletteRowOffset = 1;

        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.bgPriority = 2;

        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;

        gCurrentSprite.pOam = sHornoadOam_Idle;

        SpriteUtilMakeSpriteFaceSamusXFlip();

        if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
        {
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
            gCurrentSprite.xParasiteTimer = 44;
        }
        else
        {
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
        }
    }

    HornoadSetSideHitboxes();
}

/**
 * @brief 1cb34 | 40 | Initializes an hornoad to be idle
 * 
 */
void HornoadIdleInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work2++;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        gCurrentSprite.pOam = sHornoadOam_IdleHidden;
    else
        gCurrentSprite.pOam = sHornoadOam_Idle;
}

/**
 * @brief 1cb74 | 74 | Initializes an hornoad to be jumping
 * 
 */
void HornoadJumpingInit(void)
{
    gCurrentSprite.pose = 0x18;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work4 = 0;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
    {
        gCurrentSprite.pOam = sHornoadOam_JumpingHidden;
    }
    else
    {
        gCurrentSprite.pOam = sHornoadOam_Jumping;
        SoundPlayNotAlreadyPlaying(0x14C);
    }

    // Set random jump height
    if (MOD_AND(gSpriteRandomNumber, 2))
        gCurrentSprite.work3 = TRUE;
    else
        gCurrentSprite.work3 = FALSE;
}

/**
 * @brief 1cbe8 | 38 | Initializes an hornoad to be landing
 * 
 */
void HornoadLandingInit(void)
{
    gCurrentSprite.pose = 0x1A;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        gCurrentSprite.pOam = sHornoadOam_LandingHidden;
    else
        gCurrentSprite.pOam = sHornoadOam_Landing;
}

/**
 * @brief 1cc20 | 88 | Initializes an hornoad to do an idle animation
 * 
 */
void HornoadIdleAnimationInit(void)
{
    gCurrentSprite.pose = 0x8;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gSpriteRandomNumber < 6)
    {
        if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
            gCurrentSprite.pOam = sHornoadOam_TiltingHeadHidden;
        else
            gCurrentSprite.pOam = sHornoadOam_TiltingHead;
    }
    else if (gSpriteRandomNumber < 12)
    {
        if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
            gCurrentSprite.pOam = sHornoadOam_MunchingHidden;
        else
            gCurrentSprite.pOam = sHornoadOam_Munching;
    }
    else
    {
        if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
            gCurrentSprite.pOam = sHornoadOam_MouthHangingOpenHidden;
        else
            gCurrentSprite.pOam = sHornoadOam_MouthHangingOpen;
    }
}

/**
 * @brief 1cca8 | 44 | Initializes an hornoad to be falling
 * 
 */
void HornoadFallingInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_FALLING;

    gCurrentSprite.work4 = 0;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        gCurrentSprite.pOam = sHornoadOam_FallingHidden;
    else
        gCurrentSprite.pOam = sHornoadOam_Falling;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 1ccec | 80 | To document
 * 
 */
void unk_1ccec(void)
{
    gCurrentSprite.work2 = 8;

    SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

        if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
        {
            HornoadFallingInit();
            return;
        }
    }

    gCurrentSprite.pose = 0x8;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        gCurrentSprite.pOam = sHornoadOam_2eb594;
    else
        gCurrentSprite.pOam = sHornoadOam_2eb82c;
}

/**
 * @brief 1cd6c | 40 | Initializes an hornoad to be turning around
 * 
 */
void HornoadTurningAroundInit(void)
{
    gCurrentSprite.pose = 0x4;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work2 = 0;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        gCurrentSprite.pOam = sHornoadOam_TurningAroundHidden;
    else
        gCurrentSprite.pOam = sHornoadOam_TurningAround;
}

/**
 * @brief 1cdac | 44 | Initializes an hornoad to be spitting
 * 
 */
void HornoadSpittingInit(void)
{
    gCurrentSprite.pose = 0x2A;

    gCurrentSprite.pOam = sHornoadOam_Spitting;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (MOD_AND(gSpriteRandomNumber, 2))
        gCurrentSprite.work3 = 1;
    else
        gCurrentSprite.work3 = 2;
}

/**
 * @brief 1cdf0 | 50 | Handles an hornoad being idle
 * 
 */
void HornoadIdle(void)
{
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

    if (gPreviousCollisionCheck == COLLISION_AIR)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            HornoadFallingInit();
            return;
        }
    }

    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
        HornoadJumpingInit();
}

/**
 * @brief 1ce40 | 238 | Handles an hornoad jumping
 * 
 */
void HornoadJumping(void)
{
    u8 var_0;
    s16 movement;
    u32 blockTop;

    var_0 = FALSE;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        movement = sHornoadJumpVelocityLow[gCurrentSprite.work4 / 4];
    else if (gCurrentSprite.work3)
        movement = sHornoadJumpVelocityLow[gCurrentSprite.work4 / 4];
    else
        movement = sHornoadJumpVelocityHigh[gCurrentSprite.work4 / 4];

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight + PIXEL_SIZE);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            var_0++;
            gCurrentSprite.xPosition -= PIXEL_SIZE;
        }
        else if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        {
            if (movement > 0)
                gCurrentSprite.xPosition += ONE_SUB_PIXEL * 1;
            else if (MOD_AND(gSpriteRandomNumber, 2))
                gCurrentSprite.xPosition += ONE_SUB_PIXEL * 2;
            else    
                gCurrentSprite.xPosition += ONE_SUB_PIXEL * 1;
        }
        else
        {
            if (movement > 0)
                gCurrentSprite.xPosition += ONE_SUB_PIXEL * 2;
            else    
                gCurrentSprite.xPosition += ONE_SUB_PIXEL * 3;
        }
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft - PIXEL_SIZE);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            var_0++;
            gCurrentSprite.xPosition += PIXEL_SIZE;
        }
        else if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        {
            if (movement > 0)
                gCurrentSprite.xPosition -= ONE_SUB_PIXEL * 1;
            else if (MOD_AND(gSpriteRandomNumber, 2))
                gCurrentSprite.xPosition -= ONE_SUB_PIXEL * 2;
            else    
                gCurrentSprite.xPosition -= ONE_SUB_PIXEL * 1;
        }
        else
        {
            if (movement > 0)
                gCurrentSprite.xPosition -= ONE_SUB_PIXEL * 2;
            else    
                gCurrentSprite.xPosition -= ONE_SUB_PIXEL * 3;
        }
    }

    gCurrentSprite.yPosition += movement;

    if (gCurrentSprite.work4 < ARRAY_SIZE(sHornoadJumpVelocityHigh) * 4 - 1)
        gCurrentSprite.work4++;

    if (movement > 0)
    {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition,
            gCurrentSprite.xPosition);

        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.yPosition = blockTop;
            HornoadLandingInit();
            return;
        }

        if (var_0)
            return;

        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            var_0++;
        }
        else
        {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                var_0++;
            }
        }

        if (var_0)
        {
            gCurrentSprite.yPosition = blockTop;
            HornoadLandingInit();
            return;
        }
    }
    else
    {
        var_0 = FALSE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            var_0++;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                var_0++;
            }
        }

        if (!var_0)
            return;

        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            gCurrentSprite.xPosition -= PIXEL_SIZE;
        else
            gCurrentSprite.xPosition += PIXEL_SIZE;

        HornoadFallingInit();
    }
}

/**
 * @brief 1d078 | a0 | Handles an hornoad landing
 * 
 */
void HornoadLanding(void)
{
    u8 rangeAction;
    u32 rng;

    if (!SpriteUtilCheckEndOfCurrentSpriteAnimation())
        return;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
    {
        rng = MOD_AND(gSpriteRandomNumber, 2);
        if (gCurrentSprite.work2 > rng)
        {
            gCurrentSprite.pose = 0x1C;

            gCurrentSprite.pOam = sHornoadOam_2eb844;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;

            gCurrentSprite.work1 = 0;
        }
        else
        {
            HornoadIdleInit();
        }

        return;
    }

    if (HornoadCheckSamusInSpittingRange())
    {
        HornoadSpittingInit();
        return;
    }

    rangeAction = HornoadCheckSamusInJumpingRange();

    if (rangeAction == HRANGE_JUMP)
    {
        HornoadJumpingInit();
        return;
    }

    if (rangeAction == HRANGE_TURN)
    {
        HornoadTurningAroundInit();
        return;
    }

    if (gCurrentSprite.work2 > 2)
        HornoadIdleAnimationInit();
    else
        HornoadIdleInit();
}

/**
 * @brief 1d118 | a4 | Handles an hornoad falling
 * 
 */
void HornoadFalling(void)
{
    u32 blockTop;
    u8 landing;
    s16 movement;
    u8 offset;

    landing = FALSE;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        landing++;
    }
    else
    {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
    
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            landing++;
        }
        else
        {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                landing++;
            }
        }
    }

    if (landing)
    {
        gCurrentSprite.yPosition = blockTop;
        HornoadLandingInit();
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
 * @brief 1d1bc | 7c | Handles an hornoad doing an idle animation
 * 
 */
void HornoadIdleAnimation(void)
{
    u8 rangeAction;

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

    if (gPreviousCollisionCheck == COLLISION_AIR)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            HornoadFallingInit();
            return;
        }
    }

    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
    {
        rangeAction = HornoadCheckSamusInJumpingRange();

        if (rangeAction == HRANGE_JUMP)
        {
            HornoadIdleInit();
            return;
        }

        if (rangeAction == HRANGE_TURN)
        {
            HornoadTurningAroundInit();
            return;
        }

        if (gCurrentSprite.work2 > 2)
            HornoadTurningAroundInit();
        else
            HornoadIdleInit();
    }
}

/**
 * @brief 1d238 | 74 | Handles an hornoad waiting for an X
 * 
 */
void HornoadWaitingForX(void)
{
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

    if (gPreviousCollisionCheck == COLLISION_AIR)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            HornoadFallingInit();
            return;
        }
    }

    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
    {
        gCurrentSprite.work1++;

        if (MOD_AND(gSpriteRandomNumber, 2) && gCurrentSprite.work1 > 3)
            HornoadIdleAnimationInit();
    }
}

/**
 * @brief 1d2ac | 60 | Handles an hornoad turning around
 * 
 */
void HornoadTurningAround(void)
{
    if (gCurrentSprite.currentAnimationFrame != 0)
        gCurrentSprite.yPosition -= PIXEL_SIZE;

    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
    {
        gCurrentSprite.status ^= SPRITE_STATUS_X_FLIP;

        gCurrentSprite.pose = 0x5;

        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        HornoadSetSideHitboxes();

        if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
            gCurrentSprite.pOam = sHornoadOam_TurninSecondPartHidden;
        else
            gCurrentSprite.pOam = sHornoadOam_TurninSecondPart;
    }
}

/**
 * @brief 1d30c | 7c | Handles the second part of an hornoad turning around
 * 
 */
void HornoadTurningAroundSecondPart(void)
{
    if (gCurrentSprite.currentAnimationFrame != 0)
        gCurrentSprite.yPosition += PIXEL_SIZE;

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight + PIXEL_SIZE);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.xPosition -= PIXEL_SIZE;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft - PIXEL_SIZE);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.xPosition += PIXEL_SIZE;
    }

    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
        HornoadIdleAnimationInit();
}

/**
 * @brief 1d388 | a0 | Handles an hornoad spitting
 * 
 */
void HornoadSpitting(void)
{
    if (gCurrentSprite.currentAnimationFrame == 5 && gCurrentSprite.animationDurationCounter == 1)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        {
            SpriteSpawnSecondary(SSPRITE_HORNOAD_SPIT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                gCurrentSprite.xPosition + HALF_BLOCK_SIZE, SPRITE_STATUS_X_FLIP);
        }
        else
        {
            SpriteSpawnSecondary(SSPRITE_HORNOAD_SPIT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                gCurrentSprite.xPosition - HALF_BLOCK_SIZE, 0);
        }

        SoundPlayNotAlreadyPlaying(0x14B);
    }

    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
    {
        gCurrentSprite.work3--;

        if (gCurrentSprite.work3 == 0)
            HornoadIdleInit();
    }
}

/**
 * @brief 1d428 | 74 | Initializes an hornoad spit
 * 
 */
void HornoadSpitInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.pOam = sHornoadSpitOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
}

/**
 * @brief 1d49c | 8c | Handles an hornoad spit moving
 * 
 */
void HornoadSpitMoving(void)
{
    u32 blockTop;
    u8 offset;
    s16 movement;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.pose = 0x37;
        return;
    }

    offset = gCurrentSprite.work4;
    movement = sHornoadSpitYMovement[offset];

    if (movement == SHORT_MAX)
    {
        movement = sHornoadSpitYMovement[offset - 1];
        gCurrentSprite.yPosition += movement;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        gCurrentSprite.xPosition += 0xA;
    else
        gCurrentSprite.xPosition -= 0xA;
}

/**
 * @brief 1d528 | 24 | Initializes an hornoad spit to be exploding
 * 
 */
void HornoadSpitExplodingInit(void)
{
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.pOam = sHornoadSpitOam_Exploding;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 1d54c | 24 | Handles an hornoad spit exploding
 * 
 */
void HornoadSpitExploding(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
        gCurrentSprite.status = 0;
}

/**
 * @brief 1d570 | 6c | Initializes an hornoad spawner
 * 
 */
void HornoadSpwanerInit(void)
{
    gCurrentSprite.standingOnSprite = FALSE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE - QUARTER_BLOCK_SIZE / 2);
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
    gCurrentSprite.hitboxRight = BLOCK_SIZE - QUARTER_BLOCK_SIZE;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawOrder = 13;
    gCurrentSprite.bgPriority = 3;

    if (MOD_AND(gSpriteRandomNumber, 2))
        gCurrentSprite.work2 = TRUE;
    else
        gCurrentSprite.work2 = FALSE;
}

/**
 * @brief 1d5dc | 30 | Initializes an hornoad spawner to be idle
 * 
 */
void HornoadSpwanerIdleInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sHornoadSpawnerOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 80 + gSpriteRandomNumber * 4;
}

/**
 * @brief 1d60c | 8c | Handles an hornoad spawner being idle
 * 
 */
void HornoadSpwanerIdle(void)
{
    u8 i;
    u8 count;

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        return;
    }

    count = 0;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (gSpriteData[i].roomSlot == gCurrentSprite.roomSlot && gSpriteData[i].spriteId == PSPRITE_HORNOAD)
            count++;
    }

    if (count < 2)
    {
        gCurrentSprite.pose = 0x2A;

        gCurrentSprite.pOam = sHornoadSpawnerOam_BeforeSpawning;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.work1 = 48;
    }
    else
    {
        gCurrentSprite.work1 = 20 + gSpriteRandomNumber * 4;
    }
}

/**
 * @brief 1d698 | 9c | Handles an hornoad spwaner being idle before spawning an hornoad
 * 
 */
void HornoadSpwanerDelayBeforeSpawning(void)
{
    u8 i;
    u8 count;

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        return;
    }

    count = 0;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            count++;
    }

    if (count != 0)
    {
        if (gCurrentSprite.work2)
            gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
        else
            gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;

        gCurrentSprite.work2 ^= TRUE;
        gCurrentSprite.pose = 0x2C;

        gCurrentSprite.pOam = sHornoadSpawnerOam_Spawning;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        return;
    }

    HornoadSpwanerIdleInit();
}

/**
 * @brief 1d734 | 40 | Handles an hornoad spwaner spawning an hornoad
 * 
 */
void HornoadSpwanerSpawnHornoad(void)
{
    if (!SpriteUtilCheckEndOfCurrentSpriteAnimation())
        return;

    SpriteSpawnPrimary(PSPRITE_HORNOAD, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, 0x10,
        gCurrentSprite.yPosition - (BLOCK_SIZE - PIXEL_SIZE), gCurrentSprite.xPosition, gCurrentSprite.status & SPRITE_STATUS_X_FLIP);

    HornoadSpwanerIdleInit();
}

/**
 * @brief 1d774 | 264 | Hornoad AI
 * 
 */
void Hornoad(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 0x4)
        SoundPlayNotAlreadyPlaying(0x14A);

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        return;
    }

    if (gCurrentSprite.pose < SPRITE_POSE_TURNING_INTO_X && SPRITE_HAS_ISFT(gCurrentSprite) && gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            HornoadInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            HornoadIdleInit();

        case SPRITE_POSE_IDLE:
            HornoadIdle();
            break;

        case 0x18:
            HornoadJumping();
            break;

        case 0x1A:
            HornoadLanding();
            break;

        case 0x1C:
            HornoadWaitingForX();
            break;

        case 0x8:
            HornoadIdleAnimation();
            break;

        case 0x4:
            HornoadTurningAround();
            break;

        case 0x5:
            HornoadTurningAroundSecondPart();
            break;

        case 0x2A:
            HornoadSpitting();
            break;

        case SPRITE_POSE_FALLING:
            HornoadFalling();
            break;

        case 0x37:
            unk_1ccec();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            HornoadInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            if (gCurrentSprite.spriteId == PSPRITE_QUARANTINE_BAY_HORNOAD)
                EventCheckAdvance(EVENT_QUARANTINE_BAY_HORNOAD_DEAD);

            XParasiteInit();
            gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
    }
}

/**
 * @brief 1d9d8 | 3c | Hornoad spit AI
 * 
 */
void HornoadSpit(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            HornoadSpitInit();
        
        case 0x2:
            HornoadSpitMoving();
            break;

        case 0x38:
            HornoadSpitExploding();
            break;

        default:
            HornoadSpitExplodingInit();
    }
}

/**
 * @brief 1da14 | f8 | Hornoad spawner AI
 * 
 */
void HornoadSpawner(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            HornoadSpwanerInit();

        case 0x1:
            HornoadSpwanerIdleInit();

        case 0x2:
            HornoadSpwanerIdle();
            break;

        case 0x2A:
            HornoadSpwanerDelayBeforeSpawning();
            break;

        case 0x2C:
            HornoadSpwanerSpawnHornoad();
    }
}
