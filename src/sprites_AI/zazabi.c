#include "sprites_AI/zazabi.h"
#include "macros.h"
#include "globals.h"

#include "data/frame_data_pointers.h"
#include "data/sprite_data.h"
#include "data/sprites/core_x.h"
#include "data/sprites/x_parasite.h"
#include "data/sprites/zazabi.h"

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
    MultiSpriteDataInfo_T pData;
    u16 oamIdx;

    pData = gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].pData;
    oamIdx = pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX];
    
    if (gSubSpriteData1.health == 40)
    {
        if (gCurrentSprite.pOam != sZazabiFrameDataPointers1[oamIdx])
        {
            gCurrentSprite.pOam = sZazabiFrameDataPointers1[oamIdx];
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
    else if (gSubSpriteData1.health == 60)
    {
        if (gCurrentSprite.pOam != sZazabiFrameDataPointers2[oamIdx])
        {
            gCurrentSprite.pOam = sZazabiFrameDataPointers2[oamIdx];
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
    else if (gSubSpriteData1.health == 80)
    {
        if (gCurrentSprite.pOam != sZazabiFrameDataPointers3[oamIdx])
        {
            gCurrentSprite.pOam = sZazabiFrameDataPointers3[oamIdx];
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
    else
    {
        if (gCurrentSprite.pOam != sZazabiFrameDataPointers4[oamIdx])
        {
            gCurrentSprite.pOam = sZazabiFrameDataPointers4[oamIdx];
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }

    gCurrentSprite.yPosition = gSubSpriteData1.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];
    gCurrentSprite.xPosition = gSubSpriteData1.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
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
                SPRITE_SET_ABSOLUTE_PALETTE_ROW(gCurrentSprite, SPRITE_FLASHING_PALETTE_ROW);
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
            if (gProjectileData[i].type == PROJ_TYPE_CHARGED_CHARGE_BEAM)
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
                gProjectileData[i].status |= PROJ_STATUS_LOW_OAM_PRIORITY;
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

    if (gCurrentSprite.status & SS_FACING_RIGHT)
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
        gCurrentSprite.pose = ZAZABI_POSE_IDLE_INIT;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
}

/**
 * @brief 4566c | 1dc | Initializes zazabi
 * 
 */
void ZazabiInit(void)
{
    u8 ramSlot;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.roomSlot = ZAZABI_PART_EYE;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    gSubSpriteData1.health = gCurrentSprite.health;
    gSubSpriteData1.yPosition = gCurrentSprite.yPosition;
    gSubSpriteData1.xPosition = gCurrentSprite.xPosition;

    gSubSpriteData1.pMultiOam = sZazabiMultiOam_Idle4;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    }
    else
    {
        gCurrentSprite.pose = ZAZABI_POSE_IDLE_INIT;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_ZAZABI_PART, ZAZABI_PART_0, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_ZAZABI_PART, ZAZABI_PART_MOUTH, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_ZAZABI_PART, ZAZABI_PART_HAIR, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_ZAZABI_PART, ZAZABI_PART_EYE_SHELL, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_ZAZABI_PART, ZAZABI_PART_PUPIL, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_ZAZABI_PART, ZAZABI_PART_UPPER_SHELL, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_ZAZABI_PART, ZAZABI_PART_MIDDLE_SHELL, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    ramSlot = SpriteSpawnSecondary(SSPRITE_ZAZABI_PART, ZAZABI_PART_LOWER_SHELL, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);

    if (ramSlot == UCHAR_MAX)
    {
        gCurrentSprite.status = 0;
        return;
    }

    gBossWork0 = FALSE;
}

/**
 * @brief 45848 | bc | Initializes zazabi to be idle
 * 
 */
void ZazabiIdleInit(void)
{
    u16 currentHealth;

    currentHealth = gCurrentSprite.health;

    if (gSubSpriteData1.health == 80)
    {
        if (currentHealth <= 60)
        {
            gSubSpriteData1.health = 60;
            gCurrentSprite.health = 60;
        }
    }
    else if (gSubSpriteData1.health == 60)
    {
        if (currentHealth <= 40)
        {
            gSubSpriteData1.health = 40;
            gCurrentSprite.health = 40;
        }
    }
    else if (gSubSpriteData1.health == 40)
    {
        if (currentHealth == 0)
        {
            gSubSpriteData1.health = 0;
        }
    }
    else
    {
        if (currentHealth <= 80)
        {
            gSubSpriteData1.health = 80;
            gCurrentSprite.health = 80;
        }
    }

    if (gSubSpriteData1.health == 40 || gSubSpriteData1.health == 0)
    {
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Idle1;
        gCurrentSprite.work1 = 1;
    }
    else if (gSubSpriteData1.health == 60)
    {
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Idle2;
        gCurrentSprite.work1 = 1;
    }
    else if (gSubSpriteData1.health == 80)
    {
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Idle3;
        gCurrentSprite.work1 = 2;
    }
    else
    {
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Idle4;
        gCurrentSprite.work1 = 3;
    }

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    if (gSubSpriteData1.health != 0)
        gCurrentSprite.pose = ZAZABI_POSE_IDLE;
    else
        gCurrentSprite.pose = ZAZABI_POSE_DYING_INIT;
}

/**
 * @brief 45904 | 2c | Handles zazabi being idle
 * 
 */
void ZazabiIdle(void)
{
    if (SpriteUtilCheckNearEndSubSprite1Anim())
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
            gCurrentSprite.pose = ZAZABI_POSE_CRAWLING_INIT;
    }
}

/**
 * @brief 45930 | 70 | Initializes zazabi to be crawling
 * 
 */
void ZazabiCrawlingInit(void)
{
    if (gSubSpriteData1.health == 40)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Crawling1;
    else if (gSubSpriteData1.health == 60)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Crawling2;
    else if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Crawling3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Crawling4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_CRAWLING;

    if (gSubSpriteData1.health == 40)
        gCurrentSprite.work1 = 60 + gSpriteRandomNumber * 8;
    else
        gCurrentSprite.work1 = 60 * 2;
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
        gCurrentSprite.status ^= SS_FACING_RIGHT;

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        return;
    }

    if (gSubSpriteData1.health == 40)
    {
        if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 8, BLOCK_SIZE * 6) != NSLR_OUT_OF_RANGE)
        {
            gCurrentSprite.pose = ZAZABI_POSE_JUMP_WARNING_INIT;
            gCurrentSprite.work3 = 0;
        }
    }
    else
    {
        gCurrentSprite.pose = ZAZABI_POSE_JUMP_WARNING_INIT;
        gCurrentSprite.work3 = gSpriteRandomNumber / 4;

        if (gSubSpriteData1.health == 60)
            gCurrentSprite.work3 += 2;
        else if (gSubSpriteData1.health == 80)
            gCurrentSprite.work3 += 1;
    }
}

/**
 * @brief 45a88 | 50 | Initializes zazabi to do a jump warning
 * 
 */
void ZazabiJumpWarningInit(void)
{
    if (gSubSpriteData1.health == 40)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpWarning1;
    else if (gSubSpriteData1.health == 60)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpWarning2;
    else if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpWarning3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpWarning4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_JUMP_WARNING;
}

/**
 * @brief 45ad8 | 44 | Handles zazabi doing a jump warning
 * 
 */
void ZazabiJumpWarning(void)
{
    if (SpriteUtilCheckNearEndSubSprite1Anim())
    {
        gCurrentSprite.pose = ZAZABI_POSE_JUMPING_INIT;

        ParticleSet(gSubSpriteData1.yPosition + ZAZABI_HEIGHT + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE,
            gSubSpriteData1.xPosition - (ZAZABI_WIDTH - QUARTER_BLOCK_SIZE - EIGHTH_BLOCK_SIZE), PE_SMOKE);

        ParticleSet(gSubSpriteData1.yPosition + ZAZABI_HEIGHT + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE,
            gSubSpriteData1.xPosition + (ZAZABI_WIDTH - QUARTER_BLOCK_SIZE - EIGHTH_BLOCK_SIZE), PE_SMOKE);
    }
}

/**
 * @brief 45b1c | 130 | Initializes zazabi to be jumping
 * 
 */
void ZazabiJumpingInit(void)
{
    SoundPlay(0x27c);

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_JUMPING;
    gCurrentSprite.work4 = 0;

    SpriteUtilMakeSpriteFaceSamusDirection();

    if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 8, BLOCK_SIZE * 2) != NSLR_OUT_OF_RANGE)
        gCurrentSprite.work2 = FALSE;
    else
        gCurrentSprite.work2 = TRUE;

    if (!gCurrentSprite.work2)
    {
        if (gSubSpriteData1.health == 40)
            gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingSmall1;
        else if (gSubSpriteData1.health == 60)
            gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingSmall2;
        else if (gSubSpriteData1.health == 80)
            gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingSmall3;
        else
            gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingSmall4;
    }
    else
    {
        if (gSubSpriteData1.health == 40)
        {
            if (gCurrentSprite.status & SS_FACING_RIGHT)
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingBigRight1;
            else    
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingBigLeft1;
        }
        else if (gSubSpriteData1.health == 60)
        {
            if (gCurrentSprite.status & SS_FACING_RIGHT)
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingBigRight2;
            else    
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingBigLeft2;
        }
        else if (gSubSpriteData1.health == 80)
        {
            if (gCurrentSprite.status & SS_FACING_RIGHT)
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingBigRight3;
            else    
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingBigLeft3;
        }
        else
        {
            if (gCurrentSprite.status & SS_FACING_RIGHT)
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingBigRight4;
            else    
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_JumpingBigLeft4;
        }
    }
}

/**
 * @brief 45c4c | d8 | Handles zazabi jumping
 * 
 */
void ZazabiJumping(void)
{
    u8 offset;
    s16 movement;

    if (gCurrentSprite.work3 == 0)
    {
        offset = gCurrentSprite.work4;
        movement = sZazabiJumpingSpeedMouthOpened[offset];

        if (movement == SHORT_MAX)
        {
            gCurrentSprite.pose = ZAZABI_POSE_FALLING_INIT;
        }
        else
        {
            gCurrentSprite.work4++;
            gSubSpriteData1.yPosition += movement;
        }

        if (gCurrentSprite.work2 != 0)
            ZazabiXMovement(PIXEL_SIZE);
    }
    else
    {
        offset = gCurrentSprite.work4;

        if (gSubSpriteData1.health == 80)
            movement = sZazabiJumpingSpeed3[offset];
        else if (gSubSpriteData1.health == 60)
            movement = sZazabiJumpingSpeed2[offset];
        else
            movement = sZazabiJumpingSpeed4[offset];

        if (movement == SHORT_MAX)
        {
            gCurrentSprite.pose = ZAZABI_POSE_FALLING_INIT;
        }
        else
        {
            offset++;
            gCurrentSprite.work4 = offset;
            gSubSpriteData1.yPosition += movement;
        }

        if (gCurrentSprite.work2 != 0)
            ZazabiXMovement(PIXEL_SIZE * 2);
        else
            ZazabiXMovement(PIXEL_SIZE / 2);
    }
}

/**
 * @brief 45d24 | 208 | Initializes zazabi to be falling
 * 
 */
void ZazabiFallingInit(void)
{
    if (gCurrentSprite.work3 == 0)
        SoundPlay(0x27e);

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_FALLING;
    gCurrentSprite.work4 = 0;

    if (gSubSpriteData1.health == 40)
        gCurrentSprite.work1 = 10 * 1;
    else if (gSubSpriteData1.health == 60)
        gCurrentSprite.work1 = 10 * 2;
    else if (gSubSpriteData1.health == 80)
        gCurrentSprite.work1 = 10 * 4;
    else
        gCurrentSprite.work1 = 10 * 6;

    if (!gCurrentSprite.work2)
    {
        if (gSubSpriteData1.health == 40)
        {
            gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingSlowMouthOpened1;
        }
        else if (gSubSpriteData1.health == 60)
        {
            if (gCurrentSprite.work3 == 0)
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingSlowMouthOpened2;
            else
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingSlow2;
        }
        else if (gSubSpriteData1.health == 80)
        {
            if (gCurrentSprite.work3 == 0)
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingSlowMouthOpened3;
            else
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingSlow3;
        }
        else
        {
            if (gCurrentSprite.work3 == 0)
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingSlowMouthOpened4;
            else
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingSlow4;
        }
    }
    else
    {
        if (gSubSpriteData1.health == 40)
        {
            if (gCurrentSprite.status & SS_FACING_RIGHT)
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingMouthOpenedRight1;
            else
                gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingMouthOpenedLeft1;
        }
        else if (gSubSpriteData1.health == 60)
        {
            if (gCurrentSprite.work3 == 0)
            {
                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingMouthOpenedRight2;
                else
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingMouthOpenedLeft2;
            }
            else
            {
                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingRight2;
                else
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingLeft2;
            }
        }
        else if (gSubSpriteData1.health == 80)
        {
            if (gCurrentSprite.work3 == 0)
            {
                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingMouthOpenedRight3;
                else
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingMouthOpenedLeft3;
            }
            else
            {
                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingRight3;
                else
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingLeft3;
            }
        }
        else
        {
            if (gCurrentSprite.work3 == 0)
            {
                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingMouthOpenedRight4;
                else
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingMouthOpenedLeft4;
            }
            else
            {
                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingRight4;
                else
                    gSubSpriteData1.pMultiOam = sZazabiMultiOam_FallingLeft4;
            }
        }
    }
}

/**
 * @brief 45f2c | 288 | Handles zazabi falling
 * 
 */
void ZazabiFalling(void)
{
    u8 offset;
    s16 movement;
    u32 blockTop;

    if (gCurrentSprite.work3 == 0)
    {
        if (gCurrentSprite.work1 != 0)
        {
            gCurrentSprite.work1--;
        }
        else
        {
            offset = gCurrentSprite.work4;
            movement = sZazabiFallingSpeedMouthOpened[offset];

            if (movement == SHORT_MAX)
            {
                movement = sZazabiFallingSpeedMouthOpened[offset - 1];
                gSubSpriteData1.yPosition += movement;
            }
            else
            {
                offset++;
                gCurrentSprite.work4 = offset;
                gSubSpriteData1.yPosition += movement;
            }
        }

        if (gCurrentSprite.work2 != 0)
        {
            if (gSubSpriteData1.currentAnimationFrame < 5)
            {
                SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + (BLOCK_SIZE * 5 + HALF_BLOCK_SIZE - ONE_SUB_PIXEL * 2), gSubSpriteData1.xPosition);

                if (gPreviousCollisionCheck != COLLISION_AIR)
                {
                    gSubSpriteData1.animationDurationCounter = 0;
                    gSubSpriteData1.currentAnimationFrame = 5;
                }
                else if (gSubSpriteData1.currentAnimationFrame == 4)
                {
                    gSubSpriteData1.animationDurationCounter = 0;
                }
            }
        }
        else
        {
            if (gSubSpriteData1.currentAnimationFrame < 3)
            {
                SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + (BLOCK_SIZE * 5 + HALF_BLOCK_SIZE - ONE_SUB_PIXEL * 2), gSubSpriteData1.xPosition);

                if (gPreviousCollisionCheck != COLLISION_AIR)
                {
                    gSubSpriteData1.animationDurationCounter = 0;
                    gSubSpriteData1.currentAnimationFrame = 3;
                }
                else if (gSubSpriteData1.currentAnimationFrame == 2)
                {
                    gSubSpriteData1.animationDurationCounter = 0;
                }
            }
        }

        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gSubSpriteData1.yPosition + BLOCK_SIZE * 5, gSubSpriteData1.xPosition);

        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            gSubSpriteData1.yPosition = blockTop - BLOCK_SIZE * 5;
            gCurrentSprite.pose = ZAZABI_POSE_LANDING_MOUTH_OPEN_INIT;

            ParticleSet(gSubSpriteData1.yPosition + BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE,
                gSubSpriteData1.xPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE), PE_SMOKE);
            ParticleSet(gSubSpriteData1.yPosition + BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE,
                gSubSpriteData1.xPosition + (BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE), PE_SMOKE);

            SoundPlay(0x27D);
        }

        return;
    }

    offset = gCurrentSprite.work4;
    movement = sZazabiFallingSpeed[offset];

    if (movement == SHORT_MAX)
    {
        movement = sZazabiFallingSpeed[offset - 1];
        gSubSpriteData1.yPosition += movement;
    }
    else
    {
        offset++;
        gCurrentSprite.work4 = offset;
        gSubSpriteData1.yPosition += movement;
    }

    if (gCurrentSprite.work2 != 0)
    {
        ZazabiXMovement(PIXEL_SIZE * 2);

        if (gSubSpriteData1.currentAnimationFrame < 5)
        {
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + BLOCK_SIZE * 6 - PIXEL_SIZE, gSubSpriteData1.xPosition);

            if (gPreviousCollisionCheck != COLLISION_AIR)
            {
                gSubSpriteData1.animationDurationCounter = 0;
                gSubSpriteData1.currentAnimationFrame = 5;
            }
            else if (gSubSpriteData1.currentAnimationFrame == 4)
            {
                gSubSpriteData1.animationDurationCounter = 0;
            }
        }
    }
    else
    {
        ZazabiXMovement(PIXEL_SIZE / 2);
        
        if (gSubSpriteData1.currentAnimationFrame < 3)
        {
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + BLOCK_SIZE * 6 - PIXEL_SIZE, gSubSpriteData1.xPosition);

            if (gPreviousCollisionCheck != COLLISION_AIR)
            {
                gSubSpriteData1.animationDurationCounter = 0;
                gSubSpriteData1.currentAnimationFrame = 3;
            }
            else if (gSubSpriteData1.currentAnimationFrame == 2)
            {
                gSubSpriteData1.animationDurationCounter = 0;
            }
        }
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gSubSpriteData1.yPosition + BLOCK_SIZE * 5, gSubSpriteData1.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gSubSpriteData1.yPosition = blockTop - BLOCK_SIZE * 5 ;
        gCurrentSprite.pose = ZAZABI_POSE_LANDING_INIT;
        gCurrentSprite.work3--;

        ParticleSet(gSubSpriteData1.yPosition + BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE,
            gSubSpriteData1.xPosition - (HALF_BLOCK_SIZE - PIXEL_SIZE), PE_SMOKE);
        ParticleSet(gSubSpriteData1.yPosition + BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE,
            gSubSpriteData1.xPosition + (HALF_BLOCK_SIZE - PIXEL_SIZE), PE_SMOKE);

        SoundPlay(0x27D);
    }
}

/**
 * @brief 461b4 | 64 | Initializes zazabi to be landing with its mouth opened
 * 
 */
void ZazabiLandingMouthOpenInit(void)
{
    if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
        SoundPlay(0x280);

    if (gSubSpriteData1.health == 40)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_LandingMouthOpen1;
    else if (gSubSpriteData1.health == 60)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_LandingMouthOpen2;
    else if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_LandingMouthOpen3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_LandingMouthOpen4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_LANDING_MOUTH_OPEN;
}

/**
 * @brief 46218 | 80 | Handles zazabi landing with its mouth open
 * 
 */
void ZazabiLandingMouthOpen(void)
{
    if (gSubSpriteData1.currentAnimationFrame == 1 && gSubSpriteData1.animationDurationCounter == 1 && gSubSpriteData1.health != 40)
        SoundPlay(0x27F);

    if (SpriteUtilCheckNearEndSubSprite1Anim())
    {
        if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
        {
            if (gSubSpriteData1.health == 60)
                gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_5_INIT;
            else if (gSubSpriteData1.health == 80)
                gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_3_INIT;
            else
                gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_1_INIT;
        }
        else
        {
            gCurrentSprite.pose = ZAZABI_POSE_IDLE_INIT;
        }
    }
}

/**
 * @brief 46298 | 50 | Initializes zazabi to be landing
 * 
 */
void ZazabiLandingInit(void)
{
    if (gSubSpriteData1.health == 40)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Landing1;
    else if (gSubSpriteData1.health == 60)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Landing2;
    else if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Landing3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_Landing4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_LANDING;
}

/**
 * @brief 462e8 | 1c | Handles zazabi landing
 * 
 */
void ZazabiLanding(void)
{
    if (SpriteUtilCheckNearEndSubSprite1Anim())
        gCurrentSprite.pose = ZAZABI_POSE_JUMPING_INIT;
}

/**
 * @brief 46304 | 2c | Initializes zazabi to be eating samus (1)
 * 
 */
void ZazabiEatingSamus1Init(void)
{
    gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus1;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_1;
    gCurrentSprite.work1 = 60;
}

/**
 * @brief 46330 | 54 | Handles zazabi eating samus (1)
 * 
 */
void ZazabiEatingSamus1(void)
{
    SpriteUtilTakeConstantDamageFromZazabi();

    if (gBossWork0)
    {
        gBossWork0 = FALSE;
        Zazabi_Empty();
        gCurrentSprite.pose = ZAZABI_POSE_SPITTING_SAMUS_INIT;
    }
    else
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
        {
            gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_2_INIT;
            SoundPlay(0x281);
        }
    }
}

/**
 * @brief 46384 | 24 | Initializes zazabi to be eating samus (2)
 * 
 */
void ZazabiEatingSamus2Init(void)
{
    gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus2;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_2;
}

/**
 * @brief 463a8 | 4c | Handles zazabi eating samus (2)
 * 
 */
void ZazabiEatingSamus2(void)
{
    SpriteUtilTakeConstantDamageFromZazabi();

    if (gBossWork0)
    {
        gBossWork0 = FALSE;
        Zazabi_Empty();
        gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_1_INIT;
    }
    else
    {
        if (SpriteUtilCheckNearEndSubSprite1Anim())
        {
            gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_3_INIT;
            SoundPlay(0x281);
        }
    }
}

/**
 * @brief 463f4 | 3c | Initializes zazabi to be eating samus (3)
 * 
 */
void ZazabiEatingSamus3Init(void)
{
    if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus3_3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus3_4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_3;
    gCurrentSprite.work1 = 60;
}

/**
 * @brief 46430 | 70 | Handles zazabi eating samus (3)
 * 
 */
void ZazabiEatingSamus3(void)
{
    SpriteUtilTakeConstantDamageFromZazabi();

    if (gBossWork0)
    {
        gBossWork0 = FALSE;
        Zazabi_Empty();

        if (gSubSpriteData1.health == 80)
            gCurrentSprite.pose = ZAZABI_POSE_SPITTING_SAMUS_INIT;
        else
            gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_1_INIT;
    }
    else
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
        {
            gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_4_INIT;
            SoundPlay(0x281);
        }
    }
}

/**
 * @brief 464a0 | 38 | Initializes zazabi to be eating samus (4)
 * 
 */
void ZazabiEatingSamus4Init(void)
{
    if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus4_3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus4_4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_4;
}

/**
 * @brief 464d8 | 4c | Handles zazabi eating samus (4)
 * 
 */
void ZazabiEatingSamus4(void)
{
    SpriteUtilTakeConstantDamageFromZazabi();

    if (gBossWork0)
    {
        gBossWork0 = FALSE;
        Zazabi_Empty();
        gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_3_INIT;
    }
    else
    {
        if (SpriteUtilCheckNearEndSubSprite1Anim())
        {
            gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_5_INIT;
            SoundPlay(0x281);
        }
    }
}

/**
 * @brief 46524 | 44 | Initializes zazabi to be eating samus (5)
 * 
 */
void ZazabiEatingSamus5Init(void)
{
    if (gSubSpriteData1.health == 60)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus5_2;
    else if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus5_3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_EatingSamus5_4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_5;
}

/**
 * @brief 46568 | 44 | Handles zazabi eating samus (5)
 * 
 */
void ZazabiEatingSamus5(void)
{
    SpriteUtilTakeConstantDamageFromZazabi();

    if (gBossWork0)
    {
        gBossWork0 = FALSE;

        Zazabi_Empty();

        if (gSubSpriteData1.health == 60)
            gCurrentSprite.pose = ZAZABI_POSE_SPITTING_SAMUS_INIT;
        else
            gCurrentSprite.pose = ZAZABI_POSE_EATING_SAMUS_3_INIT;
    }
}

/**
 * @brief 465ac | 50 | Initializes zazabi to be spitting samus
 * 
 */
void ZazabiSpittingSamusInit(void)
{
    SoundPlayNotAlreadyPlaying(0x283);

    if (gSubSpriteData1.health == 60)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_SpittingSamus2;
    else if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_SpittingSamus3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_SpittingSamus4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_SPITTING_SAMUS;
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
        gBossWork0 = FALSE;
    }

    if (SpriteUtilCheckNearEndSubSprite1Anim())
        gCurrentSprite.pose = ZAZABI_POSE_LANDING_AFTER_SPITTING_INIT;
}

/**
 * @brief 46668 | 44 | Initializes zazabi to be landing after spitting
 * 
 */
void ZazabiLandingAfterSpittingInit(void)
{
    if (gSubSpriteData1.health == 60)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_LandingAfterSpitting2;
    else if (gSubSpriteData1.health == 80)
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_LandingAfterSpitting3;
    else
        gSubSpriteData1.pMultiOam = sZazabiMultiOam_LandingAfterSpitting4;

    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;

    gCurrentSprite.pose = ZAZABI_POSE_LANDING_AFTER_SPITTING;
}

/**
 * @brief 466ac | 1c | Handles zazabi landing after spitting samus
 * 
 */
void ZazabiLandingAfterSpitting(void)
{
    if (SpriteUtilCheckNearEndSubSprite1Anim())
        gCurrentSprite.pose = ZAZABI_POSE_IDLE_INIT;
}

/**
 * @brief 466c8 | 48 | Initializes zazabi to be dying
 * 
 */
void ZazabiDyingInit(void)
{
    gCurrentSprite.pose = ZAZABI_POSE_DYING;
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.health = 1;
    gCurrentSprite.invincibilityStunFlashTimer = 0;
    gCurrentSprite.paletteRow = 0;
    gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
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
                gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
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

    if (gCurrentSprite.xParasiteTimer < sizeof(sHiJumpCoreXGfx) / 512)
    {
        SpriteLoadGfx(gCoreXFormationSpriteId, 0, gCurrentSprite.xParasiteTimer);
    }
    else if (gCurrentSprite.xParasiteTimer == sizeof(sHiJumpCoreXGfx) / 512)
    {
        SpriteLoadPal(gCoreXFormationSpriteId, 0, ARRAY_SIZE(sHiJumpCoreXPal) / 16);
    }
}

/**
 * @brief 469cc | 218 | Initializes a zazabi part
 * 
 */
void ZazabiPartInit(void)
{
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;

    gCurrentSprite.pose = 0x2;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.health = 1;

    if (gCurrentSprite.roomSlot < ZAZABI_PART_EYE)
        gCurrentSprite.drawOrder = 11;
    else
        gCurrentSprite.drawOrder = 13;

    switch (gCurrentSprite.roomSlot)
    {
        case ZAZABI_PART_0:
            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

            gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
            gCurrentSprite.hitboxRight = BLOCK_SIZE;
            break;

        case ZAZABI_PART_MOUTH:
            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -PIXEL_SIZE;
            gCurrentSprite.hitboxBottom = PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
            gCurrentSprite.hitboxRight = PIXEL_SIZE;

            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_NOT_DRAWN;
            break;

        case ZAZABI_PART_HAIR:
            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -BLOCK_SIZE;
            gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.hitboxRight = BLOCK_SIZE + HALF_BLOCK_SIZE;
            break;

        case ZAZABI_PART_EYE_SHELL:
            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.hitboxBottom = BLOCK_SIZE + HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
            gCurrentSprite.hitboxRight = BLOCK_SIZE;
            break;

        case ZAZABI_PART_PUPIL:
            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -PIXEL_SIZE;
            gCurrentSprite.hitboxBottom = PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
            gCurrentSprite.hitboxRight = PIXEL_SIZE;

            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_NOT_DRAWN;
            break;

        case ZAZABI_PART_UPPER_SHELL:
            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -(HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;
            break;

        case ZAZABI_PART_MIDDLE_SHELL:
            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(HALF_BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;
            break;

        case ZAZABI_PART_LOWER_SHELL:
            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE + PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;
            break;

        default:
            gCurrentSprite.status = 0;
    }

    ZazabiSyncSubSprites();
}

/**
 * @brief 46be4 | 378 | Default behavior for zazabi parts
 * 
 */
void ZazabiPartDefault(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    switch (gSpriteData[ramSlot].pose)
    {
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            gCurrentSprite.status = 0;
            break;

        case SPRITE_POSE_SPAWNING_FROM_X:
        case ZAZABI_POSE_DYING_INIT:
        case ZAZABI_POSE_DYING:
            gCurrentSprite.ignoreSamusCollisionTimer = 1;

            if (gSpriteData[ramSlot].status & SS_ENABLE_MOSAIC)
            {
                gCurrentSprite.status |= SS_ENABLE_MOSAIC;
            }
            else
            {
                gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
            }
            break;

        case ZAZABI_POSE_IDLE_INIT:
        case ZAZABI_POSE_IDLE:
            gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;

            if (!(gCurrentSprite.status & SS_NOT_DRAWN))
                gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
            break;

        case ZAZABI_POSE_FALLING_INIT:
        case ZAZABI_POSE_FALLING:
            if (gCurrentSprite.roomSlot != ZAZABI_PART_0)
                break;

            if (gSpriteData[ramSlot].work3 != 0)
                break;

            if (gSubSpriteData1.health == 40)
            {
                if (gCurrentSprite.pOam == sZazabi_3729f8)
                {
                    gCurrentSprite.hitboxTop = -(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
                    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
                    gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
                    gCurrentSprite.hitboxRight = BLOCK_SIZE;
                }
            }
            else
            {
                if (gCurrentSprite.pOam == sZazabiPartOam_MouthOpened)
                {
                    gCurrentSprite.samusCollision = SSC_ZAZABI_CAN_GRAB;

                    gCurrentSprite.hitboxTop = -BLOCK_SIZE;
                    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
                    gCurrentSprite.hitboxLeft = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);
                    gCurrentSprite.hitboxRight = (BLOCK_SIZE + QUARTER_BLOCK_SIZE);
                }

                if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
                {
                    gSamusData.yPosition = gCurrentSprite.yPosition + HALF_BLOCK_SIZE;
                    gSamusData.xPosition = gCurrentSprite.xPosition;
                }
            }

            ZazabiEnableProjectilesToPassThrough();
            break;

        case ZAZABI_POSE_LANDING_MOUTH_OPEN_INIT:
            if (gCurrentSprite.roomSlot == ZAZABI_PART_0)
            {
                gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
                
                gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
                gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
                gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
                gCurrentSprite.hitboxRight = BLOCK_SIZE;

                if (gSamusData.pose != SPOSE_GRABBED_BY_ZAZABI)
                    break;

                gSamusData.yPosition = gCurrentSprite.yPosition + HALF_BLOCK_SIZE;
                gSamusData.xPosition = gCurrentSprite.xPosition;
            }

            if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
            {
                if (gCurrentSprite.roomSlot < ZAZABI_PART_EYE)
                    gCurrentSprite.drawOrder = 3;
                else
                    gCurrentSprite.drawOrder = 5;
            }
            break;

        case ZAZABI_POSE_LANDING_MOUTH_OPEN:
            if (gCurrentSprite.roomSlot == ZAZABI_PART_0)
            {
                if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
                {
                    gSamusData.yPosition = gCurrentSprite.yPosition + HALF_BLOCK_SIZE;
                    gSamusData.xPosition = gCurrentSprite.xPosition;
                }
            }
            break;

        case ZAZABI_POSE_EATING_SAMUS_1_INIT:
        case ZAZABI_POSE_EATING_SAMUS_1:
            if (gCurrentSprite.roomSlot == ZAZABI_PART_LOWER_SHELL)
            {
                if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
                {
                    gSamusData.yPosition = gCurrentSprite.yPosition + HALF_BLOCK_SIZE;
                    gSamusData.xPosition = gCurrentSprite.xPosition;
                }
            }
            break;

        case ZAZABI_POSE_EATING_SAMUS_2_INIT:
        case ZAZABI_POSE_EATING_SAMUS_2:
            if (gCurrentSprite.roomSlot == ZAZABI_PART_LOWER_SHELL)
            {
                if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
                {
                    if (gCurrentSprite.currentAnimationFrame == 0)
                    {
                        gSamusData.yPosition = gCurrentSprite.yPosition + HALF_BLOCK_SIZE;
                        gSamusData.xPosition = gCurrentSprite.xPosition;
                    }
                    else
                    {
                        gSamusData.yPosition = gCurrentSprite.yPosition;
                        gSamusData.xPosition = gCurrentSprite.xPosition;
                    }
                }
            }
            break;

        case ZAZABI_POSE_EATING_SAMUS_3_INIT:
        case ZAZABI_POSE_EATING_SAMUS_3:
            if (gCurrentSprite.roomSlot == ZAZABI_PART_MIDDLE_SHELL)
            {
                if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
                {
                    gSamusData.yPosition = gCurrentSprite.yPosition + HALF_BLOCK_SIZE;
                    gSamusData.xPosition = gCurrentSprite.xPosition;
                }
            }
            break;

        case ZAZABI_POSE_EATING_SAMUS_4_INIT:
        case ZAZABI_POSE_EATING_SAMUS_4:
            if (gCurrentSprite.roomSlot == ZAZABI_PART_MIDDLE_SHELL)
            {
                if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
                {
                    if (gCurrentSprite.currentAnimationFrame == 0)
                    {
                        gSamusData.yPosition = gCurrentSprite.yPosition + HALF_BLOCK_SIZE;
                        gSamusData.xPosition = gCurrentSprite.xPosition;
                    }
                    else
                    {
                        gSamusData.yPosition = gCurrentSprite.yPosition;
                        gSamusData.xPosition = gCurrentSprite.xPosition;
                    }
                }
            }
            break;

        case ZAZABI_POSE_EATING_SAMUS_5_INIT:
        case ZAZABI_POSE_EATING_SAMUS_5:
            if (gCurrentSprite.roomSlot == ZAZABI_PART_UPPER_SHELL)
            {
                if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
                {
                    gSamusData.yPosition = gCurrentSprite.yPosition + HALF_BLOCK_SIZE;
                    gSamusData.xPosition = gCurrentSprite.xPosition;
                }
            }
            break;

        case ZAZABI_POSE_SPITTING_SAMUS_INIT:
        case ZAZABI_POSE_SPITTING_SAMUS:
            if (gCurrentSprite.roomSlot == ZAZABI_PART_LOWER_SHELL)
            {
                if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
                {
                    gSamusData.yPosition = gCurrentSprite.yPosition + BLOCK_SIZE;
                    gSamusData.xPosition = gCurrentSprite.xPosition;
                }
            }

            if (gCurrentSprite.roomSlot < ZAZABI_PART_EYE)
                gCurrentSprite.drawOrder = 11;
            else
                gCurrentSprite.drawOrder = 13;
    }
}

/**
 * @brief 46f5c | 8c | Handles zazabi's mouth
 * 
 */
void ZazabiPartMouth(void)
{
    u8 ramSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].status & SS_ENABLE_MOSAIC)
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    else
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;

    if (gSpriteData[ramSlot].pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        gCurrentSprite.status = 0;
    }
    else
    {
        ZazabiSyncSubSprites();

        if (gCurrentSprite.pOam == sZazabi_372c80)
            gCurrentSprite.status |= SS_NOT_DRAWN;
        else
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
    }
}

/**
 * @brief 46fe8 | b8 | Handles zazabi's pupil
 * 
 */
void ZazabiPartPupil(void)
{
    u8 ramSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    switch (gSpriteData[ramSlot].pose)
    {
        case ZAZABI_POSE_DYING_INIT:
        case ZAZABI_POSE_DYING:
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            gCurrentSprite.status = 0;
            break;

        case ZAZABI_POSE_CRAWLING_INIT:
        case ZAZABI_POSE_CRAWLING:
        case ZAZABI_POSE_IDLE_INIT:
        case ZAZABI_POSE_IDLE:
            if (gCurrentSprite.pOam == sZazabiPartOam_PupilBlinking)
            {
                if (SpriteUtilCheckEndCurrentSpriteAnim())
                {
                    gCurrentSprite.pOam = sZazabiPartOam_PupilClosed;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;

                    gCurrentSprite.status |= SS_NOT_DRAWN;
                }
            }
            else if (gSpriteRandomNumber == 15)
            {
                gCurrentSprite.pOam = sZazabiPartOam_PupilBlinking;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;

                gCurrentSprite.status &= ~SS_NOT_DRAWN;
                SoundPlayNotAlreadyPlaying(0x287);
            }
            break;

        default:
            if (gCurrentSprite.pOam == sZazabiPartOam_PupilBlinking)
            {
                gCurrentSprite.pOam = sZazabiPartOam_PupilClosed;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;

                gCurrentSprite.status |= SS_NOT_DRAWN;
            }
    }
}

/**
 * @brief 470a0 | 24c | Zazabi AI
 * 
 */
void Zazabi(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    ZazabiProjectilesCollision();

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            ZazabiInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            ZazabiSpawningFromX();
            break;

        case SPRITE_POSE_UNINITIALIZED:
            ZazabiInit();
            break;

        case ZAZABI_POSE_IDLE_INIT:
            ZazabiIdleInit();

        case ZAZABI_POSE_IDLE:
            ZazabiIdle();
            break;

        case ZAZABI_POSE_CRAWLING_INIT:
            ZazabiCrawlingInit();

        case ZAZABI_POSE_CRAWLING:
            ZazabiCrawling();
            break;

        case ZAZABI_POSE_JUMP_WARNING_INIT:
            ZazabiJumpWarningInit();

        case ZAZABI_POSE_JUMP_WARNING:
            ZazabiJumpWarning();
            break;

        case ZAZABI_POSE_JUMPING_INIT:
            ZazabiJumpingInit();

        case ZAZABI_POSE_JUMPING:
            ZazabiJumping();
            break;

        case ZAZABI_POSE_FALLING_INIT:
            ZazabiFallingInit();

        case ZAZABI_POSE_FALLING:
            ZazabiFalling();
            break;

        case ZAZABI_POSE_LANDING_MOUTH_OPEN_INIT:
            ZazabiLandingMouthOpenInit();

        case ZAZABI_POSE_LANDING_MOUTH_OPEN:
            ZazabiLandingMouthOpen();
            break;

        case ZAZABI_POSE_LANDING_INIT:
            ZazabiLandingInit();

        case ZAZABI_POSE_LANDING:
            ZazabiLanding();
            break;

        case ZAZABI_POSE_EATING_SAMUS_1_INIT:
            ZazabiEatingSamus1Init();

        case ZAZABI_POSE_EATING_SAMUS_1:
            ZazabiEatingSamus1();
            break;

        case ZAZABI_POSE_EATING_SAMUS_2_INIT:
            ZazabiEatingSamus2Init();

        case ZAZABI_POSE_EATING_SAMUS_2:
            ZazabiEatingSamus2();
            break;

        case ZAZABI_POSE_EATING_SAMUS_3_INIT:
            ZazabiEatingSamus3Init();

        case ZAZABI_POSE_EATING_SAMUS_3:
            ZazabiEatingSamus3();
            break;

        case ZAZABI_POSE_EATING_SAMUS_4_INIT:
            ZazabiEatingSamus4Init();

        case ZAZABI_POSE_EATING_SAMUS_4:
            ZazabiEatingSamus4();
            break;

        case ZAZABI_POSE_EATING_SAMUS_5_INIT:
            ZazabiEatingSamus5Init();

        case ZAZABI_POSE_EATING_SAMUS_5:
            ZazabiEatingSamus5();
            break;

        case ZAZABI_POSE_SPITTING_SAMUS_INIT:
            ZazabiSpittingSamusInit();

        case ZAZABI_POSE_SPITTING_SAMUS:
            ZazabiSpittingSamus();
            break;

        case ZAZABI_POSE_LANDING_AFTER_SPITTING_INIT:
            ZazabiLandingAfterSpittingInit();

        case ZAZABI_POSE_LANDING_AFTER_SPITTING:
            ZazabiLandingAfterSpitting();
            break;

        case ZAZABI_POSE_DYING_INIT:
            ZazabiDyingInit();

        case ZAZABI_POSE_DYING:
            ZazabiDying();
    }

    SpriteUtilUpdateSubSpriteData1Animation();
    ZazabiSyncSubSprites();
}

/**
 * @brief 472ec | d0 | Zazabi part AI
 * 
 */
void ZazabiPart(void)
{
    if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
        gCurrentSprite.ignoreSamusCollisionTimer = 16;

    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED)
    {
        ZazabiPartInit();
        return;
    }

    switch (gCurrentSprite.roomSlot)
    {
        case ZAZABI_PART_PUPIL:
            ZazabiPartPupil();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;

        case ZAZABI_PART_MOUTH:
            ZazabiPartMouth();
            break;

        case ZAZABI_PART_UPPER_SHELL:
            if (gSubSpriteData1.health == 40)
            {
                ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x2F);
                gCurrentSprite.status = 0;
                unk_3b1c(0x284);
            }
            else
            {
                ZazabiPartDefault();
                ZazabiSyncSubSprites();
            }
            break;

        case ZAZABI_PART_MIDDLE_SHELL:
            if (gSubSpriteData1.health == 60)
            {
                ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x2F);
                gCurrentSprite.status = 0;
                unk_3b1c(0x284);
            }
            else
            {
                ZazabiPartDefault();
                ZazabiSyncSubSprites();
            }
            break;

        case ZAZABI_PART_LOWER_SHELL:
            if (gSubSpriteData1.health == 80)
            {
                ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x2F);
                gCurrentSprite.status = 0;
                unk_3b1c(0x284);
            }
            else
            {
                ZazabiPartDefault();
                ZazabiSyncSubSprites();
            }
            break;

        default:
            ZazabiPartDefault();
            ZazabiSyncSubSprites();
    }
}
