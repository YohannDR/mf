#include "sprites_AI/zombie_researcher.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/zombie_researcher.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

void ZombieCheckSamusInRange(void) {
    u32 nslr;

    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0x5a, 0x82);
    if (nslr != 0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (nslr == NSLR_LEFT) {
                return;
            }
        } else if (nslr == NSLR_RIGHT) {
            return;
        }
        gCurrentSprite.pose = ZOMBIE_POSE_LUNGING_INIT;
        gCurrentSprite.pOam = sFrameData_2fb4c0;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.hitboxTop = -0x40;
        gCurrentSprite.hitboxLeft = -0x20;
        gCurrentSprite.hitboxRight = 0x20;
    }
}

void ZombieSetWaitingToForm(void) {
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pose = ZOMBIE_POSE_WAITING_TO_FORM;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x18;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.status = gCurrentSprite.status | SS_IGNORE_PROJECTILES;
}

void ZombieSetStandingHitbox(void) {
    gCurrentSprite.hitboxTop = -0x68;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x18;
    gCurrentSprite.hitboxRight = 0x18;
}

void ZombieDyingInit(void) {
    gCurrentSprite.pOam = sFrameData_2fb420;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.work1 = 0xb4;
    gCurrentSprite.pose = SPRITE_POSE_DYING;
    return;
}

void ZombieDying(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.work1 == 0x8c) {
        SpriteSpawnNewXParasite(0x38, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x20,
            gCurrentSprite.xPosition, 0);
    }
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pOam = sFrameData_2fb5d0;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
        ZombieSetWaitingToForm();
        gCurrentSprite.work5 = 1;
        gCurrentSprite.paletteRow = 0;
    }
}

void ZombieInit(void) {
    if (gCurrentSprite.pose == 0) {
        if ((u8)(gCurrentSprite.spritesetSlotAndProperties - 0x20) < 0x30) {
            gCurrentSprite.pOam = sFrameData_2fb300;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
            gCurrentSprite.pose = ZOMBIE_POSE_IDLE;
            ZombieSetStandingHitbox();
            gCurrentSprite.work1 = 0;
        } else {
            gCurrentSprite.pOam = sFrameData_2fb528;
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
            ZombieSetWaitingToForm();
        }
        SpriteUtilChooseRandomXFlip();
    } else {
        gCurrentSprite.pOam = sFrameData_2fb258;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = ZOMBIE_POSE_FORMING;
        gCurrentSprite.hitboxTop = -0x20;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -0x18;
        gCurrentSprite.hitboxRight = 0x18;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
    }
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
}

void ZombieWaitingToForm(void) {
    if (gCurrentSprite.pOam == sFrameData_2fb5d0) {
        if (SpriteUtilCheckEndCurrentSpriteAnim()) {
            gCurrentSprite.pOam = sFrameData_2fb528;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
        }
    } else {
        SpriteUtilAdjustYPosOnSlope();
        if (gPreviousVerticalCollisionCheck == 0) {
            // Falling
            gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        } else if (gPreviousVerticalCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                    // On ledge
                    gCurrentSprite.status &= ~SS_X_FLIP;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + 0x20);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                        // Hit wall
                        gCurrentSprite.status &= ~SS_X_FLIP;
                    } else if (gSpriteRandomNumber == 0 && (gFrameCounter16Bit & 1) != 0) {
                        gCurrentSprite.xPosition += 4;
                    }
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                    gCurrentSprite.status |= SS_X_FLIP;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition - 0x20);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                        gCurrentSprite.status |= SS_X_FLIP;
                    } else if (gSpriteRandomNumber == 0 && (gFrameCounter16Bit & 1) != 0) {
                        gCurrentSprite.xPosition -= 4;
                    }
                }
            }
        }
    }
}

void ZombieForming(void) {
    if (gCurrentSprite.currentAnimationFrame == 0x11 && gCurrentSprite.animationDurationCounter == 2) {
        gCurrentSprite.hitboxTop = -0x68;
    } else if (gCurrentSprite.currentAnimationFrame == 0xd && gCurrentSprite.animationDurationCounter == 2) {
        gCurrentSprite.hitboxTop = -0x40;
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    } else if (gCurrentSprite.currentAnimationFrame == 7 && gCurrentSprite.animationDurationCounter == 3) {
        SpriteUtilMakeSpriteFaceSamusXFlip();
        SoundPlayNotAlreadyPlaying(0x14d);
    }
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.hitboxLeft = -0x18;
        gCurrentSprite.hitboxRight = 0x18;
        gCurrentSprite.pose = ZOMBIE_POSE_IDLE_INIT;
    }
}

void ZombieIdleInit(void) {
    gCurrentSprite.pOam = sFrameData_2fb300;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = ZOMBIE_POSE_IDLE;
    ZombieSetStandingHitbox();
}

void ZombieIdle(void) {
    SpriteUtilAdjustYPosOnSlope();
    if (gPreviousVerticalCollisionCheck == 0) {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
    } else {
        if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
            gCurrentSprite.pose = ZOMBIE_POSE_MOVING_INIT;
        }
        ZombieCheckSamusInRange();
    }
}

void ZombieMovingInit(void) {
    gCurrentSprite.pOam = sFrameData_2fb328;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = ZOMBIE_POSE_MOVING;
}

void ZombieMoving(void) {
    // Check if falling
    SpriteUtilAdjustYPosOnSlope();
    if (gPreviousVerticalCollisionCheck == 0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        }
        if (gPreviousCollisionCheck == 0) {
            gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
            return;
        }
    } else if (gPreviousVerticalCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            // Check if on ledge
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
            if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                gCurrentSprite.pose = ZOMBIE_POSE_TURNING_INIT;
                return;
            }
            // Check if hit wall
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + 0x20);
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                gCurrentSprite.pose = ZOMBIE_POSE_TURNING_INIT;
                return;
            }
            gCurrentSprite.xPosition += 1;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
            if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                gCurrentSprite.pose = ZOMBIE_POSE_TURNING_INIT;
                return;
            }
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition - 0x20);
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                gCurrentSprite.pose = ZOMBIE_POSE_TURNING_INIT;
                return;
            }
            gCurrentSprite.xPosition -= 1;
        }
    }
    ZombieCheckSamusInRange();
}

void ZombieTurningInit(void) {
    gCurrentSprite.pOam = sFrameData_2fb410;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = ZOMBIE_POSE_TURNING;
}

void ZombieTurning(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = ZOMBIE_POSE_TURNING_END;
        gCurrentSprite.status ^= SS_X_FLIP;
    }
}

void ZombieTurningEnd(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = ZOMBIE_POSE_IDLE_INIT;
    }
}

void ZombieLungingInit(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sFrameData_2fb460;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = ZOMBIE_POSE_LUNGING;
        SoundPlayNotAlreadyPlaying(0x14f);
    }
}

void ZombieLunging(void) {
    s16 speed;

    // Check if falling
    SpriteUtilAdjustYPosOnSlope();
    if (gPreviousVerticalCollisionCheck == 0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        }
        if (gPreviousCollisionCheck == 0) {
            gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
            return;
        }
    } else {
        speed = sZombieLungingSpeed[gCurrentSprite.currentAnimationFrame];
        if (gPreviousVerticalCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                // Check if on ledge
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
                if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                    // Check if hit wall
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + 0x20);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)) {
                        gCurrentSprite.xPosition += speed;
                    }
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
                if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition - 0x20);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)) {
                        gCurrentSprite.xPosition -= speed;
                    }
                }
            }
        }
    }
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sFrameData_2fb488;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = ZOMBIE_POSE_CHECK_LUNGING_ANIM_ENDED;
    }
}

void ZombieCheckLungingAnimEnded(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = ZOMBIE_POSE_IDLE_INIT;
    }
}

void ZombieFallingInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.work4 = 0;
    if (!(gCurrentSprite.properties & SP_CAN_ABSORB_X)) {
        gCurrentSprite.pOam = sFrameData_2fb300;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        ZombieSetStandingHitbox();
    }
}

void ZombieFalling(void) {
    u32 blockTop;
    u8 offset;
    s16 movement;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
        // Touched the ground
        gCurrentSprite.yPosition = blockTop;
        if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
            gCurrentSprite.pose = ZOMBIE_POSE_WAITING_TO_FORM;
        } else {
            gCurrentSprite.pose = ZOMBIE_POSE_IDLE_INIT;
        }
    } else {
        // Falling
        offset = gCurrentSprite.work4;
        movement = sSpritesFallingSpeed[offset];
        
        if (movement == SHORT_MAX)
        {
            movement = sSpritesFallingSpeed[offset - 1];
            gCurrentSprite.yPosition += movement;
        }
        else
        {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += movement;
        }
    }
}

void Zombie(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4) {
        SoundPlayNotAlreadyPlaying(0x14e);
    }
    if (gCurrentSprite.freezeTimer != 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ZombieInit();
            break;
        case ZOMBIE_POSE_MOVING_INIT:
            ZombieMovingInit();
        case ZOMBIE_POSE_MOVING:
            ZombieMoving();
            break;
        case ZOMBIE_POSE_IDLE_INIT:
            ZombieIdleInit();
        case ZOMBIE_POSE_IDLE:
            ZombieIdle();
            break;
        case ZOMBIE_POSE_TURNING_INIT:
            ZombieTurningInit();
        case ZOMBIE_POSE_TURNING:
            ZombieTurning();
            break;
        case ZOMBIE_POSE_TURNING_END:
            ZombieTurningEnd();
            break;
        case ZOMBIE_POSE_WAITING_TO_FORM:
            ZombieWaitingToForm();
            break;
        case ZOMBIE_POSE_FORMING:
            ZombieForming();
            break;
        case ZOMBIE_POSE_LUNGING_INIT:
            ZombieLungingInit();
            break;
        case ZOMBIE_POSE_LUNGING:
            ZombieLunging();
            break;
        case ZOMBIE_POSE_CHECK_LUNGING_ANIM_ENDED:
            ZombieCheckLungingAnimEnded();
            break;
        case SPRITE_POSE_FALLING_INIT:
            ZombieFallingInit();
        case SPRITE_POSE_FALLING:
            ZombieFalling();
            break;
        case SPRITE_POSE_DYING_INIT:
            ZombieDyingInit();
        case SPRITE_POSE_DYING:
            ZombieDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            ZombieInit();
    }
}
