#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/electric_water.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void ElectricWaterDamageInit(void) {
    gCurrentSprite.status |= SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x30;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x80;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.pOam = sElectricWaterDamageOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ElectricWaterDamageIdle(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gSamusUnderwaterFlag) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.work1 = 0;
    }
}

void ElectricWaterDamageDamagingSamus(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.yPosition = gSamusData.yPosition;
    gCurrentSprite.xPosition = gSamusData.xPosition;
    if (MOD_AND(gCurrentSprite.work1, 32) == 0)
        gCurrentSprite.samusCollision = SSC_YAMEBA;
    else
        gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.work1++;
    if (!gSamusUnderwaterFlag) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sElectricWaterDamageOam_Stopping;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = 0;
    }
}

void ElectricWaterDamageStopping(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.yPosition = gSamusData.yPosition;
    gCurrentSprite.xPosition = gSamusData.xPosition;
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.status |= SS_NOT_DRAWN;
        gCurrentSprite.pOam = sElectricWaterDamageOam_Idle;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = 0;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
    }
}

void ElectricWireInit(void) {
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 0x30;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -0x30;
    gCurrentSprite.hitboxBottom = 0x60;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sElectricWireOam;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x80);
    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
        gCurrentSprite.status |= SS_X_FLIP;
        gCurrentSprite.hitboxLeft = -0x30;
        gCurrentSprite.hitboxRight = 0x20;
    } else {
        gCurrentSprite.hitboxLeft = -0x20;
        gCurrentSprite.hitboxRight = 0x30;
    }
    if (EventCheckAfter_WaterLowered()) {
        SoundPlay(SOUND_ELECTRIC_WIRE);
        gCurrentSprite.pose = 0x18;
    } else
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

void ElectricWireIdle(void) {
    if (gWaterLowered && gCurrentSprite.currentAnimationFrame == 0) {
        SoundPlay(SOUND_ELECTRIC_WIRE);
        gCurrentSprite.pose = 0x18;
    }
}

void ElectricWaterInit(void) {
    gCurrentSprite.xPosition += HALF_BLOCK_SIZE;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x80;
    gCurrentSprite.hitboxTop = -0x40;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x1e0;
    gCurrentSprite.hitboxRight = 0x1e0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sElectricWaterOam;
    SoundPlay(SOUND_ELECTRIC_WATER);
}

void ElectricWaterIdle(void) {
    gCurrentSprite.yPosition = gEffectYPosition + HALF_BLOCK_SIZE;
}

void ElectricWaterDamage(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ElectricWaterDamageInit();
            break;
        case SPRITE_POSE_IDLE:
            ElectricWaterDamageIdle();
            break;
        case 0x18:
            ElectricWaterDamageDamagingSamus();
            break;
        case 0x1a:
            ElectricWaterDamageStopping();
    }
    if (gWaterLowered)
        gCurrentSprite.status = 0;
}

void ElectricWire(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ElectricWireInit();
            break;
        case SPRITE_POSE_IDLE:
            ElectricWireIdle();
    }
}

void ElectricWater(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ElectricWaterInit();
        case SPRITE_POSE_IDLE:
            ElectricWaterIdle();
    }
    if (gWaterLowered)
        gCurrentSprite.status = 0;
}
