#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/pillar.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/projectile.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/power_bomb.h"
#include "structs/projectile.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u8 PillarProjectileCollision(void) {
    u16 spriteY, spriteX;
    u16 spriteTop, spriteBottom, spriteLeft, spriteRight;
    u16 projY, projX;
    u16 projTop, projBottom, projLeft, projRight;
    u8 i;

    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;

    spriteTop = spriteY + gCurrentSprite.hitboxTop;
    spriteBottom = spriteY + gCurrentSprite.hitboxBottom;
    spriteLeft = spriteX + gCurrentSprite.hitboxLeft;
    spriteRight = spriteX + gCurrentSprite.hitboxRight;

    if (gCurrentPowerBomb.animationState != 0 && gEquipment.weaponsStatus & MBF_POWER_BOMBS) {
        projY = gCurrentPowerBomb.yPosition;
        projX = gCurrentPowerBomb.xPosition;

        projTop = projY + gCurrentPowerBomb.hitboxTop;
        projBottom = projY + gCurrentPowerBomb.hitboxBottom;
        projLeft = projX + gCurrentPowerBomb.hitboxLeft;
        projRight = projX + gCurrentPowerBomb.hitboxRight;

        if (SpriteUtilCheckObjectsTouching(projTop, projBottom, projLeft, projRight, spriteTop, spriteBottom, spriteLeft, spriteRight))
            return TRUE;
    }

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++) {
        if (!(gProjectileData[i].status & PROJ_STATUS_EXISTS)) continue;
        if (!(gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT)) continue;

        if (gProjectileData[i].type == PROJ_TYPE_CHARGED_WAVE_BEAM
            || gProjectileData[i].type == PROJ_TYPE_WAVE_BEAM
            || gProjectileData[i].type == PROJ_TYPE_BOMB
            || gProjectileData[i].type == PROJ_TYPE_DIFFUSION_FLAKE) {
            projY = gProjectileData[i].yPosition;
            projX = gProjectileData[i].xPosition;

            projTop = projY + gProjectileData[i].hitboxTop;
            projBottom = projY + gProjectileData[i].hitboxBottom;
            projLeft = projX + gProjectileData[i].hitboxLeft;
            projRight = projX + gProjectileData[i].hitboxRight;

            if (SpriteUtilCheckObjectsTouching(projTop, projBottom, projLeft, projRight, spriteTop, spriteBottom, spriteLeft, spriteRight))
                return TRUE;
        }
    }

    return FALSE;
}

void PillarInit(void) {
    gCurrentSprite.status |= SS_NOT_DRAWN;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.health = 0;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.pose = 1;
    switch (gCurrentSprite.spritesetSlotAndProperties) {
        case SSP_UNINFECTED_OR_BOSS | 1:
            gCurrentSprite.work0 = FALSE;
            gCurrentSprite.pOam = sPillarOam_37a984;
            gCurrentSprite.drawDistanceTop = 0x40;
            gCurrentSprite.drawDistanceBottom = 0;
            gCurrentSprite.drawDistanceHorizontal = 8;
            gCurrentSprite.hitboxTop = -0x3c;
            gCurrentSprite.hitboxBottom = 0;
            gCurrentSprite.hitboxLeft = -0x1c;
            gCurrentSprite.hitboxRight = 0x1c;
            break;
        case SSP_UNINFECTED_OR_BOSS | 2:
            gCurrentSprite.work0 = TRUE;
            gCurrentSprite.status |= SS_X_FLIP;
            gCurrentSprite.pOam = sPillarOam_37ab8c;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x40;
            gCurrentSprite.hitboxTop = -0x1c;
            gCurrentSprite.hitboxBottom = 0x1c;
            gCurrentSprite.hitboxLeft = -0x40;
            gCurrentSprite.hitboxRight = 0;
            gCurrentSprite.yPosition -= 0x20;
            gCurrentSprite.xPosition += 0x20;
            break;
        case SSP_UNINFECTED_OR_BOSS | 3:
            gCurrentSprite.work0 = TRUE;
            gCurrentSprite.pOam = sPillarOam_37ab8c;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x40;
            gCurrentSprite.hitboxTop = -0x1c;
            gCurrentSprite.hitboxBottom = 0x1c;
            gCurrentSprite.hitboxLeft = 0;
            gCurrentSprite.hitboxRight = 0x40;
            gCurrentSprite.yPosition -= 0x20;
            gCurrentSprite.xPosition -= 0x20;
            break;
        default:
            gCurrentSprite.status = 0;
    }
}

void PillarIdle(void) {
    if (PillarProjectileCollision()) {
        gCurrentSprite.health = 1;
        gCurrentSprite.ignoreSamusCollisionTimer = 0;
        gCurrentSprite.invincibilityStunFlashTimer = 0;
        gCurrentSprite.samusCollision = SSC_SOLID;
        gCurrentSprite.pose = 2;
        gCurrentSprite.status &= ~(SS_NOT_DRAWN | SS_IGNORE_PROJECTILES);
        gCurrentSprite.work1 = 16;
        gCurrentSprite.properties |= SP_SOLID_FOR_PROJECTILES;
        SoundPlay(SOUND_PILLAR_EXTENDING);
    }
}

void PillarExtending(void) {
    u16 y, x;
    u8 caa;

    if (gCurrentSprite.work1 > 0) {
        if (gCurrentSprite.work0) {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.xPosition -= PIXEL_SIZE;
            else
                gCurrentSprite.xPosition += PIXEL_SIZE;
        } else
            gCurrentSprite.yPosition -= PIXEL_SIZE;
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            if (gCurrentSprite.work0)
                gCurrentSprite.pOam = sPillarOam_37a9bc;
            else
                gCurrentSprite.pOam = sPillarOam_37a7b4;
        }
    } else {
        if (gCurrentSprite.animationDurationCounter == 1 && gCurrentSprite.currentAnimationFrame > 0) {
            if (gCurrentSprite.work0) {
                if (gCurrentSprite.status & SS_X_FLIP)
                    gCurrentSprite.hitboxLeft -= PIXEL_SIZE * 2;
                else
                    gCurrentSprite.hitboxRight += PIXEL_SIZE * 2;
            } else
                gCurrentSprite.hitboxTop -= PIXEL_SIZE * 2;
            if (MOD_AND(gCurrentSprite.currentAnimationFrame, 8) == 0)
                SoundPlay(SOUND_PILLAR_EXTENDING);
        }
        if (SpriteUtilCheckEndCurrentSpriteAnim()) {
            gCurrentSprite.pose = 0x18;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;

            caa = CAA_MAKE_SOLID;
            y = gCurrentSprite.yPosition;
            x = gCurrentSprite.xPosition;
            if (gCurrentSprite.work0) {
                gCurrentSprite.pOam = sPillarOam_37ab54;
                if (gCurrentSprite.status & SS_X_FLIP) {
                    gCurrentClipdataAffectingAction = caa;
                    ClipdataProcess(y, x - BLOCK_TO_SUB_PIXEL(0.5));
                    gCurrentClipdataAffectingAction = caa;
                    ClipdataProcess(y, x - BLOCK_TO_SUB_PIXEL(1.5));
                    gCurrentClipdataAffectingAction = caa;
                    ClipdataProcess(y, x - BLOCK_TO_SUB_PIXEL(2.5));
                    gCurrentClipdataAffectingAction = caa;
                    ClipdataProcess(y, x - BLOCK_TO_SUB_PIXEL(3.5));
                } else {
                    gCurrentClipdataAffectingAction = caa;
                    ClipdataProcess(y, x + BLOCK_TO_SUB_PIXEL(0.5));
                    gCurrentClipdataAffectingAction = caa;
                    ClipdataProcess(y, x + BLOCK_TO_SUB_PIXEL(1.5));
                    gCurrentClipdataAffectingAction = caa;
                    ClipdataProcess(y, x + BLOCK_TO_SUB_PIXEL(2.5));
                    gCurrentClipdataAffectingAction = caa;
                    ClipdataProcess(y, x + BLOCK_TO_SUB_PIXEL(3.5));
                }
            } else {
                gCurrentSprite.pOam = sPillarOam_37a94c;
                gCurrentClipdataAffectingAction = caa;
                ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(0.5), x);
                gCurrentClipdataAffectingAction = caa;
                ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(1.5), x);
                gCurrentClipdataAffectingAction = caa;
                ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(2.5), x);
                gCurrentClipdataAffectingAction = caa;
                ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(3.5), x);
            }
        }
    }
}

void Pillar(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            PillarInit();
            break;
        case 1:
            PillarIdle();
            break;
        case 2:
            PillarExtending();
    }
}
