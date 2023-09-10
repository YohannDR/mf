#include "sprites_AI/sa_x_arc.h"
#include "sprites_AI/sa_x.h"
#include "macros.h"
#include "gba.h"
#include "globals.h"

#include "data/sprites/sa_x.h"
#include "data/sprite_data.h"
#include "data/engine_pointers.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"
#include "constants/sa_x.h"

#include "structs/sprite.h"
#include "structs/samus.h"
#include "structs/sa_x.h"

void SaXBossCheckCollisionRunning(void)
{

}

u8 SaXBossTrackSamus(void)
{

}

/**
 * @brief 1a564 | 34 | Initializes the SA-X (boss) to be running
 * 
 */
void SaXBossRunningInit(void)
{
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    if (!unk_15dd4())
        SaXSetPose(SA_X_POSE_RUNNING);
}

/**
 * @brief 1a598 | 4c | Handles the SA-X (boss) running
 * 
 */
void SaXBossRunning(void)
{
    if (SaXBossTrackSamus())
        return;

    SaXBossCheckCollisionRunning();

    if (gCurrentSprite.pose != 0x18)
        return;

    unk_11604(sSaXRunningSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXRunningSpeed) * 8 - 1)
        gCurrentSprite.work3++;
}

/**
 * @brief 1a5e4 | 3c | Initializes the SA-X (boss) to spin jump
 * 
 */
void SaXBossSpinJumpingInit(void)
{
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);
    gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;

    SaXSetPose(SA_X_POSE_MID_AIR);

    gCurrentSprite.work0 = 0;
}

void SaXBossSpinJumping(void)
{

}

/**
 * @brief 1a848 | 30 | Initializes the SA-X (boss) to be waiting to appear
 * 
 */
void SaXBossWaitingToAppearInit(void)
{
    gCurrentSprite.status |= SPRITE_STATUS_UNKNOWN_2000;
    gCurrentSprite.pose = 0x42;

    SaXSetPose(SA_X_POSE_FALLING);

    gCurrentSprite.work1 = 0;
}

void SaXBossWaitingToAppear(void)
{

}

/**
 * @brief 1a914 | 70 | Initializes the SA-X (boss)
 * 
 */
void SaXBossInit(void)
{
    if (!EventCheckOn_EnteredOperationsDeck())
    {
        gCurrentSprite.status = 0;
        return;
    }

    SaXInit();

    gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.xParasiteTimer = 0;
    
    gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
    SaXSetDirection();

    gCurrentSprite.work3 = 8;

    SaXBossWaitingToAppearInit();

    gBossWork2 = 0;
    gBossWork3 = 0;
    gSaXData.mosaic = FALSE;
}

/**
 * @brief 1a984 | 34 | Initializes the SA-X (boss) to be falling
 * 
 */
void SaXBossFallingInit(void)
{
    gCurrentSprite.pose = 0x16;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_FALLING);

    gCurrentSprite.work0 = 0;
}

/**
 * @brief 1a9b8 | bc | Handles the SA-X (boss) falling
 * 
 */
void SaXBossFalling(void)
{
    u8 offset;
    s16 movement;
    s32 blockTop;

    if (gCurrentSprite.work0 != 0)
    {
        if (gSaXData.pose != SA_X_POSE_STANDING)
            return;

        gCurrentSprite.pose = 0x17;

        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (gSaXVision.samusOnRight == FALSE)
                gCurrentSprite.pose = 0x39;
        }
        else
        {
            if (gSaXVision.samusOnRight == TRUE)
                gCurrentSprite.pose = 0x39;
        }

        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.work0 = 1;
        SaXSetPose(SA_X_POSE_LANDING);
        return;
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
}

/**
 * @brief 1aa74 | 24 | Initializes the SA-X (boss) to be turning around during a chase
 * 
 */
void SaXBossTurningAroundChaseInit(void)
{
    gCurrentSprite.pose = 0x3A;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_TURNING);
}

/**
 * @brief 1aa98 | 50 | Handles the SA-X (boss) turning around during a chase
 * 
 */
void SaXBossTurningAroundChase(void)
{
    if (gSaXData.pose != SA_X_POSE_STANDING)
        return;

    gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
    SaXSetDirection();

    if (gSamusData.pose == SPOSE_SCREW_ATTACKING)
    {
        gCurrentSprite.pose = 0x45;
        gCurrentSprite.work3 = 8;
    }
    else
    {
        gCurrentSprite.pose = 0x17;
    }
}

/**
 * @brief 1aae8 | 34 | Initializes the SA-X (boss) to be falling from a knockback
 * 
 */
void SaxBossFallingFromKnockbackInit(void)
{
    gCurrentSprite.pose = 0x44;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_FALLING);

    gCurrentSprite.work0 = 0;
}

/**
 * @brief 1ab1c | e0 | Handles the SA-X (boss) falling from a knockback
 * 
 */
void SaxBossFallingFromKnockback(void)
{
    u8 offset;
    s16 movement;
    s32 blockTop;

    if (gCurrentSprite.work0 != 0)
    {
        if (gSaXData.pose != SA_X_POSE_STANDING)
            return;

        if (gCurrentSprite.health == 0)
        {
            gCurrentSprite.pose = 0x51;
            return;
        }

        gCurrentSprite.status &= ~SPRITE_STATUS_IGNORE_PROJECTILES;
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;

        if (MOD_AND(gSpriteRandomNumber, 2))
        {
            gCurrentSprite.pose = 0x47;
            gCurrentSprite.work3 = 40;
        }
        else
        {
            gCurrentSprite.pose = 0x49;
            gCurrentSprite.work3 = 62;
        }

        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.work0 = 1;
        SaXSetPose(SA_X_POSE_LANDING);
        return;
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
}

/**
 * @brief 1abfc | 94 | Initializes the SA-X (boss) to do a variable jump height
 * 
 */
void SaXBossVariableJumpHeightInit(void)
{
    if (gCurrentSprite.pose == 0x49)
        gCurrentSprite.pose = 0x4A;
    else if (gCurrentSprite.pose == 0x47)
        gCurrentSprite.pose = 0x48;
    else
        gCurrentSprite.pose = 0x46;

    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);
    gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;

    SaXSetPose(SA_X_POSE_MID_AIR);

    if (gSamusData.xPosition < gCurrentSprite.xPosition)
    {
        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
        gSaXData.direction = KEY_LEFT;
    }
    else
    {
        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
        gSaXData.direction = KEY_RIGHT;
    }

    gCurrentSprite.work0 = 0;
}

void SaXBossVariableJumpHeight(void)
{

}

/**
 * @brief 1aeec | 70 | Updates the mosaic for the SA-X boss
 * 
 */
void SaXBossUpdateMosaic(void)
{
    if (!gSaXData.mosaic)
        return;

    if (gSaXData.pose == SA_X_POSE_MID_AIR)
    {
        gWrittenToMosaic = 0;
        return;
    }

    gBossWork2++;
    if (gBossWork2 >= ARRAY_SIZE(sSaXMosaicValues))
    {
        gBossWork3--;
        if (gBossWork3 == 0)
        {
            gSaXData.mosaic = FALSE;
            return;
        }

        gBossWork2 = 0;
    }

    gWrittenToMosaic = sSaXMosaicValues[gBossWork2];
}

/**
 * @brief 1af5c | e8 | Initializes the SA-X (boss) to be knockbacked
 * 
 */
void SaXBossKnockbackInit(void)
{
    u16 spawnHealth;
    u16 currentHealth;
    
    gCurrentSprite.pose = 0x50;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);
    gCurrentSprite.work4 = 0;
    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;

    SaXSetPose(SA_X_POSE_GETTING_HURT);

    if (gSamusData.xPosition > gCurrentSprite.xPosition)
    {
        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
        gSaXData.direction = KEY_RIGHT;
    }
    else
    {
        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
        gSaXData.direction = KEY_LEFT;
    }

    spawnHealth = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    currentHealth = gCurrentSprite.health;
    if (currentHealth > spawnHealth / 2)
        return;

    if (currentHealth < spawnHealth / 6)
    {
        gBossWork3 = 3;
    }
    else if (currentHealth < spawnHealth * 2 / 3)
    {
        gBossWork3 = 2;
    }
    else
    {
        gBossWork3 = 1;
    }

    gBossWork2 = 0;
    gSaXData.mosaic = TRUE;
}

/**
 * @brief 1b044 | 98 | Handles the SA-X (boss) getting knocked back
 * 
 */
void SaXBossKnockback(void)
{
    u8 offset;
    s16 movement;

    offset = gCurrentSprite.work4;
    movement = sSaXBossKnockbackYMovement[offset];

    if (movement == SHORT_MAX)
    {
        gCurrentSprite.pose = 0x43;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), 
            gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
            gCurrentSprite.xPosition -= QUARTER_BLOCK_SIZE / 2;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), 
            gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
            gCurrentSprite.xPosition += QUARTER_BLOCK_SIZE / 2;
    }
}

/**
 * @brief 1b0dc | 54 | Initializes the SA-X (boss) to be kneeling
 * 
 */
void SaXBossKneelingInit(void)
{
    gSaXData.mosaic = FALSE;

    gCurrentSprite.pose = 0x52;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);
    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;

    SaXSetPose(SA_X_POSE_KNEELING);

    gCurrentSprite.work1 = 60 * 2;
    gCurrentSprite.work2 = 60 * 2;
    gCurrentSprite.yPosition -= PIXEL_SIZE;
}

/**
 * @brief 1b130 | 40 | Handles the SA-X (boss) kneeling
 * 
 */
void SaXBossKneeling(void)
{
    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
            SaXSetPose(SA_X_POSE_TRANSFORMING_INTO_MONSTER);

        return;
    }

    gCurrentSprite.work2--;
    if (gCurrentSprite.work2 == 0)
        gCurrentSprite.pose = 0x53;
}

/**
 * @brief 1b170 | 18 | Initializes the SA-X (boss) 
 * 
 */
void SaXBossTransformingIntoMonsterInit(void)
{
    gCurrentSprite.pose = 0x54;
    gCurrentSprite.work1 = 29;
}

/**
 * @brief 1b188 | bc | Handles the SA-X (boss) transforming into the monster
 * 
 */
void SaXBossTransformingIntoMonster(void)
{
    u8 offset;
    
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 < 28)
    {
        offset = gCurrentSprite.work1;
        DMA_SET(3, &sSpritesGraphicsPointers[PSPRITE_SA_X_MONSTER - 0x10][0x200 + offset * 0x80],
            VRAM_OBJ + 0x4800 + offset * 0x200, C_32_2_16(DMA_ENABLE, 0x200 / 2));

        if (gCurrentSprite.work1 == 0)
        {
            SpriteSpawnPrimary(PSPRITE_SA_X_MONSTER, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, 0x10,
                gCurrentSprite.yPosition + PIXEL_SIZE, gCurrentSprite.xPosition, gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT);

            gCurrentSprite.pose = 0x55;
        }

        return;
    }

    if (gCurrentSprite.work1 == 28)
    {
        DMA_SET(3, sSpritesPalettePointers[PSPRITE_SA_X_MONSTER - 0x10] + 16 * 2, PALRAM_OBJ + 0x120, C_32_2_16(DMA_ENABLE, 0x70));
    }
}

/**
 * @brief 1b244 | c | Handles the SA-X (boss) after the transformation
 * 
 */
void SaXBossAfterTransformation(void)
{
    gCurrentSprite.status = 0;
}

/**
 * @brief 1b250 | 2c8 | SA-X (boss) AI
 * 
 */
void SaXBoss(void)
{
    if (gCurrentSprite.pose < 0x51)
    {
        if (SaXUpdateFreezeTimer())
            return;

        SaXSeeAndLocateSamus();

        if (SPRITE_HAS_ISFT(gCurrentSprite) == 0x10)
        {
            gCurrentSprite.pose = 0x4F;
            SoundPlay(0x9C);
        }
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            SaXBossInit();
            break;

        case SPRITE_POSE_FALLING_INIT:
            SaXFallingInit();

        case SPRITE_POSE_FALLING:
            SaXFalling();
            break;

        case 0x17:
            SaXBossRunningInit();

        case 0x18:
            SaXBossRunning();
            break;

        case 0x37:
            SaXBossSpinJumpingInit();

        case 0x38:
            SaXBossSpinJumping();
            break;

        case 0x39:
            SaXBossTurningAroundChaseInit();

        case 0x3A:
            SaXBossTurningAroundChase();
            break;

        case 0x7:
            SaXStandingInit();

        case 0x8:
            SaXStanding();
            break;

        case 0x1:
            SaXWalkingInit();
            break;

        case 0x2:
            SaXWalking();
            break;

        case 0x3:
            SaXTurningAroundInit();

        case 0x4:
            SaXTurningAround();
            break;

        case 0x29:
            SaXDelayBeforeShootingBeamInit();

        case 0x2A:
            SaXDelayBeforeShootingBeam();
            break;

        case 0x2B:
            SaXShootingBeamInit();

        case 0x2C:
            SaXShootingBeam();
            break;

        case 0x2D:
            SaXDelayBeforeShootingMissileInit();

        case 0x2E:
            SaXDelayBeforeShootingMissile();
            break;

        case 0x2F:
            SaXShootingMissileInit();

        case 0x30:
            SaXShootingMissile();
            break;

        case 0x31:
            SaXDelayAfterShootingMissileInit();

        case 0x32:
            SaXDelayAfterShootingMissile();
            break;

        case 0x3B:
            SaXMorphingInit();

        case 0x3C:
            SaXMorphing();
            break;

        case 0x3D:
            SaXRollingInit();

        case 0x3E:
            SaXRolling();
            break;

        case 0x3F:
            SaXUnmorphingInit();

        case 0x40:
            SaXUnmorphing();
            break;

        case 0x41:
            SaXBossWaitingToAppearInit();

        case 0x42:
            SaXBossWaitingToAppear();
            break;

        case 0x43:
            SaxBossFallingFromKnockbackInit();

        case 0x44:
            SaxBossFallingFromKnockback();
            break;

        case 0x45:
        case 0x47:
        case 0x49:
            SaXBossVariableJumpHeightInit();

        case 0x46:
        case 0x48:
        case 0x4A:
            SaXBossVariableJumpHeight();
            break;

        case 0x4F:
            SaXBossKnockbackInit();

        case 0x50:
            SaXBossKnockback();
            break;

        case 0x51:
            SaXBossKneelingInit();

        case 0x52:
            SaXBossKneeling();
            break;

        case 0x53:
            SaXBossTransformingIntoMonsterInit();

        case 0x54:
            SaXBossTransformingIntoMonster();
            break;

        case 0x55:
            SaXBossAfterTransformation();
    }

    if (gSaXData.pose == SA_X_POSE_MID_AIR)
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
    else
        gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;

    SaXBossUpdateMosaic();
    SaXUpdateGraphics();
}
