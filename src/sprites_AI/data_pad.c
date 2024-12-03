#include "macros.h"
#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/data_pad.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/event.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void DataPadInit(void) {
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
    if (EventCheckDownloadedDataItem(FALSE))
        gCurrentSprite.work2 = TRUE;
    else
        gCurrentSprite.work2 = FALSE;
    SpriteSpawnSecondary(SSPRITE_DATA_PAD_CENTER, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_DATA_PAD_SIDES, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
}

void DataPadIdleInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 1;
    if (gCurrentSprite.work2) {
        gCurrentSprite.pOam = sDataPadOam_3219c4;
        gCurrentSprite.pose = 2;
    } else {
        gCurrentSprite.pOam = sDataPadOam_3219d4;
        gCurrentSprite.pose = 0x1e;
    }
}

void DataPadIdle(void) {
    if (NavPadDetectSamus()) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = 0x18;
            gCurrentSprite.pOam = sDataPadOam_3219e4;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            SoundPlay(0x101);
        }
    } else
        gCurrentSprite.work1 = 1;
}

void DataPadPressingSwitch(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sDataPadOam_3219d4;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

void DataPadSwitchPressed(void) {
    if (NavPadDetectSamus()) {
        if (!SpriteUtilCheckSamusMorphed()) {
            gSamusData.xPosition = gCurrentSprite.xPosition;
            if (gSamusData.invincibilityTimer > 0)
                gSamusData.invincibilityTimer = 0;
            SAMUS_SET_POSE(SPOSE_ON_SAVE_PAD);
            gCurrentSprite.pose = 0x38;
            gCurrentSprite.work1 = 30;
        }
    } else {
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.pOam = sDataPadOam_321a0c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        SoundPlay(0x102);
    }
}

void DataPadReleasingSwitch(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        DataPadIdleInit();
}

void DataPadLockingSamus(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x3a;
        gCurrentSprite.work1 = 120;
        EventCheckDownloadedDataItem(TRUE);
        gDoorUnlockTimer = 60;
        SAMUS_SET_POSE(SPOSE_DOWNLOADING_ABILITY);
    }
}

void DataPadDownloadingData(void) {
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x1e;
}

void DataPadCenterInit(void) {
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x30;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x28;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.pose = 2;
    gCurrentSprite.work1 = 30;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].work2)
        gCurrentSprite.pOam = sDataPadOam_321a44;
    else
        gCurrentSprite.pOam = sDataPadOam_321a34;
}

void DataPadCenterIdle(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x38) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = 0x18;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.pOam = sDataPadOam_321a64;
            SoundPlay(0x10a);
        }
    }
}

void DataPadCenterEngaging(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x1e) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sDataPadOam_321a44;
        gCurrentSprite.work1 = 0x14;
    }
}

void DataPadCenterDownloadingData(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sDataPadOam_321a34;
    }
}

void DataPadSidesInit(void) {
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x30;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x28;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.drawOrder = 13;
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sDataPadOam_321a8c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void DataPadSidesIdle(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x38) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sDataPadOam_321a9c;
        SoundPlay(0x108);
    }
}

void DataPadSidesEngaging(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sDataPadOam_321adc;
    }
}

void DataPadSidesDownloadingData(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x1e) {
        gCurrentSprite.work1 = 20;
        gCurrentSprite.pose = 0x1c;
        SAMUS_SET_POSE(SPOSE_FACING_FOREGROUND);
        gSamusData.lastWallTouchedMidAir = 10;
        gPreventMovementTimer = 1000;
    }
}

void DataPadSidesDoneDownloadingData(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x1e;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sDataPadOam_321abc;
        SoundPlay(0x109);
    }
}

void DataPadSidesDisengaging(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x46;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sDataPadOam_321a8c;
        TrySpawnMessageBanner(0);
    }
}

void DataPad(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            DataPadInit();
        case 1:
            DataPadIdleInit();
            break;
        case 2:
            DataPadIdle();
            break;
        case 0x18:
            DataPadPressingSwitch();
            break;
        case 0x1a:
            DataPadSwitchPressed();
            break;
        case 0x1c:
            DataPadReleasingSwitch();
            break;
        case 0x38:
            DataPadLockingSamus();
            break;
        case 0x3a:
            DataPadDownloadingData();
    }
}

void DataPadCenter(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            DataPadCenterInit();
        case 2:
            DataPadCenterIdle();
            break;
        case 0x18:
            DataPadCenterEngaging();
            break;
        case 0x1a:
            DataPadCenterDownloadingData();
    }
}

void DataPadSides(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            DataPadSidesInit();
        case 2:
            DataPadSidesIdle();
            break;
        case 0x18:
            DataPadSidesEngaging();
            break;
        case 0x1a:
            DataPadSidesDownloadingData();
            break;
        case 0x1c:
            DataPadSidesDoneDownloadingData();
            break;
        case 0x1e:
            DataPadSidesDisengaging();
    }
}
