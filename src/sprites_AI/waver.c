#include "macros.h"
#include "globals.h"

#include "data/sprites/waver.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

#define WAVER_POSE_CHARGING 0x2a
#define WAVER_POSE_CRASHING_INIT 0x2b
#define WAVER_POSE_CRASHING 0x2c
#define WAVER_POSE_BACKING_OUT 0x2e
#define WAVER_POSE_BACKING_OUT_SECOND_PART 0x30
#define WAVER_POSE_TURNING_AFTER_BACKING_OUT 0x32

u8 WaverCheckSamusInRange(void) {
    u8 inRange = FALSE;
    if (gCurrentSprite.health > 0 && SpriteUtilCheckSamusNearSpriteFrontBehind(PIXEL_TO_SUB_PIXEL(0xa), BLOCK_TO_SUB_PIXEL(6.25f), PIXEL_TO_SUB_PIXEL(0x10)) == NSFB_IN_FRONT)
        inRange = TRUE;
    return inRange;
}

void WaverSetFlyingGFX(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.status & SS_FACING_DOWN)
        gCurrentSprite.pOam = sWaverOam_FlyingDown;
    else
        gCurrentSprite.pOam = sWaverOam_FlyingUp;
}

void WaverInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        if ((gSpriteRandomNumber & 1) != 0)
            gCurrentSprite.status |= SS_FACING_DOWN;
    }
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.frozenPaletteRowOffset = 1;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.work4 = 6 * 8;
    WaverSetFlyingGFX();
    SpriteUtilChooseRandomXFlip();
}

void WaverFlyingInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    WaverSetFlyingGFX();
}

void WaverFlying(void) {
    u8 touchedFloorCeiling;
    s16 movement;

    if (gCurrentSprite.status & SS_HIDDEN) return;

    touchedFloorCeiling = FALSE;
    if (gCurrentSprite.status & SS_FACING_DOWN) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            touchedFloorCeiling = TRUE;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            touchedFloorCeiling = TRUE;
    }

    if (WaverCheckSamusInRange()) {
        gCurrentSprite.pOam = sWaverOam_Charging;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = WAVER_POSE_CHARGING;
        gCurrentSprite.work3 = 0;
        gCurrentSprite.work1 = 20;
        SoundPlayNotAlreadyPlaying(SOUND_WAVER_CHARGING);
        return;
    }

    movement = sWaverFlyingYMovement[DIV_SHIFT(gCurrentSprite.work4, 8)];
    if (gCurrentSprite.status & SS_FACING_DOWN) {
        if (!touchedFloorCeiling)
            gCurrentSprite.yPosition += movement;
        if (gCurrentSprite.work4 >= ARRAY_SIZE(sWaverFlyingYMovement) * 8 - 1) {
            gCurrentSprite.work4 = 0;
            gCurrentSprite.status &= ~SS_FACING_DOWN;
        }
    } else {
        if (gCurrentSprite.pOam == sWaverOam_FlyingDown && SpriteUtilCheckEndCurrentSpriteAnim()) {
            gCurrentSprite.pOam = sWaverOam_FlyingUp;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
        if (!touchedFloorCeiling)
            gCurrentSprite.yPosition -= movement;
        if (gCurrentSprite.work4 >= ARRAY_SIZE(sWaverFlyingYMovement) * 8 - 1) {
            gCurrentSprite.work4 = 0;
            gCurrentSprite.status |= SS_FACING_DOWN;
            gCurrentSprite.pOam = sWaverOam_FlyingDown;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
    gCurrentSprite.work4++;

    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status &= ~SS_X_FLIP;
        else
            gCurrentSprite.xPosition += PIXEL_TO_SUB_PIXEL(1);
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status |= SS_X_FLIP;
        else
            gCurrentSprite.xPosition -= PIXEL_TO_SUB_PIXEL(1);
    }
}

void WaverCharging(void) {
    u16 movement = DIV_SHIFT(gCurrentSprite.work3, 8) + 6;
    if (gCurrentSprite.work3 < 0x28)
        gCurrentSprite.work3 += 1;
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentSprite.pose = WAVER_POSE_CRASHING_INIT;
            SpriteSpawnSecondary(SSPRITE_WAVER_DEBRIS, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (gCurrentSprite.status & SS_ON_SCREEN)
                SoundPlayNotAlreadyPlaying(SOUND_WAVER_CRASHING);
            return;
        } else {
            gCurrentSprite.xPosition += movement;
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentSprite.pose = WAVER_POSE_CRASHING_INIT;
            SpriteSpawnSecondary(SSPRITE_WAVER_DEBRIS, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SS_X_FLIP);
            if (gCurrentSprite.status & SS_ON_SCREEN)
                SoundPlayNotAlreadyPlaying(SOUND_WAVER_CRASHING);
            return;
        } else {
            gCurrentSprite.xPosition -= movement;
        }
    }
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.work1 = 20;
        if (gCurrentSprite.status & SS_ON_SCREEN)
            SoundPlayNotAlreadyPlaying(SOUND_WAVER_CHARGING);
    }
}

void WaverCrashingInit(void) {
    gCurrentSprite.pose = WAVER_POSE_CRASHING;
    gCurrentSprite.work1 = 60;
}

void WaverCrashing(void) {
    gCurrentSprite.animationDurationCounter--; // Freeze animation
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = WAVER_POSE_BACKING_OUT;
        gCurrentSprite.work1 = 68;
    }
}

void WaverBackingOut(void) {
    gCurrentSprite.animationDurationCounter--; // Freeze animation
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = WAVER_POSE_BACKING_OUT_SECOND_PART;
        gCurrentSprite.pOam = sWaverOam_BackingOut;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    } else if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition -= PIXEL_TO_SUB_PIXEL(0.25f);
    else
        gCurrentSprite.xPosition += PIXEL_TO_SUB_PIXEL(0.25f);
}

void WaverCheckBackingOutAnimEnded(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = WAVER_POSE_TURNING_AFTER_BACKING_OUT;
        gCurrentSprite.pOam = sWaverOam_BackingOut;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.status ^= SS_X_FLIP;
    }
}

void WaverCheckTurningAnimNearEnded(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 1;
}

void WaverDebrisInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(1);
    gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(0xa);
    gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(0xa);
    gCurrentSprite.pOam = sWaverDebrisOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 16;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawOrder = 3;
}

void WaverDebrisFalling(void) {
    u8 offset;
    s16 movement;

    if (gCurrentSprite.work1 == 0) {
        SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck != 0) {
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0x27);
            gCurrentSprite.status = 0;
            return;
        }
    } else {
        gCurrentSprite.work1--;
    }

    offset = gCurrentSprite.work4;
    movement = sWaverDebrisFallingSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sWaverDebrisFallingSpeed[offset - 1];
        gCurrentSprite.yPosition += movement;
    } else {
        offset++;
        gCurrentSprite.work4 = offset;
        gCurrentSprite.yPosition += movement;
    }

    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition += PIXEL_SIZE;
    else
        gCurrentSprite.xPosition -= PIXEL_SIZE;
}

void WaverDebrisExploding(void) {
    ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x25);
    gCurrentSprite.status = 0;
}

void Waver(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_WAVER_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            WaverInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            WaverFlyingInit();
        case SPRITE_POSE_IDLE:
            WaverFlying();
            break;
        case WAVER_POSE_CHARGING:
            WaverCharging();
            break;
        case WAVER_POSE_CRASHING_INIT:
            WaverCrashingInit();
        case WAVER_POSE_CRASHING:
            WaverCrashing();
            break;
        case WAVER_POSE_BACKING_OUT:
            WaverBackingOut();
            break;
        case WAVER_POSE_BACKING_OUT_SECOND_PART:
            WaverCheckBackingOutAnimEnded();
            break;
        case WAVER_POSE_TURNING_AFTER_BACKING_OUT:
            WaverCheckTurningAnimNearEnded();
            break;
        case 0x57:
            SpriteDyingInit();
        case 0x58:
            SpriteDying();
            break;
        case 0x59:
            WaverInit();
        case 0x5a:
            SpriteSpawningFromX();
            break;
        case 0x5b:
            XParasiteInit();
    }
}

void WaverExplosion(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            WaverDebrisInit();
        case 2:
            WaverDebrisFalling();
            break;
        default:
            WaverDebrisExploding();
    }
}
