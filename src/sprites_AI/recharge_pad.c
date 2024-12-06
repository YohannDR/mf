#include "macros.h"
#include "globals.h"
#include "gba/keys.h"

#include "data/samus_data.h"
#include "data/sprites/recharge_pad.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void RechargePadInit(void) {
    u8 flip;

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
    if (EventCheckWith_RechargeDisabled())
        gCurrentSprite.work4 = TRUE;
    else
        gCurrentSprite.work4 = FALSE;
    flip = MOD_AND(gCurrentSprite.spritesetSlotAndProperties, 2);
    if (flip) {
        SpriteSpawnSecondary(SSPRITE_RECHARGE_PAD_MONITOR, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x90, 0);
        if (!gCurrentSprite.work4) {
            SpriteSpawnSecondary(SSPRITE_RECHARGE_PAD_SCREEN, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x90, 0);
            SpriteSpawnSecondary(SSPRITE_RECHARGE_PAD_SCREEN, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x90, 0);
        }
    } else {
        SpriteSpawnSecondary(SSPRITE_RECHARGE_PAD_MONITOR, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x90, SS_X_FLIP);
        if (!gCurrentSprite.work4) {
            SpriteSpawnSecondary(SSPRITE_RECHARGE_PAD_SCREEN, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x90, SS_X_FLIP);
            SpriteSpawnSecondary(SSPRITE_RECHARGE_PAD_SCREEN, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x90, SS_X_FLIP);
        }
    }
    gCurrentSprite.work2 = flip;
}

void RechargePadIdleInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 1;
    if (gCurrentSprite.work4) {
        gCurrentSprite.pOam = sRechargePadOam_3257e0;
        gCurrentSprite.pose = 0x46;
    } else {
        gCurrentSprite.pOam = sRechargePadOam_3257d0;
        gCurrentSprite.pose = 2;
    }
}

void RechargePadIdle(void) {
    if (NavPadDetectSamus()) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = 0x18;
            gCurrentSprite.pOam = sRechargePadOam_325780;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            SoundPlay(0x101);
        }
    } else
        gCurrentSprite.work1 = 1;
}

void RechargePadOpening(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sRechargePadOam_3257e0;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

void RechargePadOpened(void) {
    u8 facingAway = FALSE;
    if (NavPadDetectSamus()) {
        if (!SpriteUtilCheckSamusMorphed() && !gSamusData.turning) {
            gSamusData.xPosition = gCurrentSprite.xPosition;
            if (gSamusData.invincibilityTimer > 0)
                gSamusData.invincibilityTimer = 0;
            if (gCurrentSprite.work2) {
                if (gSamusData.direction & KEY_RIGHT) facingAway = TRUE;
            } else {
                if (gSamusData.direction & KEY_LEFT) facingAway = TRUE;
            }
            if (facingAway)
                SAMUS_SET_POSE(SPOSE_TURNING_AROUND_TO_RECHARGE_OR_UNLOCK_DOORS);
            else
                SAMUS_SET_POSE(SPOSE_ON_RECHARGE_OR_SECURITY_PAD);
            gCurrentSprite.pose = 0x38;
            gCurrentSprite.work1 = 16;
        }
    } else {
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.pOam = sRechargePadOam_3257a8;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        SoundPlay(0x102);
    }
}

void RechargePadClosing(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        RechargePadIdleInit();
}

void RechargePadExtending(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x3a;
        gCurrentSprite.work1 = 60;
        gCurrentSprite.work3 = 10;
    }
}

void RechargePadRefilling(void) {
    u8 spriteId;

    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.work1--;
        return;
    }
    spriteId = gCurrentSprite.spriteId;
    if (spriteId == PSPRITE_ENERGY_RECHARGE_PAD) {
        if (SpriteUtilRefillEnergy()) return;
    } else if (spriteId == PSPRITE_AMMO_RECHARGE_PAD) {
        if (SpriteUtilRefillMissiles()) return;
        if (SpriteUtilRefillPowerBombs()) return;
    } else if (spriteId == PSPRITE_ENERGY_AMMO_RECHARGE_PAD) {
        if (SpriteUtilRefillEnergy()) return;
        if (SpriteUtilRefillMissiles()) return;
        if (SpriteUtilRefillPowerBombs()) return;
    }
    if (--gCurrentSprite.work3 == 0) {
        gCurrentSprite.pose = 60;
        gCurrentSprite.work1 = 0x14;
    }
}

void RechargePadRetracting(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x1e;
        SAMUS_SET_POSE(SPOSE_STANDING);
        gPreventMovementTimer = 1000;
        if (gCurrentSprite.spriteId == PSPRITE_ENERGY_RECHARGE_PAD)
            TrySpawnMessageBanner(16);
        else if (gCurrentSprite.spriteId == PSPRITE_AMMO_RECHARGE_PAD)
            TrySpawnMessageBanner(15);
        else if (gCurrentSprite.spriteId == PSPRITE_ENERGY_AMMO_RECHARGE_PAD) {
            if (gEquipment.weaponsStatus & MBF_ANY_MISSILE)
                TrySpawnMessageBanner(17);
            else
                TrySpawnMessageBanner(16);
        }
    }
}

void RechargePadMonitorInit(void) {
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x30;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.drawOrder = 4;
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sRechargePadOam_325700;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void RechargePadMonitorIdle(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x3a) {
        gCurrentSprite.pOam = sRechargePadOam_325710;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
        SoundPlay(0x112);
    }
}

void RechargePadMonitorExtended(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sRechargePadOam_325738;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        SAMUS_SET_POSE(SPOSE_BEING_RECHARGED);
        SoundPlay(0x111);
    }
}

void RechargePadMonitorRetractingInit(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x3c) {
        gCurrentSprite.pOam = sRechargePadOam_325758;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1c;
        SoundPlay(0x113);
    }
}

void RechargePadMonitorRetracting(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sRechargePadOam_325700;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1e;
    }
}

void RechargePadScreenInit(void) {
    u8 primaryId;
    u8 primarySlot = gCurrentSprite.primarySpriteRamSlot;

    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x30;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pose = 2;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.roomSlot != 0) {
        gCurrentSprite.pOam = sRechargePadOam_3256b8;
        gCurrentSprite.drawOrder = 2;
    } else {
        gCurrentSprite.drawOrder = 3;
        primaryId = gSpriteData[primarySlot].spriteId;
        if (primaryId == PSPRITE_ENERGY_RECHARGE_PAD)
            gCurrentSprite.pOam = sRechargePadOam_325640;
        else if (primaryId == PSPRITE_AMMO_RECHARGE_PAD)
            gCurrentSprite.pOam = sRechargePadOam_325668;
        else if (primaryId == PSPRITE_ENERGY_AMMO_RECHARGE_PAD)
            gCurrentSprite.pOam = sRechargePadOam_325690;
        else
            gCurrentSprite.status = 0;
    }
}

void RechargePad(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            RechargePadInit();
        case 1:
            RechargePadIdleInit();
            break;
        case 2:
            RechargePadIdle();
            break;
        case 0x18:
            RechargePadOpening();
            break;
        case 0x1a:
            RechargePadOpened();
            break;
        case 0x1c:
            RechargePadClosing();
            break;
        case 0x38:
            RechargePadExtending();
            break;
        case 0x3a:
            RechargePadRefilling();
            break;
        case 0x3c:
            RechargePadRetracting();
    }
}

void RechargePadMonitor(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            RechargePadMonitorInit();
            break;
        case 2:
            RechargePadMonitorIdle();
            break;
        case 0x18:
            RechargePadMonitorExtended();
            break;
        case 0x1a:
            RechargePadMonitorRetractingInit();
            break;
        case 0x1c:
            RechargePadMonitorRetracting();
    }
}

void RechargePadScreen(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.pose == 0)
        RechargePadScreenInit();
}
