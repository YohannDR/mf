#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/reo.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void ReoPlaySound(void) {
    if (MOD_AND(gFrameCounter8Bit, 32) == 0)
        SoundPlayNotAlreadyPlaying(SOUND_REO_MOVING);
}

u8 ReoCheckFall(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) >= 5 && gCurrentSprite.status & SS_ON_SCREEN) {
        gCurrentSprite.pose = 0x37;
        return TRUE;
    }
    return FALSE;
}

u8 ReoXMovement(u16 movement) {
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition -= movement;
    }
    return FALSE;
}

void ReoInit(void) {
    u8 ramSlot;

    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        if (!(gCurrentSprite.status & SS_HIDDEN)) {
            gCurrentSprite.status = 0;
            return;
        }
        gCurrentSprite.hitboxTop = -0x40;
        gCurrentSprite.hitboxBottom = 0x28;
        gCurrentSprite.hitboxLeft = -0x40;
        gCurrentSprite.hitboxRight = 0x40;
    } else {
        gCurrentSprite.hitboxTop = -0x38;
        gCurrentSprite.hitboxBottom = 0x18;
        gCurrentSprite.hitboxLeft = -0x28;
        gCurrentSprite.hitboxRight = 0x28;
    }
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.pOam = sReoOam_33f128;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    SpriteUtilMakeSpriteFaceSamusDirection();
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        return;
    }
    gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    gCurrentSprite.unk_8 = gCurrentSprite.yPosition;
    ramSlot = SpriteSpawnSecondary(SSPRITE_REO_WING, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, gCurrentSprite.status & SS_X_FLIP);
    if (ramSlot == UCHAR_MAX)
        gCurrentSprite.status = 0;
    gCurrentSprite.work2 = ramSlot;
}

void ReoFallInit(void) {
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sReoOam_33f178;
    gCurrentSprite.work4 = 0;
    gSpriteData[gCurrentSprite.work2].status |= SS_NOT_DRAWN;
}

void ReoFalling(void) {
    u8 collision = FALSE;
    u8 offset;
    s16 movement;
    u32 trueCond;

    u32 blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    trueCond = TRUE; // Needed to produce matching ASM.
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        collision = trueCond;
    else {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            collision = trueCond;
        else {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                collision = trueCond;
        }
    }
    if (collision) {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.pose = 0x3a;
        gCurrentSprite.work1 = 60;
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

void ReoLanding(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x2d;
        gCurrentSprite.pOam = sReoOam_33f128;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gSpriteData[gCurrentSprite.work2].status &= ~SS_NOT_DRAWN;
    }
}

void ReoIdleInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sReoOam_33f128;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;
}

void ReoIdle(void) {
    u8 offset;
    s16 movement;

    if (gCurrentSprite.status & SS_HIDDEN) return;
    if (ReoCheckFall()) return;

    gCurrentSprite.work3 += 1;

    offset = gCurrentSprite.work4;
    movement = sReoIdleYMovement[offset];
    if (movement == SHORT_MAX) {
        movement = sReoIdleYMovement[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    if (ReoXMovement(2) || gCurrentSprite.work3 > 32) {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.work3 = 0;
    }

    if (gCurrentSprite.work4 == ARRAY_SIZE(sReoIdleYMovement) - 2) {
        u16 targetY = gSamusData.yPosition;
        u16 spriteY = gCurrentSprite.yPosition - 0x60;
        u8 nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0x280, 0x3c0);
        if (targetY < spriteY)
            nslr = NSLR_OUT_OF_RANGE;
        if (nslr != NSLR_OUT_OF_RANGE) {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                if (gCurrentSprite.xPosition > gSamusData.xPosition)
                    gCurrentSprite.status ^= SS_FACING_RIGHT;
            } else {
                if (gCurrentSprite.xPosition < gSamusData.xPosition)
                    gCurrentSprite.status ^= SS_FACING_RIGHT;
            }
            gCurrentSprite.pose = 0x29;
        }
    }
}

void ReoGoingDownInit(void) {
    gCurrentSprite.work1 = 8;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 0x2a;
}

void ReoGoingDown(void) {
    if (ReoCheckFall()) return;
    ReoPlaySound();
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        if (ReoXMovement(3))
            gCurrentSprite.pose = 0x2d;
        if (--gCurrentSprite.work1 == 0)
            gCurrentSprite.pose = 0x2d;
    } else {
        u16 xMovement = DIV_SHIFT(gCurrentSprite.work4, 4);
        if (xMovement > 4)
            xMovement = 6;
        ReoXMovement(xMovement);
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x80, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.pose = 0x2b;
        else {
            u8 offset = gCurrentSprite.work4;
            s16 yMovement = sReoGoingDownYSpeed[offset];
            if (yMovement == SHORT_MAX) {
                yMovement = sReoGoingDownYSpeed[offset - 1];
                gCurrentSprite.yPosition += yMovement;
            } else {
                offset++;
                gCurrentSprite.work4 = offset;
                gCurrentSprite.yPosition += yMovement;
            }
        }
    }
}

void ReoSlidingInit(void) {
    gCurrentSprite.work1 = 8;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 0x2c;
}

void ReoSliding(void) {
    u8 hitWall;

    if (ReoCheckFall()) return;
    ReoPlaySound();
    hitWall = ReoXMovement(6);
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        if (hitWall)
            gCurrentSprite.pose = 0x2d;
        if (--gCurrentSprite.work1 == 0)
            gCurrentSprite.pose = 0x2d;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x80, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            u8 offset = gCurrentSprite.work4;
            s16 yMovement = sReoSlidingYSpeed[offset];
            if (yMovement == SHORT_MAX) {
                yMovement = sReoSlidingYSpeed[offset - 1];
                gCurrentSprite.yPosition += yMovement;
            } else {
                offset++;
                gCurrentSprite.work4 = offset;
                gCurrentSprite.yPosition += yMovement;
            }
        } else {
            gCurrentSprite.work1 = 0;
            gCurrentSprite.work4 = 0;
            gCurrentSprite.pose = 0x2a;
        }
    }
}

void ReoGoingUpInit(void) {
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 0x2e;
}

void ReoGoingUp(void) {
    if (ReoCheckFall()) return;
    ReoPlaySound();
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck != COLLISION_SOLID) {
        if (gCurrentSprite.work1 == 0) {
            ReoXMovement(6);
            if (gCurrentSprite.unk_8 + 0x60 < gCurrentSprite.yPosition) {
                u8 offset = gCurrentSprite.work4;
                s16 yMovement = sReoGoingUpAccceleratingYSpeed[offset];
                if (yMovement == SHORT_MAX) {
                    yMovement = sReoGoingUpAccceleratingYSpeed[offset - 1];
                    gCurrentSprite.yPosition += yMovement;
                } else {
                    offset++;
                    gCurrentSprite.work4 = offset;
                    gCurrentSprite.yPosition += yMovement;
                }
            } else {
                gCurrentSprite.work1 = 1;
                gCurrentSprite.work4 = 0;
            }
        } else {
            ReoXMovement(3);
            if (gCurrentSprite.unk_8 < gCurrentSprite.yPosition) {
                u8 offset = gCurrentSprite.work4;
                s16 yMovement = sReoGoingUpDeceleratingYSpeed[offset];
                if (yMovement == SHORT_MAX) {
                    yMovement = sReoGoingUpDeceleratingYSpeed[offset - 1];
                    gCurrentSprite.yPosition += yMovement;
                } else {
                    offset++;
                    gCurrentSprite.work4 = offset;
                    gCurrentSprite.yPosition += yMovement;
                }
            } else
                gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        }
    } else
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void ReoWingsInit(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[primary].status & SS_ENABLE_MOSAIC)
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.pOam = sReoOam_33f150;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ReoWingsIdle(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    gCurrentSprite.yPosition = gSpriteData[primary].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primary].xPosition;
    if (gSpriteData[primary].pose == SPRITE_POSE_DYING_INIT || gSpriteData[primary].pose == SPRITE_POSE_DYING) {
        SpriteDyingInit();
        SpriteDying();
    } else {
        if (gSpriteData[primary].status & SS_ENABLE_MOSAIC)
            gCurrentSprite.status |= SS_ENABLE_MOSAIC;
        else
            gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        if (gSpriteData[primary].status & SS_X_FLIP)
            gCurrentSprite.status |= SS_X_FLIP;
        else
            gCurrentSprite.status &= ~SS_X_FLIP;
        if (gSpriteData[primary].status & SS_HIDDEN)
            gCurrentSprite.status |= SS_HIDDEN;
        else
            gCurrentSprite.status &= ~SS_HIDDEN;
    }
}

void Reo(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_REO_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_REO_WING, gCurrentSprite.primarySpriteRamSlot);
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ReoInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            ReoIdleInit();
        case SPRITE_POSE_IDLE:
            ReoIdle();
            break;
        case 0x37:
            ReoFallInit();
        case 0x38:
            ReoFalling();
            break;
        case 0x3a:
            ReoLanding();
            break;
        case 0x29:
            ReoGoingDownInit();
        case 0x2a:
            ReoGoingDown();
            break;
        case 0x2b:
            ReoSlidingInit();
        case 0x2c:
            ReoSliding();
            break;
        case 0x2d:
            ReoGoingUpInit();
        case 0x2e:
            ReoGoingUp();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_REO_WING, gCurrentSprite.primarySpriteRamSlot);
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            ReoInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
            gCurrentSprite.yPosition -= 0x20;
    }
}

void ReoWings(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_UNINITIALIZED:
            ReoWingsInit();
        default:
            ReoWingsIdle();
            break;
    }
}
