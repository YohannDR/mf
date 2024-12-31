#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/beam_core_x.h"
#include "data/sprites/core_x.h"
#include "data/sprites/ice_beam_x_omega.h"
#include "data/sprites/sa_x.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/event.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

void IceBeamAbilitySpawningFromX(void) {
    gCurrentSprite.work1--;
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    if (gCurrentSprite.work1 < sizeof(sIceBeamAbilityOmegaGfx) / 512)
        SpriteLoadGfx(PSPRITE_ICE_BEAM_ABILITY, 0, gCurrentSprite.work1);
    else if (gCurrentSprite.work1 == sizeof(sIceBeamAbilityOmegaGfx) / 512)
        // Also loads garbage second palette row; it only has 1 valid palette row
        SpriteLoadPal(PSPRITE_ICE_BEAM_ABILITY, 0, sizeof(sIceBeamAbilityOmegaGfx) / 2048);
    if (gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x5c;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
}

void IceBeamAbilityInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x24;
    gCurrentSprite.hitboxBottom = 0x24;
    gCurrentSprite.hitboxLeft = -0x24;
    gCurrentSprite.hitboxRight = 0x24;
    gCurrentSprite.pOam = sIceBeamAbilityOmegaOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.yPosition -= 0x48;
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.work1 = 16;
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    } else {
        gCurrentSprite.pose = 1;
        gCurrentSprite.work1 = 100;
        gCurrentSprite.work4 = 0;
    }
}

void IceBeamAbilitySpawning(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 2;
        SoundPlay(SOUND_2AE);
    }
}

void IceBeamAbilityEntering(void) {
    u8 offset;
    s16 movement;
    u16 xPosOnScreen;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    offset = gCurrentSprite.work4;
    movement = sIceBeamAbilityFloatingYMovement[offset];
    if (movement == SHORT_MAX) {
        movement = sIceBeamAbilityFloatingYMovement[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    xPosOnScreen = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition);
    if (xPosOnScreen >= 0x3a && xPosOnScreen <= 0x3e) {
        gCurrentSprite.pose = 0x17;
        gCurrentSprite.work4 = 0;
        gCurrentSprite.work3 = 0;
        gCurrentSprite.work1 = 60;
    } else
        gCurrentSprite.xPosition += 6;
}

void IceBeamAbilityFloatingBeforeSaX(void) {
    u8 offset;
    s16 movement;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.work1 > 0) {
        offset = gCurrentSprite.work4;
        movement = sIceBeamAbilityOmegaFloatingBeforeSaXYMovement[offset];
        if (movement == SHORT_MAX) {
            movement = sIceBeamAbilityOmegaFloatingBeforeSaXYMovement[0];
            offset = 0;
        }
        offset++;
        gCurrentSprite.work4 = offset;
        gCurrentSprite.yPosition += movement;

        offset = gCurrentSprite.work3;
        movement = sIceBeamAbilityOmegaFloatingBeforeSaXXMovement[offset];
        if (movement == SHORT_MAX) {
            movement = sIceBeamAbilityOmegaFloatingBeforeSaXXMovement[0];
            offset = 0;
        }
        offset++;
        gCurrentSprite.work3 = offset;
        gCurrentSprite.xPosition += movement;
    } else {
        gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
        gCurrentSprite.pose = 0x18;
    }
}

void IceBeamAbilityTurningIntoSaX(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 < sizeof(sSaXWeaponsGfx) / 512)
        SpriteLoadGfx(PSPRITE_SA_X_OMEGA_CUTSCENE, 0, gCurrentSprite.work1);
    else if (gCurrentSprite.work1 == sizeof(sSaXWeaponsGfx) / 512)
        SpriteLoadPal(PSPRITE_SA_X_OMEGA_CUTSCENE, 0, ARRAY_SIZE(sSaXPalette_Default) / 16);
    if (gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
        gCurrentSprite.spriteId = PSPRITE_SA_X_OMEGA_CUTSCENE;
    }
}

void IceBeamAbilitySpawningFromSaXInit(void) {
    gCurrentSprite.pose = 0x5d;
    gCurrentSprite.samusCollision = SSC_CORE_X_ABILITY;
    gCurrentSprite.drawOrder = 4;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.paletteRow = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
}

void IceBeamAbilityGoingToTarget(void) {
    if (MOD_AND(gFrameCounter8Bit, 4) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteMoveWithSound(gAbilityRestingYPosition, gAbilityRestingXPosition, 0x10, 0x18, 2, SOUND_141);
    if (gCurrentSprite.yPosition < gAbilityRestingYPosition + 6 && gCurrentSprite.yPosition > gAbilityRestingYPosition - 6
        && gCurrentSprite.xPosition < gAbilityRestingXPosition + 6 && gCurrentSprite.xPosition > gAbilityRestingXPosition - 6) {
            gCurrentSprite.pose = 0x5e;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.work3 = 0;
            gCurrentSprite.work4 = 0;
            SAMUS_SET_POSE(SPOSE_CROUCHING);
            gPoseLock = 0;
    }
}

void IceBeamAbilityWaiting(void) {
    u8 offset;
    s16 movement;

    offset = gCurrentSprite.work4;
    movement = sCoreXIdleYSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sCoreXIdleYSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    offset = gCurrentSprite.work3;
    movement = sCoreXIdleXSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sCoreXIdleXSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;
    if (gCurrentSprite.status & SS_SAMUS_COLLIDING) {
        gPreventMovementTimer = 100;
        gCurrentSprite.properties |= 1;
        gCurrentSprite.pose = 0x5f;
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        gCurrentSprite.work2 = 0;
        gCurrentSprite.work3 = 1;
        gCurrentSprite.work1 = 0;
        gCurrentSprite.work4 = 1;
        gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
        gCurrentSprite.rotation = 0;
        gCurrentSprite.scaling = Q_8_8(1);
        gCurrentSprite.xParasiteTimer = 20;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sIceBeamAbilityOmegaOam_GettingAbsorbed;
        ParticleSet(gSamusData.yPosition + gSamusData.drawDistanceTop / 2, gSamusData.xPosition, PE_ABSORB_CORE_X);
        EventCheckAdvance(EVENT_ICE_BEAM_ABILITY_RECOVERED);
        SAMUS_SET_POSE(SPOSE_MID_AIR);
        gSamusEnvironmentalEffects[0].externalTimer = 48;
        SoundPlay(SOUND_92);
        MusicFade(0); // Stop music
    } else if (MOD_AND(gFrameCounter8Bit, 64) == 0)
        SoundPlay(SOUND_C3);
}

void IceBeamAbilityGettingAbsorbed(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    SpriteUtilHealSamusOfOneTank();
    XParasiteStickToSamus();
    if (gCurrentSprite.xParasiteTimer > 0) {
        gCurrentSprite.xParasiteTimer -= 1;
    } else if (gCurrentSprite.scaling > Q_8_8(0.3125f)) {
        gCurrentSprite.scaling -= Q_8_8(0.03125f);
    } else {
        ProjectileLoadBeamGraphics();
        gCurrentSprite.status = 0;
    }
}

void IceBeamAbility(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            IceBeamAbilityInit();
            break;
        case 1:
            IceBeamAbilitySpawning();
            break;
        case 2:
            IceBeamAbilityEntering();
            break;
        case 0x17:
            IceBeamAbilityFloatingBeforeSaX();
            break;
        case 0x18:
            IceBeamAbilityTurningIntoSaX();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            IceBeamAbilityInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            IceBeamAbilitySpawningFromX();
            break;
        case 0x5c:
            IceBeamAbilitySpawningFromSaXInit();
            break;
        case 0x5d:
            IceBeamAbilityGoingToTarget();
            break;
        case 0x5e:
            IceBeamAbilityWaiting();
            break;
        case 0x5f:
            IceBeamAbilityGettingAbsorbed();
    }
}
