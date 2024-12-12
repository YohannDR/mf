#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/bull.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void BullInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.pOam = sBullOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work2 = FALSE; // Smoke active flag
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    SpriteUtilChooseRandomXFlip();
    SpriteUtilChooseRandomXDirection();
    if (gSpriteRandomNumber >= 9) {
        gCurrentSprite.status |= SS_FACING_DOWN;
    }
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void BullIdleInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.pOam = sBullOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 3;
}

void BullIdle(void) {
    u8 collided = FALSE;
    if (--gCurrentSprite.work1 > 0) return;
    gCurrentSprite.work1 = 3;

    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.status &= ~SS_FACING_RIGHT;
            collided++;
        } else
            gCurrentSprite.xPosition += 4;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.status |= SS_FACING_RIGHT;
            collided++;
        } else
            gCurrentSprite.xPosition -= 4;
    }

    if (gCurrentSprite.status & SS_FACING_DOWN) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.status &= ~SS_FACING_DOWN;
            collided++;
        } else
            gCurrentSprite.yPosition -= 4;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.status |= SS_FACING_DOWN;
            collided++;
        } else
            gCurrentSprite.yPosition += 4;
    }

    if (collided && gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(SOUND_199);
}

void Bull(void) {
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4 && gCurrentSprite.pose != SPRITE_POSE_UNINITIALIZED && !gCurrentSprite.work2) {
        SpriteSpawnSecondary(SSPRITE_BULL_SMOKE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
        SoundPlayNotAlreadyPlaying(SOUND_BULL_RELEASING_SMOKE);
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            BullInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            BullIdleInit();
            break;
        case SPRITE_POSE_IDLE:
            BullIdle();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            BullInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
    }
}

void BullSmoke(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
        gCurrentSprite.bgPriority = 1;
        gCurrentSprite.drawOrder = 3;
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.pOam = sBullSmokeOam;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.drawDistanceTop = 0x28;
        gCurrentSprite.drawDistanceBottom = 0x28;
        gCurrentSprite.drawDistanceHorizontal = 0x28;
        gCurrentSprite.hitboxTop = -0x80;
        gCurrentSprite.hitboxBottom = 0x80;
        gCurrentSprite.hitboxLeft = -0x80;
        gCurrentSprite.hitboxRight = 0x80;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gSpriteData[primary].work2 = TRUE;
    } else {
        if (gCurrentSprite.currentAnimationFrame <= 1 || gCurrentSprite.currentAnimationFrame >= 4)
            gCurrentSprite.ignoreSamusCollisionTimer = 1;
        if (SpriteUtilCheckEndCurrentSpriteAnim()) {
            gCurrentSprite.status = 0;
            gSpriteData[primary].work2 = FALSE;
        }
    }
}
