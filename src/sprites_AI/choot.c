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
    gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(1);
    gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(0xf);
    gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(0xf);
}

void ChootSetClosedHitbox(void) {
    gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(0xc);
    gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(3);
    gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(8);
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
    gCurrentSprite.pOam = sChootOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    }
    else gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void ChootIdleInit(void) {
    gCurrentSprite.pose = 2;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_Idle;
}

void ChootIdle(void) {
    if (gCurrentSprite.status & SS_HIDDEN) return;

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - PIXEL_TO_SUB_PIXEL(0xc));
    if (gPreviousCollisionCheck != COLLISION_SOLID) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + PIXEL_TO_SUB_PIXEL(0xc));
        if (gPreviousCollisionCheck != COLLISION_SOLID) {
            gCurrentSprite.pose = 0x29;
            return;
        }
    }

    if (gSamusData.yPosition - PIXEL_TO_SUB_PIXEL(0x12) <= gCurrentSprite.yPosition &&
        (u8)SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_TO_SUB_PIXEL(5), BLOCK_TO_SUB_PIXEL(4)) != NSLR_OUT_OF_RANGE)
        gCurrentSprite.pose = 0x29;
}

void ChootLaunchingInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_Launching;
    gCurrentSprite.pose = 0x2a;
}

void ChootLaunching(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 0x2b;
}

void ChootGoingUpInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootOam_Jumping;
    gCurrentSprite.pose = 0x2c;
    gCurrentSprite.work4 = 0;
    ChootSetClosedHitbox();
    if (gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(0x1a2);
}

void ChootGoingUp(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_TO_SUB_PIXEL(0xc), gCurrentSprite.xPosition - PIXEL_TO_SUB_PIXEL(0xc));
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        gCurrentSprite.pose = 0x2d;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_TO_SUB_PIXEL(0xc), gCurrentSprite.xPosition + PIXEL_TO_SUB_PIXEL(0xc));
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentSprite.pose = 0x2d;
        } else {
            u8 offset = gCurrentSprite.work4;
            s16 movement = sChootJumpVelocity[offset];
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
    gCurrentSprite.pOam = sChootOam_Opening;
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
    gCurrentSprite.pOam = sChootOam_FloatingDown;
    gCurrentSprite.pose = 0x30;
    gCurrentSprite.work1 = 0;
}

void ChootGoingDown(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - PIXEL_TO_SUB_PIXEL(0xc));
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        gCurrentSprite.pose = 1;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + PIXEL_TO_SUB_PIXEL(0xc));
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentSprite.pose = 1;
        } else {
            gCurrentSprite.yPosition += PIXEL_SIZE / 4;
            if (MOD_AND(gCurrentSprite.work1, 64) == 0) {
                SpriteSpawnSecondary(SSPRITE_CHOOT_SPIT, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + PIXEL_TO_SUB_PIXEL(8), gCurrentSprite.xPosition, 0);
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
    gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(4);
    gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(4);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sChootSpitOam_Spawning;
    gCurrentSprite.work1 = 8;
    gCurrentSprite.pose = 2;
}

void ChootSpitSpawning(void) {
    gCurrentSprite.yPosition += PIXEL_SIZE / 4;
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sChootSpitOam_Falling;
        gCurrentSprite.pose = SPRITE_POSE_FALLING;
        gCurrentSprite.work4 = 0;
    }
}

void ChootSpitExplodingInit(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - BLOCK_SIZE);
    if ((gPreviousCollisionCheck & 0xf0) != 0)
        gCurrentSprite.pOam = sChootSpitOam_ExplodingOnGround;
    else
        // BUG: no "SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + BLOCK_SIZE);"?
        gCurrentSprite.pOam = sChootSpitOam_ExplodingMidair;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_LANDED;
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
        case SPRITE_POSE_LANDED_INIT:
        case SPRITE_POSE_STOPPED:
            ChootSpitExplodingInit();
        case SPRITE_POSE_LANDED:
            ChootSpitExploding();
            break;
        case SPRITE_POSE_FALLING:
            SpriteUtilCurrentSpriteFalling();
    }
}
