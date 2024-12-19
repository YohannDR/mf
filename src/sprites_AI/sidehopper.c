#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/sidehopper.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

#define SIDEHOPPER_POSE_JUMP_WARNING_INIT 1
#define SIDEHOPPER_POSE_JUMP_WARNING 2
#define SIDEHOPPER_POSE_IDLE 8
#define SIDEHOPPER_POSE_FALLING 0x16
#define SIDEHOPPER_POSE_JUMPING 0x18
#define SIDEHOPPER_POSE_LANDING 0x1a

/**
 * @brief Checks if samus is near the sidehopper on the sides in a 5 block range
 * 
 * @return u8 1 if near, 0 otherwise
 */
u8 SidehopperCheckSamusInRange(void)
{
    u8 result;

    result = FALSE;
    if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 5, BLOCK_SIZE * 5) != NSLR_OUT_OF_RANGE)
    {
        result = TRUE;
        SpriteUtilMakeSpriteFaceSamusDirection();
    }

    return result;
}

/**
 * @brief Initializes a sidehopper sprite
 * 
 */
void SidehopperInit(void)
{
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN))
    {
        gCurrentSprite.status = 0;
        return;
    }

    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + PIXEL_SIZE), gCurrentSprite.xPosition);

        if (gPreviousCollisionCheck & 0xF0)
        {
            gCurrentSprite.status |= SS_Y_FLIP;
            gCurrentSprite.yPosition -= BLOCK_SIZE;
        }

        gCurrentSprite.work1 = 0x0;
        gCurrentSprite.pose = SIDEHOPPER_POSE_IDLE;
    }

    if (gCurrentSprite.status & SS_Y_FLIP)
    {
        gCurrentSprite.drawDistanceTop = 0x18;
        gCurrentSprite.drawDistanceBottom = 0x28;
        gCurrentSprite.hitboxBottom = 0x58;
        gCurrentSprite.hitboxTop = -0x20;
    }
    else
    {
        gCurrentSprite.drawDistanceTop = 0x28;
        gCurrentSprite.drawDistanceBottom = 0x18;
        gCurrentSprite.hitboxTop = -0x58;
        gCurrentSprite.hitboxBottom = 0x20;
    }

    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxLeft = -0x40;
    gCurrentSprite.hitboxRight = 0x40;

    gCurrentSprite.pOam = sSidehopperOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    SpriteUtilChooseRandomXDirection();
}

/**
 * @brief Initializes a sidehopper to do the jump warning
 * 
 */
void SidehopperPreparingtoJumpInit(void)
{
    gCurrentSprite.pose = SIDEHOPPER_POSE_JUMP_WARNING;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sSidehopperOam_JumpWarning;
}

/**
 * @brief Initializes a sidehopper to jump
 * 
 */
void SidehopperJumpingInit(void)
{
    gCurrentSprite.pose = SIDEHOPPER_POSE_JUMPING;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pOam = sSidehopperOam_Jumping;

    if (gSpriteRandomNumber & 1)
        gCurrentSprite.work3 = TRUE;
    else
        gCurrentSprite.work3 = FALSE;

    SoundPlayNotAlreadyPlaying(SOUND_SIDEHOPPER_JUMPING);
}

/**
 * @brief Initializes a sidehopper to land
 * 
 */
void SidehopperLandingInit(void)
{
    gCurrentSprite.pose = SIDEHOPPER_POSE_LANDING;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sSidehopperOam_Landing;

    SoundPlayNotAlreadyPlaying(SOUND_SIDEHOPPER_LANDING);
}

/**
 * @brief Initializes a sidehopper to be idle
 * 
 */
void SidehopperIdleInit(void)
{
    if (SidehopperCheckSamusInRange())
        SidehopperPreparingtoJumpInit();
    else
    {
        gCurrentSprite.pose = SIDEHOPPER_POSE_IDLE;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 0x0;

        gCurrentSprite.work2 = MOD_AND(gSpriteRandomNumber, 4);

        if (gSpriteRandomNumber >= 8)
        {
            gCurrentSprite.pOam = sSidehopperOam_ShakingHead;
            SoundPlayNotAlreadyPlaying(SOUND_SIDEHOPPER_SHAKING_HEAD);
        }
        else
            gCurrentSprite.pOam = sSidehopperOam_Idle;
    }
}

/**
 * @brief Initializes a sidehopper to be falling
 * 
 */
void SidehopperFallingInit(void)
{
    gCurrentSprite.pose = SIDEHOPPER_POSE_FALLING;
    gCurrentSprite.animationDurationCounter = 0x0;
    gCurrentSprite.currentAnimationFrame = 0x0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pOam = sSidehopperOam_Jumping;
}

/**
 * @brief Handles a sidehopper doing the jump warning when on the ground
 * 
 */
void SidehopperPreparingToJumpGround(void)
{
    if (gCurrentSprite.status & SS_HIDDEN)
        return;

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
    if (gPreviousCollisionCheck == COLLISION_AIR)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            SidehopperFallingInit();
            return;
        }
    }
    
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        SidehopperJumpingInit();
}

/**
 * @brief Handles a sidehopper doing the jump warning when on the ceiling
 * 
 */
void SidehopperPreparingToJumpCeiling(void)
{
    if (gCurrentSprite.status & SS_HIDDEN)
        return;

    if (SpriteUtilCheckEndCurrentSpriteAnim())
        SidehopperJumpingInit();
}

/**
 * @brief Handles a sidehopper jumping when on the ground
 * 
 */
void SidehopperJumpingGround(void)
{
    u8 colliding;
    u8 offset;
    s16 movement;
    u32 blockTop;

    colliding = FALSE;

    if (gCurrentSprite.work3)
        movement = sSidehopperLittleHopVelocity[gCurrentSprite.work4 / 4];
    else
        movement = sSidehopperBigHopVelocity[gCurrentSprite.work4 / 4];

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight + 0x4);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            colliding++;
            gCurrentSprite.xPosition -= 0x6;
        }
        else if (movement > 0x0)
            gCurrentSprite.xPosition += 0x4;
        else
            gCurrentSprite.xPosition += 0x5;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft - 0x4);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            colliding++;
            gCurrentSprite.xPosition += 0x6;
        }
        else if (movement > 0x0)
            gCurrentSprite.xPosition -= 0x4;
        else
            gCurrentSprite.xPosition -= 0x5;
    }

    gCurrentSprite.yPosition += movement;
    if (gCurrentSprite.work4 < ARRAY_SIZE(sSidehopperLittleHopVelocity) * 4 - 1)
        gCurrentSprite.work4++;

    if (movement > 0x0)
    {
        if (colliding)
            gCurrentSprite.status ^= SS_FACING_RIGHT;

        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.yPosition = blockTop;
            SidehopperLandingInit();
            return;
        }

        if (!colliding)
        {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                colliding++;
            else
            {
                blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                    colliding++;
            }
    
            if (colliding)
            {
                gCurrentSprite.yPosition = blockTop;
                SidehopperLandingInit();
            }
        }
    }
    else
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                colliding++;
                gCurrentSprite.xPosition -= 0x6;
                SidehopperFallingInit();
            }
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                colliding++;
                gCurrentSprite.xPosition += 0x6;
                SidehopperFallingInit();
            }
        }

        if (colliding)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
    }
}

/**
 * @brief Handles a sidehopper jumping when on the ceiling
 * 
 */
void SidehopperJumpingCeiling(void)
{
    u8 colliding;
    u8 offset;
    s16 movement;
    u32 blockTop;

    colliding = FALSE;

    if (gCurrentSprite.work3)
        movement = sSidehopperLittleHopVelocity[gCurrentSprite.work4 / 4];
    else
        movement = sSidehopperBigHopVelocity[gCurrentSprite.work4 / 4];

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight + 0x4);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            colliding++;
            gCurrentSprite.xPosition -= 0x6;
        }
        else if (movement > 0x0)
            gCurrentSprite.xPosition += 0x4;
        else
            gCurrentSprite.xPosition += 0x5;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft - 0x4);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            colliding++;
            gCurrentSprite.xPosition += 0x6;
        }
        else if (movement > 0x0)
            gCurrentSprite.xPosition -= 0x4;
        else
            gCurrentSprite.xPosition -= 0x5;
    }

    gCurrentSprite.yPosition -= movement;
    if (gCurrentSprite.work4 < ARRAY_SIZE(sSidehopperLittleHopVelocity) * 4 - 1)
        gCurrentSprite.work4++;

    if (movement < 0x0)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                colliding++;
                gCurrentSprite.xPosition -= 0x6;
                SidehopperFallingInit();
            }
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                colliding++;
                gCurrentSprite.xPosition += 0x6;
                SidehopperFallingInit();
            }
        }

        if (colliding)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
    }
    else
    {
        if (colliding)
            gCurrentSprite.status ^= SS_FACING_RIGHT;

        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck & 0xF)
        {
            gCurrentSprite.yPosition = blockTop + BLOCK_SIZE;
            SidehopperLandingInit();
            return;
        }

        if (!colliding)
        {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
            if (gPreviousVerticalCollisionCheck & 0xF)
                colliding++;
            else
            {
                blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                if (gPreviousVerticalCollisionCheck & 0xF)
                    colliding++;
            }
    
            if (colliding)
            {
                gCurrentSprite.yPosition = blockTop + BLOCK_SIZE;
                SidehopperLandingInit();
            }
        }
    }
}

/**
 * @brief Checks if the landing animation as ended
 * 
 */
void SidehopperCheckLandingAnimEnded(void)
{
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        SidehopperIdleInit();
}

/**
 * @brief Handles a sidehopper falling from the ground
 * 
 */
void SidehopperFallingGround(void)
{
    u8 colliding;
    u32 blockTop;
    u8 offset;
    s16 movement;

    colliding = FALSE;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        colliding++;
    else
    {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            colliding++;
        else
        {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                colliding++;
        }
    }

    if (colliding)
    {
        gCurrentSprite.yPosition = blockTop;
        SidehopperLandingInit();
    }
    else
    {
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
}

/**
 * @brief Handles a sidehopper falling from the ceiling
 * 
 */
void SidehopperFallingCeiling(void)
{
    u8 colliding;
    u32 blockTop;
    u8 offset;
    s16 movement;

    colliding = FALSE;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        colliding++;
    else
    {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            colliding++;
        else
        {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                colliding++;
        }
    }

    if (colliding)
    {
        gCurrentSprite.yPosition = blockTop + BLOCK_SIZE;
        SidehopperLandingInit();
    }
    else
    {
        offset = gCurrentSprite.work4;
        movement = sSpritesFallingSpeedCeiling[offset];

        if (movement == SHORT_MAX)
        {
            movement = sSpritesFallingSpeedCeiling[offset - 1];
            gCurrentSprite.yPosition += movement;
        }
        else
        {
            gCurrentSprite.work4++;
            gCurrentSprite.yPosition += movement;
        }
    }
}

/**
 * @brief Handles a sidehopper being idle on the ground
 * 
 */
void SidehopperIdleGround(void)
{
    if (SidehopperCheckSamusInRange())
        SidehopperPreparingtoJumpInit();
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
            if (gPreviousCollisionCheck == COLLISION_AIR)
            {
                SidehopperFallingInit();
                return;
            }
        }

        if (SpriteUtilCheckEndCurrentSpriteAnim())
        {
            if (gCurrentSprite.work1++ == gCurrentSprite.work2)
                SidehopperPreparingtoJumpInit();
            else
            {
                if (gCurrentSprite.pOam == sSidehopperOam_ShakingHead)
                    SoundPlayNotAlreadyPlaying(SOUND_SIDEHOPPER_SHAKING_HEAD);
            }
        }
    }
}

/**
 * @brief 3ff4c | 5c | Handles a sidehopper being idle on the ceiling
 * 
 */
void SidehopperIdleCeiling(void)
{
    if (SidehopperCheckSamusInRange())
        SidehopperPreparingtoJumpInit();
    else
    {
        if (SpriteUtilCheckEndCurrentSpriteAnim())
        {
            if (gCurrentSprite.work1++ == gCurrentSprite.work2)
                SidehopperPreparingtoJumpInit();
            else
            {
                if (gCurrentSprite.pOam == sSidehopperOam_ShakingHead)
                    SoundPlayNotAlreadyPlaying(SOUND_SIDEHOPPER_SHAKING_HEAD);
            }
        }
    }
}

/**
 * @brief Sidehopper AI
 * 
 */
void Sidehopper(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_SIDEHOPPER_HURT);

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SidehopperInit();
            break;

        case SIDEHOPPER_POSE_JUMP_WARNING_INIT:
            SidehopperPreparingtoJumpInit();

        case SIDEHOPPER_POSE_JUMP_WARNING:
            if (gCurrentSprite.status & SS_Y_FLIP)
                SidehopperPreparingToJumpCeiling();
            else
                SidehopperPreparingToJumpGround();
            break;

        case SIDEHOPPER_POSE_JUMPING:
            if (gCurrentSprite.status & SS_Y_FLIP)
                SidehopperJumpingCeiling();
            else
                SidehopperJumpingGround();
            break;

        case SIDEHOPPER_POSE_LANDING:
            SidehopperCheckLandingAnimEnded();
            break;

        case SIDEHOPPER_POSE_IDLE:
            if (gCurrentSprite.status & SS_Y_FLIP)
                SidehopperIdleCeiling();
            else
                SidehopperIdleGround();
            break;

        case SIDEHOPPER_POSE_FALLING:
            if (gCurrentSprite.status & SS_Y_FLIP)
                SidehopperFallingCeiling();
            else
                SidehopperFallingGround();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            SidehopperInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            if (gCurrentSprite.status & SS_Y_FLIP)
                gCurrentSprite.yPosition += BLOCK_SIZE;
            else
                gCurrentSprite.yPosition -= BLOCK_SIZE;

            XParasiteInit();
    }
}
