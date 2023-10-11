#include "sprites_AI/movable_platform.h"
#include "globals.h"
#include "gba.h"
#include "macros.h"

#include "data/sprites/movable_platform.h"

#include "constants/sprite.h"

#include "structs/sprite.h"

/**
 * @brief 1e6b0 | 50 | Initializes a movable platform
 * 
 */
void MovablePlatformInit(void)
{
    gCurrentSprite.samusCollision = SSC_SAVE_PLATFORM;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -BLOCK_SIZE;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
    gCurrentSprite.hitboxRight = BLOCK_SIZE;

    gCurrentSprite.pOam = sMovablePlatformOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.standingOnSprite = FALSE;
}

/**
 * @brief 1e700 | 70 | Handles a movable platform moving
 * 
 */
void MovablePlatformMove(void)
{
    // Check holding L
    if (!(gButtonInput & KEY_L))
        return;

    // Check for direction
    if (gButtonInput & KEY_UP)
        gCurrentSprite.yPosition -= MOVABLE_PLATFORM_SPEED;
    else if (gButtonInput & KEY_DOWN)
        gCurrentSprite.yPosition += MOVABLE_PLATFORM_SPEED;
    else if (gButtonInput & KEY_LEFT)
        gCurrentSprite.xPosition -= MOVABLE_PLATFORM_SPEED;
    else if (gButtonInput & KEY_RIGHT)
        gCurrentSprite.xPosition += MOVABLE_PLATFORM_SPEED;
}

/**
 * @brief 1e770 | 24 | Movable platform AI
 * 
 */
void MovablePlatform(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            MovablePlatformInit();

        case SPRITE_POSE_IDLE:
            MovablePlatformMove();
    }
}
