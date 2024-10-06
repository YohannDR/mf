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
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 4);
        }
    } else {
        if (gCurrentSprite.status & SPRITE_STATUS_Y_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition);
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        }
    }
}

void GeemerSetHitbox(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            gCurrentSprite.hitboxTop = -0x30;
            gCurrentSprite.hitboxBottom = 0x30;
            gCurrentSprite.hitboxLeft = -0x30;
            gCurrentSprite.hitboxRight = 0;
        } else {
            gCurrentSprite.hitboxTop = -0x30;
            gCurrentSprite.hitboxBottom = 0x30;
            gCurrentSprite.hitboxLeft = 0;
            gCurrentSprite.hitboxRight = 0x30;
        }
    } else {
        if (gCurrentSprite.status & SPRITE_STATUS_Y_FLIP) {
            gCurrentSprite.hitboxTop = 0;
            gCurrentSprite.hitboxBottom = 0x28;
            gCurrentSprite.hitboxLeft = -0x30;
            gCurrentSprite.hitboxRight = 0x30;
        } else {
            gCurrentSprite.hitboxTop = -0x28;
            gCurrentSprite.hitboxBottom = 0;
            gCurrentSprite.hitboxLeft = -0x30;
            gCurrentSprite.hitboxRight = 0x30;
        }
    }
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
}

void GeemerSetCrawlingGFX(void) {
    if (gCurrentSprite.work0) {
        gCurrentSprite.pOam = sFrameData_2fcf90;
    } else {
        gCurrentSprite.pOam = sFrameData_2fce00;
    }
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void GeemerSetIdleGFX(void) {
    if (gCurrentSprite.work0) {
        gCurrentSprite.pOam = sFrameData_2fcf28;
    } else {
        gCurrentSprite.pOam = sFrameData_2fcd98;
    }
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void GeemerCheckShouldHide(void) {
    if (!(gCurrentSprite.properties & 2)) {
        if (gChangedInput != KEY_NONE) {
            gCurrentSprite.work1 = 0;
        }
        if (gCurrentSprite.work1 <= 120) {
            if (SpriteUtilCheckSamusNearSpriteLeftRight(0x140, 0x140) != NSLR_OUT_OF_RANGE) {
                gCurrentSprite.pose = 0x42;
                if (gCurrentSprite.work0) {
                    gCurrentSprite.pOam = sFrameData_2fd058;
                    gCurrentSprite.hitboxTop = -0x28;
                    gCurrentSprite.hitboxBottom = 0x28;
                } else {
                    gCurrentSprite.pOam = sFrameData_2fcec8;
                    gCurrentSprite.hitboxLeft = -0x28;
                    gCurrentSprite.hitboxRight = 0x28;
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
                gCurrentSprite.pOam = sFrameData_2fd098;
            } else {
                gCurrentSprite.pOam = sFrameData_2fcf08;
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
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            gCurrentSprite.xPosition -= 0x20;
        } else {
            gCurrentSprite.xPosition += 0x20;
        }
    } else {
        if (gCurrentSprite.status & SPRITE_STATUS_Y_FLIP) {
            gCurrentSprite.yPosition += 0x20;
        } else {
            gCurrentSprite.yPosition -= 0x20;
        }
    }
}

void GeemerInit(void) {
    u16 flashingLightY;
    u16 flashingLightX;
    u8 flashingLightSlot;

    SpriteUtilTrySetAbsorbXFlag();
    if ((gCurrentSprite.properties & SP_CAN_ABSORB_X) && (!(gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000))) {
        gCurrentSprite.status = 0;
    } else {
        if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
            gCurrentSprite.xParasiteTimer = 0x2c;
        } else {
            gCurrentSprite.pose = 2;
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                gCurrentSprite.work0 = FALSE;
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x44, gCurrentSprite.xPosition);
                if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                    gCurrentSprite.work0 = FALSE;
                    gCurrentSprite.status |= SPRITE_STATUS_Y_FLIP;
                    gCurrentSprite.yPosition -= BLOCK_SIZE;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x24);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                        gCurrentSprite.work0 = TRUE;
                        gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                        gCurrentSprite.xPosition -= HALF_BLOCK_SIZE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x20);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                            gCurrentSprite.work0 = TRUE;
                            gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
                            gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;
                            gCurrentSprite.xPosition += HALF_BLOCK_SIZE;
                        } else {
                            gCurrentSprite.status = 0;
                            return;
                        }
                    }
                }
            }
            if (gCurrentSprite.work0) {
                if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
                    flashingLightY = gCurrentSprite.yPosition;
                    flashingLightX = gCurrentSprite.xPosition - 0x24;
                } else {
                    flashingLightY = gCurrentSprite.yPosition;
                    flashingLightX = gCurrentSprite.xPosition + 0x24;
                }
            } else {
                if (gCurrentSprite.status & SPRITE_STATUS_Y_FLIP) {
                    flashingLightY = gCurrentSprite.yPosition + 0x24;
                    flashingLightX = gCurrentSprite.xPosition;
                } else {
                    flashingLightY = gCurrentSprite.yPosition - 0x24;
                    flashingLightX = gCurrentSprite.xPosition;
                }
            }
            flashingLightSlot = SpriteSpawnSecondary(SSPRITE_GEEMER_FLASHING_LIGHT, gCurrentSprite.roomSlot,
                gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, flashingLightY, flashingLightX, 0);
            if (flashingLightSlot == 0xff) {
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
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
                if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition + 4);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition - 4);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.yPosition += 1;
                            gSpriteData[gCurrentSprite.work2].yPosition += 1;
                        }
                    }
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition + 4);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition - 4);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.yPosition -= 1;
                            gSpriteData[gCurrentSprite.work2].yPosition -= 1;
                        }
                    }
                }
            } else {
                if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition - 4);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom, gCurrentSprite.xPosition + 4);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.yPosition += 1;
                            gSpriteData[gCurrentSprite.work2].yPosition += 1;
                        }
                    }
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition - 4);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition + 4);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.yPosition -= 1;
                            gSpriteData[gCurrentSprite.work2].yPosition -= 1;
                        }
                    }
                }
            }
        } else {
            if (gCurrentSprite.status & SPRITE_STATUS_Y_FLIP) {
                if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.xPosition += 1;
                            gSpriteData[gCurrentSprite.work2].xPosition += 1;
                        }
                    }
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.xPosition -= 1;
                            gSpriteData[gCurrentSprite.work2].xPosition -= 1;
                        }
                    }
                }
            } else {
                if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT) {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.xPosition += 1;
                            gSpriteData[gCurrentSprite.work2].xPosition += 1;
                        }
                    }
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                    if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)) {
                        turnAround = TRUE;
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
                        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F) {
                            turnAround = TRUE;
                        } else {
                            gCurrentSprite.xPosition -= 1;
                            gSpriteData[gCurrentSprite.work2].xPosition -= 1;
                        }
                    }
                }
            }
        }
        if (turnAround) {
            gCurrentSprite.status ^= 0x200;
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
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            xCollisionPoint -= 4;
        }
        yCollisionPoint += gCurrentSprite.hitboxBottom;
    }
    else {
        if (gCurrentSprite.status & SPRITE_STATUS_Y_FLIP) {
            yCollisionPoint += gCurrentSprite.hitboxBottom;
        }
    }
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(yCollisionPoint, xCollisionPoint);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
        gCurrentSprite.yPosition = blockTop;
        if (gCurrentSprite.work0) {
            onWall += 1;
        }
        gCurrentSprite.status &= ~SPRITE_STATUS_Y_FLIP;
        gCurrentSprite.work0 = 0;
        GeemerSetHitbox();
        if (onWall)
        {
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
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
            gSpriteData[flashingLightSlot].yPosition = gCurrentSprite.yPosition - 0x24;
            gSpriteData[flashingLightSlot].xPosition = gCurrentSprite.xPosition;
            gSpriteData[flashingLightSlot].hitboxTop = -0xc;
            gSpriteData[flashingLightSlot].hitboxBottom = 0x20;
            gSpriteData[flashingLightSlot].hitboxLeft = -0xc;
            gSpriteData[flashingLightSlot].hitboxRight = 0xc;
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

#ifdef NON_MATCHING
void GeemerFlashingLight(void) {
    // https://decomp.me/scratch/3B0Ca

    u32 geemerSlot;
    s32 geemerPose;

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
        gCurrentSprite.pOam = sFrameData_2fcd78;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = 0;
        gCurrentSprite.pose = 2;
        if (gSpriteData[geemerSlot].work0) {
            if (gSpriteData[geemerSlot].status & SPRITE_STATUS_X_FLIP) {
                gCurrentSprite.hitboxTop = -0xc;
                gCurrentSprite.hitboxBottom = 0xc;
                gCurrentSprite.hitboxLeft = -0xc;
                gCurrentSprite.hitboxRight = 0x20;
            } else {
                gCurrentSprite.hitboxTop = -0xc;
                gCurrentSprite.hitboxBottom = 0xc;
                gCurrentSprite.hitboxLeft = -0x20;
                gCurrentSprite.hitboxRight = 0xc;
            }
        } else {
            if (gSpriteData[geemerSlot].status & SPRITE_STATUS_Y_FLIP) {
                gCurrentSprite.hitboxTop = -0x20;
                gCurrentSprite.hitboxBottom = 0xc;
                gCurrentSprite.hitboxLeft = -0xc;
                gCurrentSprite.hitboxRight = 0xc;
            } else {
                gCurrentSprite.hitboxTop = -0xc;
                gCurrentSprite.hitboxBottom = 0x20;
                gCurrentSprite.hitboxLeft = -0xc;
                gCurrentSprite.hitboxRight = 0xc;
            }
        }
    }
    if (gSpriteData[geemerSlot].status & SPRITE_STATUS_UNKNOWN_2000) {
        gCurrentSprite.status |= SPRITE_STATUS_UNKNOWN_2000;
    } else {
        gCurrentSprite.status &= ~SPRITE_STATUS_UNKNOWN_2000;
        if (gCurrentSprite.health == 0 && gSpriteData[geemerSlot].pose < 0x57) {
            gSpriteData[geemerSlot].pose = 0x57;
            gSpriteData[geemerSlot].ignoreSamusCollisionTimer = 1;
            gSpriteData[geemerSlot].health = 0;
            gSpriteData[geemerSlot].properties |= SP_DESTROYED;
            gSpriteData[geemerSlot].freezeTimer = 0;
            gSpriteData[geemerSlot].paletteRow = 0;
            gCurrentSprite.status = 0;
        } else {
            geemerPose = gSpriteData[geemerSlot].pose;
            if (geemerPose == 0x44) {
                goto hidden;
            }
            if (geemerPose < 0x44) {
                goto shown;
            }
            if (geemerPose > 0x58) {
                goto shown;
            }
            if (geemerPose < 0x57) {
                goto shown;
            }
            gCurrentSprite.status = 0;
            return;
            hidden:
            gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
            return;
            shown:
            gCurrentSprite.status &= ~SPRITE_STATUS_IGNORE_PROJECTILES;
        }
    }
}
#else
NAKED_FUNCTION
void GeemerFlashingLight(void) {
    asm(" \n\
    push {r4, r5, r6, r7, lr} \n\
	ldr r1, _080236B0 @ =gCurrentSprite \n\
	add r2, r1, #0 \n\
	add r2, #0x26 \n\
	movs r0, #1 \n\
	strb r0, [r2] \n\
	add r0, r1, #0 \n\
	add r0, #0x32 \n\
	ldrb r0, [r0] \n\
	add r3, r1, #0 \n\
	cmp r0, #0 \n\
	beq _080236B4 \n\
	bl SpriteUtilUpdateFreezeTimer \n\
	bl SpriteUtilUpdatePrimarySpriteFreezeTimer \n\
	b _08023812 \n\
	.align 2, 0 \n\
_080236B0: .4byte gCurrentSprite \n\
_080236B4: \n\
	add r0, r3, #0 \n\
	add r0, #0x23 \n\
	ldrb r5, [r0] \n\
	add r6, r3, #0 \n\
	add r6, #0x24 \n\
	ldrb r4, [r6] \n\
	ldr r7, _08023724 @ =gSpriteData \n\
	cmp r4, #0 \n\
	bne _08023772 \n\
	sub r0, #1 \n\
	movs r1, #3 \n\
	strb r1, [r0] \n\
	ldr r2, _08023728 @ =sSecondarySpriteStats \n\
	ldrb r0, [r3, #0x1d] \n\
	lsl r0, r0, #3 \n\
	add r0, r0, r2 \n\
	ldrh r0, [r0] \n\
	movs r2, #0 \n\
	strh r0, [r3, #0x14] \n\
	add r0, r3, #0 \n\
	add r0, #0x27 \n\
	strb r1, [r0] \n\
	add r0, #1 \n\
	strb r1, [r0] \n\
	add r0, #1 \n\
	strb r1, [r0] \n\
	ldr r0, _0802372C @ =sFrameData_2fcd78 \n\
	str r0, [r3, #0x18] \n\
	strb r2, [r3, #0x1c] \n\
	strh r4, [r3, #0x16] \n\
	add r0, r3, #0 \n\
	add r0, #0x25 \n\
	strb r2, [r0] \n\
	movs r0, #2 \n\
	strb r0, [r6] \n\
	lsl r0, r5, #3 \n\
	sub r0, r0, r5 \n\
	lsl r0, r0, #3 \n\
	add r1, r0, r7 \n\
	add r0, r1, #0 \n\
	add r0, #0x2d \n\
	ldrb r0, [r0] \n\
	cmp r0, #0 \n\
	beq _08023744 \n\
	ldrh r1, [r1] \n\
	movs r0, #0x40 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	beq _08023734 \n\
	ldr r0, _08023730 @ =0x0000FFF4 \n\
	strh r0, [r3, #0xa] \n\
	movs r1, #0xc \n\
	strh r1, [r3, #0xc] \n\
	strh r0, [r3, #0xe] \n\
	movs r0, #0x20 \n\
	b _08023770 \n\
	.align 2, 0 \n\
_08023724: .4byte gSpriteData \n\
_08023728: .4byte sSecondarySpriteStats \n\
_0802372C: .4byte sFrameData_2fcd78 \n\
_08023730: .4byte 0x0000FFF4 \n\
_08023734: \n\
	ldr r0, _08023740 @ =0x0000FFF4 \n\
	strh r0, [r3, #0xa] \n\
	movs r1, #0xc \n\
	strh r1, [r3, #0xc] \n\
	sub r0, #0x14 \n\
	b _0802375A \n\
	.align 2, 0 \n\
_08023740: .4byte 0x0000FFF4 \n\
_08023744: \n\
	ldrh r1, [r1] \n\
	movs r0, #0x80 \n\
	lsl r0, r0, #1 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	beq _08023764 \n\
	ldr r0, _08023760 @ =0x0000FFE0 \n\
	strh r0, [r3, #0xa] \n\
	movs r1, #0xc \n\
	strh r1, [r3, #0xc] \n\
	add r0, #0x14 \n\
_0802375A: \n\
	strh r0, [r3, #0xe] \n\
	strh r1, [r3, #0x10] \n\
	b _08023772 \n\
	.align 2, 0 \n\
_08023760: .4byte 0x0000FFE0 \n\
_08023764: \n\
	ldr r0, _08023794 @ =0x0000FFF4 \n\
	strh r0, [r3, #0xa] \n\
	movs r1, #0x20 \n\
	strh r1, [r3, #0xc] \n\
	strh r0, [r3, #0xe] \n\
	movs r0, #0xc \n\
_08023770: \n\
	strh r0, [r3, #0x10] \n\
_08023772: \n\
	lsl r2, r5, #3 \n\
	sub r0, r2, r5 \n\
	lsl r0, r0, #3 \n\
	add r0, r0, r7 \n\
	mov ip, r0 \n\
	ldrh r1, [r0] \n\
	movs r4, #0x80 \n\
	lsl r4, r4, #6 \n\
	add r0, r4, #0 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	beq _08023798 \n\
	ldrh r1, [r3] \n\
	add r0, r4, #0 \n\
	orr r0, r1 \n\
	b _08023810 \n\
	.align 2, 0 \n\
_08023794: .4byte 0x0000FFF4 \n\
_08023798: \n\
	ldrh r1, [r3] \n\
	ldr r0, _080237DC @ =0x0000DFFF \n\
	and r0, r1 \n\
	movs r6, #0 \n\
	strh r0, [r3] \n\
	ldrh r4, [r3, #0x14] \n\
	cmp r4, #0 \n\
	bne _080237E0 \n\
	mov r1, ip \n\
	add r1, #0x24 \n\
	ldrb r0, [r1] \n\
	cmp r0, #0x56 \n\
	bhi _080237E0 \n\
	movs r0, #0x57 \n\
	strb r0, [r1] \n\
	add r1, #2 \n\
	movs r0, #1 \n\
	strb r0, [r1] \n\
	mov r0, ip \n\
	strh r4, [r0, #0x14] \n\
	mov r2, ip \n\
	add r2, #0x34 \n\
	ldrb r1, [r2] \n\
	movs r0, #0x10 \n\
	orr r0, r1 \n\
	strb r0, [r2] \n\
	mov r0, ip \n\
	add r0, #0x32 \n\
	strb r6, [r0] \n\
	sub r0, #0x12 \n\
	strb r6, [r0] \n\
	strh r4, [r3] \n\
	b _08023812 \n\
	.align 2, 0 \n\
_080237DC: .4byte 0x0000DFFF \n\
_080237E0: \n\
	sub r0, r2, r5 \n\
	lsl r0, r0, #3 \n\
	add r0, r0, r7 \n\
	add r0, #0x24 \n\
	ldrb r0, [r0] \n\
	cmp r0, #0x44 \n\
	beq _080237FE \n\
	cmp r0, #0x44 \n\
	blt _0802380A \n\
	cmp r0, #0x58 \n\
	bgt _0802380A \n\
	cmp r0, #0x57 \n\
	blt _0802380A \n\
	movs r0, #0 \n\
	b _08023810 \n\
_080237FE: \n\
	ldrh r1, [r3] \n\
	movs r2, #0x80 \n\
	lsl r2, r2, #8 \n\
	add r0, r2, #0 \n\
	orr r0, r1 \n\
	b _08023810 \n\
_0802380A: \n\
	ldrh r1, [r3] \n\
	ldr r0, _08023818 @ =0x00007FFF \n\
	and r0, r1 \n\
_08023810: \n\
	strh r0, [r3] \n\
_08023812: \n\
	pop {r4, r5, r6, r7} \n\
	pop {r0} \n\
	bx r0 \n\
	.align 2, 0 \n\
_08023818: .4byte 0x00007FFF \n\
    ");
}
#endif
