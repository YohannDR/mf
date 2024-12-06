#include "macros.h"
#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/message_box.h"
#include "data/sprites/operations_room_pad.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/event.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void OperationsRoomPadInit(void) {
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
    SpriteSpawnSecondary(SSPRITE_OPERATIONS_ROOM_PAD_CONSOLE, 0, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (EventCheckOn_SaXDefeated()) {
        gCurrentSprite.work2 = FALSE;
        SpriteSpawnSecondary(SSPRITE_OPERATIONS_ROOM_PAD_CONSOLE_SCREEN, 0, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    } else if (EventCheckAfter_OrbitChange()) {
        gCurrentSprite.work2 = TRUE;
        SpriteSpawnSecondary(SSPRITE_OPERATIONS_ROOM_PAD_CONSOLE_SCREEN, 0, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    } else {
        gCurrentSprite.work2 = 2;
    }
}

void OperationsRoomPadIdleInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 1;
    if (gCurrentSprite.work2) {
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c344;
        gCurrentSprite.pose = 0x46;
    } else {
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c2f4;
        gCurrentSprite.pose = 2;
    }
}

void OperationsRoomPadIdle(void) {
    if (NavPadDetectSamus()) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = 0x18;
            gCurrentSprite.pOam = sOperationsRoomPadOam_34c254;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            SoundPlay(0x101);
        }
    } else
        gCurrentSprite.work1 = 1;
}

void OperationsRoomPadPressingSwitch(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c344;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

void OperationsRoomPadSwitchPressed(void) {
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
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c2cc;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        SoundPlay(0x102);
    }
}

void OperationsRoomPadReleasing(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        OperationsRoomPadIdleInit();
}

void OperationsRoomPadSamusInteracting(void) {
    if (gCurrentSprite.work1 > 0)
        if (--gCurrentSprite.work1 == 0)
        SoundPlay(0x103);
    if (gSamusData.pose == SPOSE_ON_NAVIGATION_PAD && gSamusData.currentAnimationFrame == 14) {
        gCurrentSprite.pose = 0x3a;
        gCurrentSprite.work1 = 30;
    }
}

void OperationsRoomPadStartEscape(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x1e;
        gPreventMovementTimer = 1000;
        EventCheckAdvance(EVENT_ORBIT_CHANGE_IMPLEMENTED);
        TrySpawnMessageBanner(11);
        MusicFade(0);
    }
}

void OperationsRoomPadConsoleInit(void) {
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
    gCurrentSprite.pOam = sOperationsRoomPadOam_34c244;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void OperationsRoomPadConsoleIdle(void) {}


void OperationsRoomPadConsoleScreenInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x28;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].work2) {
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c27c;
        gCurrentSprite.pose = 0x18;
    } else {
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c2a4;
        gCurrentSprite.pose = 2;
    }
}

void OperationsRoomPadConsoleScreenIdle(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x3a) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c27c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

void OperationsRoomPadScreenInit(void) {
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x28;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sOperationsRoomPadOam_34c31c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    SoundPlay(0x104);
}

void OperationsRoomPadScreenTurningOn(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c304;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
    }
}

void OperationsRoomPadScreenIdle(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[primary].pose == 0x1e) {
        gCurrentSprite.pOam = sOperationsRoomPadOam_34c354;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        SoundPlay(0x105);
    }
}

void OperationsRoomPadScreenTurningOff(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void OperationsRoomPad(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            OperationsRoomPadInit();
        case 1:
            OperationsRoomPadIdleInit();
            break;
        case 2:
            OperationsRoomPadIdle();
            break;
        case 0x18:
            OperationsRoomPadPressingSwitch();
            break;
        case 0x1a:
            OperationsRoomPadSwitchPressed();
            break;
        case 0x1c:
            OperationsRoomPadReleasing();
            break;
        case 0x38:
            OperationsRoomPadSamusInteracting();
            break;
        case 0x3a:
            OperationsRoomPadStartEscape();
    }
}

void OperationsRoomPadConsole(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            OperationsRoomPadConsoleInit();
        case 2:
            OperationsRoomPadConsoleIdle();
    }
}

void OperationsRoomPadConsoleScreen(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            OperationsRoomPadConsoleScreenInit();
            break;
        case 2:
            OperationsRoomPadConsoleScreenIdle();
    }
}

void OperationsRoomPadScreen(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            OperationsRoomPadScreenInit();
        case 2:
            OperationsRoomPadScreenTurningOn();
            break;
        case 0x18:
            OperationsRoomPadScreenIdle();
            break;
        case 0x1a:
            OperationsRoomPadScreenTurningOff();
    }
}
