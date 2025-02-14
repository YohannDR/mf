#include "sprites_AI/skree.h"
#include "macros.h"

#include "data/sprite_data.h"
#include "data/sprites/skree.h"
#include "data/sprites/x_parasite.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/sprite_debris.h"

#include "structs/samus.h"
#include "structs/sprite.h"

#define SKREE_Y_RANGE (BLOCK_SIZE * 3 + EIGHTH_BLOCK_SIZE)
#define SKREE_X_RANGE (BLOCK_SIZE * 4 + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE)

#define SKREE_WARNING_INIT 0x17
#define SKREE_WARNING 0x18
#define SKREE_GOING_DOWN_INIT 0x29
#define SKREE_GOING_DOWN 0x2A
#define SKREE_CRASHING_INIT 0x2B
#define SKREE_CRASHING 0x2C
#define SKREE_GOING_UP_WARNING_INIT 0x2D
#define SKREE_GOING_UP_WARNING 0x2E
#define SKREE_GOING_UP_INIT 0x2F
#define SKREE_GOING_UP 0x30

/**
 * @brief 21980 | a8 | Initializes a skree
 * 
 */
void SkreeInit(void)
{
    SpriteUtilTrySetAbsorbXFlag();

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000))
    {
        gCurrentSprite.status = 0;
        return;
    }

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.work0 = 0;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(QUARTER_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        gCurrentSprite.pOam = sSkreeOam_WaitingForX;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = ARRAY_SIZE(sXParasiteMosaicValues);
    }
    else
    {
        gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
    }
}

/**
 * @brief 21a28 | 1c | Initializes a skree to be idle
 * 
 */
void SkreeIdleInit(void)
{
    gCurrentSprite.pOam = sSkreeOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

/**
 * @brief 21a44 | 44 | Handles a skree being idle and trying to detect samus
 * 
 */
void SkreeDetectSamus(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000)
        return;

    if (gSamusData.yPosition <= gCurrentSprite.yPosition + SKREE_Y_RANGE)
        return;

    if (gSamusData.xPosition > gCurrentSprite.xPosition - SKREE_X_RANGE / 2 &&
        gSamusData.xPosition < gCurrentSprite.xPosition + SKREE_X_RANGE / 2)
    {
        gCurrentSprite.pose = SKREE_WARNING_INIT;
    }
}

/**
 * @brief 21a88 | 10 | Initializes a skree to do a warning
 * 
 */
void SkreeWarningInit(void)
{
    gCurrentSprite.pose = SKREE_WARNING;
}

/**
 * @brief 21a98 | 1c | Handles a skree doing a warning
 * 
 */
void SkreeWarning(void)
{
    if (SpriteUtilCheckNearEndOfCurrentSpriteAnimation())
        gCurrentSprite.pose = SKREE_GOING_DOWN_INIT;
}

/**
 * @brief 21ab4 | 38 | Initializes a skree to be going down
 * 
 */
void SkreeGoingDownInit(void)
{
    gCurrentSprite.pOam = sSkreeOam_GoingDown;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;

    gCurrentSprite.pose = SKREE_GOING_DOWN;

    SoundPlay(0x1DA);
}

/**
 * @brief 21aec | 148 | Handles a skree going down
 * 
 */
void SkreeGoingDown(void)
{
    u16 yPosition;
    u16 xPosition;
    u32 blockTop;
    u8 offset;
    s16 movement;

    if (gCurrentSprite.work1 != 0)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE), gCurrentSprite.xPosition);

        if (gPreviousCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.pose = SKREE_CRASHING_INIT;
            return;
        }

        gCurrentSprite.yPosition += PIXEL_SIZE + PIXEL_SIZE / 2;

        yPosition = gCurrentSprite.yPosition;
        xPosition = gCurrentSprite.xPosition;

        if (gCurrentSprite.work1 == 1)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_FALLING, yPosition - (EIGHTH_BLOCK_SIZE + PIXEL_SIZE / 2), xPosition);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_FALLING, yPosition - QUARTER_BLOCK_SIZE, xPosition + (QUARTER_BLOCK_SIZE - PIXEL_SIZE));
        }
        else if (gCurrentSprite.work1 == 2)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_FALLING, yPosition - (HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE), xPosition - QUARTER_BLOCK_SIZE);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition - (HALF_BLOCK_SIZE - PIXEL_SIZE / 2), xPosition);
        }
        else if (gCurrentSprite.work1 == 4)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_FALLING, yPosition - (BLOCK_SIZE - PIXEL_SIZE), xPosition - (QUARTER_BLOCK_SIZE + PIXEL_SIZE));
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_FALLING, yPosition - (BLOCK_SIZE + PIXEL_SIZE + PIXEL_SIZE / 2), xPosition + (HALF_BLOCK_SIZE - PIXEL_SIZE / 2));
        }
        else if (gCurrentSprite.work1 == 6)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_FALLING, yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE - PIXEL_SIZE), xPosition + (QUARTER_BLOCK_SIZE + PIXEL_SIZE));
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE), xPosition - (HALF_BLOCK_SIZE - PIXEL_SIZE / 2));
        }

        gCurrentSprite.work1++;
    }
    else
    {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.yPosition = blockTop;
            gCurrentSprite.work1 = 1;
            gCurrentSprite.unk_8 = gCurrentSprite.xPosition;

            SoundPlay(0x1DB);
            return;
        }

        offset = gCurrentSprite.work4;
        movement = sSkreeGoingDownYVelocity[offset];

        if (movement == SHORT_MAX)
        {
            movement = sSkreeGoingDownYVelocity[offset - 1];
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
 * @brief 21c34 | 24 | Initializes a skree to be crashing
 * 
 */
void SkreeCrashingInit(void)
{
    gCurrentSprite.pOam = sSkreeOam_Crashing;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 60;
    gCurrentSprite.pose = SKREE_CRASHING;
}

/**
 * @brief 21c58 | 44 | Handles a skree crashing
 * 
 */
void SkreeCrashing(void)
{
    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        return;
    }

    if (gCurrentSprite.unk_8 - 0xC0 < gSamusData.xPosition &&
        gSamusData.xPosition < gCurrentSprite.unk_8 + 0xC0)
    {
        gCurrentSprite.xPosition = gSamusData.xPosition;
        gCurrentSprite.pose = SKREE_GOING_UP_WARNING_INIT;
    }
}

/**
 * @brief 21c9c | 30 | Initializes a skree to do a going up warning
 * 
 */
void SkreeGoingUpWarningInit(void)
{
    gCurrentSprite.pOam = sSkreeOam_Crashing;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 31;
    gCurrentSprite.work2 = 0;

    gCurrentSprite.pose = SKREE_GOING_UP_WARNING;
}

/**
 * @brief 21ccc | 1b0 | Handles a skree doing a going up warning
 * 
 */
void SkreeGoingUpWarning(void)
{
    u16 yPosition;
    u16 xPosition;

    if (gCurrentSprite.work2 == 0)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition);

        if (gPreviousCollisionCheck & 0xF0)
        {
            gCurrentSprite.yPosition -= PIXEL_SIZE;
            return;
        }

        gCurrentSprite.work2++;
        SoundPlay(0x1DB);
    }

    yPosition = gCurrentSprite.yPosition - HALF_BLOCK_SIZE;
    xPosition = gCurrentSprite.xPosition;

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 30)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_FALLING, yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE), xPosition);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_FALLING, yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE), xPosition + QUARTER_BLOCK_SIZE);
        }
        else if (gCurrentSprite.work1 == 20)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_FALLING, yPosition - BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition - BLOCK_SIZE, xPosition);
        }
        else if (gCurrentSprite.work1 == 14)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_FALLING, yPosition - HALF_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_FALLING, yPosition - HALF_BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE);
        }
        else if (gCurrentSprite.work1 == 6)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_FALLING, yPosition, xPosition - EIGHTH_BLOCK_SIZE);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition, xPosition + QUARTER_BLOCK_SIZE);
        }
    }
    else
    {
        gCurrentSprite.yPosition -= ONE_SUB_PIXEL;
        if (gCurrentSprite.work2 == 1)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_FALLING, yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE), xPosition);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_FALLING, yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE), xPosition + QUARTER_BLOCK_SIZE);
        }
        else if (gCurrentSprite.work2 == 8)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_FALLING, yPosition - BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition - BLOCK_SIZE, xPosition);
        }
        else if (gCurrentSprite.work2 == 16)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_FALLING, yPosition - HALF_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_FALLING, yPosition - HALF_BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE);
        }
        else if (gCurrentSprite.work2 == 24)
        {
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_FALLING, yPosition, xPosition - EIGHTH_BLOCK_SIZE);
            SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition, xPosition + QUARTER_BLOCK_SIZE);
        }
        else if (gCurrentSprite.work2 > 30)
        {
            gCurrentSprite.yPosition -= ONE_SUB_PIXEL;
        }

        gCurrentSprite.work2++;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        
        if (gPreviousCollisionCheck == COLLISION_AIR)
            gCurrentSprite.pose = SKREE_GOING_UP_INIT;
    }
}

/**
 * @brief 21e7c | 1c | Initializes a skree to go up
 * 
 */
void SkreeGoingUpInit(void)
{
    gCurrentSprite.pose = SKREE_GOING_UP;
    SoundPlay(0x1DA);
}

/**
 * @brief 21e98 | 48 | Handles a skree going up
 * 
 */
void SkreeGoingUp(void)
{
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE * 2, gCurrentSprite.xPosition);

    if (gPreviousCollisionCheck == COLLISION_AIR && gCurrentSprite.xParasiteTimer < gCurrentSprite.yPosition)
    {
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
    else
    {
        gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer;
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    }
}

/**
 * @brief 21ee0 | 20c | Skree AI
 * 
 */
void Skree(void)
{
    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SkreeInit();

        case SPRITE_POSE_IDLE_INIT:
            SkreeIdleInit();

        case SPRITE_POSE_IDLE:
            SkreeDetectSamus();
            break;

        case SKREE_WARNING_INIT:
            SkreeWarningInit();

        case SKREE_WARNING:
            SkreeWarning();
            break;

        case SKREE_GOING_DOWN_INIT:
            SkreeGoingDownInit();

        case SKREE_GOING_DOWN:
            SkreeGoingDown();
            break;

        case SKREE_CRASHING_INIT:
            SkreeCrashingInit();

        case SKREE_CRASHING:
            SkreeCrashing();
            break;

        case SKREE_GOING_UP_WARNING_INIT:
            SkreeGoingUpWarningInit();

        case SKREE_GOING_UP_WARNING:
            SkreeGoingUpWarning();
            break;

        case SKREE_GOING_UP_INIT:
            SkreeGoingUpInit();

        case SKREE_GOING_UP:
            SkreeGoingUp();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            SkreeInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
            gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
    }
}
