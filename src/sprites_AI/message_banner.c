#include "gba/keys.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/message_box.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

// FIXME room slot enum

u8 TrySpawnMessageBanner(u8 type) {
    u8 i;
    u8 gfxRow = 128;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITE_TYPES; i++) {
        if (gSpritesetSpriteIds[i] == PSPRITE_MESSAGE_BOX) {
            gfxRow = gSpritesetSpriteGfxSlots[i];
            break;
        }
    }
    if (gfxRow < 8)
        i = SpriteSpawnPrimary(PSPRITE_MESSAGE_BOX, type, gfxRow, SSP_UNINFECTED_OR_BOSS,
            gSamusData.yPosition, gSamusData.xPosition, 0);
    else
        i = MAX_AMOUNT_OF_SPRITES;
    return i;
}

void MessageBannerInit(void) {
    u8 roomSlot;
    u8 i;
    u8 gfxRow;

    if (!(gCurrentSprite.status & SS_ON_SCREEN)) {
        gCurrentSprite.status |= SS_ON_SCREEN;
        gCurrentSprite.roomSlot = UCHAR_MAX;
    }
    roomSlot = gCurrentSprite.roomSlot;
    gCurrentSprite.status |= SS_HIGH_PRIORITY;
    gCurrentSprite.bgPriority = 0;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.properties |= (SP_ABSOLUTE_POSITION | SP_ALWAYS_ACTIVE);
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x80;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pOam = sMessageBoxOam_PopUp;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.xParasiteTimer = 9;
    gCurrentSprite.work1 = 8;
    if (roomSlot == 12)
        gCurrentSprite.work2 = TRUE;
    else
        gCurrentSprite.work2 = FALSE;
    if (roomSlot == 18 || roomSlot == 19 || roomSlot == 20) {
        gfxRow = 128;
        for (i = 0; i < MAX_AMOUNT_OF_SPRITE_TYPES; i++) {
            if (gSpritesetSpriteIds[i] == PSPRITE_MESSAGE_BOX) {
                gfxRow = gSpritesetSpriteGfxSlots[i];
                break;
            }
        }
        if (gfxRow < 8) {
            gCurrentSprite.pose = 2;
            gCurrentSprite.spritesetGfxSlot = gfxRow;
        } else
            gCurrentSprite.pose = 1;
        gPreventMovementTimer = 1000;
    } else
        gCurrentSprite.pose = 2;
}

void MessageBannerGfxInit(void) {
    gCurrentSprite.xParasiteTimer--;
    if (gCurrentSprite.xParasiteTimer < sizeof(sMessageBoxGfx) / 512)
        SpriteLoadGfx(PSPRITE_MESSAGE_BOX, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.xParasiteTimer);
    else if (gCurrentSprite.xParasiteTimer == sizeof(sMessageBoxGfx) / 512)
        SpriteLoadPal(PSPRITE_MESSAGE_BOX, gCurrentSprite.spritesetGfxSlot, ARRAY_SIZE(sMessageBoxPal) / 16);
    if (gCurrentSprite.xParasiteTimer == 0) {
        gCurrentSprite.pose = 2;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

void MessageBannerPopUp(void) {
    u8 roomSlot = gCurrentSprite.roomSlot;
    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.animationDurationCounter--;
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            if (roomSlot == 0)
                MusicPlay_38a8(MUSIC_ITEM_FANFARE, 0);
            else if (roomSlot == 5 || roomSlot == 6 || roomSlot == 7 || roomSlot == 8 || roomSlot == 9) {
                if (roomSlot == 7)
                    MusicPlay(MUSIC_3, 10);
                MusicPlay_38a8(MUSIC_OBJECTIVE_COMPLETE, 0);
            } else if (!(roomSlot == 5 || roomSlot == 6 || roomSlot == 7 || roomSlot == 8
                || roomSlot == 9 || roomSlot == 10 || roomSlot == 11 || roomSlot == 12))
                SoundPlay_3b1c(SOUND_MESSAGE_POPUP);
        }
        if (gCurrentSprite.work1 < 8) {
            if (roomSlot != 0)
                TextDrawMessageBanner(roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.work1);
            else
                DisplayMessage(gCurrentSprite.spritesetGfxSlot, gCurrentSprite.work1);
        }
    } else if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sMessageBoxOam_Static;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
        if (roomSlot == 0) {
            gCurrentSprite.xParasiteTimer = 370;
            return;
        }
        if (roomSlot == 12 || roomSlot == 14)
            SpriteSpawnSecondary(SSPRITE_SAVE_YES_NO_CURSOR, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, 0x3f, 0x96, 0);
        else if (roomSlot == 10 || roomSlot == 11)
            EscapeStart();
        if (roomSlot == 5 || roomSlot == 6 || roomSlot == 7 || roomSlot == 8 || roomSlot == 9)
            gCurrentSprite.xParasiteTimer = 180;
        else 
            gCurrentSprite.xParasiteTimer = 90;
    }
}

void MessageBannerStatic(void) {
    u8 roomSlot = gCurrentSprite.roomSlot;
    gPreventMovementTimer = 1000;
    if (gCurrentSprite.xParasiteTimer > 0)
        gCurrentSprite.xParasiteTimer--;
    else if (roomSlot != 12 && roomSlot != 14) {
        if (gButtonInput & (KEY_A | KEY_B | KEY_ALL_DIRECTIONS)) {
            gCurrentSprite.pose = 0x19;
            if (roomSlot == 0) {
                ProjectileLoadBeamGraphics();
                ProjectileLoadMissileGraphics();
            } else if (roomSlot == 10)
                MusicPlay(MUSIC_SA_X_CHASE, 10);
            else if (roomSlot == 11)
                MusicPlay(MUSIC_ORBIT_CHANGE, 10);
        } else if (roomSlot == 8 && gSamusData.pose == SPOSE_UNLOCKING_HABITATIONS_DECK) {
            gPreventMovementTimer = 0;
            gCurrentSprite.pose = 0x19;
        }
    }
}

void MessageBannerRemovalInit(void) {
    u8 roomSlot = gCurrentSprite.roomSlot;
    
    if (roomSlot != 8) {
        gPreventMovementTimer = 0;
        if (roomSlot == 18 || roomSlot == 19 || roomSlot == 20)
            FinishCollectingTank();
    }
    gCurrentSprite.pOam = sMessageBoxOam_Removal;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x1a;
}

void MesageBannerRemoval(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.status = 0;
        if (gCurrentSprite.roomSlot == 14 && gCurrentSprite.work2 == TRUE) {
            gPauseScreenFlag = 3;
            gSubGameMode1++;
        }
    }
}

void MessageBanner(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            MessageBannerInit();
            break;
        case 1:
            MessageBannerGfxInit();
            break;
        case 2:
            MessageBannerPopUp();
            break;
        case 0x18:
            MessageBannerStatic();
            break;
        case 0x19:
            MessageBannerRemovalInit();
            break;
        case 0x1a:
            MesageBannerRemoval();
    }
    gCurrentSprite.yPosition = 0x36;
    gCurrentSprite.xPosition = SCREEN_SIZE_X / 2;
}

void SaveYesNoCursor(void) {
    u8 primary;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    primary = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        case 0:
            gCurrentSprite.status |= SS_HIGH_PRIORITY;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.bgPriority = 0;
            gCurrentSprite.drawOrder = 3;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.properties |= SP_ABSOLUTE_POSITION | SP_ALWAYS_ACTIVE;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x10;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.pOam = sMessageBoxYesNoCursorOam;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.pose = 2;
            gCurrentSprite.yPosition = 0x3f;
            if (gSpriteData[primary].roomSlot == 12)
                gCurrentSprite.xPosition = 0x36;
            else
                gCurrentSprite.xPosition = 0x96;
            break;
        case 2:
            if (gChangedInput & KEY_LEFT) {
                if (gCurrentSprite.xPosition != 0x36) {
                    SoundPlay(0x1fa);
                    gCurrentSprite.xPosition = 0x36;
                }
            } else if (gChangedInput & KEY_RIGHT) {
                if (gCurrentSprite.xPosition != 0x96) {
                    SoundPlay(0x1fa);
                    gCurrentSprite.xPosition = 0x96;
                }
            } else if (gChangedInput & KEY_A) {
                SoundPlay(0x1fb);
                gSpriteData[primary].pose = 0x19;
                if (gCurrentSprite.xPosition == 0x36) {
                    if (gSpriteData[primary].roomSlot == 12) {
                        Sram_QuickSave(0);
                        gCurrentSprite.pose = 0x38;
                        return;
                    }
                    gSpriteData[primary].work2 = TRUE;
                } else
                    gSpriteData[primary].work2 = FALSE;
                gCurrentSprite.status = 0;
            }
            break;
        case 0x38:
            Sram_QuickSave(1);
            gCurrentSprite.pose = 0x3a;
            break;
        case 0x3a:
            Sram_QuickSave(2);
            gCurrentSprite.pose = 0x3c;
            break;
        case 0x3c:
            Sram_QuickSave(3);
            gCurrentSprite.status = 0;
    }
}
