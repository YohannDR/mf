#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/skultera.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

enum SkulteraSize {
    SKULTERA_SIZE_SMALL_HIDDEN,
    SKULTERA_SIZE_SMALL,
    SKULTERA_SIZE_LARGE
};

void SkulteraSetSidesHitboxes(void) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE) {
            gCurrentSprite.hitboxLeft = -0x18;
            gCurrentSprite.hitboxRight = 0x28;
        } else {
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x20;
        }
    } else {
        if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE) {
            gCurrentSprite.hitboxLeft = -0x28;
            gCurrentSprite.hitboxRight = 0x18;
        } else {
            gCurrentSprite.hitboxLeft = -0x20;
            gCurrentSprite.hitboxRight = 0x10;
        }
    }
}

u8 SkulteraXMovement(u16 movement) {
    u16 xBoundary;

    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE)
            xBoundary = gCurrentSprite.xPosition + 0x38;
        else
            xBoundary = gCurrentSprite.xPosition + 0x28;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, xBoundary);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            return TRUE;
        gCurrentSprite.xPosition += movement;
    } else {
        if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE)
            xBoundary = gCurrentSprite.xPosition - 0x38;
        else
            xBoundary = gCurrentSprite.xPosition - 0x28;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, xBoundary);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            return TRUE;
        gCurrentSprite.xPosition -= movement;
    }
    return FALSE;
}

void SkulteraTurningIntoX(void) {
    if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE) {
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.spritesetSlotAndProperties,
            gCurrentSprite.yPosition - 0x30, gCurrentSprite.xPosition - 0x10, 0);
    } else
        gCurrentSprite.yPosition -= 0x20;
}

void SkulteraInit(void) {
    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
        if (gCurrentSprite.spritesetSlotAndProperties >= SSP_X_ABSORBABLE_BY_SAMUS && gCurrentSprite.spritesetSlotAndProperties < SSP_40 + 0x10) {
            if (gCurrentSprite.status & SS_HIDDEN)
                gCurrentSprite.work0 = SKULTERA_SIZE_SMALL_HIDDEN;
            else
                gCurrentSprite.work0 = SKULTERA_SIZE_SMALL;
        } else {
            gCurrentSprite.status = 0;
            return;
        }
        SpriteUtilChooseRandomXFlip();
        gCurrentSprite.pose = 1;
    } else {
        gCurrentSprite.work0++;
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    }
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE) {
        gCurrentSprite.properties &= ~SP_CAN_ABSORB_X;
        gCurrentSprite.pOam = sSkulteraOam_IdleLarge;
        gCurrentSprite.drawDistanceTop = 0x28;
        gCurrentSprite.drawDistanceBottom = 8;
        gCurrentSprite.drawDistanceHorizontal = 0x18;
        gCurrentSprite.hitboxTop = -0x80;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.frozenPaletteRowOffset = 1;
        gCurrentSprite.spriteId = PSPRITE_SKULTERA_LARGE;
    } else {
        gCurrentSprite.pOam = sSkulteraOam_IdleSmall;
        if (gCurrentSprite.spriteId != PSPRITE_SKULTERA_SMALL_2)
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
        gCurrentSprite.drawDistanceTop = 0x18;
        gCurrentSprite.drawDistanceBottom = 8;
        gCurrentSprite.drawDistanceHorizontal = 0x18;
        gCurrentSprite.hitboxTop = -0x40;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.numberOfXToForm = 1;
    }
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    SkulteraSetSidesHitboxes();
}

void SkulteraIdleInit(void) {
    gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
    gCurrentSprite.pose = 2;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE) {
        gCurrentSprite.pOam = sSkulteraOam_IdleLarge;
        gCurrentSprite.work1 = 3;
    } else {
        gCurrentSprite.pOam = sSkulteraOam_IdleSmall;
        gCurrentSprite.work1 = 4;
    }
}

void SkulteraIdle(void) {
    u32 nslr;
    if (--gCurrentSprite.work1 == 0) {
        if (SkulteraXMovement(4)) {
            gCurrentSprite.pose = 3;
        } else {
            if (gCurrentSprite.status & SS_X_FLIP) {
                if (gCurrentSprite.unk_8 + 0x200 < gCurrentSprite.xPosition)
                    gCurrentSprite.pose = 3;
            } else {
                if (gCurrentSprite.unk_8 - 0x200 > gCurrentSprite.xPosition)
                    gCurrentSprite.pose = 3;
            }
            if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE)
                gCurrentSprite.work1 = 3;
            else
                gCurrentSprite.work1 = 4;
        }
    }
    if (!gSamusUnderwaterFlag) return;
    if (SpriteUtilCheckSamusNearSpriteLeftRight(0x280, 0x40) != NSLR_OUT_OF_RANGE) return;
    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0xc0, 0x140);
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (nslr == NSLR_RIGHT)
            gCurrentSprite.pose = 0x29;
        else if (nslr == NSLR_LEFT)
            gCurrentSprite.pose = 3;
    } else {
        if (nslr == NSLR_LEFT)
            gCurrentSprite.pose = 0x29;
        else if (nslr == NSLR_RIGHT)
            gCurrentSprite.pose = 3;
    }
}

void SkulteraChasingSamusInit(void) {
    gCurrentSprite.pose = 0x2a;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE)
        gCurrentSprite.pOam = sSkulteraOam_ChasingLarge;
    else
        gCurrentSprite.pOam = sSkulteraOam_ChasingSmall;
}

void SkulteraChasingSamus(void) {
    u16 targetY = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    u16 spriteCenterY = gCurrentSprite.yPosition - 0x20;
    u32 nslr;

    if (spriteCenterY - 0x40 > targetY) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_AIR && gCurrentAffectingClipdata.hazard == HAZARD_WATER)
            gCurrentSprite.yPosition -= 2;
    } else if (spriteCenterY + 0x40 < targetY) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_AIR)
            gCurrentSprite.yPosition += 2;
    }
    if (--gCurrentSprite.work1 == 0) {
        if (SkulteraXMovement(4)) {
            gCurrentSprite.pose = 3;
        } else {
            if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE)
                gCurrentSprite.work1 = 2;
            else
                gCurrentSprite.work1 = 3;
        }
    }
    if (!gSamusUnderwaterFlag) {
        gCurrentSprite.pose = 1;
        return;
    }
    if (SpriteUtilCheckSamusNearSpriteLeftRight(0x280, 0x40) != NSLR_OUT_OF_RANGE) return;
    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0xc0, 0x140);
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (nslr == NSLR_RIGHT)
            return;
        else if (nslr == NSLR_LEFT)
            gCurrentSprite.pose = 3;
        else
            gCurrentSprite.pose = 1;
    } else {
        if (nslr == NSLR_LEFT)
            return;
        else if (nslr == NSLR_RIGHT)
            gCurrentSprite.pose = 3;
        else
            gCurrentSprite.pose = 1;
    }
}

void SkulteraTurningAroundInit(void) {
    gCurrentSprite.pose = 4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE) {
        gCurrentSprite.pOam = sSkulteraOam_TurningAroundLarge;
        if (!(gCurrentSprite.status & SS_HIDDEN) && gSamusUnderwaterFlag && gCurrentSprite.status & SS_ON_SCREEN)
            SoundPlayNotAlreadyPlaying(SOUND_SKULTERA_LARGE_TURNING);
    } else {
        gCurrentSprite.pOam = sSkulteraOam_TurningAroundSmall;
        if (!(gCurrentSprite.status & SS_HIDDEN) && gSamusUnderwaterFlag && gCurrentSprite.status & SS_ON_SCREEN)
            SoundPlayNotAlreadyPlaying(SOUND_SKULTERA_SMALL_TURNING);
    }
}

void SkulteraTurningAround(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        SkulteraIdleInit();
        gCurrentSprite.status ^= SS_X_FLIP;
        SkulteraSetSidesHitboxes();
    }
}

void Skultera(void) {
    if (gCurrentSprite.work0 == SKULTERA_SIZE_LARGE) {
        if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
            SoundPlayNotAlreadyPlaying(SOUND_SKULTERA_LARGE_HURT);
    } else {
        if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
            SoundPlayNotAlreadyPlaying(SOUND_SKULTERA_SMALL_HURT);
    }
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            SkulteraInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            SkulteraIdleInit();
            break;
        case SPRITE_POSE_IDLE:
            SkulteraIdle();
            break;
        case 3:
            SkulteraTurningAroundInit();
        case 4:
            SkulteraTurningAround();
            break;
        case 0x29:
            SkulteraChasingSamusInit();
        case 0x2a:
            SkulteraChasingSamus();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            SkulteraInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            SkulteraTurningIntoX();
            XParasiteInit();
    }
}
