#include "macros.h"
#include "globals.h"

#include "data/sprites/core_x.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/event.h"
#include "constants/particle.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"
#include "structs/demo.h"

void CoreXMakeXParasitesFlee(void) {
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
        if (gSpriteData[i].status & SS_EXISTS && !(gSpriteData[i].properties & SP_SECONDARY_SPRITE)
            && gSpriteData[i].spriteId == PSPRITE_X_PARASITE_CORE_X_OR_PARASITE && gSpriteData[i].pose == X_PARASITE_POSE_FLYING) {
            gSpriteData[i].xParasiteTimer = 0;
            gSpriteData[i].pose = X_PARASITE_POSE_FLYING_AWAY;
        }
    }
}

void CoreXAbilityTransfromation(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.xParasiteTimer != 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    } else {
        gCurrentSprite.pose = 0x1b;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    }
    if (gCurrentSprite.xParasiteTimer < 8) {
        SpriteLoadGfx(PSPRITE_MESSAGE_BOX, 6, gCurrentSprite.xParasiteTimer);
    } else if (gCurrentSprite.xParasiteTimer == 8) {
        SpriteLoadPal(PSPRITE_MESSAGE_BOX, 6, 2);
    }
}


void CoreXAbilityInit(void) {
    u8 bossAlreadyDead = FALSE;
    u8 bossSpriteId = PSPRITE_ARACHNUS;
    u8 secondarySpriteId = SSPRITE_CORE_X_SHELL_MORPH_BALL;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.pose == 0x59) {
        switch (gCurrentSprite.spriteId) {
            case PSPRITE_MORPH_BALL_ABILITY:
                gCurrentSprite.yPosition -= 0x80;
                secondarySpriteId = SSPRITE_CORE_X_SHELL_MORPH_BALL;
                break;
            case PSPRITE_HIGH_JUMP_ABILITY:
                secondarySpriteId = SSPRITE_CORE_X_SHELL_HIGH_JUMP;
                break;
            case PSPRITE_SPEEDBOOSTER_ABILITY:
                secondarySpriteId = SSPRITE_CORE_X_SHELL_SPEEDBOOSTER;
                break;
            case PSPRITE_SPACE_JUMP_ABILITY:
                secondarySpriteId = SSPRITE_CORE_X_SHELL_SPACE_JUMP;
                break;
            case PSPRITE_GRAVITY_SUIT_ABILITY:
                gCurrentSprite.yPosition -= 0x80;
                gCurrentSprite.xPosition -= 0x40;
                secondarySpriteId = SSPRITE_CORE_X_SHELL_GRAVITY;
                break;
            case PSPRITE_SCREW_ATTACK_ABILITY:
                secondarySpriteId = SSPRITE_CORE_X_SHELL_SCREW_ATTACK;
                break;
        }
        gCurrentSprite.pose = 0x5a;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
        gCurrentSprite.status &= ~(SS_SAMUS_DETECTED | SS_SAMUS_COLLIDING);
    } else {
        switch (gCurrentSprite.spriteId) {
            case PSPRITE_MORPH_BALL_ABILITY:
                if (gEquipment.suitMiscStatus & SMF_MORPH_BALL) {
                    bossAlreadyDead = TRUE;
                }
                break;
            case PSPRITE_HIGH_JUMP_ABILITY:
                if (gEquipment.suitMiscStatus & SMF_HIGH_JUMP) {
                    bossAlreadyDead = TRUE;
                }
                bossSpriteId = PSPRITE_ZAZABI;
                secondarySpriteId = SSPRITE_CORE_X_SHELL_HIGH_JUMP;
                break;
            default:
                bossAlreadyDead = TRUE;
                break;
        }
        if (bossAlreadyDead) {
            gCurrentSprite.status = 0;
            return;
        }
        gBossFormationSpriteId = bossSpriteId;
        gCoreXFormationSpriteId = gCurrentSprite.spriteId;
        gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
        gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
        gCurrentSprite.yPosition -= 0x180;
        gCurrentSprite.pose = 1;
    }
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawOrder = 6;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= 0x8000;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.pOam = sCoreXAbilityOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;
    bossAlreadyDead = SpriteSpawnSecondary(secondarySpriteId, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, // Need to reuse variable to make it matching.
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (bossAlreadyDead == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    bossAlreadyDead = SpriteSpawnSecondary(SSPRITE_ABILITY_AURA, 0, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (bossAlreadyDead == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    bossAlreadyDead = SpriteSpawnSecondary(SSPRITE_ABILITY_AURA, 1, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (bossAlreadyDead == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    bossAlreadyDead = SpriteSpawnSecondary(SSPRITE_ABILITY_AURA, 2, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (bossAlreadyDead == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
}

void CoreXAbilityIdleInit(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sCoreXAbilityOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void CoreXAbilityIdle(void) {
    u8 offset;
    s16 movement;
    u16 xPosOnScreen;
    u8 ramSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.status ^= SS_NOT_DRAWN;

    offset = gCurrentSprite.work4;
    movement = sCoreXIdleYSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sCoreXIdleYSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    offset = gCurrentSprite.work3;
    movement = sCoreXIdleXSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sCoreXIdleXSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;

    xPosOnScreen = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition);
    if (gCurrentSprite.yPosition < gSamusData.yPosition) {
        if (xPosOnScreen > 20) {
            if (xPosOnScreen < SCREEN_SIZE_X - 20) {
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 0, 0,
                    gCurrentSprite.primarySpriteRamSlot, SSP_X_UNABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition + 0xb4, gCurrentSprite.xPosition - 0x14, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 1, 0,
                    gCurrentSprite.primarySpriteRamSlot, SSP_X_UNABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition - 0xc8, gCurrentSprite.xPosition + 0xa, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 2, 0,
                    gCurrentSprite.primarySpriteRamSlot, SSP_X_UNABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition + 0x82, gCurrentSprite.xPosition + 0x8c, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 3, 0,
                    gCurrentSprite.primarySpriteRamSlot, SSP_X_UNABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition - 0x82, gCurrentSprite.xPosition + 0x96, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 4, 0,
                    gCurrentSprite.primarySpriteRamSlot, SSP_X_UNABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition + 0x8c, gCurrentSprite.xPosition - 0xa0, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 5, 0,
                    gCurrentSprite.primarySpriteRamSlot, SSP_X_UNABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition - 0x96, gCurrentSprite.xPosition - 0x82, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                gCurrentSprite.pose = 0x18;
                gCurrentSprite.work1 = 80;
                gCurrentSprite.rotation = 190;
            }
        }
    }
}

void CoreXAbilityMovingToSpawnPoint(void) {
    u8 offset;
    s16 movement;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.status ^= SS_NOT_DRAWN;

    offset = gCurrentSprite.work4;
    movement = sCoreXIdleYSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sCoreXIdleYSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    offset = gCurrentSprite.work3;
    movement = sCoreXIdleXSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sCoreXIdleXSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;

    if (gBossFormationSpriteId == PSPRITE_ZAZABI) {
        if (gCurrentSprite.yPosition >= gCurrentSprite.xParasiteTimer - 0x140) {
            gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer - 0x140;
            if (gCurrentSprite.rotation == 0) {
                gCurrentSprite.pose = 0x1a;
                gCurrentSprite.status |= SS_ENABLE_MOSAIC;
                gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
                gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
                PlayMusic(MUSIC_ZAZABI_BATTLE, 7);
            }
        } else {
            gCurrentSprite.yPosition += 1;
        }
    } else {
        if (gCurrentSprite.yPosition >= gCurrentSprite.xParasiteTimer - 0x64) {
            gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer - 0x64;
            if (gCurrentSprite.rotation == 0) {
                gCurrentSprite.pose = 0x1a;
                gCurrentSprite.status |= SS_ENABLE_MOSAIC;
                gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
                gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
                if (gDemoState == 0) {
                    PlayMusic(MUSIC_ARACHNUS_BATTLE, 7);
                }
            }
        } else {
            gCurrentSprite.yPosition += 1;
        }
    }
    if (gCurrentSprite.rotation != 0) {
        gCurrentSprite.rotation--;
    }
    if (gCurrentSprite.work1 == 80) {
        SoundPlay(0xc4);
    }
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.work1 = 80;
    }
}

void CoreXAbilitySpawningBoss(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.work1 != 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    } else {
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
        gCurrentSprite.spriteId = gBossFormationSpriteId;
    }
    if (gCurrentSprite.work1 < 8 * 4) {
        SpriteLoadGfx(gBossFormationSpriteId, 0, gCurrentSprite.work1);
    } else if (gCurrentSprite.work1 == 8 * 4) {
        SpriteLoadPal(gBossFormationSpriteId, 0, 4); // Only loads the first 4 palette rows
    }
}

void CoreXAbilityMovingInit(void) {
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition + 0x64, gCurrentSprite.xPosition, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition - 0x64, gCurrentSprite.xPosition, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition + 0x22, gCurrentSprite.xPosition + 0x64, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition + 0x22, gCurrentSprite.xPosition - 0x64, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition - 0x22, gCurrentSprite.xPosition + 0x64, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition - 0x22, gCurrentSprite.xPosition - 0x64, 0);
    gCurrentSprite.pose = 0x1c;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.work0 = 0;
}

void CoreXAbilityMoving(void) {
    XParasiteMoveWithSound((u16)(gSamusData.yPosition - 0x48), gSamusData.xPosition, 0x1c, 0x28, 2, 0xc0);
}

void CoreXAbilityMovingToTargetInit(void) {
    gCurrentSprite.pose = 0x5d;
    gCurrentSprite.samusCollision = SSC_CORE_X_ABILITY;
    gCurrentSprite.health = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    PlayMusic(MUSIC_BOSS_TENSION, 6);
}

void CoreXAbilityMovingToTarget(void) {
    CoreXMakeXParasitesFlee();
    if ((gFrameCounter8Bit & 3) == 0) {
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    }
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteMoveWithSound(gAbilityRestingYPosition, gAbilityRestingXPosition, 0x10, 0x18, 2, 0x141);
    if (gCurrentSprite.yPosition < gAbilityRestingYPosition + 6 && gCurrentSprite.yPosition > gAbilityRestingYPosition - 6) {
        if (gCurrentSprite.xPosition < gAbilityRestingXPosition + 6 && gCurrentSprite.xPosition > gAbilityRestingXPosition - 6) {
            gCurrentSprite.pose = 0x5e;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.work3 = 0;
            gCurrentSprite.work4 = 0;
        }
    }
}

void CoreXAbilityWaitingAtTarget(void) {
    u8 offset;
    s16 movement;

    offset = gCurrentSprite.work4;
    movement = sCoreXIdleYSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sCoreXIdleYSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    offset = gCurrentSprite.work3;
    movement = sCoreXIdleXSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sCoreXIdleXSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;

    if (gCurrentSprite.status & SS_SAMUS_COLLIDING) {
        gPreventMovementTimer = 1000;
        gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
        gCurrentSprite.pose = 0x5f;
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        gCurrentSprite.work2 = 0;
        gCurrentSprite.work3 = 1;
        gCurrentSprite.work1 = 0;
        gCurrentSprite.work4 = 1;
        gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
        gCurrentSprite.rotation = 0;
        gCurrentSprite.scaling = Q_8_8(1);
        gCurrentSprite.xParasiteTimer = 20;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pOam = sCoreXAbilityOam_GettingAbsorbed;
        ParticleSet(gSamusData.yPosition + gSamusData.drawDistanceTop / 2, gSamusData.xPosition, PE_ABSORB_CORE_X);
        switch (gCurrentSprite.spriteId) {
            case PSPRITE_MORPH_BALL_ABILITY:
                EventCheckAdvance(EVENT_MORPH_BALL_ABILITY_RECOVERED);
                break;
            case PSPRITE_HIGH_JUMP_ABILITY:
                EventCheckAdvance(EVENT_HIGH_JUMP_ABILITY_RECOVERED);
                break;
            case PSPRITE_SPEEDBOOSTER_ABILITY:
                EventCheckAdvance(EVENT_SPEED_BOOSTER_ABILITY_RECOVERED);
                break;
            case PSPRITE_VARIA_SUIT_ABILITY:
                EventCheckAdvance(EVENT_VARIA_SUIT_ABILITY_RECOVERED);
                break;
            case PSPRITE_SPACE_JUMP_ABILITY:
                EventCheckAdvance(EVENT_SPACE_JUMP_ABILITY_RECOVERED);
                break;
            case PSPRITE_GRAVITY_SUIT_ABILITY:
                EventCheckAdvance(EVENT_GRAVITY_SUIT_ABILITY_RECOVERED);
                break;
            case PSPRITE_SCREW_ATTACK_ABILITY:
                EventCheckAdvance(EVENT_SCREW_ATTACK_ABILITY_RECOVERED);
        }
        SpriteUtilRefillSamus(400, 50, 10);
        gSamusEnvironmentalEffects[0].externalTimer = 48;
        SoundPlay(0x92);
    } else if ((gFrameCounter8Bit & 0x3f) == 0) {
        SoundPlay(0xc3);
    }
}

void CoreXAbilityGettingAbsorbed(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteStickToSamus();
    if (gCurrentSprite.xParasiteTimer != 0) {
        gCurrentSprite.xParasiteTimer--;
    } else if (gCurrentSprite.scaling > Q_8_8(0.3125f)) {
        gCurrentSprite.scaling -= Q_8_8(0.03125f);
    } else {
        gCurrentSprite.status = 0;
        SpriteSpawnPrimary(PSPRITE_MESSAGE_BOX, 0, 6, SSP_CAN_ABSORB_ADDITIONAL_X, gAbilityRestingYPosition, gAbilityRestingXPosition, 0);
    }
}

void CoreXAbility(void) {
    switch (gCurrentSprite.pose) {
        case 0x59:
            CoreXAbilityInit();
        case 0x5a:
            CoreXAbilityTransfromation();
            break;
        case 0:
            CoreXAbilityInit();
            break;
        case 1:
            CoreXAbilityIdleInit();
        case 2:
            CoreXAbilityIdle();
            break;
        case 0x18:
            CoreXAbilityMovingToSpawnPoint();
            break;
        case 0x1a:
            CoreXAbilitySpawningBoss();
            break;
        case 0x1b:
            CoreXAbilityMovingInit();
        case 0x1c:
            CoreXAbilityMoving();
            break;
        case 0x5c:
            CoreXAbilityMovingToTargetInit();
            break;
        case 0x5d:
            CoreXAbilityMovingToTarget();
            break;
        case 0x5e:
            CoreXAbilityWaitingAtTarget();
            break;
        case 0x5f:
            CoreXAbilityGettingAbsorbed();
    }
    if (gCurrentSprite.pose <= 0x1a) {
        gXParasiteTargetYPosition = gCurrentSprite.yPosition;
        gXParasiteTargetXPosition = gCurrentSprite.xPosition;
    }
}

void CoreXShell(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    u16 maxHealth = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    u8 tmp;
    switch (gCurrentSprite.pose) {
        case 0x18: {
            gCurrentSprite.ignoreSamusCollisionTimer = 1;
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.status = 0;
            }
            return;
        }
        case 0: {
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.frozenPaletteRowOffset = 1;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.drawOrder = 5;
            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
            gCurrentSprite.health = maxHealth;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 0x18;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x50;
            gCurrentSprite.hitboxBottom = 0x50;
            gCurrentSprite.hitboxLeft = -0x50;
            gCurrentSprite.hitboxRight = 0x50;
            gCurrentSprite.pOam = sCoreXShellOam_White;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
            gCurrentSprite.pose = 2;
            break;
        }
    }
    gCurrentSprite.yPosition = gSpriteData[primaryRamSlot].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primaryRamSlot].xPosition;
    if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC) {
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    } else {
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
    switch (gSpriteData[primaryRamSlot].pose) {
        case 0x1a: {
            if (gSpriteData[primaryRamSlot].work1 <= 8 * 4) {
                gCurrentSprite.status = 0;
            }
        }
        case 1:
        case 2:
        case 0x18: {
            gCurrentSprite.ignoreSamusCollisionTimer = 1;
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            break;
        }
        case 0x1b: {
            gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        }
        case 0x1c: {
            if (gCurrentSprite.health == 0) {
                gCurrentSprite.samusCollision = SSC_NONE;
                gCurrentSprite.pOam = sCoreXShellOam_Breaking;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x18;
                gSpriteData[primaryRamSlot].pose = 0x5c;
                SoundPlay(0xc1);
            } else {
                if (gCurrentSprite.health <= maxHealth / 3) {
                    gCurrentSprite.pOam = sCoreXShellOam_Red;
                    gCurrentSprite.frozenPaletteRowOffset = 3;
                } else if (gCurrentSprite.health <= maxHealth * 2 / 3) {
                    gCurrentSprite.pOam = sCoreXShellOam_Yellow;
                    gCurrentSprite.frozenPaletteRowOffset = 2;
                }
                if (SPRITE_HAS_ISFT(gCurrentSprite) == 1) {
                    tmp = SpriteUtilCountPrimarySprites(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE);
                    if (tmp < 6) {
                        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
                            SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                    }
                } else if (SPRITE_HAS_ISFT(gCurrentSprite) == 16) {
                    SoundPlay(0xc2);
                    gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
                    gSpriteData[primaryRamSlot].work0 = 180;
                    if (gCurrentSprite.yPosition > gSamusData.yPosition - 0x40) {
                        gSpriteData[primaryRamSlot].status |= SS_SAMUS_DETECTED;
                    } else {
                        gSpriteData[primaryRamSlot].status &= ~SS_SAMUS_DETECTED;
                    }
                    if (gCurrentSprite.xPosition > gSamusData.xPosition) {
                        gSpriteData[primaryRamSlot].status |= SS_FACING_RIGHT;
                    } else {
                        gSpriteData[primaryRamSlot].status &= ~SS_FACING_RIGHT;
                    }
                    gSpriteData[primaryRamSlot].work2 = 40;
                    gSpriteData[primaryRamSlot].work3 = 40;
                    gSpriteData[primaryRamSlot].work1 = 28;
                    gSpriteData[primaryRamSlot].work4 = 28;
                }
                tmp = gSpriteData[primaryRamSlot].work0;
                if (tmp != 0) {
                    if ((tmp & 3) == 0) {
                        if ((tmp & 4) != 0) {
                            gCurrentSprite.paletteRow = 0xd - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
                        } else {
                            gCurrentSprite.paletteRow = 0;
                        }
                    }
                    if (--gSpriteData[primaryRamSlot].work0 == 0) {
                        gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;
                        gCurrentSprite.paletteRow = 0;
                    }
                }
            }
        }
    }
}

void AbilityAura(void) {
    // https://decomp.me/scratch/wYMqx
    u8 primaryRamSlot;
    
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (gCurrentSprite.pose == 0) {
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
        gCurrentSprite.drawDistanceTop = 0x10;
        gCurrentSprite.drawDistanceBottom = 0x10;
        gCurrentSprite.drawDistanceHorizontal = 0x10;
        gCurrentSprite.hitboxTop = -4;
        gCurrentSprite.hitboxBottom = 4;
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 4;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = 2;
        if (gCurrentSprite.roomSlot == 2) {
            gCurrentSprite.pOam = sCoreXStaticOam_2;
        } else if (gCurrentSprite.roomSlot == 1) {
            gCurrentSprite.pOam = sCoreXStaticOam_1;
        } else {
            gCurrentSprite.pOam = sCoreXStaticOam_0;
        }
    }
    gCurrentSprite.yPosition = gSpriteData[primaryRamSlot].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primaryRamSlot].xPosition;
    if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC) {
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    } else {
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
    switch (gSpriteData[primaryRamSlot].pose) {
        case 0x37:
        case 0x38:
        case 0x39:
        case 0x3a:
        case 0x3b:
            gCurrentSprite.status |= SS_NOT_DRAWN;
            break;
        case 0x1a:
            if (gSpriteData[primaryRamSlot].work1 <= 8 * 4) {
                // FIXME fakematch
                #ifdef NON_MATCHING
                gCurrentSprite.status = 0;
                #else
                asm("movs r0, #0 \n\
                     mov r5, ip \n\
                     strh r0, [r5] \n\
                ");
                #endif
            }
        case 1:
        case 2:
        case 0x18:
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            break;
        case 0x5c:
            if (gCurrentSprite.roomSlot != 0) {
                gCurrentSprite.status = 0;
            } else {
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pOam = sCoreXAbilityAuraOam_Fast;
            }
            break;
        case 0x5d:
            if ((gFrameCounter8Bit & 3) == 0) {
                gCurrentSprite.status ^= SS_NOT_DRAWN;
            }
            break;
        case 0x3c:
        case 0x5e:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            break;
        case 0x5f:
            gCurrentSprite.status = 0;
    }
}
