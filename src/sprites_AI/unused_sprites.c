#include "sprites_AI/unused_sprites.h"
#include "macros.h"

#include "data/sprites/target.h"

#include "constants/sprite.h"

#include "structs/sprite.h"

/**
 * @brief 14b9c | 5c | Unused sprites AI
 * 
 */
void UnusedSprites(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.pose == SPRITE_POSE_UNITIALIZED)
    {
        gCurrentSprite.pose++;

        gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
        gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
        gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

        gCurrentSprite.hitboxTop = -QUARTER_BLOCK_SIZE;
        gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE;
        gCurrentSprite.hitboxLeft = -QUARTER_BLOCK_SIZE;
        gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE;

        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sTargetOam_Idle;

        gCurrentSprite.bgPriority = 1;
    }
}
