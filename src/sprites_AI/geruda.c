#include "macros.h"
#include "globals.h"

#include "data/sprites/geruda.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

#define GERUDA_POSE_TURNING_AROUND_INIT 3
#define GERUDA_POSE_TURNING_AROUND 4
#define GERUDA_POSE_ATTACK_WARNING_INIT 0x29
#define GERUDA_POSE_ATTACK_WARNING 0x2a
#define GERUDA_POSE_ATTACKING 0x2c

#define SS_GERUDA_FACING_DOWN SS_SAMUS_COLLIDING

u8 GerudaYMovement(u16 movement) {
    if (gCurrentSprite.status & SS_GERUDA_FACING_DOWN) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.yPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.yPosition -= movement;
    }
    return FALSE;
}

u8 GerudaXMovement(u16 movement) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition + BLOCK_SIZE);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + HALF_BLOCK_SIZE, gCurrentSprite.xPosition + BLOCK_SIZE);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - HALF_BLOCK_SIZE, gCurrentSprite.xPosition - BLOCK_SIZE);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + HALF_BLOCK_SIZE, gCurrentSprite.xPosition - BLOCK_SIZE);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition -= movement;
    }
    return FALSE;
}

void GerudaSetIdleSideHitboxes(void) {
    gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(0x10);
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(8);
        gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(0xc);
    } else {
        gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(0xc);
        gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(8);
    }
}

void GerudaSetAttackingSideHitboxes(void) {
    gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(8);
    gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(0xa);
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(8);
        gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(0x14);
    } else {
        gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(0x14);
        gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(8);
    }
}

void GerudaUpdateLungingAnimation(void) {
    if ((u8)SpriteUtilCheckSamusNearSpriteLeftRight(PIXEL_TO_SUB_PIXEL(0x38), PIXEL_TO_SUB_PIXEL(0x30)) != NSLR_OUT_OF_RANGE) {
        // Samus is near, set swiping animation
        if (gCurrentSprite.pOam != sGerudaOam_Swiping) {
            gCurrentSprite.pOam = sGerudaOam_Swiping;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        } else {
            // Play swiping sound on a specific frame
            if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 4)
                SoundPlayNotAlreadyPlaying(0x18c);
        }
    } else if (gCurrentSprite.pOam == sGerudaOam_Swiping) {
        // Samus is not near
        // Play swiping sound on a specific frame
        if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 4)
            SoundPlayNotAlreadyPlaying(0x18c);
        // Wait for swiping animation to end and set lunging animation
        if (SpriteUtilCheckEndCurrentSpriteAnim()) {
            gCurrentSprite.pOam = sGerudaOam_Lunging;
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
    gCurrentSprite.pOam = sGerudaOam_Idle;
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
    gCurrentSprite.pOam = sGerudaOam_Idle;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;
}

void GerudaIdle(void) {
    u8 offset;
    s16 movement;
    u8 nslr;
    u16 target;
    u16 tmp;
    u16 distance;

    if (gCurrentSprite.status & SS_HIDDEN) return;

    // Touch floor check
    if (gCurrentSprite.work4 < ARRAY_SIZE(sGerudaIdleDownwardsMovement)) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck != COLLISION_AIR) gCurrentSprite.work4 = ARRAY_SIZE(sGerudaIdleDownwardsMovement); // first entry of sGerudaIdleUpwardsMovement
    }

    // Move Y
    offset = gCurrentSprite.work4;
    movement = sGerudaIdleDownwardsMovement[offset]; // overflows to sGerudaIdleUpwardsMovement
    if (movement == SHORT_MAX) {
        movement = sGerudaIdleDownwardsMovement[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    // Move X, turn around if hit wall
    if (GerudaXMovement(PIXEL_TO_SUB_PIXEL(0.25f))) {
        gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND_INIT;
        return;
    }

    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_TO_SUB_PIXEL(6), BLOCK_TO_SUB_PIXEL(6));
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (nslr != NSLR_RIGHT) nslr = NSLR_OUT_OF_RANGE;
    } else {
        if (nslr != NSLR_LEFT) nslr = NSLR_OUT_OF_RANGE;
    }

    if (nslr != NSLR_OUT_OF_RANGE) {
        // Geruda sees Samus
        gCurrentSprite.status &= ~SS_GERUDA_FACING_DOWN;
        target = gSamusData.yPosition - PIXEL_TO_SUB_PIXEL(0x12);
        tmp = gCurrentSprite.yPosition;
        if (target > tmp + PIXEL_TO_SUB_PIXEL(0x19)) {
            // Samus is below the geruda, it can't see through the floor
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND_INIT;
                return;
            }
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + (BLOCK_SIZE + HALF_BLOCK_SIZE), gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND_INIT;
                return;
            }
            gCurrentSprite.work2 = 0;
            gCurrentSprite.status |= SS_GERUDA_FACING_DOWN;
        } else if (target < tmp - PIXEL_TO_SUB_PIXEL(0x19)) {
            // Samus is above the geruda, it can't see through the ceiling
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND_INIT;
                return;
            }
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE), gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND_INIT;
                return;
            }
            gCurrentSprite.work2 = 1;
        } else {
            // Samus is in the same level as the geruda
            gCurrentSprite.work2 = 2;
        }
        gCurrentSprite.xParasiteTimer = tmp;
        gCurrentSprite.unk_8 = target;

        // Distance between Samus and geruda
        target = gSamusData.xPosition;
        tmp = gCurrentSprite.xPosition;
        if (tmp > target) tmp = tmp - target;
        else tmp = target - tmp;

        // Set lunging speed when lunging diagonally depending on how far Samus is
        if (tmp > PIXEL_TO_SUB_PIXEL(0x4b)) gCurrentSprite.work3 = PIXEL_TO_SUB_PIXEL(2);
        else if (tmp > PIXEL_TO_SUB_PIXEL(0x28)) gCurrentSprite.work3 = PIXEL_TO_SUB_PIXEL(1.5f);
        else gCurrentSprite.work3 = PIXEL_TO_SUB_PIXEL(1);

        gCurrentSprite.pose = GERUDA_POSE_ATTACK_WARNING_INIT;
    } else {
        // Geruda doesn't see Samus
        if (gCurrentSprite.work4 > 61) gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND_INIT;
    }
}

void GerudaTurningAroundInit(void) {
    gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sGerudaOam_TurningAround;
}

void GerudaTurningAround(void) {
    // BUG: hitbox isn't updated after turning around
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        gCurrentSprite.status ^= SS_X_FLIP;
    }
}

void GerudaAttackWarningInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sGerudaOam_AttackWarning;
    gCurrentSprite.pose = GERUDA_POSE_ATTACK_WARNING;
    GerudaSetAttackingSideHitboxes();
}

void GerudaAttackWarning(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sGerudaOam_Lunging;
        gCurrentSprite.pose = GERUDA_POSE_ATTACKING;
        gCurrentSprite.work1 = 3 * 60;
    }
}

void GerudaAttacking(void) {
    u8 stopAttack;

    GerudaUpdateLungingAnimation();
    stopAttack = FALSE;
    if (gCurrentSprite.work2 == 0) {
        // Lunging diagonally downwards/upwards
        if (GerudaXMovement(gCurrentSprite.work3)) stopAttack++; // Stop lunging if hit wall
        if (gCurrentSprite.status & SS_GERUDA_FACING_DOWN) {
            // Lunge upwards if Samus is above
            if (gCurrentSprite.yPosition >= gCurrentSprite.unk_8)
                gCurrentSprite.status &= ~SS_GERUDA_FACING_DOWN;
        } else {
            // Stop lunging if it's above where it started lunging
            if (gCurrentSprite.yPosition <= gCurrentSprite.xParasiteTimer) stopAttack++;
        }
        if (GerudaYMovement(PIXEL_TO_SUB_PIXEL(1))) stopAttack++;
    } else if (gCurrentSprite.work2 == 1) {
        // Lunging diagonally upwards
        if (GerudaXMovement(gCurrentSprite.work3)) stopAttack++; // Stop lunging if hit wall
        if (gCurrentSprite.yPosition <= gCurrentSprite.unk_8) stopAttack++; // Stop lunging if above Samus
        if (GerudaYMovement(PIXEL_TO_SUB_PIXEL(1))) stopAttack++; // Stop lunging if hit ceiling
    } else {
        // Lunging straight
        if (GerudaXMovement(PIXEL_TO_SUB_PIXEL(2))) stopAttack++;
    }
    // Stop lunging after 3 seconds of lunging
    if (--gCurrentSprite.work1 == 0) stopAttack++;
    if (stopAttack) {
        // Turn if facing away from Samus
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (gCurrentSprite.xPosition > gSamusData.xPosition)
                gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND_INIT;
            else
                gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        } else {
            if (gCurrentSprite.xPosition < gSamusData.xPosition)
                gCurrentSprite.pose = GERUDA_POSE_TURNING_AROUND_INIT;
            else
                gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
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
        case GERUDA_POSE_TURNING_AROUND_INIT:
            GerudaTurningAroundInit();
        case GERUDA_POSE_TURNING_AROUND:
            GerudaTurningAround();
            break;
        case GERUDA_POSE_ATTACK_WARNING_INIT:
            GerudaAttackWarningInit();
        case GERUDA_POSE_ATTACK_WARNING:
            GerudaAttackWarning();
            break;
        case GERUDA_POSE_ATTACKING:
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
