#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "data/frame_data_pointers.h"
#include "data/sprite_data.h"
#include "data/sprites/core_x.h"
#include "data/sprites/yakuza.h"
#include "data/sprites/x_parasite.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/samus.h"

#include "structs/samus.h"

void YakuzaSyncSubSprites(void) {
    MultiSpriteDataInfo_T pData = gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].pData;
    u16 oamIdx = pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX];
    if (gCurrentSprite.pOam != sYakuzaFrameDataPointers[oamIdx]) {
        gCurrentSprite.pOam = sYakuzaFrameDataPointers[oamIdx];
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
    gCurrentSprite.yPosition = gSubSpriteData1.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];
    gCurrentSprite.xPosition = gSubSpriteData1.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
}

void YakuzaUpdatePalette(void) {
    u32 update = FALSE;
    u16 health = gCurrentSprite.health;
    u16 maxHealth = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    u16* pPal;

    switch (gBossWork1) {
        case 0:
            if (health <= maxHealth * 2 / 3) {
                pPal = (u16*)sYakuzaPal[2];
                gBossWork1 = 1;
                update = TRUE;
            }
            break;
        case 1:
            if (health <= maxHealth / 4) {
                pPal = (u16*)sYakuzaPal[3];
                gBossWork1 = 2;
                update = TRUE;
            }
            break;
    }
    if (update)
        DMA_SET(3, pPal, PALRAM_OBJ + 8 * 32, C_32_2_16(DMA_ENABLE, 1 * 16))
}

u8 YakuzaUpdateGrabbedSamus(void) {
    if (gSamusData.pose == SPOSE_GRABBED_BY_YAKUZA) {
        gSamusData.yPosition = gSubSpriteData1.yPosition + 0xc0;
        gSamusData.xPosition = gSubSpriteData1.xPosition;
        SpriteUtilTakeConstantDamageFromYakuza();
        return TRUE;
    }
    return FALSE;
}

u8 YakuzaCheckCollidingWithRightWall(void) {
    // Checks for X position relative to BG1(!)
    if ((u16)(SUB_PIXEL_TO_PIXEL_(gSubSpriteData1.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition)) >= SCREEN_SIZE_X - 0x18)
        return TRUE;
    return FALSE;
}

u8 YakuzaCheckCollidingWithLeftWall(void) {
    if ((u16)(SUB_PIXEL_TO_PIXEL_(gSubSpriteData1.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition)) <= 0x18)
        return TRUE;
    return FALSE;
}

u8 YakuzaCheckCollidingWithFloor(void) {
    if (gSubSpriteData1.yPosition > 0x73e)
        return TRUE;
    return FALSE;
}

u8 YakuzaCheckCollidingWithCeiling(void) {
    if (gSamusData.pose == SPOSE_GRABBED_BY_YAKUZA)
        if (gSubSpriteData1.yPosition >= 0x400)
            return FALSE;
        else
            return TRUE;
    else
        if (gSubSpriteData1.yPosition >= 0x600)
            return FALSE;
        else
            return TRUE;
}

u8 YakuzaXMovement(u16 movement) {
    u8 collided;
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        collided = YakuzaCheckCollidingWithRightWall();
        if (!collided)
            gSubSpriteData1.xPosition += movement;
    } else {
        collided = YakuzaCheckCollidingWithLeftWall();
        if (!collided)
            gSubSpriteData1.xPosition -= movement;
    }
    return collided;
}

u8 YakuzaYMovement(u16 movement) {
    u8 collided;
    if (gCurrentSprite.status & SS_FACING_DOWN) {
        collided = YakuzaCheckCollidingWithFloor();
        if (!collided)
            gSubSpriteData1.yPosition += movement;
        else {
            gCurrentSprite.status &= ~SS_FACING_DOWN; // bruh
            collided = FALSE;
        }
    } else {
        collided = YakuzaCheckCollidingWithCeiling();
        if (!collided)
            gSubSpriteData1.yPosition -= movement;
    }
    return collided;
}

void YakuzaGrabbedSamusInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0f98;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x28;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.status &= ~SS_FACING_DOWN;
    SoundPlay(0x13f);
}

void YakuzaGrabbedSamus(void) {
    if (!YakuzaUpdateGrabbedSamus()) {
        gCurrentSprite.pose = 0x2f;
        return;
    }
    if (gCurrentSprite.work2 == 0) {
        if (SpriteUtilCheckEndSubSprite1Anim()) {
            gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1178;
            gSubSpriteData1.animationDurationCounter = 0;
            gSubSpriteData1.currentAnimationFrame = 0;
            gCurrentSprite.work2 += 1;
        }
    } else {
        if (SpriteUtilCheckEndSubSprite1Anim()) {
            gCurrentSprite.pose = 0x2a;
            gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1188;
            gSubSpriteData1.animationDurationCounter = 0;
            gSubSpriteData1.currentAnimationFrame = 0;
            gCurrentSprite.work2 = 0;
        }
    }
}

void YakuzaPullingSamus(void) {
    if (!YakuzaUpdateGrabbedSamus()) {
        gCurrentSprite.pose = 0x2f;
        return;
    }
    if (gCurrentSprite.work2 == 0) {
        if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 1) {
            SoundPlay(0x136);
        }
        if (YakuzaYMovement(4)) {
            gSubSpriteData1.pMultiOam = sMultiSpriteData_3b11b0;
            gSubSpriteData1.animationDurationCounter = 0;
            gSubSpriteData1.currentAnimationFrame = 0;
            gCurrentSprite.work2 += 1;
        }
    } else {
        if (SpriteUtilCheckEndSubSprite1Anim()) {
            gCurrentSprite.pose = 0x2c;
            gSubSpriteData1.pMultiOam = sMultiSpriteData_3b11c0;
            gSubSpriteData1.animationDurationCounter = 0;
            gSubSpriteData1.currentAnimationFrame = 0;
            gCurrentSprite.work1 = 60;
            gCurrentSprite.status |= SS_FACING_DOWN;
        }
    }
}

void YakuzaHoldingSamusHigh(void) {
    if (!YakuzaUpdateGrabbedSamus()) {
        gCurrentSprite.pose = 0x2f;
        return;
    }
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x2e;
        gCurrentSprite.work4 = 0;
    }
}

void YakuzaSlammingSamus(void) {
    u8 grabbing = YakuzaUpdateGrabbedSamus();
    u8 offset = gCurrentSprite.work4;
    s16 movement = sYakuzaSlammingSpeed[offset];
    u32 blockTop;

    if (movement == SHORT_MAX) {
        movement = sYakuzaSlammingSpeed[offset - 1];
        gSubSpriteData1.yPosition += movement;
    } else {
        offset++;
        gCurrentSprite.work4 = offset;
        gSubSpriteData1.yPosition += movement;
    }
    if (grabbing) {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0xc0, gSubSpriteData1.xPosition);
        if (gPreviousCollisionCheck != 0) {
            SpriteUtilTakeDamageFromYakuzaSlamming();
        }
    }
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gSubSpriteData1.yPosition + 0x48, gSubSpriteData1.xPosition);
    if ((gPreviousVerticalCollisionCheck & 0xf) != 0) {
        gSubSpriteData1.yPosition = blockTop - 0x48;
        gCurrentSprite.pose = 0x2f;
        ScreenShakeStartVertical(60, 0x81);
        ParticleSet(blockTop, gSubSpriteData1.xPosition, PE_OUTWARD_SMOKE);
        ParticleSet(blockTop + 0x3c, gSubSpriteData1.xPosition, PE_OUTWARD_SMOKE);
        SoundPlay(0x13a);
    }
}

void YakuzaReleasingSamusInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0fc0;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x30;
}

void YakuzaReleasingSamus(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim())
        gCurrentSprite.pose = 9;
}

void YakuzaAfterReleasingSamusInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0f28;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0xa;
}

void YakuzaAfterReleasingSamus(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.samusCollision = SSC_YAKUZA_CAN_GRAB;
        gCurrentSprite.pose = 1;
        SpriteUtilMakeSpriteFaceSamusDirection();
    }
}

void YakuzaInit(void) {
    if (gEquipment.suitMiscStatus & SMF_SPACE_JUMP)
        gCurrentSprite.status = 0;
    else {
        gBossWork1 = 0;
        gCurrentSprite.yPosition -= 0x200;
        gSubSpriteData1.yPosition = gCurrentSprite.yPosition;
        gSubSpriteData1.xPosition = gCurrentSprite.xPosition;
        gCurrentSprite.drawDistanceTop = 0x24;
        gCurrentSprite.drawDistanceBottom = 0x24;
        gCurrentSprite.drawDistanceHorizontal = 0x24;
        gCurrentSprite.hitboxTop = -0x40;
        gCurrentSprite.hitboxBottom = 0x60;
        gCurrentSprite.hitboxLeft = -0x48;
        gCurrentSprite.hitboxRight = 0x48;
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
        gCurrentSprite.drawOrder = 12;
        gCurrentSprite.roomSlot = YAKUZA_PART_BODY;
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
        gSubSpriteData1.health = 1;
        gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0f28;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_YAKUZA_CAN_GRAB;
        gCurrentSprite.status |= (SS_HIDDEN | SS_FACING_DOWN);
        gCurrentSprite.work0 = 0;
        gCurrentSprite.pose = 0x37;
        SpriteSpawnSecondary(SSPRITE_YAKUZA_PART, YAKUZA_PART_EYE, 0, gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_YAKUZA_PART, YAKUZA_PART_LEGS, 0, gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    }
}

void YakuzaWaitingToAppear(void) {
    if (gSamusData.yPosition >= 0x700) {
        gCurrentSprite.pose = 0x38;
        gCurrentSprite.work1 = 60;
    }
}

void YakuzaAboutToAppear(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 7;
        gCurrentSprite.status &= ~SS_HIDDEN;
        ScreenShakeStartHorizontal(60, 0x81);
        ScreenShakeStartVertical(60, 0x81);
        gBossWork2 = 1;
        unk_3b1c(0x12f);
    }
}

void YakuzaIdleBeforeNewRoundInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0f28;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 8;
    gCurrentSprite.samusCollision = SSC_YAKUZA_CAN_GRAB;
}

void YakuzaIdleBeforeNewRound(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        if (gCurrentSprite.work0 > 0) {
            gCurrentSprite.work0--;
            gCurrentSprite.pose = 1;
            SpriteUtilMakeSpriteFaceSamusDirection();
        } else
            gCurrentSprite.pose = 0x31;
    }
}

void YakuzaBeginSweepInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0f50;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
}

void YakuzaBeginSweep(void) {
    if (SpriteUtilCheckEndSubSprite1Anim()) {
        gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0f60;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
    }
}

void YakuzaSweeping(void) {
    if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 1)
        SoundPlay(0x136);
    if (YakuzaYMovement(3)) {
        if (SpriteUtilCheckEndSubSprite1Anim()) {
            gCurrentSprite.status |= SS_FACING_DOWN;
            gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0f88;
            gSubSpriteData1.animationDurationCounter = 0;
            gSubSpriteData1.currentAnimationFrame = 0;
            gCurrentSprite.pose = 0x1a;
        }
    } else {
        if (YakuzaXMovement(8))
            gCurrentSprite.status ^= SS_FACING_RIGHT;
    }
}

void YakuzaSweepingEnd(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim())
        gCurrentSprite.pose = 7;
}

void YakuzaOpeningMouthInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b0fe8;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.pose = 0x32;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.hitboxBottom = 0x40;
    gCurrentSprite.hitboxLeft = -0x24;
    gCurrentSprite.hitboxRight = 0x24;
    gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;
    SoundPlay(0x137);
}

void YakuzaOpeningMouth(void) {
    u8 offset;
    switch (gCurrentSprite.work2) {
        case 0: {
            if (SpriteUtilCheckEndSubSprite1Anim()) {
                gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1040;
                gSubSpriteData1.animationDurationCounter = 0;
                gSubSpriteData1.currentAnimationFrame = 0;
                gCurrentSprite.work2++;
                SoundPlay(0x138);
            }
            break;
        }
        case 1: {
            if (SpriteUtilCheckEndSubSprite1Anim()) {
                gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1050;
                gSubSpriteData1.animationDurationCounter = 0;
                gSubSpriteData1.currentAnimationFrame = 0;
                gCurrentSprite.work2++;
                offset = sYakuzaMouthStartGlowingPalOffset[0] - 8;
                DMA_SET(3, sYakuzaMouthGlowingPal[offset], PALRAM_OBJ + 9 * 32, C_32_2_16(DMA_ENABLE, 1 * 16));
                gCurrentSprite.work3 = 0;
                gCurrentSprite.work1 = 3;
            }
            break;
        }
        case 2: {
            if (--gCurrentSprite.work1 == 0) {
                if (gCurrentSprite.work3 <= 16) {
                    gCurrentSprite.work3++;
                    gCurrentSprite.work1 = 3;
                    offset = sYakuzaMouthStartGlowingPalOffset[gCurrentSprite.work3] - 8;
                    DMA_SET(3, sYakuzaMouthGlowingPal[offset], PALRAM_OBJ + 9 * 32, C_32_2_16(DMA_ENABLE, 1 * 16));
                } else {
                    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1060;
                    gSubSpriteData1.animationDurationCounter = 0;
                    gSubSpriteData1.currentAnimationFrame = 0;
                    gCurrentSprite.work2++;
                    offset = sYakuzaMouthGlowingPalOffset[0] - 8;
                    DMA_SET(3, sYakuzaMouthGlowingPal[offset], PALRAM_OBJ + 9 * 32, C_32_2_16(DMA_ENABLE, 1 * 16));
                    gCurrentSprite.work3 = 0;
                    gCurrentSprite.work1 = 4;
                }
            }
            break;
        }
        case 3: {
            if (--gCurrentSprite.work1 == 0) {
                if (gCurrentSprite.work3 <= 10) {
                    gCurrentSprite.work3++;
                    gCurrentSprite.work1 = 4;
                    offset = sYakuzaMouthGlowingPalOffset[gCurrentSprite.work3] - 8;
                    DMA_SET(3, sYakuzaMouthGlowingPal[offset], PALRAM_OBJ + 9 * 32, C_32_2_16(DMA_ENABLE, 1 * 16));
                } else {
                    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1078;
                    gSubSpriteData1.animationDurationCounter = 0;
                    gSubSpriteData1.currentAnimationFrame = 0;
                    gCurrentSprite.work2++;
                    SpriteSpawnSecondary(SSPRITE_YAKUZA_PROJECTILE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
                        gCurrentSprite.yPosition + 0x94, gCurrentSprite.xPosition, 0);
                    SpriteSpawnSecondary(SSPRITE_YAKUZA_PROJECTILE, 1, 0, gCurrentSprite.primarySpriteRamSlot,
                        gCurrentSprite.yPosition + 0x9c, gCurrentSprite.xPosition, 0);
                    SpriteSpawnSecondary(SSPRITE_YAKUZA_PROJECTILE, 1, 0, gCurrentSprite.primarySpriteRamSlot,
                        gCurrentSprite.yPosition + 0x9c, gCurrentSprite.xPosition, SS_X_FLIP);
                    if (gBossWork2) {
                        gBossWork2 = FALSE;
                        PlayMusic(MUSIC_SERRIS_YAKUZA_BATTLE, 7);
                        unk_3b1c(0x130);
                    } else
                        SoundPlay(0x139);
                }
            }
            break;
        }
        case 4: {
            if (SpriteUtilCheckEndSubSprite1Anim()) {
                gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1050;
                gSubSpriteData1.animationDurationCounter = 0;
                gSubSpriteData1.currentAnimationFrame = 0;
                gCurrentSprite.work2++;
                offset = sYakuzaMouthEndGlowingPalOffset[0] - 8;
                DMA_SET(3, sYakuzaMouthGlowingPal[offset], PALRAM_OBJ + 9 * 32, C_32_2_16(DMA_ENABLE, 1 * 16));
                gCurrentSprite.work3 = 0;
                gCurrentSprite.work1 = 2;
            }
            break;
        }
        case 5: {
            if (--gCurrentSprite.work1 == 0) {
                if (gCurrentSprite.work3 <= 5) {
                    gCurrentSprite.work3++;
                    gCurrentSprite.work1 = 2;
                    offset = sYakuzaMouthEndGlowingPalOffset[gCurrentSprite.work3] - 8;
                    DMA_SET(3, sYakuzaMouthGlowingPal[offset], PALRAM_OBJ + 9 * 32, C_32_2_16(DMA_ENABLE, 1 * 16));
                } else {
                    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b10a0;
                    gSubSpriteData1.animationDurationCounter = 0;
                    gSubSpriteData1.currentAnimationFrame = 0;
                    gCurrentSprite.work2++;
                }
            }
            break;
        }
        case 6: {
            if (SpriteUtilCheckNearEndSubSprite1Anim()) {
                u16 maxHealth = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
                if (gCurrentSprite.health < maxHealth / 2) {
                    gCurrentSprite.health = maxHealth / 2; // the evil code that regenerates yakuza to half health
                    gCurrentSprite.pose = 0x1f;
                    gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
                } else {
                    gCurrentSprite.pose = 0x1b;
                }
            }
            break;
        }
    }
}

void YakuzaMouthOpenedInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1000;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x1c;
    gCurrentSprite.work1 = 20;
}

void YakuzaMouthOpened(void) {
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x1d;
}

void YakuzaClosingMouthInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1028;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x1e;
    gCurrentSprite.hitboxBottom = 0x60;
    gCurrentSprite.hitboxLeft = -0x48;
    gCurrentSprite.hitboxRight = 0x48;
    gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
}

void YakuzaClosingMouth(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = 7;
        // Do 1..4 sweeping rounds
        gCurrentSprite.work0 = gSpriteRandomNumber / 4 + 1;
    }
}

void YakuzaPhase1DyingInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b10b0;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x20;
    gCurrentSprite.work1 = 120;
    ParticleSet(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, PE_0x2F);
    unk_3b1c(0x132);
}

void YakuzaPhase1Dying(void) {
    u8 work1;
    if (gSubSpriteData1.yPosition <= 0x63e)
        gSubSpriteData1.yPosition += 4;
    work1 = gCurrentSprite.work1;
    if ((work1 & 3) == 0) {
        if (work1 & 4)
            gCurrentSprite.paletteRow = 13 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
        else
            gCurrentSprite.paletteRow = 0;
    }
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x21;
        gCurrentSprite.paletteRow = 0;
    }
}

void YakuzaUpdateHitboxAndImmunity(void) {
    if (gCurrentSprite.status & SS_ROTATE_SCALE_WHOLE) {
        gCurrentSprite.hitboxTop = -0x80;
        gCurrentSprite.hitboxBottom = 0x80;
        gCurrentSprite.hitboxLeft = -0x80;
        gCurrentSprite.hitboxRight = 0x80;
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
    } else {
        gCurrentSprite.hitboxTop = -0x80;
        gCurrentSprite.hitboxBottom = 0x40;
        gCurrentSprite.hitboxLeft = -0x40;
        gCurrentSprite.hitboxRight = 0x40;
        gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;
    }
}

void YakuzaLosingLegsInit(void) {
    u16 y, x;
    u8 primaryRamSlot;
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1128;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x22;
    gCurrentSprite.work1 = 0x1e;
    gCurrentSprite.scaling = Q_8_8(1);
    gCurrentSprite.rotation = 0;
    gCurrentSprite.work3 = gSpriteRandomNumber + 1;
    gCurrentSprite.work4 = 0x20;
    gSubSpriteData1.health = 0;
    if (gSamusData.xPosition < gSubSpriteData1.xPosition)
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    else
        gCurrentSprite.status |= SS_FACING_RIGHT;
    primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    y = gCurrentSprite.yPosition, x = gCurrentSprite.xPosition;
    SpriteSpawnSecondary(SSPRITE_YAKUZA_FALLING_LEG, 0, 0, primaryRamSlot, y-0x10, x-0x40, 0);
    SpriteSpawnSecondary(SSPRITE_YAKUZA_FALLING_LEG, 1, 0, primaryRamSlot, y-0x20, x-0x40, 0);
    SpriteSpawnSecondary(SSPRITE_YAKUZA_FALLING_LEG, 2, 0, primaryRamSlot, y-0x40, x-0x40, 0);
    SpriteSpawnSecondary(SSPRITE_YAKUZA_FALLING_LEG, 3, 0, primaryRamSlot, y-0x10, x+0x40, 0);
    SpriteSpawnSecondary(SSPRITE_YAKUZA_FALLING_LEG, 4, 0, primaryRamSlot, y-0x20, x+0x40, 0);
    SpriteSpawnSecondary(SSPRITE_YAKUZA_FALLING_LEG, 5, 0, primaryRamSlot, y-0x40, x+0x40, 0);
}

void YakuzaLosingLegs(void) {
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = 0x24;
    YakuzaUpdateHitboxAndImmunity();
}

void YakuzaPhase2Init(void) {
    gCurrentSprite.pose = 0x24;
    gCurrentSprite.work4 = 0;
    if (gSamusData.xPosition < gSubSpriteData1.xPosition)
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    else
        gCurrentSprite.status |= SS_FACING_RIGHT;
}

void YakuzaPhase2(void) {
    u8 jump;
    s16 movement;
    u32 blockTop;

    jump = FALSE;
    movement = gCurrentSprite.work3;
    if (SPRITE_HAS_ISFT(gCurrentSprite) < 5 && gCurrentSprite.status & SS_DOUBLE_SIZE) {
        if (gCurrentSprite.status & SS_FACING_RIGHT) {
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition + 0x40);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                gCurrentSprite.status &= ~SS_FACING_RIGHT;
            else
                gSubSpriteData1.xPosition += movement;
        } else {
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition - 0x40);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                gCurrentSprite.status |= SS_FACING_RIGHT;
            else
                gSubSpriteData1.xPosition -= movement;
        }
    }
    movement = sYakuzaPhase2Speed[DIV_SHIFT(gCurrentSprite.work4, 4)];
    if (gCurrentSprite.work4 < ARRAY_SIZE(sYakuzaPhase2Speed) * 4 - 1) {
        gCurrentSprite.work4 += 1;
    }
    gSubSpriteData1.yPosition += movement;
    if (movement > 0) {
        if (gCurrentSprite.rotation != 0) {
            gCurrentSprite.rotation += Q_8_8(1.f/8);
        } else {
            if (gCurrentSprite.status & SS_ROTATE_SCALE_WHOLE) {
                gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1128;
                gSubSpriteData1.animationDurationCounter = 0;
                gSubSpriteData1.currentAnimationFrame = 0;
                gCurrentSprite.status &= ~SS_ROTATE_SCALE_WHOLE;
                SpriteSpawnSecondary(SSPRITE_YAKUZA_PROJECTILE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition + 0x94, gCurrentSprite.xPosition, 0);
                SoundPlay(0x140);
            }
        }
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gSubSpriteData1.yPosition + 0x80, gSubSpriteData1.xPosition);
        if (gPreviousVerticalCollisionCheck != 0) {
            gSubSpriteData1.yPosition = blockTop - 0x80;
            gCurrentSprite.work4 = 0;
            jump++;
        } else {
            if (gSamusData.yPosition < gSubSpriteData1.yPosition) {
                gCurrentSprite.work4 = 0;
                jump++;
            }
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0x140, gSubSpriteData1.xPosition);
            if (gPreviousCollisionCheck != 0 && (gSpriteRandomNumber == 8 || !(gCurrentSprite.status & SS_DOUBLE_SIZE))) {
                if ((gCurrentSprite.work4 & 1) != 0)
                    jump++;
                gCurrentSprite.work4 = 0;
            }
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0xe0, gSubSpriteData1.xPosition);
            if (gPreviousCollisionCheck != 0 && gSpriteRandomNumber == 14) {
                if ((gCurrentSprite.work4 & 1) != 0)
                    jump++;
                gCurrentSprite.work4 = 0;
            }
            if (SPRITE_HAS_ISFT(gCurrentSprite) == 16 && gSubSpriteData1.yPosition > 0x57e) {
                jump++;
                gCurrentSprite.work4 = 0;
            }
        }
        if (jump) {
            if (gSamusData.xPosition < gSubSpriteData1.xPosition)
                gCurrentSprite.status &= ~SS_FACING_RIGHT;
            else
                gCurrentSprite.status |= SS_FACING_RIGHT;
            gCurrentSprite.work3 = gSpriteRandomNumber + 1;
        }
        if (gCurrentSprite.work4 == 0)
            SoundPlay(0x13b);
    } else {
        gCurrentSprite.status |= (SS_DOUBLE_SIZE | SS_ROTATE_SCALE_WHOLE);
        gCurrentSprite.rotation += Q_8_8(1.f/8);
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition - 0x80, gSubSpriteData1.xPosition);
        if (gPreviousCollisionCheck != 0 || gSubSpriteData1.yPosition <= 0x57e)
            gSubSpriteData1.yPosition -= movement;
        if ((gCurrentSprite.work4 & 0xf) == 0)
            SoundPlay(0x13b);
    }
    YakuzaUpdateHitboxAndImmunity();
}

void YakuzaPhase2DyingInit(void) {
    gSubSpriteData1.pMultiOam = sMultiSpriteData_3b1160;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x48;
    gCurrentSprite.work1 = 60;
    gCurrentSprite.status &= ~SS_DOUBLE_SIZE;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.invincibilityStunFlashTimer = 0;
    gCurrentSprite.paletteRow = 0;
    gCurrentSprite.health = 1;
}

void YakuzaPhase2Dying(void) {
    u16 y, x;

    if (gSubSpriteData1.yPosition <= 0x63e) {
        gSubSpriteData1.yPosition += 4;
    }
    y = gSubSpriteData1.yPosition, x = gSubSpriteData1.xPosition;
    gCurrentSprite.work1--;
    switch (gCurrentSprite.work1) {
        case 40:
            ParticleSet(y-0x40, x-0x10, PE_0x2F);
            unk_3b1c(0x134);
            break;
        case 35:
            ParticleSet(y+0x20, x-0x10, PE_0x25);
            break;
        case 30:
            ParticleSet(y-0x20, x+0x1c, PE_0x2F);
            break;
        case 25:
            ParticleSet(y+0x40, x+0x20, PE_0x25);
            break;
        case 20:
            ParticleSet(y-0x20, x-0x10, PE_0x26);
            break;
        case 15:
            ParticleSet(y+0x40, x-0x10, PE_0x2F);
            break;
        case 10:
            ParticleSet(y-0x40, x+0x1c, PE_0x25);
            break;
        case 5:
            ParticleSet(y+0x10, x, PE_0x3A);
            break;
        case 0:
            gCurrentSprite.pose = 0x49;
            break;
    }
}

void YakuzaTurningIntoCoreXInit(void) {
    gCurrentSprite.pose = 0x4a;
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
}

void YakuzaTurningIntoCoreX(void) {
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    gCurrentSprite.xParasiteTimer--;
    if (gCurrentSprite.xParasiteTimer < ARRAY_SIZE(sSpaceJumpCoreXGfx) / 512 * 4)
        SpriteLoadGfx(PSPRITE_SPACE_JUMP_ABILITY, 0, gCurrentSprite.xParasiteTimer);
    else if (gCurrentSprite.xParasiteTimer == ARRAY_SIZE(sSpaceJumpCoreXGfx) / 512 * 4)
        SpriteLoadPal(PSPRITE_SPACE_JUMP_ABILITY, 0, ARRAY_SIZE(sSpaceJumpCoreXPal) / 16);
    if (gCurrentSprite.xParasiteTimer == 0) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
        gCurrentSprite.spriteId = PSPRITE_SPACE_JUMP_ABILITY;
    }
}

void YakuzaPartInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.pose = 2;
    switch (gCurrentSprite.roomSlot) {
        case YAKUZA_PART_EYE:
            gCurrentSprite.drawOrder = 11;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 8;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.status |= SS_NOT_DRAWN;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.work1 = 0;
            gCurrentSprite.work2 = 0;
            gCurrentSprite.samusCollision = SSC_NONE;
            break;
        case YAKUZA_PART_LEGS:
            gCurrentSprite.drawOrder = 13;
            gCurrentSprite.drawDistanceTop = 0x28;
            gCurrentSprite.drawDistanceBottom = 0x28;
            gCurrentSprite.drawDistanceHorizontal = 0x38;
            gCurrentSprite.hitboxTop = -0x80;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -0xa0;
            gCurrentSprite.hitboxRight = 0xa0;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
            gCurrentSprite.health = 1;
            break;
        default:
            gCurrentSprite.status = 0;
    }
    gCurrentSprite.status |= SS_HIDDEN;
    YakuzaSyncSubSprites();
}

void YakuzaPartLegsIdle(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (gCurrentSprite.status & SS_HIDDEN) {
        if (gSpriteData[primaryRamSlot].status & SS_HIDDEN)
            return;
        gCurrentSprite.status &= ~SS_HIDDEN;
    }
    if (gSamusData.pose == SPOSE_GRABBED_BY_YAKUZA)
        gCurrentSprite.samusCollision = SSC_NONE;
    else
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    if (gSpriteData[primaryRamSlot].hitboxBottom == 0x60)
        gCurrentSprite.hitboxBottom = 0x10;
    else
        gCurrentSprite.hitboxBottom = 0x2c;
}

void YakuzaPartLegsDead(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC) {
        gCurrentSprite.status = 0;
    } else {
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
        if (gSpriteData[primaryRamSlot].status & SS_ROTATE_SCALE_WHOLE) {
            gCurrentSprite.status |= SS_NOT_DRAWN;
        } else
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
    }
}

void YakuzaPartEyeIdle(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gSpriteData[primaryRamSlot].status & SS_ROTATE_SCALE_WHOLE) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.status |= SS_HIDDEN;
    } else {
        if (gCurrentSprite.status & SS_HIDDEN) {
            if (gSpriteData[primaryRamSlot].status & SS_HIDDEN)
                return;
            gCurrentSprite.status &= ~SS_HIDDEN;
        }
        gCurrentSprite.paletteRow = gSpriteData[primaryRamSlot].paletteRow;
        if (gCurrentSprite.work2 == 0) {
            if (SPRITE_HAS_ISFT(gSpriteData[primaryRamSlot]) == 16) {
                gCurrentSprite.work1 = 2;
                gCurrentSprite.work2 += 1; // Needed to make it matching.
                gCurrentSprite.pOam = sFrameData_3b7240;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.status &= ~SS_NOT_DRAWN;
            } else if (gSpriteData[primaryRamSlot].pose == 7 || gSpriteData[primaryRamSlot].pose == 9) {
                if ((gSpriteRandomNumber & 3) < 3) {
                    gCurrentSprite.work1 = gSpriteRandomNumber & 1;
                    gCurrentSprite.work2 += 1;
                    gCurrentSprite.pOam = sFrameData_3b7240;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.status &= ~SS_NOT_DRAWN;
                }
            }
        } else {
            if (SPRITE_HAS_ISFT(gSpriteData[primaryRamSlot]) > 0)
                gCurrentSprite.animationDurationCounter += 2;
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                if (gCurrentSprite.work1 > 0)
                    gCurrentSprite.work1--;
                else {
                    gCurrentSprite.work2 = 0;
                    gCurrentSprite.status |= SS_NOT_DRAWN;
                }
            }
        }
    }
}

void YakuzaPartEyePhase2(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
        gCurrentSprite.status = 0;
}

void YakuzaProjectileInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawOrder = 4;
    if (gSubSpriteData1.health > 0) {
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.drawDistanceTop = 0x28;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x10;
        gCurrentSprite.hitboxTop = -0x60;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -0x18;
        gCurrentSprite.hitboxRight = 0x18;
        gCurrentSprite.pOam = sYakuzaProjectileFireOam_Burning1;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 2;
        gCurrentSprite.health = 0;
    } else {
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
        gCurrentSprite.drawDistanceTop = 0x18;
        gCurrentSprite.drawDistanceBottom = 8;
        gCurrentSprite.drawDistanceHorizontal = 0x10;
        gCurrentSprite.hitboxTop = -0x20;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -0x1c;
        gCurrentSprite.hitboxRight = 0x1c;
        gCurrentSprite.pOam = sYakuzaProjectileSpitOam;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x28;
        gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
        gCurrentSprite.health = 1;
    }
}

void YakuzaProjectileExploding(void) {
    ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_EXPLOSION_SMOKE);
    SoundPlay(0x1bf);
    gCurrentSprite.status = 0;
}

void YakuzaProjectileSpitFalling(void) {
    gCurrentSprite.yPosition += 0xc;
    if (gCurrentSprite.health == 0)
        YakuzaProjectileExploding();
}

void YakuzaProjectileFireFalling(void) {
    u32 blockTop;

    gCurrentSprite.yPosition += 0xc;
    if (gCurrentSprite.roomSlot != 0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.xPosition += 0xc;
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x24);
        } else {
            gCurrentSprite.xPosition -= 0xc;
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x24);
        }
        if (gPreviousCollisionCheck != 0)
            gCurrentSprite.roomSlot = 0;
    }
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != 0) {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.work1 = 120;
        gCurrentSprite.work3 = 0;
        SoundPlay(0x13c);
    }
}

void YakuzaProjectileFireBurning1(void) {
    u8 offset = gCurrentSprite.work3;
    s16 movement = sYakuzaFireBurningSpeed[offset];
    if (sYakuzaFireBurningSpeed[offset] == SHORT_MAX) {
        movement = sYakuzaFireBurningSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.work1 = 80;
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.pOam = sYakuzaProjectileFireOam_Burning2;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.hitboxTop = -0x40;
        gCurrentSprite.hitboxLeft = -0x10;
        gCurrentSprite.hitboxRight = 0x10;
        SoundPlay(0x13d);
    } else if ((gCurrentSprite.work1 & 0xf) == 0)
        SoundPlay(0x13c);
}

void YakuzaProjectileFireBurning2(void) {
    u8 offset = gCurrentSprite.work3;
    s16 movement = sYakuzaFireBurningSpeed[offset];
    if (sYakuzaFireBurningSpeed[offset] == SHORT_MAX) {
        movement = sYakuzaFireBurningSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.work1 = 60;
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.pOam = sYakuzaProjectileFireOam_Burning3;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.hitboxTop = -0x20;
        gCurrentSprite.hitboxLeft = -0xc;
        gCurrentSprite.hitboxRight = 0xc;
        SoundPlay(0x13e);
    } else if ((gCurrentSprite.work1 & 0xf) == 0)
        SoundPlay(0x13d);
}

void YakuzaProjectileFireBurning3(void) {
    u8 offset = gCurrentSprite.work3;
    s16 movement = sYakuzaFireBurningSpeed[offset];
    if (sYakuzaFireBurningSpeed[offset] == SHORT_MAX) {
        movement = sYakuzaFireBurningSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.work1 = 60;
        gCurrentSprite.pose = 0x1e;
    }
    if ((gCurrentSprite.work1 & 0xf) == 0)
        SoundPlay(0x13e);
}

void YakuzaProjectileFireBurning4(void) {
    if (gCurrentSprite.work1 < 30) {
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        if ((gCurrentSprite.work1 & 1) == 0)
            gCurrentSprite.status ^= SS_NOT_DRAWN;
    }
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.status = 0;
}

void YakuzaFallingLegInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawOrder = 2;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.health = 0;
    switch (gCurrentSprite.roomSlot) {
        case 0:
            gCurrentSprite.pOam = sFrameData_3b7320;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 0x20;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work3 = 2;
            gCurrentSprite.work1 = 0;
            ScreenShakeStartVertical(60, 0x81);
            unk_3b1c(0x133);
            break;
        case 1:
            gCurrentSprite.pOam = sFrameData_3b7330;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 0x20;
            gCurrentSprite.drawDistanceHorizontal = 0x20;
            gCurrentSprite.work3 = 6;
            gCurrentSprite.work1 = 8;
            break;
        case 2:
            gCurrentSprite.pOam = sFrameData_3b7340;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x28;
            gCurrentSprite.work3 = 10;
            gCurrentSprite.work1 = 6;
            break;
        case 3:
            gCurrentSprite.pOam = sFrameData_3b7350;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 0x20;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work3 = 4;
            gCurrentSprite.work1 = 10;
            break;
        case 4:
            gCurrentSprite.pOam = sFrameData_3b7360;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 0x20;
            gCurrentSprite.drawDistanceHorizontal = 0x20;
            gCurrentSprite.work3 = 6;
            gCurrentSprite.work1 = 2;
            break;
        case 5:
            gCurrentSprite.pOam = sFrameData_3b7370;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x28;
            gCurrentSprite.work3 = 10;
            gCurrentSprite.work1 = 4;
            break;
        default:
            gCurrentSprite.status = 0;
    }
}

void YakuzaFallingLegMoving(void) {
    if (gCurrentSprite.work1 > 0) {
        // BUG: lower-left leg doesn't spawn explosion
        if (--gCurrentSprite.work1 == 0) {
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x25);
        }
    } else {
        u8 offset = gCurrentSprite.work4;
        s16 movement = sSpritesFallingSpeed_2e499c[offset];
        if (movement == SHORT_MAX) {
            movement = sSpritesFallingSpeed_2e499c[offset - 1];
            gCurrentSprite.yPosition += movement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += movement;
        }
        if (gCurrentSprite.roomSlot <= 2)
            gCurrentSprite.xPosition -= gCurrentSprite.work3;
        else
            gCurrentSprite.xPosition += gCurrentSprite.work3;
    }
}

void Yakuza(void) {
    if (gCurrentSprite.health == 0 && gCurrentSprite.pose != 0)
        gCurrentSprite.pose = 0x47;
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x131);
    switch (gCurrentSprite.pose) {
        case 0:
            YakuzaInit();
            break;
        case 0x37:
            YakuzaWaitingToAppear();
            break;
        case 0x38:
            YakuzaAboutToAppear();
            break;
        case 1:
            YakuzaBeginSweepInit();
        case 2:
            YakuzaBeginSweep();
            break;
        case 0x18:
            YakuzaSweeping();
            break;
        case 0x1a:
            YakuzaSweepingEnd();
            break;
        case 7:
            YakuzaIdleBeforeNewRoundInit();
        case 8:
            YakuzaIdleBeforeNewRound();
            break;
        case 0x27:
            YakuzaGrabbedSamusInit();
        case 0x28:
            YakuzaGrabbedSamus();
            break;
        case 0x2a:
            YakuzaPullingSamus();
            break;
        case 0x2c:
            YakuzaHoldingSamusHigh();
            break;
        case 0x2e:
            YakuzaSlammingSamus();
            break;
        case 0x2f:
            YakuzaReleasingSamusInit();
        case 0x30:
            YakuzaReleasingSamus();
            break;
        case 9:
            YakuzaAfterReleasingSamusInit();
        case 10:
            YakuzaAfterReleasingSamus();
            break;
        case 0x31:
            YakuzaOpeningMouthInit();
        case 0x32:
            YakuzaOpeningMouth();
            break;
        case 0x1b:
            YakuzaMouthOpenedInit();
        case 0x1c:
            YakuzaMouthOpened();
            break;
        case 0x1d:
            YakuzaClosingMouthInit();
        case 0x1e:
            YakuzaClosingMouth();
            break;
        case 0x1f:
            YakuzaPhase1DyingInit();
        case 0x20:
            YakuzaPhase1Dying();
            break;
        case 0x21:
            YakuzaLosingLegsInit();
        case 0x22:
            YakuzaLosingLegs();
            break;
        case 0x23:
            YakuzaPhase2Init();
        case 0x24:
            YakuzaPhase2();
            break;
        case 0x47:
            YakuzaPhase2DyingInit();
        case 0x48:
            YakuzaPhase2Dying();
            break;
        case 0x49:
            YakuzaTurningIntoCoreXInit();
        case 0x4a:
            YakuzaTurningIntoCoreX();
    }
    SpriteUtilUpdateSubSpriteData1Animation();
    YakuzaSyncSubSprites();
    YakuzaUpdatePalette();
}

void YakuzaPart(void) {
    if (gCurrentSprite.pose == 0) {
        YakuzaPartInit();
        return;
    }
    if (gCurrentSprite.roomSlot == YAKUZA_PART_LEGS) {
        if (gSubSpriteData1.health > 0)
            YakuzaPartLegsIdle();
        else
            YakuzaPartLegsDead();
        YakuzaSyncSubSprites();
    } else if (gCurrentSprite.roomSlot == YAKUZA_PART_EYE) {
        if (gCurrentSprite.pose == 2)
            YakuzaPartEyeIdle();
        else
            YakuzaPartEyePhase2();
        SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
    }
}

void YakuzaProjectile(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            YakuzaProjectileInit();
            break;
        case 0x28:
            YakuzaProjectileSpitFalling();
            break;
        case SPRITE_POSE_STOPPED:
            YakuzaProjectileExploding();
            break;
        case 2:
            YakuzaProjectileFireFalling();
            break;
        case 0x18:
            YakuzaProjectileFireBurning1();
            break;
        case 0x1a:
            YakuzaProjectileFireBurning2();
            break;
        case 0x1c:
            YakuzaProjectileFireBurning3();
            break;
        case 0x1e:
            YakuzaProjectileFireBurning4();
            break;
    }
}

void YakuzaFallingLeg(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            YakuzaFallingLegInit();
            break;
        case 2:
            YakuzaFallingLegMoving();
            break;
    }
}
