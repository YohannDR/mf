#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/lava_plume.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void LavaPlumeInit(void) {
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.properties = gCurrentSprite.properties | 8;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 0x68;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = 0;
    gCurrentSprite.hitboxBottom = 0xa0;
    gCurrentSprite.hitboxLeft = -0x10;
    gCurrentSprite.hitboxRight = 0x10;
    gCurrentSprite.yPosition += 0x1c;
    gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
    gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
    gCurrentSprite.pose = 0x1a;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES | SS_NOT_DRAWN;
    gCurrentSprite.work2 = 120 + gSpriteRandomNumber * 4;
    gCurrentSprite.pOam = sLavaPlumeOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void LavaPlumeGoUpInit(void) {
    gCurrentSprite.pOam = sLavaPlumeOam_GoingUp;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 30;
    gCurrentSprite.pose = 2;
    SpriteSpawnSecondary(SSPRITE_LAVA_PLUME_WARNING, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x1c, gCurrentSprite.xPosition, 0);
}

void LavaPlumeGoUp(void) {
    if (gCurrentSprite.work1 > 0) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
            if (gCurrentSprite.status & SS_ON_SCREEN)
                SoundPlay(SOUND_LAVA_PLUME_GOING_UP);
        }
    } else {
        if (gCurrentSprite.xParasiteTimer - 0x40 > gCurrentSprite.yPosition) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                gCurrentSprite.pose = 0x17;
                return;
            }
        }
        gCurrentSprite.yPosition -= 0xe;
        if (SpriteUtilCheckEndCurrentSpriteAnim())
            gCurrentSprite.pose = 0x17;
    }
}

void LavaPlumeStopFromSamusContact(void) {
    SoundStop(SOUND_LAVA_PLUME_GOING_UP);
}

void LavaPlumeStopInit(void) {
    gCurrentSprite.pOam = sLavaPlumeOam_Stopping;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    if (gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlay(SOUND_LAVA_PLUME_STOPPING);
}

void LavaPlumeStop(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.status |= SS_NOT_DRAWN;
        gCurrentSprite.work2 = 120 + gSpriteRandomNumber * 4;
        gCurrentSprite.pOam = sLavaPlumeOam_Idle;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

void LavaPlumeIdle(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.work2 == 0) {
        gCurrentSprite.pose = 1;
        gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer;
        gCurrentSprite.xPosition = gCurrentSprite.unk_8;
    }
}

void LavaPlumeWarningInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.pOam = sLavaPlumeWarningOam_Idle0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void LavaPlumeWarningIdle(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x18) {
        gCurrentSprite.status = 0;
    } else if (MOD_AND(gFrameCounter8Bit, 16) == 0) {
        if (gSpriteRandomNumber >= 8) {
            if (gCurrentSprite.pOam != sLavaPlumeWarningOam_Idle1) {
                gCurrentSprite.pOam = sLavaPlumeWarningOam_Idle1;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            }
        } else {
            if (gCurrentSprite.pOam != sLavaPlumeWarningOam_Idle0) {
                gCurrentSprite.pOam = sLavaPlumeWarningOam_Idle0;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            }
        }
    }
}

void LavaPlume(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            LavaPlumeInit();
            break;
        case 1:
            LavaPlumeGoUpInit();
            break;
        case 2:
            LavaPlumeGoUp();
            break;
        case SPRITE_POSE_STOPPED:
            LavaPlumeStopFromSamusContact();
        case 0x17:
            LavaPlumeStopInit();
        case 0x18:
            LavaPlumeStop();
            break;
        case 0x1a:
            LavaPlumeIdle();
    }
}

void LavaPlumeWarning(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            LavaPlumeWarningInit();
        case SPRITE_POSE_IDLE:
            LavaPlumeWarningIdle();
    }
}
