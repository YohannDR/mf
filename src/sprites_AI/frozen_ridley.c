#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/core_x.h"
#include "data/sprites/frozen_ridley.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/event.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void FrozenRidleySetCollision(u32 caa) {
    u16 y = gCurrentSprite.yPosition;
    u16 x = gCurrentSprite.xPosition;
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y + HALF_BLOCK_SIZE, x);
}

void FrozenRidleyInit(void) {
    u8 state;

    gCurrentSprite.bgPriority = 3;
    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.properties |= SP_SOLID_FOR_PROJECTILES;
    gCurrentSprite.drawDistanceTop = 0x58;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x48;
    gCurrentSprite.hitboxTop = -0x168;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -0x60;
    gCurrentSprite.hitboxRight = 0x60;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    state = EventCheckOn_PowerOutage();
    if (state == POWER_OUTAGE_DURING) {
        gCurrentSprite.health = 1;
        gCurrentSprite.pOam = sFrozenRidleyCorpseOam_3a123c;
        gCurrentSprite.pose = 1;
        gCurrentSprite.samusCollision = SSC_SOLID;
        FrozenRidleySetCollision(CAA_MAKE_SOLID);
    } else if (state == POWER_OUTAGE_AFTER) {
        gCurrentSprite.pOam = sFrozenRidleyCorpseOam_3a12f4;
        gCurrentSprite.pose = 8;
        gCurrentSprite.samusCollision = SSC_NONE;
    } else {
        gCurrentSprite.health = 1;
        gCurrentSprite.pOam = sFrozenRidleyCorpseOam_3a123c;
        gCurrentSprite.pose = 8;
        gCurrentSprite.samusCollision = SSC_SOLID;
        FrozenRidleySetCollision(CAA_MAKE_SOLID);
    }
}

void FrozenRidleyWaitForSamus(void) {
    if (SpriteUtilCheckSamusNearSpriteLeftRight(0x140, 0x140) == NSLR_LEFT) {
        gCurrentSprite.pose = 2;
        gCurrentSprite.pOam = sFrozenRidleyCorpseOam_3a124c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 160;
        SoundPlay(SOUND_234);
    }
}

void FrozenRidleySpawningX(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.pOam = sFrozenRidleyCorpseOam_3a1284;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        SpriteSpawnSecondary(SSPRITE_FROZEN_RIDLEY_X, 0, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0xa0, gCurrentSprite.xPosition - 0x20, 0);
    }
}

void FrozenRidleyClosingEye(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sFrozenRidleyCorpseOam_3a123c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 60;
    }
}

void FrozenRidleyXSpawning(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.pOam = sFrozenRidleyCorpseOam_3a12a4;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.health = 0;
        SoundPlay(SOUND_235);
    }
}

void FrozenRidleyCrumbling(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 8;
        gCurrentSprite.pOam = sFrozenRidleyCorpseOam_3a12f4;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        FrozenRidleySetCollision(CAA_REMOVE_SOLID);
    } else if (gCurrentSprite.currentAnimationFrame == 4 && gCurrentSprite.animationDurationCounter == 1)
        ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_OUTWARD_ICE_EXPLOSION);
}

void FrozenRidleyXInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sCoreXAbilityOam_Idle;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.pose = 2;
    SoundPlay(SOUND_236);
}

void FrozenRidleyXRidleySpawning(void) {
    if (MOD_AND(gCurrentSprite.work1, 2) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.work2 = 0x1e;
        gCurrentSprite.work3 = 0;
        gCurrentSprite.work4 = 0;
    }
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
}

void FrozenRidleyXFlyingAway(void) {
    u8 offset;
    s16 movement;

    if (MOD_AND(gCurrentSprite.work1, 2) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    gCurrentSprite.work1--;
    if (gCurrentSprite.work2 > 0)
        gCurrentSprite.work2--;
    else {
        gCurrentSprite.xPosition += ++gCurrentSprite.work3 / 4;
        offset = gCurrentSprite.work4;
        movement = sFrozenRidleyXFlyingAwayYMovement[offset];
        if (movement == SHORT_MAX) {
            movement = sFrozenRidleyXFlyingAwayYMovement[gCurrentSprite.work4 - 1];
            gCurrentSprite.yPosition += movement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += movement;
        }
    }
}

void FrozenRidley(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            FrozenRidleyInit();
            break;
        case 1:
            FrozenRidleyWaitForSamus();
            break;
        case 2:
            FrozenRidleySpawningX();
            break;
        case 0x18:
            FrozenRidleyClosingEye();
            break;
        case 0x1a:
            FrozenRidleyXSpawning();
            break;
        case 0x1c:
            FrozenRidleyCrumbling();
    }
}

void FrozenRidleyX(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            FrozenRidleyXInit();
            break;
        case 2:
            FrozenRidleyXRidleySpawning();
            break;
        case 0x18:
            FrozenRidleyXFlyingAway();
    }
}
