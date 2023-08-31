#include "sprites_AI/bubbles.h"
#include "macros.h"
#include "globals.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"

#include "structs/sprite.h"

/**
 * @brief 14bf8 | 2c | Initializes a bubbles/water drop sprite
 * 
 */
void BubblesWaterDropInit(void)
{
    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawOrder = 1;
    gCurrentSprite.animationDurationCounter = 0;
}

/**
 * @brief 14c24 | c0 | Bubbles 1 AI
 * 
 */
void Bubbles1(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            BubblesWaterDropInit();

            gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

            gCurrentSprite.currentAnimationFrame = 0;

            // gCurrentSprite.pOam = sBubbles1Oam_Idle;
            gCurrentSprite.pOam = (const struct FrameData*)0x83ec2b0;

            gCurrentSprite.pose = 2;

            gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.work1 = gSpriteRandomNumber * 8;
            break;

        case 1:
            if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
            {
                gCurrentSprite.pose++;
                gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
                gCurrentSprite.work1 = gSpriteRandomNumber * 8;
            }
            break;

        case 2:
            gCurrentSprite.work1--;
            if (gCurrentSprite.work1 == 0)
            {
                gCurrentSprite.pose--;

                gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.animationDurationCounter = 0;
            }
    }
}

/**
 * @brief 14ce4 | f0 | Bubbles 2 AI
 * 
 */
void Bubbles2(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            BubblesWaterDropInit();

            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.currentAnimationFrame = gSpriteRandomNumber / 2;
            // gCurrentSprite.pOam = sBubbles2Oam_Idle;
            gCurrentSprite.pOam = (const struct FrameData*)0x83ec2f8;

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xParasiteTimer + BLOCK_SIZE);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;

            gCurrentSprite.pose = 2;

            gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.work1 = gSpriteRandomNumber * 4;
            break;

        case 1:
            if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
            {
                gCurrentSprite.pose++;
                gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
                gCurrentSprite.work1 = gSpriteRandomNumber * 4;
            }
            break;

        case 2:
            gCurrentSprite.work1--;
            if (gCurrentSprite.work1 == 0)
            {
                gCurrentSprite.pose--;

                gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.animationDurationCounter = 0;
            }
    }
}

void WaterDrop(void)
{

}
