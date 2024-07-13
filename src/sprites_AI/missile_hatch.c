#include "sprites_AI/missile_hatch.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/missile_hatch.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/sprite.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"

#define MISSILE_HATCH_POSE_EXPLODING 0x18

/**
 * @brief 41898 | 50 | Changes the collision of a missile hatch
 * 
 * @param caa Clipdata affecting action
 */
void MissileHatchSetCollision(u8 caa)
{
    u16 yPosition;
    u16 xPosition;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    // Top block
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - BLOCK_SIZE, xPosition + HALF_BLOCK_SIZE);

    // Middle block
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition, xPosition + HALF_BLOCK_SIZE);

    // Bottom block
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition + BLOCK_SIZE, xPosition + HALF_BLOCK_SIZE);
}

/**
 * @brief 418e8 | 9c | Initializes a missile hatch
 * 
 */
void MissileHatchInit(void)
{
    if (gMissilesHatchDestroyed)
    {
        gCurrentSprite.status = 0;
        return;
    }

    gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
    gCurrentSprite.xPosition += HALF_BLOCK_SIZE;

    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = BLOCK_SIZE + HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sMissileHatchOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    MissileHatchSetCollision(CAA_MAKE_SOLID);
}

/**
 * @brief 41984 | 38 | Handles a missile hatch being idle
 * 
 */
void MissileHatchIdle(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.health == 0)
    {
        gCurrentSprite.pose = MISSILE_HATCH_POSE_EXPLODING;
        gCurrentSprite.work1 = 0;
        gMissilesHatchDestroyed = TRUE;
        MissileHatchSetCollision(CAA_REMOVE_SOLID);
    }
}

/**
 * @brief 419bc | 234 | Handles a missile hatch exploding
 * 
 */
void MissileHatchExploding(void)
{
    u16 yPosition;
    u16 xPosition;
    
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    switch (gCurrentSprite.work1++)
    {
        case 0:
            ParticleSet(yPosition, xPosition, PE_0x25);
            SoundPlay(0x106);
            break;

        case 2:
            ParticleSet(yPosition - HALF_BLOCK_SIZE, xPosition + QUARTER_BLOCK_SIZE, PE_0x26);
            
            SpriteSpawnSecondary(SSPRITE_41, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + BLOCK_SIZE,
                gCurrentSprite.xPosition - EIGHTH_BLOCK_SIZE, 0);
            break;

        case 4:
            ParticleSet(yPosition + (HALF_BLOCK_SIZE - PIXEL_SIZE / 2), xPosition - QUARTER_BLOCK_SIZE, PE_0x26);
            
            SpriteSpawnSecondary(SSPRITE_41, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition - EIGHTH_BLOCK_SIZE, 0);
            break;

        case 6:
            ParticleSet(yPosition + (BLOCK_SIZE - EIGHTH_BLOCK_SIZE), xPosition + (QUARTER_BLOCK_SIZE - PIXEL_SIZE), PE_0x25);
            break;

        case 8:
            ParticleSet(yPosition - (BLOCK_SIZE - PIXEL_SIZE), xPosition - (QUARTER_BLOCK_SIZE - PIXEL_SIZE), PE_0x25);

            SpriteSpawnSecondary(SSPRITE_41, 2, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + HALF_BLOCK_SIZE,
                gCurrentSprite.xPosition - (QUARTER_BLOCK_SIZE - PIXEL_SIZE), 0);
            break;

        case 10:
            gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;

            SpriteSpawnSecondary(SSPRITE_41, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + HALF_BLOCK_SIZE,
                gCurrentSprite.xPosition - EIGHTH_BLOCK_SIZE, 0);
            break;

        case 12:
            ParticleSet(yPosition, xPosition, PE_0x24);

            SpriteSpawnSecondary(SSPRITE_41, 3, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + BLOCK_SIZE + HALF_BLOCK_SIZE,
                gCurrentSprite.xPosition, 0);

            SoundPlay(0x145);
            break;

        case 14:
            ParticleSet(yPosition + QUARTER_BLOCK_SIZE, xPosition - (EIGHTH_BLOCK_SIZE + PIXEL_SIZE / 2), PE_0x25);
            break;

        case 16:
            ParticleSet(yPosition - QUARTER_BLOCK_SIZE, xPosition + QUARTER_BLOCK_SIZE + PIXEL_SIZE, PE_0x25);

            SpriteSpawnSecondary(SSPRITE_41, 1, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - HALF_BLOCK_SIZE,
                gCurrentSprite.xPosition + EIGHTH_BLOCK_SIZE, 0);
            break;

        case 18:
            ParticleSet(yPosition + (BLOCK_SIZE - QUARTER_BLOCK_SIZE), xPosition - PIXEL_SIZE, PE_0x25);
            break;

        case 20:
            ParticleSet(yPosition - (BLOCK_SIZE - QUARTER_BLOCK_SIZE), xPosition + PIXEL_SIZE, PE_0x25);
            break;

        case 22:
            ParticleSet(yPosition + BLOCK_SIZE, xPosition + PIXEL_SIZE, PE_0x25);
            break;

        case 24:
            ParticleSet(yPosition, xPosition, PE_0x25);
            gCurrentSprite.status = 0;
    }
}

/**
 * @brief 41bf0 | a4 | Intializes a missile hatch debris
 * 
 */
void MissileHatchDebrisInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -QUARTER_BLOCK_SIZE;
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE;

    gCurrentSprite.work4 = 0;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work1 = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.ignoreSamusCollisionTimer = 108;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.roomSlot == 1)
        gCurrentSprite.pOam = sMissileHatchDebrisOam_Falling1;
    else if (gCurrentSprite.roomSlot == 2)
        gCurrentSprite.pOam = sMissileHatchDebrisOam_Falling2;
    else if (gCurrentSprite.roomSlot == 3)
        gCurrentSprite.pOam = sMissileHatchDebrisOam_Falling3;
    else
        gCurrentSprite.pOam = sMissileHatchDebrisOam_Falling0;
}

/**
 * @brief 41c94 | 180 | Handles a missile hatch debris falling
 * 
 */
void MissileHatchDebrisFalling(void)
{
    s16 speed;
    u8 offset;
    u32 blockTop;

    gCurrentSprite.work1--;
    if (MOD_AND(gCurrentSprite.work1, 16) == 0)
    {
        ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_HEAVY_DUST_1);
    }

    if (gCurrentSprite.roomSlot != 0)
    {
        offset = gCurrentSprite.work3;
        speed = sMissileHatchDebrisFallingXMovement[offset];

        if (speed == SHORT_MAX)
        {
            speed = sMissileHatchDebrisFallingXMovement[offset - 1];
            gCurrentSprite.xPosition += speed;
        }
        else
        {
            gCurrentSprite.work3++;
            gCurrentSprite.xPosition += speed;
        }
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.status = 0;

        ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x25);

        if (gCurrentSprite.roomSlot != 0)
            SoundPlay(0x107);

        return;
    }

    if (gCurrentSprite.roomSlot == 3)
    {
        offset = gCurrentSprite.work4;
        speed = sSpritesFallingSpeedMissileHatchDebris[offset];

        if (speed == SHORT_MAX)
        {
            speed = sSpritesFallingSpeedMissileHatchDebris[offset - 1];
            gCurrentSprite.yPosition += speed;
        }
        else
        {
            gCurrentSprite.work4++;
            gCurrentSprite.yPosition += speed;
        }
    }
    else if (gCurrentSprite.roomSlot == 2)
    {
        offset = gCurrentSprite.work4;
        speed = sSpritesFallingSpeedHovering[offset];

        if (speed == SHORT_MAX)
        {
            speed = sSpritesFallingSpeedHovering[offset - 1];
            gCurrentSprite.yPosition += speed;
        }
        else
        {
            gCurrentSprite.work4++;
            gCurrentSprite.yPosition += speed;
        }
    }
    else if (gCurrentSprite.roomSlot == 1)
    {
        gCurrentSprite.xPosition -= ONE_SUB_PIXEL;
        offset = gCurrentSprite.work4;
        speed = sSpritesFallingSpeed_2e499c[offset];

        if (speed == SHORT_MAX)
        {
            speed = sSpritesFallingSpeed_2e499c[offset - 1];
            gCurrentSprite.yPosition += speed;
        }
        else
        {
            gCurrentSprite.work4++;
            gCurrentSprite.yPosition += speed;
        }
    }
    else
    {
        offset = gCurrentSprite.work4;
        speed = sSpritesFallingSpeed[offset];

        if (speed == SHORT_MAX)
        {
            speed = sSpritesFallingSpeed[offset - 1];
            gCurrentSprite.yPosition += speed;
        }
        else
        {
            gCurrentSprite.work4++;
            gCurrentSprite.yPosition += speed;
        }
    }
}

/**
 * @brief 41e14 | 40 | Missile hatch AI
 * 
 */
void MissileHatch(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            MissileHatchInit();
            break;

        case SPRITE_POSE_IDLE:
            MissileHatchIdle();
            break;

        case MISSILE_HATCH_POSE_EXPLODING:
            MissileHatchExploding();
            break;
    }
}

/**
 * @brief 41e54 | 30 | Missile hatch debris AI
 * 
 */
void MissileHatchDebris(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            MissileHatchDebrisInit();
            break;

        case SPRITE_POSE_IDLE:
            MissileHatchDebrisFalling();
            break;
    }
}
