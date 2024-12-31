#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/kago.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

#define KAGO_POSE_IDLE_SHORT 2
#define KAGO_POSE_IDLE_TALL 0x18

#define KAGO_INSECT_POSE_JUMP_WARNING 2
#define KAGO_INSECT_POSE_JUMPING 0x18

void KagoSetCollision(u8 caa) {
    u16 y = gCurrentSprite.yPosition;
    u16 x = gCurrentSprite.xPosition;
    SpriteUtilCheckCollisionAtPosition(y - BLOCK_TO_SUB_PIXEL(1.5), x + BLOCK_TO_SUB_PIXEL(1.5));
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        SpriteUtilCheckCollisionAtPosition(y - BLOCK_TO_SUB_PIXEL(1.5), x - BLOCK_TO_SUB_PIXEL(1.5));
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            gCurrentClipdataAffectingAction = caa;
            ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(1.5), x + HALF_BLOCK_SIZE);
            gCurrentClipdataAffectingAction = caa;
            ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(1.5), x - HALF_BLOCK_SIZE);
        }
    }
}

void KagoPlaySound(void) {
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        SoundPlayNotAlreadyPlaying(SOUND_KAGO_IDLE_SHORT);
        gCurrentSprite.work2 = 40;
    } else if (gCurrentSprite.work1 == 4) {
        SoundPlayNotAlreadyPlaying(SOUND_KAGO_IDLE_TALL_4);
        gCurrentSprite.work2 = 72;
    } else if (gCurrentSprite.work1 == 3) {
        SoundPlayNotAlreadyPlaying(SOUND_KAGO_IDLE_TALL_3);
        gCurrentSprite.work2 = 56;
    } else if (gCurrentSprite.work1 == 2) {
        SoundPlayNotAlreadyPlaying(SOUND_KAGO_IDLE_TALL_2);
        gCurrentSprite.work2 = 30;
    } else if (gCurrentSprite.work1 == 1) {
        SoundPlayNotAlreadyPlaying(SOUND_KAGO_IDLE_TALL_1);
        gCurrentSprite.work2 = 18;
    } else {
        SoundPlayNotAlreadyPlaying(SOUND_KAGO_IDLE_TALL_0);
        gCurrentSprite.work2 = 12;
    }
}

void KagoTurningIntoX(void) {
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition + 0x5c, gCurrentSprite.xPosition - 0xc, SS_X_FLIP);
    gCurrentSprite.yPosition -= 0x1c;
    gCurrentSprite.xPosition += 0xc;
}

void KagoInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        gCurrentSprite.properties |= SP_SOLID_FOR_PROJECTILES;
        gCurrentSprite.samusCollision = SSC_SOLID;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.hitboxBottom = 0x10;
        gCurrentSprite.pOam = sKagoOam_IdleShort;
    } else {
        gCurrentSprite.properties &= ~SP_SOLID_FOR_PROJECTILES;
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_SOLID;
        gCurrentSprite.frozenPaletteRowOffset = 1;
        gCurrentSprite.drawDistanceBottom = 0x38;
        gCurrentSprite.hitboxBottom = 0xc0;
        gCurrentSprite.pOam = sKagoOam_IdleTallVerySlow;
    }
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.work1 = 4;
    // BUG: work2 is uninitialized
    gCurrentSprite.work3 = FALSE;
    gCurrentSprite.work4 = 0;
    KagoPlaySound();
    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x78;
    gCurrentSprite.hitboxLeft = -0x30;
    gCurrentSprite.hitboxRight = 0x30;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        SoundPlayNotAlreadyPlaying(SOUND_KAGO_MUTATING);
    } else {
        gCurrentSprite.xPosition += 0x20;
        if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
            gCurrentSprite.pose = KAGO_POSE_IDLE_SHORT;
        } else {
            gCurrentSprite.pose = KAGO_POSE_IDLE_TALL;
            gCurrentSprite.yPosition -= 0xc0;
        }
    }
}

void KagoSpawningFromX(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.xParasiteTimer > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
        if (gCurrentSprite.xParasiteTimer < 24)
            gCurrentSprite.yPosition -= 8;
    } else {
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.pose = KAGO_POSE_IDLE_TALL;
    }
}

void KagoIdleShort(void) {
    if (--gCurrentSprite.work2 == 0)
        KagoPlaySound();
}

void KagoIdleTall(void) {
    if (--gCurrentSprite.work2 == 0)
        KagoPlaySound();
}

void KagoDyingInit(void) {
    if (gCurrentSprite.work3)
        KagoSetCollision(CAA_REMOVE_SOLID);
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.pose = SPRITE_POSE_DYING;
    gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
    SoundPlayNotAlreadyPlaying(SOUND_142);
    SpriteDying();
}

void KagoInsectExplodingInit(void) {
    gCurrentSprite.pOam = sKagoInsectOam_Exploding;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_EXPLODING;
    gCurrentSprite.samusCollision = SSC_NONE;
    SoundPlayNotAlreadyPlaying(SOUND_KAGO_INSECT_EXPLODING);
}

void KagoInsectExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void KagoInsectInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.frozenPaletteRowOffset = 1;
    gCurrentSprite.pOam = sKagoInsectOam_Midair;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -0x28;
    gCurrentSprite.hitboxBottom = -8;
    gCurrentSprite.hitboxLeft = -0x14;
    gCurrentSprite.hitboxRight = 0x14;
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.work3 = DIV_SHIFT(gSpriteRandomNumber, 4) + 5;
    gCurrentSprite.work4 = 0;
    if (gSpriteRandomNumber >= 8)
        gCurrentSprite.work2 = TRUE;
    else
        gCurrentSprite.work2 = FALSE;
    SpriteUtilChooseRandomXFlip();
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.xParasiteTimer = 20;
}

void KagoInsectJumpWarningInit(void) {
    gCurrentSprite.pose = KAGO_INSECT_POSE_JUMP_WARNING;
    gCurrentSprite.pOam = sKagoInsectOam_JumpWarning;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void KagoInsectJumpingInit(void) {
    gCurrentSprite.pose = KAGO_INSECT_POSE_JUMPING;
    gCurrentSprite.pOam = sKagoInsectOam_Midair;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work3 = 5;
    gCurrentSprite.work4 = 0;
    if (MOD_AND(gSpriteRandomNumber, 2))
        gCurrentSprite.work2 = TRUE;
    else
        gCurrentSprite.work2 = FALSE;
    if (gCurrentSprite.xPosition > gSamusData.xPosition) {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.work3 = 0;
    } else {
        if (!(gCurrentSprite.status & SS_X_FLIP))
            gCurrentSprite.work3 = 0;
    }
    SoundPlayNotAlreadyPlaying(SOUND_KAGO_INSECT_JUMPING);
}

void KagoInsectFallingInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.pOam = sKagoInsectOam_Midair;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0;
}

void KagoInsectJumpWarning(void) {
    if (gCurrentSprite.health == 0) {
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
        return;
    }
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
    if (gPreviousCollisionCheck == COLLISION_AIR) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if (gPreviousCollisionCheck == COLLISION_AIR) {
            KagoInsectFallingInit();
            return;
        }
    }
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        KagoInsectJumpingInit();
}

void KagoInsectJumping(void) {
    s16 xMovement, yMovement;
    u32 blockTop;
    u8 collision;

    if (gCurrentSprite.health == 0) {
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
        return;
    }
    collision = FALSE;
    xMovement = gCurrentSprite.work3;
    if (xMovement == 0) {
        if (gCurrentSprite.work4 == 16) {
            gCurrentSprite.status ^= SS_X_FLIP;
            gCurrentSprite.pOam = sKagoInsectOam_TurningAround;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        } else if (gCurrentSprite.work4 == 22) {
            gCurrentSprite.pOam = sKagoInsectOam_Midair;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
        yMovement = sKagoInsectLowJumpVelocity[gCurrentSprite.work4 / 4];
    } else {
        yMovement = sKagoInsectMediumJumpVelocity[gCurrentSprite.work4 / 4];
        if (gCurrentSprite.status & SS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight + 4);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                gCurrentSprite.xPosition -= 4;
                gCurrentSprite.status &= ~SS_X_FLIP;
                gCurrentSprite.pOam = sKagoInsectOam_TurningAround;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            } else {
                if (yMovement > 0)
                    gCurrentSprite.xPosition += xMovement - 3;
                else
                    gCurrentSprite.xPosition += xMovement;
            }
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft - 4);
            if (gPreviousCollisionCheck == COLLISION_SOLID) {
                gCurrentSprite.xPosition += 4;
                gCurrentSprite.status |= SS_X_FLIP;
                gCurrentSprite.pOam = sKagoInsectOam_TurningAround;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            } else {
                if (yMovement > 0)
                    gCurrentSprite.xPosition -= xMovement - 3;
                else
                    gCurrentSprite.xPosition -= xMovement;
            }
        }
    }
    gCurrentSprite.yPosition += yMovement;
    if (gCurrentSprite.work4 < ARRAY_SIZE(sKagoInsectLowJumpVelocity) * 4 - 1)
        gCurrentSprite.work4++;
    if (yMovement > 0) {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
            gCurrentSprite.yPosition = blockTop;
            KagoInsectJumpWarningInit();
        } else if (!collision) {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                collision = TRUE;
            else {
                blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                    collision = TRUE;
            }
            if (collision) {
                gCurrentSprite.yPosition = blockTop;
                KagoInsectJumpWarningInit();
            }
        }
    } else {
        collision = FALSE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            collision = TRUE;
        else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                collision = TRUE;
        }
        if (collision) {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.xPosition -= 4;
            else
                gCurrentSprite.xPosition += 4;
            KagoInsectFallingInit();
        }
    }
}

void KagoInsectFalling(void) {
    u8 collision;
    u8 offset;
    s16 movement;
    u32 blockTop;

    if (gCurrentSprite.health == 0) {
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
        return;
    }
    collision = FALSE;
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        collision++;
    else {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            collision++;
        else {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                collision++;
        }
    }
    if (collision) {
        gCurrentSprite.yPosition = blockTop;
        KagoInsectJumpWarningInit();
    } else {
        offset = gCurrentSprite.work4;
        movement = sSpritesFallingSpeedQuickAcceleration[offset];
        if (movement == SHORT_MAX) {
            movement = sSpritesFallingSpeedQuickAcceleration[offset - 1];
            gCurrentSprite.yPosition += movement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += movement;
        }
    }
}

void Kago(void) {
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        gCurrentSprite.hitboxTop = -0x78;
        if (SPRITE_HAS_ISFT(gCurrentSprite) == 1)
            SoundPlayNotAlreadyPlaying(SOUND_KAGO_HIT_SHORT);
    } else {
        gCurrentSprite.hitboxTop = -0x88;
        if (gCurrentSprite.work4 > 0) {
            if (--gCurrentSprite.work4 == 0)
                gCurrentSprite.pOam = sKagoOam_IdleTallVerySlow;
        } else if (SPRITE_HAS_ISFT(gCurrentSprite) == 1 && gCurrentSprite.pOam == sKagoOam_IdleTallVerySlow) {
            gCurrentSprite.pOam = sKagoOam_IdleTallFast;
            gCurrentSprite.work4 = 60;
        }
    }
    if (gCurrentSprite.freezeTimer > 0) {
        gCurrentSprite.hitboxTop = -0x78;
        if (!gCurrentSprite.work3 && gCurrentSprite.pose == KAGO_POSE_IDLE_TALL) {
            gCurrentSprite.work3 = TRUE;
            KagoSetCollision(CAA_MAKE_SOLID);
        }
        SpriteUtilUpdateFreezeTimer();
        if (gCurrentSprite.freezeTimer == 0 && gCurrentSprite.work3 && gCurrentSprite.pose == KAGO_POSE_IDLE_TALL) {
            gCurrentSprite.work3 = FALSE;
            KagoSetCollision(CAA_REMOVE_SOLID);
        }
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            KagoInit();
            break;
        case KAGO_POSE_IDLE_SHORT:
            KagoIdleShort();
            break;
        case KAGO_POSE_IDLE_TALL:
            KagoIdleTall();
            break;
        case SPRITE_POSE_DYING_INIT:
            KagoDyingInit();
            break;
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            KagoInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            KagoSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            KagoTurningIntoX();
            XParasiteInit();
    }
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        unk_120ac(gCurrentSprite.yPosition - 0x1e, gCurrentSprite.xPosition);
}

void KagoInsect(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            KagoInsectInit();
            break;
        case KAGO_INSECT_POSE_JUMP_WARNING:
            KagoInsectJumpWarning();
            break;
        case KAGO_INSECT_POSE_JUMPING:
            KagoInsectJumping();
            break;
        case SPRITE_POSE_FALLING:
            KagoInsectFalling();
            break;
        case SPRITE_POSE_STOPPED:
            KagoInsectExplodingInit();
        case SPRITE_POSE_EXPLODING:
            KagoInsectExploding();
    }
    if (gCurrentSprite.status & SS_IGNORE_PROJECTILES && gCurrentSprite.xParasiteTimer > 0) {
        if (--gCurrentSprite.xParasiteTimer == 0)
            gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
    }
}
