#include "sprites_AI/yameba.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "data/sprites/yameba.h"
#include "data/sprites/x_parasite.h"
#include "data/samus_data.h"
#include "data/sprite_data.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/clipdata.h"

#include "structs/samus.h"
#include "structs/sprite.h"

/**
 * @brief 20578 | a4 | Handles a yameba turning into an X
 * 
 */
void YamebaTurningIntoX(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_ROTATION_SCALING)
        gCurrentSprite.status &= ~SPRITE_STATUS_ROTATION_SCALING;

    switch (gCurrentSprite.work0)
    {
        case 2:
            SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition, 0);
            break;

        case 3:
            SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition + BLOCK_SIZE, 0);

            SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition - BLOCK_SIZE, 0);
    }
}

/**
 * @brief 2061c | 1d8 | Initializes a yameba
 * 
 */
void YamebaInit(void)
{
    u8 properties;

    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED)
    {
        properties = gCurrentSprite.spritesetSlotAndProperties - 0x20;
        if (properties < 0x30)
            gCurrentSprite.work0 = 1;
        else
            gCurrentSprite.work0 = 0;

        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
    }
    else
    {
        gCurrentSprite.work0++;
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = ARRAY_SIZE(sXParasiteMosaicValues);
    }

    if (gCurrentSprite.work0 == 0)
    {
        gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
        gCurrentSprite.drawOrder = 12;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pOam = sYamebaOam_Small;
    }
    else
    {
        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.samusCollision = SSC_YAMEBA;
        gCurrentSprite.pOam = sYamebaOam_Big;
    }

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.rotation = 0;

    switch (gCurrentSprite.work0)
    {
        case 0:
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
            gCurrentSprite.status |= SPRITE_STATUS_ROTATION_SCALING;

            gCurrentSprite.scaling = Q_8_8(.625f);

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxBottom = (QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxRight = (QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            break;

        case 1:
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
            gCurrentSprite.status |= SPRITE_STATUS_ROTATION_SCALING;

            gCurrentSprite.scaling = Q_8_8(.5f);

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxBottom = (QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxRight = (QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            break;

        case 2:
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
            gCurrentSprite.status |= SPRITE_STATUS_ROTATION_SCALING;

            gCurrentSprite.scaling = Q_8_8(1.f);

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

            gCurrentSprite.health *= 3;
            break;

        default:
            gCurrentSprite.properties &= ~SP_CAN_ABSORB_X;
            gCurrentSprite.status |= (SPRITE_STATUS_ROTATION_SCALING | SPRITE_STATUS_DOUBLE_SIZE);

            gCurrentSprite.scaling = Q_8_8(1.999f);

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

            gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxBottom = BLOCK_SIZE * 2 + EIGHTH_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = BLOCK_SIZE * 2 + EIGHTH_BLOCK_SIZE;

            gCurrentSprite.health *= 9;
    }

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        gCurrentSprite.work5 = TRUE;
}

/**
 * @brief 207f4 | 48 | Initializes a yameba to be idle
 * 
 */
void YamebaIdleInit(void)
{
    u8 rng;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    if (gCurrentSprite.work0 == 0)
    {
        rng = gSpriteRandomNumber * 4;

        gCurrentSprite.work3 = rng;
        gCurrentSprite.work4 = rng;
    }
    else
    {
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3; // TODO macro
    }
}

/**
 * @brief 2083c | 88 | Handles a yameba being idle
 * 
 */
void YamebaIdle(void)
{
    u8 offset;
    s16 yMovement;
    s16 xMovement;

    if (gCurrentSprite.work0 == 0)
    {
        offset = gCurrentSprite.work4;
        yMovement = sYamebaIdleYMovement[offset];

        if (yMovement == SHORT_MAX)
        {
            yMovement = sYamebaIdleYMovement[0];
            offset = 0;
        }

        offset++;
        gCurrentSprite.work4 = offset;
        gCurrentSprite.yPosition += yMovement;

        offset = gCurrentSprite.work3;
        xMovement = sYamebaIdleXMovement[offset];

        if (xMovement == SHORT_MAX)
        {
            xMovement = sYamebaIdleXMovement[0];
            offset = 0;
        }

        offset++;
        gCurrentSprite.work3 = offset;
        gCurrentSprite.xPosition += xMovement;
    }
    else
    {
        if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 10, BLOCK_SIZE * 10))
            gCurrentSprite.pose = 0x17;
    }
}

/**
 * @brief 208c4 | 60 | Initializes a yameba to be chasing samus
 * 
 */
void YamebaChasingSamusInit(void)
{
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;

    gCurrentSprite.unk_8 = 0;
    gCurrentSprite.pose = 0x18;

    SpriteUtilMakeSpriteFaceSamusDirection();

    if (gCurrentSprite.yPosition > gSamusData.yPosition + gSamusData.drawDistanceTop)
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
    else
        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
}

/**
 * @brief 20924 | 300 | Handles a yameba chasing samus
 * 
 */
void YamebaChasingSamus(void)
{
    u16 yPosition;
    u16 xPosition;
    u16 otherY;
    u16 otherX;
    u16 size;
    u8 velocityCap;
    u8 i;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;
    size = QUARTER_BLOCK_SIZE;

    for (i = gCurrentSprite.primarySpriteRamSlot + 1; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (gSpriteData[i].properties & SP_SECONDARY_SPRITE)
            continue;

        if (gSpriteData[i].spriteId != PSPRITE_YAMEBA)
            continue;

        if (gSpriteData[i].work0 == 0)
            continue;

        otherY = gSpriteData[i].yPosition;
        otherX = gSpriteData[i].xPosition;

        if (yPosition + size <= otherY - size)
            continue;

        if (yPosition - size >= otherY + size)
            continue;

        if (xPosition + size <= otherX - size)
            continue;

        if (xPosition - size >= otherX + size)
            continue;

        if (gSpriteData[i].freezeTimer == 0)
        {
            if (yPosition > otherY)
                gSpriteData[i].yPosition -= PIXEL_SIZE;
            else
                gSpriteData[i].yPosition += PIXEL_SIZE;

            if (xPosition > otherX)
                gSpriteData[i].xPosition -= PIXEL_SIZE;
            else
                gSpriteData[i].xPosition += PIXEL_SIZE;

            gSpriteData[i].status ^= SPRITE_STATUS_FACING_RIGHT;
            gSpriteData[i].status ^= SPRITE_STATUS_SAMUS_DETECTED;
        }

        break;
    }

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_COLLIDING)
    {
        gCurrentSprite.work2 = 0;
        gCurrentSprite.work3 = 1;
        gCurrentSprite.work1 = 0;
        gCurrentSprite.work4 = 1;
        return;
    }

    if (gCurrentSprite.work0 == 3)
    {
        otherY = gSamusData.yPosition - (BLOCK_SIZE * 2 + EIGHTH_BLOCK_SIZE);
        otherX = gSamusData.xPosition - BLOCK_SIZE;
    }
    else
    {
        otherY = gSamusData.yPosition - (BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
        otherX = gSamusData.xPosition;
    }

    velocityCap = HALF_BLOCK_SIZE - PIXEL_SIZE / 2;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > otherX - PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < velocityCap)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition += DIV_SHIFT(gCurrentSprite.work3, 4);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                gCurrentSprite.xPosition += DIV_SHIFT(gCurrentSprite.work2, 4);
            }
            else
            {
                gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                gCurrentSprite.work3 = 1;
                gCurrentSprite.unk_8++;

                if (gCurrentSprite.unk_8 > 3)
                    gCurrentSprite.unk_8 = 0;
            }
        }
    }
    else
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < otherX + PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < velocityCap)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition -= DIV_SHIFT(gCurrentSprite.work3, 4);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                gCurrentSprite.xPosition -= DIV_SHIFT(gCurrentSprite.work2, 4);
            }
            else
            {
                gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                gCurrentSprite.work3 = 1;
                gCurrentSprite.unk_8++;

                if (gCurrentSprite.unk_8 > 3)
                    gCurrentSprite.unk_8 = 0;
            }
        }
    }

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > otherY - PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < velocityCap)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition += DIV_SHIFT(gCurrentSprite.work4, 4);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                gCurrentSprite.yPosition += DIV_SHIFT(gCurrentSprite.work1, 4);
            }
            else
            {
                gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
                gCurrentSprite.work4 = 1;
            }
        }
    }
    else
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < otherY + PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < velocityCap)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition -= DIV_SHIFT(gCurrentSprite.work4, 4);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                gCurrentSprite.yPosition -= DIV_SHIFT(gCurrentSprite.work1, 4);
            }
            else
            {
                gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
                gCurrentSprite.work4 = 1;
            }
        }
    }
}

/**
 * @brief 20c24 | 218 | Yameba AI
 * 
 */
void Yameba(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 0x4)
        SoundPlayNotAlreadyPlaying(0x15F);

    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            YamebaInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            YamebaIdleInit();
            break;

        case SPRITE_POSE_IDLE:
            YamebaIdle();
            break;

        case 0x17:
            YamebaChasingSamusInit();

        case 0x18:
            YamebaChasingSamus();
            break;

        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            YamebaInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            YamebaTurningIntoX();
            XParasiteInit();
    }

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_COLLIDING)
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_COLLIDING;
}
