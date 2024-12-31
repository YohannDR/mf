#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/shake_trigger.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/sprite_debris.h"
#include "structs/samus.h"

enum ShakeTrigger {
    SHAKE_TRIGGER_SUPER_MISSILE_DOWNLOADED,
    SHAKE_TRIGGER_SA_X_QUAKE,
    SHAKE_TRIGGER_RESTRICTED_LAB_EXPLOSION_FIRST,
    SHAKE_TRIGGER_RESTRICTED_LAB_EXPLOSION_SECOND,
    SHAKE_TRIGGER_BOX_2_RUMBLE
};

void ShakeTriggerStartScreenShake(void) {
    u8 shake = FALSE;
    if (gCurrentSprite.animationDurationCounter == 2) {
        shake = TRUE;
        switch (gCurrentSprite.currentAnimationFrame) {
            case 2:
            case 5:
            case 8:
            case 11:
            case 14:
            case 17:
            case 20:
            case 23:
            case 26:
            case 29:
            case 32:
            case 35:
            case 38:
            case 41:
            case 44:
            case 47:
                break;
            default:
                shake = FALSE;
        }
    }
    if (shake) {
        ScreenShakeStartHorizontal(20, 0x81);
        ScreenShakeStartVertical(20, 0x81);
    }
}

u32 PreBoxCeilingDebrisCheckSamusInRange(u16 yBlockOffset, u16 xBlockOffset) {
    u16 samusY = gSamusData.yPosition - PIXEL_SIZE;
    u16 samusX = gSamusData.xPosition;
    u16 spriteY = gCurrentSprite.yPosition;
    u16 spriteX = gCurrentSprite.xPosition;

    u16 yOffset = BLOCK_TO_SUB_PIXEL(yBlockOffset);
    u16 xOffset = BLOCK_TO_SUB_PIXEL(xBlockOffset);

    if (spriteX < samusX && samusX < spriteX + xOffset
        && spriteY < samusY && samusY < spriteY + yOffset)
        return TRUE;
    return FALSE;
}

void ShakeTrigger(void) {
    u8 type = gCurrentSprite.roomSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            if (EventCheckOn_EnteredSuperMissileDataRoom())
                type = SHAKE_TRIGGER_SUPER_MISSILE_DOWNLOADED;
            else if (EventCheckOn_BombsDownloaded())
                type = SHAKE_TRIGGER_SA_X_QUAKE;
            else if (EventCheckOn_WaveBeamRecovered())
                type = SHAKE_TRIGGER_RESTRICTED_LAB_EXPLOSION_FIRST;
            else if (EventCheckOn_RestrictedLabExplosion())
                type = SHAKE_TRIGGER_RESTRICTED_LAB_EXPLOSION_SECOND;
            else if (EventCheckOn_RestrictedZoneWarning())
                type = SHAKE_TRIGGER_BOX_2_RUMBLE;
            else {
                gCurrentSprite.status = 0;
                break;
            }
            gCurrentSprite.roomSlot = type;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
            gCurrentSprite.drawDistanceTop = 1;
            gCurrentSprite.drawDistanceBottom = 1;
            gCurrentSprite.drawDistanceHorizontal = 1;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.pOam = sShakeTriggerOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            if (!gDebugFlag)
                gCurrentSprite.status |= SS_NOT_DRAWN;
            break;
        case SPRITE_POSE_IDLE:
            if (type == SHAKE_TRIGGER_SUPER_MISSILE_DOWNLOADED) {
                if (EventCheckOn_SuperMissileDownloaded()) {
                    gCurrentSprite.pose = 0x18;
                    gCurrentSprite.work1 = 20;
                    SoundPlay_3b1c(SOUND_22C);
                    gCurrentSprite.pOam = sShakeTriggerOam_TriggeredNotRestrictedLab;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                }
            } else if (type == SHAKE_TRIGGER_SA_X_QUAKE) {
                if (EventCheckOn_BombsQuake()) {
                    gCurrentSprite.pose = 0x18;
                    gCurrentSprite.work1 = 8;
                    gCurrentSprite.pOam = sShakeTriggerOam_TriggeredNotRestrictedLab;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                }
            } else if (type == SHAKE_TRIGGER_BOX_2_RUMBLE) {
                if (EventCheckOn_TriggeredBox2Rumble()) {
                    gCurrentSprite.pose = 0x18;
                    gCurrentSprite.work1 = 8;
                    gCurrentSprite.pOam = sShakeTriggerOam_TriggeredNotRestrictedLab;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                }
            } else if (type == SHAKE_TRIGGER_RESTRICTED_LAB_EXPLOSION_FIRST) {
                if (EventCheckOn_RestrictedLabExplosion()) {
                    gCurrentSprite.pose = 0x1a;
                    gCurrentSprite.work1 = 30;
                    gCurrentSprite.work2 = 20;
                    gCurrentSprite.pOam = sShakeTriggerOam_TriggeredRestrictedLab;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                }
            } else if (type == SHAKE_TRIGGER_RESTRICTED_LAB_EXPLOSION_SECOND) {
                if (EventCheckOn_RestrictedLabExplosion()) {
                    gCurrentSprite.pose = 0x1c;
                    gCurrentSprite.pOam = sShakeTriggerOam_TriggeredRestrictedLab;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    SoundPlay(SOUND_239);
                }
            }
            break;
        case 0x18:
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.pose = 0x4e;
                ScreenShakeStartHorizontal(60, 0x81);
                ScreenShakeStartVertical(60, 0x81);
                if (type == SHAKE_TRIGGER_SUPER_MISSILE_DOWNLOADED)
                    SoundPlay(SOUND_22D);
                else if (type == SHAKE_TRIGGER_SA_X_QUAKE)
                    SoundPlay_3b1c(SOUND_22B);
                else if (type == SHAKE_TRIGGER_BOX_2_RUMBLE)
                    SoundPlay_3b1c(SOUND_237);
            }
            break;
        case 0x1a:
            if (gCurrentSprite.work1 > 0) {
                gCurrentSprite.work1--;
                break;
            }
            if (gCurrentSprite.work2 > 0) {
                if (--gCurrentSprite.work2 == 0) {
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    MusicPlay(MUSIC_27, 10);
                    SoundPlay(SOUND_238);
                }
                break;
            }
        case 0x1c:
            ShakeTriggerStartScreenShake();
    }
}

void PreBoxCeilingDebris(void) {
    u8 var_1, var_2, var_3;
    u16 y, x;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            if (!EventCheckOn_SuperMissileDownloaded()) {
                gCurrentSprite.status = 0;
                break;
            }
            gCurrentSprite.yPosition -= 0x40;
            gCurrentSprite.xPosition -= 0x20;
            gCurrentSprite.bgPriority = 1;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
            gCurrentSprite.drawDistanceTop = 1;
            gCurrentSprite.drawDistanceBottom = 1;
            gCurrentSprite.drawDistanceHorizontal = 0x70;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.pOam = sShakeTriggerOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            if (!gDebugFlag)
                gCurrentSprite.status |= SS_NOT_DRAWN;
            break;
        case SPRITE_POSE_IDLE:
            if (PreBoxCeilingDebrisCheckSamusInRange(6, 6) && EventCheckOn_BoxRumble()) {
                gCurrentSprite.pose = 0x18;
                gCurrentSprite.pOam = sShakeTriggerOam_TriggeredNotRestrictedLab;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work1 = 60;
            }
            break;
        case 0x18:
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.pose = 0x1a;
                gCurrentSprite.work1 = UCHAR_MAX; // For the screen to shake next frame
                gCurrentSprite.xParasiteTimer = 420; // Unused
            }
            break;
        case 0x1a:
            gCurrentSprite.work1++;
            var_1 = MOD_AND(gXParasiteTargetXPosition, QUARTER_BLOCK_SIZE);
            var_2 = MOD_AND(gXParasiteTargetYPosition, HALF_BLOCK_SIZE);
            var_3 = gSpriteRandomNumber;
            if (var_3 < 8)
                var_3 += 8;
            y = gCurrentSprite.yPosition;
            y++, y--; // TODO: find better way to match
            x = gCurrentSprite.xPosition;
            gCurrentSprite.xPosition += 4;
            SpriteUtilCheckCollisionAtPosition(y + 0x80, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck != COLLISION_AIR) {
                gCurrentSprite.status = 0;
                break;
            }
            if (MOD_AND(gCurrentSprite.work1, 32) == 0) {
                ScreenShakeStartVertical(40, 0x81);
                SoundPlay_3b1c(SOUND_22E);
                if (gCurrentSprite.status & SS_ON_SCREEN) {
                    if (MOD_AND(var_3, 2) != 0)
                        SpriteDebrisInit(0, DEBRIS_TYPE_LIGHT_SLOW_LEFT, y - 0x6c + var_3, x + 0x14 + var_3 * 0x20);
                    else
                        SpriteDebrisInit(0, DEBRIS_TYPE_LIGHT_SLOW_RIGHT, y - 0x64 + var_3, x + 0x1a + var_3 * 0x10);
                    if (gSpriteRandomNumber >= 8)
                        SpriteDebrisInit(0, DEBRIS_TYPE_HEAVY_SLOW_LEFT, y - 0x50 + var_3, x - 0x12 - var_3 * 2);
                    else {
                        SpriteDebrisInit(0, DEBRIS_TYPE_HEAVY_SLOW_RIGHT, y - 0x5a + var_3, x - 0x12 - var_3 * 4);
                        SpriteDebrisInit(0, DEBRIS_TYPE_LIGHT_SLOW_LEFT, y - 0x78 + var_2, x - var_1 * 8);
                    }
                    if (MOD_AND(gCurrentSprite.work1, 16) == 0) {
                        if (MOD_AND(var_3, 2) != 0)
                            SpriteDebrisInit(0, DEBRIS_TYPE_HEAVY_SLOW_RIGHT, y - 0x78 + var_2, x - var_1 * 0x40);
                        else
                            SpriteDebrisInit(0, DEBRIS_TYPE_HEAVY_SLOW_LEFT, y - 0x50 + var_2, x - var_1 * 0x10);
                        if (gSpriteRandomNumber >= 12) {
                            SpriteDebrisInit(0, DEBRIS_TYPE_LIGHT_SLOW_LEFT, y - 0x58 + var_2, x + var_1 * 4);
                            SpriteDebrisInit(0, DEBRIS_TYPE_HEAVY_SLOW_RIGHT, y - 0x64 + var_3, x - var_3 * 8);
                        } else
                            SpriteDebrisInit(0, DEBRIS_TYPE_LIGHT_SLOW_RIGHT, y - 0x6e + var_2, x + var_1 * 2);
                    }
                }
            }
    }
}
