#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/kihunter.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

enum KihunterGroundDetection {
    KIHUNTER_GROUND_OUT_OF_RANGE,
    KIHUNTER_GROUND_SAMUS_IN_FRONT,
    KIHUNTER_GROUND_SAMUS_BEHIND
};

u8 KihunterGroundCheckInSpittingrange(void) {
    u8 inRange = FALSE;

    if (gCurrentSprite.status & SS_HIDDEN) return FALSE;

    if (gCurrentSprite.status & SS_ON_SCREEN && gCurrentSprite.health > 0) {
        u32 nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0x78, 0x168);
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (nslr == NSLR_RIGHT) inRange = TRUE;
        } else {
            if (nslr == NSLR_LEFT) inRange = TRUE;
        }
    }

    return inRange;
}

u8 KihunterGroundDetectSamus(void) {
    u8 result = KIHUNTER_GROUND_OUT_OF_RANGE;
    u16 yRange, xRange;

    if (gCurrentSprite.status & SS_HIDDEN) return FALSE;

    yRange = 0xf0;
    xRange = 0x1f4;
    if (gCurrentSprite.status & SS_FACING_DOWN) {
        xRange = 0x2bc;
        yRange = 0x1b8;
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    }

    if (gCurrentSprite.health > 0) {
        u32 nslr = SpriteUtilCheckSamusNearSpriteLeftRight(yRange, xRange);
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (nslr == NSLR_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition + 0x48);
                if (gPreviousCollisionCheck != COLLISION_SOLID)
                    result = KIHUNTER_GROUND_SAMUS_IN_FRONT;
            } else if (nslr == NSLR_LEFT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition - 0x48);
                if (gPreviousCollisionCheck != COLLISION_SOLID)
                    result = KIHUNTER_GROUND_SAMUS_BEHIND;
            }
        } else {
            if (nslr == NSLR_LEFT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition - 0x48);
                if (gPreviousCollisionCheck != COLLISION_SOLID)
                    result = KIHUNTER_GROUND_SAMUS_IN_FRONT;
            } else if (nslr == NSLR_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition + 0x48);
                if (gPreviousCollisionCheck != COLLISION_SOLID)
                    result = KIHUNTER_GROUND_SAMUS_BEHIND;
            }
        }
    }

    return result;
}

void KihunterTurningIntoX(void) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.spritesetSlotAndProperties,
            gCurrentSprite.yPosition - 0x1c, gCurrentSprite.xPosition - 0x18, SS_X_FLIP);
        gCurrentSprite.yPosition -= 0x40;
        gCurrentSprite.xPosition += 0x18;
    } else {
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.spritesetSlotAndProperties,
            gCurrentSprite.yPosition - 0x1c, gCurrentSprite.xPosition + 0x18, SS_X_FLIP);
        gCurrentSprite.yPosition -= 0x40;
        gCurrentSprite.xPosition -= 0x18;
    }
}

void KihunterGroundInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.work2 = 0;
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -0x60;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x28;
    gCurrentSprite.hitboxRight = 0x28;
    gCurrentSprite.pOam = sKihunterOam_33e5b4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.health == 0)
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    SpriteUtilMakeSpriteFaceSamusXFlip();
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}
