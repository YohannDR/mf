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

void MakeXParasitesFlee(void) {
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
        if (gSpriteData[i].status & SS_EXISTS && !(gSpriteData[i].properties & SP_SECONDARY_SPRITE)
            && gSpriteData[i].spriteId == PSPRITE_X_PARASITE_CORE_X_OR_PARASITE && gSpriteData[i].pose == 0x5d) {
            gSpriteData[i].xParasiteTimer = 0;
            gSpriteData[i].pose = 0x61;
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
        gCurrentSprite.xParasiteTimer = 44;
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
                    gCurrentSprite.primarySpriteRamSlot, 0x30, gCurrentSprite.yPosition + 0xb4, gCurrentSprite.xPosition - 0x14, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 1, 0,
                    gCurrentSprite.primarySpriteRamSlot, 0x30, gCurrentSprite.yPosition - 0xc8, gCurrentSprite.xPosition + 0xa, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 2, 0,
                    gCurrentSprite.primarySpriteRamSlot, 0x30, gCurrentSprite.yPosition + 0x82, gCurrentSprite.xPosition + 0x8c, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 3, 0,
                    gCurrentSprite.primarySpriteRamSlot, 0x30, gCurrentSprite.yPosition - 0x82, gCurrentSprite.xPosition + 0x96, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 4, 0,
                    gCurrentSprite.primarySpriteRamSlot, 0x30, gCurrentSprite.yPosition + 0x8c, gCurrentSprite.xPosition - 0xa0, 0);
                if (ramSlot != UCHAR_MAX) {
                    gSpriteData[ramSlot].xParasiteTimer = 180;
                }
                ramSlot = SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_FORMATION, 5, 0,
                    gCurrentSprite.primarySpriteRamSlot, 0x30, gCurrentSprite.yPosition - 0x96, gCurrentSprite.xPosition - 0x82, 0);
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
                gCurrentSprite.work1 = 44;
                gWrittenToMosaic_H = sXParasiteMosaicValues[44];
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
                gCurrentSprite.work1 = 44;
                gWrittenToMosaic_H = sXParasiteMosaicValues[44];
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
        SpriteLoadPal(gBossFormationSpriteId, 0, 4);
    }
}

void CoreXAbilityMovingInit(void) {
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        0x20, gCurrentSprite.yPosition + 0x64, gCurrentSprite.xPosition, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        0x20, gCurrentSprite.yPosition - 0x64, gCurrentSprite.xPosition, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        0x20, gCurrentSprite.yPosition + 0x22, gCurrentSprite.xPosition + 0x64, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        0x20, gCurrentSprite.yPosition + 0x22, gCurrentSprite.xPosition - 0x64, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        0x20, gCurrentSprite.yPosition - 0x22, gCurrentSprite.xPosition + 0x64, 0);
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
        0x20, gCurrentSprite.yPosition - 0x22, gCurrentSprite.xPosition - 0x64, 0);
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
    MakeXParasitesFlee();
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
        gCurrentSprite.scaling = 0x100;
        gCurrentSprite.xParasiteTimer = 0x14;
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
    } else {
        if ((gFrameCounter8Bit & 0x3f) == 0) {
            SoundPlay(0xc3);
        }
    }
}

void CoreXAbilityGettingAbsorbed(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteStickToSamus();
    if (gCurrentSprite.xParasiteTimer != 0) {
        gCurrentSprite.xParasiteTimer--;
    } else {
        if (gCurrentSprite.scaling > Q_8_8(0.3125f)) {
            gCurrentSprite.scaling -= Q_8_8(0.03125f);
        } else {
            gCurrentSprite.status = 0;
            SpriteSpawnPrimary(PSPRITE_MESSAGE_BOX, 0, 6, 0x10, gAbilityRestingYPosition, gAbilityRestingXPosition, 0);
        }
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

#ifdef NON_MATCHING
void CoreXShell(void) {
    // https://decomp.me/scratch/4p2V6
    u8 primaryRamSlot;
    u16 maxHealth;

    primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    maxHealth = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
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
            if (gSpriteData[primaryRamSlot].work1 <= 32) {
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
                    if ((u8)SpriteUtilCountPrimarySprites(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE) < 6) {
                        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0,
                            gCurrentSprite.primarySpriteRamSlot, 0x20, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
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
                if (gSpriteData[primaryRamSlot].work0 != 0) {
                    if ((gSpriteData[primaryRamSlot].work0 & 3) == 0) {
                        if ((gSpriteData[primaryRamSlot].work0 & 4) != 0) {
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
#else
NAKED_FUNCTION
void CoreXShell(void) {
    asm(" \n\
    push {r4, r5, r6, r7, lr} \n\
    mov r7, r8 \n\
    push {r7} \n\
    sub sp, #0x10 \n\
    ldr r2, _08025FD4 @ =gCurrentSprite \n\
    add r0, r2, #0 \n\
    add r0, #0x23 \n\
    ldrb r0, [r0] \n\
    mov r8, r0 \n\
    ldr r1, _08025FD8 @ =sSecondarySpriteStats \n\
    ldrb r0, [r2, #0x1d] \n\
    lsl r0, r0, #3 \n\
    add r0, r0, r1 \n\
    ldrh r6, [r0] \n\
    add r7, r2, #0 \n\
    add r7, #0x24 \n\
    ldrb r4, [r7] \n\
    add r5, r2, #0 \n\
    cmp r4, #0 \n\
    beq _08025FDC \n\
    cmp r4, #0x18 \n\
    bne _08026040 \n\
    add r1, r5, #0 \n\
    add r1, #0x26 \n\
    movs r0, #1 \n\
    strb r0, [r1] \n\
    bl SpriteUtilCheckEndCurrentSpriteAnim \n\
    cmp r0, #0 \n\
    bne _08025FCE \n\
    b _08026338 \n\
_08025FCE: \n\
    movs r0, #0 \n\
    strh r0, [r5] \n\
    b _08026338 \n\
    .align 2, 0 \n\
_08025FD4: .4byte gCurrentSprite \n\
_08025FD8: .4byte sSecondarySpriteStats \n\
_08025FDC: \n\
    ldrh r1, [r5] \n\
    movs r2, #0x80 \n\
    lsl r2, r2, #8 \n\
    add r0, r2, #0 \n\
    movs r3, #0 \n\
    orr r0, r1 \n\
    strh r0, [r5] \n\
    add r1, r5, #0 \n\
    add r1, #0x35 \n\
    movs r0, #1 \n\
    strb r0, [r1] \n\
    ldrh r1, [r5] \n\
    ldr r0, _0802606C @ =0x0000FFFB \n\
    and r0, r1 \n\
    strh r0, [r5] \n\
    add r1, r5, #0 \n\
    add r1, #0x22 \n\
    movs r0, #5 \n\
    strb r0, [r1] \n\
    ldr r0, _08026070 @ =gIoRegisters \n\
    ldrb r1, [r0, #0xa] \n\
    movs r0, #3 \n\
    and r0, r1 \n\
    add r1, r5, #0 \n\
    add r1, #0x21 \n\
    strb r0, [r1] \n\
    strh r6, [r5, #0x14] \n\
    add r0, r5, #0 \n\
    add r0, #0x27 \n\
    movs r2, #0x18 \n\
    strb r2, [r0] \n\
    add r0, #1 \n\
    strb r2, [r0] \n\
    add r0, #1 \n\
    strb r2, [r0] \n\
    ldr r1, _08026074 @ =0x0000FFB0 \n\
    strh r1, [r5, #0xa] \n\
    movs r0, #0x50 \n\
    strh r0, [r5, #0xc] \n\
    strh r1, [r5, #0xe] \n\
    strh r0, [r5, #0x10] \n\
    ldr r0, _08026078 @ =sCoreXShellOam_White \n\
    str r0, [r5, #0x18] \n\
    strb r3, [r5, #0x1c] \n\
    strh r4, [r5, #0x16] \n\
    add r0, r5, #0 \n\
    add r0, #0x25 \n\
    strb r2, [r0] \n\
    movs r0, #2 \n\
    strb r0, [r7] \n\
_08026040: \n\
    ldr r2, _0802607C @ =gSpriteData \n\
    mov r0, r8 \n\
    lsl r3, r0, #3 \n\
    sub r0, r3, r0 \n\
    lsl r0, r0, #3 \n\
    add r0, r0, r2 \n\
    ldrh r1, [r0, #2] \n\
    strh r1, [r5, #2] \n\
    ldrh r1, [r0, #4] \n\
    strh r1, [r5, #4] \n\
    ldrh r1, [r0] \n\
    movs r0, #0x20 \n\
    and r0, r1 \n\
    mov ip, r2 \n\
    add r7, r3, #0 \n\
    cmp r0, #0 \n\
    beq _08026080 \n\
    ldrh r0, [r5] \n\
    movs r1, #0x20 \n\
    orr r0, r1 \n\
    b _08026086 \n\
    .align 2, 0 \n\
_0802606C: .4byte 0x0000FFFB \n\
_08026070: .4byte gIoRegisters \n\
_08026074: .4byte 0x0000FFB0 \n\
_08026078: .4byte sCoreXShellOam_White \n\
_0802607C: .4byte gSpriteData \n\
_08026080: \n\
    ldrh r1, [r5] \n\
    ldr r0, _080260A8 @ =0x0000FFDF \n\
    and r0, r1 \n\
_08026086: \n\
    strh r0, [r5] \n\
    mov r1, r8 \n\
    sub r0, r7, r1 \n\
    lsl r0, r0, #3 \n\
    add r0, ip \n\
    add r0, #0x24 \n\
    ldrb r0, [r0] \n\
    sub r0, #1 \n\
    cmp r0, #0x1b \n\
    bls _0802609C \n\
    b _08026338 \n\
_0802609C: \n\
    lsl r0, r0, #2 \n\
    ldr r1, _080260AC @ =_080260B0 \n\
    add r0, r0, r1 \n\
    ldr r0, [r0] \n\
    mov pc, r0 \n\
    .align 2, 0 \n\
_080260A8: .4byte 0x0000FFDF \n\
_080260AC: .4byte _080260B0 \n\
_080260B0: @ jump table \n\
    .4byte _08026134 @ case 0 \n\
    .4byte _08026134 @ case 1 \n\
    .4byte _08026338 @ case 2 \n\
    .4byte _08026338 @ case 3 \n\
    .4byte _08026338 @ case 4 \n\
    .4byte _08026338 @ case 5 \n\
    .4byte _08026338 @ case 6 \n\
    .4byte _08026338 @ case 7 \n\
    .4byte _08026338 @ case 8 \n\
    .4byte _08026338 @ case 9 \n\
    .4byte _08026338 @ case 10 \n\
    .4byte _08026338 @ case 11 \n\
    .4byte _08026338 @ case 12 \n\
    .4byte _08026338 @ case 13 \n\
    .4byte _08026338 @ case 14 \n\
    .4byte _08026338 @ case 15 \n\
    .4byte _08026338 @ case 16 \n\
    .4byte _08026338 @ case 17 \n\
    .4byte _08026338 @ case 18 \n\
    .4byte _08026338 @ case 19 \n\
    .4byte _08026338 @ case 20 \n\
    .4byte _08026338 @ case 21 \n\
    .4byte _08026338 @ case 22 \n\
    .4byte _08026134 @ case 23 \n\
    .4byte _08026338 @ case 24 \n\
    .4byte _08026120 @ case 25 \n\
    .4byte _08026146 @ case 26 \n\
    .4byte _0802614E @ case 27 \n\
_08026120: \n\
    mov r2, r8 \n\
    sub r0, r7, r2 \n\
    lsl r0, r0, #3 \n\
    add r0, ip \n\
    add r0, #0x2e \n\
    ldrb r0, [r0] \n\
    cmp r0, #0x20 \n\
    bhi _08026134 \n\
    movs r0, #0 \n\
    strh r0, [r5] \n\
_08026134: \n\
    add r1, r5, #0 \n\
    add r1, #0x26 \n\
    movs r0, #1 \n\
    strb r0, [r1] \n\
    ldrh r0, [r5] \n\
    movs r1, #4 \n\
    eor r0, r1 \n\
    strh r0, [r5] \n\
    b _08026338 \n\
_08026146: \n\
    ldrh r1, [r5] \n\
    ldr r0, _08026180 @ =0x00007FFF \n\
    and r0, r1 \n\
    strh r0, [r5] \n\
_0802614E: \n\
    ldrh r4, [r5, #0x14] \n\
    cmp r4, #0 \n\
    bne _08026188 \n\
    add r0, r5, #0 \n\
    add r0, #0x25 \n\
    strb r4, [r0] \n\
    ldr r0, _08026184 @ =sCoreXShellOam_Breaking \n\
    str r0, [r5, #0x18] \n\
    strb r4, [r5, #0x1c] \n\
    strh r4, [r5, #0x16] \n\
    add r1, r5, #0 \n\
    add r1, #0x24 \n\
    movs r0, #0x18 \n\
    strb r0, [r1] \n\
    mov r3, r8 \n\
    sub r0, r7, r3 \n\
    lsl r0, r0, #3 \n\
    add r0, ip \n\
    add r0, #0x24 \n\
    movs r1, #0x5c \n\
    strb r1, [r0] \n\
    movs r0, #0xc1 \n\
    bl SoundPlay \n\
    b _08026338 \n\
    .align 2, 0 \n\
_08026180: .4byte 0x00007FFF \n\
_08026184: .4byte sCoreXShellOam_Breaking \n\
_08026188: \n\
    add r0, r6, #0 \n\
    movs r1, #3 \n\
    bl __udivsi3 \n\
    lsl r0, r0, #0x10 \n\
    lsr r0, r0, #0x10 \n\
    cmp r4, r0 \n\
    bhi _080261A8 \n\
    ldr r0, _080261A4 @ =sCoreXShellOam_Red \n\
    str r0, [r5, #0x18] \n\
    add r1, r5, #0 \n\
    add r1, #0x35 \n\
    movs r0, #3 \n\
    b _080261C0 \n\
    .align 2, 0 \n\
_080261A4: .4byte sCoreXShellOam_Red \n\
_080261A8: \n\
    ldrh r4, [r5, #0x14] \n\
    lsl r0, r6, #1 \n\
    movs r1, #3 \n\
    bl __divsi3 \n\
    cmp r4, r0 \n\
    bgt _080261C2 \n\
    ldr r0, _08026204 @ =sCoreXShellOam_Yellow \n\
    str r0, [r5, #0x18] \n\
    add r1, r5, #0 \n\
    add r1, #0x35 \n\
    movs r0, #2 \n\
_080261C0: \n\
    strb r0, [r1] \n\
_080261C2: \n\
    add r6, r5, #0 \n\
    add r0, r6, #0 \n\
    add r0, #0x2c \n\
    ldrb r0, [r0] \n\
    movs r1, #0x7f \n\
    and r1, r0 \n\
    cmp r1, #1 \n\
    bne _08026208 \n\
    movs r0, #0x32 \n\
    bl SpriteUtilCountPrimarySprites \n\
    lsl r0, r0, #0x18 \n\
    lsr r4, r0, #0x18 \n\
    cmp r4, #5 \n\
    bhi _080262BE \n\
    add r0, r6, #0 \n\
    add r0, #0x23 \n\
    ldrb r3, [r0] \n\
    movs r0, #0x20 \n\
    str r0, [sp] \n\
    ldrh r0, [r6, #2] \n\
    str r0, [sp, #4] \n\
    ldrh r0, [r6, #4] \n\
    str r0, [sp, #8] \n\
    movs r0, #0 \n\
    str r0, [sp, #0xc] \n\
    movs r0, #0x32 \n\
    movs r1, #0 \n\
    movs r2, #0 \n\
    bl SpriteSpawnNewXParasite \n\
    b _080262BE \n\
    .align 2, 0 \n\
_08026204: .4byte sCoreXShellOam_Yellow \n\
_08026208: \n\
    cmp r1, #0x10 \n\
    bne _080262BE \n\
    movs r0, #0xc2 \n\
    bl SoundPlay \n\
    add r2, r5, #0 \n\
    add r2, #0x34 \n\
    ldrb r1, [r2] \n\
    movs r0, #0x40 \n\
    orr r0, r1 \n\
    strb r0, [r2] \n\
    ldr r1, _08026248 @ =gSpriteData \n\
    mov r2, r8 \n\
    sub r0, r7, r2 \n\
    lsl r0, r0, #3 \n\
    add r3, r0, r1 \n\
    add r1, r3, #0 \n\
    add r1, #0x2d \n\
    movs r0, #0xb4 \n\
    strb r0, [r1] \n\
    ldrh r1, [r5, #2] \n\
    ldr r0, _0802624C @ =gSamusData \n\
    ldrh r0, [r0, #0x18] \n\
    sub r0, #0x40 \n\
    cmp r1, r0 \n\
    ble _08026250 \n\
    ldrh r1, [r3] \n\
    movs r2, #0x80 \n\
    lsl r2, r2, #3 \n\
    add r0, r2, #0 \n\
    orr r0, r1 \n\
    b _08026256 \n\
    .align 2, 0 \n\
_08026248: .4byte gSpriteData \n\
_0802624C: .4byte gSamusData \n\
_08026250: \n\
    ldrh r1, [r3] \n\
    ldr r0, _0802627C @ =0x0000FBFF \n\
    and r0, r1 \n\
_08026256: \n\
    strh r0, [r3] \n\
    ldr r0, _08026280 @ =gCurrentSprite \n\
    ldr r1, _08026284 @ =gSamusData \n\
    ldrh r0, [r0, #4] \n\
    ldrh r1, [r1, #0x16] \n\
    cmp r0, r1 \n\
    bls _0802628C \n\
    ldr r0, _08026288 @ =gSpriteData \n\
    mov r3, r8 \n\
    sub r1, r7, r3 \n\
    lsl r1, r1, #3 \n\
    add r1, r1, r0 \n\
    ldrh r2, [r1] \n\
    movs r3, #0x80 \n\
    lsl r3, r3, #2 \n\
    add r0, r3, #0 \n\
    orr r0, r2 \n\
    b _0802629C \n\
    .align 2, 0 \n\
_0802627C: .4byte 0x0000FBFF \n\
_08026280: .4byte gCurrentSprite \n\
_08026284: .4byte gSamusData \n\
_08026288: .4byte gSpriteData \n\
_0802628C: \n\
    ldr r0, _080262FC @ =gSpriteData \n\
    mov r2, r8 \n\
    sub r1, r7, r2 \n\
    lsl r1, r1, #3 \n\
    add r1, r1, r0 \n\
    ldrh r2, [r1] \n\
    ldr r0, _08026300 @ =0x0000FDFF \n\
    and r0, r2 \n\
_0802629C: \n\
    strh r0, [r1] \n\
    ldr r1, _080262FC @ =gSpriteData \n\
    mov r3, r8 \n\
    sub r0, r7, r3 \n\
    lsl r0, r0, #3 \n\
    add r2, r0, r1 \n\
    add r0, r2, #0 \n\
    add r0, #0x2f \n\
    movs r1, #0x28 \n\
    strb r1, [r0] \n\
    add r0, #1 \n\
    strb r1, [r0] \n\
    sub r0, #2 \n\
    movs r1, #0x1c \n\
    strb r1, [r0] \n\
    add r0, #3 \n\
    strb r1, [r0] \n\
_080262BE: \n\
    ldr r1, _080262FC @ =gSpriteData \n\
    mov r2, r8 \n\
    sub r0, r7, r2 \n\
    lsl r0, r0, #3 \n\
    add r0, r0, r1 \n\
    add r0, #0x2d \n\
    ldrb r4, [r0] \n\
    mov ip, r1 \n\
    cmp r4, #0 \n\
    beq _08026338 \n\
    movs r0, #3 \n\
    and r0, r4 \n\
    cmp r0, #0 \n\
    bne _0802630E \n\
    movs r0, #4 \n\
    and r4, r0 \n\
    lsl r0, r4, #0x18 \n\
    lsr r1, r0, #0x18 \n\
    cmp r1, #0 \n\
    beq _08026308 \n\
    ldr r0, _08026304 @ =gCurrentSprite \n\
    add r1, r0, #0 \n\
    add r1, #0x35 \n\
    ldrb r1, [r1] \n\
    ldrb r3, [r0, #0x1f] \n\
    add r1, r1, r3 \n\
    movs r2, #0xd \n\
    sub r2, r2, r1 \n\
    add r0, #0x20 \n\
    strb r2, [r0] \n\
    b _0802630E \n\
    .align 2, 0 \n\
_080262FC: .4byte gSpriteData \n\
_08026300: .4byte 0x0000FDFF \n\
_08026304: .4byte gCurrentSprite \n\
_08026308: \n\
    ldr r0, _08026344 @ =gCurrentSprite \n\
    add r0, #0x20 \n\
    strb r1, [r0] \n\
_0802630E: \n\
    mov r1, r8 \n\
    sub r0, r7, r1 \n\
    lsl r0, r0, #3 \n\
    add r0, ip \n\
    add r0, #0x2d \n\
    ldrb r1, [r0] \n\
    sub r1, #1 \n\
    strb r1, [r0] \n\
    lsl r1, r1, #0x18 \n\
    lsr r4, r1, #0x18 \n\
    cmp r4, #0 \n\
    bne _08026338 \n\
    ldr r1, _08026344 @ =gCurrentSprite \n\
    add r3, r1, #0 \n\
    add r3, #0x34 \n\
    ldrb r2, [r3] \n\
    movs r0, #0xbf \n\
    and r0, r2 \n\
    strb r0, [r3] \n\
    add r1, #0x20 \n\
    strb r4, [r1] \n\
_08026338: \n\
    add sp, #0x10 \n\
    pop {r3} \n\
    mov r8, r3 \n\
    pop {r4, r5, r6, r7} \n\
    pop {r0} \n\
    bx r0 \n\
    .align 2, 0 \n\
_08026344: .4byte gCurrentSprite \n\
    ");
}
#endif

#ifdef NON_MATCHING
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
            gCurrentSprite.pOam = sCoreXLightningOam_2;
        } else if (gCurrentSprite.roomSlot == 1) {
            gCurrentSprite.pOam = sCoreXLightningOam_1;
        } else {
            gCurrentSprite.pOam = sCoreXLightningOam_0;
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
            if (gSpriteData[primaryRamSlot].work1 <= 32) {
                gCurrentSprite.status = 0;
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
#else
NAKED_FUNCTION
void AbilityAura(void) {
    asm(" \n\
    push {r4, r5, r6, lr} \n\
    ldr r1, _080263BC @ =gCurrentSprite \n\
    add r2, r1, #0 \n\
    add r2, #0x26 \n\
    movs r0, #1 \n\
    strb r0, [r2] \n\
    add r0, r1, #0 \n\
    add r0, #0x23 \n\
    ldrb r4, [r0] \n\
    add r6, r1, #0 \n\
    add r6, #0x24 \n\
    ldrb r5, [r6] \n\
    mov ip, r1 \n\
    cmp r5, #0 \n\
    bne _080263E6 \n\
    ldrh r1, [r1] \n\
    ldr r0, _080263C0 @ =0x0000FFFB \n\
    and r0, r1 \n\
    movs r3, #0 \n\
    mov r1, ip \n\
    strh r0, [r1] \n\
    mov r0, ip \n\
    add r0, #0x22 \n\
    movs r2, #4 \n\
    strb r2, [r0] \n\
    ldr r0, _080263C4 @ =gIoRegisters \n\
    ldrb r1, [r0, #0xa] \n\
    movs r0, #3 \n\
    and r0, r1 \n\
    mov r1, ip \n\
    add r1, #0x21 \n\
    strb r0, [r1] \n\
    mov r0, ip \n\
    add r0, #0x27 \n\
    movs r1, #0x10 \n\
    strb r1, [r0] \n\
    add r0, #1 \n\
    strb r1, [r0] \n\
    add r0, #1 \n\
    strb r1, [r0] \n\
    ldr r0, _080263C8 @ =0x0000FFFC \n\
    mov r1, ip \n\
    strh r0, [r1, #0xa] \n\
    strh r2, [r1, #0xc] \n\
    strh r0, [r1, #0xe] \n\
    strh r2, [r1, #0x10] \n\
    strb r3, [r1, #0x1c] \n\
    strh r5, [r1, #0x16] \n\
    mov r0, ip \n\
    add r0, #0x25 \n\
    strb r3, [r0] \n\
    movs r0, #2 \n\
    strb r0, [r6] \n\
    ldrb r0, [r1, #0x1e] \n\
    cmp r0, #2 \n\
    bne _080263D0 \n\
    ldr r0, _080263CC @ =sCoreXLightningOam_2 \n\
    b _080263E4 \n\
    .align 2, 0 \n\
_080263BC: .4byte gCurrentSprite \n\
_080263C0: .4byte 0x0000FFFB \n\
_080263C4: .4byte gIoRegisters \n\
_080263C8: .4byte 0x0000FFFC \n\
_080263CC: .4byte sCoreXLightningOam_2 \n\
_080263D0: \n\
    cmp r0, #1 \n\
    bne _080263E0 \n\
    ldr r0, _080263DC @ =sCoreXLightningOam_1 \n\
    mov r5, ip \n\
    str r0, [r5, #0x18] \n\
    b _080263E6 \n\
    .align 2, 0 \n\
_080263DC: .4byte sCoreXLightningOam_1 \n\
_080263E0: \n\
    ldr r0, _08026410 @ =sCoreXLightningOam_0 \n\
    mov r1, ip \n\
_080263E4: \n\
    str r0, [r1, #0x18] \n\
_080263E6: \n\
    ldr r2, _08026414 @ =gSpriteData \n\
    lsl r3, r4, #3 \n\
    sub r0, r3, r4 \n\
    lsl r0, r0, #3 \n\
    add r0, r0, r2 \n\
    ldrh r1, [r0, #2] \n\
    mov r5, ip \n\
    strh r1, [r5, #2] \n\
    ldrh r1, [r0, #4] \n\
    strh r1, [r5, #4] \n\
    ldrh r1, [r0] \n\
    movs r0, #0x20 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    beq _08026418 \n\
    ldrh r0, [r5] \n\
    movs r1, #0x20 \n\
    orr r0, r1 \n\
    strh r0, [r5] \n\
    b _08026424 \n\
    .align 2, 0 \n\
_08026410: .4byte sCoreXLightningOam_0 \n\
_08026414: .4byte gSpriteData \n\
_08026418: \n\
    mov r0, ip \n\
    ldrh r1, [r0] \n\
    ldr r0, _08026440 @ =0x0000FFDF \n\
    and r0, r1 \n\
    mov r1, ip \n\
    strh r0, [r1] \n\
_08026424: \n\
    sub r0, r3, r4 \n\
    lsl r0, r0, #3 \n\
    add r0, r0, r2 \n\
    add r0, #0x24 \n\
    ldrb r0, [r0] \n\
    sub r0, #1 \n\
    cmp r0, #0x5e \n\
    bls _08026436 \n\
    b _08026642 \n\
_08026436: \n\
    lsl r0, r0, #2 \n\
    ldr r1, _08026444 @ =_08026448 \n\
    add r0, r0, r1 \n\
    ldr r0, [r0] \n\
    mov pc, r0 \n\
    .align 2, 0 \n\
_08026440: .4byte 0x0000FFDF \n\
_08026444: .4byte _08026448 \n\
_08026448: @ jump table \n\
    .4byte _080265E2 @ case 0 \n\
    .4byte _080265E2 @ case 1 \n\
    .4byte _08026642 @ case 2 \n\
    .4byte _08026642 @ case 3 \n\
    .4byte _08026642 @ case 4 \n\
    .4byte _08026642 @ case 5 \n\
    .4byte _08026642 @ case 6 \n\
    .4byte _08026642 @ case 7 \n\
    .4byte _08026642 @ case 8 \n\
    .4byte _08026642 @ case 9 \n\
    .4byte _08026642 @ case 10 \n\
    .4byte _08026642 @ case 11 \n\
    .4byte _08026642 @ case 12 \n\
    .4byte _08026642 @ case 13 \n\
    .4byte _08026642 @ case 14 \n\
    .4byte _08026642 @ case 15 \n\
    .4byte _08026642 @ case 16 \n\
    .4byte _08026642 @ case 17 \n\
    .4byte _08026642 @ case 18 \n\
    .4byte _08026642 @ case 19 \n\
    .4byte _08026642 @ case 20 \n\
    .4byte _08026642 @ case 21 \n\
    .4byte _08026642 @ case 22 \n\
    .4byte _080265E2 @ case 23 \n\
    .4byte _08026642 @ case 24 \n\
    .4byte _080265CE @ case 25 \n\
    .4byte _08026642 @ case 26 \n\
    .4byte _08026642 @ case 27 \n\
    .4byte _08026642 @ case 28 \n\
    .4byte _08026642 @ case 29 \n\
    .4byte _08026642 @ case 30 \n\
    .4byte _08026642 @ case 31 \n\
    .4byte _08026642 @ case 32 \n\
    .4byte _08026642 @ case 33 \n\
    .4byte _08026642 @ case 34 \n\
    .4byte _08026642 @ case 35 \n\
    .4byte _08026642 @ case 36 \n\
    .4byte _08026642 @ case 37 \n\
    .4byte _08026642 @ case 38 \n\
    .4byte _08026642 @ case 39 \n\
    .4byte _08026642 @ case 40 \n\
    .4byte _08026642 @ case 41 \n\
    .4byte _08026642 @ case 42 \n\
    .4byte _08026642 @ case 43 \n\
    .4byte _08026642 @ case 44 \n\
    .4byte _08026642 @ case 45 \n\
    .4byte _08026642 @ case 46 \n\
    .4byte _08026642 @ case 47 \n\
    .4byte _08026642 @ case 48 \n\
    .4byte _08026642 @ case 49 \n\
    .4byte _08026642 @ case 50 \n\
    .4byte _08026642 @ case 51 \n\
    .4byte _08026642 @ case 52 \n\
    .4byte _08026642 @ case 53 \n\
    .4byte _080265C4 @ case 54 \n\
    .4byte _080265C4 @ case 55 \n\
    .4byte _080265C4 @ case 56 \n\
    .4byte _080265C4 @ case 57 \n\
    .4byte _080265C4 @ case 58 \n\
    .4byte _08026628 @ case 59 \n\
    .4byte _08026642 @ case 60 \n\
    .4byte _08026642 @ case 61 \n\
    .4byte _08026642 @ case 62 \n\
    .4byte _08026642 @ case 63 \n\
    .4byte _08026642 @ case 64 \n\
    .4byte _08026642 @ case 65 \n\
    .4byte _08026642 @ case 66 \n\
    .4byte _08026642 @ case 67 \n\
    .4byte _08026642 @ case 68 \n\
    .4byte _08026642 @ case 69 \n\
    .4byte _08026642 @ case 70 \n\
    .4byte _08026642 @ case 71 \n\
    .4byte _08026642 @ case 72 \n\
    .4byte _08026642 @ case 73 \n\
    .4byte _08026642 @ case 74 \n\
    .4byte _08026642 @ case 75 \n\
    .4byte _08026642 @ case 76 \n\
    .4byte _08026642 @ case 77 \n\
    .4byte _08026642 @ case 78 \n\
    .4byte _08026642 @ case 79 \n\
    .4byte _08026642 @ case 80 \n\
    .4byte _08026642 @ case 81 \n\
    .4byte _08026642 @ case 82 \n\
    .4byte _08026642 @ case 83 \n\
    .4byte _08026642 @ case 84 \n\
    .4byte _08026642 @ case 85 \n\
    .4byte _08026642 @ case 86 \n\
    .4byte _08026642 @ case 87 \n\
    .4byte _08026642 @ case 88 \n\
    .4byte _08026642 @ case 89 \n\
    .4byte _08026642 @ case 90 \n\
    .4byte _080265EC @ case 91 \n\
    .4byte _0802660C @ case 92 \n\
    .4byte _08026628 @ case 93 \n\
    .4byte _0802663C @ case 94 \n\
_080265C4: \n\
    mov r5, ip \n\
    ldrh r1, [r5] \n\
    movs r0, #4 \n\
    orr r0, r1 \n\
    b _08026640 \n\
_080265CE: \n\
    sub r0, r3, r4 \n\
    lsl r0, r0, #3 \n\
    add r0, r0, r2 \n\
    add r0, #0x2e \n\
    ldrb r0, [r0] \n\
    cmp r0, #0x20 \n\
    bhi _080265E2 \n\
    movs r0, #0 \n\
    mov r5, ip \n\
    strh r0, [r5] \n\
_080265E2: \n\
    mov r1, ip \n\
    ldrh r0, [r1] \n\
    movs r1, #4 \n\
    eor r0, r1 \n\
    b _0802663E \n\
_080265EC: \n\
    mov r1, ip \n\
    ldrb r0, [r1, #0x1e] \n\
    cmp r0, #0 \n\
    beq _080265FA \n\
    movs r0, #0 \n\
    strh r0, [r1] \n\
    b _08026642 \n\
_080265FA: \n\
    mov r5, ip \n\
    strb r0, [r5, #0x1c] \n\
    strh r0, [r5, #0x16] \n\
    ldr r0, _08026608 @ =sCoreXAbilityAuraOam_Fast \n\
    str r0, [r5, #0x18] \n\
    b _08026642 \n\
    .align 2, 0 \n\
_08026608: .4byte sCoreXAbilityAuraOam_Fast \n\
_0802660C: \n\
    ldr r0, _08026624 @ =gFrameCounter8Bit \n\
    ldrb r1, [r0] \n\
    movs r0, #3 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    bne _08026642 \n\
    mov r1, ip \n\
    ldrh r0, [r1] \n\
    movs r1, #4 \n\
    eor r0, r1 \n\
    b _0802663E \n\
    .align 2, 0 \n\
_08026624: .4byte gFrameCounter8Bit \n\
_08026628: \n\
    mov r0, ip \n\
    ldrh r1, [r0] \n\
    ldr r0, _08026638 @ =0x0000FFFB \n\
    and r0, r1 \n\
    mov r1, ip \n\
    strh r0, [r1] \n\
    b _08026642 \n\
    .align 2, 0 \n\
_08026638: .4byte 0x0000FFFB \n\
_0802663C: \n\
    movs r0, #0 \n\
_0802663E: \n\
    mov r5, ip \n\
_08026640: \n\
    strh r0, [r5] \n\
_08026642: \n\
    pop {r4, r5, r6} \n\
    pop {r0} \n\
    bx r0 \n\
    ");
}
#endif
