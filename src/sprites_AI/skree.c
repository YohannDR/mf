#include "sprites_AI/skree.h"
#include "macros.h"
#include "globals.h"

#include "data/sprite_data.h"
#include "data/sprites/skree.h"
#include "data/sprites/x_parasite.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"

#include "structs/samus.h"
#include "structs/sprite.h"
#include "structs/sprite_debris.h"

void SkreeInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if ((gCurrentSprite.properties & SP_CAN_ABSORB_X) && (!(gCurrentSprite.status & SS_HIDDEN))){
        gCurrentSprite.status = 0;
    } else {
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.work0 = 0;
        gCurrentSprite.drawDistanceTop = 0x18;
        gCurrentSprite.drawDistanceBottom = 4;
        gCurrentSprite.drawDistanceHorizontal = 8;
        gCurrentSprite.hitboxTop = -0x50;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -0x18;
        gCurrentSprite.hitboxRight = 0x18;
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
        if (gCurrentSprite.pose == 0x59) {
            gCurrentSprite.pOam = sFrameData_2f9220;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.pose = 0x5a;
            gCurrentSprite.xParasiteTimer = 0x2c;
        } else {
            gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
        }
    }
}

void SkreeIdleInit(void) {
    gCurrentSprite.pOam = sFrameData_2f9248;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
}

void SkreeDetectSamus(void) {
    if (!(gCurrentSprite.status & SS_HIDDEN) &&
        gSamusData.yPosition > gCurrentSprite.yPosition + 0xc8 &&
        gSamusData.xPosition > gCurrentSprite.xPosition - 0x96 &&
        gSamusData.xPosition < gCurrentSprite.xPosition + 0x96)
            gCurrentSprite.pose = 0x17;
}

void SkreeWarningInit(void) {
    gCurrentSprite.pose = 0x18;
}

void SkreeWarning(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 0x29;
}

void SkreeGoingDownInit(void) {
    gCurrentSprite.pOam = sFrameData_2f9260;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 0x2a;
    SoundPlay(0x1da);
}

void SkreeGoingDown(void) {
    u32 blockTop;
    u16 yPosition;
    u16 xPosition;
    u8 offset;
    s16 movement;
    
    if (gCurrentSprite.work1 != 0) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x64, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck) {
            gCurrentSprite.pose = 0x2b;
            return;
        }
        gCurrentSprite.yPosition += 6;
        yPosition = gCurrentSprite.yPosition;
        xPosition = gCurrentSprite.xPosition;
        if (gCurrentSprite.work1 == 1) {
            SpriteDebrisInit(0, 0x11, yPosition - 10, xPosition);
            SpriteDebrisInit(0, 0x12, yPosition - 16, xPosition + 12);
        } else if (gCurrentSprite.work1 == 2) {
            SpriteDebrisInit(0, 0x13, yPosition - 40, xPosition - 16);
            SpriteDebrisInit(0, 0x4, yPosition - 30, xPosition);
        } else if (gCurrentSprite.work1 == 4) {
            SpriteDebrisInit(0, 0x11, yPosition - 60, xPosition - 20);
            SpriteDebrisInit(0, 0x12, yPosition - 70, xPosition + 30);
        } else if (gCurrentSprite.work1 == 6) {
            SpriteDebrisInit(0, 0x13, yPosition - 92, xPosition + 20);
            SpriteDebrisInit(0, 0x4, yPosition - 100, xPosition - 30);
        }
        gCurrentSprite.work1++;
    } else {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition,gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck != 0) {
            gCurrentSprite.yPosition = blockTop;
            gCurrentSprite.work1 = 1;
            gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
            SoundPlay(0x1db);
            return;
        }
        offset = gCurrentSprite.work4;
        movement = sSkreeFallingVelocity[offset];
        if (movement == SHORT_MAX) {
            movement = sSkreeFallingVelocity[offset - 1];
            gCurrentSprite.yPosition += movement;
        } else {
            gCurrentSprite.work4++;
            gCurrentSprite.yPosition += movement;
        }
    }
}

void SkreeCrashingInit(void) {
    gCurrentSprite.pOam = sFrameData_2f92c8;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 60;
    gCurrentSprite.pose = 0x2c;
}

void SkreeCrashing(void) {
    if (gCurrentSprite.work1 != 0) {
        gCurrentSprite.work1--;
    } else {
        if (gCurrentSprite.unk_8 - 0xc0 < gSamusData.xPosition && gSamusData.xPosition < gCurrentSprite.unk_8 + 0xc0) {
            gCurrentSprite.xPosition = gSamusData.xPosition;
            gCurrentSprite.pose = 0x2d;
        }
    }
}

void SkreeGoingUpWarningInit(void) {
    gCurrentSprite.pOam = sFrameData_2f92c8;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 31;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.pose = 0x2e;
}

void SkreeGoingUpWarning(void) {
    u16 yPosition;
    u16 xPosition;
    
    if (gCurrentSprite.work2 == 0) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x70,gCurrentSprite.xPosition);
        if ((gPreviousCollisionCheck & 0xf0) != 0) {
            gCurrentSprite.yPosition -= 4;
            return;
        }
        gCurrentSprite.work2++;
        SoundPlay(0x1db);
    }
    yPosition = gCurrentSprite.yPosition - 32;
    xPosition = gCurrentSprite.xPosition;
    if (gCurrentSprite.work1 != 0) {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 30) {
            SpriteDebrisInit(0, 0x11, yPosition - 96, xPosition);
            SpriteDebrisInit(0, 0x12, yPosition - 96, xPosition + 16);
        } else if (gCurrentSprite.work1 == 20) {
            SpriteDebrisInit(0, 0x13, yPosition - 64, xPosition - 16);
            SpriteDebrisInit(0, 4, yPosition - 64, xPosition);
        } else if (gCurrentSprite.work1 == 14) {
            SpriteDebrisInit(0, 0x11, yPosition - 32, xPosition + 8);
            SpriteDebrisInit(0, 0x12, yPosition - 32, xPosition - 16);
        } else if (gCurrentSprite.work1 == 6) {
            SpriteDebrisInit(0, 0x13, yPosition, xPosition - 8);
            SpriteDebrisInit(0, 4, yPosition, xPosition + 16);
        }
    } else {
        gCurrentSprite.yPosition--;
        if (gCurrentSprite.work2 == 1) {
            SpriteDebrisInit(0, 0x11, yPosition - 96, xPosition);
            SpriteDebrisInit(0, 0x12, yPosition - 96, xPosition + 16);
        } else if (gCurrentSprite.work2 == 8) {
            SpriteDebrisInit(0, 0x13, yPosition - 64, xPosition - 16);
            SpriteDebrisInit(0, 4, yPosition - 64, xPosition);
        } else if (gCurrentSprite.work2 == 16) {
            SpriteDebrisInit(0, 0x11, yPosition - 32, xPosition + 8);
            SpriteDebrisInit(0, 0x12, yPosition - 32, xPosition - 16);
        } else if (gCurrentSprite.work2 == 24) {
            SpriteDebrisInit(0, 0x13, yPosition, xPosition - 8);
            SpriteDebrisInit(0, 4, yPosition, xPosition + 16);
        } else if (gCurrentSprite.work2 > 30) {
            gCurrentSprite.yPosition--;
        }
        gCurrentSprite.work2++;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition,gCurrentSprite.xPosition);
        if (!gPreviousCollisionCheck) {
            gCurrentSprite.pose = 0x2f;
        }
    }
}

void SkreeGoingUpInit(void) {
    gCurrentSprite.pose = 0x30;
    SoundPlay(0x1da);
}

void SkreeGoingUp(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x80,gCurrentSprite.xPosition);
    if (!gPreviousCollisionCheck && gCurrentSprite.xParasiteTimer < gCurrentSprite.yPosition) {
        gCurrentSprite.yPosition -= 0x10;
        return;
    }
    gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer;
    gCurrentSprite.pose = 1;
}

void Skree(void) {
    if (gCurrentSprite.freezeTimer != 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            SkreeInit();
        case 1:
            SkreeIdleInit();
        case 2:
            SkreeDetectSamus();
            break;
        case 0x17:
            SkreeWarningInit();
        case 0x18:
            SkreeWarning();
            break;
        case 0x29:
            SkreeGoingDownInit();
        case 0x2a:
            SkreeGoingDown();
            break;
        case 0x2b:
            SkreeCrashingInit();
        case 0x2c:
            SkreeCrashing();
            break;
        case 0x2d:
            SkreeGoingUpWarningInit();
        case 0x2e:
            SkreeGoingUpWarning();
            break;
        case 0x2f:
            SkreeGoingUpInit();
        case 0x30:
            SkreeGoingUp();
            break;
        case 0x57:
            SpriteDyingInit();
        case 0x58:
            SpriteDying();
            break;
        case 0x59:
            SkreeInit();
        case 0x5a:
            SpriteSpawningFromX();
            break;
        case 0x5b:
            XParasiteInit();
            gCurrentSprite.yPosition -= 0x20;
    }
}
