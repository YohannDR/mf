#include "macros.h"
#include "globals.h"

#include "data/sprites/choot.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

void ChootSetOpenHitbox(void) {
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -0x3c;
    gCurrentSprite.hitboxRight = 0x3c;
}

void ChootSetClosedHitbox(void) {
    gCurrentSprite.hitboxTop = -0x30;
    gCurrentSprite.hitboxBottom = 0xc;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
}

void ChootInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    SpriteUtilMakeSpriteFaceSamusXFlip();
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    ChootSetOpenHitbox();
    gCurrentSprite.pOam = sChootOam_3598fc;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = 44;
    }
    else gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void ChootIdleInit(void) {
    gCurrentSprite.pose = 2;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_3598fc;
}

void ChootIdle(void) {
    if (gCurrentSprite.status & SS_HIDDEN) return;

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x30);
    if (gPreviousCollisionCheck != COLLISION_SOLID) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x30);
        if (gPreviousCollisionCheck != COLLISION_SOLID) {
            gCurrentSprite.pose = 0x29;
            return;
        }
    }

    if (gSamusData.yPosition - 0x48 <= gCurrentSprite.yPosition && (u8)SpriteUtilCheckSamusNearSpriteLeftRight(0x140, 0x100) != NSLR_OUT_OF_RANGE)
        gCurrentSprite.pose = 0x29;
}

void ChootLaunchingInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_35990c;
    gCurrentSprite.pose = 0x2a;
}

void ChootLaunching(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 0x2b;
}

void ChootGoingUpInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_359924;
    gCurrentSprite.pose = 0x2c;
    gCurrentSprite.work4 = 0;
    ChootSetClosedHitbox();
    if (gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(0x1a2);
}

void ChootGoingUp(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x30, gCurrentSprite.xPosition - 0x30);
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        gCurrentSprite.pose = 0x2d;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x30, gCurrentSprite.xPosition + 0x30);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentSprite.pose = 0x2d;
        } else {
            u8 offset = gCurrentSprite.work4;
            s16 movement = sChootUpwardsSpeed[offset];
            if (movement == SHORT_MAX) {
                gCurrentSprite.pose = 0x2d;
            } else {
                offset++;
                gCurrentSprite.work4 = offset;
                gCurrentSprite.yPosition += movement;
                return;
            }
        }
    }
}

void ChootOpeningInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_359934;
    gCurrentSprite.pose = 0x2e;
    ChootSetOpenHitbox();
}

void ChootOpening(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 0x2f;
}

void ChootGoingDownInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_35995c;
    gCurrentSprite.pose = 0x30;
    gCurrentSprite.work1 = 0;
}

void ChootGoingDown(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x30);
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        gCurrentSprite.pose = 1;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x30);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentSprite.pose = 1;
        } else {
            gCurrentSprite.yPosition += 1;
            if ((gCurrentSprite.work1 & 0x3f) == 0) {
                SpriteSpawnSecondary(SSPRITE_CHOOT_SPIT, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition, 0);
                if (gCurrentSprite.status & SS_ON_SCREEN)
                    SoundPlayNotAlreadyPlaying(0x1a3);
            }
            gCurrentSprite.work1++;
        }
    }
}

void ChootSpitInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x10;
    gCurrentSprite.hitboxRight = 0x10;
    gCurrentSprite.samusCollision = 4;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_359984;
    gCurrentSprite.work1 = 8;
    gCurrentSprite.pose = 2;
}

void ChootSpitSpawning(void) {
    gCurrentSprite.yPosition += 1;
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sChootOam_359994;
        gCurrentSprite.pose = 0x16;
        gCurrentSprite.work4 = 0;
    }
}

void ChootSpitExplodingInit(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x40);
    if ((gPreviousCollisionCheck & 0xf0) != 0)
        gCurrentSprite.pOam = sChootOam_3599cc;
    else
        gCurrentSprite.pOam = sChootOam_3599a4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 8;
}

void ChootSpitExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void Choot(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x1a4);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            ChootInit();
            break;
        case 1:
            ChootIdleInit();
        case 2:
            ChootIdle();
            break;
        case 0x29:
            ChootLaunchingInit();
        case 0x2a:
            ChootLaunching();
            break;
        case 0x2b:
            ChootGoingUpInit();
        case 0x2c:
            ChootGoingUp();
            break;
        case 0x2d:
            ChootOpeningInit();
        case 0x2e:
            ChootOpening();
            break;
        case 0x2f:
            ChootGoingDownInit();
        case 0x30:
            ChootGoingDown();
            break;
        case 0x57:
            SpriteDyingInit();
        case 0x58:
            SpriteDying();
            break;
        case 0x59:
            ChootInit();
        case 0x5a:
            SpriteSpawningFromX();
            break;
        case 0x5b:
            XParasiteInit();
    }
}

void ChootSpit(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            ChootSpitInit();
            break;
        case 2:
            ChootSpitSpawning();
            break;
        case 7:
        case 0x37:
            ChootSpitExplodingInit();
        case 8:
            ChootSpitExploding();
            break;
        case 0x16:
            SpriteUtilCurrentSpriteFalling();
    }
}
