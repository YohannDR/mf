#include "sprites_AI/geemer.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/geemer.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

#include "gba/keys.h"

void GeemerCheckCollisions(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 4);
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition);
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        }
    }
}

void GeemerSetHitbox(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxTop = PIXEL_TO_SUB_PIXEL(-12);
            gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(12);
            gCurrentSprite.hitboxLeft = PIXEL_TO_SUB_PIXEL(-12);
            gCurrentSprite.hitboxRight = 0;
        } else {
            gCurrentSprite.hitboxTop = PIXEL_TO_SUB_PIXEL(-12);
            gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(12);
            gCurrentSprite.hitboxLeft = 0;
            gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(12);
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            gCurrentSprite.hitboxTop = 0;
            gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(10);
            gCurrentSprite.hitboxLeft = PIXEL_TO_SUB_PIXEL(-12);
            gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(12);
        } else {
            gCurrentSprite.hitboxTop = PIXEL_TO_SUB_PIXEL(-10);
            gCurrentSprite.hitboxBottom = 0;
            gCurrentSprite.hitboxLeft = PIXEL_TO_SUB_PIXEL(-12);
            gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(12);
        }
    }
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
}

void GeemerSetCrawlingGFX(void) {
    if (gCurrentSprite.work0) {
        gCurrentSprite.pOam = sGeemerOam_2fcf90;
    } else {
        gCurrentSprite.pOam = sGeemerOam_2fce00;
    }
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void GeemerSetIdleGFX(void) {
    if (gCurrentSprite.work0) {
        gCurrentSprite.pOam = sGeemerOam_2fcf28;
    } else {
        gCurrentSprite.pOam = sGeemerOam_2fcd98;
    }
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void GeemerCheckShouldHide(void) {
    if (!(gCurrentSprite.properties & SP_CAN_ABSORB_X)) {
        if (gChangedInput != KEY_NONE) {
            gCurrentSprite.work1 = 0;
        }
        if (gCurrentSprite.work1 <= 120) {
            if (SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_TO_SUB_PIXEL(5), BLOCK_TO_SUB_PIXEL(5)) != NSLR_OUT_OF_RANGE) {
                gCurrentSprite.pose = 0x42;
                if (gCurrentSprite.work0) {
                    gCurrentSprite.pOam = sGeemerOam_2fd058;
                    gCurrentSprite.hitboxTop = PIXEL_TO_SUB_PIXEL(-10);
                    gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(10);
                } else {
                    gCurrentSprite.pOam = sGeemerOam_2fcec8;
                    gCurrentSprite.hitboxLeft = PIXEL_TO_SUB_PIXEL(-10);
                    gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(10);
                }
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work1 = 10;
                SoundPlayNotAlreadyPlaying(0x165);
            }
        }
    }
}

void GeemerDelayBeforeHiding(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x44;
    }
}

void GeemerHiding(void) {
    GeemerCheckCollisions();
    if (gPreviousCollisionCheck == 0) {
        gCurrentSprite.pose = 0x15;
    } else {
        if (gChangedInput != KEY_NONE) {
            gCurrentSprite.work1 = 0;
        } else {
            gCurrentSprite.work1 += 1;
        }
        if (gCurrentSprite.work1 > 120) {
            gCurrentSprite.pose = 0x46;
            if (gCurrentSprite.work0) {
                gCurrentSprite.pOam = sGeemerOam_2fd098;
            } else {
                gCurrentSprite.pOam = sGeemerOam_2fcf08;
            }
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            SoundPlayNotAlreadyPlaying(0x166);
        }
    }
}

void GeemerUncovering(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        GeemerSetHitbox();
        GeemerSetIdleGFX();
        gCurrentSprite.pose = 8;
    }
}

void GeemerTurningIntoX(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.xPosition -= PIXEL_TO_SUB_PIXEL(8);
        } else {
            gCurrentSprite.xPosition += PIXEL_TO_SUB_PIXEL(8);
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            gCurrentSprite.yPosition += PIXEL_TO_SUB_PIXEL(8);
        } else {
            gCurrentSprite.yPosition -= PIXEL_TO_SUB_PIXEL(8);
        }
    }
}

void GeemerInit(void) {
    u16 flashingLightY;
    u16 flashingLightX;
    u8 flashingLightSlot;

    SpriteUtilTrySetAbsorbXFlag();
    if ((gCurrentSprite.properties & SP_CAN_ABSORB_X) && (!(gCurrentSprite.status & SS_HIDDEN))) {
        gCurrentSprite.status = 0;
    } else {
        if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
            gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        } else {
            gCurrentSprite.pose = 2;
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                // on floor
                gCurrentSprite.work0 = FALSE;
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_TO_SUB_PIXEL(17), gCurrentSprite.xPosition);
                if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                    // on ceiling
                    gCurrentSprite.work0 = FALSE;
                    gCurrentSprite.status |= SS_Y_FLIP;
                    gCurrentSprite.yPosition -= BLOCK_SIZE;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_TO_SUB_PIXEL(8), gCurrentSprite.xPosition - PIXEL_TO_SUB_PIXEL(9));
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                        // on left wall
                        gCurrentSprite.work0 = TRUE;
                        gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                        gCurrentSprite.xPosition -= HALF_BLOCK_SIZE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_TO_SUB_PIXEL(8), gCurrentSprite.xPosition + PIXEL_TO_SUB_PIXEL(8));
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                            // on right wall
                            gCurrentSprite.work0 = TRUE;
                            gCurrentSprite.status |= SS_X_FLIP;
                            gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                            gCurrentSprite.xPosition += HALF_BLOCK_SIZE;
                        } else {
                            // can't be placed in midair
                            gCurrentSprite.status = 0;
                            return;
                        }
                    }
                }
            }
            if (gCurrentSprite.work0) {
                if (gCurrentSprite.status & SS_X_FLIP) {
                    flashingLightY = gCurrentSprite.yPosition;
                    flashingLightX = gCurrentSprite.xPosition - PIXEL_TO_SUB_PIXEL(9);
                } else {
                    flashingLightY = gCurrentSprite.yPosition;
                    flashingLightX = gCurrentSprite.xPosition + PIXEL_TO_SUB_PIXEL(9);
                }
            } else {
                if (gCurrentSprite.status & SS_Y_FLIP) {
                    flashingLightY = gCurrentSprite.yPosition + PIXEL_TO_SUB_PIXEL(9);
                    flashingLightX = gCurrentSprite.xPosition;
                } else {
                    flashingLightY = gCurrentSprite.yPosition - PIXEL_TO_SUB_PIXEL(9);
                    flashingLightX = gCurrentSprite.xPosition;
                }
            }
            flashingLightSlot = SpriteSpawnSecondary(SSPRITE_GEEMER_FLASHING_LIGHT, gCurrentSprite.roomSlot,
                gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, flashingLightY, flashingLightX, 0);
            if (flashingLightSlot == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
            gCurrentSprite.work2 = flashingLightSlot;
        }
        GeemerSetCrawlingGFX();
        GeemerSetHitbox();
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.work1 = 0;
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    }
}

void GeemerCrawlingInit(void) {
    GeemerSetCrawlingGFX();
    gCurrentSprite.pose = 2;
}

void GeemerCrawling(void) {
    u8 turnAround;

    turnAround = FALSE;
    GeemerCheckCollisions();
    if (gPreviousCollisionCheck == 0) {
        gCurrentSprite.pose = 0x15;
    } else {
        if (gCurrentSprite.work0) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                if (gCurrentSprite.status & SS_FACING_RIGHT) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition + PIXEL_SIZE);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition - PIXEL_SIZE);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.yPosition += PIXEL_TO_SUB_PIXEL(.25f);
                            gSpriteData[gCurrentSprite.work2].yPosition += PIXEL_TO_SUB_PIXEL(.25f);
                        }
                    }
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition + PIXEL_SIZE);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition - PIXEL_SIZE);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.yPosition -= PIXEL_TO_SUB_PIXEL(.25f);
                            gSpriteData[gCurrentSprite.work2].yPosition -= PIXEL_TO_SUB_PIXEL(.25f);
                        }
                    }
                }
            } else {
                if (gCurrentSprite.status & SS_FACING_RIGHT) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition - PIXEL_SIZE);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition + PIXEL_SIZE);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.yPosition += PIXEL_TO_SUB_PIXEL(.25f);
                            gSpriteData[gCurrentSprite.work2].yPosition += PIXEL_TO_SUB_PIXEL(.25f);
                        }
                    }
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition - PIXEL_SIZE);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition + PIXEL_SIZE);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.yPosition -= PIXEL_TO_SUB_PIXEL(.25f);
                            gSpriteData[gCurrentSprite.work2].yPosition -= PIXEL_TO_SUB_PIXEL(.25f);
                        }
                    }
                }
            }
        } else {
            if (gCurrentSprite.status & SS_Y_FLIP) {
                if (gCurrentSprite.status & SS_FACING_RIGHT) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_SIZE, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.xPosition += PIXEL_TO_SUB_PIXEL(.25f);
                            gSpriteData[gCurrentSprite.work2].xPosition += PIXEL_TO_SUB_PIXEL(.25f);
                        }
                    }
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_SIZE, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.xPosition -= PIXEL_TO_SUB_PIXEL(.25f);
                            gSpriteData[gCurrentSprite.work2].xPosition -= PIXEL_TO_SUB_PIXEL(.25f);
                        }
                    }
                }
            } else {
                if (gCurrentSprite.status & SS_FACING_RIGHT) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_SIZE, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.xPosition += PIXEL_TO_SUB_PIXEL(.25f);
                            gSpriteData[gCurrentSprite.work2].xPosition += PIXEL_TO_SUB_PIXEL(.25f);
                        }
                    }
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - PIXEL_SIZE, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.xPosition -= PIXEL_TO_SUB_PIXEL(.25f);
                            gSpriteData[gCurrentSprite.work2].xPosition -= PIXEL_TO_SUB_PIXEL(.25f);
                        }
                    }
                }
            }
        }
        if (turnAround) {
            gCurrentSprite.status ^= SS_FACING_RIGHT;
            gCurrentSprite.pose = 7;
        }
        GeemerCheckShouldHide();
    }
}

void GeemerIdleInit(void) {
    gCurrentSprite.pose = 8;
    GeemerSetIdleGFX();
}

void GeemerIdle(void) {
    GeemerCheckCollisions();
    if (gPreviousCollisionCheck == 0) {
        gCurrentSprite.pose = 0x15;
    } else {
        if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
            gCurrentSprite.pose = 1;
        }
        GeemerCheckShouldHide();
    }
}

void GeemerFallingInit(void) {
    gCurrentSprite.pose = 0x16;
    gCurrentSprite.work4 = 0;
    GeemerSetHitbox();
    GeemerSetIdleGFX();
}

void GeemerFalling(void) {
    u16 yCollisionPoint;
    u16 xCollisionPoint;
    u32 blockTop;
    u8 onWall;
    u8 offset;
    s16 movement;
    u32 flashingLightSlot;

    onWall = 0;
    yCollisionPoint = gCurrentSprite.yPosition;
    xCollisionPoint = gCurrentSprite.xPosition;
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            xCollisionPoint -= PIXEL_SIZE;
        }
        yCollisionPoint += gCurrentSprite.hitboxBottom;
    }
    else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            yCollisionPoint += gCurrentSprite.hitboxBottom;
        }
    }
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(yCollisionPoint, xCollisionPoint);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
        gCurrentSprite.yPosition = blockTop;
        if (gCurrentSprite.work0) {
            onWall += 1;
        }
        gCurrentSprite.status &= ~SS_Y_FLIP;
        gCurrentSprite.work0 = 0;
        GeemerSetHitbox();
        if (onWall)
        {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxRight;
            else
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxLeft;
        }
        if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
        {
            gCurrentSprite.pose = 2;
            GeemerSetCrawlingGFX();
        }
        else
        {
            gCurrentSprite.pose = 8;
            GeemerSetIdleGFX();
            flashingLightSlot = gCurrentSprite.work2;
            gSpriteData[flashingLightSlot].yPosition = gCurrentSprite.yPosition - PIXEL_TO_SUB_PIXEL(9);
            gSpriteData[flashingLightSlot].xPosition = gCurrentSprite.xPosition;
            gSpriteData[flashingLightSlot].hitboxTop = PIXEL_TO_SUB_PIXEL(-3);
            gSpriteData[flashingLightSlot].hitboxBottom = PIXEL_TO_SUB_PIXEL(8);
            gSpriteData[flashingLightSlot].hitboxLeft = PIXEL_TO_SUB_PIXEL(-3);
            gSpriteData[flashingLightSlot].hitboxRight = PIXEL_TO_SUB_PIXEL(3);
        }
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

void Geemer(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4) {
        SoundPlayNotAlreadyPlaying(0x164);
    }
    if (gCurrentSprite.freezeTimer != 0) {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdateSecondarySpritesFreezeTimer(SSPRITE_GEEMER_FLASHING_LIGHT, gCurrentSprite.primarySpriteRamSlot);
        return;
    }
    switch(gCurrentSprite.pose) {
        case 0:
            GeemerInit();
            break;
        case 1:
            GeemerCrawlingInit();
        case 2:
            GeemerCrawling();
            break;
        case 7:
            GeemerIdleInit();
        case 8:
            GeemerIdle();
            break;
        case 0x15:
            GeemerFallingInit();
        case 0x16:
            GeemerFalling();
            break;
        case 0x42:
            GeemerDelayBeforeHiding();
            break;
        case 0x44:
            GeemerHiding();
            break;
        case 0x46:
            GeemerUncovering();
            break;
        case 0x57:
            SpriteUtilUnfreezeSecondarySprites(SSPRITE_GEEMER_FLASHING_LIGHT, gCurrentSprite.primarySpriteRamSlot);
            SpriteDyingInit();
        case 0x58:
            SpriteDying();
            break;
        case 0x59:
            GeemerInit();
        case 0x5a:
            SpriteSpawningFromX();
            break;
        case 0x5b:
            GeemerTurningIntoX();
            XParasiteInit();
    }
}

void GeemerFlashingLight(void) {
    u32 geemerSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.freezeTimer != 0) {
        SpriteUtilUpdateFreezeTimer();
        SpriteUtilUpdatePrimarySpriteFreezeTimer();
        return;
    }
    geemerSlot = gCurrentSprite.primarySpriteRamSlot;
    if (gCurrentSprite.pose == 0) {
        gCurrentSprite.drawOrder = 3;
        gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
        gCurrentSprite.drawDistanceTop = 3;
        gCurrentSprite.drawDistanceBottom = 3;
        gCurrentSprite.drawDistanceHorizontal = 3;
        gCurrentSprite.pOam = sGeemerOam_2fcd78;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = 2;
        if (gSpriteData[geemerSlot].work0) {
            if (gSpriteData[geemerSlot].status & SS_X_FLIP) {
                gCurrentSprite.hitboxTop = PIXEL_TO_SUB_PIXEL(-3);
                gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(3);
                gCurrentSprite.hitboxLeft = PIXEL_TO_SUB_PIXEL(-3);
                gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(8);
            } else {
                gCurrentSprite.hitboxTop = PIXEL_TO_SUB_PIXEL(-3);
                gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(3);
                gCurrentSprite.hitboxLeft = PIXEL_TO_SUB_PIXEL(-8);
                gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(3);
            }
        } else {
            if (gSpriteData[geemerSlot].status & SS_Y_FLIP) {
                gCurrentSprite.hitboxTop = PIXEL_TO_SUB_PIXEL(-8);
                gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(3);
                gCurrentSprite.hitboxLeft = PIXEL_TO_SUB_PIXEL(-3);
                gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(3);
            } else {
                gCurrentSprite.hitboxTop = PIXEL_TO_SUB_PIXEL(-3);
                gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(8);
                gCurrentSprite.hitboxLeft = PIXEL_TO_SUB_PIXEL(-3);
                gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(3);
            }
        }
    }
    if (gSpriteData[geemerSlot].status & SS_HIDDEN) {
        gCurrentSprite.status |= SS_HIDDEN;
    } else {
        gCurrentSprite.status &= ~SS_HIDDEN;
        if (gCurrentSprite.health == 0 && gSpriteData[geemerSlot].pose < 0x57) {
            gSpriteData[geemerSlot].pose = 0x57;
            gSpriteData[geemerSlot].ignoreSamusCollisionTimer = 1;
            gSpriteData[geemerSlot].health = 0;
            gSpriteData[geemerSlot].properties |= SP_DESTROYED;
            gSpriteData[geemerSlot].freezeTimer = 0;
            gSpriteData[geemerSlot].paletteRow = 0;
            gCurrentSprite.status = 0;
        } else {
            switch (gSpriteData[geemerSlot].pose) {
                case 0x44:
                    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
                    break;
                default:
                    gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
                    break;
                case 0x57:
                case 0x58:
                    gCurrentSprite.status = 0;
            }
        }
    }
}
