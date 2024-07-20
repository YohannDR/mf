#include "sprites_AI/target.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "data/sprites/target.h"

#include "constants/sprite.h"
#include "constants/clipdata.h"

#include "structs/samus.h"
#include "structs/sprite.h"

/**
 * @brief 14884 | a0 | Initializes a target sprite
 * 
 */
void TargetInit(void)
{
    gCurrentSprite.pose++;

    if (!gDebugFlag)
        gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -QUARTER_BLOCK_SIZE;
    gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -QUARTER_BLOCK_SIZE;
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE;

    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;

    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sTargetOam_Idle;

    gCurrentSprite.bgPriority = 1;
    gCurrentSprite.drawOrder = 1;

    SpriteUtilChooseRandomXDirection();

    if (gSamusData.direction & KEY_RIGHT)
        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;

    gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
}

/**
 * @brief 14924 | 1c | Sets the X-parasite target position
 * 
 */
void TargetSetTargetPosition(void)
{
    gXParasiteTargetYPosition = gCurrentSprite.yPosition;
    gXParasiteTargetXPosition = gCurrentSprite.xPosition;
}

/**
 * @brief 14940 | 84 | Target (circles) AI
 * 
 */
void TargetCircles(void)
{
    s16 movement;
    u8 offset;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.pose != SPRITE_POSE_UNINITIALIZED)
    {
        offset = gCurrentSprite.work4;
        movement = sTargetCirclesYMovement[offset];

        if (movement == SHORT_MAX)
        {
            movement = sTargetCirclesYMovement[0]; // 0
            offset = 0;
        }

        gCurrentSprite.work4 = offset + 1;
        gCurrentSprite.yPosition += movement;

        offset = gCurrentSprite.work3;
        movement = sTargetCirclesXMovement[offset];

        if (movement == SHORT_MAX)
        {
            movement = sTargetCirclesXMovement[0]; // 0
            offset = 0;
        }

        gCurrentSprite.work3 = offset + 1;
        gCurrentSprite.xPosition += movement;
    }
    else
        TargetInit();

    TargetSetTargetPosition();
}

/**
 * @brief 149c4 | 108 | Target (diagonal) AI
 * 
 */
void TargetDiagonal(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.pose != SPRITE_POSE_UNINITIALIZED)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

            if (gPreviousCollisionCheck == COLLISION_AIR)
                gCurrentSprite.xPosition += PIXEL_SIZE / 2;
            else
                gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

            if (gPreviousCollisionCheck == COLLISION_AIR)
                gCurrentSprite.xPosition -= PIXEL_SIZE / 2;
            else
                gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
        }

        if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition);

            if (gPreviousCollisionCheck == COLLISION_AIR)
                gCurrentSprite.yPosition -= PIXEL_SIZE / 2;
            else
                gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition);

            if (gPreviousCollisionCheck == COLLISION_AIR)
                gCurrentSprite.yPosition += PIXEL_SIZE / 2;
            else
                gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
        }
    }
    else
        TargetInit();

    TargetSetTargetPosition();
}

/**
 * @brief 14acc | 98 | Target (sideways) AI
 * 
 */
void TargetSideways(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.pose != SPRITE_POSE_UNINITIALIZED)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

            if (gPreviousCollisionCheck == COLLISION_AIR)
                gCurrentSprite.xPosition += PIXEL_SIZE / 2;
            else
                gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

            if (gPreviousCollisionCheck == COLLISION_AIR)
                gCurrentSprite.xPosition -= PIXEL_SIZE / 2;
            else
                gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
        }
    }
    else
        TargetInit();

    TargetSetTargetPosition();
}

/**
 * @brief 14b64 | 38 | Core X target AI
 * 
 */
void TargetCoreX(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED)
        TargetInit();

    gAbilityRestingYPosition = gCurrentSprite.yPosition;
    gAbilityRestingXPosition = gCurrentSprite.xPosition;
}
