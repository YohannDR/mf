#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/fune_namihe.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void FuneInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
            gCurrentSprite.status |= SS_X_FLIP;
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    }
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 0x20;
    gCurrentSprite.drawDistanceHorizontal = 0x60;
    gCurrentSprite.hitboxTop = -0x28;
    gCurrentSprite.hitboxBottom = 0x28;
    gCurrentSprite.pOam = sFuneOam_341568;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.frozenPaletteRowOffset = 1;
    gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x40;
        gCurrentSprite.hitboxRight = 0x28;
    } else {
        gCurrentSprite.hitboxLeft = -0x28;
        gCurrentSprite.hitboxRight = 0x40;
    }
}

void FuneDying(void) {
    // Freeze animation, that's all
    gCurrentSprite.animationDurationCounter--;
}

void FuneTurningIntoX(void) {
    u16 x;

    gCurrentSprite.yPosition -= 0x14;
    if (gCurrentSprite.unk_8 > gCurrentSprite.xPosition)
        x = (DIV_SHIFT(gCurrentSprite.unk_8 - gCurrentSprite.xPosition, 2)) + gCurrentSprite.xPosition;
    else
        x = (DIV_SHIFT(gCurrentSprite.xPosition - gCurrentSprite.unk_8, 2)) + gCurrentSprite.unk_8;
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition + 0x14, x, SS_X_FLIP);
}

u8 FuneCheckSamusInFront(void) {
    u16 nsfb = SpriteUtilCheckSamusNearSpriteFrontBehind(0x48, 0x200, 0);
    if (nsfb == NSFB_IN_FRONT) {
        gCurrentSprite.pose = 0x2b;
        return TRUE;
    }
    return FALSE;
}

void FuneIdleInit(void) {
    gCurrentSprite.pOam = sFuneOam_341568;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

void FuneIdle(void) {
    u16 offset;

    if (gCurrentSprite.status & SS_HIDDEN) return;
    if (FuneCheckSamusInFront()) return;
    offset = 0;
    switch (gCurrentSprite.currentAnimationFrame) {
        case 0:
            if ((u8)SpriteUtilCheckSamusNearSpriteFrontBehind(0x100, 0x200, 0) == NSFB_IN_FRONT) {
                gCurrentSprite.animationDurationCounter--;
                gCurrentSprite.pose = 0x29;
                return;
            }
            break;
        case 1:
        case 5:
            if (gCurrentSprite.animationDurationCounter == 8)
                offset = 2;
            else if (gCurrentSprite.animationDurationCounter == 15)
                offset = 4;
            break;
        case 2:
        case 6:
            if (gCurrentSprite.animationDurationCounter == 8)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 15)
                offset = 4;
            break;
        case 3:
        case 7:
            if (gCurrentSprite.animationDurationCounter == 8)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 15)
                offset = 2;
            break;
    }
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.currentAnimationFrame >= 4)
            gCurrentSprite.xPosition -= offset;
        else
            gCurrentSprite.xPosition += offset;
    } else {
        if (gCurrentSprite.currentAnimationFrame >= 4)
            gCurrentSprite.xPosition += offset;
        else
            gCurrentSprite.xPosition -= offset;
    }
}

void FuneSpittingInit(void) {
    gCurrentSprite.pOam = sFuneOam_3415b0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2a;
}

void FuneSpitting(void) {
    u16 offset;

    if (FuneCheckSamusInFront()) return;
    offset = 0;
    switch (gCurrentSprite.currentAnimationFrame) {
        case 0:
        case 1:
        case 2:
        case 4:
        case 5:
        case 6:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 2)
                offset = 4;
            break;
        case 7:
            if (gCurrentSprite.animationDurationCounter == 40) {
                gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
                return;
            } else if (gCurrentSprite.animationDurationCounter == 1)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 2)
                offset = 4;
            break;
        case 3:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 2)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 4) {
                if (gCurrentSprite.status & SS_X_FLIP)
                    SpriteSpawnSecondary(SSPRITE_FUNE_SPIT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x10, gCurrentSprite.xPosition, SS_X_FLIP);
                else
                    SpriteSpawnSecondary(SSPRITE_FUNE_SPIT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x10, gCurrentSprite.xPosition, 0);
            }
            break;
    }
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.currentAnimationFrame >= 4)
            gCurrentSprite.xPosition -= offset;
        else
            gCurrentSprite.xPosition += offset;
    } else {
        if (gCurrentSprite.currentAnimationFrame >= 4)
            gCurrentSprite.xPosition += offset;
        else
            gCurrentSprite.xPosition -= offset;
    }
}

void FuneLungingInit(void) {
    gCurrentSprite.pOam = sFuneOam_3415f8;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2c;
    SoundPlayNotAlreadyPlaying(SOUND_FUNE_LUNGING);
}

void FuneLunging(void) {
    u16 offset = 0;
    switch (gCurrentSprite.currentAnimationFrame) {
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 0x18;
            else if (gCurrentSprite.animationDurationCounter == 3)
                offset = 0x18;
            break;
        case 10:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 0x10;
            else if (gCurrentSprite.animationDurationCounter == 3)
                offset = 0x10;
            break;
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 0x10;
            else if (gCurrentSprite.animationDurationCounter == 2)
                offset = 0x10;
            break;
        case 25:
            if (gCurrentSprite.animationDurationCounter == 40)
                gCurrentSprite.pose = 0x2e;
            break;
    }
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.currentAnimationFrame >= 11) {
            gCurrentSprite.xPosition -= offset;
            gCurrentSprite.hitboxLeft += offset;
        } else {
            gCurrentSprite.xPosition += offset;
            gCurrentSprite.hitboxLeft -= offset;
        }
    } else {
        if (gCurrentSprite.currentAnimationFrame >= 11) {
            gCurrentSprite.xPosition += offset;
            gCurrentSprite.hitboxRight -= offset;
        } else {
            gCurrentSprite.xPosition -= offset;
            gCurrentSprite.hitboxRight += offset;
        }
    }
}

void FuneLungingEnd(void) {
    gCurrentSprite.animationDurationCounter -= 1;
    if (gCurrentSprite.xPosition < gCurrentSprite.unk_8)
        gCurrentSprite.xPosition += 1;
    else if (gCurrentSprite.xPosition > gCurrentSprite.unk_8)
        gCurrentSprite.xPosition -= 1;
    else
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void FuneSpitInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x10;
    gCurrentSprite.hitboxBottom = 0x10;
    gCurrentSprite.hitboxLeft = -0x10;
    gCurrentSprite.hitboxRight = 0x10;
    gCurrentSprite.pOam = sFuneOam_3416d0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.frozenPaletteRowOffset = 1;
    SoundPlayNotAlreadyPlaying(SOUND_FUNE_SPIT);
}

void FuneSpitMoving(void) {
    SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
    else {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition += 0xa;
        else
            gCurrentSprite.xPosition -= 0xa;
    }
}

void FuneSpitExplodingInit(void) {
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pOam = sFuneOam_3416f0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void FuneSpitExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void NamiheInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0)
            gCurrentSprite.status |= SS_X_FLIP;
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    }
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 0x20;
    gCurrentSprite.drawDistanceHorizontal = 0x60;
    gCurrentSprite.hitboxTop = -0x28;
    gCurrentSprite.hitboxBottom = 0x28;
    gCurrentSprite.pOam = sNamiheOam_341e6c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x40;
        gCurrentSprite.hitboxRight = 0x28;
    } else {
        gCurrentSprite.hitboxLeft = -0x28;
        gCurrentSprite.hitboxRight = 0x40;
    }
}

void NamiheDying(void) {
    // Freeze animation, that's all
    gCurrentSprite.animationDurationCounter--;
}

void NamiheTurningIntoX(void) {
    u16 x;

    gCurrentSprite.yPosition -= 0x14;
    if (gCurrentSprite.unk_8 > gCurrentSprite.xPosition)
        x = (DIV_SHIFT(gCurrentSprite.unk_8 - gCurrentSprite.xPosition, 2)) + gCurrentSprite.xPosition;
    else
        x = (DIV_SHIFT(gCurrentSprite.xPosition - gCurrentSprite.unk_8, 2)) + gCurrentSprite.unk_8;
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition + 0x14, x, SS_X_FLIP);
}

u8 NamiheCheckSamusInFront(void) {
    u16 nsfb = SpriteUtilCheckSamusNearSpriteFrontBehind(0x48, 0x200, 0);
    if (nsfb == NSFB_IN_FRONT) {
        gCurrentSprite.pose = 0x2b;
        return TRUE;
    }
    return FALSE;
}

void NamiheIdleInit(void) {
    gCurrentSprite.pOam = sNamiheOam_341e6c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

void NamiheIdle(void) {
    u16 offset;

    if (gCurrentSprite.status & SS_HIDDEN) return;
    if (NamiheCheckSamusInFront()) return;
    offset = 0;
    switch (gCurrentSprite.currentAnimationFrame) {
        case 0:
            if ((u8)SpriteUtilCheckSamusNearSpriteFrontBehind(0x140, 0x200, 0) == NSFB_IN_FRONT) {
                gCurrentSprite.animationDurationCounter--;
                gCurrentSprite.pose = 0x29;
                return;
            }
            break;
        case 1:
        case 5:
            if (gCurrentSprite.animationDurationCounter == 8)
                offset = 2;
            else if (gCurrentSprite.animationDurationCounter == 15)
                offset = 4;
            break;
        case 2:
        case 6:
            if (gCurrentSprite.animationDurationCounter == 8)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 15)
                offset = 4;
            break;
        case 3:
        case 7:
            if (gCurrentSprite.animationDurationCounter == 8)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 15)
                offset = 2;
            break;
    }
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.currentAnimationFrame >= 4)
            gCurrentSprite.xPosition -= offset;
        else
            gCurrentSprite.xPosition += offset;
    } else {
        if (gCurrentSprite.currentAnimationFrame >= 4)
            gCurrentSprite.xPosition += offset;
        else
            gCurrentSprite.xPosition -= offset;
    }
}

void NamiheSpittingInit(void) {
    gCurrentSprite.pOam = sNamiheOam_341eb4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2a;
}

void NamiheSpitting(void) {
    u16 offset;

    if (NamiheCheckSamusInFront()) return;
    offset = 0;
    switch (gCurrentSprite.currentAnimationFrame) {
        case 4:
        case 5:
        case 6:
        case 8:
        case 9:
        case 10:
        case 11:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 2)
                offset = 4;
            break;
        case 7:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 2)
                offset = 4;
            else if (gCurrentSprite.animationDurationCounter == 4) {
                if (gCurrentSprite.status & SS_X_FLIP)
                    SpriteSpawnSecondary(SSPRITE_NAMIHE_SPIT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition + 0x10, SS_X_FLIP);
                else
                    SpriteSpawnSecondary(SSPRITE_NAMIHE_SPIT, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
                        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition - 0x10, 0);
            }
            break;
        case 15:
            if (gCurrentSprite.animationDurationCounter == 40) {
                gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
                return;
            }
            break;
    }
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.currentAnimationFrame >= 8)
            gCurrentSprite.xPosition -= offset;
        else
            gCurrentSprite.xPosition += offset;
    } else {
        if (gCurrentSprite.currentAnimationFrame >= 8)
            gCurrentSprite.xPosition += offset;
        else
            gCurrentSprite.xPosition -= offset;
    }
}

void NamiheLungingInit(void) {
    gCurrentSprite.pOam = sNamiheOam_341f3c;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2c;
    SoundPlayNotAlreadyPlaying(SOUND_NAMIHE_LUNGING);
}

void NamiheLunging(void) {
    u16 offset = 0;
    switch (gCurrentSprite.currentAnimationFrame) {
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 0x18;
            else if (gCurrentSprite.animationDurationCounter == 3)
                offset = 0x18;
            break;
        case 18:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 0x10;
            else if (gCurrentSprite.animationDurationCounter == 3)
                offset = 0x10;
            break;
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
            if (gCurrentSprite.animationDurationCounter == 1)
                offset = 0x10;
            else if (gCurrentSprite.animationDurationCounter == 2)
                offset = 0x10;
            break;
        case 37:
            if (gCurrentSprite.animationDurationCounter == 40)
                gCurrentSprite.pose = 0x2e;
            break;
    }
    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.currentAnimationFrame >= 19) {
            gCurrentSprite.xPosition -= offset;
            gCurrentSprite.hitboxLeft += offset;
        } else {
            gCurrentSprite.xPosition += offset;
            gCurrentSprite.hitboxLeft -= offset;
        }
    } else {
        if (gCurrentSprite.currentAnimationFrame >= 19) {
            gCurrentSprite.xPosition += offset;
            gCurrentSprite.hitboxRight -= offset;
        } else {
            gCurrentSprite.xPosition -= offset;
            gCurrentSprite.hitboxRight += offset;
        }
    }
}

void NamiheLungingEnd(void) {
    gCurrentSprite.animationDurationCounter -= 1;
    if (gCurrentSprite.xPosition < gCurrentSprite.unk_8)
        gCurrentSprite.xPosition += 1;
    else if (gCurrentSprite.xPosition > gCurrentSprite.unk_8)
        gCurrentSprite.xPosition -= 1;
    else
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void NamiheSpitInit(void) {
    u16 samusCenterY, spriteY;
    s16 ySpeed;

    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x10;
    gCurrentSprite.hitboxBottom = 0x10;
    gCurrentSprite.hitboxLeft = -0x10;
    gCurrentSprite.hitboxRight = 0x10;
    gCurrentSprite.pOam = sNamiheOam_342074;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.work1 = 6;
    samusCenterY = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    spriteY = gCurrentSprite.yPosition;
    if (spriteY > samusCenterY) {
        gCurrentSprite.work2 = FALSE;
        ySpeed = (spriteY - samusCenterY) / 32;
    } else {
        gCurrentSprite.work2 = TRUE;
        ySpeed = (samusCenterY - spriteY) / 32;
    }
    gCurrentSprite.work4 = ySpeed;
    SoundPlayNotAlreadyPlaying(SOUND_NAMIHE_SPIT);
}

void NamiheSpitMoving(void) {
    SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
    else {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition += 0xa;
        else
            gCurrentSprite.xPosition -= 0xa;
        if (gCurrentSprite.work1 > 0)
            gCurrentSprite.work1--;
        else {
            if (gCurrentSprite.work2)
                gCurrentSprite.yPosition += gCurrentSprite.work4;
            else
                gCurrentSprite.yPosition -= gCurrentSprite.work4;
        }
    }
}

void NamiheSpitExplodingInit(void) {
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pOam = sNamiheOam_342094;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void NamiheSpitExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void Fune(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_FUNE_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            FuneInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            FuneIdleInit();
        case SPRITE_POSE_IDLE:
            FuneIdle();
            break;
        case 0x29:
            FuneSpittingInit();
        case 0x2a:
            FuneSpitting();
            break;
        case 0x2b:
            FuneLungingInit();
        case 0x2c:
            FuneLunging();
            break;
        case 0x2e:
            FuneLungingEnd();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            FuneDying();
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            FuneInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            FuneTurningIntoX();
            XParasiteInit();
    }
}

void FuneSpit(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            FuneSpitInit();
        case SPRITE_POSE_IDLE:
            FuneSpitMoving();
            break;
        case 0x38:
            FuneSpitExploding();
            break;
        default:
            FuneSpitExplodingInit();
    }
}

void Namihe(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_NAMIHE_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            NamiheInit();
            break;
        case 1:
            NamiheIdleInit();
        case 2:
            NamiheIdle();
            break;
        case 0x29:
            NamiheSpittingInit();
        case 0x2a:
            NamiheSpitting();
            break;
        case 0x2b:
            NamiheLungingInit();
        case 0x2c:
            NamiheLunging();
            break;
        case 0x2e:
            NamiheLungingEnd();
            break;
        case 0x57:
            SpriteDyingInit();
        case 0x58:
            NamiheDying();
            SpriteDying();
            break;
        case 0x59:
            NamiheInit();
        case 0x5a:
            SpriteSpawningFromX();
            break;
        case 0x5b:
            NamiheTurningIntoX();
            XParasiteInit();
    }
}

void NamiheSpit(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            NamiheSpitInit();
        case SPRITE_POSE_IDLE:
            NamiheSpitMoving();
            break;
        case 0x38:
            NamiheSpitExploding();
            break;
        default:
            NamiheSpitExplodingInit();
    }
}
