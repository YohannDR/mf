#include "macros.h"
#include "globals.h"

#include "data/sprites/geruboss.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

#define SS_GERUBOSS_FACING_DOWN SS_SAMUS_COLLIDING

u8 GerubossYMovement(u16 movement) {
    if (gCurrentSprite.status & SS_GERUBOSS_FACING_DOWN) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition - 0x30);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition + 0x30);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.yPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x30);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x30);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.yPosition -= movement;
    }
    return FALSE;
}

u8 GerubossXMovement(u16 movement) {
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition + 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition -= movement;
    }
    return FALSE;
}

void GerubossTurningIntoX(void) {
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.spritesetSlotAndProperties,
        gCurrentSprite.yPosition - 8, gCurrentSprite.xPosition + 0x24, SS_X_FLIP);
    gCurrentSprite.yPosition += 8;
    gCurrentSprite.xPosition -= 0x24;
}

void GerubossInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    SpriteUtilMakeSpriteFaceSamusDirection();
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 0x28;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x30;
    gCurrentSprite.hitboxLeft = -0x38;
    gCurrentSprite.hitboxRight = 0x38;
    gCurrentSprite.pOam = sGerubossOam_358e14;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    if (gCurrentSprite.pose == 0x59) {
        gCurrentSprite.pose = 0x5a;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        gCurrentSprite.yPosition -= 0x20;
        gCurrentSprite.pose = 1;
    }
}

void GerubossIdleInit(void) {
    gCurrentSprite.pose = 2;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sGerubossOam_358e14;
    gCurrentSprite.work1 = 48;
}

void GerubossIdle(void) {
    if (gCurrentSprite.status & SS_HIDDEN) return;

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x24, gCurrentSprite.xPosition - 0x30);
    if (gPreviousCollisionCheck != COLLISION_SOLID) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x24, gCurrentSprite.xPosition + 0x30);
        if (gPreviousCollisionCheck != COLLISION_SOLID) {
            SpriteUtilMakeSpriteFaceSamusDirection();
            gCurrentSprite.pose = 0x29;
            return;
        }
    }

    if (SPRITE_HAS_ISFT(gCurrentSprite) != 0) {
        gCurrentSprite.pose = 8;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sGerubossOam_358df4;
        gCurrentSprite.work1 = 0x5a;
        SoundPlayNotAlreadyPlaying(0x1a0);
        return;
    }

    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.work1--;
    } else if (gSamusData.yPosition - 0x48 >= gCurrentSprite.yPosition) {
        u8 nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0x200, 0x140);
        if (nslr == NSLR_RIGHT) {
            gCurrentSprite.status |= SS_FACING_RIGHT;
            gCurrentSprite.pose = 0x29;
        } else if (nslr == NSLR_LEFT) {
            gCurrentSprite.status &= ~SS_FACING_RIGHT;
            gCurrentSprite.pose = 0x29;
        }
    }
}

void GerubossStalling(void) {
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 1;
}

void GerubossLaunchingInit(void) {
    gCurrentSprite.pose = 0x2a;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sGerubossOam_358e3c;
    SoundPlayNotAlreadyPlaying(0x19d);
}

void GerubossCharging(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x2c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sGerubossOam_358e6c;
        gCurrentSprite.status |= SS_GERUBOSS_FACING_DOWN;
        gCurrentSprite.work1 = 24;
        SoundPlayNotAlreadyPlaying(0x19e);
    }
}

void GerubossGoingDown(void) {
    if (gCurrentSprite.work1 > 0) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.pOam = sGerubossOam_358e8c;
            gCurrentSprite.work2 = 0;
        }
    } else {
        if ((gCurrentSprite.work2 & 0xf) == 0)
            SoundPlay(0x19f);
        gCurrentSprite.work2++;
    }
    GerubossXMovement(2);
    if (GerubossYMovement(0xc)) {
        gCurrentSprite.pose = 0x2e;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sGerubossOam_358eec;
    }
}

void GerubossChangingDirection(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x30;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sGerubossOam_358eac;
        gCurrentSprite.status &= ~SS_GERUBOSS_FACING_DOWN;
        gCurrentSprite.work1 = 24;
        SoundPlayNotAlreadyPlaying(0x19e);
    }
}

void GerubossGoingUp(void) {
    if (gCurrentSprite.work1 > 0) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.pOam = sGerubossOam_358ecc;
            gCurrentSprite.work2 = 0;
        }
    } else {
        if ((gCurrentSprite.work2 & 0xf) == 0)
            SoundPlay(0x19f);
        gCurrentSprite.work2++;
    }
    GerubossXMovement(2);
    if (GerubossYMovement(0xc)) {
        gCurrentSprite.pose = 0x32;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sGerubossOam_358f3c;
    }
}

void GerubossGrabbingCeiling(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 1;
}

void Geruboss(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x1a1);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            GerubossInit();
            break;
        case 1:
            GerubossIdleInit();
        case 2:
            GerubossIdle();
            break;
        case 8:
            GerubossStalling();
            break;
        case 0x29:
            GerubossLaunchingInit();
        case 0x2a:
            GerubossCharging();
            break;
        case 0x2c:
            GerubossGoingDown();
            break;
        case 0x2e:
            GerubossChangingDirection();
            break;
        case 0x30:
            GerubossGoingUp();
            break;
        case 0x32:
            GerubossGrabbingCeiling();
            break;
        case 0x57:
            SpriteDyingInit();
        case 0x58:
            SpriteDying();
            break;
        case 0x59:
            GerubossInit();
        case 0x5a:
            SpriteSpawningFromX();
            break;
        case 0x5b:
            GerubossTurningIntoX();
            XParasiteInit();
    }
}
