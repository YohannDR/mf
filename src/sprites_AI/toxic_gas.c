#include "macros.h"
#include "globals.h"

#include "data/sprite_data.h"
#include "data/sprites/toxic_gas.h"

#include "constants/audio.h"
#include "constants/particle.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

void ToxicGasInit(void) {
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pOam = sToxicGasOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x30;
    gCurrentSprite.drawDistanceHorizontal = 0x30;
    gCurrentSprite.hitboxTop = -0x30;
    gCurrentSprite.hitboxBottom = 0xb0;
    gCurrentSprite.hitboxLeft = -0x30;
    gCurrentSprite.hitboxRight = 0xb0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL | SS_DOUBLE_SIZE;
    gCurrentSprite.scaling = Q_8_8(1.999);
    gCurrentSprite.work1 = 0;
    gCurrentSprite.bgPriority = 1;
    gCurrentSprite.properties |= SP_SOLID_FOR_PROJECTILES;
}

void ToxicGasIdle(void) {
    gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.scaling += Q_8_8(1./128);
        if (gCurrentSprite.scaling >= Q_8_8(1.999))
            gCurrentSprite.work1--;
    } else {
        gCurrentSprite.scaling -= Q_8_8(1./128);
        if (gCurrentSprite.scaling < Q_8_8(1.8))
            gCurrentSprite.work1++;
    }
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 1) {
        u16 spawnY = gCurrentSprite.yPosition + BLOCK_SIZE;
        u16 spawnX = gCurrentSprite.xPosition + BLOCK_SIZE;
        SpriteSpawnSecondary(SSPRITE_TOXIC_GAS_EXPLOSION, gCurrentSprite.roomSlot,
            gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, spawnY, spawnX, 0);
        SoundPlay(SOUND_15A);
    }
}

void ToxicGas(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED)
        ToxicGasInit();
    ToxicGasIdle();
}

void ToxicGasExplosion(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    if (gCurrentSprite.pose == 0) {
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
        gCurrentSprite.bgPriority = 1;
        gCurrentSprite.drawOrder = 3;
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.pOam = sToxicGasExplosionOam;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.drawDistanceTop = 0x40;
        gCurrentSprite.drawDistanceBottom = 0x40;
        gCurrentSprite.drawDistanceHorizontal = 0x40;
        gCurrentSprite.hitboxTop = -0x80;
        gCurrentSprite.hitboxBottom = 0x80;
        gCurrentSprite.hitboxLeft = -0x80;
        gCurrentSprite.hitboxRight = 0x80;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.work1 = 16;
        gSpriteData[primary].status |= SS_IGNORE_PROJECTILES;
    } else {
        if (gCurrentSprite.work1 > 0)
            gCurrentSprite.work1--;
        else
            gCurrentSprite.ignoreSamusCollisionTimer = 1;
        if (SpriteUtilCheckEndCurrentSpriteAnim()) {
            gCurrentSprite.status = 0;
            gSpriteData[primary].status &= ~SS_IGNORE_PROJECTILES;
        }
    }
}
