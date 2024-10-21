#include "macros.h"
#include "globals.h"

#include "data/sprites/geruda.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

u8 GerudaYMovement(u16 movement) {
    if (gCurrentSprite.status & SS_SAMUS_COLLIDING) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.yPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.yPosition -= movement;
    }
    return FALSE;
}

u8 GerudaXMovement(u16 movement) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition + 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition -= movement;
    }
    return FALSE;
}

void GerudaSetIdleSideHitboxes(void) {
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x40;
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x20;
        gCurrentSprite.hitboxRight = 0x30;
    } else {
        gCurrentSprite.hitboxLeft = -0x30;
        gCurrentSprite.hitboxRight = 0x20;
    }
}

void GerudaSetAttackingSideHitboxes(void) {
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x28;
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x20;
        gCurrentSprite.hitboxRight = 0x50;
    } else {
        gCurrentSprite.hitboxLeft = -0x50;
        gCurrentSprite.hitboxRight = 0x20;
    }
}

void GerudaUpdateLungingAnimation(void) {
    if ((u8)SpriteUtilCheckSamusNearSpriteLeftRight(0xe0, 0xc0) != NSLR_OUT_OF_RANGE) {
        if (gCurrentSprite.pOam != sGerudaOam_348c64) {
            gCurrentSprite.pOam = sGerudaOam_348c64;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        } else {
            if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 4)
                SoundPlayNotAlreadyPlaying(0x18c);
        }
    } else if (gCurrentSprite.pOam == sGerudaOam_348c64) {
        if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 4)
            SoundPlayNotAlreadyPlaying(0x18c);
        if (SpriteUtilCheckEndCurrentSpriteAnim()) {
            gCurrentSprite.pOam = sGerudaOam_348c54;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
}

void GerudaInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    SpriteUtilMakeSpriteFaceSamusXFlip();
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x20;
    GerudaSetIdleSideHitboxes();
    gCurrentSprite.pOam = sGerudaOam_348c1c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = 44;
    }
    else gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void GerudaIdleInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sGerudaOam_348c1c;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;
    return;
}

void GerudaIdle(void) {
    u8 offset;
    s16 movement;
    u8 nslr;
    u16 target;
    u16 tmp;
    u16 distance;

    if (gCurrentSprite.status & SS_HIDDEN) return;

    if (gCurrentSprite.work4 < 36) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck != COLLISION_AIR) gCurrentSprite.work4 = 36;
    }

    offset = gCurrentSprite.work4;
    movement = sGerudaIdleSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sGerudaIdleSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    if (GerudaXMovement(1)) {
        gCurrentSprite.pose = 3;
        return;
    }

    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0x180, 0x180);
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (nslr != NSLR_RIGHT) nslr = NSLR_OUT_OF_RANGE;
    } else {
        if (nslr != NSLR_LEFT) nslr = NSLR_OUT_OF_RANGE;
    }

    if (nslr != NSLR_OUT_OF_RANGE) {
        gCurrentSprite.status &= ~SS_SAMUS_COLLIDING;
        target = gSamusData.yPosition - 0x48;
        tmp = gCurrentSprite.yPosition;
        if (target > tmp + 0x64) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = 3;
                return;
            }
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x60, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = 3;
                return;
            }
            gCurrentSprite.work2 = 0;
            gCurrentSprite.status |= SS_SAMUS_COLLIDING;
        } else if (target < tmp - 0x64) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = 3;
                return;
            }
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = 3;
                return;
            }
            gCurrentSprite.work2 = 1;
        } else {
            gCurrentSprite.work2 = 2;
        }
        gCurrentSprite.xParasiteTimer = tmp;
        gCurrentSprite.unk_8 = target;

        target = gSamusData.xPosition;
        tmp = gCurrentSprite.xPosition;
        if (tmp > target) tmp = tmp - target;
        else tmp = target - tmp;

        if (tmp > 0x12c) gCurrentSprite.work3 = 8;
        else if (tmp > 0xa0) gCurrentSprite.work3 = 6;
        else gCurrentSprite.work3 = 4;

        gCurrentSprite.pose = 0x29;
    } else {
        if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = 3;
    }
}

void GerudaTurningAroundInit(void) {
    gCurrentSprite.pose = 4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sGerudaOam_348c94;
}

void GerudaTurningAround(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        gCurrentSprite.status ^= SS_X_FLIP;
    }
}

void GerudaAttackWarningInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sGerudaOam_348c44;
    gCurrentSprite.pose = 0x2a;
    GerudaSetAttackingSideHitboxes();
}

void GerudaAttackWarning(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sGerudaOam_348c54;
        gCurrentSprite.pose = 0x2c;
        gCurrentSprite.work1 = 3 * 60;
    }
}

void GerudaAttacking(void) {
    u8 stopAttack;

    GerudaUpdateLungingAnimation();
    stopAttack = FALSE;
    if (gCurrentSprite.work2 == 0) {
        if (GerudaXMovement(gCurrentSprite.work3)) stopAttack++;
        if (gCurrentSprite.status & SS_SAMUS_COLLIDING) {
            if (gCurrentSprite.yPosition >= gCurrentSprite.unk_8)
                gCurrentSprite.status &= ~SS_SAMUS_COLLIDING;
        }
        else {
            if (gCurrentSprite.yPosition <= gCurrentSprite.xParasiteTimer) stopAttack++;
        }
        if (GerudaYMovement(4)) stopAttack++;
    } else if (gCurrentSprite.work2 == 1) {
        if (GerudaXMovement(gCurrentSprite.work3)) stopAttack++;
        if (gCurrentSprite.yPosition <= gCurrentSprite.unk_8) stopAttack++;
        if (GerudaYMovement(4)) stopAttack++;
    } else {
        if (GerudaXMovement(8)) stopAttack++;
    }
    if (--gCurrentSprite.work1 == 0) stopAttack++;
    if (stopAttack) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (gCurrentSprite.xPosition > gSamusData.xPosition)
                gCurrentSprite.pose = 3;
            else
                gCurrentSprite.pose = 1;
        } else {
            if (gCurrentSprite.xPosition < gSamusData.xPosition)
                gCurrentSprite.pose = 3;
            else
                gCurrentSprite.pose = 1;
        }
        GerudaSetIdleSideHitboxes();
    }
}

void Geruda(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x18d);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            GerudaInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            GerudaIdleInit();
        case SPRITE_POSE_IDLE:
            GerudaIdle();
            break;
        case 3:
            GerudaTurningAroundInit();
        case 4:
            GerudaTurningAround();
            break;
        case 0x29:
            GerudaAttackWarningInit();
        case 0x2a:
            GerudaAttackWarning();
            break;
        case 0x2c:
            GerudaAttacking();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            GerudaInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
    }
}
