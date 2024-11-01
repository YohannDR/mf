#include "sprites_AI/x_parasite.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/x_parasite.h"

#include "constants/sprite.h"

#include "structs/power_bomb.h"
#include "structs/sprite.h"

/**
 * @brief 1503c | 48 | Checks if any sprite can absorb an X
 * 
 * @return u8 bool, a sprite can
 */
u8 CheckAnySpriteCanAbsorbX(void)
{
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SS_EXISTS))
            continue;

        if (gSpriteData[i].properties & SP_CAN_ABSORB_X && gSpriteData[i].health != 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 15084 | 34 | Handles an X parasite in room waiting to move
 * 
 */
void XParasiteInRoomWaitingToMove(void)
{
    s32 canMove;

    canMove = FALSE;

    if (gCurrentSprite.spriteId == PSPRITE_X_PARASITE_IN_ROOM_PROXIMITY)
    {
        // Check samus is near
        if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 10, BLOCK_SIZE * 8) == NSLR_OUT_OF_RANGE)
            canMove = FALSE;
        else
            canMove = TRUE;
    }
    else
    {
        // Not a proximity parasite, move immediately
        canMove = TRUE;
    }

    if (canMove)
        XParasiteFlyingInit();
}

/**
 * @brief 150b8 | 24 | Initializes an X parasite (boss formation) to be growing
 * 
 */
void XParasiteBossFormationGrowingStart(void)
{
    gCurrentSprite.pose = 0x5D;

    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;

    gCurrentSprite.scaling = Q_8_8(.06f);
}

/**
 * @brief 150dc | 30 | Handles an X parasite (boss formation) growing
 * 
 */
void XParasiteBossFormationGrowing(void)
{
    gCurrentSprite.status ^= SS_NOT_DRAWN;
    gCurrentSprite.scaling += Q_8_8(.065f);

    if (gCurrentSprite.scaling > Q_8_8(.98f))
    {
        gCurrentSprite.pose = 0x5E;
        gCurrentSprite.unk_8 = 0;
    }
}

/**
 * @brief 1510c | 54 | Handles an X parasite (boss formation) floating
 * 
 */
void XParasiteBossFormationFloating(void)
{
    gCurrentSprite.status ^= SS_NOT_DRAWN;

    XParasiteMoveWithSound(gXParasiteTargetYPosition, gXParasiteTargetXPosition, HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2,
        BLOCK_SIZE - PIXEL_SIZE, 0, 0x141);

    gCurrentSprite.xParasiteTimer--;
    if (gCurrentSprite.xParasiteTimer == 0)
    {
        gCurrentSprite.pose = 0x5F;
    }
}

/**
 * @brief 15160 | 270 | Handles an X parasite (boss formation) transforming
 * 
 */
void XParasiteBossFormationTransforming(void)
{
    u8 ramSlot;
    u16 targetY;
    u16 targetX;

    gCurrentSprite.status ^= SS_NOT_DRAWN;

    ramSlot =gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].status & SS_ENABLE_MOSAIC)
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    else
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;

    if (gSpriteData[ramSlot].pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        gCurrentSprite.status = 0;
        return;
    }

    targetY = gXParasiteTargetYPosition;
    targetX = gXParasiteTargetXPosition;

    switch (gCurrentSprite.roomSlot)
    {
        case 0:
            targetY -= (BLOCK_SIZE - PIXEL_SIZE);
            targetX -= (HALF_BLOCK_SIZE - PIXEL_SIZE / 2);
            break;

        case 1:
            targetY -= (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
            targetX += (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
            break;

        case 2:
            targetY += (BLOCK_SIZE + QUARTER_BLOCK_SIZE);
            targetX -= (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE / 2);
            break;

        case 3:
            targetY += (BLOCK_SIZE + QUARTER_BLOCK_SIZE);
            targetX += (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE / 2);
            break;

        case 4:
            targetY -= (QUARTER_BLOCK_SIZE + PIXEL_SIZE);
            targetX += (BLOCK_SIZE + PIXEL_SIZE + PIXEL_SIZE / 2);
            break;

        case 5:
            targetY -= (QUARTER_BLOCK_SIZE - ONE_SUB_PIXEL);
            targetX -= (BLOCK_SIZE - QUARTER_BLOCK_SIZE / 2 - ONE_SUB_PIXEL);
            break;
    }

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > targetX - PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < 10)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition += gCurrentSprite.work3;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                gCurrentSprite.xPosition += DIV_SHIFT(gCurrentSprite.work2, 2);
            }
            else
            {
                gCurrentSprite.status &= ~SS_FACING_RIGHT;
                gCurrentSprite.work3 = 1;
            }
        }
    }
    else
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < targetX + PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < 10)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition -= gCurrentSprite.work3;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                gCurrentSprite.xPosition -= DIV_SHIFT(gCurrentSprite.work2, 2);
            }
            else
            {
                gCurrentSprite.status |= SS_FACING_RIGHT;
                gCurrentSprite.work3 = 1;
            }
        }
    }

    if (gCurrentSprite.status & SS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > targetY - PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < 10)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition += gCurrentSprite.work4;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                gCurrentSprite.yPosition += DIV_SHIFT(gCurrentSprite.work1, 2);
            }
            else
            {
                gCurrentSprite.status &= ~SS_SAMUS_DETECTED;
                gCurrentSprite.work4 = 1;
            }
        }
    }
    else
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < targetY + PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < 10)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition -= gCurrentSprite.work4;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                gCurrentSprite.yPosition -= DIV_SHIFT(gCurrentSprite.work1, 2);
            }
            else
            {
                gCurrentSprite.status |= SS_SAMUS_DETECTED;
                gCurrentSprite.work4 = 1;
            }
        }
    }
}

/**
 * @brief 153d0 | 54 | Handles an X parasite (core X or stabilizer) forming
 * 
 */
void XParasiteCoreXOrStabilizerForming(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.xParasiteTimer--;

    if (gCurrentSprite.xParasiteTimer != 0)
    {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    }
    else
    {
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.pose = X_PARASITE_POSE_FLYING;
        gCurrentSprite.xParasiteTimer = 300;
    }

    XParasiteFlyingMovement();
}

/**
 * @brief 15424 | 84 | Handles an X parasite (aqua zebesian) moving to its target
 * 
 */
void XParasiteAquaZebesianMoveToTarget(void)
{
    u16 targetY;
    u16 targetX;

    targetY = gXParasiteTargetYPosition;
    targetX = gXParasiteTargetXPosition;

    if (gCurrentSprite.pose == X_PARASITE_POSE_FLYING)
    {
        switch (gCurrentSprite.unk_8)
        {
            case 1:
                targetY -= BLOCK_SIZE;

                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    targetX += BLOCK_SIZE;
                else
                    targetX -= BLOCK_SIZE;
                break;

            case 3:
                targetY += BLOCK_SIZE;

                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    targetX -= BLOCK_SIZE;
                else
                    targetX += BLOCK_SIZE;
                break;
        }
    }

    XParasiteMove(targetY, targetX, QUARTER_BLOCK_SIZE + PIXEL_SIZE, HALF_BLOCK_SIZE - PIXEL_SIZE, 1);
}

/**
 * @brief 154a8 | 118 | Handles an X parasite (aqua zebesian) waiting to move
 * 
 */
void XParasiteAquaZebesianWaitingToMove(void)
{
    u8 offset;
    s16 movement;

    if (!(gCurrentSprite.invincibilityStunFlashTimer & 0x80))
    {
        offset = gCurrentSprite.work4;
        movement = sXParasiteIdleFloatingYMovement[offset];

        if (movement == SHORT_MAX)
        {
            movement = sXParasiteIdleFloatingYMovement[0];
            offset = 0;
        }

        gCurrentSprite.work4 = offset + 1;
        gCurrentSprite.yPosition += movement;

        offset = gCurrentSprite.work3;
        movement = sXParasiteIdleFloatingXMovement[offset];

        if (movement == SHORT_MAX)
        {
            movement = sXParasiteIdleFloatingXMovement[0];
            offset = 0;
        }

        gCurrentSprite.work3 = offset + 1;
        gCurrentSprite.xPosition += movement;
    }

    if (gCurrentSprite.status & SS_ENABLE_MOSAIC)
    {
        if (--gCurrentSprite.xParasiteTimer != 0)
        {
            gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];

            if (gCurrentSprite.xParasiteTimer > X_PARASITE_MOSAIC_MAX_INDEX / 2)
            {
                gCurrentSprite.ignoreSamusCollisionTimer = 1;
            }
            else
            {
                if (gCurrentSprite.status & SS_SAMUS_COLLIDING)
                    XParasiteGettingAbsorbedInit();
            }
        }
        else
        {
            gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
            gCurrentSprite.xParasiteTimer = 60;
        }
    }
    else
    {
        gCurrentSprite.xParasiteTimer--;

        if (gCurrentSprite.xParasiteTimer == 0)
        {
            gCurrentSprite.pose = X_PARASITE_POSE_FLYING;
            gCurrentSprite.xParasiteTimer = 300;
            gCurrentSprite.unk_8 = 0;
            
            gCurrentSprite.work2 = 0;
            gCurrentSprite.work3 = 1;
            gCurrentSprite.work1 = 0;
            gCurrentSprite.work4 = 1;
        }

        if (gCurrentSprite.status & SS_SAMUS_COLLIDING)
            XParasiteGettingAbsorbedInit();
    }
}

/**
 * @brief 155c0 | 5c | Handles an X parasite (aqua zebesian) floating
 * 
 */
void XParasiteAquaZebesianFloating(void)
{
    if (gCurrentSprite.status & SS_SAMUS_COLLIDING)
    {
        XParasiteGettingAbsorbedInit();
        return;
    }

    if (gCurrentSprite.invincibilityStunFlashTimer & 0x80)
    {
        if (gCurrentPowerBomb.animationState == 0)
            gCurrentSprite.invincibilityStunFlashTimer &= 0x7F;

        return;
    }

    if (gCurrentSprite.xParasiteTimer == 0)
    {
        gCurrentSprite.pose = X_PARASITE_POSE_FLYING_AWAY;
    }
    else
    {
        gCurrentSprite.xParasiteTimer--;
        XParasiteAquaZebesianMoveToTarget();
    }
}

/**
 * @brief 1561c | 74 | X Parasite AI
 * 
 */
void XParasite(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            XParasiteInit();
            break;

        case X_PARASITE_POSE_IDLE:
            XParasiteIdleFloating();
            break;

        case X_PARASITE_POSE_FLYING:
            XParasiteFlying();
            break;

        case X_PARASITE_POSE_GETTING_ABSORBED:
            XParasiteGettingAbsorbed();
            break;

        case X_PARASITE_POSE_FLYING_AWAY:
            XParasiteFlyingAway();
            break;

        case X_PARASITE_POSE_FORMING_INIT:
            XParasiteFormingInit();

        case X_PARASITE_POSE_FORMING:
            XParasiteForming();
            break;

        case X_PARASITE_POSE_WAITING_FOR_ENOUGH_X_TO_FORM_INIT:
            XParasiteWaitingForEnoughXToFormInit();

        case X_PARASITE_POSE_WAITING_FOR_ENOUGH_X_TO_FORM:
            XParasiteWaitingForEnoughXToForm();
    }
}

/**
 * @brief 15690 | 28 | X Parasite (in room) AI
 * 
 */
void XParasiteInRoom(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            XParasiteInit();
            break;

        case X_PARASITE_POSE_IDLE:
            XParasiteInRoomWaitingToMove();
    }
}

/**
 * @brief 156b8 | 54 | X Parasite (boss formation) AI
 * 
 */
void XParasiteBossFormation(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            XParasiteInit();
            break;

        case X_PARASITE_POSE_IDLE:
            XParasiteBossFormationGrowingStart();
            break;

        case 0x5D:
            XParasiteBossFormationGrowing();
            break;

        case 0x5E:
            XParasiteBossFormationFloating();
            break;

        case 0x5F:
            XParasiteBossFormationTransforming();
    }
}

/**
 * @brief 1570c | 74 | X Parasite (core X or stabilizer AI)
 * 
 */
void XParasiteCoreXOrStabilizer(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            XParasiteInit();
            break;

        case X_PARASITE_POSE_IDLE:
            XParasiteCoreXOrStabilizerForming();
            break;

        case X_PARASITE_POSE_FLYING:
            XParasiteFlying();
            break;

        case X_PARASITE_POSE_GETTING_ABSORBED:
            XParasiteGettingAbsorbed();
            break;

        case X_PARASITE_POSE_FLYING_AWAY:
            XParasiteFlyingAway();
            break;

        case X_PARASITE_POSE_FORMING_INIT:
            XParasiteFormingInit();

        case X_PARASITE_POSE_FORMING:
            XParasiteForming();
            break;

        case X_PARASITE_POSE_WAITING_FOR_ENOUGH_X_TO_FORM_INIT:
            XParasiteWaitingForEnoughXToFormInit();

        case X_PARASITE_POSE_WAITING_FOR_ENOUGH_X_TO_FORM:
            XParasiteWaitingForEnoughXToForm();
    }
}

/**
 * @brief 15780 | 4c | X Parasite (aqua zebesian) AI
 * 
 */
void XParasiteAquaZebesian(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            XParasiteInit();
            break;

        case X_PARASITE_POSE_IDLE:
            XParasiteAquaZebesianWaitingToMove();
            break;

        case X_PARASITE_POSE_FLYING:
            XParasiteAquaZebesianFloating();
            break;

        case X_PARASITE_POSE_GETTING_ABSORBED:
            XParasiteGettingAbsorbed();
            break;

        case X_PARASITE_POSE_FLYING_AWAY:
            XParasiteFlyingAway();
    }
}
