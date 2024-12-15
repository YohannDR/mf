#include "macros.h"
#include "globals.h"

#include "data/sprites/message_box.h"
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

#define CORE_X_POSE_MOVING_TO_SPAWN_POINT 0x18
#define CORE_X_POSE_SPAWINING_BOSS 0x1a
#define CORE_X_POSE_MOVING_INIT 0x1b
#define CORE_X_POSE_MOVING 0x1c
#define CORE_X_POSE_MOVING_TO_TARGET_INIT 0x5c
#define CORE_X_POSE_MOVING_TO_TARGET 0x5d
#define CORE_X_POSE_WAITING_AT_TARGET 0x5e
#define CORE_X_POSE_GETTING_ABSORBED 0x5f

/**
 * @brief Makes the X parasites around a core-X flee
 * 
 */
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

/**
 * @brief Handles a core-X transforming from a boss
 * 
 */
void CoreXAbilityTransfromation(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.xParasiteTimer != 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    } else {
        gCurrentSprite.pose = CORE_X_POSE_MOVING_INIT;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    }
    if (gCurrentSprite.xParasiteTimer < sizeof(sMessageBoxGfx) / 512)
        SpriteLoadGfx(PSPRITE_MESSAGE_BOX, 6, gCurrentSprite.xParasiteTimer);
    else if (gCurrentSprite.xParasiteTimer == sizeof(sMessageBoxGfx) / 512)
        SpriteLoadPal(PSPRITE_MESSAGE_BOX, 6, ARRAY_SIZE(sMessageBoxPal) / 16);
}

/**
 * @brief Initializes a core-X sprite
 * 
 */
void CoreXAbilityInit(void) {
    u8 tmp = FALSE;
    u8 bossSpriteId = PSPRITE_ARACHNUS;
    u8 secondarySpriteId = SSPRITE_CORE_X_SHELL_MORPH_BALL;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        switch (gCurrentSprite.spriteId) {
            case PSPRITE_MORPH_BALL_ABILITY:
                gCurrentSprite.yPosition -= BLOCK_SIZE * 2;
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
                gCurrentSprite.yPosition -= BLOCK_SIZE * 2;
                gCurrentSprite.xPosition -= BLOCK_SIZE;
                secondarySpriteId = SSPRITE_CORE_X_SHELL_GRAVITY;
                break;
            case PSPRITE_SCREW_ATTACK_ABILITY:
                secondarySpriteId = SSPRITE_CORE_X_SHELL_SCREW_ATTACK;
                break;
        }
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
        gCurrentSprite.status &= ~(SS_SAMUS_DETECTED | SS_SAMUS_COLLIDING);
    } else {
        switch (gCurrentSprite.spriteId) {
            case PSPRITE_MORPH_BALL_ABILITY:
                if (gEquipment.suitMiscStatus & SMF_MORPH_BALL) {
                    tmp = TRUE;
                }
                break;
            case PSPRITE_HIGH_JUMP_ABILITY:
                if (gEquipment.suitMiscStatus & SMF_HIGH_JUMP) {
                    tmp = TRUE;
                }
                bossSpriteId = PSPRITE_ZAZABI;
                secondarySpriteId = SSPRITE_CORE_X_SHELL_HIGH_JUMP;
                break;
            default:
                tmp = TRUE;
                break;
        }
        if (tmp) {
            gCurrentSprite.status = 0;
            return;
        }
        gBossFormationSpriteId = bossSpriteId;
        gCoreXFormationSpriteId = gCurrentSprite.spriteId;
        gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
        gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
        gCurrentSprite.yPosition -= BLOCK_SIZE * 6;
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    }
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawOrder = 6;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;
    gCurrentSprite.pOam = sCoreXAbilityOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;
    tmp = SpriteSpawnSecondary(secondarySpriteId, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (tmp == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    tmp = SpriteSpawnSecondary(SSPRITE_ABILITY_AURA, 0, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (tmp == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    tmp = SpriteSpawnSecondary(SSPRITE_ABILITY_AURA, 1, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (tmp == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    tmp = SpriteSpawnSecondary(SSPRITE_ABILITY_AURA, 2, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (tmp == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
}

/**
 * @brief Initializes a core-X to be idle before spawning a boss
 * 
 */
void CoreXAbilityIdleInit(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.pOam = sCoreXAbilityOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief Handles a core-X being idle before spawning a boss
 * 
 */
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
                gCurrentSprite.pose = CORE_X_POSE_MOVING_TO_SPAWN_POINT;
                gCurrentSprite.work1 = 80;
                gCurrentSprite.rotation = 190;
            }
        }
    }
}

/**
 * @brief Handles a core-X moving down to a position where it will spawn a boss
 * 
 */
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
        if (gCurrentSprite.yPosition >= gCurrentSprite.xParasiteTimer - PIXEL_TO_SUB_PIXEL(0x50)) {
            gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer - PIXEL_TO_SUB_PIXEL(0x50);
            if (gCurrentSprite.rotation == 0) {
                gCurrentSprite.pose = CORE_X_POSE_SPAWINING_BOSS;
                gCurrentSprite.status |= SS_ENABLE_MOSAIC;
                gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
                gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
                MusicPlay(MUSIC_ZAZABI_BATTLE, 7);
            }
        } else {
            gCurrentSprite.yPosition += PIXEL_SIZE / 4;
        }
    } else {
        if (gCurrentSprite.yPosition >= gCurrentSprite.xParasiteTimer - PIXEL_TO_SUB_PIXEL(0x19)) {
            gCurrentSprite.yPosition = gCurrentSprite.xParasiteTimer - PIXEL_TO_SUB_PIXEL(0x19);
            if (gCurrentSprite.rotation == 0) {
                gCurrentSprite.pose = CORE_X_POSE_SPAWINING_BOSS;
                gCurrentSprite.status |= SS_ENABLE_MOSAIC;
                gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
                gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
                if (gDemoState == 0) {
                    MusicPlay(MUSIC_ARACHNUS_BATTLE, 7);
                }
            }
        } else {
            gCurrentSprite.yPosition += PIXEL_SIZE / 4;
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

/**
 * @brief Handles a core-X spawning a boss
 * 
 */
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
        SpriteLoadGfx(gBossFormationSpriteId, 0, gCurrentSprite.work1); // Loads 8 graphics rows
    } else if (gCurrentSprite.work1 == 8 * 4) {
        SpriteLoadPal(gBossFormationSpriteId, 0, 4); // Only loads the first 4 palette rows
    }
}

/**
 * @brief Initializes a core-X moving and spawns 6 X parasites around it
 * 
 */
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
    gCurrentSprite.pose = CORE_X_POSE_MOVING;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.work0 = 0;
}

/**
 * @brief Handles a core-X moving towards Samus
 * 
 */
void CoreXAbilityMoving(void) {
    XParasiteMoveWithSound((u16)(gSamusData.yPosition - PIXEL_TO_SUB_PIXEL(0x12)), gSamusData.xPosition, PIXEL_TO_SUB_PIXEL(1.75f) * 4, PIXEL_TO_SUB_PIXEL(2.5f) * 4, LOG2(4), 0xc0);
}

/**
 * @brief Initializes a core-X moving to resting position after its shell breaks
 * 
 */
void CoreXAbilityMovingToTargetInit(void) {
    gCurrentSprite.pose = 0x5d;
    gCurrentSprite.samusCollision = SSC_CORE_X_ABILITY;
    gCurrentSprite.health = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    MusicPlay(MUSIC_BOSS_TENSION, 6);
}

/**
 * @brief Handles a core-X moving to resting position after its shell breaks
 * 
 */
void CoreXAbilityMovingToTarget(void) {
    CoreXMakeXParasitesFlee();
    if (MOD_AND(gFrameCounter8Bit, 4) == 0) {
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    }
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteMoveWithSound(gAbilityRestingYPosition, gAbilityRestingXPosition, PIXEL_SIZE * 4, PIXEL_TO_SUB_PIXEL(1.5f) * 4, LOG2(4), 0x141);
    if (gCurrentSprite.yPosition < gAbilityRestingYPosition + 6 && gCurrentSprite.yPosition > gAbilityRestingYPosition - 6) {
        if (gCurrentSprite.xPosition < gAbilityRestingXPosition + 6 && gCurrentSprite.xPosition > gAbilityRestingXPosition - 6) {
            gCurrentSprite.pose = 0x5e;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.work3 = 0;
            gCurrentSprite.work4 = 0;
        }
    }
}

/**
 * @brief Handles a core-X waiting to get absorbed by Samus
 * 
 */
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
    } else if (MOD_AND(gFrameCounter8Bit, 64) == 0) {
        SoundPlay(0xc3);
    }
}

/**
 * @brief Handles a core-X getting absorbed by Samus
 * 
 */
void CoreXAbilityGettingAbsorbed(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteStickToSamus();
    if (gCurrentSprite.xParasiteTimer != 0) {
        gCurrentSprite.xParasiteTimer--;
    } else if (gCurrentSprite.scaling > Q_8_8(0.3125f)) {
        gCurrentSprite.scaling -= Q_8_8(0.03125f);
    } else {
        gCurrentSprite.status = 0;
        SpriteSpawnPrimary(PSPRITE_MESSAGE_BOX, 0, 6, SSP_UNINFECTED_OR_BOSS, gAbilityRestingYPosition, gAbilityRestingXPosition, 0);
    }
}

/**
 * @brief Core-X ability AI
 * 
 */
void CoreXAbility(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            CoreXAbilityInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            CoreXAbilityTransfromation();
            break;
        case SPRITE_POSE_UNINITIALIZED:
            CoreXAbilityInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            CoreXAbilityIdleInit();
        case SPRITE_POSE_IDLE:
            CoreXAbilityIdle();
            break;
        case CORE_X_POSE_MOVING_TO_SPAWN_POINT:
            CoreXAbilityMovingToSpawnPoint();
            break;
        case CORE_X_POSE_SPAWINING_BOSS:
            CoreXAbilitySpawningBoss();
            break;
        case CORE_X_POSE_MOVING_INIT:
            CoreXAbilityMovingInit();
        case CORE_X_POSE_MOVING:
            CoreXAbilityMoving();
            break;
        case CORE_X_POSE_MOVING_TO_TARGET_INIT:
            CoreXAbilityMovingToTargetInit();
            break;
        case CORE_X_POSE_MOVING_TO_TARGET:
            CoreXAbilityMovingToTarget();
            break;
        case CORE_X_POSE_WAITING_AT_TARGET:
            CoreXAbilityWaitingAtTarget();
            break;
        case CORE_X_POSE_GETTING_ABSORBED:
            CoreXAbilityGettingAbsorbed();
    }
    if (gCurrentSprite.pose <= CORE_X_POSE_SPAWINING_BOSS) {
        gXParasiteTargetYPosition = gCurrentSprite.yPosition;
        gXParasiteTargetXPosition = gCurrentSprite.xPosition;
    }
}

/**
 * @brief Core-X shell AI
 * 
 */
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
        case SPRITE_POSE_UNINITIALIZED: {
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.frozenPaletteRowOffset = 1;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.drawOrder = 5;
            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
            gCurrentSprite.health = maxHealth;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 0x18;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(0x14);
            gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(0x14);
            gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(0x14);
            gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(0x14);
            gCurrentSprite.pOam = sCoreXShellOam_White;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
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
        case CORE_X_POSE_SPAWINING_BOSS: {
            if (gSpriteData[primaryRamSlot].work1 <= 8 * 4) {
                gCurrentSprite.status = 0;
            }
        }
        case SPRITE_POSE_IDLE_INIT:
        case SPRITE_POSE_IDLE:
        case CORE_X_POSE_MOVING_TO_SPAWN_POINT: {
            gCurrentSprite.ignoreSamusCollisionTimer = 1;
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            break;
        }
        case CORE_X_POSE_MOVING_INIT: {
            gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        }
        case CORE_X_POSE_MOVING: {
            if (gCurrentSprite.health == 0) {
                gCurrentSprite.samusCollision = SSC_NONE;
                gCurrentSprite.pOam = sCoreXShellOam_Breaking;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x18;
                gSpriteData[primaryRamSlot].pose = CORE_X_POSE_MOVING_TO_TARGET_INIT;
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
                    if (gCurrentSprite.yPosition > gSamusData.yPosition - BLOCK_SIZE) {
                        gSpriteData[primaryRamSlot].status |= SS_SAMUS_DETECTED;
                    } else {
                        gSpriteData[primaryRamSlot].status &= ~SS_SAMUS_DETECTED;
                    }
                    if (gCurrentSprite.xPosition > gSamusData.xPosition) {
                        gSpriteData[primaryRamSlot].status |= SS_FACING_RIGHT;
                    } else {
                        gSpriteData[primaryRamSlot].status &= ~SS_FACING_RIGHT;
                    }
                    gSpriteData[primaryRamSlot].work2 = PIXEL_TO_SUB_PIXEL(2.5f) * 4;
                    gSpriteData[primaryRamSlot].work3 = PIXEL_TO_SUB_PIXEL(2.5f) * 4;
                    gSpriteData[primaryRamSlot].work1 = PIXEL_TO_SUB_PIXEL(1.75f) * 4;
                    gSpriteData[primaryRamSlot].work4 = PIXEL_TO_SUB_PIXEL(1.75f) * 4;
                }
                tmp = gSpriteData[primaryRamSlot].work0;
                if (tmp != 0) {
                    if (MOD_AND(tmp, 4) == 0) {
                        if ((tmp & 4) != 0) {
                            SPRITE_SET_ABSOLUTE_PALETTE_ROW(gCurrentSprite, SPRITE_FLASHING_PALETTE_ROW);
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

/**
 * @brief Core-X static/aura AI
 * 
 */
void AbilityAura(void) {
    u8 primaryRamSlot;
    
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
        gCurrentSprite.drawDistanceTop = 0x10;
        gCurrentSprite.drawDistanceBottom = 0x10;
        gCurrentSprite.drawDistanceHorizontal = 0x10;
        gCurrentSprite.hitboxTop = -PIXEL_SIZE;
        gCurrentSprite.hitboxBottom = PIXEL_SIZE;
        gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
        gCurrentSprite.hitboxRight = PIXEL_SIZE;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
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
        case 0x3c:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            break;
        case CORE_X_POSE_SPAWINING_BOSS:
            if (gSpriteData[primaryRamSlot].work1 <= 8 * 4) {
                gCurrentSprite.status = 0;
            }
        case SPRITE_POSE_IDLE_INIT:
        case SPRITE_POSE_IDLE:
        case CORE_X_POSE_MOVING_TO_SPAWN_POINT:
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            break;
        case CORE_X_POSE_MOVING_TO_TARGET_INIT:
            if (gCurrentSprite.roomSlot != 0) {
                gCurrentSprite.status = 0;
            } else {
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pOam = sCoreXAbilityAuraOam_Fast;
            }
            break;
        case CORE_X_POSE_MOVING_TO_TARGET:
            if (MOD_AND(gFrameCounter8Bit, 4) == 0) {
                gCurrentSprite.status ^= SS_NOT_DRAWN;
            }
            break;
        case CORE_X_POSE_WAITING_AT_TARGET:
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            break;
        case CORE_X_POSE_GETTING_ABSORBED:
            gCurrentSprite.status = 0;
    }
}
