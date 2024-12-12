#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/evir.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u8 EvirCheckInShootingRange(void) {
    u8 nslr = NSLR_OUT_OF_RANGE;
    if (gCurrentSprite.status & SS_HIDDEN)
        return NSLR_OUT_OF_RANGE;
    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.work1--;
        return NSLR_OUT_OF_RANGE;
    }
    if (gCurrentSprite.status & SS_ON_SCREEN && gCurrentSprite.health > 0)
        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0x180, 0x180);
    return nslr;
}

void EvirSpawningFromX(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.xParasiteTimer > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    } else {
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.pose = 2;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
}

void EvirTurningIntoX(void) {
    gCurrentSprite.yPosition -= 0x5c;
    if (gCurrentSprite.status & SS_X_FLIP)
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x28, gCurrentSprite.xPosition + 0x20, SS_X_FLIP);
    else
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x28, gCurrentSprite.xPosition - 0x20, SS_X_FLIP);
}

void EvirInit(void) {
    u8 slot;

    SpriteUtilTrySetAbsorbXFlag();
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.pOam = sEvirOam_356abc;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 0;
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        if (!(gCurrentSprite.status & SS_HIDDEN)) {
            gCurrentSprite.status = 0;
            return;
        }
        gCurrentSprite.numberOfXToForm = 2;
        gCurrentSprite.hitboxTop = -0x80;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -0x40;
        gCurrentSprite.hitboxRight = 0x40;
    } else {
        gCurrentSprite.hitboxTop = -0x40;
        gCurrentSprite.hitboxBottom = -0x18;
        gCurrentSprite.hitboxLeft = -0x20;
        gCurrentSprite.hitboxRight = 0x20;
    }
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        return;
    }
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    SpriteUtilMakeSpriteFaceSamusXFlip();
    SpriteUtilChooseRandomXDirection();

    slot = SpriteSpawnSecondary(SSPRITE_EVIR_COLLISION, FALSE, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x60,  gCurrentSprite.xPosition, 0);
    if (slot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.status & SS_X_FLIP) {
        slot = SpriteSpawnSecondary(SSPRITE_EVIR_COLLISION, TRUE, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x20,  gCurrentSprite.xPosition - 0x18, 0);
        if (slot == UCHAR_MAX) {
            gCurrentSprite.status = 0;
            return;
        }
    } else {
        slot = SpriteSpawnSecondary(SSPRITE_EVIR_COLLISION, TRUE, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x20,  gCurrentSprite.xPosition + 0x18, 0);
        if (slot == UCHAR_MAX) {
            gCurrentSprite.status = 0;
            return;
        }
    }
}

void EvirShootingInit(void) {
    gCurrentSprite.pose = 0x2a;
    gCurrentSprite.pOam = sEvirOam_356b04;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 90;
}

void EvirShooting(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 1;
        return;
    }
    if (gCurrentSprite.currentAnimationFrame == 4 && gCurrentSprite.animationDurationCounter == 8) {
        if (gCurrentSprite.status & SS_X_FLIP)
            SpriteSpawnSecondary(SSPRITE_EVIR_PROJECTILE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - 0x48, gCurrentSprite.xPosition + 0x1c, SS_X_FLIP);
        else
            SpriteSpawnSecondary(SSPRITE_EVIR_PROJECTILE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - 0x48, gCurrentSprite.xPosition - 0x1c, 0);
    } else if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 8 && gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(SOUND_EVIR_SHOOTING);
}

void EvirIdleInit(void) {
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sEvirOam_356abc;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void EvirIdle(void) {
    u8 collided;

    if (EvirCheckInShootingRange() != NSLR_OUT_OF_RANGE) {
        EvirShootingInit();
        return;
    }

    collided = FALSE;
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            collided = TRUE;
        else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition + 0x40);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                collided = TRUE;
            else if (MOD_AND(gFrameCounter8Bit, 8) == 0)
                gCurrentSprite.xPosition += 4;
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            collided = TRUE;
        else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition - 0x40);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                collided = TRUE;
            else if (MOD_AND(gFrameCounter8Bit, 8) == 0)
                gCurrentSprite.xPosition -= 4;
        }
    }
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 8, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
        else
            gCurrentSprite.yPosition += 2;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
        else
            gCurrentSprite.yPosition -= 2;
    }
    if (collided)
        gCurrentSprite.pose = 3;
    else if (gCurrentSprite.currentAnimationFrame == 2 && gCurrentSprite.animationDurationCounter == 1 && gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(SOUND_EVIR_IDLE);
}

void EvirTurningAroundInit(void) {
    gCurrentSprite.pose = 4;
    gCurrentSprite.pOam = sEvirOam_356b44;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void EvirTurningAround(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 5;
        gCurrentSprite.pOam = sEvirOam_356b64;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.status ^= SS_X_FLIP;
    }
}

void EvirTurningAroundSecondPart(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void EvirCollisionInit(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[primary].status & SS_HIDDEN)
        gCurrentSprite.status |= SS_HIDDEN;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.pose = 2;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.pOam = sEvirOam_356b84;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.roomSlot) {
        gCurrentSprite.hitboxLeft = -0x18;
        gCurrentSprite.hitboxRight = 0x18;
    } else {
        gCurrentSprite.hitboxLeft = -0x38;
        gCurrentSprite.hitboxRight = 0x38;
    }
}

void EvirCollisionIdle(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[primary].status & SS_HIDDEN)
        gCurrentSprite.status |= SS_HIDDEN;
    else
        gCurrentSprite.status &= ~SS_HIDDEN;
    if (gCurrentSprite.health == 0) {
        if (gSpriteData[primary].pose < SPRITE_POSE_DYING_INIT) {
            gSpriteData[primary].pose = SPRITE_POSE_DYING_INIT;
            gSpriteData[primary].ignoreSamusCollisionTimer = 1;
            gSpriteData[primary].health = 0;
            gSpriteData[primary].properties |= SP_DESTROYED;
            gSpriteData[primary].freezeTimer = 0;
            gSpriteData[primary].paletteRow = 0;
            gCurrentSprite.status = 0;
            return;
        }
    }
    if (gCurrentSprite.roomSlot) {
        gCurrentSprite.yPosition = gSpriteData[primary].yPosition - 0x20;
        if (gSpriteData[primary].status & SS_X_FLIP)
            gCurrentSprite.xPosition = gSpriteData[primary].xPosition - 0x18;
        else
            gCurrentSprite.xPosition = gSpriteData[primary].xPosition + 0x18;
    } else {
        gCurrentSprite.yPosition = gSpriteData[primary].yPosition - 0x60;
        gCurrentSprite.xPosition = gSpriteData[primary].xPosition;
    }
    switch (gSpriteData[primary].pose) {
        case SPRITE_POSE_DYING_INIT:
        case SPRITE_POSE_DYING:
            gCurrentSprite.status = 0;
            return;
    }
    if (gSpriteData[primary].status & SS_ENABLE_MOSAIC) {
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    } else
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
}

void EvirProjectileInit(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.properties |= SS_NOT_DRAWN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -0xc;
    gCurrentSprite.hitboxBottom = 0xc;
    gCurrentSprite.hitboxLeft = -0xc;
    gCurrentSprite.hitboxRight = 0xc;
    gCurrentSprite.pOam = sEvirOam_356b84;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.scaling = 0x40;
    gCurrentSprite.work2 = Q_8_8(1.f/4);
    gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.bgPriority = 1;
    gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
    gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
}

void EvirProjectileMovingInit(void) {
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

void EvirProjectileMoving(void) {
    s16 distance;
    u32 angle;
    s16 sin, cos;
    u16 yOffset, xOffset;

    if (gCurrentSprite.health == 0) {
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
        return;
    }
    if (!(gCurrentSprite.status & SS_ON_SCREEN)) {
        gCurrentSprite.status = 0;
        return;
    }

    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.work2 -= 4;
    else
        gCurrentSprite.work2 += 4;
    if (MOD_AND(gFrameCounter8Bit, 2) != 0)
        gCurrentSprite.scaling += 1;

    distance = gCurrentSprite.scaling;
    angle = gCurrentSprite.work2;

    sin = SIN(angle);
    if (sin < 0) {
        yOffset = Q_8_8_TO_INT(-sin * distance);
        gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer - yOffset;
    } else {
        yOffset = Q_8_8_TO_INT(sin * distance);
        gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer + yOffset;
    }

    cos = COS(angle);
    if (cos < 0) {
        xOffset = Q_8_8_TO_INT(-cos * distance);
        gCurrentSprite.xPosition = gCurrentSprite.unk_8 - xOffset;
    } else {
        xOffset = Q_8_8_TO_INT(cos * distance);
        gCurrentSprite.xPosition = gCurrentSprite.unk_8 + xOffset;
    }
}

void EvirProjectileExplodingInit(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pOam = sEvirOam_356bac;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
}

void EvirProjectileExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void Evir(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_EVIR_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_EVIR_COLLISION, gCurrentSprite.primarySpriteRamSlot);
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            EvirInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            EvirIdleInit();
        case SPRITE_POSE_IDLE:
            EvirIdle();
            break;
        case 0x29:
            EvirShootingInit();
        case 0x2a:
            EvirShooting();
            break;
        case 3:
            EvirTurningAroundInit();
        case 4:
            EvirTurningAround();
            break;
        case 5:
            EvirTurningAroundSecondPart();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_EVIR_COLLISION, gCurrentSprite.primarySpriteRamSlot);
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            EvirInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            EvirSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            EvirTurningIntoX();
            XParasiteInit();
    }
}

void EvirCollision(void) {
    if (SPRITE_HAS_ISFT(gSpriteData[gCurrentSprite.primarySpriteRamSlot]) < SPRITE_HAS_ISFT(gCurrentSprite))
        SPRITE_CLEAR_AND_SET_ISFT(gSpriteData[gCurrentSprite.primarySpriteRamSlot], (gCurrentSprite.invincibilityStunFlashTimer + 1) & 0x7f);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdatePrimarySpriteFreezeTimer();
    } else {
        switch (gCurrentSprite.pose) {
            case 0:
                EvirCollisionInit();
            default:
                EvirCollisionIdle();
        }
    }
}

void EvirProjectile(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            EvirProjectileInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            EvirProjectileMovingInit();
        case SPRITE_POSE_IDLE:
            EvirProjectileMoving();
            break;
        case 0x38:
            EvirProjectileExploding();
            break;
        default:
            EvirProjectileExplodingInit();
    }
}
