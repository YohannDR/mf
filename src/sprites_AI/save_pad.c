#include "sprites_AI/save_pad.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "data/sprites/save_pad.h"
#include "data/samus_data.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/clipdata.h"

#include "structs/samus.h"
#include "structs/sprite.h"

#define SAVE_PLATFORM_POSE_SPAWN_SAVE_PROMPT 0x7
#define SAVE_PLATFORM_POSE_IDLE_AFTER_PROMPT 0x8
#define SAVE_PLATFORM_POSE_SINKING 0x18
#define SAVE_PLATFORM_POSE_RISING 0x1A
#define SAVE_PLATFORM_POSE_RISING_AFTER_PROMPT 0x1C

#define SAVE_PAD_HOLOGRAM_POSE_OPENING SPRITE_POSE_IDLE
#define SAVE_PAD_HOLOGRAM_POSE_FLASHING 0x18
#define SAVE_PAD_HOLOGRAM_POSE_CLOSING 0x1A

/**
 * @brief 1f2c0 | c4 | Initializes a save pad
 * 
 */
void SavePadInit(void)
{
    u8 spriteSlot;
    
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.samusCollision = SSC_SAVE_PLATFORM;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (EventCheckWith_SaveDisabled())
    {
        gCurrentSprite.hitboxTop = -(BLOCK_SIZE - EIGHTH_BLOCK_SIZE);
        gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
        gCurrentSprite.hitboxRight = BLOCK_SIZE;

        gCurrentSprite.pOam = sSavePadOam_Disabled;
    }
    else
    {
        gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
        gCurrentSprite.hitboxLeft = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE);
        gCurrentSprite.hitboxRight = BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE;

        gCurrentSprite.pOam = sSavePadOam_Idle;

        spriteSlot = SpriteSpawnSecondary(SSPRITE_SAVE_PLATFORM, 0, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE - PIXEL_SIZE - PIXEL_SIZE / 2),
            gCurrentSprite.xPosition, 0
        );

        if (spriteSlot == UCHAR_MAX)
        {
            gCurrentSprite.status = 0;
            return;
        }
    }

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.standingOnSprite = FALSE;
    gCurrentSprite.bgPriority = 1;
}

/**
 * @brief 1f384 | 4 | Handles a save pad being idle
 * 
 */
void SavePadIdle(void)
{
    return;
}

/**
 * @brief 1f388 | 110 | Initializes a save platform
 * 
 */
void SavePlatformInit(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;

    gCurrentSprite.samusCollision = SSC_SAVE_PLATFORM;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
    gCurrentSprite.hitboxRight = BLOCK_SIZE;

    gCurrentSprite.pOam = sSavePlatformOam_Floating;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.work4 = 0;
    gCurrentSprite.standingOnSprite = FALSE;

    gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;

    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.bgPriority = 1;

    if (gIsLoadingFile)
    {
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_ON_TOP;

        gCurrentSprite.work1 = 16;
        gCurrentSprite.work2 = 0;

        gCurrentSprite.pose = SAVE_PLATFORM_POSE_IDLE_AFTER_PROMPT;

        gSpriteData[ramSlot].work4 = 0;

        gSpriteData[ramSlot].pOam = sSavePadOam_LockedIn;
        gSpriteData[ramSlot].animationDurationCounter = 0;
        gSpriteData[ramSlot].currentAnimationFrame = 0;

        gCurrentSprite.yPosition = gSpriteData[ramSlot].yPosition - HALF_BLOCK_SIZE;

        SpriteSpawnSecondary(SSPRITE_SAVE_PAD_HOLOGRAM, 1, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSpriteData[ramSlot].yPosition,
            gSpriteData[ramSlot].xPosition, 0
        );
    }
}

/**
 * @brief 1f498 | 7c | Handles a save platform being idle
 * 
 */
void SavePlatformIdle(void)
{
    u8 offset;
    s16 movement;

    // Handle floating movement
    offset = gCurrentSprite.work4;
    movement = sSavePlatformFloatingYMovement[offset];

    if (movement == SHORT_MAX)
    {
        movement = sSavePlatformFloatingYMovement[0];
        offset = 0;
    }

    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    if (offset == 1)
        SoundPlay(0x10C);

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_ON_TOP)
    {
        // Apply movement to samus if standing on the platform
        gSamusData.yPosition += movement;

        if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
            gCurrentSprite.pose = SAVE_PLATFORM_POSE_SINKING;
    }
}

/**
 * @brief 1f514 | 114 | Handles a save platform sinking
 * 
 */
void SavePlatformSinking(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (CHECK_ALL_FLAGS(gCurrentSprite.status, SPRITE_STATUS_SAMUS_DETECTED | SPRITE_STATUS_SAMUS_ON_TOP))
    {
        if (gCurrentSprite.yPosition == gSpriteData[ramSlot].yPosition - HALF_BLOCK_SIZE)
        {
            if (!SamusCheckMorphed())
            {
                if (gSamusData.invincibilityTimer != 0)
                    gSamusData.invincibilityTimer = 0;
    
                gSamusData.xPosition = gCurrentSprite.xPosition;
    
                SAMUS_SET_POSE(SPOSE_ON_SAVE_PAD);
    
                gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_ON_TOP;
                gCurrentSprite.standingOnSprite = FALSE;
                gCurrentSprite.samusCollision = SSC_NONE;
    
                gCurrentSprite.work1 = 16;
                gCurrentSprite.pose = SAVE_PLATFORM_POSE_SPAWN_SAVE_PROMPT;
                gSpriteData[ramSlot].work4 = 0;
    
                gSpriteData[ramSlot].pOam = sSavePadOam_LockedIn;
                gSpriteData[ramSlot].animationDurationCounter = 0;
                gSpriteData[ramSlot].currentAnimationFrame = 0;
    
                SpriteSpawnSecondary(SSPRITE_SAVE_PAD_HOLOGRAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gSpriteData[ramSlot].yPosition,
                    gSpriteData[ramSlot].xPosition, 0
                );
            }
        }
        else
        {
            gCurrentSprite.yPosition += ONE_SUB_PIXEL;
            gSamusData.yPosition += ONE_SUB_PIXEL;

            if (MOD_AND(gFrameCounter8Bit, 16) == 0)
                SoundPlay(0x10B);
        }
    }
    else
    {
        gCurrentSprite.pose = SAVE_PLATFORM_POSE_RISING;
    }
}

/**
 * @brief 1f628 | c0 | Handles a save platform spawning the save prompt
 * 
 */
void SavePlatformSpawnSavePrompt(void)
{
    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
            gCurrentSprite.work2 = TrySpawnMessageBanner(0xC); // TODO enum

        return;
    }

    if (gSpriteData[gCurrentSprite.work2].pose == 0x1A) // TODO enum
    {
        gCurrentSprite.pose = SAVE_PLATFORM_POSE_IDLE_AFTER_PROMPT;
        gCurrentSprite.samusCollision = SSC_SAVE_PLATFORM;

        gCurrentSprite.work1 = 0;

        if (gSpriteData[gCurrentSprite.work2].work2 == 0x1) // TODO enum
        {
            gCurrentSprite.work2 = TRUE;
            SAMUS_SET_POSE(SPOSE_SAVING);
            SoundPlay(0x10D);
        }
        else
        {
            gCurrentSprite.work2 = FALSE;
            SAMUS_SET_POSE(SPOSE_FACING_FOREGROUND);
            // Timer before being able to act
            gSamusData.lastWallTouchedMidAir = 5;
        }
    }
}

/**
 * @brief 1f6e8 | 90 | Handles a save platform being idle after the save prompt
 * 
 */
void SavePlatformIdleAfterPrompt(void)
{
    u8 ramSlot;
    
    if (gCurrentSprite.work2)
    {
        if (gSamusData.pose == SPOSE_FACING_FOREGROUND)
        {
            TrySpawnMessageBanner(0xD); // TODO enum

            gPreventMovementTimer = SAMUS_ITEM_PMT;

            gCurrentSprite.work2 = 0;
        }
    }
    else
    {
        ramSlot = gCurrentSprite.primarySpriteRamSlot;

        if (gCurrentSprite.status & (SPRITE_STATUS_SAMUS_DETECTED | SPRITE_STATUS_SAMUS_ON_TOP))
        {
            gCurrentSprite.work1 = 0;
            return;
        }

        gCurrentSprite.work1++;

        if (gCurrentSprite.work1 > 120)
        {
            gCurrentSprite.pose = SAVE_PLATFORM_POSE_RISING_AFTER_PROMPT;

            gSpriteData[ramSlot].pOam = sSavePadOam_Idle;
            gSpriteData[ramSlot].animationDurationCounter = 0;
            gSpriteData[ramSlot].currentAnimationFrame = 0;
        }
    }
}

/**
 * @brief 1f778 | 98 | Handles a save platform rising
 * 
 */
void SavePlatformRising(void)
{
    if (CHECK_ALL_FLAGS(gCurrentSprite.status, SPRITE_STATUS_SAMUS_DETECTED | SPRITE_STATUS_SAMUS_ON_TOP))
    {
        gCurrentSprite.pose = SAVE_PLATFORM_POSE_SINKING;
        return;
    }

    if (gCurrentSprite.yPosition == gCurrentSprite.xParasiteTimer)
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.work4 = 0;
        return;
    }

    if (gCurrentSprite.yPosition > gCurrentSprite.xParasiteTimer)
    {
        gCurrentSprite.yPosition -= ONE_SUB_PIXEL;

        if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_ON_TOP)
            gSamusData.yPosition -= ONE_SUB_PIXEL;
    }
    else
    {
        gCurrentSprite.yPosition += ONE_SUB_PIXEL;

        if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_ON_TOP)
            gSamusData.yPosition += ONE_SUB_PIXEL;
    }

    if (MOD_AND(gFrameCounter8Bit, 16) == 0)
        SoundPlay(0x10B);
}

/**
 * @brief 1f810 | 60 | Handles a save platform rising after the save prompt
 * 
 */
void SavePlatformRisingAfterPrompt(void)
{
    if (gCurrentSprite.yPosition == gCurrentSprite.xParasiteTimer)
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.work4 = 0;
        return;
    }

    gCurrentSprite.yPosition -= ONE_SUB_PIXEL;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_ON_TOP)
        gSamusData.yPosition -= ONE_SUB_PIXEL;

    if (MOD_AND(gFrameCounter8Bit, 16) == 0)
        SoundPlay(0x10B);
}

/**
 * @brief 1f870 | 88 | Initializes a save pad hologram
 * 
 */
void SavePadHologramInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;

    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 3);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.roomSlot != 0)
    {
        gCurrentSprite.pOam = sSavePadHologramOam_Flashing;
        gCurrentSprite.pose = SAVE_PAD_HOLOGRAM_POSE_FLASHING;
    }
    else
    {
        gCurrentSprite.pOam = sSavePadHologramOam_Opening;
        gCurrentSprite.pose = SAVE_PAD_HOLOGRAM_POSE_OPENING;
    }
}

/**
 * @brief 1f8f8 | 28 | Handles a save pad hologram opening
 * 
 */
void SavePadHologramOpening(void)
{
    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
    {
        gCurrentSprite.pOam = sSavePadHologramOam_Flashing;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    
        gCurrentSprite.pose = SAVE_PAD_HOLOGRAM_POSE_FLASHING;
    }
}

/**
 * @brief 1f920 | 38 | Handles a sabe pad hologram flashing
 * 
 */
void SavePadHologramFlashing(void)
{
    if (gPreventMovementTimer == 0 && gSamusData.pose == SPOSE_FACING_FOREGROUND)
    {
        gCurrentSprite.pOam = sSavePadHologramOam_Closing;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    
        gCurrentSprite.pose = SAVE_PAD_HOLOGRAM_POSE_CLOSING;
    }
}

/**
 * @brief 1f958 | 18 | Handles a save pad hologram closing
 * 
 */
void SavePadHologramClosing(void)
{
    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
        gCurrentSprite.status = 0;
}

/**
 * @brief 1f970 | 24 | Save pad AI
 * 
 */
void SavePad(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            SavePadInit();

        case SPRITE_POSE_IDLE:
            SavePadIdle();
    }
}

/**
 * @brief 1f994 | fc | Save platform AI
 * 
 */
void SavePlatform(void)
{
    if (gCurrentSprite.xPosition - HALF_BLOCK_SIZE < gSamusData.xPosition && gCurrentSprite.xPosition + HALF_BLOCK_SIZE > gSamusData.xPosition)
        gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            SavePlatformInit();
            break;

        case SPRITE_POSE_IDLE:
            SavePlatformIdle();
            break;

        case SAVE_PLATFORM_POSE_SINKING:
            SavePlatformSinking();
            break;

        case SAVE_PLATFORM_POSE_RISING:
            SavePlatformRising();
            break;

        case SAVE_PLATFORM_POSE_SPAWN_SAVE_PROMPT:
            SavePlatformSpawnSavePrompt();
            break;

        case SAVE_PLATFORM_POSE_IDLE_AFTER_PROMPT:
            SavePlatformIdleAfterPrompt();
            break;

        case SAVE_PLATFORM_POSE_RISING_AFTER_PROMPT:
            SavePlatformRisingAfterPrompt();
            break;
    }

    gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
}

/**
 * @brief 1fa90 | 48 | Save pad hologram AI
 * 
 */
void SavePadHologram(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNITIALIZED:
            SavePadHologramInit();
            break;

        case SAVE_PAD_HOLOGRAM_POSE_OPENING:
            SavePadHologramOpening();
            break;

        case SAVE_PAD_HOLOGRAM_POSE_FLASHING:
            SavePadHologramFlashing();
            break;

        case SAVE_PAD_HOLOGRAM_POSE_CLOSING:
            SavePadHologramClosing();
            break;
    }
}
