#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/atmospheric_stabilizer.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/event.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u8 AtmosphericSbabilizerCheckIsInfected(void) {
    u8 i, spriteId;
    u16 stabilizerBit;

    // Find a stabilizer
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
        if (!(gSpriteData[i].status & SS_EXISTS)) continue;
        if (gSpriteData[i].properties & SP_SECONDARY_SPRITE) continue;

        spriteId = gSpriteData[i].spriteId;
        switch (spriteId) {
            case PSPRITE_ATMOSPHERIC_STABILIZER_1:
            case PSPRITE_ATMOSPHERIC_STABILIZER_2:
            case PSPRITE_ATMOSPHERIC_STABILIZER_3:
            case PSPRITE_ATMOSPHERIC_STABILIZER_4:
            case PSPRITE_ATMOSPHERIC_STABILIZER_5:
                // All stabilizer sprite ids are next to each other numerically, so doing spriteId - firstStabilizerId offsets the id to start at 0
                spriteId -= PSPRITE_ATMOSPHERIC_STABILIZER_1;

                // Get bit affected by the current stabilizer
                stabilizerBit = gAtmosphericStabilizersOnline >> spriteId;

                if (stabilizerBit & 1)
                    // Online
                    return FALSE;
                else
                    // Offline
                    return TRUE;
        }
    }

    // No stabilizer is found
    return FALSE;
}

void AtmosphericStabilizerInit(void) {
    u8 tmp, secondarySpriteId;
    u16 stabilizerBit;

    gCurrentSprite.drawOrder = 12;
    gCurrentSprite.yPosition -= 0x20;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 0x20;
    gCurrentSprite.drawDistanceHorizontal = 0x20;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 32;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    SpriteUtilChooseRandomXDirection();

    switch (gCurrentSprite.spriteId) {
        case PSPRITE_ATMOSPHERIC_STABILIZER_1:
        case PSPRITE_ATMOSPHERIC_STABILIZER_3:
            secondarySpriteId = SSPRITE_23;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 0x60;
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = 0x20;
            gCurrentSprite.work2 = FALSE;
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_3277f8;
            break;
        case PSPRITE_ATMOSPHERIC_STABILIZER_4:
        case PSPRITE_ATMOSPHERIC_STABILIZER_5:
            secondarySpriteId = SSPRITE_24;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 0x60;
            gCurrentSprite.hitboxLeft = -0x20;
            gCurrentSprite.hitboxRight = 0x60;
            gCurrentSprite.work2 = FALSE;
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_3277f8;
            break;
        case PSPRITE_ATMOSPHERIC_STABILIZER_2:
            secondarySpriteId = SSPRITE_ATMOSPHERIC_STABILIZER_COVER_DOWN;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 0x20;
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = 0x60;
            gCurrentSprite.work2 = TRUE;
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327660;
            break;
        default:
            gCurrentSprite.status = 0;
            return;
    }

    // All stabilizer sprite ids are next to each other numerically, so doing spriteId - firstStabilizerId offsets the id to start at 0
    tmp = gCurrentSprite.spriteId;
    tmp -= PSPRITE_ATMOSPHERIC_STABILIZER_1;

    // Get bit affected by the current stabilizer
    stabilizerBit = gAtmosphericStabilizersOnline >> tmp;

    if (stabilizerBit & 1) {
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.health = 0;
        if (gCurrentSprite.work2)
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327640;
        else
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_3277d8;
        SoundPlay(SOUND_FE);
    } else {
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        if (secondarySpriteId == SSPRITE_23) {
            tmp = SpriteSpawnSecondary(SSPRITE_23, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
            tmp = SpriteSpawnSecondary(SSPRITE_23, 1, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
            tmp = SpriteSpawnNewXParasite(PSPRITE_ATMOSPHERIC_STABILIZER_PARASITE, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, 
                gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
        } else if (secondarySpriteId == SSPRITE_24) {
            tmp = SpriteSpawnSecondary(SSPRITE_24, 2, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
            tmp = SpriteSpawnSecondary(SSPRITE_24, 3, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
            tmp = SpriteSpawnNewXParasite(PSPRITE_ATMOSPHERIC_STABILIZER_PARASITE, 2, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, 
                gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
        } else if (secondarySpriteId == SSPRITE_ATMOSPHERIC_STABILIZER_COVER_DOWN) {
            tmp = SpriteSpawnSecondary(SSPRITE_ATMOSPHERIC_STABILIZER_COVER_DOWN, 4, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
            tmp = SpriteSpawnSecondary(SSPRITE_ATMOSPHERIC_STABILIZER_COVER_DOWN, 5, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
            tmp = SpriteSpawnNewXParasite(PSPRITE_ATMOSPHERIC_STABILIZER_PARASITE, 3, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, 
                gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
            if (tmp == UCHAR_MAX) {
                gCurrentSprite.status = 0;
                return;
            }
        } else {
            gCurrentSprite.status = 0;
            return;
        }
        SoundPlay(SOUND_FF);
    }
    gCurrentSprite.spritesetSlotAndProperties = SSP_CAN_ABSORB_ADDITIONAL_X;
}

void AtmosphericStabilizerBackOnlineInit(void) {
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.health = 0;
    if (gCurrentSprite.work2)
        gCurrentSprite.pOam = sAtmosphericStabilizerOam_3276e0;
    else
        gCurrentSprite.pOam = sAtmosphericStabilizerOam_327878;
    SoundPlay(SOUND_100);
}

void AtmosphericStabilizerBackOnline(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        if (gCurrentSprite.work2)
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327640;
        else
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_3277d8;
        StartStopEventBasedEffect(1); // FIXME enum
    }
}

void AtmosphericStabilizerCoverInit(void) {
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawOrder = 4;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 0x20;
    gCurrentSprite.drawDistanceHorizontal = 0x20;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    switch (gCurrentSprite.roomSlot) {
        case 0:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327a30;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = -0x20;
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0x60;
            break;
        case 1:
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327a30;
            gCurrentSprite.hitboxTop = 0x20;
            gCurrentSprite.hitboxBottom = 0x60;
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0x60;
            break;
        case 2:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327a40;
            gCurrentSprite.hitboxTop = 0x20;
            gCurrentSprite.hitboxBottom = 0x60;
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = -0x20;
            break;
        case 3:
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327a40;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = -0x20;
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = -0x20;
            break;
        case 4:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327a20;
            gCurrentSprite.hitboxTop = 0x20;
            gCurrentSprite.hitboxBottom = 0x60;
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = -0x20;
            break;
        case 5:
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327a20;
            gCurrentSprite.hitboxTop = 0x20;
            gCurrentSprite.hitboxBottom = 0x60;
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0x60;
            break;
        case 6:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327a60;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 0;
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = -0x20;
            break;
        case 7:
            gCurrentSprite.pOam = sAtmosphericStabilizerOam_327a60;
            gCurrentSprite.hitboxTop = 0x20;
            gCurrentSprite.hitboxBottom = 0x60;
            gCurrentSprite.hitboxLeft = 0;
            gCurrentSprite.hitboxRight = 0x60;
            break;
        default:
            gCurrentSprite.status = 0;
    }
}

void AtmosphericStabilizerCoverIdle(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    gCurrentSprite.yPosition = gSpriteData[primary].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primary].xPosition;
    if (gSpriteData[primary].pose == 0x18) {
        if (gCurrentSprite.status & SS_NOT_DRAWN) {
            gCurrentSprite.status = 0;
        } else {
            gCurrentSprite.pose = 0x18;
            gCurrentSprite.work1 = 0;
        }
    }
}

#ifdef NON_MATCHING
void AtmosphericStabilizerCoverExploding(void) {
    // https://decomp.me/scratch/kUtO7

    u16 y = gCurrentSprite.yPosition, x = gCurrentSprite.xPosition;
    u8 count, messageType;
    u16 stabilizersOnline;

    gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (MOD_AND(gCurrentSprite.work1, 4) == 0)
        SoundPlay(SOUND_1BF);
    if (gCurrentSprite.roomSlot == 0) {
        switch (gCurrentSprite.work1) {
            case 0:
                ParticleSet(y-0x30, x+4, PE_0x25);
                break;
            case 2:
                ParticleSet(y+0x40, x-4, PE_0x25);
                break;
            case 4:
                ParticleSet(y-8, x-0x40, PE_0x25);
                break;
            case 6:
                ParticleSet(y-0x26, x-0x30, PE_0x26);
                break;
            case 7:
                ParticleSet(y+0x26, x-0x30, PE_0x26);
                break;
            case 8:
                ParticleSet(y-0x3c, x+0x3c, PE_0x25);
                break;
            case 9:
                ParticleSet(y+0x32, x+0x32, PE_0x25);
                break;
            case 10:
                ParticleSet(y-0x40, x, PE_0x26);
                break;
            case 12:
                ParticleSet(y+0x50, x-0x34, PE_0x25);
                break;
            case 14:
                ParticleSet(y+0x10, x-0x44, PE_0x25);
                break;
            case 16:
                ParticleSet(y-0x40, x-0x34, PE_0x25);
                break;
            case 17:
                ParticleSet(y+0x58, x+0x10, PE_0x25);
                break;
            case 18:
                ParticleSet(y-0x48, x+0x50, PE_0x25);
                break;
            case 19:
                ParticleSet(y+0x4e, x+0x48, PE_0x25);
                break;
            case 24:
                gCurrentSprite.status = 0;
        }
        gCurrentSprite.work1++;
    } else if (gCurrentSprite.roomSlot == 2) {
        switch (gCurrentSprite.work1) {
            case 0:
                ParticleSet(y-0x30, x+4, PE_0x25);
                break;
            case 2:
                ParticleSet(y+0x40, x-4, PE_0x25);
                break;
            case 4:
                ParticleSet(y-8, x+0x40, PE_0x25);
                break;
            case 6:
                ParticleSet(y-0x26, x-0x30, PE_0x26);
                break;
            case 7:
                ParticleSet(y+0x26, x-0x30, PE_0x26);
                break;
            case 8:
                ParticleSet(y-0x3c, x+0x3c, PE_0x25);
                break;
            case 9:
                ParticleSet(y+0x32, x+0x32, PE_0x25);
                break;
            case 10:
                ParticleSet(y-0x40, x, PE_0x26);
                break;
            case 12:
                ParticleSet(y+0x50, x-0x34, PE_0x25);
                break;
            case 14:
                ParticleSet(y+0x10, x+0x44, PE_0x25);
                break;
            case 16:
                ParticleSet(y-0x40, x-0x34, PE_0x25);
                break;
            case 17:
                ParticleSet(y+0x48, x-8, PE_0x25);
                break;
            case 18:
                ParticleSet(y-0x48, x+0x50, PE_0x25);
                break;
            case 19:
                ParticleSet(y+0x4e, x+0x48, PE_0x25);
                break;
            case 24:
                gCurrentSprite.status = 0;
        }
        gCurrentSprite.work1++;
    } else if (gCurrentSprite.roomSlot == 4) {
        switch (gCurrentSprite.work1) {
            case 0:
                ParticleSet(y-0x30, x+4, PE_0x25);
                break;
            case 2:
                ParticleSet(y, x-0x48, PE_0x25);
                break;
            case 4:
                ParticleSet(y-8, x+0x40, PE_0x25);
                break;
            case 6:
                ParticleSet(y-0x26, x-0x30, PE_0x26);
                break;
            case 7:
                ParticleSet(y+0x26, x-0x30, PE_0x26);
                break;
            case 8:
                ParticleSet(y-0x3c, x+0x3c, PE_0x25);
                break;
            case 9:
                ParticleSet(y+0x32, x+0x32, PE_0x25);
                break;
            case 10:
                ParticleSet(y-0x48, x, PE_0x25);
                break;
            case 12:
                ParticleSet(y+0x50, x-0x34, PE_0x25);
                break;
            case 14:
                ParticleSet(y+0x10, x+0x44, PE_0x25);
                break;
            case 16:
                ParticleSet(y-0x40, x-0x34, PE_0x25);
                break;
            case 17:
                ParticleSet(y+8, x-0x40, PE_0x25);
                break;
            case 18:
                ParticleSet(y-0x48, x+0x50, PE_0x25);
                break;
            case 19:
                ParticleSet(y+0x4e, x+0x48, PE_0x25);
                break;
            case 24:
                gCurrentSprite.status = 0;
        }
        gCurrentSprite.work1++;
    } else if (gCurrentSprite.roomSlot == 6) {
        switch (gCurrentSprite.work1) {
            case 0:
                ParticleSet(y-0x30, x+4, PE_0x25);
                break;
            case 2:
                ParticleSet(y, x-0x48, PE_0x25);
                break;
            case 4:
                ParticleSet(y-8, x+0x40, PE_0x25);
                break;
            case 6:
                ParticleSet(y-0x26, x-0x30, PE_0x26);
                break;
            case 7:
                ParticleSet(y+0x26, x-0x30, PE_0x26);
                break;
            case 8:
                ParticleSet(y-0x3c, x+0x3c, PE_0x25);
                break;
            case 9:
                ParticleSet(y+0x32, x+0x32, PE_0x25);
                break;
            case 10:
                ParticleSet(y-0x48, x, PE_0x25);
                break;
            case 12:
                ParticleSet(y+0x50, x, PE_0x25);
                break;
            case 14:
                ParticleSet(y+0x10, x+0x44, PE_0x25);
                break;
            case 16:
                ParticleSet(y-0x40, x-0x34, PE_0x25);
                break;
            case 17:
                ParticleSet(y+8, x-0x40, PE_0x25);
                break;
            case 18:
                ParticleSet(y-0x48, x+0x50, PE_0x25);
                break;
            case 19:
                ParticleSet(y+0x4e, x+0x48, PE_0x25);
                break;
            case 24:
                gCurrentSprite.status = 0;
        }
        gCurrentSprite.work1++;
    } else
        gCurrentSprite.status = 0;
    if (gCurrentSprite.work1 == 25) {
        stabilizersOnline = gAtmosphericStabilizersOnline;
        count = 0;
        do {
            if (stabilizersOnline & 1) count++;
            if (stabilizersOnline & 2) count++;
            if (stabilizersOnline & 4) count++;
            if (stabilizersOnline & 8) count++;
            if (stabilizersOnline & 0x10) count++;
            if (count == 1)
                messageType = 1;
            else if (count == 2)
                messageType = 2;
            else if (count == 3)
                messageType = 3;
            else if (count == 4)
                messageType = 4;
            else if (count == 5)
                messageType = 5;
            else
                return;
            if (count > 0) {
                count = messageType;
                TrySpawnMessageBanner(count);
                gPreventMovementTimer = 1000;
            }
        } while (0);
    }
}
#else
NAKED_FUNCTION
void AtmosphericStabilizerCoverExploding(void) {
    asm(" \n\
    push {r4, r5, r6, r7, lr} \n\
    ldr r6, _0802CCCC @ =gCurrentSprite \n\
    ldrh r4, [r6, #2] \n\
    ldrh r5, [r6, #4] \n\
    ldrh r0, [r6] \n\
    movs r1, #4 \n\
    eor r0, r1 \n\
    strh r0, [r6] \n\
    add r7, r6, #0 \n\
    add r7, #0x2e \n\
    ldrb r1, [r7] \n\
    movs r0, #3 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    bne _0802CCB4 \n\
    ldr r0, _0802CCD0 @ =0x000001BF \n\
    bl SoundPlay \n\
_0802CCB4: \n\
    ldrb r0, [r6, #0x1e] \n\
    cmp r0, #0 \n\
    bne _0802CDAA \n\
    ldrb r0, [r7] \n\
    cmp r0, #0x18 \n\
    bls _0802CCC2 \n\
    b _0802D096 \n\
_0802CCC2: \n\
    lsl r0, r0, #2 \n\
    ldr r1, _0802CCD4 @ =_0802CCD8 \n\
    add r0, r0, r1 \n\
    ldr r0, [r0] \n\
    mov pc, r0 \n\
    .align 2, 0 \n\
_0802CCCC: .4byte gCurrentSprite \n\
_0802CCD0: .4byte 0x000001BF \n\
_0802CCD4: .4byte _0802CCD8 \n\
_0802CCD8: @ jump table \n\
    .4byte _0802CD3C @ case 0 \n\
    .4byte _0802D096 @ case 1 \n\
    .4byte _0802CD44 @ case 2 \n\
    .4byte _0802D096 @ case 3 \n\
    .4byte _0802CD4C @ case 4 \n\
    .4byte _0802D096 @ case 5 \n\
    .4byte _0802CD56 @ case 6 \n\
    .4byte _0802D024 @ case 7 \n\
    .4byte _0802CD5C @ case 8 \n\
    .4byte _0802CD66 @ case 9 \n\
    .4byte _0802CD70 @ case 10 \n\
    .4byte _0802D096 @ case 11 \n\
    .4byte _0802CD78 @ case 12 \n\
    .4byte _0802D096 @ case 13 \n\
    .4byte _0802CD82 @ case 14 \n\
    .4byte _0802D096 @ case 15 \n\
    .4byte _0802CD8C @ case 16 \n\
    .4byte _0802CD96 @ case 17 \n\
    .4byte _0802CDA0 @ case 18 \n\
    .4byte _0802D080 @ case 19 \n\
    .4byte _0802D096 @ case 20 \n\
    .4byte _0802D096 @ case 21 \n\
    .4byte _0802D096 @ case 22 \n\
    .4byte _0802D096 @ case 23 \n\
    .4byte _0802D090 @ case 24 \n\
_0802CD3C: \n\
    add r0, r4, #0 \n\
    sub r0, #0x30 \n\
    add r1, r5, #4 \n\
    b _0802D088 \n\
_0802CD44: \n\
    add r0, r4, #0 \n\
    add r0, #0x40 \n\
    sub r1, r5, #4 \n\
    b _0802D088 \n\
_0802CD4C: \n\
    add r0, r4, #0 \n\
    sub r0, #8 \n\
    add r1, r5, #0 \n\
    sub r1, #0x40 \n\
    b _0802D088 \n\
_0802CD56: \n\
    add r0, r4, #0 \n\
    sub r0, #0x26 \n\
    b _0802D028 \n\
_0802CD5C: \n\
    add r0, r4, #0 \n\
    sub r0, #0x3c \n\
    add r1, r5, #0 \n\
    add r1, #0x3c \n\
    b _0802D088 \n\
_0802CD66: \n\
    add r0, r4, #0 \n\
    add r0, #0x32 \n\
    add r1, r5, #0 \n\
    add r1, #0x32 \n\
    b _0802D088 \n\
_0802CD70: \n\
    add r0, r4, #0 \n\
    sub r0, #0x40 \n\
    add r1, r5, #0 \n\
    b _0802D02C \n\
_0802CD78: \n\
    add r0, r4, #0 \n\
    add r0, #0x50 \n\
    add r1, r5, #0 \n\
    sub r1, #0x34 \n\
    b _0802D088 \n\
_0802CD82: \n\
    add r0, r4, #0 \n\
    add r0, #0x10 \n\
    add r1, r5, #0 \n\
    sub r1, #0x44 \n\
    b _0802D088 \n\
_0802CD8C: \n\
    add r0, r4, #0 \n\
    sub r0, #0x40 \n\
    add r1, r5, #0 \n\
    sub r1, #0x34 \n\
    b _0802D088 \n\
_0802CD96: \n\
    add r0, r4, #0 \n\
    add r0, #0x58 \n\
    add r1, r5, #0 \n\
    add r1, #0x10 \n\
    b _0802D088 \n\
_0802CDA0: \n\
    add r0, r4, #0 \n\
    sub r0, #0x48 \n\
    add r1, r5, #0 \n\
    add r1, #0x50 \n\
    b _0802D088 \n\
_0802CDAA: \n\
    cmp r0, #2 \n\
    bne _0802CE96 \n\
    ldrb r0, [r7] \n\
    cmp r0, #0x18 \n\
    bls _0802CDB6 \n\
    b _0802D096 \n\
_0802CDB6: \n\
    lsl r0, r0, #2 \n\
    ldr r1, _0802CDC0 @ =_0802CDC4 \n\
    add r0, r0, r1 \n\
    ldr r0, [r0] \n\
    mov pc, r0 \n\
    .align 2, 0 \n\
_0802CDC0: .4byte _0802CDC4 \n\
_0802CDC4: @ jump table \n\
    .4byte _0802CE28 @ case 0 \n\
    .4byte _0802D096 @ case 1 \n\
    .4byte _0802CE30 @ case 2 \n\
    .4byte _0802D096 @ case 3 \n\
    .4byte _0802CE38 @ case 4 \n\
    .4byte _0802D096 @ case 5 \n\
    .4byte _0802CE42 @ case 6 \n\
    .4byte _0802D024 @ case 7 \n\
    .4byte _0802CE48 @ case 8 \n\
    .4byte _0802CE52 @ case 9 \n\
    .4byte _0802CE5C @ case 10 \n\
    .4byte _0802D096 @ case 11 \n\
    .4byte _0802CE64 @ case 12 \n\
    .4byte _0802D096 @ case 13 \n\
    .4byte _0802CE6E @ case 14 \n\
    .4byte _0802D096 @ case 15 \n\
    .4byte _0802CE78 @ case 16 \n\
    .4byte _0802CE82 @ case 17 \n\
    .4byte _0802CE8C @ case 18 \n\
    .4byte _0802D080 @ case 19 \n\
    .4byte _0802D096 @ case 20 \n\
    .4byte _0802D096 @ case 21 \n\
    .4byte _0802D096 @ case 22 \n\
    .4byte _0802D096 @ case 23 \n\
    .4byte _0802D090 @ case 24 \n\
_0802CE28: \n\
    add r0, r4, #0 \n\
    sub r0, #0x30 \n\
    add r1, r5, #4 \n\
    b _0802D088 \n\
_0802CE30: \n\
    add r0, r4, #0 \n\
    add r0, #0x40 \n\
    sub r1, r5, #4 \n\
    b _0802D088 \n\
_0802CE38: \n\
    add r0, r4, #0 \n\
    sub r0, #8 \n\
    add r1, r5, #0 \n\
    add r1, #0x40 \n\
    b _0802D088 \n\
_0802CE42: \n\
    add r0, r4, #0 \n\
    sub r0, #0x26 \n\
    b _0802D028 \n\
_0802CE48: \n\
    add r0, r4, #0 \n\
    sub r0, #0x3c \n\
    add r1, r5, #0 \n\
    add r1, #0x3c \n\
    b _0802D088 \n\
_0802CE52: \n\
    add r0, r4, #0 \n\
    add r0, #0x32 \n\
    add r1, r5, #0 \n\
    add r1, #0x32 \n\
    b _0802D088 \n\
_0802CE5C: \n\
    add r0, r4, #0 \n\
    sub r0, #0x40 \n\
    add r1, r5, #0 \n\
    b _0802D02C \n\
_0802CE64: \n\
    add r0, r4, #0 \n\
    add r0, #0x50 \n\
    add r1, r5, #0 \n\
    sub r1, #0x34 \n\
    b _0802D088 \n\
_0802CE6E: \n\
    add r0, r4, #0 \n\
    add r0, #0x10 \n\
    add r1, r5, #0 \n\
    add r1, #0x44 \n\
    b _0802D088 \n\
_0802CE78: \n\
    add r0, r4, #0 \n\
    sub r0, #0x40 \n\
    add r1, r5, #0 \n\
    sub r1, #0x34 \n\
    b _0802D088 \n\
_0802CE82: \n\
    add r0, r4, #0 \n\
    add r0, #0x48 \n\
    add r1, r5, #0 \n\
    sub r1, #8 \n\
    b _0802D088 \n\
_0802CE8C: \n\
    add r0, r4, #0 \n\
    sub r0, #0x48 \n\
    add r1, r5, #0 \n\
    add r1, #0x50 \n\
    b _0802D088 \n\
_0802CE96: \n\
    cmp r0, #4 \n\
    bne _0802CF82 \n\
    ldrb r0, [r7] \n\
    cmp r0, #0x18 \n\
    bls _0802CEA2 \n\
    b _0802D096 \n\
_0802CEA2: \n\
    lsl r0, r0, #2 \n\
    ldr r1, _0802CEAC @ =_0802CEB0 \n\
    add r0, r0, r1 \n\
    ldr r0, [r0] \n\
    mov pc, r0 \n\
    .align 2, 0 \n\
_0802CEAC: .4byte _0802CEB0 \n\
_0802CEB0: @ jump table \n\
    .4byte _0802CF14 @ case 0 \n\
    .4byte _0802D096 @ case 1 \n\
    .4byte _0802CF1C @ case 2 \n\
    .4byte _0802D096 @ case 3 \n\
    .4byte _0802CF24 @ case 4 \n\
    .4byte _0802D096 @ case 5 \n\
    .4byte _0802CF2E @ case 6 \n\
    .4byte _0802D024 @ case 7 \n\
    .4byte _0802CF34 @ case 8 \n\
    .4byte _0802CF3E @ case 9 \n\
    .4byte _0802CF48 @ case 10 \n\
    .4byte _0802D096 @ case 11 \n\
    .4byte _0802CF50 @ case 12 \n\
    .4byte _0802D096 @ case 13 \n\
    .4byte _0802CF5A @ case 14 \n\
    .4byte _0802D096 @ case 15 \n\
    .4byte _0802CF64 @ case 16 \n\
    .4byte _0802CF6E @ case 17 \n\
    .4byte _0802CF78 @ case 18 \n\
    .4byte _0802D080 @ case 19 \n\
    .4byte _0802D096 @ case 20 \n\
    .4byte _0802D096 @ case 21 \n\
    .4byte _0802D096 @ case 22 \n\
    .4byte _0802D096 @ case 23 \n\
    .4byte _0802D090 @ case 24 \n\
_0802CF14: \n\
    add r0, r4, #0 \n\
    sub r0, #0x30 \n\
    add r1, r5, #4 \n\
    b _0802D088 \n\
_0802CF1C: \n\
    add r1, r5, #0 \n\
    sub r1, #0x48 \n\
    add r0, r4, #0 \n\
    b _0802D088 \n\
_0802CF24: \n\
    add r0, r4, #0 \n\
    sub r0, #8 \n\
    add r1, r5, #0 \n\
    add r1, #0x40 \n\
    b _0802D088 \n\
_0802CF2E: \n\
    add r0, r4, #0 \n\
    sub r0, #0x26 \n\
    b _0802D028 \n\
_0802CF34: \n\
    add r0, r4, #0 \n\
    sub r0, #0x3c \n\
    add r1, r5, #0 \n\
    add r1, #0x3c \n\
    b _0802D088 \n\
_0802CF3E: \n\
    add r0, r4, #0 \n\
    add r0, #0x32 \n\
    add r1, r5, #0 \n\
    add r1, #0x32 \n\
    b _0802D088 \n\
_0802CF48: \n\
    add r0, r4, #0 \n\
    sub r0, #0x48 \n\
    add r1, r5, #0 \n\
    b _0802D088 \n\
_0802CF50: \n\
    add r0, r4, #0 \n\
    add r0, #0x50 \n\
    add r1, r5, #0 \n\
    sub r1, #0x34 \n\
    b _0802D088 \n\
_0802CF5A: \n\
    add r0, r4, #0 \n\
    add r0, #0x10 \n\
    add r1, r5, #0 \n\
    add r1, #0x44 \n\
    b _0802D088 \n\
_0802CF64: \n\
    add r0, r4, #0 \n\
    sub r0, #0x40 \n\
    add r1, r5, #0 \n\
    sub r1, #0x34 \n\
    b _0802D088 \n\
_0802CF6E: \n\
    add r0, r4, #0 \n\
    add r0, #8 \n\
    add r1, r5, #0 \n\
    sub r1, #0x40 \n\
    b _0802D088 \n\
_0802CF78: \n\
    add r0, r4, #0 \n\
    sub r0, #0x48 \n\
    add r1, r5, #0 \n\
    add r1, #0x50 \n\
    b _0802D088 \n\
_0802CF82: \n\
    cmp r0, #6 \n\
    beq _0802CF88 \n\
    b _0802D0A8 \n\
_0802CF88: \n\
    ldrb r0, [r7] \n\
    cmp r0, #0x18 \n\
    bls _0802CF90 \n\
    b _0802D096 \n\
_0802CF90: \n\
    lsl r0, r0, #2 \n\
    ldr r1, _0802CF9C @ =_0802CFA0 \n\
    add r0, r0, r1 \n\
    ldr r0, [r0] \n\
    mov pc, r0 \n\
    .align 2, 0 \n\
_0802CF9C: .4byte _0802CFA0 \n\
_0802CFA0: @ jump table \n\
    .4byte _0802D004 @ case 0 \n\
    .4byte _0802D096 @ case 1 \n\
    .4byte _0802D00C @ case 2 \n\
    .4byte _0802D096 @ case 3 \n\
    .4byte _0802D014 @ case 4 \n\
    .4byte _0802D096 @ case 5 \n\
    .4byte _0802D01E @ case 6 \n\
    .4byte _0802D024 @ case 7 \n\
    .4byte _0802D034 @ case 8 \n\
    .4byte _0802D03E @ case 9 \n\
    .4byte _0802D048 @ case 10 \n\
    .4byte _0802D096 @ case 11 \n\
    .4byte _0802D050 @ case 12 \n\
    .4byte _0802D096 @ case 13 \n\
    .4byte _0802D058 @ case 14 \n\
    .4byte _0802D096 @ case 15 \n\
    .4byte _0802D062 @ case 16 \n\
    .4byte _0802D06C @ case 17 \n\
    .4byte _0802D076 @ case 18 \n\
    .4byte _0802D080 @ case 19 \n\
    .4byte _0802D096 @ case 20 \n\
    .4byte _0802D096 @ case 21 \n\
    .4byte _0802D096 @ case 22 \n\
    .4byte _0802D096 @ case 23 \n\
    .4byte _0802D090 @ case 24 \n\
_0802D004: \n\
    add r0, r4, #0 \n\
    sub r0, #0x30 \n\
    add r1, r5, #4 \n\
    b _0802D088 \n\
_0802D00C: \n\
    add r1, r5, #0 \n\
    sub r1, #0x48 \n\
    add r0, r4, #0 \n\
    b _0802D088 \n\
_0802D014: \n\
    add r0, r4, #0 \n\
    sub r0, #8 \n\
    add r1, r5, #0 \n\
    add r1, #0x40 \n\
    b _0802D088 \n\
_0802D01E: \n\
    add r0, r4, #0 \n\
    sub r0, #0x26 \n\
    b _0802D028 \n\
_0802D024: \n\
    add r0, r4, #0 \n\
    add r0, #0x26 \n\
_0802D028: \n\
    add r1, r5, #0 \n\
    sub r1, #0x30 \n\
_0802D02C: \n\
    movs r2, #0x26 \n\
    bl ParticleSet \n\
    b _0802D096 \n\
_0802D034: \n\
    add r0, r4, #0 \n\
    sub r0, #0x3c \n\
    add r1, r5, #0 \n\
    add r1, #0x3c \n\
    b _0802D088 \n\
_0802D03E: \n\
    add r0, r4, #0 \n\
    add r0, #0x32 \n\
    add r1, r5, #0 \n\
    add r1, #0x32 \n\
    b _0802D088 \n\
_0802D048: \n\
    add r0, r4, #0 \n\
    sub r0, #0x48 \n\
    add r1, r5, #0 \n\
    b _0802D088 \n\
_0802D050: \n\
    add r0, r4, #0 \n\
    add r0, #0x50 \n\
    add r1, r5, #0 \n\
    b _0802D088 \n\
_0802D058: \n\
    add r0, r4, #0 \n\
    add r0, #0x10 \n\
    add r1, r5, #0 \n\
    add r1, #0x44 \n\
    b _0802D088 \n\
_0802D062: \n\
    add r0, r4, #0 \n\
    sub r0, #0x40 \n\
    add r1, r5, #0 \n\
    sub r1, #0x34 \n\
    b _0802D088 \n\
_0802D06C: \n\
    add r0, r4, #0 \n\
    add r0, #8 \n\
    add r1, r5, #0 \n\
    sub r1, #0x40 \n\
    b _0802D088 \n\
_0802D076: \n\
    add r0, r4, #0 \n\
    sub r0, #0x48 \n\
    add r1, r5, #0 \n\
    add r1, #0x50 \n\
    b _0802D088 \n\
_0802D080: \n\
    add r0, r4, #0 \n\
    add r0, #0x4e \n\
    add r1, r5, #0 \n\
    add r1, #0x48 \n\
_0802D088: \n\
    movs r2, #0x25 \n\
    bl ParticleSet \n\
    b _0802D096 \n\
_0802D090: \n\
    ldr r1, _0802D0A4 @ =gCurrentSprite \n\
    movs r0, #0 \n\
    strh r0, [r1] \n\
_0802D096: \n\
    ldr r1, _0802D0A4 @ =gCurrentSprite \n\
    add r2, r1, #0 \n\
    add r2, #0x2e \n\
    ldrb r0, [r2] \n\
    add r0, #1 \n\
    strb r0, [r2] \n\
    b _0802D0AE \n\
    .align 2, 0 \n\
_0802D0A4: .4byte gCurrentSprite \n\
_0802D0A8: \n\
    movs r0, #0 \n\
    strh r0, [r6] \n\
    add r1, r6, #0 \n\
_0802D0AE: \n\
    add r0, r1, #0 \n\
    add r0, #0x2e \n\
    ldrb r0, [r0] \n\
    cmp r0, #0x19 \n\
    bne _0802D136 \n\
    ldr r0, _0802D100 @ =gAtmosphericStabilizersOnline \n\
    ldrh r2, [r0] \n\
    add r3, r2, #0 \n\
    movs r0, #1 \n\
    and r0, r2 \n\
    movs r1, #2 \n\
    and r1, r2 \n\
    cmp r1, #0 \n\
    beq _0802D0CC \n\
    add r0, #1 \n\
_0802D0CC: \n\
    movs r1, #4 \n\
    and r1, r2 \n\
    cmp r1, #0 \n\
    beq _0802D0DA \n\
    add r0, #1 \n\
    lsl r0, r0, #0x18 \n\
    lsr r0, r0, #0x18 \n\
_0802D0DA: \n\
    movs r1, #8 \n\
    and r2, r1 \n\
    cmp r2, #0 \n\
    beq _0802D0E8 \n\
    add r0, #1 \n\
    lsl r0, r0, #0x18 \n\
    lsr r0, r0, #0x18 \n\
_0802D0E8: \n\
    movs r1, #0x10 \n\
    and r3, r1 \n\
    cmp r3, #0 \n\
    beq _0802D0F6 \n\
    add r0, #1 \n\
    lsl r0, r0, #0x18 \n\
    lsr r0, r0, #0x18 \n\
_0802D0F6: \n\
    cmp r0, #1 \n\
    bne _0802D104 \n\
    movs r1, #1 \n\
    b _0802D122 \n\
    .align 2, 0 \n\
_0802D100: .4byte gAtmosphericStabilizersOnline \n\
_0802D104: \n\
    cmp r0, #2 \n\
    bne _0802D10C \n\
    movs r1, #2 \n\
    b _0802D122 \n\
_0802D10C: \n\
    cmp r0, #3 \n\
    bne _0802D114 \n\
    movs r1, #3 \n\
    b _0802D122 \n\
_0802D114: \n\
    cmp r0, #4 \n\
    bne _0802D11C \n\
    movs r1, #4 \n\
    b _0802D122 \n\
_0802D11C: \n\
    cmp r0, #5 \n\
    bne _0802D136 \n\
    movs r1, #5 \n\
_0802D122: \n\
    cmp r0, #0 \n\
    beq _0802D136 \n\
    add r0, r1, #0 \n\
    bl TrySpawnMessageBanner \n\
    ldr r1, _0802D13C @ =gPreventMovementTimer \n\
    movs r2, #0xfa \n\
    lsl r2, r2, #2 \n\
    add r0, r2, #0 \n\
    strh r0, [r1] \n\
_0802D136: \n\
    pop {r4, r5, r6, r7} \n\
    pop {r0} \n\
    bx r0 \n\
    .align 2, 0 \n\
_0802D13C: .4byte gPreventMovementTimer \n\
    ");
}
#endif

void AtmosphericStabilizerParasiteInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.frozenPaletteRowOffset = 1;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    switch (gCurrentSprite.roomSlot) {
        case 1:
            gCurrentSprite.hitboxTop = -0x20;
            gCurrentSprite.hitboxBottom = 0x20;
            gCurrentSprite.hitboxLeft = -0x18;
            gCurrentSprite.hitboxRight = 0x30;
            break;
        case 2:
            gCurrentSprite.hitboxTop = -0x20;
            gCurrentSprite.hitboxBottom = 0x20;
            gCurrentSprite.hitboxLeft = -0x30;
            gCurrentSprite.hitboxRight = 0x18;
            break;
        case 3:
            gCurrentSprite.hitboxTop = -0x18;
            gCurrentSprite.hitboxBottom = 0x30;
            gCurrentSprite.hitboxLeft = -0x20;
            gCurrentSprite.hitboxRight = 0x20;
            break;
        case 4:
            gCurrentSprite.hitboxTop = -0x18;
            gCurrentSprite.hitboxBottom = 0x30;
            gCurrentSprite.hitboxLeft = -0x30;
            gCurrentSprite.hitboxRight = 0x18;
            break;
        default:
            gCurrentSprite.status = 0;
    }
}

void AtmosphericStabilizerParasiteIdleInit(void) {
    gCurrentSprite.pOam = sAtmosphericStabilizerOam_327970;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 120;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

void AtmosphericStabilizerParasiteIdle(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    gCurrentSprite.yPosition = gSpriteData[primary].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primary].xPosition;
    if (CountPrimarySpritesThatCantAbsorbX() >= 5) {
        gCurrentSprite.work1 = 120;
    } else if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.pOam = sAtmosphericStabilizerOam_3279f8;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
        gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    }
}

void AtmosphericStabilizerParasiteSpawnX(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    gCurrentSprite.yPosition = gSpriteData[primary].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primary].xPosition;
    gCurrentSprite.work1--;
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    if (gCurrentSprite.work1 == 0) {
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
            SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
        AtmosphericStabilizerParasiteIdleInit();
    }
}

void AtmosphericStabilizerParasiteDeath(void) {
    u8 spriteId;
    u16 stabilizerBit;
    u8 primary = gCurrentSprite.primarySpriteRamSlot;

    gCurrentSprite.pOam = sAtmosphericStabilizerOam_327970;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gSpriteData[primary].pose = 0x17;

    // All stabilizer sprite ids are next to each other numerically, so doing spriteId - firstStabilizerId offsets the id to start at 0
    spriteId = gSpriteData[primary].spriteId;
    spriteId -= PSPRITE_ATMOSPHERIC_STABILIZER_1;

    // Get bit affected by the current stabilizer
    stabilizerBit = 1 << spriteId;

    gAtmosphericStabilizersOnline |= stabilizerBit;

    if (gAtmosphericStabilizersOnline == 31) // 11111 in binary
        EventCheckAdvance(EVENT_ALL_STABILIZERS_ONLINE);
}

void AtmosphericStabilizer(void) {
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            AtmosphericStabilizerInit();
            break;
        case 0x17:
            AtmosphericStabilizerBackOnlineInit();
        case 0x18:
            gCurrentSprite.ignoreSamusCollisionTimer = 1;
            AtmosphericStabilizerBackOnline();
            break;
        default:
            if (MOD_AND(gFrameCounter8Bit, 2) != 0) {
                if (gCurrentSprite.work2) {
                    if (gCurrentSprite.status & SS_FACING_RIGHT)
                        gCurrentSprite.xPosition += 1;
                    else
                        gCurrentSprite.xPosition -= 1;
                } else {
                    if (gCurrentSprite.status & SS_FACING_RIGHT)
                        gCurrentSprite.yPosition += 1;
                    else
                        gCurrentSprite.yPosition -= 1;
                }
                if (--gCurrentSprite.work1 == 0) {
                    gCurrentSprite.work1 = 64;
                    gCurrentSprite.status ^= SS_FACING_RIGHT;
                }
            }
    }
}

void AtmosphericStabilizerCover(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            AtmosphericStabilizerCoverInit();
        case SPRITE_POSE_IDLE:
            AtmosphericStabilizerCoverIdle();
            break;
        case 0x18:
            AtmosphericStabilizerCoverExploding();
    }
}

void AtmosphericStabilizerParasite(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_160);
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            AtmosphericStabilizerParasiteInit();
        case SPRITE_POSE_IDLE_INIT:
            AtmosphericStabilizerParasiteIdleInit();
        case SPRITE_POSE_IDLE:
            AtmosphericStabilizerParasiteIdle();
            break;
        case 0x18:
            AtmosphericStabilizerParasiteSpawnX();
            break;
        case SPRITE_POSE_DYING_INIT:
            AtmosphericStabilizerParasiteDeath();
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
    }
}
