#include "globals.h"

#include "data/sprites/beam_core_x.h"
#include "data/sprites/scientist.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

void ScientistInit(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gEquipment.beamStatus & BF_WIDE_BEAM) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.status &= ~SS_NOT_DRAWN; // Needed to do this because it's spawned from the boiler control pad
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x78;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x14;
    gCurrentSprite.hitboxRight = 0x14;
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sScientistOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ScientistIdle(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) >= 5) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.pOam = sScientistOam_TurningBody;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 60;
        SpriteUtilMakeSpriteFaceSamusXFlip();
    }
}

void ScientistTurning(void) {
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x45;
}

void ScientistTransformingInit(void) {
    gCurrentSprite.pose = 0x46;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES | SS_ENABLE_MOSAIC;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
}

void ScientistTransforming(void) {
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    --gCurrentSprite.xParasiteTimer;
    if (gCurrentSprite.xParasiteTimer < sizeof(sWideBeamCoreXGfx) / 512) {
        SpriteLoadGfx(PSPRITE_WIDE_BEAM_CORE_X, 0, gCurrentSprite.xParasiteTimer);
        if (gCurrentSprite.xParasiteTimer == 0) {
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
            gCurrentSprite.spriteId = PSPRITE_WIDE_BEAM_CORE_X;
            gCurrentSprite.status |= SS_NOT_DRAWN;
        }
    } else if (gCurrentSprite.xParasiteTimer == sizeof(sWideBeamCoreXGfx) / 512)
        SpriteLoadPal(PSPRITE_WIDE_BEAM_CORE_X, 0, ARRAY_SIZE(sWideBeamCoreXPal) / 16);
}

void Scientist(void) {
    gCurrentSprite.health = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            ScientistInit();
            break;
        case 2:
            ScientistIdle();
            break;
        case 0x18:
            ScientistTurning();
            break;
        case 0x45:
            ScientistTransformingInit();
        case 0x46:
            ScientistTransforming();
            break;
    }
}
