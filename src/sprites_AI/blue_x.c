#include "sprites_AI/blue_x.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/blue_x.h"
#include "data/samus_data.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/samus.h"
#include "constants/sprite.h"

#include "structs/clipdata.h"
#include "structs/samus.h"
#include "structs/sprite.h"

#define BLUE_X_POSE_STUNNED 0x8
#define BLUE_X_POSE_MOVING_INIT 0x17
#define BLUE_X_POSE_MOVING 0x18
#define BLUE_X_POSE_ABSORBED 0x1A
#define BLUE_X_POSE_HIDING 0x1C
#define BLUE_X_POSE_FLEEING 0x1E

/**
 * @brief 40f54 | 28 | Sets the trail of a blue X
 * 
 */
void BlueXSetTrail(void)
{
    if (MOD_AND(gFrameCounter8Bit, 16) == 0)
        ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_ICE_X_TRAIL);
}

/**
 * @brief 40f7c | 40 | Checks if a blue X should be stunned
 * 
 * @return u8 bool, is stunned
 */
u8 BlueXCheckStun(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite))
    {
        gCurrentSprite.pose = BLUE_X_POSE_STUNNED;
    
        gCurrentSprite.pOam = sBlueXOam_Stunned;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    
        gCurrentSprite.work1 = 240;
    
        return TRUE;
    }

    return FALSE;
}

/**
 * @brief 40fbc | 9c | Handles a blue X getting absorbed by samus
 * 
 */
void BlueXGetAbsorbed(void)
{
    if (gEquipment.suitMiscStatus & SMF_VARIA_SUIT)
    {
        gEquipment.currentEnergy += 30;

        if (gEquipment.currentEnergy > gEquipment.maxEnergy)
            gEquipment.currentEnergy = gEquipment.maxEnergy;

        gSamusEnvironmentalEffects[0].externalTimer = 48;
        
        SpriteSpawnSecondary(SSPRITE_BLUE_X_ABSORPTION, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gSamusData.yPosition + gSamusData.drawDistanceTop / 2,
                gSamusData.xPosition, 0);

        SoundPlay(0x1BB);
    }
    else
    {
        ParticleSet(gSamusData.yPosition + gSamusData.drawDistanceTop / 2, gSamusData.xPosition, PE_ABSORB_ICE_X_PRE_VARIA);
        SoundPlayNotAlreadyPlaying(0x1BA);
    }
}

/**
 * @brief 41058 | 48 | Initializes a blue X getting absorbed
 * 
 */
void BlueXAbsorbedInit(void)
{
    gCurrentSprite.pose = BLUE_X_POSE_ABSORBED;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;

    gCurrentSprite.status |= SPRITE_STATUS_ROTATION_SCALING;

    gCurrentSprite.rotation = 0;
    gCurrentSprite.scaling = Q_8_8(1.f);
    
    BlueXGetAbsorbed();
}

/**
 * @brief 410a0 | e0 | Initializes a blue X
 * 
 */
void BlueXInit(void)
{
    gCurrentSprite.xPosition += HALF_BLOCK_SIZE;

    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3; // TODO macro

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN)
    {
        gCurrentSprite.bgPriority++;
        gCurrentSprite.pose = BLUE_X_POSE_HIDING;
        gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
        gCurrentSprite.drawOrder = 12;
    }
    else
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        gCurrentSprite.drawOrder = 4;
    }

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;

    gCurrentSprite.pOam = sBlueXOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.samusCollision = SSC_BLUE_X_PARASITE;

    SpriteUtilChooseRandomXDirection();

    if (gSpriteRandomNumber > 8)
        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
}

/**
 * @brief 41180 | 54 | Handles a blue X hiding
 * 
 */
void BlueXHiding(void)
{
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN))
    {
        gCurrentSprite.status &= ~SPRITE_STATUS_IGNORE_PROJECTILES;
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3; // TODO macro
        gCurrentSprite.drawOrder = 4;
    }
}

/**
 * @brief 411d4 | 24 | Initializes a blue X to be idle
 * 
 */
void BlueXIdleInit(void)
{
    u8 rng;
    
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    rng = gSpriteRandomNumber * 4;
    gCurrentSprite.work3 = rng;
    gCurrentSprite.work4 = rng;
}

/**
 * @brief 411f8 | 88 | Handles a blue X being idle
 * 
 */
void BlueXIdle(void)
{
    s16 speed;
    u8 offset;

    if (BlueXCheckStun())
        return;

    BlueXSetTrail();

    offset = gCurrentSprite.work4;
    speed = sBlueXIdleYMovement[offset];

    if (speed == SHORT_MAX)
    {
        speed = sBlueXIdleYMovement[0];
        offset = 0;
    }

    gCurrentSprite.work4 = offset + 1;
    gCurrentSprite.yPosition += speed;

    offset = gCurrentSprite.work3;
    speed = sBlueXIdleXMovement[offset];

    if (speed == SHORT_MAX)
    {
        speed = sBlueXIdleXMovement[0];
        offset = 0;
    }

    gCurrentSprite.work3 = offset + 1;
    gCurrentSprite.xPosition += speed;

    if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 5, BLOCK_SIZE * 5))
        gCurrentSprite.pose = BLUE_X_POSE_MOVING_INIT;
}

/**
 * @brief 41280 | 70 | Initializes a blue X to be moving
 * 
 */
void BlueXMovingInit(void)
{
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;

    gCurrentSprite.pose = BLUE_X_POSE_MOVING;

    gCurrentSprite.pOam = sBlueXOam_Moving;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.xParasiteTimer = 0x96;

    SpriteUtilMakeSpriteFaceSamusDirection();

    if (gCurrentSprite.yPosition > gSamusData.yPosition + gSamusData.drawDistanceTop)
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
    else
        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
}

/**
 * @brief 412f0 | 201 | Handles a blue X moving
 * 
 */
void BlueXMoving(void)
{
    u16 targetY;
    u16 targetX;
    u16 speedCap;
    u8 flip;
    
    if (BlueXCheckStun())
        return;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_COLLIDING)
    {
        BlueXAbsorbedInit();
        return;
    }

    BlueXSetTrail();

    if (EventCheckAfter_ReachedTopOfRoomAfterVaria())
    {
        if (gCurrentSprite.xParasiteTimer == 0)
        {
            gCurrentSprite.pose = BLUE_X_POSE_FLEEING;
            return;
        }

        gCurrentSprite.xParasiteTimer--;

        targetY = gXParasiteTargetYPosition;
        targetX = gXParasiteTargetXPosition;
    }
    else
    {
        targetY = gSamusData.yPosition - (BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
        targetX = gSamusData.xPosition;
    }

    speedCap = HALF_BLOCK_SIZE - PIXEL_SIZE / 2;
    flip = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > targetX - PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < speedCap)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition += gCurrentSprite.work3 / 4;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += gCurrentSprite.work2 >> 2;
            else
                flip = TRUE;
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
                if (gCurrentSprite.work3 < speedCap)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition -= gCurrentSprite.work3 / 4;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition -= gCurrentSprite.work2 >> 2;
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;

        if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
        {
            SoundPlayNotAlreadyPlaying(0x1B9);
        }
    }

    flip = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > targetY - PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < speedCap)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition += gCurrentSprite.work4 / 4;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += gCurrentSprite.work1 >> 2;
            else
                flip = TRUE;
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
                if (gCurrentSprite.work4 < speedCap)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition -= gCurrentSprite.work4 / 4;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition -= gCurrentSprite.work1 >> 2;
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.work4 = 1;

        if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
        {
            SoundPlayNotAlreadyPlaying(0x1B9);
        }
    }
}

/**
 * @brief 41500 | a4 | Handles a blue X getting absorbed
 * 
 */
void BlueXAbsorbed(void)
{
    u16 damage;

    damage = GET_PSPRITE_DAMAGE(PSPRITE_BLUE_X);

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteStickToSamus();

    if (gCurrentSprite.scaling > Q_8_8(.315f))
        gCurrentSprite.scaling -= Q_8_8(.035f);
    else
        gCurrentSprite.status = 0;

    if (gEquipment.suitMiscStatus & SMF_VARIA_SUIT)
        return;

    if (MOD_AND(gCurrentSprite.scaling, 4) == 0)
    {
        if (gEquipment.currentEnergy > damage)
        {
            gEquipment.currentEnergy -= damage;

            if (gCurrentSprite.status == 0)
                SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
        }
        else
        {
            gEquipment.currentEnergy = 0;

            SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
        }
    }
}

/**
 * @brief 415a4 | 40 | Handles a blue X being stunned
 * 
 */
void BlueXStunned(void)
{
    if (BlueXCheckStun())
        return;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_COLLIDING)
    {
        BlueXAbsorbedInit();
        return;
    }

    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = BLUE_X_POSE_MOVING_INIT;
}

/**
 * @brief 415e4 | 9c | Handles a blue X fleeing
 * 
 */
void BlueXFleeing(void)
{
    u8 speed;
    
    if (BlueXCheckStun())
        return;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_COLLIDING)
    {
        BlueXAbsorbedInit();
        return;
    }

    BlueXSetTrail();

    if (gCurrentSprite.work3 < 200)
        gCurrentSprite.work3++;

    speed = gCurrentSprite.work3 / 8;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        gCurrentSprite.xPosition += speed;
    else
        gCurrentSprite.xPosition -= speed;

    if (gCurrentSprite.work4 < 200)
        gCurrentSprite.work4++;

    speed = gCurrentSprite.work4 / 8;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
        gCurrentSprite.yPosition += speed;
    else
        gCurrentSprite.yPosition -= speed;

    if (!(gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN))
        gCurrentSprite.status = 0;
}

/**
 * @brief 41680 | 7c | Initializes a blue X absorbtion
 * 
 */
void BlueXAbsorbtionInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.drawOrder = 3;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

    gCurrentSprite.pOam = sBlueXAbsorbtionOam_Absorbing;

    gCurrentSprite.work1 = 28;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

/**
 * @brief 416fc | 30 | Handles a blue X absorbtion getting absorbed
 * 
 */
void BlueXAbsorbtionAbsorbing(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pOam = sBlueXAbsorbtionOam_FadingAway;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
    }
}

/**
 * @brief 4172c | 18 | Handles a blue X absorbtion fading away
 * 
 */
void BlueXAbsorbtionFadingAway(void)
{
    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
        gCurrentSprite.status = 0;
}

/**
 * @brief 41744 | e4 | Blue X AI
 * 
 */
void BlueX(void)
{
    if (gCurrentSprite.freezeTimer != 0)
    {
        SpriteUtilUpdateFreezeTimer();
        return;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            BlueXInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            BlueXIdleInit();
            break;

        case SPRITE_POSE_IDLE:
            BlueXIdle();
            break;

        case BLUE_X_POSE_MOVING_INIT:
            BlueXMovingInit();

        case BLUE_X_POSE_MOVING:
            BlueXMoving();
            break;
        
        case BLUE_X_POSE_ABSORBED:
            BlueXAbsorbed();
            break;

        case BLUE_X_POSE_HIDING:
            BlueXHiding();
            break;

        case BLUE_X_POSE_FLEEING:
            BlueXFleeing();
            break;

        case BLUE_X_POSE_STUNNED:
            BlueXStunned();
    }
}

/**
 * @brief 41828 | 70 | Blue X absorbtion AI
 * 
 */
void BlueXAbsorbtion(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            BlueXAbsorbtionInit();
            break;

        case SPRITE_POSE_IDLE:
            BlueXAbsorbtionAbsorbing();
            break;

        case 0x18:
            BlueXAbsorbtionFadingAway();
    }

    if (gCurrentSprite.roomSlot == 0)
    {
        gCurrentSprite.yPosition = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
        gCurrentSprite.xPosition = gSamusData.xPosition;
    }
    else
    {
        gCurrentSprite.yPosition += ONE_SUB_PIXEL;
    }
}
