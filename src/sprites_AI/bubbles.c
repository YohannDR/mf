#include "sprites_AI/bubbles.h"
#include "macros.h"
#include "globals.h"

#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"

// FIXME oam undefined

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
        case SPRITE_POSE_UNINITIALIZED:
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
            if (SpriteUtilCheckEndCurrentSpriteAnim())
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
        case SPRITE_POSE_UNINITIALIZED:
            BubblesWaterDropInit();

            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.currentAnimationFrame = gSpriteRandomNumber / 2;
            // gCurrentSprite.pOam = sBubbles2Oam_Idle;
            gCurrentSprite.pOam = (const struct FrameData*)0x83ec2f8;

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition + BLOCK_SIZE);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;

            gCurrentSprite.pose = 2;

            gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.work1 = gSpriteRandomNumber * 4;
            break;

        case 1:
            if (SpriteUtilCheckEndCurrentSpriteAnim())
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

/**
 * @brief 14dd4 | 268 | Water drop AI
 * 
 */
void WaterDrop(void)
{
    u32 blockTop;
    u8 offset;
    s16 movement;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case 0:
            BubblesWaterDropInit();

            gCurrentSprite.yPosition -= BLOCK_SIZE;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

            gCurrentSprite.currentAnimationFrame = 0;
            // gCurrentSprite.pOam = sWaterDropOam_Spawning;
            gCurrentSprite.pOam = (const struct FrameData*)0x83ec240;

            gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
            gCurrentSprite.unk_8 = gCurrentSprite.xPosition;

            gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.pose = 10;

            gCurrentSprite.work1 = gSpriteRandomNumber * 8;
            break;

        case 2:
            if (SpriteUtilCheckEndCurrentSpriteAnim())
            {
                // gCurrentSprite.pOam = sWaterDropOam_Falling;
                gCurrentSprite.pOam = (const struct FrameData*)0x83ec270;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.animationDurationCounter = 0;

                gCurrentSprite.work2 = FALSE;
                gCurrentSprite.work4 = 0;
                gCurrentSprite.pose = 22;
            }
            break;

        case 22:
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

            if (gCurrentAffectingClipdata.hazard == HAZARD_WATER)
            {
                if (gEffectYPosition != 0)
                {
                    gCurrentSprite.yPosition = gEffectYPosition;
                    gCurrentSprite.work2 = TRUE;
                }
                else
                {
                    gCurrentSprite.yPosition = blockTop;
                }

                gCurrentSprite.pose = 7;
                break;
            }

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSprite.yPosition = blockTop;
                gCurrentSprite.pose = 7;
                break;
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
            break;

        case 7:
            // gCurrentSprite.pOam = sWaterDropOam_Splashing;
            gCurrentSprite.pOam = (const struct FrameData*)0x83ec280;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.animationDurationCounter = 0;

            gCurrentSprite.pose = 8;

        case 8:
            if (gCurrentSprite.work2)
                gCurrentSprite.yPosition = gEffectYPosition;

            if (SpriteUtilCheckEndCurrentSpriteAnim())
            {
                gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
                gCurrentSprite.pose = 10;
                gCurrentSprite.work1 = 100 + gSpriteRandomNumber * 8;
            }
            break;

        case 10:
            gCurrentSprite.work1--;

            if (gCurrentSprite.work1 == 0)
            {
                // gCurrentSprite.pOam = sWaterDropOam_Spawning;
                gCurrentSprite.pOam = (const struct FrameData*)0x83ec240;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.animationDurationCounter = 0;

                gCurrentSprite.pose = 2;

                gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

                gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer;
                gCurrentSprite.xPosition = gCurrentSprite.unk_8;

                if (MOD_AND(gSpriteRandomNumber, 2))
                    gCurrentSprite.xPosition = gCurrentSprite.unk_8 + DIV_SHIFT(gSpriteRandomNumber + 1, 2);
                else
                    gCurrentSprite.xPosition = gCurrentSprite.unk_8 - DIV_SHIFT(gSpriteRandomNumber + 1, 2);
            }
    }
}
