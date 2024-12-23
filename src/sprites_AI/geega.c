#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/geega.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void GeegaSpawningFromX(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.work1 > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    } else {
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.pose = 1;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
}

void GeegaInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.status |= SS_HIDDEN;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x30;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x1c;
    gCurrentSprite.hitboxRight = 0x1c;
    gCurrentSprite.pOam = sGeegaOam_379aa8;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        gCurrentSprite.pose = 1;
        gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
        gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
        gCurrentSprite.work1 = 0;
    }
}

void GeegaIdle(void) {
    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.work1--;
    } else {
        if (gSamusData.yPosition < gCurrentSprite.yPosition - 0x3c
            && SpriteUtilCheckSamusNearSpriteLeftRight(0x1c0, 0x180) != NSLR_OUT_OF_RANGE) {
            SpriteUtilMakeSpriteFaceSamusXFlip();
            gCurrentSprite.pose = 2;
            gCurrentSprite.status &= ~SS_HIDDEN;
            gCurrentSprite.work1 = 20;
        }
    }
}

void GeegaGoingUp(void) {
    u16 y = gCurrentSprite.yPosition - 0x20;
    u16 x = gCurrentSprite.xPosition;
    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 18) {
            SpriteDebrisInit(0, 0x11, y - 0x60, x);
            SpriteDebrisInit(0, 0x12, y - 0x60, x + 0x10);
        } else if (gCurrentSprite.work1 == 12) {
            SpriteDebrisInit(0, 0x13, y - 0x40, x - 0x10);
            SpriteDebrisInit(0, 4, y - 0x40, x);
        } else if (gCurrentSprite.work1 == 7) {
            SpriteDebrisInit(0, 0x11, y - 0x20, x + 8);
            SpriteDebrisInit(0, 0x12, y - 0x20, x - 0x10);
        } else if (gCurrentSprite.work1 == 3) {
            SpriteDebrisInit(0, 0x13, y, x - 8);
            SpriteDebrisInit(0, 4, y, x + 0x10);
        } else if (gCurrentSprite.work1 == 0) {
            gCurrentSprite.scaling = gSamusData.yPosition - 0x3c;
        }
    } else {
        if (gCurrentSprite.scaling < gCurrentSprite.yPosition) {
            gCurrentSprite.yPosition -= 4;
        } else {
            gCurrentSprite.work1 = 20;
            gCurrentSprite.pOam = sGeegaOam_379ad0;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.pose = 0x18;
        }
    }
}

void GeegaGoingForward(void) {
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition += 6;
    else
        gCurrentSprite.xPosition -= 6;
    if (!(gCurrentSprite.status & SS_ON_SCREEN)) {
        gCurrentSprite.status |= SS_HIDDEN;
        gCurrentSprite.pose = 1;
        gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer;
        gCurrentSprite.xPosition = gCurrentSprite.unk_8;
        gCurrentSprite.pOam = sGeegaOam_379aa8;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 120;
    }
}

void Geega(void) {
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            GeegaInit();
            break;
        case 1:
            GeegaIdle();
            break;
        case 2:
            GeegaGoingUp();
            break;
        case 0x18:
            GeegaGoingForward();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            GeegaInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            GeegaSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
    }
}
