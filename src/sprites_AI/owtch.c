#include "sprites_AI/owtch.h"
#include "macros.h"
#include "globals.h"

//#include "data/sprites/owtch.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

u8 OwtchCheckCollidingWithAir(void)
{
    u8 colliding;

    colliding = FALSE;
    if (gCurrentSprite.work0 != 0)
    {
        if ((gCurrentSprite.status & SPRITE_STATUS_X_FLIP) != 0)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == 0)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition);
                if (gPreviousCollisionCheck == 0)
                    colliding = TRUE;
            }
        }
        else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 4);
            if (gPreviousCollisionCheck == 0)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition - 4);
                if (gPreviousCollisionCheck == 0)
                    colliding = TRUE;
            }
        }
    }
    else
    {
        if ((gCurrentSprite.status & SPRITE_STATUS_Y_FLIP) != 0) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x20);
            if (gPreviousCollisionCheck == 0)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x20);
                if (gPreviousCollisionCheck == 0)
                    colliding = TRUE;
            }
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
            if (gPreviousCollisionCheck == 0)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
                if (gPreviousCollisionCheck == 0)
                    colliding = TRUE;
            }
        }
    }
    return colliding;
}

void OwtchUpdateHitbox(void)
{
    if (gCurrentSprite.work0 != 0)
    {
        if ((gCurrentSprite.status & SPRITE_STATUS_X_FLIP) != 0)
        {
            gCurrentSprite.hitboxTop = -0x1c;
            gCurrentSprite.hitboxBottom = 0x1c;
            gCurrentSprite.hitboxLeft = -0x2c;
            gCurrentSprite.hitboxRight = 0x10;
        }
        else
        {
            gCurrentSprite.hitboxTop = -0x1c;
            gCurrentSprite.hitboxBottom = 0x1c;
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x2c;
        }
    }
    else
    {
        if ((gCurrentSprite.status & SPRITE_STATUS_Y_FLIP) != 0)
        {
            gCurrentSprite.hitboxTop = 0x10;
            gCurrentSprite.hitboxBottom = 0x2c;
            gCurrentSprite.hitboxLeft = -0x1c;
            gCurrentSprite.hitboxRight = 0x1c;
        }
        else
        {
            gCurrentSprite.hitboxTop = -0x2c;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -0x1c;
            gCurrentSprite.hitboxRight = 0x1c;
        }
    }
    return;
}

void OwtchSetCrawlingOam(void)
{
    if (gCurrentSprite.work0 != 0)
        gCurrentSprite.pOam = (const struct FrameData*)0x08379154;
    else
        gCurrentSprite.pOam = (const struct FrameData*)0x083790d4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void OwtchSetFallingOam(void)
{
    if (gCurrentSprite.work0)
        gCurrentSprite.pOam = (const struct FrameData*)0x8379154;
    else
        gCurrentSprite.pOam = (const struct FrameData*)0x83790d4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void OwtchTurningIntoX(void)
{
    if (gCurrentSprite.work0)
    {
        if ((gCurrentSprite.status & SPRITE_STATUS_X_FLIP))
            gCurrentSprite.xPosition -= 0x28;
        else
            gCurrentSprite.xPosition += 0x28;
    }
    else
    {
        if ((gCurrentSprite.status & SPRITE_STATUS_Y_FLIP))
            gCurrentSprite.yPosition += 0x28;
        else
            gCurrentSprite.yPosition -= 0x28;
    }
}

void OwtchInit(void)
{
    SpriteUtilTrySetAbsorbXFlag();
    if (((gCurrentSprite.properties & SPRITE_STATUS_ON_SCREEN)) && (!(gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000)))
    {
        gCurrentSprite.status = 0;
    }
    else
    {
        if (gCurrentSprite.pose == 0x59)
        {
            gCurrentSprite.pose = 0x5a;
            gCurrentSprite.xParasiteTimer = 0x2c;
        }
        else
        {
            SpriteUtilChooseRandomXDirection();
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
            if ((gPreviousCollisionCheck & 0xf0))
            {
                gCurrentSprite.work0 = FALSE;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x44, gCurrentSprite.xPosition);
                if ((gPreviousCollisionCheck & 0xf0))
                {
                    gCurrentSprite.work0 = FALSE;
                    gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
                    gCurrentSprite.yPosition -= BLOCK_SIZE;
                }
                else
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x24);
                    if ((gPreviousCollisionCheck & 0xf0))
                    {
                        gCurrentSprite.work0 = TRUE;
                        gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                        gCurrentSprite.xPosition -= HALF_BLOCK_SIZE;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x20);
                        if ((gPreviousCollisionCheck & 0xf0))
                        {
                            gCurrentSprite.work0 = TRUE;
                            gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
                            gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                            gCurrentSprite.xPosition += HALF_BLOCK_SIZE;
                        }
                        else
                        {
                            gCurrentSprite.status = 0;
                            return;
                        }
                    }
                }
            }
        }
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        OwtchSetCrawlingOam();
        OwtchUpdateHitbox();
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
        gCurrentSprite.work1 = 0;
        gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
        gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
        gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    }
}

void OwtchIdleInit(void)
{
    OwtchSetCrawlingOam();
    gCurrentSprite.pose = 2;
}

void OwtchIdle(void)
{
    u8 turnAround;

    turnAround = FALSE;
    if (OwtchCheckCollidingWithAir() << 0x18)
    {
        gCurrentSprite.pose = 0x15;
    }
    else if (!(gCurrentSprite.properties & SPRITE_STATUS_ON_SCREEN))
    {
        if (gCurrentSprite.work0)
        {
            if ((gCurrentSprite.status & SPRITE_STATUS_X_FLIP))
            {
                if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
                    if (!(gPreviousCollisionCheck & 0xf0))
                    {
                        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                        turnAround = TRUE;
                        gCurrentSprite.work2 = 7;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition - 4);
                        if (gPreviousCollisionCheck == 0x11)
                        {
                            gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                            turnAround = TRUE;
                            gCurrentSprite.work2 = 5;
                        }
                        else
                            gCurrentSprite.yPosition += 1;
                    }
                }
                else
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition);
                    if (!(gPreviousCollisionCheck & 0xf0))
                    {
                        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                        turnAround = TRUE;
                        gCurrentSprite.work2 = 5;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 4);
                        if (gPreviousCollisionCheck == 0x11)
                        {
                            gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                            turnAround = TRUE;
                            gCurrentSprite.work2 = 7;
                        }
                        else
                            gCurrentSprite.yPosition -= 1;
                    }
                }
            }
            else
            {
                if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 4);
                    if (!(gPreviousCollisionCheck & 0xf0))
                    {
                        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                        turnAround = TRUE;
                        gCurrentSprite.work2 = 6;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition);
                        if (gPreviousCollisionCheck == 0x11)
                        {
                            gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                            turnAround = TRUE;
                            gCurrentSprite.work2 = 4;
                        }
                        else
                            gCurrentSprite.yPosition += 1;
                    }
                }
                else
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 4);
                    if (!(gPreviousCollisionCheck & 0xf0))
                    {
                        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                        turnAround = TRUE;
                        gCurrentSprite.work2 = 4;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition);
                        if (gPreviousCollisionCheck == 0x11)
                        {
                            gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                            turnAround = TRUE;
                            gCurrentSprite.work2 = 6;
                        }
                        else
                            gCurrentSprite.yPosition -= 1;
                    }
                }
            }
        }
        else
        {
            if ((gCurrentSprite.status & SPRITE_STATUS_Y_FLIP))
            {
                if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition);
                    if (!(gPreviousCollisionCheck & 0xf))
                    {
                        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                        turnAround = TRUE;
                        gCurrentSprite.work2 = 2;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
                        if (gPreviousCollisionCheck == 0x11)
                        {
                            gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                            turnAround = TRUE;
                            gCurrentSprite.work2 = 3;
                        }
                        else
                            gCurrentSprite.xPosition += 1;
                    }
                }
                else
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 4);
                    if (!(gPreviousCollisionCheck & 0xf))
                    {
                        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                        turnAround = TRUE;
                        gCurrentSprite.work2 = 3;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
                        if (gPreviousCollisionCheck == 0x11)
                        {
                            gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                            turnAround = TRUE;
                            gCurrentSprite.work2 = 2;
                        }
                        else
                            gCurrentSprite.xPosition -= 1;
                    }
                }
            }
            else
            {
                if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
                    if (!(gPreviousCollisionCheck & 0xf0))
                    {
                        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                        turnAround = TRUE;
                        gCurrentSprite.work2 = 0;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x20);
                        if (gPreviousCollisionCheck == 0x11)
                        {
                            gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                            turnAround = TRUE;
                            gCurrentSprite.work2 = 1;
                        }
                        else
                            gCurrentSprite.xPosition += 1;
                    }
                }
                else
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 4);
                    if (!(gPreviousCollisionCheck & 0xf0))
                    {
                        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
                        turnAround = TRUE;
                        gCurrentSprite.work2 = 1;
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x20);
                        if (gPreviousCollisionCheck == 0x11)
                        {
                            gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
                            turnAround = TRUE;
                            gCurrentSprite.work2 = 0;
                        }
                        else
                            gCurrentSprite.xPosition -= 1;
                    }
                }
            }
        }
        if (turnAround)
            gCurrentSprite.pose = 3;
    }
}

void OwtchTurningAroundInit(void)
{
    gCurrentSprite.pose = 4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    switch (gCurrentSprite.work2)
    {
        case 0:
            if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                gCurrentSprite.pOam = (const struct FrameData*)0x8379114;
            else
                gCurrentSprite.pOam = (const struct FrameData*)0x8379194;
            gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
            gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
            break;
        case 1:
            if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                gCurrentSprite.pOam = (const struct FrameData*)0x8379114;
            else
                gCurrentSprite.pOam = (const struct FrameData*)0x8379194;
            gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
            gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
            break;
        case 2:
            if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                gCurrentSprite.pOam = (const struct FrameData*)0x8379194;
            else
                gCurrentSprite.pOam = (const struct FrameData*)0x8379114;
            gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
            gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
            break;
        case 3:
            if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                gCurrentSprite.pOam = (const struct FrameData*)0x8379194;
            else
                gCurrentSprite.pOam = (const struct FrameData*)0x8379114;
            gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
            gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
            break;
        case 4:
            if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                gCurrentSprite.pOam = (const struct FrameData*)0x83791b4;
            else
                gCurrentSprite.pOam = (const struct FrameData*)0x8379134;
            gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
            gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
            break;
        case 5:
            if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                gCurrentSprite.pOam = (const struct FrameData*)0x8379134;
            else
                gCurrentSprite.pOam = (const struct FrameData*)0x83791b4;
            gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
            gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
            break;
        case 6:
            if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                gCurrentSprite.pOam = (const struct FrameData*)0x83791b4;
            else
                gCurrentSprite.pOam = (const struct FrameData*)0x8379134;
            gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
            gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
            break;
        case 7:
            if ((gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT))
                gCurrentSprite.pOam = (const struct FrameData*)0x8379134;
            else
                gCurrentSprite.pOam = (const struct FrameData*)0x83791b4;
            gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
            gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
            break;
        default:
            gCurrentSprite.status = 0;
    }
}

void OwtchTurningAround(void)
{
    if (SpriteUtilCheckEndOfCurrentSpriteAnimation()) {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        switch (gCurrentSprite.work2)
        {
            case 0:
                if ((gCurrentSprite.status & 0x200) == 0) {
                    gCurrentSprite.yPosition -= 0x1c;
                    gCurrentSprite.xPosition -= 0x1c;
                }
                gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
                gCurrentSprite.work0 = TRUE;
                break;
            case 1:
                if ((gCurrentSprite.status & 0x200) == 0) {
                    gCurrentSprite.yPosition -= 0x20;
                    gCurrentSprite.xPosition += 0x20;
                }
                gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
                gCurrentSprite.work0 = TRUE;
                break;
            case 2:
                if ((gCurrentSprite.status & 0x200) != 0) {
                    gCurrentSprite.yPosition += 0x1c;
                    gCurrentSprite.xPosition -= 0x1c;
                }
                gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
                gCurrentSprite.work0 = TRUE;
                break;
            case 3:
                if ((gCurrentSprite.status & 0x200) != 0) {
                    gCurrentSprite.yPosition += 0x20;
                    gCurrentSprite.xPosition += 0x20;
                }
                gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
                gCurrentSprite.work0 = TRUE;
                break;
            case 4:
                if ((gCurrentSprite.status & 0x200) != 0) {
                    gCurrentSprite.yPosition += 0x20;
                    gCurrentSprite.xPosition += 0x20;
                }
                gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
                gCurrentSprite.work0 = FALSE;
                break;
            case 5:
                if ((gCurrentSprite.status & 0x200) == 0) {
                    gCurrentSprite.yPosition += 0x20;
                    gCurrentSprite.xPosition -= 0x20;
                }
                gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
                gCurrentSprite.work0 = FALSE;
                break;
            case 6:
                if ((gCurrentSprite.status & 0x200) != 0) {
                    gCurrentSprite.yPosition -= 0x1c;
                    gCurrentSprite.xPosition += 0x1c;
                }
                gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
                gCurrentSprite.work0 = FALSE;
                break;
            case 7:
                if ((gCurrentSprite.status & 0x200) == 0) {
                    gCurrentSprite.yPosition -= 0x1c;
                    gCurrentSprite.xPosition -= 0x1c;
                }
                gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
                gCurrentSprite.work0 = FALSE;
                break;
            default:
                gCurrentSprite.status = 0;
        }
        OwtchSetCrawlingOam();
        OwtchUpdateHitbox();
    }
}

void OwtchLandingInit(void)
{
    gCurrentSprite.pose = 8;
    OwtchSetFallingOam();
}

void OwtchLanding(void)
{
    if (OwtchCheckCollidingWithAir() << 0x18) {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
    }
    else
    {
        if (SpriteUtilCheckNearEndOfCurrentSpriteAnimation()) {
            gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        }
    }
}

void OwtchFallingInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.work0 = 0;
    gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
    OwtchUpdateHitbox();
    OwtchSetFallingOam();
}

void OwtchFalling(void)
{
    u16 yCollisionPoint;
    u16 xCollisionPoint;
    u32 blockTop;
    u8 onWall;
    u8 offset;
    s16 movement;

    onWall = 0;
    yCollisionPoint = gCurrentSprite.yPosition;
    xCollisionPoint = gCurrentSprite.xPosition;
    if (gCurrentSprite.work0)
    {
        if ((gCurrentSprite.status & SPRITE_STATUS_X_FLIP))
            xCollisionPoint -= 4;
        yCollisionPoint += gCurrentSprite.hitboxBottom;
    }
    else
    {
        if ((gCurrentSprite.status & SPRITE_STATUS_Y_FLIP))
            yCollisionPoint += gCurrentSprite.hitboxBottom;
    }
    
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(yCollisionPoint, xCollisionPoint); // Have to make it output u32 to make it matching.

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        if (gCurrentSprite.work0)
        {
            onWall += 1;
        }
        gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
        gCurrentSprite.work0 = 0;
        OwtchUpdateHitbox();
        if (onWall)
        {
            if ((gCurrentSprite.status & SPRITE_STATUS_X_FLIP))
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxRight;
            else
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxLeft;
        }
        if ((gCurrentSprite.properties & SPRITE_STATUS_ON_SCREEN))
        {
            gCurrentSprite.pose = 2;
            OwtchSetCrawlingOam();
        }
        else
        {
            gCurrentSprite.pose = 8;
            OwtchSetFallingOam();
        }
    }
    else
    {
        offset = gCurrentSprite.work4;
        movement = sSpritesFallingSpeed[offset];
        
        if (movement == SHORT_MAX)
        {
            movement = sSpritesFallingSpeed[offset - 1];
            gCurrentSprite.yPosition += movement;
        }
        else
        {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += movement;
        }
    }
}

void Owtch(void)
{
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x1d4);

    if (gCurrentSprite.freezeTimer != 0)
        SpriteUtilUpdateFreezeTimer();
    else {
        switch(gCurrentSprite.pose) {
            case SPRITE_POSE_UNINITIALIZED:
                OwtchInit();
                break;
            case SPRITE_POSE_IDLE_INIT:
                OwtchIdleInit();
            case SPRITE_POSE_IDLE:
                OwtchIdle();
                break;
            case 3:
                OwtchTurningAroundInit();
            case 4:
                OwtchTurningAround();
                break;
            case 7:
                OwtchLandingInit();
            case 8:
                OwtchLanding();
                break;
            case SPRITE_POSE_FALLING_INIT:
                OwtchFallingInit();
            case SPRITE_POSE_FALLING:
                OwtchFalling();
                break;
            case SPRITE_POSE_DYING_INIT:
                SpriteDyingInit();
            case SPRITE_POSE_DYING:
                SpriteDying();
                break;
            case SPRITE_POSE_SPAWNING_FROM_X_INIT:
                OwtchInit();
            case SPRITE_POSE_SPAWNING_FROM_X:
                SpriteSpawningFromX();
                break;
            case SPRITE_POSE_TURNING_INTO_X:
                OwtchTurningIntoX();
                XParasiteInit();
                break;
        }
    }
}
