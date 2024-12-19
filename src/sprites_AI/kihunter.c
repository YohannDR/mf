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
    if (gCurrentSprite.status & SS_SAMUS_DETECTED) {
        xRange = 0x2bc;
        yRange = 0x1b8;
        gCurrentSprite.status &= ~SS_SAMUS_DETECTED;
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
        gCurrentSprite.pose = 1;
}

void KihunterGroundJumpWarningInit(void) {
    gCurrentSprite.pose = 2;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work2++;
    if (gSpriteRandomNumber & 1) {
        gCurrentSprite.work3 = FALSE;
        gCurrentSprite.pOam = sKihunterOam_33e554;
    } else {
        gCurrentSprite.work3 = TRUE;
        gCurrentSprite.pOam = sKihunterOam_33e57c;
    }
}

void KihhunterGroundJumpInit(void) {
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0;
    if (gCurrentSprite.work3) {
        gCurrentSprite.yPosition -= 0x30;
        gCurrentSprite.pOam = sKihunterOam_33e70c;
    } else {
        gCurrentSprite.yPosition -= 0x20;
        gCurrentSprite.pOam = sKihunterOam_33e6fc;
    }
    SoundPlayNotAlreadyPlaying(SOUND_175);
}

void KihunterGroundLandingInit(void) {
    gCurrentSprite.pose = 0x1a;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sKihunterOam_33e5a4;
}

void KihunterIdleInit(void) {
    gCurrentSprite.pose = 8;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sKihunterOam_33e5b4;
}

void KihunterFallingInit(void) {
    gCurrentSprite.pose = 0x16;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sKihunterOam_33e70c;
}

void KihunterGroundTurningAroundInit(void) {
    gCurrentSprite.pose = 4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.pOam = sKihunterOam_33e5ec;
}

void KihunterGroundSpittingInit(void) {
    gCurrentSprite.pose = 0x2a;
    gCurrentSprite.pOam = sKihunterOam_33e684;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gSpriteRandomNumber & 1)
        gCurrentSprite.work3 = 1;
    else
        gCurrentSprite.work3 = 2;
}

void KihunterGroundJumpWarning(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
    if (gPreviousCollisionCheck == COLLISION_AIR) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if (gPreviousCollisionCheck == COLLISION_AIR) {
            KihunterFallingInit();
            return;
        }
    }
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        KihhunterGroundJumpInit();
}

void KihunterGroundJumping(void)
{
    u8 colliding;
    s16 movement;
    u32 blockTop;

    colliding = FALSE;

    if (!gCurrentSprite.work3)
        movement = sKihunterGroundLowJumpSpeed[gCurrentSprite.work4 / 4];
    else
        movement = sKihunterGroundHighJumpSpeed[gCurrentSprite.work4 / 4];

    if (gCurrentSprite.status & SS_X_FLIP)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight + 0x4);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            colliding++;
            gCurrentSprite.xPosition -= 4;
        }
        else
            gCurrentSprite.xPosition += 2;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft - 0x4);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            colliding++;
            gCurrentSprite.xPosition += 4;
        }
        else
            gCurrentSprite.xPosition -= 2;
    }

    gCurrentSprite.yPosition += movement;
    if (gCurrentSprite.work4 < ARRAY_SIZE(sKihunterGroundLowJumpSpeed) * 4 - 1)
        gCurrentSprite.work4++;

    if (movement > 0x0)
    {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.yPosition = blockTop;
            KihunterGroundLandingInit();
            return;
        }

        if (!colliding)
        {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                colliding++;
            else
            {
                blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                    colliding++;
            }
    
            if (colliding)
            {
                gCurrentSprite.yPosition = blockTop;
                KihunterGroundLandingInit();
            }
        }
    }
    else
    {
        colliding = FALSE;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop,
            gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
            colliding++;
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop,
                gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);

            if (gPreviousCollisionCheck == COLLISION_SOLID)
                colliding++;
        }

        if (colliding)
        {
            if (gCurrentSprite.status & SS_X_FLIP)
                    gCurrentSprite.xPosition -= 4;
            else
                gCurrentSprite.xPosition += 4;

            KihunterFallingInit();
        }
    }
}

void KihunterGroundLanding(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        if (KihunterGroundCheckInSpittingrange())
            KihunterGroundSpittingInit();
        else {
            u8 result = KihunterGroundDetectSamus();
            if (result == KIHUNTER_GROUND_SAMUS_IN_FRONT)
                KihhunterGroundJumpInit();
            else if (result == KIHUNTER_GROUND_SAMUS_BEHIND)
                KihunterGroundTurningAroundInit();
            else {
                if (gCurrentSprite.work2 >= 3)
                    KihunterIdleInit();
                else
                    KihunterGroundJumpWarningInit();
            }
        }
    }
}

void KihunterGroundFalling(void) {
    u8 offset;
    s16 movement;

    u8 collision = FALSE;
    u32 blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
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
        KihunterGroundLandingInit();
    } else {
        offset = gCurrentSprite.work4;
        movement = sSpritesFallingSpeed[offset];
        if (movement == SHORT_MAX) {
            movement = sSpritesFallingSpeed[offset - 1];
            gCurrentSprite.yPosition += movement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += movement;
        }
    }
}

void KihunterGroundIdle(void) {
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
    if (gPreviousCollisionCheck == COLLISION_AIR) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if (gPreviousCollisionCheck == COLLISION_AIR) {
            KihunterFallingInit();
            return;
        }
    }

    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        u8 result = KihunterGroundDetectSamus();
        if (result == KIHUNTER_GROUND_SAMUS_IN_FRONT)
            KihunterGroundJumpWarningInit();
        else if (result == KIHUNTER_GROUND_SAMUS_BEHIND)
            KihunterGroundTurningAroundInit();
        else {
            if (gCurrentSprite.work2 >= 3)
                KihunterGroundTurningAroundInit();
            else
                KihunterGroundJumpWarningInit();
        }
    }
}

void KihunterGroundTurningAround(void) {
    if (gCurrentSprite.currentAnimationFrame > 0)
        gCurrentSprite.yPosition -= PIXEL_SIZE;
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.status ^= SS_X_FLIP;
        gCurrentSprite.pose = 5;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sKihunterOam_33e604;
    }
}

void KihunterGroundTurningAroundSecondPart(void) {
    if (gCurrentSprite.currentAnimationFrame > 0)
        gCurrentSprite.yPosition += PIXEL_SIZE;
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight + 4);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.xPosition -= PIXEL_SIZE;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft - 4);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.xPosition += PIXEL_SIZE;
    }
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        KihunterIdleInit();
}

void KihunterGroundSpitting(void) {
    if (gCurrentSprite.currentAnimationFrame == 11 && gCurrentSprite.animationDurationCounter == 3) {
        if (gCurrentSprite.status & SS_X_FLIP)
            SpriteSpawnSecondary(SSPRITE_KIHUNTER_SPIT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - 0x58, gCurrentSprite.xPosition + 0x60, SS_X_FLIP);
        else
            SpriteSpawnSecondary(SSPRITE_KIHUNTER_SPIT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition - 0x58, gCurrentSprite.xPosition - 0x60, 0);
        SoundPlayNotAlreadyPlaying(SOUND_178);
    }
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        if (--gCurrentSprite.work3 == 0)
            KihunterGroundJumpWarningInit();
}

u8 KihunterFlyingXMovement(u16 movement) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + 0x30);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition - 0x30);
        if (gPreviousCollisionCheck == COLLISION_SOLID) return TRUE;
        gCurrentSprite.xPosition -= movement;
    }
    return FALSE;
}

void KihunterFlyingInit(void) {
    u8 ramSlot;

    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -0x60;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x28;
    gCurrentSprite.hitboxRight = 0x28;
    gCurrentSprite.pOam = sKihunterOam_33e454;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    SpriteUtilMakeSpriteFaceSamusXFlip();
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
    } else
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    gCurrentSprite.unk_8 = gCurrentSprite.yPosition;
    ramSlot = SpriteSpawnSecondary(SSPRITE_KIHUNTER_WINGS, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, 
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, gCurrentSprite.status & SS_X_FLIP);
    if (ramSlot == UCHAR_MAX)
        gCurrentSprite.status = 0;
}

void KihunterFlyingIdleInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sKihunterOam_33e454;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;
}

void KihunterFlyingTurningAroundInit(void) {
    gCurrentSprite.pose = 4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pOam = sKihunterOam_33e5ec;
}

void KihunterFlyingIdle(void) {
    u16 targetY, spriteY;
    u8 nslr;

    u8 offset = gCurrentSprite.work4;
    s16 movement = sKihunterFlyingIdleYMovement[offset];
    if (movement == SHORT_MAX) {
        movement = sKihunterFlyingIdleYMovement[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;

    if (movement > 0)
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    else
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck != COLLISION_SOLID)
        gCurrentSprite.yPosition += movement;

    if (KihunterFlyingXMovement(PIXEL_SIZE / 2)) {
        gCurrentSprite.pose = 3;
        return;
    }

    if (gCurrentSprite.work4 == ARRAY_SIZE(sKihunterFlyingIdleYMovement) - 2) {
        gCurrentSprite.work1++;
        targetY = gSamusData.yPosition;
        spriteY = gCurrentSprite.yPosition - 0x60;
        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(0x280, 0x3c0);
        if (targetY < spriteY)
            nslr = NSLR_OUT_OF_RANGE;
        if (nslr != NSLR_OUT_OF_RANGE) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                if (gCurrentSprite.xPosition > gSamusData.xPosition) {
                    if (gCurrentSprite.work1 >= 2)
                        gCurrentSprite.pose = 3;
                } else
                    gCurrentSprite.pose = 0x29;
            } else {
                if (gCurrentSprite.xPosition < gSamusData.xPosition) {
                    if (gCurrentSprite.work1 >= 2)
                        gCurrentSprite.pose = 3;
                } else
                    gCurrentSprite.pose = 0x29;
            }
        }
    }
}

void KihunterTurningAround(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.status ^= SS_X_FLIP;
        gCurrentSprite.pose = 5;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sKihunterOam_33e604;
    }
}

void KihunterFlyingTurningAroundSecondPart(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        KihunterFlyingIdleInit();
}

void KihunterFlyingUpdateSwipeAnimation(void) {
    if (gCurrentSprite.samusCollision == SSC_3) return;

    if ((u8)SpriteUtilCheckSamusNearSpriteLeftRight(0xa0, 0x80) != NSLR_OUT_OF_RANGE) {
        if (gCurrentSprite.pOam != sKihunterOam_33e50c) {
            gCurrentSprite.pOam = sKihunterOam_33e50c;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        } else if (gCurrentSprite.currentAnimationFrame == 2 && gCurrentSprite.animationDurationCounter == 4)
            SoundPlayNotAlreadyPlaying(SOUND_176);
    } else {
        if (gCurrentSprite.pOam == sKihunterOam_33e50c) {
            if (gCurrentSprite.currentAnimationFrame == 2 && gCurrentSprite.animationDurationCounter == 4)
                SoundPlayNotAlreadyPlaying(SOUND_176);
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.pOam = sKihunterOam_33e454;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            }
        }
    }
}

void KihunterFlyingSwoopingDownInit(void) {
    u16 targetY;

    gCurrentSprite.work1 = 16;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 0x2a;
    targetY = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    if (targetY - gCurrentSprite.yPosition > 0x168 || gSpriteRandomNumber >= 11) {
        gCurrentSprite.pOam = sKihunterOam_33e4a4;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_3;
        SoundPlayNotAlreadyPlaying(SOUND_177);
    } else
        SoundPlayNotAlreadyPlaying(SOUND_179);
}

void KihunterFlyingSwoopingDown(void) {
    u16 xMovement;
    u8 offset;
    s16 yMovement;

    KihunterFlyingUpdateSwipeAnimation();

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x10, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        if (KihunterFlyingXMovement(PIXEL_TO_SUB_PIXEL(1.5)))
            gCurrentSprite.pose = 0x2d;
        if (--gCurrentSprite.work1 == 0)
            gCurrentSprite.pose = 0x2d;
        return;
    }

    if (gCurrentSprite.samusCollision == SSC_3) {
        xMovement = gCurrentSprite.work4 / 4;
        if (xMovement > 4)
            xMovement = 8;
    } else {
        xMovement = gCurrentSprite.work4 / 2;
        if (xMovement > 8)
            xMovement = 8;
    }
    KihunterFlyingXMovement(xMovement);

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x80, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        gCurrentSprite.pose = 0x2b;
        return;
    }

    offset = gCurrentSprite.work4;
    yMovement = sKihunterFlyingSwoopingDownYSpeed[offset];
    if (yMovement == SHORT_MAX) {
        yMovement = sKihunterFlyingSwoopingDownYSpeed[offset - 1];
        gCurrentSprite.yPosition += yMovement;
    } else {
        offset++;
        gCurrentSprite.work4 = offset;
        gCurrentSprite.yPosition += yMovement;
    }
}

void KihunterFlyingSwoopingAcrossInit(void) {
    gCurrentSprite.work1 = 20;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 0x2c;
}

void KihunterFlyingSwoopingAcross(void) {
    u8 hitWall;

    KihunterFlyingUpdateSwipeAnimation();

    hitWall = KihunterFlyingXMovement(PIXEL_SIZE * 2);
    
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x10, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        if (hitWall)
            gCurrentSprite.pose = 0x2d;
        if (--gCurrentSprite.work1 == 0)
            gCurrentSprite.pose = 0x2d;
        return;
    }

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x80, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck == COLLISION_SOLID) {
        u8 offset = gCurrentSprite.work4;
        s16 yMovement = sKihunterFlyingSwoopingAcrossYSpeed[offset];
        if (yMovement == SHORT_MAX) {
            yMovement = sKihunterFlyingSwoopingAcrossYSpeed[offset - 1];
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

void KihunterFlyingAfterSwoopingInit(void) {
    gCurrentSprite.work1 = FALSE;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 0x2e;
    if (gCurrentSprite.samusCollision == SSC_3) {
        gCurrentSprite.pOam = sKihunterOam_33e454;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = 2;
    }
}

void KihunterFlyingAfterSwooping(void) {
    u8 finished = FALSE;

    if (SpriteUtilCheckEndCurrentSpriteAnim() && gCurrentSprite.pOam == sKihunterOam_33e50c) {
        gCurrentSprite.pOam = sKihunterOam_33e454;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }

    KihunterFlyingXMovement(6);

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck != COLLISION_SOLID) {
        if (!gCurrentSprite.work1) {
            if (gCurrentSprite.unk_8 + 0x40 < gCurrentSprite.yPosition) {
                u8 offset = gCurrentSprite.work4;
                s16 yMovement = sKihunterFlyingAfterSwoopingAcceleratingYSpeed[offset];
                if (yMovement == SHORT_MAX) {
                    yMovement = sKihunterFlyingAfterSwoopingAcceleratingYSpeed[offset - 1];
                    gCurrentSprite.yPosition += yMovement;
                } else {
                    offset++;
                    gCurrentSprite.work4 = offset;
                    gCurrentSprite.yPosition += yMovement;
                }
            } else {
                gCurrentSprite.work1 = TRUE;
                gCurrentSprite.work4 = 0;
            }
        } else {
            if (gCurrentSprite.unk_8 < gCurrentSprite.yPosition) {
                u8 offset = gCurrentSprite.work4;
                s16 yMovement = sKihunterFlyingAfterSwoopingDeceleratingYSpeed[offset];
                if (yMovement == SHORT_MAX) {
                    yMovement = sKihunterFlyingAfterSwoopingDeceleratingYSpeed[offset - 1];
                    gCurrentSprite.yPosition += yMovement;
                } else {
                    offset++;
                    gCurrentSprite.work4 = offset;
                    gCurrentSprite.yPosition += yMovement;
                }
            } else
                finished++;
        }
    } else
        finished++;

    if (finished) {
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
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
    }
}

void KihunterWingsInit(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[primary].status & SS_ENABLE_MOSAIC)
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pose = 2;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.pOam = sKihunterOam_33e474;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void KihunterWingsIdle(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    gCurrentSprite.yPosition = gSpriteData[primary].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primary].xPosition;
    if (gSpriteData[primary].pose == SPRITE_POSE_DYING_INIT || gSpriteData[primary].pose == SPRITE_POSE_DYING) {
        SpriteDyingInit();
        SpriteDying();
        return;
    }
    if (gSpriteData[primary].status & SS_ENABLE_MOSAIC)
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    else
        gCurrentSprite.status &= ~ SS_ENABLE_MOSAIC;
    if (gSpriteData[primary].status & SS_X_FLIP)
        gCurrentSprite.status |= SS_X_FLIP;
    else
        gCurrentSprite.status &= ~ SS_X_FLIP;
    if (gSpriteData[primary].health <= 6) {
        gCurrentSprite.pose = 0x38;
        gCurrentSprite.pOam = sKihunterOam_33e4c4;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.paletteRow = 0;
        gCurrentSprite.yPosition -= 0x60;
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition -= 0x20;
        else
            gCurrentSprite.xPosition += 0x20;
    }
}

void KihunterWingsFalling(void) {
    u32 blockTop;
    
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.pose = 0x3a;
        gCurrentSprite.work1 = 0x28;
    } else
        gCurrentSprite.yPosition += PIXEL_SIZE / 2;
}

void KihunterWingsDisappearing(void) {
    if (MOD_AND(gFrameCounter8Bit, 4) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.status = 0;
}

void KihunterSpitInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -8;
    gCurrentSprite.hitboxBottom = 8;
    gCurrentSprite.hitboxLeft = -8;
    gCurrentSprite.hitboxRight = 8;
    gCurrentSprite.pOam = sKihunterOam_33e64c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
}

void KihunterSpitMoving(void) {
    u32 blockTop;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
    } else {
        u8 offset = gCurrentSprite.work4;
        s16 yMovement = sKihunterSpitFallingSpeed[offset];
        if (yMovement == SHORT_MAX) {
            yMovement = sKihunterSpitFallingSpeed[offset - 1];
            gCurrentSprite.yPosition += yMovement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += yMovement;
        }
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition += PIXEL_SIZE * 3;
        else
            gCurrentSprite.xPosition -= PIXEL_SIZE * 3;
    }
}

void KihunterSpitExplodingInit(void) {
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pOam = sKihunterOam_33e664;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void KihunterSpitExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void KihunterHiveInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (!(gCurrentSprite.properties & SP_CAN_ABSORB_X)) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x40;
    gCurrentSprite.hitboxBottom = 0x30;
    gCurrentSprite.hitboxLeft = -0x30;
    gCurrentSprite.hitboxRight = 0x30;
    gCurrentSprite.samusCollision = 1;
    gCurrentSprite.frozenPaletteRowOffset = 1;
    gCurrentSprite.drawOrder = 13;
    gCurrentSprite.pOam = sKihunterOam_33e61c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    SpriteSpawnSecondary(SSPRITE_KIHUNTER_BUG, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x60, gCurrentSprite.xPosition - 0x20, 0);
    SpriteSpawnSecondary(SSPRITE_KIHUNTER_BUG, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x60, gCurrentSprite.xPosition + 0x20, 0);
    SoundPlay_2894(SOUND_118);
}

void KihunterHiveSpawnKihunter(void) {
    u16 flip;
    u8 ramSlot;

    gCurrentSprite.numberOfXToForm = 1;
    gCurrentSprite.spritesetSlotAndProperties = SSP_UNINFECTED_OR_BOSS;
    gCurrentSprite.status &= ~(SS_ENABLE_MOSAIC | SS_IGNORE_PROJECTILES);
    gCurrentSprite.pose = 0x5a;
    gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    if (gCurrentSprite.xPosition > gSamusData.xPosition)
        flip = 0;
    else
        flip = SS_X_FLIP;
    ramSlot = SpriteSpawnPrimary(PSPRITE_KIHUNTER_FLYING, 0, gCurrentSprite.spritesetGfxSlot, SSP_X_ABSORBABLE_BY_SAMUS,
        gCurrentSprite.yPosition + 0x80, gCurrentSprite.xPosition, flip);
    // BUG: doesn't check if it can't spawn a kihunter so it goes out of bounds with ramSlot == 0xff if this happens
    gSpriteData[ramSlot].pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
    gSpriteData[ramSlot].status |= (SS_ENABLE_MOSAIC | SS_IGNORE_PROJECTILES);
    gSpriteData[ramSlot].status &= ~SS_HIDDEN;
    gSpriteData[ramSlot].properties &= ~SP_CAN_ABSORB_X;
}

void KihunterHiveSpawnCooldown(void) {
    if (--gCurrentSprite.xParasiteTimer == 0) {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.properties |= SP_CAN_ABSORB_X;
    }
}

void KihunterBugInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pOam = sKihunterOam_33e62c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0; // remove me!
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.work4 = gSpriteRandomNumber * 4;
    if (gSpriteRandomNumber & 1)
        gCurrentSprite.work3 = 20;
    else
        gCurrentSprite.work3 = 60;
}

void KihunterBugIdle(void) {
    u8 offset = gCurrentSprite.work4;
    s16 movement = sKihunterBugIdleYMovement[offset];
    if (movement == SHORT_MAX) {
        movement = sKihunterBugIdleYMovement[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    offset = gCurrentSprite.work3;
    movement = sKihunterBugIdleXMovement[gCurrentSprite.work3];
    if (movement == SHORT_MAX) {
        movement = sKihunterBugIdleXMovement[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;

    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].health == 0) {
        // It's hive is destroyed
        gCurrentSprite.pose = 0x17;
        gCurrentSprite.drawOrder = 4;
    }
}

void KihunterBugChasingSamusInit(void) {
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.unk_8 = 0;
    gCurrentSprite.pose = 0x18;
    SpriteUtilMakeSpriteFaceSamusDirection();
    if (gCurrentSprite.yPosition > gSamusData.yPosition + gSamusData.drawDistanceTop)
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    else
        gCurrentSprite.status |= SS_FACING_DOWN;
}

void KihunterBugChasingSamus(void) {
    u16 targetY, targetX, ySpeedCap, xSpeedCap;

    targetY = gSamusData.yPosition + gSamusData.drawDistanceTop;
    targetX = gSamusData.xPosition;
    ySpeedCap = 0x1e;
    xSpeedCap = 0x28;

    switch (gCurrentSprite.unk_8) {
        case 1:
            targetY -= 0x20;
            if (gCurrentSprite.status & SS_FACING_RIGHT)
                targetX += 0x30;
            else
                targetX -= 0x30;
            break;
        case 3:
            targetY += 0x20;
            if (gCurrentSprite.status & SS_FACING_RIGHT)
                targetX -= 0x30;
            else
                targetX += 0x30;
            break;
    }

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        // Move right
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > targetX - PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                gCurrentSprite.xPosition += (gCurrentSprite.work3 >> 2);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += (gCurrentSprite.work2 >> 2);
            else
            {
                gCurrentSprite.status &= ~SS_FACING_RIGHT;
                gCurrentSprite.work3 = 1;
                if (++gCurrentSprite.unk_8 > 3)
                    gCurrentSprite.unk_8 = 0;
            }
        }
    }
    else
    {
        // Move left
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < targetX + PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                gCurrentSprite.xPosition -= (gCurrentSprite.work3 >> 2);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition -= (gCurrentSprite.work2 >> 2);
            else
            {
                gCurrentSprite.status |= SS_FACING_RIGHT;
                gCurrentSprite.work3 = 1;
                if (++gCurrentSprite.unk_8 > 3)
                    gCurrentSprite.unk_8 = 0;
            }
        }
    }

    if (gCurrentSprite.status & SS_FACING_DOWN)
    {
        // Move down
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > targetY - PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                gCurrentSprite.yPosition += (gCurrentSprite.work4 >> 2);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += (gCurrentSprite.work1 >> 2);
            else
            {
                gCurrentSprite.status &= ~SS_FACING_DOWN;
                gCurrentSprite.work4 = 1;
            }
        }
    }
    else
    {
        // Move up
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < targetY + PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                gCurrentSprite.yPosition -= (gCurrentSprite.work4 >> 2);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition -= (gCurrentSprite.work1 >> 2);
            else
            {
                gCurrentSprite.status |= SS_FACING_DOWN;
                gCurrentSprite.work4 = 1;
            }
        }
    }
}

void KihunterGround(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_174);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    if (gCurrentSprite.pose < SPRITE_POSE_TURNING_INTO_X
        && SPRITE_HAS_ISFT(gCurrentSprite) > 0 && gCurrentSprite.status & SS_ON_SCREEN)
        gCurrentSprite.status |= SS_SAMUS_DETECTED;
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            KihunterGroundInit();
            break;
        case 1:
            KihunterGroundJumpWarningInit();
        case 2:
            KihunterGroundJumpWarning();
            break;
        case 0x18:
            KihunterGroundJumping();
            break;
        case 0x1a:
            KihunterGroundLanding();
            break;
        case 8:
            KihunterGroundIdle();
            break;
        case 4:
            KihunterGroundTurningAround();
            break;
        case 5:
            KihunterGroundTurningAroundSecondPart();
            break;
        case 0x2a:
            KihunterGroundSpitting();
            break;
        case 0x16:
            KihunterGroundFalling();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            KihunterGroundInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            KihunterTurningIntoX();
            XParasiteInit();
    }
}

void KihunterFlying(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_174);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_KIHUNTER_WINGS, gCurrentSprite.primarySpriteRamSlot);
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            KihunterFlyingInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            KihunterFlyingIdleInit();
        case SPRITE_POSE_IDLE:
            KihunterFlyingIdle();
            break;
        case 3:
            KihunterFlyingTurningAroundInit();
        case 4:
            KihunterTurningAround();
            break;
        case 5:
            KihunterFlyingTurningAroundSecondPart();
            break;
        case 0x29:
            KihunterFlyingSwoopingDownInit();
        case 0x2a:
            KihunterFlyingSwoopingDown();
            break;
        case 0x2b:
            KihunterFlyingSwoopingAcrossInit();
        case 0x2c:
            KihunterFlyingSwoopingAcross();
            break;
        case 0x2d:
            KihunterFlyingAfterSwoopingInit();
        case 0x2e:
            KihunterFlyingAfterSwooping();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_KIHUNTER_WINGS, gCurrentSprite.primarySpriteRamSlot);
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            KihunterFlyingInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            KihunterTurningIntoX();
            XParasiteInit();
    }
    if (gCurrentSprite.pose < SPRITE_POSE_DYING_INIT && gCurrentSprite.health <= 6) {
        gCurrentSprite.spriteId = PSPRITE_KIHUNTER_GROUND;
        gCurrentSprite.pose = SPRITE_POSE_UNINITIALIZED;
    }
}

void KihunterWings(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0x58:
            SpriteDying();
            break;
        case 0x38:
            KihunterWingsFalling();
            break;
        case 0x3a:
            KihunterWingsDisappearing();
            break;
        case SPRITE_POSE_UNINITIALIZED:
            KihunterWingsInit();
        default:
            KihunterWingsIdle();
    }
}

void KihunterSpit(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            KihunterSpitInit();
        case SPRITE_POSE_IDLE:
            KihunterSpitMoving();
            break;
        case 0x38:
            KihunterSpitExploding();
            break;
        default:
            KihunterSpitExplodingInit();
    }
}

void KihunterHive(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            KihunterHiveInit();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            KihunterHiveSpawnKihunter();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X:
            KihunterHiveSpawnCooldown();
    }
    unk_120ac(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
}

void KihunterBug(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            KihunterBugInit();
        case SPRITE_POSE_IDLE:
            KihunterBugIdle();
            break;
        case 0x17:
            KihunterBugChasingSamusInit();
        case 0x18:
            KihunterBugChasingSamus();
    }
}
