#include "sprites_AI/zoro_cocoon.h"
#include "globals.h"
#include "macros.h"

#include "data/sprites/zoro_cocoon.h"
#include "data/sprite_data.h"

#include "constants/sprite.h"
#include "constants/clipdata.h"

#include "structs/samus.h"
#include "structs/sprite.h"

/**
 * @brief 42930 | 88 | Sets the hitboxes and draw distances of a zoro cocoon
 * 
 */
void ZoroCocoonSetHitboxesAndDrawDistances(void)
{
    if (gCurrentSprite.work0)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
        {
            gCurrentSprite.hitboxTop = -(BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxBottom = BLOCK_SIZE - PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -(BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxRight = PIXEL_SIZE;
        }
        else
        {
            gCurrentSprite.hitboxTop = -(BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxBottom = BLOCK_SIZE - PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
            gCurrentSprite.hitboxRight = BLOCK_SIZE - PIXEL_SIZE;
        }
    }
    else
    {
        if (gCurrentSprite.status & SS_Y_FLIP)
        {
            gCurrentSprite.hitboxTop = PIXEL_SIZE;
            gCurrentSprite.hitboxBottom = BLOCK_SIZE - PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -(BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxRight = BLOCK_SIZE - PIXEL_SIZE;
        }
        else
        {
            gCurrentSprite.hitboxTop = -(BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxBottom = PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -(BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxRight = BLOCK_SIZE - PIXEL_SIZE;
        }
    }

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
}

/**
 * @brief 429b8 | 6c | Sets the oam for a zoro cocoon
 * 
 */
void ZoroCocoonSetOam(void)
{
    if (EventCheckAfter_EscapedSaXTro1())
    {
        if (gCurrentSprite.work0)
            gCurrentSprite.pOam = sZoroCocoonOam_TransformedVertical;
        else
            gCurrentSprite.pOam = sZoroCocoonOam_TransformedHorizontal;

        gCurrentSprite.currentAnimationFrame = MOD_AND(gSpriteRandomNumber, 8);
    }
    else
    {
        if (gCurrentSprite.work0)
            gCurrentSprite.pOam = sZoroCocoonOam_UntransformedVertical;
        else
            gCurrentSprite.pOam = sZoroCocoonOam_UntransformedHorizontal;

        gCurrentSprite.currentAnimationFrame = 0;
    }

    gCurrentSprite.animationDurationCounter = 0;
}

/**
 * @brief 42a24 | 130 | Initializes a zoro cocoon
 * 
 */
void ZoroCocoonInit(void)
{
    gCurrentSprite.samusCollision = SSC_SOLID;
    gCurrentSprite.properties |= SP_SOLID_FOR_PROJECTILES;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    SpriteUtilChooseRandomXDirectionRoomSlot();

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
    {
        gCurrentSprite.work0 = FALSE;

        if (gCurrentSprite.status & SS_FACING_RIGHT)
            gCurrentSprite.status |= SS_X_FLIP;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + PIXEL_SIZE), gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
        {
            gCurrentSprite.work0 = FALSE;

            gCurrentSprite.status |= SS_Y_FLIP;
            gCurrentSprite.yPosition -= BLOCK_SIZE;

            if (gCurrentSprite.status & SS_FACING_RIGHT)
                gCurrentSprite.status |= SS_X_FLIP;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition - (HALF_BLOCK_SIZE + PIXEL_SIZE));
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
            {
                gCurrentSprite.work0 = TRUE;

                gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                gCurrentSprite.xPosition -= HALF_BLOCK_SIZE;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                {
                    gCurrentSprite.status = 0;
                    return;
                }

                gCurrentSprite.work0 = TRUE;

                gCurrentSprite.status |= SS_X_FLIP;
                gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                gCurrentSprite.xPosition += HALF_BLOCK_SIZE;
            }
        }
    }

    ZoroCocoonSetOam();
    ZoroCocoonSetHitboxesAndDrawDistances();
}

/**
 * @brief 42b54 | a8 | Zoro cocoon AI
 * 
 */
void ZoroCocoon(void)
{
    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        return;
    }

    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED)
        ZoroCocoonInit();

    if (EventCheckAfter_EscapedSaXTro1() && gCurrentSprite.currentAnimationFrame == 1 && gCurrentSprite.animationDurationCounter == 1 && gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(0x1D2);

    if (gCurrentSprite.work0)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
            unk_12008(gCurrentSprite.yPosition, gCurrentSprite.xPosition - HALF_BLOCK_SIZE);
        else
            unk_12008(gCurrentSprite.yPosition, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);
    }
    else
    {
        if (gCurrentSprite.status & SS_Y_FLIP)
            unk_12008(gCurrentSprite.yPosition + HALF_BLOCK_SIZE, gCurrentSprite.xPosition);
        else
            unk_12008(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition);
    }
}

/**
 * @brief 42bfc | 30 | Sets the oam for a zoro husk
 * 
 */
void ZoroHuskSetOam(void)
{
    if (gCurrentSprite.work0)
        gCurrentSprite.pOam = sZoroHuskOam_Vertical;
    else
        gCurrentSprite.pOam = sZoroHuskOam_Horizontal;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 42c2c | 128 | Initializes a zoro husk
 * 
 */
void ZoroHuskInit(void)
{
    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    SpriteUtilChooseRandomXDirectionRoomSlot();

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
    {
        gCurrentSprite.work0 = FALSE;

        if (gCurrentSprite.status & SS_FACING_RIGHT)
            gCurrentSprite.status |= SS_X_FLIP;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + PIXEL_SIZE), gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
        {
            gCurrentSprite.work0 = FALSE;

            gCurrentSprite.status |= SS_Y_FLIP;
            gCurrentSprite.yPosition -= BLOCK_SIZE;

            if (gCurrentSprite.status & SS_FACING_RIGHT)
                gCurrentSprite.status |= SS_X_FLIP;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition - (HALF_BLOCK_SIZE + PIXEL_SIZE));
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
            {
                gCurrentSprite.work0 = TRUE;

                gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                gCurrentSprite.xPosition -= HALF_BLOCK_SIZE;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                {
                    gCurrentSprite.status = 0;
                    return;
                }

                gCurrentSprite.work0 = TRUE;

                gCurrentSprite.status |= SS_X_FLIP;
                gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                gCurrentSprite.xPosition += HALF_BLOCK_SIZE;
            }
        }
    }

    ZoroHuskSetOam();
}

/**
 * @brief 42d54 | 20 | Zoro husk AI
 * 
 */
void ZoroHusk(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED)
        ZoroHuskInit();
}
