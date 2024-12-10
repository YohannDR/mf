#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/shake_trigger.h"
#include "data/sprite_data.h"

#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/event.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void GoldSciserDoorLockIdle(void) {
    if ((u8)SpriteUtilCountPrimarySprites(PSPRITE_GOLD_SCISER) == 0) {
        gDoorUnlockTimer = 60;
        gCurrentSprite.status = 0;
    }
}

void GoldSciserDoorLock(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.pose = 2;
            gCurrentSprite.drawDistanceTop = 1;
            gCurrentSprite.drawDistanceBottom = 1;
            gCurrentSprite.drawDistanceHorizontal = 1;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.pOam = sShakeTriggerOam_337fa4;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
            if (!gDebugFlag)
                gCurrentSprite.status |= SS_NOT_DRAWN;
            gUnk_03000047 = 1;
            break;
        case 2:
            GoldSciserDoorLockIdle();
    }
}

void GoldZebesianDoorLockIdle(void) {
    if ((u8)SpriteUtilCountPrimarySprites(PSPRITE_GOLD_ZEBESIAN) == 0) {
        gDoorUnlockTimer = 60;
        gCurrentSprite.status = 0;
    }
}

void GoldZebesianDoorLock(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.pose = 2;
            gCurrentSprite.drawDistanceTop = 1;
            gCurrentSprite.drawDistanceBottom = 1;
            gCurrentSprite.drawDistanceHorizontal = 1;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.pOam = sShakeTriggerOam_337fa4;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
            if (!gDebugFlag)
                gCurrentSprite.status |= SS_NOT_DRAWN;
            gUnk_03000047 = 1;
            break;
        case 2:
            GoldZebesianDoorLockIdle();
    }
}
