#include "sprites_AI/gunship.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "data/sprites/gunship.h"
#include "data/samus_data.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/clipdata.h"

#include "structs/samus.h"
#include "structs/sprite.h"

/**
 * @brief 1fad8 | 140 | Checks which gunship beam should spawn
 * 
 */
void GunshipCheckSpawnBeam(void)
{
    switch (gCurrentSprite.work2)
    {
        case 6:
            SpriteSpawnSecondary(SSPRITE_GUNSHIP_BEAM, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE * 3 + QUARTER_BLOCK_SIZE - PIXEL_SIZE), gCurrentSprite.xPosition, 0);
            SoundPlay(0xFD);
            break;

        case 9:
            SpriteSpawnSecondary(SSPRITE_GUNSHIP_BEAM, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE * 3 - QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition, 0);
            break;

        case 12:
            SpriteSpawnSecondary(SSPRITE_GUNSHIP_BEAM, 3, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE), gCurrentSprite.xPosition, 0);
            break;

        case 15:
            SpriteSpawnSecondary(SSPRITE_GUNSHIP_BEAM, 5, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - BLOCK_SIZE * 2, gCurrentSprite.xPosition, 0);
            break;

        case 18:
            SpriteSpawnSecondary(SSPRITE_GUNSHIP_BEAM, 7, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE), gCurrentSprite.xPosition, 0);
            break;

        case 21:
            SpriteSpawnSecondary(SSPRITE_GUNSHIP_BEAM, 9, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition, 0);
            break;
    }
}

/**
 * @brief 1fc18 | 108 | Initializes a gunship
 * 
 */
void GunshipInit(void)
{
    gCurrentSprite.xPosition -= HALF_BLOCK_SIZE;

    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 6 + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.pOam = sGunshipOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 0;
    gCurrentSprite.work2 = 0;

    if (!gIsLoadingFile && !gUnk_03000be3 && !gDebugFlag)
    {
        gCurrentSprite.pose = 0x18;
        
        SAMUS_SET_POSE(SPOSE_ON_SAVE_PAD);

        gCurrentSprite.status |= SS_SAMUS_DETECTED;
    }
    else
    {
        if (gSamusData.pose == SPOSE_LOADING_SAVE)
            gCurrentSprite.pose = 0x1A;
        else
            gCurrentSprite.pose = 0x2;
    }

    SpriteSpawnSecondary(SSPRITE_GUNSHIP_PART, 0x0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
}

/**
 * @brief 1fd20 | 4c | Handles the gunship navigation
 * 
 */
void GunshipNavigation(void)
{
    gCurrentSprite.status |= SS_SAMUS_DETECTED;

    if (gCurrentSprite.work2 < 24)
    {
        if (gCurrentSprite.work2 == 0)
            gDisableDrawingSamusAndScrollingFlag = FALSE;

        gCurrentSprite.work2++;
        GunshipCheckSpawnBeam();
        return;
    }

    gCurrentSprite.pose = 0x45;
    gCurrentSprite.work1 = 60;
}

/**
 * @brief 1fd6c | 8c | Handles a gunship being idle
 * 
 */
void GunshipIdle(void)
{
    if (SpriteUtilCheckSamusStopSpritesPose())
        return;

    if (gCurrentSprite.status & SS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work2 <= 35)
        {
            gCurrentSprite.work2++;
        }
        else if (!SpriteUtilCheckSamusMorphed())
        {
            if (gSamusData.invincibilityTimer != 0)
                gSamusData.invincibilityTimer = 0;

            SAMUS_SET_POSE(SPOSE_ON_SAVE_PAD);

            gSamusData.yPosition = gCurrentSprite.yPosition - PIXEL_SIZE;
            gSamusData.xPosition = gCurrentSprite.xPosition;

            gCurrentSprite.pose = 0x37;
            gCurrentSprite.work1 = 30;
            return;
        }

        GunshipCheckSpawnBeam();
    }
    else
    {
        gCurrentSprite.work2 = 0;
    }
}

/**
 * @brief 1fdf8 | 34 | Handles a gunship locking samus
 * 
 */
void GunshipLockingSamus(void)
{
    gCurrentSprite.status |= SS_SAMUS_DETECTED;

    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = 0x38;
        gCurrentSprite.work1 = 60 - 1;
    }
}

/**
 * @brief 1fe2c | 4c | Handles a gunship pulling samus up
 * 
 */
void GunshipPullingSamusUp(void)
{
    gCurrentSprite.status |= SS_SAMUS_DETECTED;
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = 0x39;

        gCurrentSprite.work2 = 0;
        gCurrentSprite.work3 = 0;
        gCurrentSprite.work4 = 0;
    }
    else
    {
        gSamusData.yPosition -= PIXEL_SIZE;
    }
}

/**
 * @brief 1fe78 | 48 | Handles a gunship refilling samus
 * 
 */
void GunshipRefill(void)
{
    gCurrentSprite.status |= SS_SAMUS_DETECTED;

    if (SpriteUtilRefillEnergy())
        return;

    if (SpriteUtilRefillMissiles())
        return;

    if (SpriteUtilRefillPowerBombs())
        return;

    gCurrentSprite.pose = 0x3A;

    gCurrentSprite.work1 = TrySpawnMessageBanner(0xC); // TODO enum
}

/**
 * @brief 1fec0 | 68 | Handles a gunship waiting during the save prompt
 * 
 */
void GunshipSavePrompt(void)
{
    gCurrentSprite.status |= SS_SAMUS_DETECTED;

    if (gSpriteData[gCurrentSprite.work1].status != 0)
        return;

    if (gSpriteData[gCurrentSprite.work1].work2 == 0x1)
    {
        gCurrentSprite.pose = 0x3B;
    }
    else
    {
        gCurrentSprite.pose = 0x18;

        gPauseScreenFlag = 0x3; // TODO enum
        gSubGameMode1++;
    }
}

/**
 * @brief 1ff28 | 2c | Handles a gunship spawning the "saved" prompt
 * 
 */
void GunshipSpawnSavedPrompt(void)
{
    gCurrentSprite.status |= SS_SAMUS_DETECTED;

    gCurrentSprite.pose = 0x3C;
    gCurrentSprite.work1 = TrySpawnMessageBanner(0xD); // TODO enum
}

/**
 * @brief 1ff54 | 50 | Handles a gunship waiting during the "saved" prompt
 * 
 */
void GunshipSavedPrompt(void)
{
    gCurrentSprite.status |= SS_SAMUS_DETECTED;

    if (gSpriteData[gCurrentSprite.work1].status != 0)
        return;

    gCurrentSprite.pose = 0x18;
    gPauseScreenFlag = 0x3; // TODO enum
    gSubGameMode1++;
}

/**
 * @brief 1ffa4 | 64 | Handles a gunship releasing samus
 * 
 */
void GunshipReleasingSamus(void)
{
    gCurrentSprite.status |= SS_SAMUS_DETECTED;

    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = 0x46;
        gCurrentSprite.work1 = 30;

        SAMUS_SET_POSE(SPOSE_FACING_FOREGROUND);

        gSamusData.lastWallTouchedMidAir = 0x5;
    }
    else
    {
        gSamusData.yPosition += PIXEL_SIZE;
    }
}

/**
 * @brief 20008 | 64 | Handles a gunship after samus was released
 * 
 */
void GunshipSamusReleased(void)
{
    if (gSamusData.pose == SPOSE_FACING_FOREGROUND)
    {
        gCurrentSprite.status |= SS_SAMUS_DETECTED;
        return;
    }
    
    if (gCurrentSprite.status & SS_SAMUS_DETECTED)
    {
        gCurrentSprite.work1 = 30;
        return;
    }

    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.work2 = 0;
    }
}

/**
 * @brief 2006c | 44 | Handles a gunship during a save load
 * 
 */
void GunshipLoadingSave(void)
{
    if (gCurrentSprite.status & SS_SAMUS_DETECTED)
    {
        gCurrentSprite.work1 = 30;
        return;
    }

    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.work2 = 0;
    }
}

/**
 * @brief 200b0 | 74 | Initializes a gunship beam
 * 
 */
void GunshipBeamInit(void)
{
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;

    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(QUARTER_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(QUARTER_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.pOam = sGunshipBeamOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.work1 = 9;
}

/**
 * @brief 20124 | a8 | Handles a gunship beam moving down
 * 
 */
void GunshipBeamMovingDown(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].pose == SPRITE_POSE_IDLE)
    {
        if (gSpriteData[ramSlot].xPosition - HALF_BLOCK_SIZE >= gSamusData.xPosition ||
            gSpriteData[ramSlot].xPosition + HALF_BLOCK_SIZE <= gSamusData.xPosition ||
            gSpriteData[ramSlot].yPosition - ONE_SUB_PIXEL != gSamusData.yPosition)
        {
            gCurrentSprite.status = 0;
            return;
        }
    }
    else if (gSpriteData[ramSlot].pose == 0x46)
    {
        gCurrentSprite.status = 0;
        return;
    }

    if (gCurrentSprite.roomSlot != 0)
    {
        gCurrentSprite.roomSlot--;

        gCurrentSprite.yPosition += PIXEL_SIZE;
    }
    else
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 != 0)
        {
            gCurrentSprite.yPosition += PIXEL_SIZE;
        }
        else
        {
            gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
            gCurrentSprite.work1 = 9;
        }

        if (gSpriteData[ramSlot].pose == 0x37)
            gCurrentSprite.pose = 0x18;
    }
}

/**
 * @brief 201cc | 54 | Handles a gunship beam moving up
 * 
 */
void GunshipBeamMovingUp(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    gCurrentSprite.work1++;

    if (gCurrentSprite.work1 > 8)
    {
        gCurrentSprite.work1 = 0;

        gCurrentSprite.yPosition += HALF_BLOCK_SIZE;
    }
    else
    {
        gCurrentSprite.yPosition -= PIXEL_SIZE;
    }

    if (gSpriteData[ramSlot].pose == 0x39)
    {
        gCurrentSprite.status = 0;
    }
}

/**
 * @brief 20220 | 64 | Updates the palette of a gunship
 * 
 */
void GunshipUpdatePalette(void)
{
    u32 offset;
    const u16* pal;

    offset = gCurrentSprite.work1 * 16;
    pal = &sGunshipFlashingPal[offset + 11];

    DMA_SET(3, pal, PALRAM_OBJ + 0x136, C_32_2_16(DMA_ENABLE, 5));

    if (gCurrentSprite.work2 != 0)
    {
        if (gCurrentSprite.work1 != 0)
        {
            gCurrentSprite.work1--;
        }
        else
        {
            gCurrentSprite.work2 = 0;
            gCurrentSprite.work1 = 1;
        }
    }
    else
    {
        if (gCurrentSprite.work1 > 5)
        {
            gCurrentSprite.work2 = 1;
            gCurrentSprite.work1 = 5;
        }
        else
        {
            gCurrentSprite.work1++;
        }
    }
}

/**
 * @brief 20284 | 1fc | Gunship AI
 * 
 */
void Gunship(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.xPosition - HALF_BLOCK_SIZE < gSamusData.xPosition &&
        gCurrentSprite.xPosition + HALF_BLOCK_SIZE > gSamusData.xPosition &&
        gCurrentSprite.yPosition - ONE_SUB_PIXEL == gSamusData.yPosition)
    {
        gCurrentSprite.status |= SS_SAMUS_DETECTED;
    }
    else
    {
        gCurrentSprite.status &= ~SS_SAMUS_DETECTED;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            GunshipInit();
            break;

        case SPRITE_POSE_IDLE:
            GunshipIdle();
            break;

        case 0x37:
            GunshipLockingSamus();
            break;

        case 0x38:
            GunshipPullingSamusUp();
            break;

        case 0x39:
            GunshipRefill();
            break;

        case 0x3A:
            GunshipSavePrompt();
            break;

        case 0x3B:
            GunshipSpawnSavedPrompt();
            break;

        case 0x3C:
            GunshipSavedPrompt();
            break;

        case 0x18:
            GunshipNavigation();
            break;

        case 0x45:
            GunshipReleasingSamus();
            break;

        case 0x46:
            GunshipSamusReleased();
            break;

        case 0x1A:
            GunshipLoadingSave();
    }

    if (gCurrentSprite.status & SS_SAMUS_DETECTED)
        gCurrentSprite.drawOrder = 4;
    else
        gCurrentSprite.drawOrder = 12;
}

/**
 * @brief 20480 | 54 | Gunship beam AI
 * 
 */
void GunshipBeam(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            GunshipBeamInit();

        case SPRITE_POSE_IDLE:
            GunshipBeamMovingDown();
            break;

        case 0x18:
            GunshipBeamMovingUp();
            break;
    }

    if (gCurrentSprite.roomSlot == 0 && gCurrentSprite.status == 0)
        SoundStop(0xFD);
}

/**
 * @brief 204d4 | a4 | Gunship part AI
 * 
 */
void GunshipPart(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;

            gCurrentSprite.drawOrder = 12;
            gCurrentSprite.samusCollision = SSC_NONE;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 6 + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 6);

            gCurrentSprite.hitboxTop = -PIXEL_SIZE;
            gCurrentSprite.hitboxBottom = PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
            gCurrentSprite.hitboxRight = PIXEL_SIZE;

            gCurrentSprite.pOam = sGunshipPartOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;

            gCurrentSprite.work1 = 0;
            gCurrentSprite.work2 = 0;
            gCurrentSprite.work3 = 0;

            gCurrentSprite.pose = SPRITE_POSE_IDLE;

        default:
            gCurrentSprite.work3++;

            if (MOD_AND(gCurrentSprite.work3, 8) == 0)
                GunshipUpdatePalette();
    }
}
