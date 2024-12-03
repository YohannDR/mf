#include "macros.h"
#include "globals.h"

#include "data/sprites/zebesian_wall.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/event.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void ZebesianWallSetSideHitboxs(void) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x50;
        gCurrentSprite.hitboxRight = 4;
    } else {
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 0x50;
    }
}

void unk_2b690(void) {
    switch (gSpriteRandomNumber) {
        case 0:
        case 1:
        case 2:
        case 3:
            gCurrentSprite.status &= ~SS_FACING_RIGHT;
            gCurrentSprite.pose = 1;
            break;
        case 4:
        case 5:
        case 6:
        case 7:
            gCurrentSprite.status |= SS_FACING_RIGHT;
            gCurrentSprite.pose = 1;
            break;
        case 8:
        case 9:
            gCurrentSprite.pose = 0x19;
            break;
        case 10:
        case 11:
        case 12:
            gCurrentSprite.pose = 0x29;
            break;
        default:
            gCurrentSprite.pose = 7;
    }
}

void ZebesianWallInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 0x28;
    gCurrentSprite.drawDistanceHorizontal = 0x20;
    gCurrentSprite.pOam = sZebesianWallOam_3236e0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.pose == 0x59) {
        gCurrentSprite.pose = 0x5a;
        gCurrentSprite.unk_8 = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        gCurrentSprite.bgPriority = 1;
        gCurrentSprite.pose = 2;
        gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition,gCurrentSprite.xPosition + BLOCK_SIZE);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.status |= SS_X_FLIP;
            gCurrentSprite.xPosition += 0x20;
        } else {
            gCurrentSprite.xPosition -= 0x20;
        }
        SpriteUtilChooseRandomXDirection();
    }
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        if (!(gCurrentSprite.status & SS_HIDDEN)) {
            gCurrentSprite.status = 0;
            return;
        }
        gCurrentSprite.numberOfXToForm = 2;
        gCurrentSprite.hitboxTop = -0x70;
    } else {
        gCurrentSprite.hitboxTop = -0x60;
    }
    gCurrentSprite.hitboxBottom = 0x50;
    ZebesianWallSetSideHitboxs();
}

void ZebesianWallFormingFromX(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.unk_8 > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.unk_8];
    } else {
        gCurrentSprite.pose = 2;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
    }
}

void ZebesianWallDeath(void) {
    gCurrentSprite.yPosition += 8;
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition -= 0x28;
    else
        gCurrentSprite.xPosition += 0x28;
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition, SS_X_FLIP);
}

void ZebesianWallMovingVerticallyInit(void) {
    gCurrentSprite.pOam = sZebesianWallOam_3236e0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 64;
    gCurrentSprite.pose = 2;
}

void ZebesianWallMoveVertically(void) {
    u32 action = FALSE;
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        if (gCurrentSprite.xParasiteTimer + 0x80 > gCurrentSprite.yPosition) {
            if (--gCurrentSprite.work1 > 0)
                gCurrentSprite.yPosition += 1;
            else
                action = TRUE;
        } else
            action = TRUE;
    } else {
        if (gCurrentSprite.xParasiteTimer - 0xc0 < gCurrentSprite.yPosition) {
            if (--gCurrentSprite.work1 > 0)
                gCurrentSprite.yPosition -= 1;
            else
                action = TRUE;
        } else
            action = TRUE;
    }
    if (gCurrentSprite.status & SS_HIDDEN) {
        if (action)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
    } else {
        if (action)
            unk_2b690();
    }
}

void ZebesianWallTurningAroundInit(void) {
    gCurrentSprite.pOam = sZebesianWallOam_3237d0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x1a;
}

void ZebesianWallTurningAround(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianWallOam_323850;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.work3 = 0;
        gCurrentSprite.work4 = 0;
        gCurrentSprite.status ^= SS_X_FLIP;
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition += 0x80;
        else
            gCurrentSprite.xPosition -= 0x80;
        ZebesianWallSetSideHitboxs();
        SoundPlayNotAlreadyPlaying(0x15b);
    }
}

void ZebesianWallJumping(void) {
    u8 offset = gCurrentSprite.work4;
    s16 yMovement = sZebesianWallJumpYVelocity[offset];
    s16 xMovement = sZebesianWallJumpXVelocity[offset];
    gCurrentSprite.yPosition += yMovement;
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition += xMovement;
    else
        gCurrentSprite.xPosition -= xMovement;
    offset++;
    gCurrentSprite.work4 = offset;
    if (sZebesianWallJumpYVelocity[offset] == SHORT_MAX)
        unk_2b690();
}

void ZebesianWallIdleInit(void) {
    gCurrentSprite.pOam = sZebesianWallOam_323728;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 8;
}

void ZebesianWallIdle(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        unk_2b690();
}

void ZebesianWallShootingInit(void) {
    gCurrentSprite.pOam = sZebesianWallOam_323890;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2a;
}

void ZebesianWallShooting(void) {
    if (gCurrentSprite.currentAnimationFrame == 0x13 && gCurrentSprite.animationDurationCounter == 1) {
        if (gCurrentSprite.status & SS_X_FLIP)
            SpriteSpawnSecondary(SSPRITE_ZEBESIAN_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x88, SS_X_FLIP);
        else
            SpriteSpawnSecondary(SSPRITE_ZEBESIAN_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x88, 0);
    }
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        unk_2b690();
}

void ZebesianBeamInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x30;
    gCurrentSprite.hitboxTop = -8;
    gCurrentSprite.hitboxBottom = 8;
    gCurrentSprite.pOam = sZebesianWallOam_323998;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = 2;
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.bgPriority = 1;
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x30;
        gCurrentSprite.hitboxRight = -0x10;
    } else {
        gCurrentSprite.hitboxLeft = 0x10;
        gCurrentSprite.hitboxRight = 0x30;
    }
    SoundPlayNotAlreadyPlaying(0x15d);
}

void ZebesianBeamSpawning(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianWallOam_3239c0;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = -0x20;
        } else {
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0x60;
        }
    }
}

void ZebesianBeamExtending(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianWallOam_323968;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxLeft = -0xa0;
            gCurrentSprite.hitboxRight = -0x20;
        } else {
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0xa0;
        }
    }
}

void ZebesianWall(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x15e);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            ZebesianWallInit();
            break;
        case 1:
            ZebesianWallMovingVerticallyInit();
        case 2:
            ZebesianWallMoveVertically();
            break;
        case 0x19:
            ZebesianWallTurningAroundInit();
        case 0x1a:
            ZebesianWallTurningAround();
            break;
        case 0x1c:
            ZebesianWallJumping();
            break;
        case 7:
            ZebesianWallIdleInit();
        case 8:
            ZebesianWallIdle();
            break;
        case 0x29:
            ZebesianWallShootingInit();
        case 0x2a:
            ZebesianWallShooting();
            break;
        case 0x57:
            SpriteDyingInit();
        case 0x58:
            SpriteDying();
            break;
        case 0x59:
            ZebesianWallInit();
        case 0x5a:
            ZebesianWallFormingFromX();
            break;
        case 0x5b:
            ZebesianWallDeath();
            XParasiteInit();
    }
}

void ZebesianBeam(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            ZebesianBeamInit();
            break;
        case 2:
            ZebesianBeamSpawning();
            break;
        case 0x18:
            ZebesianBeamExtending();
            break;
    }
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition -= 10;
    else
        gCurrentSprite.xPosition += 10;
}
