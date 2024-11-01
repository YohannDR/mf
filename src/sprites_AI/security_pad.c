#include "sprites_AI/security_pad.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "data/sprites/security_pad.h"
#include "data/samus_data.h"

#include "constants/connection.h"
#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/clipdata.h"

#include "structs/connection.h"
#include "structs/samus.h"
#include "structs/sprite.h"

#define SECURITY_PAD_POSE_PRESSING_SWITCH 0x18
#define SECURITY_PAD_POSE_GRABBING_SAMUS 0x1A
#define SECURITY_PAD_POSE_DEPRESSING_SWITCH 0x1C
#define SECURITY_PAD_POSE_INACTIVE 0x1E
#define SECURITY_PAD_POSE_IDLE_BEFORE_UNLOCKING 0x38
#define SECURITY_PAD_POSE_UNLOCKING 0x3A
#define SECURITY_PAD_POSE_FINISHED_UNLOCKING 0x3C

#define SECURITY_PAD_MONITOR_POSE_ARM_EXTENDING 0x18
#define SECURITY_PAD_MONITOR_POSE_UNLOCKING 0x1A
#define SECURITY_PAD_MONITOR_POSE_ARM_RETRACTING 0x1C
#define SECURITY_PAD_MONITOR_POSE_INACTIVE 0x1E

#define SECURITY_PAD_SCREEN_POSE_UNLOCKING 0x18
#define SECURITY_PAD_SCREEN_POSE_INACTIVE 0x1A

/**
 * @brief 20e3c | c0 | Updates the palette of a security pad
 * 
 */
void SecurityPadUpdatePalette(void)
{
    u8 offset;
    u8 tmp;
    u8 update;
    const u16* pal;

    offset = gCurrentSprite.work3;
    tmp = offset - 1;
    if (tmp > 3)
        return;

    offset = tmp * 64;
    update = TRUE;

    switch (gCurrentSprite.work4++)
    {
        case 16:
        case 80:
            pal = &sSecurityPad_2f78cc[offset + 24];
            break;

        case 32:
        case 64:
            pal = &sSecurityPad_2f78cc[offset + 40];
            break;

        case 48:
            pal = &sSecurityPad_2f78cc[offset + 56];
            break;

        case 96:
            gCurrentSprite.work4 = 1;

        case 0:
            pal = &sSecurityPad_2f78cc[offset + 8];
            break;

        default:
            update = FALSE;
    }

    if (update)
    {
        DMA_SET(3, pal, PALRAM_OBJ + 0x110 + gCurrentSprite.spritesetGfxSlot * 16 * sizeof(u16), C_32_2_16(DMA_ENABLE, 16 / 2));
    }
}

/**
 * @brief 20efc | 1c8 | Initializes a security pad
 * 
 */
void SecurityPadInit(void)
{
    u8 securityLevel;

    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.bgPriority = 1;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0;

    switch (gCurrentArea)
    {
        case AREA_SECTOR_2:
            securityLevel = SECURITY_LEVEL_1;
            break;

        case AREA_SECTOR_3:
            securityLevel = SECURITY_LEVEL_2;
            break;

        case AREA_SECTOR_5:
            securityLevel = SECURITY_LEVEL_3;
            break;

        case AREA_SECTOR_4:
            securityLevel = SECURITY_LEVEL_4;
            break;

        default:
            securityLevel = SECURITY_LEVEL_END;
    }

    gCurrentSprite.work3 = securityLevel;

    if (CheckOrUnlockSecurityLevel(FALSE) == SECURITY_LEVEL_0)
    {
        gCurrentSprite.pOam = sSecurityPadOam_Pressed;
        gCurrentSprite.pose = SECURITY_PAD_POSE_INACTIVE;

        securityLevel = gCurrentSprite.spritesetSlotAndProperties & 1;
        if (securityLevel)
        {
            SpriteSpawnSecondary(SSPRITE_SECURITY_PAD_MONITOR, 0x1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition, gCurrentSprite.xPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE), 0);

            SpriteSpawnSecondary(SSPRITE_12, 0x1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition, gCurrentSprite.xPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE), 0);
        }
        else
        {
            SpriteSpawnSecondary(SSPRITE_SECURITY_PAD_MONITOR, 0x1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition, gCurrentSprite.xPosition + (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE), SS_X_FLIP);

            SpriteSpawnSecondary(SSPRITE_12, 0x1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition, gCurrentSprite.xPosition + (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE), SS_X_FLIP);
        }
    }
    else
    {
        gCurrentSprite.pOam = sSecurityPadOam_Idle;
        gCurrentSprite.work1 = TRUE;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;

        securityLevel = gCurrentSprite.spritesetSlotAndProperties & 1;
        if (securityLevel)
        {
            SpriteSpawnSecondary(SSPRITE_SECURITY_PAD_MONITOR, 0x0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition, gCurrentSprite.xPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE), 0);

            SpriteSpawnSecondary(SSPRITE_12, 0x0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition, gCurrentSprite.xPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE), 0);
        }
        else
        {
            SpriteSpawnSecondary(SSPRITE_SECURITY_PAD_MONITOR, 0x0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition, gCurrentSprite.xPosition + (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE), SS_X_FLIP);

            SpriteSpawnSecondary(SSPRITE_12, 0x0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition, gCurrentSprite.xPosition + (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE), SS_X_FLIP);
        }
    }

    gCurrentSprite.work2 = securityLevel;
}

/**
 * @brief 210c4 | 24 | Initializes a security pad to be idle (active)
 * 
 */
void SecurityPadIdleActiveInit(void)
{
    gCurrentSprite.pOam = sSecurityPadOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work1 = 1;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

/**
 * @brief 210e8 | 50 | Handles a security pad being idle (active)
 * 
 */
void SecurityPadIdleActive(void)
{
    if (NavPadDetectSamus())
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
        {
            gCurrentSprite.pose = SECURITY_PAD_POSE_PRESSING_SWITCH;

            gCurrentSprite.pOam = sSecurityPadOam_Pressing;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            
            SoundPlay(0x101);
        }
    }
    else
    {
        gCurrentSprite.work1 = 1;
    }
}

/**
 * @brief 21138 | 2c | Handles samus pressing on the switch
 * 
 */
void SecurityPadPressingSwitch(void)
{
    if (SpriteUtilCheckEndCurrentSpriteAnim())
    {
        gCurrentSprite.pose = SECURITY_PAD_POSE_GRABBING_SAMUS;

        gCurrentSprite.pOam = sSecurityPadOam_Pressed;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

/**
 * @brief 21164 | cc | Handles a security pad grabbing samus
 * 
 */
void SecurityPadGrabSamus(void)
{
    u8 turning;

    turning = FALSE;

    if (NavPadDetectSamus())
    {
        if (SpriteUtilCheckSamusMorphed())
            return;

        if (gSamusData.turning)
            return;

        gSamusData.xPosition = gCurrentSprite.xPosition;

        if (gSamusData.invincibilityTimer != 0)
            gSamusData.invincibilityTimer = 0;

        if (gCurrentSprite.work2)
        {
            if (gSamusData.direction & KEY_RIGHT)
                turning = TRUE;
        }
        else
        {
            if (gSamusData.direction & KEY_LEFT)
                turning = TRUE;
        }

        if (turning)
            SAMUS_SET_POSE(SPOSE_TURNING_AROUND_TO_RECHARGE_OR_UNLOCK_DOORS);
        else
            SAMUS_SET_POSE(SPOSE_ON_RECHARGE_OR_SECURITY_PAD);

        gCurrentSprite.pose = SECURITY_PAD_POSE_IDLE_BEFORE_UNLOCKING;
        gCurrentSprite.work1 = 16;
    }
    else
    {
        gCurrentSprite.pose = SECURITY_PAD_POSE_DEPRESSING_SWITCH;

        gCurrentSprite.pOam = sSecurityPadOam_Depressing;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        SoundPlay(0x102);
    }
}

/**
 * @brief 21230 | 14 | Handles the switch of a security pad de-pressing 
 * 
 */
void SecurityPadDepressingSwitch(void)
{
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        SecurityPadIdleActiveInit();
}

/**
 * @brief 21244 | 28 | Handles a security pad being idle before unlocking
 * 
 */
void SecurityPadIdleBeforeUnlocking(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = SECURITY_PAD_POSE_UNLOCKING;
        gCurrentSprite.work1 = 60 * 3;
    }
}

/**
 * @brief 2126c | 28 | Handles a security pad unlocking
 * 
 */
void SecurityPadUnlocking(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = SECURITY_PAD_POSE_FINISHED_UNLOCKING;
        gCurrentSprite.work1 = 60 / 3;
    }
}

/**
 * @brief 21294 | 54 | Handles a security pad after unlocking
 * 
 */
void SecurityPadFinishedUnlocking(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        TrySpawnMessageBanner(0x0); // TODO enum

        SAMUS_SET_POSE(SPOSE_STANDING);
        gPreventMovementTimer = SAMUS_ITEM_PMT;

        gCurrentSprite.pose = SECURITY_PAD_POSE_INACTIVE;
    }
}

/**
 * @brief 212e8 | 84 | Initializes a security pad monitor
 * 
 */
void SecurityPadMonitorInit(void)
{
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;

    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 3);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.drawOrder = 4;

    gCurrentSprite.pOam = sSecurityPadMonitorOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.roomSlot != 0)
        gCurrentSprite.pose = SECURITY_PAD_MONITOR_POSE_INACTIVE;
    else
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

/**
 * @brief 2136c | 44 | Handle a security pad monitor being idle
 * 
 */
void SecurityPadMonitorIdle(void)
{
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x3A)
    {
        gCurrentSprite.pOam = sSecurityPadMonitorOam_ArmExtending;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SECURITY_PAD_MONITOR_POSE_ARM_EXTENDING;

        SoundPlay(0x10F);
    }
}

/**
 * @brief 213b0 | 50 | Handles the arm extending
 * 
 */
void SecurityPadMonitorArmExtending(void)
{
    if (SpriteUtilCheckEndCurrentSpriteAnim())
    {
        gCurrentSprite.pOam = sSecurityPadMonitorOam_ArmExtended;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SECURITY_PAD_MONITOR_POSE_UNLOCKING;

        CheckOrUnlockSecurityLevel(TRUE);

        SAMUS_SET_POSE(SPOSE_UNLOCKING_SECURITY);
        SoundPlay(0x10E);
    }
}

/**
 * @brief 21400 | 44 | Handles the security pad monitor unlocking
 * 
 */
void SecurityPadMonitorUnlocking(void)
{
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x3C)
    {
        gCurrentSprite.pOam = sSecurityPadMonitorOam_ArmRetracting;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SECURITY_PAD_MONITOR_POSE_ARM_RETRACTING;

        SoundPlay(0x110);
    }
}

/**
 * @brief 21444 | 28 | Handles the arm retracting
 * 
 */
void SecurityPadMonitorArmRetracting(void)
{
    if (SpriteUtilCheckEndCurrentSpriteAnim())
    {
        gCurrentSprite.pOam = sSecurityPadMonitorOam_Idle;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SECURITY_PAD_MONITOR_POSE_INACTIVE;
    }
}

/**
 * @brief 2146c | 90 | Initializes a security pad screen
 * 
 */
void SecurityPadScreenInit(void)
{
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;

    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 3);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.drawOrder = 3;

    if (gCurrentSprite.roomSlot != 0)
    {
        gCurrentSprite.pose = SECURITY_PAD_SCREEN_POSE_INACTIVE;
        gCurrentSprite.pOam = sSecurityPadScreenOam_Inactive;
    }
    else
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.pOam = sSecurityPadScreenOam_Idle;
    }
}

/**
 * @brief 214fc | 4c | Handles a security pad screen being idle
 * 
 */
void SecurityPadScreenIdle(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].pose == 0x3A && gSpriteData[ramSlot].work1 <= 60 * 2 + 60 / 3)
    {
        gCurrentSprite.pOam = sSecurityPadScreenOam_Unlocking;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SECURITY_PAD_SCREEN_POSE_UNLOCKING;
    }
}

/**
 * @brief 21548 | 40 | Handles a security pad screen unlocking
 * 
 */
void SecurityPadScreenUnlocking(void)
{
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x3C)
    {
        gCurrentSprite.pOam = sSecurityPadScreenOam_Inactive;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SECURITY_PAD_SCREEN_POSE_INACTIVE;
    }
}

/**
 * @brief 21588 | 158 | Security pad AI
 * 
 */
void SecurityPad(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SecurityPadInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            SecurityPadIdleActiveInit();
            break;

        case SPRITE_POSE_IDLE:
            SecurityPadIdleActive();
            break;

        case SECURITY_PAD_POSE_PRESSING_SWITCH:
            SecurityPadPressingSwitch();
            break;

        case SECURITY_PAD_POSE_GRABBING_SAMUS:
            SecurityPadGrabSamus();
            break;

        case SECURITY_PAD_POSE_DEPRESSING_SWITCH:
            SecurityPadDepressingSwitch();
            break;

        case SECURITY_PAD_POSE_IDLE_BEFORE_UNLOCKING:
            SecurityPadIdleBeforeUnlocking();
            break;

        case SECURITY_PAD_POSE_UNLOCKING:
            SecurityPadUnlocking();
            break;

        case SECURITY_PAD_POSE_FINISHED_UNLOCKING:
            SecurityPadFinishedUnlocking();
    }

    SecurityPadUpdatePalette();
}

/**
 * @brief 216e0 | bc | Security pad monitor AI
 * 
 */
void SecurityPadMonitor(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SecurityPadMonitorInit();
            break;

        case SPRITE_POSE_IDLE:
            SecurityPadMonitorIdle();
            break;

        case SECURITY_PAD_MONITOR_POSE_ARM_EXTENDING:
            SecurityPadMonitorArmExtending();
            break;

        case SECURITY_PAD_MONITOR_POSE_UNLOCKING:
            SecurityPadMonitorUnlocking();
            break;

        case SECURITY_PAD_MONITOR_POSE_ARM_RETRACTING:
            SecurityPadMonitorArmRetracting();
    }
}

/**
 * @brief 2179c | 40 | Security pad screen AI
 * 
 */
void SecurityPadScreen(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SecurityPadScreenInit();
            break;

        case SPRITE_POSE_IDLE:
            SecurityPadScreenIdle();
            break;

        case SECURITY_PAD_SCREEN_POSE_UNLOCKING:
            SecurityPadScreenUnlocking();
    }
}
