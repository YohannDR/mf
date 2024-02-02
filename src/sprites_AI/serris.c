#include "sprites_AI/serris.h"
#include "globals.h"
#include "gba.h"
#include "macros.h"

#include "data/generic_data.h"
#include "data/sprite_data.h"
#include "data/sprites/x_parasite.h"
#include "data/sprites/serris.h"

#include "constants/particle.h"
#include "constants/samus.h"
#include "constants/sprite.h"

#include "structs/clipdata.h"
#include "structs/samus.h"
#include "structs/sprite.h"

#define SERRIS_ROOM_WATER_Y (BLOCK_SIZE * 11)

/**
 * @brief 47464 | 88 | Updates the palette of serris based on its health
 * 
 */
void SerrisUpdatePalette(void)
{
    u8 updatePalette;
    u16 health;
    u16 maxHealth;
    const u16* pPal;

    updatePalette = FALSE;
    health = gCurrentSprite.health;
    maxHealth = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    switch (gBossWork1)
    {
        case 0:
            if (health <= maxHealth * 2 / 3)
            {
                pPal = sSerrisSecondPhasePal;
                gBossWork1 = 1;
                updatePalette = TRUE;
            }
            break;

        case 1:
            if (health <= maxHealth / 3)
            {
                pPal = sSerrisThirdPhasePal;
                gBossWork1 = 2;
                updatePalette = TRUE;
            }
    }

    if (updatePalette)
    {
        DMA_SET(3, pPal, PALRAM_OBJ + 0x100, C_32_2_16(DMA_ENABLE, 16 * 2));
    }
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

/**
 * @brief 47790 | 88 | Sets the facing oam for serris
 * 
 */
void SerrisSetFacingOam(void)
{
    if (gCurrentSprite.properties & SP_SECONDARY_SPRITE)
    {
        if (gCurrentSprite.roomSlot == 0)
        {
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.pOam = sSerrisPartOam_Right;
            else
                gCurrentSprite.pOam = sSerrisPartOam_Left;
        }
    }
    else
    {
        if (gBossWork5 != 0)
        {
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.pOam = sSerrisOam_SpeedboostingRight;
            else
                gCurrentSprite.pOam = sSerrisOam_SpeedboostingLeft;
        }
        else
        {
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.pOam = sSerrisOam_Right;
            else
                gCurrentSprite.pOam = sSerrisOam_Left;
        }
    }

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 47818 | 190 | Initializes serris
 * 
 */
void SerrisInit(void)
{
    u8 gfxSlot;
    u8 ramSlot;
    u16 yPosition;
    u16 xPosition;

    if (gEquipment.suitMiscStatus & SMF_SPEED_BOOSTER)
    {
        gCurrentSprite.status = 0;
        return;
    }

    gCurrentSprite.yPosition += BLOCK_SIZE;

    gSerrisSpawnYPosition = gCurrentSprite.yPosition;
    gSerrisSpawnXPosition = gCurrentSprite.xPosition;

    gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN | SPRITE_STATUS_UNKNOWN_8 | SPRITE_STATUS_SAMUS_COLLIDING | SPRITE_STATUS_IGNORE_PROJECTILES;
    
    gCurrentSprite.rotation = 0;
    gCurrentSprite.scaling = Q_8_8(1.f);

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

    gCurrentSprite.hitboxTop = -(HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -(HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;

    gCurrentSprite.pose = 0x55;

    gCurrentSprite.pOam = sSerrisOam_Left;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work0 = 0;
    gBossWork1 = 0;

    gfxSlot = gCurrentSprite.spritesetGfxSlot;
    ramSlot = gCurrentSprite.primarySpriteRamSlot;
    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 0, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 1, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 2, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 3, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 4, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 5, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 6, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 7, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 8, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, 9, gfxSlot, ramSlot, yPosition, xPosition, 0);
}

/**
 * @brief 479a8 | 140 | Initializes serris to be waiting to appear
 * 
 */
void SerrisWaitingToAppearInit(void)
{
    u16 yPosition;
    u16 xPosition;

    yPosition = gSerrisSpawnYPosition - (BLOCK_SIZE * 10 + HALF_BLOCK_SIZE);
    xPosition = gSerrisSpawnXPosition;

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 5, 0);

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 6, 0);

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 7, 0);

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 11, 0);

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 12, 0);

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 13, 0);

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 17, 0);

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 18, 0);

    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 19, 0);

    gCurrentSprite.pose = 0x56;
}

/**
 * @brief 47ae8 | 38 | Handles serris waiting to appear
 * 
 */
void SerrisWaitingToAppear(void)
{
    u8 platformId;

    platformId = SerrisGetCurrentSamusPlatform();

    if (platformId == 3)
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;

        ScreenShakeStartHorizontal(60, 0x80 | 1);
        ScreenShakeStartVertical(60, 0x80 | 1);

        unk_3b1c(0x288);
    }
}

/**
 * @brief 47b20 | 18 | Handles serris starting the fight
 * 
 */
void SerrisStartFight(void)
{
    gCurrentSprite.pose = 0x53;
    SerrisSetFacingOam();
}

/**
 * @brief 47b38 | 20 | Initializes serris' first arc
 * 
 */
void SerrisFirstArcInit(void)
{
    SerrisEdgeArcPattern();

    if (gCurrentSprite.pose == 0x3E)
        gCurrentSprite.pose = 0x54;
}

/**
 * @brief 47b58 | 20 | Handles serris' first arc
 * 
 */
void SerrisFirstArc(void)
{
    SerrisEdgeArcPattern();

    if (gCurrentSprite.pose == 0x16)
        gCurrentSprite.pose = 0x51;
}

/**
 * @brief 47b78 | 7c | Handles the end of serris' first arc
 * 
 */
void SerrisFirstArcEnd(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        gCurrentSprite.rotation = PI / 2;
    else
        gCurrentSprite.rotation = 3 * PI / 2;

    if (gCurrentSprite.yPosition >= BLOCK_SIZE * 30)
    {
        gCurrentSprite.status &= ~(SPRITE_STATUS_NOT_DRAWN | SPRITE_STATUS_IGNORE_PROJECTILES);

        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
        gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;

        if (!(gCurrentSprite.properties & SP_SECONDARY_SPRITE))
        {
            gCurrentSprite.pose = 0x52;
            MusicPlay(0x3F, 7);
        }
        else
        {
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
        }
    }
    else
    {
        gCurrentSprite.yPosition += QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 47bf4 | 38 | Initializes serris to be dying
 * 
 */
void SerrisDyingInit(void)
{
    gCurrentSprite.pose = 0x48;

    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.invincibilityStunFlashTimer = 0;

    gCurrentSprite.work1 = 60 * 3;
    gCurrentSprite.work2 = 0;
}

/**
 * @brief 47c2c | 70 | Handles serris dying
 * 
 */
void SerrisDying(void)
{
    if (MOD_AND(gCurrentSprite.work1, 4))
    {
        if (gCurrentSprite.work1 & 4)
            gCurrentSprite.paletteRow = 13 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
        else
            gCurrentSprite.paletteRow = 0;
    }

    if (gCurrentSprite.work2 < UCHAR_MAX)
        gCurrentSprite.work2++;

    gCurrentSprite.rotation += gCurrentSprite.work2 / 4;
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x49;
}

/**
 * @brief 47c9c | 3c | Initializes serris to be turning into an X
 * 
 */
void SerrisTurningIntoXInit(void)
{
    gCurrentSprite.pose = 0x4A;

    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
    gCurrentSprite.status |= SPRITE_STATUS_ENABLE_MOSAIC;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.health = 1;
    gCurrentSprite.invincibilityStunFlashTimer = 0;
    gCurrentSprite.paletteRow = 0;

    gCurrentSprite.xParasiteTimer = ARRAY_SIZE(sXParasiteMosaicValues);
}

/**
 * @brief 47cd8 | 19c | Handles serris turning into an X
 * 
 */
void SerrisTurningIntoX(void)
{
    u16 yPosition;
    u16 xPosition;

    gCurrentSprite.rotation += gCurrentSprite.work2 / 4;

    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    gCurrentSprite.xParasiteTimer--;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    switch (gCurrentSprite.xParasiteTimer)
    {
        case 40:
            ParticleSet(yPosition + QUARTER_BLOCK_SIZE - PIXEL_SIZE, xPosition + QUARTER_BLOCK_SIZE + PIXEL_SIZE, PE_0x2F);

            ParticleSet(yPosition + HALF_BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE, PE_0x25);
            break;

        case 30:
            ParticleSet(yPosition - HALF_BLOCK_SIZE, xPosition + HALF_BLOCK_SIZE - PIXEL_SIZE, PE_0x26);

            ParticleSet(yPosition + BLOCK_SIZE, xPosition + HALF_BLOCK_SIZE, PE_0x25);
            break;

        case 18:
            ParticleSet(yPosition - HALF_BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE, PE_0x26);

            ParticleSet(yPosition + BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE, PE_0x25);
            break;

        case 10:
            ParticleSet(yPosition - (QUARTER_BLOCK_SIZE - PIXEL_SIZE), xPosition + QUARTER_BLOCK_SIZE + PIXEL_SIZE, PE_0x2F);

            ParticleSet(yPosition + HALF_BLOCK_SIZE, xPosition + HALF_BLOCK_SIZE, PE_0x25);
            break;

        case 0:
            gCurrentSprite.status &= ~SPRITE_STATUS_UNKNOWN_8;
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;

            gCurrentSprite.spriteId = PSPRITE_SPEEDBOOSTER_ABILITY;
            break;
    }

    if (gCurrentSprite.xParasiteTimer < 20)
    {
        SpriteLoadGfx(PSPRITE_SPEEDBOOSTER_ABILITY, 0, gCurrentSprite.xParasiteTimer);
    }
    else if (gCurrentSprite.xParasiteTimer == 20)
    {
        SpriteLoadPal(PSPRITE_SPEEDBOOSTER_ABILITY, 0, 5);
    }
}

void SerrisPartInit(void)
{

}

/**
 * @brief 4802c | 30 | Handles a serris part waiting to appear
 * 
 */
void SerrisPartWaitingToAppear(void)
{
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == SPRITE_POSE_IDLE_INIT)
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

/**
 * @brief 4805c | 28 | Handles a serris part during the start of the fight
 * 
 */
void SerrisPartStartFight(void)
{
    gCurrentSprite.work4--;

    if (gCurrentSprite.work4 == 0)
    {
        gCurrentSprite.pose = 0x53;
        SerrisSetFacingOam();
    }
}

/**
 * @brief 48084 | 184 | Handles serris doing a zig zag pattern
 * 
 */
void SerrisZigZagPattern(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;
    u8 endRotation;
    u16 yLimit;

    yLimit = BLOCK_SIZE * 12 + HALF_BLOCK_SIZE;

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.work1 == 0)
    {
        if (rotationCenterY <= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 1;
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }

    if (gCurrentSprite.work1 == 1)
    {
        if (rotationCenterY >= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 2;
        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }

    if (gCurrentSprite.work1 == 2)
    {
        if (rotationCenterY <= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 3;
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }

    if (gCurrentSprite.work1 == 3)
    {
        if (rotationCenterY >= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 4;
        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 3);
    }

    if (gCurrentSprite.work1 == 4)
    {
        if (rotationCenterY <= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = 0x16;
    }

    if (gCurrentSprite.work1 == 5)
    {
        if (rotationCenterY < BLOCK_SIZE * 17 - 1)
        {
            gCurrentSprite.yPosition += QUARTER_BLOCK_SIZE;
            return;
        }

        gCurrentSprite.work1 = 6;
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }

    if (gCurrentSprite.work1 == 6)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = 0x18;
    }

    if (gCurrentSprite.work1 == 7)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 == endRotation)
            gCurrentSprite.pose = 0x1A;
        else
            SerrisHandleRotationMovement();

    }
}

/**
 * @brief 48208 | 250 | Handles serris doing a loop around pattern
 * 
 */
void SerrisLoopAroundPattern(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;
    u8 endRotation;
    u32 movement;

    movement = QUARTER_BLOCK_SIZE;

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.work1 == 0)
    {
        if (gCurrentSprite.work2 != 3 * PI / 2)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 1;
    }

    if (gCurrentSprite.work1 == 1)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 3 > rotationCenterX)
            {
                gCurrentSprite.xPosition += movement;
                return;
            }

            gCurrentSprite.work1 = 2;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 1);
        }
        else
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 21 < rotationCenterX)
            {
                gCurrentSprite.xPosition -= movement;
                return;
            }

            gCurrentSprite.work1 = 2;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 1);
        }
    }

    if (gCurrentSprite.work1 == 2)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 3;
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 2);
    }

    if (gCurrentSprite.work1 == 3)
    {
        if (gCurrentSprite.work2 != PI / 2)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 4;
    }

    if (gCurrentSprite.work1 == 4)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 12 <= rotationCenterX)
            {
                gCurrentSprite.work1 = 5;
                SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 2);
            }
            else
            {
                gCurrentSprite.xPosition += movement;
                return;
            }

        }
        else
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 12 < rotationCenterX)
            {
                gCurrentSprite.xPosition -= movement;
                return;
            }

            gCurrentSprite.work1 = 5;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 2);
        }
    }

    if (gCurrentSprite.work1 == 5)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = PI;
        else
            endRotation = 0;

        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = 0x16;
    }

    if (gCurrentSprite.work1 == 6)
    {
        if (gCurrentSprite.work2 != PI / 2)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 7;
    }

    if (gCurrentSprite.work1 == 7)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 3 <= rotationCenterX)
            {
                gCurrentSprite.work1 = 8;
                SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 1);
            }
            else
            {
                gCurrentSprite.xPosition += movement;
                return;
            }

        }
        else
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 21 < rotationCenterX)
            {
                gCurrentSprite.xPosition -= movement;
                return;
            }

            gCurrentSprite.work1 = 8;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 1);
        }
    }

    if (gCurrentSprite.work1 == 8)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 == endRotation)
            gCurrentSprite.pose = 0x2;
        else
            SerrisHandleRotationMovement();
    }
}

/**
 * @brief 48458 | 154 | Handles serris doing a middle arc pattern
 * 
 */
void SerrisMiddleArcPattern(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;
    s32 endRotation;
    u32 movement;

    movement = QUARTER_BLOCK_SIZE;

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.work1 == 0)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = 0x16;
    }

    if (gCurrentSprite.work1 == 1)
    {
        if (rotationCenterY < BLOCK_SIZE * 13 - 1)
        {
            gCurrentSprite.yPosition += movement;
            return;
        }

        gCurrentSprite.work1 = 2;
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 2);
    }

    if (gCurrentSprite.work1 == 2)
    {
        if (gCurrentSprite.work2 != PI / 2)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 3;
    }

    if (gCurrentSprite.work1 == 3)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 6 <= rotationCenterX)
            {
                gCurrentSprite.work1 = 4;
                SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 2);
            }
            else
            {
                gCurrentSprite.xPosition += movement;
                return;
            }
        }
        else
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 18 < rotationCenterX)
            {
                gCurrentSprite.xPosition -= movement;
                return;
            }

            gCurrentSprite.work1 = 4;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 2);

        }
    }

    if (gCurrentSprite.work1 == 4)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 == endRotation)
            gCurrentSprite.pose = 0x18;
        else
            SerrisHandleRotationMovement();
    }
}

/**
 * @brief 485ac | 74 | Handles serris doing an edge arc pattern
 * 
 */
void SerrisEdgeArcPattern(void)
{
    s32 endRotation;

    if (gCurrentSprite.work1 == 0)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = 0x16;
    }

    if (gCurrentSprite.work1 == 1)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 == endRotation)
            gCurrentSprite.pose = 0x18;
        else
            SerrisHandleRotationMovement();
    }
}

/**
 * @brief 48620 | a4 | Initializes serris to do a zig zag pattern
 * 
 */
void SerrisZigZagPatternInit(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        gCurrentSprite.rotation = 3 * PI / 2;
        gCurrentSprite.xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 24;
    }
    else
    {
        gCurrentSprite.rotation = PI / 2;
        gCurrentSprite.xPosition = gSerrisSpawnXPosition;
    }

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.yPosition < BLOCK_SIZE * 12 + HALF_BLOCK_SIZE)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
        else
            gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;

        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.pose = 0x38;
        gCurrentSprite.work1 = 0;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }
    else
    {
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 486c4 | a4 | Initializes serris to do a loop around pattern
 * 
 */
void SerrisLoopAroundPatternInit(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        gCurrentSprite.rotation = 3 * PI / 2;
        gCurrentSprite.xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 24;
    }
    else
    {
        gCurrentSprite.rotation = PI / 2;
        gCurrentSprite.xPosition = gSerrisSpawnXPosition;
    }

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.yPosition < BLOCK_SIZE * 13)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
        else
            gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;

        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.pose = 0x3A;
        gCurrentSprite.work1 = 0;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }
    else
    {
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 48768 | 9c | Initializes serris to do a middle arc pattern
 * 
 */
void SerrisMiddleArcPatternInit(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        gCurrentSprite.rotation = 3 * PI / 2;
    }
    else
    {
        gCurrentSprite.rotation = PI / 2;
    }
    
    gCurrentSprite.xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 12;

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.yPosition < BLOCK_SIZE * 12)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
        else
            gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;

        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.pose = 0x3C;
        gCurrentSprite.work1 = 0;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 2);
    }
    else
    {
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 48804 | ac | Initializes serris to do an edge arc pattern
 * 
 */
void SerrisEdgeArcPatternInit(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        gCurrentSprite.rotation = 3 * PI / 2;
        gCurrentSprite.xPosition = gSerrisSpawnXPosition + -(BLOCK_SIZE * 18);
    }
    else
    {
        gCurrentSprite.rotation = PI / 2;
        gCurrentSprite.xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 6;
    }

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.yPosition < BLOCK_SIZE * 12)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
        else
            gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;

        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.pose = 0x3E;
        gCurrentSprite.work1 = 0;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 2);
    }
    else
    {
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 488b0 | ac | Determines the next pattern of Serris
 * 
 */
void SerrisDeterminePattern(void)
{
    u8 pose;
    u8 xFlipped;
    u32 rng;
    u32 rngParam;

    xFlipped = FALSE;

    rngParam = gXParasiteTargetYPosition;
    rngParam = gSpriteRandomNumber;
    rng = gXParasiteTargetYPosition + gSpriteRandomNumber;

    switch (rng % 16)
    {
        case 1:
        case 2:
        case 3:
        case 4:
            pose = 0x2;
            break;

        case 5:
        case 6:
        case 7:
        case 8:
            pose = 0x18;
            break;

        case 9:
        case 10:
        case 11:
        case 12:
            pose = 0x1A;
            break;

        case 13:
        case 14:
        default:
            pose = 0x1C;
    }

    if ((gFrameCounter16Bit + gCurrentSprite.currentAnimationFrame) % 2)
        xFlipped++;

    gBossWork2 = pose;
    gBossWork3 = xFlipped;
}

void SerrisDetermineSpeedboostingPattern(void)
{
    // https://decomp.me/scratch/5QTfr

    u8 pose;
    u8 xFlipped;
    u32 rng;

    xFlipped = FALSE;

    rng = gSpriteRandomNumber % 8;

    if (rng == 1)
    {
        pose = 0x2;
    }
    else if (rng == 2)
    {
        pose = 0x2;
        xFlipped = TRUE;
    }
    else if (rng == 3)
    {
        pose = 0x18;
    }
    else if (rng == 4)
    {
        pose = 0x18;
        xFlipped = TRUE;
    }
    else if (rng == 5)
    {
        pose = 0x1A;
    }
    else if (rng == 6)
    {
        pose = 0x1A;
        xFlipped = TRUE;
    }
    else if (rng == 7)
    {
        pose = 0x2;
    }
    else
    {
        pose = 0x2;
        xFlipped = TRUE;
    }

    gBossWork2 = pose;
    gBossWork3 = xFlipped;
}

/**
 * @brief 489bc | 70 | Ends a movement pattern
 * 
 */
void SerrisEndPattern(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        gCurrentSprite.rotation = PI / 2;
    }
    else
    {
        gCurrentSprite.rotation = 3 * PI / 2;
    }

    if (gCurrentSprite.yPosition >= BLOCK_SIZE * 30)
    {
        if (!(gCurrentSprite.properties & SP_SECONDARY_SPRITE))
            gBossWork4 = 65 + gSpriteRandomNumber * 2;

        gCurrentSprite.work4 = gBossWork4,
        gCurrentSprite.pose = 0x8;
    }
    else
    {
        gCurrentSprite.yPosition += QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 48a2c | 11c | Handles serris waiting to emerge
 * 
 */
void SerrisWaitingToEmerge(void)
{
    u16 xPosition;

    gCurrentSprite.work4--;

    if (gCurrentSprite.work4 == 0)
    {
        gCurrentSprite.pose = gBossWork2;

        if (gBossWork3)
            gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
        else
            gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;

        gCurrentSprite.yPosition = gSerrisSpawnYPosition;
        SerrisSetFacingOam();
        return;
    }

    if (gCurrentSprite.work4 != 40)
        return;

    if (gCurrentSprite.properties & SP_SECONDARY_SPRITE)
        return;

    if (gBossWork5 != 0)
        SerrisDetermineSpeedboostingPattern();
    else
        SerrisDeterminePattern();

    if (gBossWork2 == 0x1C)
    {
        if (gBossWork3)
            xPosition = gSerrisSpawnXPosition + -(BLOCK_SIZE * 18);
        else
            xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 6;
    }
    else if (gBossWork2 == 0x1A)
    {
        xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 12;
    }
    else
    {
        if (gBossWork3)
            xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 24;
        else
            xPosition = gSerrisSpawnXPosition;
    }

    ParticleSet(gSerrisSpawnYPosition - (BLOCK_SIZE * 2 - EIGHTH_BLOCK_SIZE), xPosition, PE_SPRITE_ENTER_OR_EXIT_WATER);
    SoundPlay(0x293);
}

/**
 * @brief 48b48 | 34 | Initializes a serris part to be dying
 * 
 */
void SerrisPartDyingInit(void)
{
    gCurrentSprite.pose = 0x48;

    gCurrentSprite.work1 = (gCurrentSprite.roomSlot + 1) * 16;
    gCurrentSprite.work4 = 0;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
}

void SerrisPartDying(void)
{

}

void SerrisPartFalling(void)
{

}

/**
 * @brief 48cd4 | 1c | Sets the collision for a serris block
 * 
 * @param caa Clipdata affecting action
 */
void SerrisBlockSetCollision(u8 caa)
{
    gCurrentClipdataAffectingAction = caa;

    ClipdataProcess(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
}

/**
 * @brief 48cf0 | 6c | Initializes a serris block
 * 
 */
void SerrisBlockInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    if (gCurrentSprite.roomSlot != 0)
        gCurrentSprite.pOam = sSerrisBlockOam_Idle1;
    else
        gCurrentSprite.pOam = sSerrisBlockOam_Idle0;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.samusCollision = SSC_NONE;

    SerrisBlockSetCollision(CAA_MAKE_SOLID);
}

/**
 * @brief 48d5c | 40 | Handles a serris block being idle
 * 
 */
void SerrisBlockIdle(void)
{
    // Wait for serris to spawn
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == SPRITE_POSE_IDLE_INIT)
    {
        gCurrentSprite.pose = SERRIS_BLOCK_POSE_CRUMBLING;

        // Set random timer before the block starts crumbling 
        gCurrentSprite.work1 = 8 + gSpriteRandomNumber * 2;
    }
}

/**
 * @brief 48d9c | 9c | Handles a serris block crumbling
 * 
 */
void SerrisBlockCrumbling(void)
{
    if (gCurrentSprite.work1 != 0)
    {
        // Delay before crumbling
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
        {
            // Set crumbling animation
            if (gCurrentSprite.roomSlot != 0)
                gCurrentSprite.pOam = sSerrisBlockOam_Crumbling1;
            else
                gCurrentSprite.pOam = sSerrisBlockOam_Crumbling0;

            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
    else if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
    {
        // Finished crumbling, set falling
        if (gCurrentSprite.roomSlot != 0)
            gCurrentSprite.pOam = sSerrisBlockOam_Falling1;
        else
            gCurrentSprite.pOam = sSerrisBlockOam_Falling0;

        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SERRIS_BLOCK_POSE_FALLING;
    }
    else if (gCurrentSprite.currentAnimationFrame == ARRAY_SIZE(sSerrisBlockOam_Crumbling1) / 2)
    {
        // ^ Probably intended to check for the middle of the animation
        // so using FRAME_DATA_LAST_ANIM_FRAME instead of ARRAY_SIZE might be better

        if (gCurrentSprite.animationDurationCounter == 1)
        {
            // Remove collision
            SerrisBlockSetCollision(CAA_REMOVE_SOLID);
        }
        else if (gCurrentSprite.animationDurationCounter == 4)
        {
            ParticleSet(gCurrentSprite.yPosition + HALF_BLOCK_SIZE + PIXEL_SIZE, gCurrentSprite.xPosition, PE_ENTER_OR_EXIT_WATER);
        }
    }
}

/**
 * @brief 48e38 | 30 | Handles a serris block falling
 * 
 */
void SerrisBlockFalling(void)
{
    gCurrentSprite.yPosition += QUARTER_BLOCK_SIZE;
    gCurrentSprite.yPosition += ONE_SUB_PIXEL;

    // Wait for the sprite to exit the room and be off screen
    if (gCurrentSprite.yPosition >= BLOCK_SIZE * 20 && !(gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN))
    {
        // Destroy sprite
        gCurrentSprite.status = 0;
    }
}

/**
 * @brief 48e68 | cc | Checks if samus is colliding with the water
 * 
 */
void SerrisCheckInWater(void)
{
    if (gUnk_030007c0[0] > gCurrentSprite.yPosition)
    {
        if (gUnk_030007c0[0] > SERRIS_ROOM_WATER_Y && gCurrentSprite.yPosition <= SERRIS_ROOM_WATER_Y)
        {
            if (!(gCurrentSprite.status & SPRITE_STATUS_NOT_DRAWN))
            {
                ParticleSet(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition, PE_SPRITE_ENTER_OR_EXIT_WATER);

                if (gBossWork5 != 0)
                    SoundPlay(0x28D);
                else
                    SoundPlay(0x28A);
            }

            gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_COLLIDING;
        }
    }
    else if (gUnk_030007c0[0] < gCurrentSprite.yPosition)
    {
        if (gUnk_030007c0[0] < SERRIS_ROOM_WATER_Y && gCurrentSprite.yPosition >= SERRIS_ROOM_WATER_Y)
        {
            if (!(gCurrentSprite.status & SPRITE_STATUS_NOT_DRAWN))
            {
                ParticleSet(gCurrentSprite.yPosition + HALF_BLOCK_SIZE, gCurrentSprite.xPosition, PE_SPRITE_ENTER_OR_EXIT_WATER);

                if (gBossWork5 != 0)
                    SoundPlay(0x28C);
                else
                    SoundPlay(0x289);
            }

            gCurrentSprite.status |= SPRITE_STATUS_SAMUS_COLLIDING;
        }
    }
}

void Serris(void)
{

}

/**
 * @brief 4942c | 414 | Serris part AI
 * 
 */
void SerrisPart(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].work0 != 0)
        return;

    if (gSpriteData[ramSlot].pose == 0x48)
    {
        if (gCurrentSprite.pose < 0x47)
            gCurrentSprite.pose = 0x47;
    }
    else if (gBossWork5 != 0)
    {
        if (gFrameCounter8Bit & 4)
        {
            gCurrentSprite.paletteRow = 5;
        }        
        else
        {
            gCurrentSprite.paletteRow = 6;
        }
    }
    else
    {
        gCurrentSprite.paletteRow = 0;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            SerrisPartInit();
            break;

        case 0x55:
            SerrisPartWaitingToAppear();
            break;

        case SPRITE_POSE_IDLE_INIT:
            SerrisPartStartFight();
            break;

        case 0x53:
            SerrisFirstArcInit();
            break;

        case 0x54:
            SerrisFirstArc();
            break;

        case 0x47:
            SerrisPartDyingInit();
            break;

        case 0x48:
            SerrisPartDying();
            break;

        case 0x4A:
            SerrisPartFalling();
            break;

        case 0x51:
            SerrisFirstArcEnd();
            break;

        case 0x8:
            SerrisWaitingToEmerge();
            break;

        case 0x16:
            SerrisEndPattern();
            break;

        case SPRITE_POSE_IDLE:
            SerrisZigZagPatternInit();
            break;

        case 0x18:
            SerrisLoopAroundPatternInit();
            break;

        case 0x1A:
            SerrisMiddleArcPatternInit();
            break;

        case 0x1C:
            SerrisEdgeArcPatternInit();
            break;

        case 0x38:
            SerrisZigZagPattern();
            break;

        case 0x3A:
            SerrisLoopAroundPattern();
            break;

        case 0x3C:
            SerrisMiddleArcPattern();
            break;

        case 0x3E:
            SerrisEdgeArcPattern();
    }

    if (gBossWork5 != 0)
    {
        switch (gCurrentSprite.pose)
        {
            case 0x51:
                SerrisFirstArcEnd();
                break;

            case 0x8:
                SerrisWaitingToEmerge();
                break;

            case 0x16:
                SerrisEndPattern();
                break;

            case SPRITE_POSE_IDLE:
                SerrisZigZagPatternInit();
                break;

            case 0x18:
                SerrisLoopAroundPatternInit();
                break;

            case 0x1A:
                SerrisMiddleArcPatternInit();
                break;

            case 0x1C:
                SerrisEdgeArcPatternInit();
                break;

            case 0x38:
                SerrisZigZagPattern();
                break;

            case 0x3A:
                SerrisLoopAroundPattern();
                break;

            case 0x3C:
                SerrisMiddleArcPattern();
                break;

            case 0x3E:
                SerrisEdgeArcPattern();
        }
    }
}

/**
 * @brief 49840 | 48 | Serris block AI
 * 
 */
void SerrisBlock(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            SerrisBlockInit();
            break;

        case SPRITE_POSE_IDLE:
            SerrisBlockIdle();
            break;

        case SERRIS_BLOCK_POSE_CRUMBLING:
            SerrisBlockCrumbling();
            break;

        case SERRIS_BLOCK_POSE_FALLING:
            SerrisBlockFalling();
            break;
    }
}
