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
    gCurrentSprite.spritesetSlotAndProperties = SSP_UNINFECTED_OR_BOSS;
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

void AtmosphericStabilizerCoverExploding(void) {
    // https://decomp.me/scratch/kUtO7
    u16 y = gCurrentSprite.yPosition, x = gCurrentSprite.xPosition;

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
        register u32 count asm("r0"); // FIXME fakematch
        u32 messageType;
        u16 stabilizersOnline;
        stabilizersOnline = gAtmosphericStabilizersOnline;
        count = stabilizersOnline & 1;
        if (stabilizersOnline & 2) count++;
        if (stabilizersOnline & 4) count++, count <<= 0x18, count >>= 0x18;
        if (stabilizersOnline & 8) count++, count <<= 0x18, count >>= 0x18;
        if (stabilizersOnline & 0x10) count++, count <<= 0x18, count >>= 0x18;
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
            TrySpawnMessageBanner(messageType);
            gPreventMovementTimer = 1000;
        }
    }
}

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
