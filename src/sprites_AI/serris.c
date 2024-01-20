#include "sprites_AI/serris.h"
#include "macros.h"

#include "data/generic_data.h"

#include "constants/sprite.h"

#include "structs/samus.h"
#include "structs/sprite.h"

void SerrisUpdatePalette(void)
{

}

/**
 * @brief 474ec | a4 | Gets the current platform on which samus is on
 * 
 * @return u8 Platform id (from left to right)
 */
u8 SerrisGetCurrentSamusPlatform(void)
{
    u16 samusY;
    u16 samusX;
    u16 serrisY;
    u16 serrisX;

    samusY = gSamusData.yPosition;
    samusX = gSamusData.xPosition;

    serrisY = gSerrisSpawnYPosition;
    serrisX = gSerrisSpawnXPosition;

    if (samusY > serrisY - BLOCK_SIZE * 12 && samusY < serrisY - BLOCK_SIZE * 9)
    {
        if (samusX > serrisX - BLOCK_SIZE * 5 && samusX < serrisX - BLOCK_SIZE)
            return 4;

        if (samusX > serrisX - BLOCK_SIZE * 11 && samusX < serrisX - BLOCK_SIZE * 7)
            return 3;

        if (samusX > serrisX - BLOCK_SIZE * 17 && samusX < serrisX - BLOCK_SIZE * 13)
            return 2;

        if (samusX > serrisX - BLOCK_SIZE * 23 && samusX < serrisX - BLOCK_SIZE * 19)
            return 1;
    }

    return 0;
}

/**
 * @brief 47590 | bc | Rotates the current sprite around a point given the parameters
 * 
 * @param centerY Rotation center Y
 * @param centerX Rotation center X
 * @param radius Rotation radius
 * @param rotation Rotation angle
 */
void SerrisRotateAroundPoint(s16 centerY, s16 centerX, s16 radius, s16 rotation)
{
    s32 s;
    s32 c;
    s16 offset;

    s = SIN(rotation);

    // Compute new Y position by doing centerY + radius * sin(rotation)
    if (s < 0)
    {
        s = -s;

        offset = Q_8_8_TO_SHORT_DIV(radius * s);

        gCurrentSprite.yPosition = centerY - offset;
    }
    else
    {
        offset = Q_8_8_TO_SHORT_DIV(radius * s);

        gCurrentSprite.yPosition = centerY + offset;
    }

    c = COS(rotation);

    // Compute new X position by doing  centerX + radius * cos(rotation)
    if (c < 0)
    {
        c = -c;

        offset = Q_8_8_TO_SHORT_DIV(radius * c);

        gCurrentSprite.xPosition = centerX - offset;
    }
    else
    {
        offset = Q_8_8_TO_SHORT_DIV(radius * c);

        gCurrentSprite.xPosition = centerX + offset;
    }
}

/**
 * @brief 4764c | 9c | Handles the rotation movement of 
 * 
 */
void SerrisHandleRotationMovement(void)
{
    u8 deltaRotation;

    // Get delta rotation based on the radius
    if (gCurrentSprite.work3 == 3)
        deltaRotation = Q_8_8(.005f);
    else if (gCurrentSprite.work3 == 2)
        deltaRotation = Q_8_8(.01f);
    else
        deltaRotation = Q_8_8(.0175f);

    // Apply delta rotaiton to radius (work2) and actual sprite rotation
    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            gCurrentSprite.work2 += deltaRotation;
            gCurrentSprite.rotation += deltaRotation;
        }
        else
        {
            gCurrentSprite.work2 -= deltaRotation;
            gCurrentSprite.rotation -= deltaRotation;
        }
    }
    else
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            gCurrentSprite.work2 -= deltaRotation;
            gCurrentSprite.rotation -= deltaRotation;
        }
        else
        {
            gCurrentSprite.work2 += deltaRotation;
            gCurrentSprite.rotation += deltaRotation;
        }
    }

    // Rotate sprite
    SerrisRotateAroundPoint(gCurrentSprite.xParasiteTimer, gCurrentSprite.unk_8, gCurrentSprite.work3 * BLOCK_SIZE * 3, gCurrentSprite.work2);
}

/**
 * @brief 476e8 | 54 | Starts an X aligned rotation for serris
 * 
 * @param centerY Rotation center Y
 * @param centerX Rotation center X
 * @param radius Rotation radius
 */
void SerrisStartRotationXAligned(u16 centerY, u16 centerX, u16 radius)
{
    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        gCurrentSprite.unk_8 = centerX + radius * BLOCK_SIZE * 3;
        gCurrentSprite.work2 = PI;
    }
    else
    {
        gCurrentSprite.unk_8 = centerX - radius * BLOCK_SIZE * 3;
        gCurrentSprite.work2 = 0;
    }

    gCurrentSprite.xParasiteTimer = centerY;
    gCurrentSprite.work3 = radius;
}

/**
 * @brief 4773c | 54 | Starts an Y aligned rotation for serris
 * 
 * @param centerY Rotation center Y
 * @param centerX Rotation center X
 * @param radius Rotation radius
 */
void SerrisStartRotationYAligned(u16 centerY, u16 centerX, u16 radius)
{
    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        gCurrentSprite.work2 = 3 * PI / 2;
        gCurrentSprite.xParasiteTimer = centerY + radius * BLOCK_SIZE * 3;
    }
    else
    {
        gCurrentSprite.work2 = PI / 2;
        gCurrentSprite.xParasiteTimer = centerY - radius * BLOCK_SIZE * 3;
    }

    gCurrentSprite.unk_8 = centerX;
    gCurrentSprite.work3 = radius;
}

void SerrisSetFacingOam(void)
{

}

void SerrisInit(void)
{

}

void SerrisWaitingToAppearInit(void)
{

}

void SerrisWaitingToAppear(void)
{

}

void SerrisStartFight(void)
{

}

void SerrisFirstArcInit(void)
{

}

void SerrisFirstArc(void)
{

}

void SerrisFirstArcEnd(void)
{

}

void SerrisDyingInit(void)
{

}

void SerrisDying(void)
{

}

void SerrisTurningIntoXInit(void)
{

}

void SerrisTurningIntoX(void)
{

}

void SerrisPartInit(void)
{

}

void SerrisPartWaitingToAppear(void)
{

}

void SerrisPartStartFight(void)
{

}

void SerrisZigZagPattern(void)
{

}

void SerrisLoopAroundPattern(void)
{

}

void SerrisMiddleArcPattern(void)
{

}

void SerrisEdgeArcPattern(void)
{

}

void SerrisZigZagPatternInit(void)
{

}

void SerrisLoopAroundPatternInit(void)
{

}

void SerrisMiddleArcPatternInit(void)
{

}

void SerrisEdgeArcPatternInit(void)
{

}

void SerrisDeterminePattern(void)
{

}

void SerrisDetermineSpeedboostingPattern(void)
{

}

void SerrisEndPattern(void)
{

}

void SerrisWaitingToEmerge(void)
{

}

void SerrisPartDyingInit(void)
{

}

void SerrisPartDying(void)
{

}

void SerrisPartFalling(void)
{

}

void SerrisBlockSetCollision(u8 caa)
{

}

void SerrisBlockInit(void)
{

}

void SerrisBlockIdle(void)
{

}

void SerrisBlockCrumbling(void)
{

}

void SerrisBlockFalling(void)
{

}

void SerrisCheckInWater(void)
{

}

void Serris(void)
{

}

void SerrisPart(void)
{

}

void SerrisBlock(void)
{

}
