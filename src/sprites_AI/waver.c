#include "macros.h"
#include "globals.h"

#include "data/sprites/waver.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

u8 WaverCheckSamusInRange(void) {
    u8 inRange = FALSE;
    if (gCurrentSprite.health > 0 && SpriteUtilCheckSamusNearSpriteFrontBehind(0x28, 0x190, 0x40) == NSFB_IN_FRONT)
        inRange = TRUE;
    return inRange;
}

void WaverSetFlyingGFX(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.status & SS_FACING_DOWN)
        gCurrentSprite.pOam = sFrameData_317590;
    else
        gCurrentSprite.pOam = sFrameData_317580;
}

void WaverInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        gCurrentSprite.pose = 2;
        if ((gSpriteRandomNumber & 1) != 0)
            gCurrentSprite.status |= SS_FACING_DOWN;
    }
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.frozenPaletteRowOffset = 1;
    gCurrentSprite.samusCollision = 2;
    gCurrentSprite.work4 = 6 * 8;
    WaverSetFlyingGFX();
    SpriteUtilChooseRandomXFlip();
}

void WaverFlyingInit(void) {
    gCurrentSprite.pose = 2;
    WaverSetFlyingGFX();
}

void WaverFlying(void) {
    u8 touchedFloorCeiling;
    u32 yBoundary;
    s16 movement;
    struct SpriteData *currentSprite;

    if (gCurrentSprite.status & SS_HIDDEN) return;

    touchedFloorCeiling = FALSE;
    currentSprite = &gCurrentSprite; // Needed to produce matching ASM.
    if (gCurrentSprite.status & SS_FACING_DOWN)
        yBoundary = gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom;
    else
        yBoundary = gCurrentSprite.yPosition + gCurrentSprite.hitboxTop;
    SpriteUtilCheckCollisionAtPosition(yBoundary, (*currentSprite).xPosition);
    if (gPreviousCollisionCheck == COLLISION_SOLID)
        touchedFloorCeiling = TRUE;

    if (WaverCheckSamusInRange()) {
        gCurrentSprite.pOam = sFrameData_3175d8;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x2a;
        gCurrentSprite.work3 = 0;
        gCurrentSprite.work1 = 20;
        SoundPlayNotAlreadyPlaying(0x1a6);
        return;
    }

    movement = sWaverFlyingSpeed[DIV_SHIFT(gCurrentSprite.work4, 8)];
    if (gCurrentSprite.status & SS_FACING_DOWN) {
        if (!touchedFloorCeiling)
            gCurrentSprite.yPosition += movement;
        if (gCurrentSprite.work4 >= ARRAY_SIZE(sWaverFlyingSpeed) * 8 - 1) {
            gCurrentSprite.work4 = 0;
            gCurrentSprite.status &= ~SS_FACING_DOWN;
        }
    } else {
        if (gCurrentSprite.pOam == sFrameData_317590 && SpriteUtilCheckEndCurrentSpriteAnim()) {
            gCurrentSprite.pOam = sFrameData_317580;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
        if (!touchedFloorCeiling)
            gCurrentSprite.yPosition -= movement;
        if (gCurrentSprite.work4 >= ARRAY_SIZE(sWaverFlyingSpeed) * 8 - 1) {
            gCurrentSprite.work4 = 0;
            gCurrentSprite.status |= SS_FACING_DOWN;
            gCurrentSprite.pOam = sFrameData_317590;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
    gCurrentSprite.work4++;

    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status &= ~SS_X_FLIP;
        else
            gCurrentSprite.xPosition += 4;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status |= SS_X_FLIP;
        else
            gCurrentSprite.xPosition -= 4;
    }
}

void WaverCharging(void) {
    u16 movement = DIV_SHIFT(gCurrentSprite.work3, 8) + 6;
    if (gCurrentSprite.work3 < 0x28)
        gCurrentSprite.work3 += 1;
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentSprite.pose = 0x2b;
            SpriteSpawnSecondary(SSPRITE_WAVER_DEBRIS, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (gCurrentSprite.status & SS_ON_SCREEN)
                SoundPlayNotAlreadyPlaying(0x1a7);
        } else {
            gCurrentSprite.xPosition += movement;
            goto notCollided; // Needed to produce matching ASM.
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentSprite.pose = 0x2b;
            SpriteSpawnSecondary(SSPRITE_WAVER_DEBRIS, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SS_X_FLIP);
            if (gCurrentSprite.status & SS_ON_SCREEN)
                SoundPlayNotAlreadyPlaying(0x1a7);
        } else {
            gCurrentSprite.xPosition -= movement;
            notCollided:
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.work1 = 20;
                if (gCurrentSprite.status & SS_ON_SCREEN)
                    SoundPlayNotAlreadyPlaying(0x1a6);
            }
        }
    }
}

void WaverCrashingInit(void) {
    gCurrentSprite.pose = 0x2c;
    gCurrentSprite.work1 = 60;
}

void WaverCrashing(void) {
    gCurrentSprite.animationDurationCounter--; // Freeze animation
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x2e;
        gCurrentSprite.work1 = 68;
    }
}

void WaverBackingOut(void) {
    gCurrentSprite.animationDurationCounter--; // Freeze animation
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x30;
        gCurrentSprite.pOam = sFrameData_3175c0;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    } else if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition -= 1;
    else
        gCurrentSprite.xPosition += 1;
}

void WaverCheckBackingOutAnimEnded(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x32;
        gCurrentSprite.pOam = sFrameData_3175c0;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.status ^= SS_X_FLIP;
    }
}

void WaverCheckTurningAnimNearEnded(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 1;
}

void WaverDebrisInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -0x28;
    gCurrentSprite.hitboxRight = 0x28;
    gCurrentSprite.pOam = sFrameData_317608;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 16;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawOrder = 3;
}

void WaverDebrisFalling(void) {
    u8 offset;
    s16 movement;

    if (gCurrentSprite.work1 == 0) {
        SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck != 0) {
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0x27);
            gCurrentSprite.status = 0;
            return;
        }
    } else {
        gCurrentSprite.work1--;
    }

    offset = gCurrentSprite.work4;
    movement = sWaverDebrisFallingSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sWaverDebrisFallingSpeed[offset - 1];
        gCurrentSprite.yPosition += movement;
    } else {
        offset++;
        gCurrentSprite.work4 = offset;
        gCurrentSprite.yPosition += movement;
    }

    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition += PIXEL_SIZE;
    else
        gCurrentSprite.xPosition -= PIXEL_SIZE;
}

void WaverDebrisExploding(void)
{
    ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0x25);
    gCurrentSprite.status = 0;
}

void Waver(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x1a8);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            WaverInit();
            break;
        case 1:
            WaverFlyingInit();
        case 2:
            WaverFlying();
            break;
        case 0x2a:
            WaverCharging();
            break;
        case 0x2b:
            WaverCrashingInit();
        case 0x2c:
            WaverCrashing();
            break;
        case 0x2e:
            WaverBackingOut();
            break;
        case 0x30:
            WaverCheckBackingOutAnimEnded();
            break;
        case 0x32:
            WaverCheckTurningAnimNearEnded();
            break;
        case 0x57:
            SpriteDyingInit();
        case 0x58:
            SpriteDying();
            break;
        case 0x59:
            WaverInit();
        case 0x5a:
            SpriteSpawningFromX();
            break;
        case 0x5b:
            XParasiteInit();
    }
}

void WaverExplosion(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            WaverDebrisInit();
        case 2:
            WaverDebrisFalling();
            break;
        default:
            WaverDebrisExploding();
    }
}
