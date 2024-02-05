#include "sprites_AI/zazabi.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/x_parasite.h"

#include "constants/clipdata.h"
#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/particle.h"
#include "constants/projectile.h"

#include "structs/samus.h"
#include "structs/sprite.h"
#include "structs/projectile.h"

#define ZAZABI_DAMAGE_RECEIVED 10

#define ZAZABI_HEIGHT (BLOCK_SIZE * 4 + HALF_BLOCK_SIZE)
#define ZAZABI_WIDTH (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE)

void ZazabiSyncSubSprites(void)
{

}

/**
 * @brief 453cc | 154 | Handles the collision between projectiles and zazabi
 * 
 */
void ZazabiProjectilesCollision(void)
{
    u8 i;
    u16 projY;
    u16 projX;
    u16 hitboxY;
    u16 hitboxX;

    hitboxX = BLOCK_SIZE;
    hitboxY = HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE;

    if (gCurrentSprite.health == 0)
    {
        if ((gCurrentSprite.invincibilityStunFlashTimer % 4) == 0)
        {
            if (gCurrentSprite.invincibilityStunFlashTimer & 4)
                gCurrentSprite.paletteRow = 13 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
            else
                gCurrentSprite.paletteRow = 0;
        }
        
        return;
    }

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if (!(gProjectileData[i].status & PROJ_STATUS_EXISTS))
            continue;

        if (gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT)
            continue;

        if (gProjectileData[i].movementStage <= 1)
            continue;

        if (gProjectileData[i].xPosition <= gCurrentSprite.xPosition - hitboxX)
            continue;

        if (gProjectileData[i].xPosition >= gCurrentSprite.xPosition + hitboxX)
            continue;

        if (gProjectileData[i].yPosition <= gCurrentSprite.yPosition - hitboxY)
            continue;

        if (gProjectileData[i].yPosition >= gCurrentSprite.yPosition + hitboxY)
            continue;

        projY = gProjectileData[i].yPosition;
        projX = gProjectileData[i].xPosition;
        if (gProjectileData[i].type == PROJ_TYPE_NORMAL_MISSILE)
        {
            if (gProjectileData[i].movementStage != 0x7)
            {
                ProjectileDealDamageToZazabi(ZAZABI_DAMAGE_RECEIVED);

                ParticleSet(projY, projX, PE_MISSILE_EXPLOSION);
                SPRITE_CLEAR_AND_SET_ISFT(gCurrentSprite, 41);
                SoundPlayNotAlreadyPlaying(0x285);

                gProjectileData[i].status = 0;
                continue;
            }
        }
        else
        {
            if (gProjectileData[i].type == PROJ_TYPE_CHARGED_NORMAL_BEAM)
            {
                if (gProjectileData[i].part != 0)
                {
                    ProjectileDealDamageToZazabi(ZAZABI_DAMAGE_RECEIVED);

                    ParticleSet(projY, projX, PE_CHARGE_BEAM_HIT);
                    SPRITE_CLEAR_AND_SET_ISFT(gCurrentSprite, 41);
                    SoundPlayNotAlreadyPlaying(0x285);

                    gProjectileData[i].status = 0;
                    continue;
                }
            }

            if (SPRITE_HAS_ISFT(gCurrentSprite) < 2)
            {
                SPRITE_CLEAR_AND_SET_ISFT(gCurrentSprite, 2);
            }

            ParticleSet(projY, projX, PE_INVINCIBLE_HIT);
            gProjectileData[i].status = 0;
        }
    }
}

/**
 * @brief 45520 | 80 | Makes it so projectiles can hurt zazabi
 * 
 */
void ZazabiEnableProjectilesToPassThrough(void)
{
    u16 spriteY;
    u16 spriteX;
    u8 i;

    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if (!(gProjectileData[i].status & PROJ_STATUS_EXISTS))
            continue;

        if (gProjectileData[i].movementStage <= 1)
            continue;

        if (gProjectileData[i].direction != ACD_UP)
            continue;

        if (gProjectileData[i].xPosition <= spriteX - (HALF_BLOCK_SIZE + PIXEL_SIZE))
            continue;

        if (gProjectileData[i].xPosition >= spriteX + (HALF_BLOCK_SIZE + PIXEL_SIZE))
            continue;

        if (gProjectileData[i].yPosition > spriteY + HALF_BLOCK_SIZE)
        {
            if (gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT)
                gProjectileData[i].status &= ~PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
        }
        else if (gProjectileData[i].yPosition < spriteY)
        {
            if (!(gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT))
                gProjectileData[i].status |= PROJ_STATUS_UNKNOWN_80;
        }
    }
}

/**
 * @brief 455a0 | 4 | Empty function
 * 
 */
void Zazabi_Empty(void)
{
    return;
}

/**
 * @brief 455a4 | 7c | Handles the horizontal movement of zazabi
 * 
 * @param movement Movement
 * @return u8 bool, colliding with solid
 */
u8 ZazabiXMovement(u16 movement)
{
    u8 colliding;

    colliding = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + ZAZABI_HEIGHT, gSubSpriteData1.xPosition + ZAZABI_WIDTH);

        if (gPreviousCollisionCheck != COLLISION_AIR)
            colliding = TRUE;
        else
            gSubSpriteData1.xPosition += movement;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + ZAZABI_HEIGHT, gSubSpriteData1.xPosition - ZAZABI_WIDTH);

        if (gPreviousCollisionCheck != COLLISION_AIR)
            colliding = TRUE;
        else
            gSubSpriteData1.xPosition -= movement;
    }

    return colliding;
}

/**
 * @brief 45620 | 4c | Handles zazabi spawning from X
 * 
 */
void ZazabiSpawningFromX(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.xParasiteTimer--;

    if (gCurrentSprite.xParasiteTimer != 0)
    {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    }
    else
    {
        gCurrentSprite.pose = 0x7;
        gCurrentSprite.status &= ~SPRITE_STATUS_ENABLE_MOSAIC;
    }
}

void ZazabiInit(void)
{

}

void ZazabiIdleInit(void)
{

}

/**
 * @brief 45904 | 2c | Handles zazabi being idle
 * 
 */
void ZazabiIdle(void)
{
    if (SpriteUtilCheckNearEndOfSubSpriteData1Animation())
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
            gCurrentSprite.pose = 0x1;
    }
}

void ZazabiCrawlingInit(void)
{

}

/**
 * @brief 459a0 | e8 | Handles zazabi crawling
 * 
 */
void ZazabiCrawling(void)
{
    u16 movement;

    switch (gSubSpriteData1.currentAnimationFrame)
    {
        case 1:
            if (gSubSpriteData1.animationDurationCounter == 1)
                SoundPlay(0x27B);

            movement = 2;
            break;

        case 2:
        case 6:
            movement = 4;
            break;

        case 3:
        case 5:
        case 7:
            movement = 2;
            break;

        case 0:
        case 4:
        default:
            movement = 0;
    }

    if (ZazabiXMovement(movement))
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        return;
    }

    if (gSubSpriteData1.health == 40)
    {
        if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 8, BLOCK_SIZE * 6) != NSLR_OUT_OF_RANGE)
        {
            gCurrentSprite.pose = 0x17;
            gCurrentSprite.work3 = 0;
        }
    }
    else
    {
        gCurrentSprite.pose = 0x17;
        gCurrentSprite.work3 = gSpriteRandomNumber / 4;

        if (gSubSpriteData1.health == 60)
            gCurrentSprite.work3 += 2;
        else if (gSubSpriteData1.health == 80)
            gCurrentSprite.work3 += 1;
    }
}

void ZazabiJumpWarningInit(void)
{

}

/**
 * @brief 45ad8 | 44 | Handles zazabi doing a jump warning
 * 
 */
void ZazabiJumpWarning(void)
{
    if (SpriteUtilCheckNearEndOfSubSpriteData1Animation())
    {
        gCurrentSprite.pose = 0x19;

        ParticleSet(gSubSpriteData1.yPosition + ZAZABI_HEIGHT + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE,
            gSubSpriteData1.xPosition - (ZAZABI_WIDTH - QUARTER_BLOCK_SIZE - EIGHTH_BLOCK_SIZE), PE_SMOKE);

        ParticleSet(gSubSpriteData1.yPosition + ZAZABI_HEIGHT + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE,
            gSubSpriteData1.xPosition + (ZAZABI_WIDTH - QUARTER_BLOCK_SIZE - EIGHTH_BLOCK_SIZE), PE_SMOKE);
    }
}

void ZazabiJumpingInit(void)
{

}

void ZazabiJumping(void)
{

}

void ZazabiFallingInit(void)
{

}

void ZazabiFalling(void)
{

}

void ZazabiLandingMouthOpenInit(void)
{

}

/**
 * @brief 46218 | 80 | Handles zazabi landing with its mouth open
 * 
 */
void ZazabiLandingMouthOpen(void)
{
    if (gSubSpriteData1.currentAnimationFrame == 1 && gSubSpriteData1.animationDurationCounter == 1 && gSubSpriteData1.health != 40)
        SoundPlay(0x27F);

    if (SpriteUtilCheckNearEndOfSubSpriteData1Animation())
    {
        if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
        {
            if (gSubSpriteData1.health == 60)
                gCurrentSprite.pose = 0x3F;
            else if (gSubSpriteData1.health == 80)
                gCurrentSprite.pose = 0x3B;
            else
                gCurrentSprite.pose = 0x37;
        }
        else
        {
            gCurrentSprite.pose = 0x7;
        }
    }
}

void ZazabiLandingInit(void)
{

}

/**
 * @brief 462e8 | 1c | Handles zazabi landing
 * 
 */
void ZazabiLanding(void)
{
    if (SpriteUtilCheckNearEndOfSubSpriteData1Animation())
        gCurrentSprite.pose = 0x19;
}

void ZazabiEatingSamus1Init(void)
{

}

/**
 * @brief 46330 | 54 | Handles zazabi eating samus (1)
 * 
 */
void ZazabiEatingSamus1(void)
{
    SpriteUtilTakeConstantDamage();

    if (gBossWork0 != 0)
    {
        gBossWork0 = 0;
        Zazabi_Empty();
        gCurrentSprite.pose = 0x41;
    }
    else
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
        {
            gCurrentSprite.pose = 0x39;
            SoundPlay(0x281);
        }
    }
}

void ZazabiEatingSamus2Init(void)
{

}

/**
 * @brief 463a8 | 4c | Handles zazabi eating samus (2)
 * 
 */
void ZazabiEatingSamus2(void)
{
    SpriteUtilTakeConstantDamage();

    if (gBossWork0 != 0)
    {
        gBossWork0 = 0;
        Zazabi_Empty();
        gCurrentSprite.pose = 0x37;
    }
    else
    {
        if (SpriteUtilCheckNearEndOfSubSpriteData1Animation())
        {
            gCurrentSprite.pose = 0x3B;
            SoundPlay(0x281);
        }
    }
}

void ZazabiEatingSamus3Init(void)
{

}

/**
 * @brief 46430 | 70 | Handles zazabi eating samus (3)
 * 
 */
void ZazabiEatingSamus3(void)
{
    SpriteUtilTakeConstantDamage();

    if (gBossWork0 != 0)
    {
        gBossWork0 = 0;
        Zazabi_Empty();

        if (gSubSpriteData1.health == 80)
            gCurrentSprite.pose = 0x41;
        else
            gCurrentSprite.pose = 0x37;
    }
    else
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
        {
            gCurrentSprite.pose = 0x3D;
            SoundPlay(0x281);
        }
    }
}

void ZazabiEatingSamus4Init(void)
{

}

/**
 * @brief 464d8 | 4c | Handles zazabi eating samus (4)
 * 
 */
void ZazabiEatingSamus4(void)
{
    SpriteUtilTakeConstantDamage();

    if (gBossWork0 != 0)
    {
        gBossWork0 = 0;
        Zazabi_Empty();
        gCurrentSprite.pose = 0x3B;
    }
    else
    {
        if (SpriteUtilCheckNearEndOfSubSpriteData1Animation())
        {
            gCurrentSprite.pose = 0x3F;
            SoundPlay(0x281);
        }
    }
}

void ZazabiEatingSamus5Init(void)
{

}

/**
 * @brief 46568 | 44 | Handles zazabi eating samus (5)
 * 
 */
void ZazabiEatingSamus5(void)
{
    SpriteUtilTakeConstantDamage();

    if (gBossWork0 != 0)
    {
        gBossWork0 = 0;

        Zazabi_Empty();

        if (gSubSpriteData1.health == 60)
            gCurrentSprite.pose = 0x41;
        else
            gCurrentSprite.pose = 0x3B;
    }
}

void ZazabiSpittingSamusInit(void)
{

}

/**
 * @brief 465fc | 6c | Handles zazabi spitting samus
 * 
 */
void ZazabiSpittingSamus(void)
{
    if (gSubSpriteData1.currentAnimationFrame == 3 && gSubSpriteData1.animationDurationCounter == 1)
    {
        if (gAbilityRestingXPosition > gSamusData.xPosition)
            SamusBombBounce(FORCED_MOVEMENT_BOMB_JUMP_RIGHT);
        else
            SamusBombBounce(FORCED_MOVEMENT_BOMB_JUMP_LEFT);

        gSamusData.invincibilityTimer = 20;
        gBossWork0 = 0;
    }

    if (SpriteUtilCheckNearEndOfSubSpriteData1Animation())
        gCurrentSprite.pose = 0x43;
}

void ZazabiLandingAfterSpittingInit(void)
{

}

/**
 * @brief 466ac | 1c | Handles zazabi landing after spitting samus
 * 
 */
void ZazabiLandingAfterSpitting(void)
{
    if (SpriteUtilCheckNearEndOfSubSpriteData1Animation())
        gCurrentSprite.pose = 0x7;
}

/**
 * @brief 466c8 | 48 | Initializes zazabi to be dying
 * 
 */
void ZazabiDyingInit(void)
{
    gCurrentSprite.pose = 0x46;
    gCurrentSprite.status |= SPRITE_STATUS_ENABLE_MOSAIC;
    gCurrentSprite.health = 1;
    gCurrentSprite.invincibilityStunFlashTimer = 0;
    gCurrentSprite.paletteRow = 0;
    gCurrentSprite.xParasiteTimer = ARRAY_SIZE(sXParasiteMosaicValues);
    gCurrentSprite.unk_8 = 1;

    ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x2F);
    unk_3b1c(0x286);
}

/**
 * @brief 46710 | 2bc | Handles zazabi dying
 * 
 */
void ZazabiDying(void)
{
    u16 spriteY;
    u16 spriteX;

    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    gCurrentSprite.xParasiteTimer--;

    spriteY = gSubSpriteData1.yPosition + ZAZABI_HEIGHT + HALF_BLOCK_SIZE;
    spriteX = gSubSpriteData1.xPosition;

    if (gCurrentSprite.unk_8 != 0)
    {
        switch (gCurrentSprite.xParasiteTimer)
        {
            case 40:
                ParticleSet(spriteY - BLOCK_SIZE, spriteX, PE_0x25);
                ParticleSet(spriteY - BLOCK_SIZE * 2, spriteX, PE_0x26);
                break;

            case 30:
                ParticleSet(spriteY - BLOCK_SIZE * 3, spriteX + HALF_BLOCK_SIZE, PE_0x25);
                break;

            case 20:
                ParticleSet(spriteY - BLOCK_SIZE, spriteX - QUARTER_BLOCK_SIZE, PE_0x26);
                break;

            case 10:
                ParticleSet(spriteY - BLOCK_SIZE * 4, spriteX + QUARTER_BLOCK_SIZE, PE_0x25);
                break;

            case 0:
                gCurrentSprite.unk_8 = 0;
                gCurrentSprite.xParasiteTimer = ARRAY_SIZE(sXParasiteMosaicValues);
                break;
        }

        return;
    }

    switch (gCurrentSprite.xParasiteTimer)
    {
        case 40:
            ParticleSet(spriteY - BLOCK_SIZE * 3, spriteX - BLOCK_SIZE, PE_0x26);
            ParticleSet(spriteY - HALF_BLOCK_SIZE, spriteX + BLOCK_SIZE, PE_0x25);
            break;

        case 30:
            ParticleSet(spriteY - BLOCK_SIZE * 4, spriteX + (HALF_BLOCK_SIZE - PIXEL_SIZE), PE_0x26);
            ParticleSet(spriteY - BLOCK_SIZE, spriteX - HALF_BLOCK_SIZE, PE_0x25);
            break;

        case 20:
            ParticleSet(spriteY - HALF_BLOCK_SIZE, spriteX + BLOCK_SIZE, PE_0x26);
            ParticleSet(spriteY - BLOCK_SIZE * 3, spriteX - BLOCK_SIZE, PE_0x25);
            break;

        case 10:
            ParticleSet(spriteY - BLOCK_SIZE, spriteX - (HALF_BLOCK_SIZE - PIXEL_SIZE), PE_0x26);
            ParticleSet(spriteY - HALF_BLOCK_SIZE, spriteX + HALF_BLOCK_SIZE, PE_0x25);
            break;

        case 0:
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
            gCurrentSprite.spriteId = gCoreXFormationSpriteId;
            break;
    }

    if (gCurrentSprite.xParasiteTimer < 20)
    {
        SpriteLoadGfx(gCoreXFormationSpriteId, 0, gCurrentSprite.xParasiteTimer);
    }
    else if (gCurrentSprite.xParasiteTimer == 20)
    {
        SpriteLoadPal(gCoreXFormationSpriteId, 0, 5);
    }
}

void ZazabiPartInit(void)
{
    // https://decomp.me/scratch/UCLOv
}

void ZazabiPartDefault(void)
{

}

void ZazabiPartMouth(void)
{

}

void ZazabiPartEye(void)
{

}

void Zazabi(void)
{

}

void ZazabiPart(void)
{

}
