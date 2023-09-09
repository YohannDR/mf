#include "sprites_AI/sa_x_arc.h"
#include "sprites_AI/sa_x.h"
#include "macros.h"
#include "gba.h"
#include "globals.h"

#include "data/sprites/sa_x.h"
#include "data/sprite_data.h"

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

void SaXBossUpdateMosaic(void)
{

}

void SaXBossKnockbackInit(void)
{

}

void SaXBossKnockback(void)
{

}

void SaXBossKneelingInit(void)
{

}

void SaXBossKneeling(void)
{

}

void SaXBossTransformingIntoMonsterInit(void)
{

}

void SaXBossTransformingIntoMonster(void)
{

}

void SaXBossAfterTransformation(void)
{

}

void SaXBoss(void)
{

}
