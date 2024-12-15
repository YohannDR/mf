#include "macros.h"
#include "globals.h"

#include "data/sprite_data.h"
#include "data/sprites/neo_ridley.h"
#include "data/sprites/ridley_pre_spawn.h"
#include "data/sprites/x_parasite.h"

#include "constants/audio.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/samus.h"
#include "structs/sprite.h"

void RidleyPreSpawnInit(void) {
    if (gEquipment.suitMiscStatus & SMF_SCREW_ATTACK) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.status |= SS_X_FLIP;
    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.drawDistanceTop = 0x58;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x38;
    gCurrentSprite.hitboxTop = -0x120;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x60;
    gCurrentSprite.hitboxRight = 0x60;
    gCurrentSprite.pOam = sRidleyPreSpawnOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pose = 1;
}

void RidleyPreSpawnWaitingForSamus(void) {
    if (SpriteUtilCheckSamusNearSpriteLeftRight(0x140, 0x140) == NSLR_RIGHT) {
        gCurrentSprite.pose = 2;
        gCurrentSprite.pOam = sRidleyPreSpawnOam_OpeningEye;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 160;
        SoundPlay(SOUND_1DC);
    }
}

void RidleyPreSpawnOpeningEye(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.pOam = sRidleyPreSpawnOam_ClosingEye;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

void RidleyPreSpawnClosingEye(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sRidleyPreSpawnOam_Idle;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 60;
    }
}

void RidleyPreSpawnEyeClosed(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        MusicPlay(MUSIC_NEO_RIDLEY_BATTLE, 7);
    }
}

void RidleyPreSpawnTurningIntoRidley(void) {
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    gCurrentSprite.xParasiteTimer--;

    // Load Neo-Ridley graphics, one chunk at a time
    if (gCurrentSprite.xParasiteTimer < sizeof(sRidleyGfx) / 512) {
        SpriteLoadGfx(PSPRITE_RIDLEY, 0, gCurrentSprite.xParasiteTimer);
        if (gCurrentSprite.xParasiteTimer == 0) {
            // Turn into Neo-Ridley
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
            gCurrentSprite.spriteId = PSPRITE_RIDLEY;
            gCurrentSprite.status |= (SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
        }
    } else if (gCurrentSprite.xParasiteTimer == sizeof(sRidleyGfx) / 512) {
        SpriteLoadPal(PSPRITE_RIDLEY, 0, ARRAY_SIZE(sRidleyPal) / 16);
    }
}

void RidleyPreSpawn(void) {
    switch(gCurrentSprite.pose) {
        case 0:
            RidleyPreSpawnInit();
            break;
        case 1:
            RidleyPreSpawnWaitingForSamus();
            break;
        case 2:
            RidleyPreSpawnOpeningEye();
            break;
        case 0x18:
            RidleyPreSpawnClosingEye();
            break;
        case 0x1a:
            RidleyPreSpawnEyeClosed();
            break;
        case 0x1c:
            RidleyPreSpawnTurningIntoRidley();
    }
}
