#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/dessgeega.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

#define DESSGEEGA_POSE_JUMP_WARNING_INIT 1
#define DESSGEEGA_POSE_JUMP_WARNING 2
#define DESSGEEGA_POSE_IDLE 8
#define DESSGEEGA_POSE_FALLING 0x16
#define DESSGEEGA_POSE_JUMPING 0x18
#define DESSGEEGA_POSE_LANDING 0x1a

/**
 * @brief Checks if samus is near the dessgeega on the sides in a 5 block range
 * 
 * @return u8 1 if near, 0 otherwise
 */
u8 DessgeegaCheckSamusInRange(void)
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
 * @brief Initializes a dessgeega sprite
 * 
 */
void DessgeegaInit(void)
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
        gCurrentSprite.pose = DESSGEEGA_POSE_IDLE;
    }

    if (gCurrentSprite.status & SS_Y_FLIP)
    {
        gCurrentSprite.drawDistanceTop = 0x20;
        gCurrentSprite.drawDistanceBottom = 0x30;
        gCurrentSprite.hitboxTop = -0x20;
        gCurrentSprite.hitboxBottom = 0x54;
    }
    else
    {
        gCurrentSprite.drawDistanceTop = 0x30;
        gCurrentSprite.drawDistanceBottom = 0x20;
        gCurrentSprite.hitboxTop = -0x54;
        gCurrentSprite.hitboxBottom = 0x20;
    }

    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxLeft = -0x40;
    gCurrentSprite.hitboxRight = 0x40;

    gCurrentSprite.pOam = sDessgeegaOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    SpriteUtilChooseRandomXDirection();
}

/**
 * @brief Initializes a dessgeega to do the jump warning
 * 
 */
void DessgeegaPreparingToJumpInit(void)
{
    gCurrentSprite.pose = DESSGEEGA_POSE_JUMP_WARNING;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sDessgeegaOam_JumpWarning;
}

/**
 * @brief Initializes a dessgeega to jump
 * 
 */
void DessgeegaJumpingInit(void)
{
    gCurrentSprite.pose = DESSGEEGA_POSE_JUMPING;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pOam = sDessgeegaOam_Jumping;

    if (gSpriteRandomNumber & 1)
        gCurrentSprite.work3 = TRUE;
    else
        gCurrentSprite.work3 = FALSE;

    SoundPlayNotAlreadyPlaying(SOUND_DESSGEEGA_JUMPING);
}

/**
 * @brief Initializes a dessgeega to land
 * 
 */
void DessgeegaLandingInit(void)
{
    gCurrentSprite.pose = DESSGEEGA_POSE_LANDING;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sDessgeegaOam_Landing;

    SoundPlayNotAlreadyPlaying(SOUND_DESSGEEGA_LANDING);
}

/**
 * @brief Initializes a dessgeega to be idle
 * 
 */
void DessgeegaIdleInit(void)
{
    if (DessgeegaCheckSamusInRange())
        DessgeegaPreparingToJumpInit();
    else
    {
        gCurrentSprite.pose = DESSGEEGA_POSE_IDLE;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 0x0;

        gCurrentSprite.work2 = MOD_AND(gSpriteRandomNumber, 4);

        if (gSpriteRandomNumber >= 8)
            gCurrentSprite.pOam = sDessgeegaOam_Idle;
        else
        {
            gCurrentSprite.pOam = sDessgeegaOam_ShakingHead;
            SoundPlayNotAlreadyPlaying(SOUND_DESSGEEGA_SHAKING_HEAD);
        }
    }
}

/**
 * @brief Initializes a dessgeega to be falling
 * 
 */
void DessgeegaFallingInit(void)
{
    gCurrentSprite.pose = DESSGEEGA_POSE_FALLING;
    gCurrentSprite.animationDurationCounter = 0x0;
    gCurrentSprite.currentAnimationFrame = 0x0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pOam = sDessgeegaOam_Jumping;
}

/**
 * @brief Handles a dessgeega doing the jump warning when on the ground
 * 
 */
void DessgeegaJumpWarningGround(void)
{
    if (gCurrentSprite.status & SS_HIDDEN)
        return;

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
    if (gPreviousCollisionCheck == COLLISION_AIR)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            DessgeegaFallingInit();
            return;
        }
    }
    
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        DessgeegaJumpingInit();
}

/**
 * @brief Handles a dessgeega doing the jump warning when on the ceiling
 * 
 */
void DessgeegaJumpWarningCeiling(void)
{
    if (gCurrentSprite.status & SS_HIDDEN)
        return;

    if (SpriteUtilCheckEndCurrentSpriteAnim())
        DessgeegaJumpingInit();
}

/**
 * @brief Handles a dessgeega jumping when on the ground
 * 
 */
void DessgeegaJumpingGround(void)
{
    u8 colliding;
    u8 offset;
    s16 movement;
    u32 blockTop;

    colliding = FALSE;

    if (gCurrentSprite.work3)
        movement = sDessgeegaLittleHopVelocity[gCurrentSprite.work4 / 4];
    else
        movement = sDessgeegaBigHopVelocity[gCurrentSprite.work4 / 4];

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
    if (gCurrentSprite.work4 < ARRAY_SIZE(sDessgeegaLittleHopVelocity) * 4 - 1)
        gCurrentSprite.work4++;

    if (movement > 0x0)
    {
        if (colliding)
            gCurrentSprite.status ^= SS_FACING_RIGHT;

        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.yPosition = blockTop;
            DessgeegaLandingInit();
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
                DessgeegaLandingInit();
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
                DessgeegaFallingInit();
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
                DessgeegaFallingInit();
            }
        }

        if (colliding)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
    }
}

/**
 * @brief Handles a dessgeega jumping when on the ceiling
 * 
 */
void DessgeegaJumpingCeiling(void)
{
    u8 colliding;
    u8 offset;
    s16 movement;
    u32 blockTop;

    colliding = FALSE;

    if (gCurrentSprite.work3)
        movement = sDessgeegaLittleHopVelocity[gCurrentSprite.work4 / 4];
    else
        movement = sDessgeegaBigHopVelocity[gCurrentSprite.work4 / 4];

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
    if (gCurrentSprite.work4 < ARRAY_SIZE(sDessgeegaLittleHopVelocity) * 4 - 1)
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
                DessgeegaFallingInit();
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
                DessgeegaFallingInit();
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
            DessgeegaLandingInit();
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
                DessgeegaLandingInit();
            }
        }
    }
}

/**
 * @brief Checks if the landing animation as ended
 * 
 */
void DessgeegaLanding(void)
{
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        DessgeegaIdleInit();
}

/**
 * @brief Handles a dessgeega falling from the ground
 * 
 */
void DessgeegaFallingGround(void)
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
        DessgeegaLandingInit();
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
 * @brief Handles a dessgeega falling from the ceiling
 * 
 */
void DessgeegaFallingCeiling(void)
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
        DessgeegaLandingInit();
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
 * @brief Handles a dessgeega being idle on the ground
 * 
 */
void DessgeegaIdleGround(void)
{
    if (DessgeegaCheckSamusInRange())
        DessgeegaPreparingToJumpInit();
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
            if (gPreviousCollisionCheck == COLLISION_AIR)
            {
                DessgeegaFallingInit();
                return;
            }
        }

        if (SpriteUtilCheckEndCurrentSpriteAnim())
        {
            if (gCurrentSprite.work1++ == gCurrentSprite.work2)
                DessgeegaPreparingToJumpInit();
            else
            {
                if (gCurrentSprite.pOam == sDessgeegaOam_ShakingHead)
                    SoundPlayNotAlreadyPlaying(SOUND_DESSGEEGA_SHAKING_HEAD);
            }
        }
    }
}

/**
 * @brief 3ff4c | 5c | Handles a dessgeega being idle on the ceiling
 * 
 */
void DessgeegaIdleCeiling(void)
{
    if (DessgeegaCheckSamusInRange())
        DessgeegaPreparingToJumpInit();
    else
    {
        if (SpriteUtilCheckEndCurrentSpriteAnim())
        {
            if (gCurrentSprite.work1++ == gCurrentSprite.work2)
                DessgeegaPreparingToJumpInit();
            else
            {
                if (gCurrentSprite.pOam == sDessgeegaOam_ShakingHead)
                    SoundPlayNotAlreadyPlaying(SOUND_DESSGEEGA_SHAKING_HEAD);
            }
        }
    }
}

void DessgeegaSpikeInit(void) {
    gCurrentSprite.status &= ~ SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;
    gCurrentSprite.pOam = sDessgeegaSpikeOam_Moving;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.drawOrder = 3;
}

void DessgeegaSpikeMove(void) {
    if (!(gCurrentSprite.status & SS_ON_SCREEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
        return;
    }
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition += PIXEL_TO_SUB_PIXEL(2.5);
    else
        gCurrentSprite.xPosition -= PIXEL_TO_SUB_PIXEL(2.5);
}

void DessgeegaSpikeExplodingInit(void) {
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pOam = sDessgeegaSpikeOam_Exploding;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void DessgeegaSpikeExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (!(gCurrentSprite.status & SS_ON_SCREEN))
        gCurrentSprite.status = 0;
    else if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

/**
 * @brief Dessgeega AI
 * 
 */
void Dessgeega(void)
{
    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        return;
    }

    if (gCurrentSprite.pose < SPRITE_POSE_TURNING_INTO_X)
    {
        if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        {
            SoundPlayNotAlreadyPlaying(SOUND_DESSGEEGA_HURT);

            if (gCurrentSprite.status & SS_ON_SCREEN
                && SpriteUtilCountSecondarySpritesWithRamSlot(SSPRITE_DESSGEEGA_SPIKE, gCurrentSprite.primarySpriteRamSlot) <= 2)
            {
                if (gCurrentSprite.status & SS_Y_FLIP)
                {
                    SpriteSpawnSecondary(SSPRITE_DESSGEEGA_SPIKE, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                        gCurrentSprite.yPosition + 0x4c, gCurrentSprite.xPosition - 0x40, 0);
                    SpriteSpawnSecondary(SSPRITE_DESSGEEGA_SPIKE, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                        gCurrentSprite.yPosition + 0x4c, gCurrentSprite.xPosition + 0x40, SS_X_FLIP);
                }
                else
                {
                    SpriteSpawnSecondary(SSPRITE_DESSGEEGA_SPIKE, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                        gCurrentSprite.yPosition - 0x4c, gCurrentSprite.xPosition - 0x40, 0);
                    SpriteSpawnSecondary(SSPRITE_DESSGEEGA_SPIKE, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                        gCurrentSprite.yPosition - 0x4c, gCurrentSprite.xPosition + 0x40, SS_X_FLIP);
                }
            }
        }
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            DessgeegaInit();
            break;

        case DESSGEEGA_POSE_JUMP_WARNING_INIT:
            DessgeegaPreparingToJumpInit();

        case DESSGEEGA_POSE_JUMP_WARNING:
            if (gCurrentSprite.status & SS_Y_FLIP)
                DessgeegaJumpWarningCeiling();
            else
                DessgeegaJumpWarningGround();
            break;

        case DESSGEEGA_POSE_JUMPING:
            if (gCurrentSprite.status & SS_Y_FLIP)
                DessgeegaJumpingCeiling();
            else
                DessgeegaJumpingGround();
            break;

        case DESSGEEGA_POSE_LANDING:
            DessgeegaLanding();
            break;

        case DESSGEEGA_POSE_IDLE:
            if (gCurrentSprite.status & SS_Y_FLIP)
                DessgeegaIdleCeiling();
            else
                DessgeegaIdleGround();
            break;

        case DESSGEEGA_POSE_FALLING:
            if (gCurrentSprite.status & SS_Y_FLIP)
                DessgeegaFallingCeiling();
            else
                DessgeegaFallingGround();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            DessgeegaInit();

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

void DessgeegaSpike(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            DessgeegaSpikeInit();
            break;
        case SPRITE_POSE_IDLE:
            DessgeegaSpikeMove();
            break;
        case 0x38:
            DessgeegaSpikeExploding();
            break;
        default:
            DessgeegaSpikeExplodingInit();
    }
}
