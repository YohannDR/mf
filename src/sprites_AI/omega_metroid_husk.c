#include "globals.h"

#include "data/sprites/omega_metroid_husk.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/samus.h"
#include "structs/scroll.h"
#include "structs/sprite.h"
#include "structs/sprite_debris.h"

void OmegaMetroidHuskSetInvisibleWallCollision(u8 caa) {
    u16 y = gCurrentSprite.yPosition;
    u16 x = gCurrentSprite.xPosition - BLOCK_TO_SUB_PIXEL(14);

    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(0.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(1.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(2.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(3.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(4.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(5.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(6.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(7.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(8.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(0.5), x - BLOCK_SIZE);
}

void OmegaMetroidHuskInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x38;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x58;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pose = 1;
    gCurrentSprite.pOam = sOmegaMetroidHuskOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void OmegaMetroidHuskWaitingForSamus(void) {
    if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_TO_SUB_PIXEL(10), PIXEL_TO_SUB_PIXEL(0x5e)) != NSLR_OUT_OF_RANGE) {
        gCurrentSprite.pose = 2;
        gDisableScrolling = 2;
        OmegaMetroidHuskSetInvisibleWallCollision(CAA_MAKE_SOLID);
    }
}

void OmegaMetroidHuskWaitForOmegaMetroidToSpawn(void) {
    if (gSamusData.yPosition > gCurrentSprite.yPosition - BLOCK_TO_SUB_PIXEL(2) && gSamusData.xPosition < gCurrentSprite.xPosition - BLOCK_TO_SUB_PIXEL(10)) {
        u16 y = gCurrentSprite.yPosition, x = gCurrentSprite.xPosition;
        gCurrentSprite.pose = 8;
        gSpriteData[gCurrentSprite.primarySpriteRamSlot].work4 = 0;
        ScreenShakeStartHorizontal(60, 0x81);
        ParticleSet(y - 0x140, x + 0x40, PE_0x2F);
        ParticleSet(y - 0xc0, x + 0x32, PE_0x30);
        ParticleSet(y - 0x60, x + 0x48, PE_0x30);
        SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT, y - 0x1c2, x + 0x40);
        SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, y - 0x198, x + 0x20);
        SpriteDebrisInit(0, DEBRIS_TYPE_LIGHT_SLOW_LEFT, y - 0x178, x + 0x2a);
        SpriteDebrisInit(0, DEBRIS_TYPE_HEAVY_SLOW_LEFT, y - 0x14a, x + 0x24);
        SpriteDebrisInit(0, DEBRIS_TYPE_FALLING | DEBRIS_TYPE_HOPPING_SLOW_LEFT, y - 300, x + 0x30);
        SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_FAST_LEFT, y - 0xf0, x + 0x3a);
        SpriteDebrisInit(0, DEBRIS_TYPE_LIGHT_SLOW_LEFT, y - 200, x + 0x3c);
        SpriteDebrisInit(0, DEBRIS_TYPE_HOPPING_SLOW_LEFT, y - 0x8c, x + 0x30);
        SoundPlay_3b1c(0x218);
    }
}

void OmegaMetroidHuskGettingCrushedInit(void) {
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.pOam = sOmegaMetroidHuskOam_GettingCrushed;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    SoundPlay(0x225);
}

void OmegaMetroidHuskGettingCrushed(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sOmegaMetroidHuskOam_Crushed;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 60;
    }
}

void OmegaMetroidHuskWaiting(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.work1 = 30;
    }
}

void OmegaMetroidHuskDisappearing(void) {
    if ((gCurrentSprite.work1 & 1) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.status = 0;
}

void OmegaMetroidHusk(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            OmegaMetroidHuskInit();
            break;
        case 1:
            OmegaMetroidHuskWaitingForSamus();
            break;
        case 2:
            OmegaMetroidHuskWaitForOmegaMetroidToSpawn();
            break;
        case 0x17:
            OmegaMetroidHuskGettingCrushedInit();
            break;
        case 0x18:
            OmegaMetroidHuskGettingCrushed();
            break;
        case 0x1a:
            OmegaMetroidHuskWaiting();
            break;
        case 0x1c:
            OmegaMetroidHuskDisappearing();
    }
}
