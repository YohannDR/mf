#include "macros.h"
#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/navigation_pad.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/escape.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u8 NavPadDetectSamus(void) {
    u8 pressed = FALSE;
    u16 samusY = gSamusData.yPosition, samusX = gSamusData.xPosition;
    u16 spriteY = gCurrentSprite.yPosition, spriteX = gCurrentSprite.xPosition;
    if (samusY == spriteY - 1 && spriteX - BLOCK_SIZE < samusX && spriteX + BLOCK_SIZE > samusX)
        pressed = TRUE;
    return pressed;
}

u8 NavPadDetectSamus_Unused(void) {
    u8 detected = FALSE;
    u16 samusX = gSamusData.xPosition;
    u16 spriteX = gCurrentSprite.xPosition;
    if (spriteX - 0xa0 < samusX && spriteX + 0xa0 > samusX)
        detected = TRUE;
    return detected;
}

void NavPadInit(void) {
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 0x28;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.bgPriority = 1;
    SpriteSpawnSecondary(SSPRITE_NAVIGATION_CONSOLE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (EventCheckWith_NavigationDisabled()) {
        gCurrentSprite.work2 = TRUE;
    } else {
        gCurrentSprite.work2 = FALSE;
        SpriteSpawnSecondary(SSPRITE_NAVIGATION_CONSOLE_SCREEN, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    }
}

void NavPadIdleInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 1;
    if (gCurrentSprite.work2) {
        gCurrentSprite.pOam = sNavigationPadOam_31e380;
        gCurrentSprite.pose = 0x46;
    } else {
        gCurrentSprite.pOam = sNavigationPadOam_31e318;
        gCurrentSprite.pose = 2;
    }
}

void NavPadIdle(void) {
    if (NavPadDetectSamus()) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = 0x18;
            gCurrentSprite.pOam = sNavigationPadOam_31e278;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            SoundPlay(0x101);
        }
    } else {
        gCurrentSprite.work1 = 1;
    }
}

void NavPadPressingSwitch(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sNavigationPadOam_31e380;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

void NavPadSwitchPressed(void) {
    if (NavPadDetectSamus()) {
        if (!SpriteUtilCheckSamusMorphed()) {
            gSamusData.xPosition = gCurrentSprite.xPosition;
            if (gSamusData.invincibilityTimer > 0)
                gSamusData.invincibilityTimer = 0;
            SAMUS_SET_POSE(SPOSE_ON_NAVIGATION_PAD);
            gCurrentSprite.pose = 0x38;
            gCurrentSprite.work1 = 20;
        }
    } else {
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.pOam = sNavigationPadOam_31e2f0;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        SoundPlay(0x102);
    }
}

void NavPadReleasingSwitch(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        NavPadIdleInit();
}

void NavPadAfterConversationInit(void) {
    if ((u8)EventCheckOn_Escape() == TRUE && gEscapeStatus == ESCAPE_STATUS_NONE) {
        EscapeStart();
        MusicPlay(MUSIC_MAIN_BOILER_COOLDOWN_MISSION, 10);
    }
    gCurrentSprite.pose = 0x1e;
}

void NavPadAfterConversation(void) {
    if (!NavPadDetectSamus()) {
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.pOam = sNavigationPadOam_31e2f0;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        SoundPlay(0x102);
    }
}

void NavPadUsingConsole(void) {
    if (gCurrentSprite.work1 > 0)
        if (--gCurrentSprite.work1 == 0)
            SoundPlay(0x103);
    if (gSamusData.pose == SPOSE_ON_NAVIGATION_PAD && gSamusData.currentAnimationFrame == 14) {
        SpriteSpawnSecondary(SSPRITE_NAVIGATION_SCREEN, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition - 0xf0, gCurrentSprite.xPosition, 0);
        gCurrentSprite.pose = 0x3a;
        gCurrentSprite.work1 = 30;
    }
}

void NavPadStartConversation(void) {
    if (--gCurrentSprite.work1 == 0) {
        gPauseScreenFlag = 3;
        gSubGameMode1++;
        gCurrentSprite.pose = 0x1d;
    }
}

void NavConsoleInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x28;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.drawOrder = 13;
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sNavigationPadOam_31e268;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void NavConsoleIdle(void) {}

void NavConsoleScreenInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x28;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.drawOrder = 0xc;
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sNavigationPadOam_31e2c8;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void NavConsoleScreenIdle(void) {
    u8 primarySlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gSpriteData[primarySlot].pose) {
        case 0x38:
            gCurrentSprite.pOam = sNavigationPadOam_31e2a0;
            break;
        case 0x1c:
            gCurrentSprite.pOam = sNavigationPadOam_31e2c8;
            break;
    }
}

void NavScreenInit(void) {
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x28;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.drawOrder = 0xc;
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sNavigationPadOam_31e340;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    SoundPlay(0x104);
}

void NavScreenTurningOn(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sNavigationPadOam_31e328;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
    }
}

void NavScreenIdle(void) {
    u8 primarySlot = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[primarySlot].pose == 0x1e) {
        gCurrentSprite.pOam = sNavigationPadOam_31e390;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        SoundPlay(0x105);
    }
}

void NavScreenTurningOff(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void NavPad(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            NavPadInit();
        case 1:
            NavPadIdleInit();
            break;
        case 2:
            NavPadIdle();
            break;
        case 0x18:
            NavPadPressingSwitch();
            break;
        case 0x1a:
            NavPadSwitchPressed();
            break;
        case 0x1c:
            NavPadReleasingSwitch();
            break;
        case 0x1d:
            NavPadAfterConversationInit();
        case 0x1e:
            NavPadAfterConversation();
            break;
        case 0x38:
            NavPadUsingConsole();
            break;
        case 0x3a:
            NavPadStartConversation();
            break;
    }
}

void NavConsole(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            NavConsoleInit();
        case 2:
            NavConsoleIdle();
            break;
    }
}

void NavConsoleScreen(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            NavConsoleScreenInit();
        case 2:
            NavConsoleScreenIdle();
            break;
    }
}

void NavScreen(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            NavScreenInit();
        case 2:
            NavScreenTurningOn();
            break;
        case 0x18:
            NavScreenIdle();
            break;
        case 0x1a:
            NavScreenTurningOff();
            break;
    }
}
