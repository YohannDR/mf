#include "macros.h"
#include "globals.h"

#include "data/generic_data.h"
#include "data/projectile_data.h"
#include "data/sprites/message_box.h"
#include "data/sprites/beam_core_x.h"
#include "data/sprites/core_x.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/event.h"
#include "constants/particle.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void BeamCoreXTransformation(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.xParasiteTimer > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    } else {
        gCurrentSprite.pose = 0x1b;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        ProjectileLoadEyeCoreXGraphics();
    }
}

void BeamCoreXTransformationInit(void) {
    u8 shell = 0;
    u8 eye, eyeSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.yPosition -= 0x5c;
    gCurrentSprite.pose = 0x5a;
    gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.status &= ~(SS_NOT_DRAWN | SS_FACING_DOWN | SS_SAMUS_COLLIDING);
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.bgPriority = 2;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.pOam = sBeamCoreXAbilityOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.work0 = FALSE;
    switch (gCurrentSprite.spriteId) {
        case PSPRITE_CHARGE_BEAM_CORE_X:
            shell = SSPRITE_CHARGE_BEAM_CORE_X_SHELL;
            eye = SSPRITE_CHARGE_BEAM_CORE_X_EYE;
            break;
        case PSPRITE_WIDE_BEAM_CORE_X:
            shell = SSPRITE_WIDE_BEAM_CORE_X_SHELL;
            eye = SSPRITE_WIDE_BEAM_CORE_X_EYE;
            break;
        case PSPRITE_PLASMA_BEAM_CORE_X:
            shell = SSPRITE_PLASMA_BEAM_CORE_X_SHELL;
            eye = SSPRITE_PLASMA_BEAM_CORE_X_EYE;
            break;
        case PSPRITE_WAVE_BEAM_CORE_X:
            shell = SSPRITE_WAVE_BEAM_CORE_X_SHELL;
            eye = SSPRITE_WAVE_BEAM_CORE_X_EYE;
            break;
        case PSPRITE_ICE_BEAM_CORE_X:
            shell = SSPRITE_ICE_BEAM_CORE_X_SHELL;
            eye = SSPRITE_ICE_BEAM_CORE_X_EYE;
            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
            break;
        default:
            gCurrentSprite.status = 0;
            return;
    }
    shell++, shell--; // Needed to produce matching ASM.
    shell = SpriteSpawnSecondary(shell, 0, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (shell == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    eyeSlot = SpriteSpawnSecondary(eye, shell, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (eyeSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    gSpriteData[shell].roomSlot = eyeSlot;
}

void BeamCoreXMovingInit(void) {
    gCurrentSprite.pose = 0x1c;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
}

void BeamCoreXMoving(void) {
    if (!gCurrentSprite.work0)
        SpriteUtilMoveBeamCoreX((u16)(gSamusData.yPosition - 0x48), gSamusData.xPosition, 0xa, 0x10, 2, 0xc0);
}

void BeamCoreXMovingToTargetInit(void) {
    gCurrentSprite.pose = 0x5d;
    gCurrentSprite.samusCollision = SSC_CORE_X_ABILITY;
    gCurrentSprite.health = 0;
    gCurrentSprite.drawOrder = 4;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.paletteRow = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    CoreXMakeXParasitesFlee();
}

void BeamCoreXMovingToTarget(void) {
    if (MOD_AND(gFrameCounter8Bit, 4) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteMoveWithSound(gAbilityRestingYPosition, gAbilityRestingXPosition, 0x10, 0x18, 2, SOUND_141);
    if (gCurrentSprite.yPosition < gAbilityRestingYPosition + 6 && gCurrentSprite.yPosition > gAbilityRestingYPosition - 6) {
        if (gCurrentSprite.xPosition < gAbilityRestingXPosition + 6 && gCurrentSprite.xPosition > gAbilityRestingXPosition - 6) {
            if (gCurrentSprite.spriteId == PSPRITE_ICE_BEAM_CORE_X)
                gCurrentSprite.pose = 0x37;
            else
                gCurrentSprite.pose = 0x5e;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.work3 = 0;
            gCurrentSprite.work4 = 0;
        }
    }
}

void BeamCoreXRestingAtTarget(void) {
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
        gCurrentSprite.pOam = sBeamCoreXAbilityOam_GettingAbsorbed;
        ParticleSet(gSamusData.yPosition + gSamusData.drawDistanceTop / 2, gSamusData.xPosition, PE_ABSORB_CORE_X);
        switch (gCurrentSprite.spriteId) {
            case PSPRITE_CHARGE_BEAM_CORE_X:
                EventCheckAdvance(EVENT_CHARGE_BEAM_ABILITY_RECOVERED);
                break;
            case PSPRITE_WIDE_BEAM_CORE_X:
                EventCheckAdvance(EVENT_WIDE_BEAM_ABILITY_RECOVERED);
                break;
            case PSPRITE_PLASMA_BEAM_CORE_X:
                EventCheckAdvance(EVENT_PLASMA_BEAM_ABILITY_RECOVERED);
                break;
            case PSPRITE_WAVE_BEAM_CORE_X:
                EventCheckAdvance(EVENT_WAVE_BEAM_ABILITY_RECOVERED);
                break;
        }
        SpriteUtilRefillSamus(400, 50, 10);
        gSamusEnvironmentalEffects[0].externalTimer = 48;
        SoundPlay(SOUND_92);
    } else if (MOD_AND(gFrameCounter8Bit, 64) == 0) {
        SoundPlay(SOUND_C3);
    }
}

void BeamCoreXAbsorbed(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteStickToSamus();
    if (gCurrentSprite.xParasiteTimer != 0)
        gCurrentSprite.xParasiteTimer--;
    else if (gCurrentSprite.scaling > Q_8_8(.3125f))
        gCurrentSprite.scaling -= Q_8_8(.03125f);
    else {
        gCurrentSprite.pose = 0x60;
        gCurrentSprite.status |= SS_NOT_DRAWN;
        gCurrentSprite.xParasiteTimer = 9;
    }
}

void BeamCoreXDisplayingMessage(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.xParasiteTimer > 0) {
        gCurrentSprite.xParasiteTimer--;
        if (gCurrentSprite.xParasiteTimer < sizeof(sMessageBoxGfx) / 512)
            SpriteLoadGfx(PSPRITE_MESSAGE_BOX, 0, gCurrentSprite.xParasiteTimer);
        else if (gCurrentSprite.xParasiteTimer == sizeof(sMessageBoxGfx) / 512)
            SpriteLoadPal(PSPRITE_MESSAGE_BOX, 0, ARRAY_SIZE(sMessageBoxPal) / 16);
    } else {
        gCurrentSprite.status = 0;
        SpriteSpawnPrimary(PSPRITE_MESSAGE_BOX, 0, 0, SSP_UNINFECTED_OR_BOSS, gAbilityRestingYPosition, gAbilityRestingXPosition, 0);
    }
}

void BeamCoreXWaitToFlee(void) {
    if (MOD_AND(gFrameCounter8Bit, 4) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckSamusNearSpriteLeftRight(0xc0, 0xc0) != NSLR_OUT_OF_RANGE) {
        gCurrentSprite.pose = 0x38;
        gCurrentSprite.work1 = 180;
    }
}

void BeamCoreXFlee(void) {
    u8 offset;
    s16 movement;

    if (MOD_AND(gFrameCounter8Bit, 4) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    offset = gCurrentSprite.work4;
    movement = sIceBeamAbilityFloatingYMovement[offset];
    if (movement == SHORT_MAX) {
        movement = sIceBeamAbilityFloatingYMovement[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;
    gCurrentSprite.xPosition += 8;
    gCurrentSprite.yPosition += 1;
    if (--gCurrentSprite.work1 == 0) {
        EventCheckAdvance(EVENT_SA_X_DEFEATED);
        gCurrentSprite.status = 0;
        unk_372c(60, MUSIC_2E, 10);
    }
}

void BeamCoreXShellInit(void) {
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.frozenPaletteRowOffset = 1;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawOrder = 4;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -0x40;
    gCurrentSprite.hitboxBottom = 0x40;
    gCurrentSprite.hitboxLeft = -0x40;
    gCurrentSprite.hitboxRight = 0x40;
    gCurrentSprite.pOam = sBeamCoreXShellOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.pose = 1;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
    gCurrentSprite.scaling = Q_8_8(1);
    if (gCurrentSprite.xPosition > gSamusData.xPosition)
        gCurrentSprite.rotation = Q_8_8(.5);
    else
        gCurrentSprite.rotation = 0;
    if (gCurrentSprite.spriteId == SSPRITE_ICE_BEAM_CORE_X_SHELL)
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
}

void BeamCoreXShellTransformation(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == 0x1b) {
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.pose = 2;
    }
}

void BeamCoreXShellIdle(void) {
    u8 tmp;

    if (SPRITE_HAS_ISFT(gCurrentSprite) == 1) {
        tmp = SpriteUtilCountPrimarySprites(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE);
        if (tmp < 6)
            SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_CORE_X_OR_PARASITE, 0, 0, gCurrentSprite.primarySpriteRamSlot,
                SSP_X_ABSORBABLE_BY_SAMUS, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    }
    tmp = gCurrentSprite.roomSlot;
    if (gSpriteData[tmp].paletteRow != 0)
        gCurrentSprite.paletteRow = gSpriteData[tmp].paletteRow + 2;
    else
        gCurrentSprite.paletteRow = 0;
}

void BeamCoreXEyeInit(void) {
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.frozenPaletteRowOffset = 3;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
    gCurrentSprite.scaling = Q_8_8(1);
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -0x28;
    gCurrentSprite.hitboxBottom = 0x28;
    gCurrentSprite.hitboxLeft = -0x28;
    gCurrentSprite.hitboxRight = 0x28;
    gCurrentSprite.pOam = sBeamCoreXEyeOam_Closed;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pose = 1;
    gCurrentSprite.work2 = 120;
    if (gCurrentSprite.xPosition > gSamusData.xPosition) {
        gCurrentSprite.rotation = Q_8_8(.5);
        gCurrentSprite.work1 = Q_8_8(.5);
    } else {
        gCurrentSprite.rotation = 0;
        gCurrentSprite.work1 = 0;
    }
    if (gCurrentSprite.spriteId == SSPRITE_ICE_BEAM_CORE_X_EYE)
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
}

void BeamCoreXEyeTransformation(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[primary].status & SS_ENABLE_MOSAIC) {
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    } else {
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.pose = 2;
    }
}

void BeamCoreXEyeHandleRotation(void) {
    // Why not use the SpriteUtilMakeSpriteRotateTowardsTarget function?
    u8 intensity = Q_8_8(0.01f);

    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    u8 shellSlot = gCurrentSprite.roomSlot;

    s16 oamRotation = gCurrentSprite.work1;
    s16 targetY = gSamusData.yPosition - 0x48;
    s16 targetX = gSamusData.xPosition;
    s16 spriteY = gSpriteData[primary].yPosition;
    s16 spriteX = gSpriteData[primary].xPosition;

    s32 targetRotation;

    s16 distance;
    s16 sin, cos;
    s16 yOffset, xOffset;

    if (targetY < spriteY)
    {
        if (spriteX - BLOCK_SIZE < targetX && spriteX + BLOCK_SIZE > targetX)
        {
            targetRotation = PI + PI / 2;
        }
        if (targetX > spriteX) // BUG: replace it with "else if (targetX > spriteX)" to fix the bug.
        {
            if (spriteY - targetY < BLOCK_SIZE)
                targetRotation = 0;
            else
                targetRotation = PI + 3 * PI / 4;
        }
        else if (spriteY - targetY < BLOCK_SIZE)
        {
            targetRotation = PI;
        }
        else
        {
            targetRotation = PI + HALF_BLOCK_SIZE;
        }
    }
    else
    {
        if (spriteX - BLOCK_SIZE < targetX && spriteX + BLOCK_SIZE > targetX)
        {
            targetRotation = PI / 2;
        }
        else if (targetX > spriteX)
        {
            if (targetY - spriteY < BLOCK_SIZE)
                targetRotation = 0;
            else
                targetRotation = PI / 4;
        }
        else if (targetY - spriteY < BLOCK_SIZE)
        {
            targetRotation = PI;
        }
        else
        {
            targetRotation = 3 * PI / 4;
        }
    }

    if (targetRotation == 0)
    {
        if ((u16)(oamRotation - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
        else if (oamRotation > BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
    }
    else if (targetRotation == PI / 4)
    {
        if ((u16)(oamRotation - HALF_BLOCK_SIZE - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
        else if ((u16)(oamRotation - HALF_BLOCK_SIZE) > BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
    }
    else if (targetRotation == PI / 2)
    {
        if ((u16)(oamRotation - BLOCK_SIZE - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
        else if ((u16)(oamRotation - BLOCK_SIZE) > BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
    }
    else if (targetRotation == 3 * PI / 4)
    {
        if ((u16)(oamRotation - (BLOCK_SIZE + HALF_BLOCK_SIZE) - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
        else if ((u16)(oamRotation - (BLOCK_SIZE + HALF_BLOCK_SIZE)) > BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
    }
    else if (targetRotation == PI)
    {
        if ((u16)(oamRotation - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
        else if (oamRotation > BLOCK_SIZE * 2)
            oamRotation -= intensity;
    }
    else if (targetRotation == PI + PI / 4)
    {
        if ((u16)(oamRotation - HALF_BLOCK_SIZE - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
        else if ((u16)(oamRotation - HALF_BLOCK_SIZE - 1) > BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
    }
    else if (targetRotation == PI + PI / 2)
    {
        if ((u16)(oamRotation - BLOCK_SIZE - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
        else if ((u16)(oamRotation - BLOCK_SIZE - 1) > BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
    }
    else if (targetRotation == PI + 3 * PI / 4)
    {
        if ((u16)(oamRotation - (BLOCK_SIZE + HALF_BLOCK_SIZE) - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
        else if ((u16)(oamRotation - (BLOCK_SIZE + HALF_BLOCK_SIZE) - 1) > BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
    }

    gCurrentSprite.work1 = oamRotation;
    gSpriteData[shellSlot].rotation = oamRotation;
    gCurrentSprite.rotation = oamRotation;

    oamRotation &= UCHAR_MAX; // to not overflow when indexing sine table
    distance = HALF_BLOCK_SIZE;
    sin = SIN(oamRotation);
    if (sin < 0) {
        yOffset = Q_8_8_TO_INT(-sin * distance);
        gCurrentSprite.yPosition = spriteY - yOffset;
    } else {
        yOffset = Q_8_8_TO_INT(sin * distance);
        gCurrentSprite.yPosition = spriteY + yOffset;
    }

    cos = COS(oamRotation);
    if (cos < 0) {
        xOffset = Q_8_8_TO_INT(-cos * distance);
        gCurrentSprite.xPosition = spriteX - xOffset;
    } else {
        xOffset = Q_8_8_TO_INT(cos * distance);
        gCurrentSprite.xPosition = spriteX + xOffset;
    }

    if (gCurrentSprite.health == 0) {
        gCurrentSprite.status = 0;
        gSpriteData[shellSlot].status = 0;
        gSpriteData[primary].pose = 0x5c;
        ParticleSet(gSpriteData[primary].yPosition, gSpriteData[primary].xPosition, PE_0x2F);
        switch (gSpriteData[primary].spriteId) {
            case PSPRITE_CHARGE_BEAM_CORE_X:
            case PSPRITE_PLASMA_BEAM_CORE_X:
                MusicPlay(MUSIC_BOSS_TENSION, 6);
                break;
            case PSPRITE_WAVE_BEAM_CORE_X:
                MusicPlay(MUSIC_SECTOR_6, 0);
                break;
        }
    }
}

void BeamCoreXEyeClosed(void) {
    BeamCoreXEyeHandleRotation();
    if (--gCurrentSprite.work2 == 0) {
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
        gCurrentSprite.pOam = sBeamCoreXEyeOam_Opening;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
    }
}

void BeamCoreXEyeOpening(void) {
    BeamCoreXEyeHandleRotation();
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.pOam = sBeamCoreXEyeOam_Opened;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.work2 = 160;
    }
}

void BeamCoreXEyeOpened(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    u8 beamSpriteId;
    u8 firstBeam, secondBeam, thirdBeam;

    if (SPRITE_HAS_ISFT(gCurrentSprite) >= 5) {
        ParticleSet(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition, PE_0x2F);
        gCurrentSprite.work2 = 1;
    }
    BeamCoreXEyeHandleRotation();
    if (gCurrentSprite.work2 == 110) {
        gCurrentSprite.pOam = sBeamCoreXEyeOam_Charging1;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    } else if (gCurrentSprite.work2 == 60) {
        gCurrentSprite.pOam = sBeamCoreXEyeOam_Charging2;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        SpriteSpawnSecondary(SSPRITE_4D, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
            gSpriteData[gCurrentSprite.roomSlot].roomSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    } else if (gCurrentSprite.work2 < 60 && MOD_AND(gCurrentSprite.work2, 4) == 0) {
        if (gCurrentSprite.work2 & 4)
            gSpriteData[primary].paletteRow = 2;
        else
            gSpriteData[primary].paletteRow = 0;
    }
    if (--gCurrentSprite.work2 == 0) {
        u16 y, x;
        u8 rotation;
        u16 xFlip;
        u8 direction;

        gCurrentSprite.pOam = sBeamCoreXEyeOam_Opened;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        if (SPRITE_HAS_ISFT(gCurrentSprite) == 5) {
            gCurrentSprite.work2 = 1;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
        } else
            gCurrentSprite.work2 = 30;
        gCurrentSprite.pose = 0x1c;
        gSpriteData[primary].work0++;
        gSpriteData[primary].paletteRow = 0;
        y = gCurrentSprite.yPosition;
        x = gCurrentSprite.xPosition;
        rotation = gCurrentSprite.work1;
        if (rotation < Q_8_8(1.f/4) || rotation >= Q_8_8(3.f/4))
            xFlip = SS_X_FLIP;
        else
            xFlip = 0;
        if (rotation > Q_8_8(1.f/16) && rotation <= Q_8_8(3.f/16))
            direction = ACD_DIAGONAL_DOWN;
        else if (rotation > Q_8_8(3.f/16) && rotation <= Q_8_8(5.f/16))
            direction = ACD_DOWN;
        else if (rotation > Q_8_8(5.f/16) && rotation <= Q_8_8(7.f/16))
            direction = ACD_DIAGONAL_DOWN;
        else if (rotation > Q_8_8(7.f/16) && rotation <= Q_8_8(9.f/16))
            direction = ACD_FORWARD;
        else if (rotation > Q_8_8(9.f/16) && rotation <= Q_8_8(11.f/16))
            direction = ACD_DIAGONAL_UP;
        else if (rotation > Q_8_8(11.f/16) && rotation <= Q_8_8(13.f/16))
            direction = ACD_UP;
        else if (rotation > Q_8_8(13.f/16) && rotation <= Q_8_8(15.f/16))
            direction = ACD_DIAGONAL_UP;
        else
            direction = ACD_FORWARD;
        switch (gSpriteData[primary].spriteId) {
            case PSPRITE_CHARGE_BEAM_CORE_X:
                beamSpriteId = SSPRITE_BEAM_CORE_X_CHARGE_BEAM;
                break;
            case PSPRITE_WIDE_BEAM_CORE_X:
                beamSpriteId = SSPRITE_BEAM_CORE_X_WIDE_BEAM;
                break;
            case PSPRITE_PLASMA_BEAM_CORE_X:
                beamSpriteId = SSPRITE_BEAM_CORE_X_PLASMA_BEAM;
                break;
            case PSPRITE_WAVE_BEAM_CORE_X:
                beamSpriteId = SSPRITE_BEAM_CORE_X_WAVE_BEAM;
                break;
            case PSPRITE_ICE_BEAM_CORE_X:
                beamSpriteId = SSPRITE_BEAM_CORE_X_ICE_BEAM;
                break;
            default:
                return;
        }
        firstBeam = SpriteSpawnSecondary(beamSpriteId, 0, 10, primary, y, x, xFlip);
        if (firstBeam == UCHAR_MAX)
            return;
        gSpriteData[firstBeam].work0 = direction;
        gSpriteData[firstBeam].work1 = 0;
        secondBeam = SpriteSpawnSecondary(beamSpriteId, 1, 10, firstBeam, y, x, xFlip);
        if (secondBeam == UCHAR_MAX) {
            gSpriteData[firstBeam].status = 0;
            return;
        }
        gSpriteData[secondBeam].work0 = direction;
        gSpriteData[secondBeam].work1 = 0;
        thirdBeam = SpriteSpawnSecondary(beamSpriteId, 2, 10, firstBeam, y, x, xFlip);
        if (thirdBeam == UCHAR_MAX) {
            gSpriteData[firstBeam].status = 0;
            gSpriteData[secondBeam].status = 0;
            return;
        }
        gSpriteData[thirdBeam].work0 = direction;
        gSpriteData[thirdBeam].work1 = 0;
    }
}

void BeamCoreXEyeShooting(void) {
    if (!(gCurrentSprite.status & SS_IGNORE_PROJECTILES) && SPRITE_HAS_ISFT(gCurrentSprite) >= 5) {
        ParticleSet(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition, PE_0x2F);
        gCurrentSprite.work2 = 1;
    }
    if (--gCurrentSprite.work2 == 0) {
        gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
        gCurrentSprite.pOam = sBeamCoreXEyeOam_Closing;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1e;
        gSpriteData[gCurrentSprite.primarySpriteRamSlot].work0 = FALSE;
    }
}

void BeamCoreXEyeClosing(void) {
    BeamCoreXEyeHandleRotation();
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 2;
        gCurrentSprite.work2 = 100;
        gCurrentSprite.pOam = sBeamCoreXEyeOam_Closed;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.status |= SS_NOT_DRAWN;
    }
}

void BeamCoreXGlowingInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawOrder = 2;
    gCurrentSprite.frozenPaletteRowOffset = 3;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pOam = sBeamCoreXGlowingOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 60;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.pose = 2;
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].spriteId == SSPRITE_ICE_BEAM_CORE_X_EYE)
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
}

void BeamCoreXGlowingIdle(void) {
    u8 eye = gCurrentSprite.primarySpriteRamSlot;
    if (!(gSpriteData[eye].status & SS_EXISTS))
        gCurrentSprite.status = 0;
    else {
        gCurrentSprite.yPosition = gSpriteData[eye].yPosition;
        gCurrentSprite.xPosition = gSpriteData[eye].xPosition;
        if (--gCurrentSprite.work1 == 0)
            gCurrentSprite.status = 0;
    }
}

void BeamCoreX(void) {
    switch (gCurrentSprite.pose) {
        case 0x59:
            BeamCoreXTransformationInit();
        case 0x5a:
            BeamCoreXTransformation();
            break;
        case 0x1b:
            BeamCoreXMovingInit();
        case 0x1c:
            BeamCoreXMoving();
            break;
        case 0x5c:
            BeamCoreXMovingToTargetInit();
            break;
        case 0x5d:
            BeamCoreXMovingToTarget();
            break;
        case 0x5e:
            BeamCoreXRestingAtTarget();
            break;
        case 0x5f:
            BeamCoreXAbsorbed();
            break;
        case 0x60:
            BeamCoreXDisplayingMessage();
            break;
        case 0x37:
            BeamCoreXWaitToFlee();
            break;
        case 0x38:
            BeamCoreXFlee();
    }
}

void BeamCoreXShell(void) {
    u8 primary = gCurrentSprite.primarySpriteRamSlot;
    gCurrentSprite.yPosition = gSpriteData[primary].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primary].xPosition;
    if (gSpriteData[primary].status & SS_ENABLE_MOSAIC)
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    else
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    switch (gCurrentSprite.pose) {
        case 0:
            BeamCoreXShellInit();
            break;
        case 1:
            BeamCoreXShellTransformation();
            break;
        case 2:
            BeamCoreXShellIdle();
    }
}

void BeamCoreXEye(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            BeamCoreXEyeInit();
        case 1:
            BeamCoreXEyeTransformation();
            break;
        case 2:
            BeamCoreXEyeClosed();
            break;
        case 0x18:
            BeamCoreXEyeOpening();
            break;
        case 0x1a:
            BeamCoreXEyeOpened();
            break;
        case 0x1c:
            BeamCoreXEyeShooting();
            break;
        case 0x1e:
            BeamCoreXEyeClosing();
    }
}

void BeamCoreXGlowing(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            BeamCoreXGlowingInit();
        case 2:
            BeamCoreXGlowingIdle();
    }
}

void CoreXChargeBeamInit(void) {
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0xc;
    gCurrentSprite.hitboxBottom = 0xc;
    gCurrentSprite.hitboxLeft = -0xc;
    gCurrentSprite.hitboxRight = 0xc;
    if (gCurrentSprite.roomSlot > 0) {
        switch (gCurrentSprite.work0) {
            case ACD_DIAGONAL_DOWN:
                gCurrentSprite.status |= SS_Y_FLIP;
            case ACD_DIAGONAL_UP:
                gCurrentSprite.pOam = sChargeBeamOam_SingleDiagonal;
                break;
            case ACD_DOWN:
                gCurrentSprite.status |= SS_Y_FLIP;
            case ACD_UP:
                gCurrentSprite.pOam = sChargeBeamOam_SingleVertical;
                break;
            case ACD_FORWARD:
            default:
                gCurrentSprite.pOam = sChargeBeamOam_SingleHorizontal;
                break;
        }
    } else {
        SoundPlay(0xca);
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
        switch (gCurrentSprite.work0) {
            case ACD_DIAGONAL_DOWN:
                gCurrentSprite.status |= SS_Y_FLIP;
            case ACD_DIAGONAL_UP:
                gCurrentSprite.pOam = sChargeBeamOam_DoubleDiagonal;
                break;
            case ACD_DOWN:
                gCurrentSprite.status |= SS_Y_FLIP;
            case ACD_UP:
                gCurrentSprite.pOam = sChargeBeamOam_DoubleVertical;
                break;
            case ACD_FORWARD:
            default:
                gCurrentSprite.pOam = sChargeBeamOam_DoubleHorizontal;
                break;
        }
    }
}

void CoreXChargeBeam(void) {
    if (gCurrentSprite.roomSlot != 0) {
        if (gCurrentSprite.status & SS_NOT_DRAWN && gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose >= SPRITE_POSE_STOPPED)
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
        gCurrentClipdataAffectingAction = CAA_BEAM;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck != COLLISION_AIR) {
            if (gCurrentSprite.status & SS_NOT_DRAWN && gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose < SPRITE_POSE_STOPPED)
                gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose = SPRITE_POSE_STOPPED;
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_CHARGE_BEAM_HIT);
            gCurrentSprite.status = 0;
            return;
        }
        if (gCurrentSprite.pose <= 2)
            SpriteUtilMoveEyeCoreXBeamPart();
    }
    switch (gCurrentSprite.pose) {
        case 0:
            CoreXChargeBeamInit();
            gCurrentSprite.pose++;
            break;
        case 1:
            SpriteUtilMoveEyeCoreXBeam(0x10);
            gCurrentSprite.pose++;
            break;
        case 2:
            gCurrentSprite.pose++;
        case 3:
            SpriteUtilMoveEyeCoreXBeam(0x18);
            break;
        case SPRITE_POSE_STOPPED:
            gCurrentSprite.pose++;
            break;
        default:
            gCurrentSprite.status = 0;
    }
}

void CoreXWideBeamInit(void) {
    SoundPlay(0xc9);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x10;
    gCurrentSprite.hitboxBottom = 0x10;
    gCurrentSprite.hitboxLeft = -0x10;
    gCurrentSprite.hitboxRight = 0x10;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    switch (gCurrentSprite.work0) {
        case ACD_DIAGONAL_DOWN:
            gCurrentSprite.status |= SS_Y_FLIP;
            gCurrentSprite.pOam = sWideBeamOam_Diagonal;
            break;
        case ACD_DIAGONAL_UP:
            gCurrentSprite.pOam = sWideBeamOam_Diagonal;
            break;
        case ACD_DOWN:
            gCurrentSprite.status |= SS_Y_FLIP;
        case ACD_UP:
            gCurrentSprite.pOam = sWideBeamOam_Vertical;
            break;
        case ACD_FORWARD:
        default:
            gCurrentSprite.pOam = sWideBeamOam_Horizontal;
            break;
    }
}

void CoreXWideBeam(void) {
    // BUG: looks like they forgot to add the SPRITE_POSE_STOPPED case.
    if (gCurrentSprite.roomSlot != 0 && gCurrentSprite.pose < 9)
        SpriteUtilMoveEyeCoreXBeamPart();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck != COLLISION_AIR) {
        ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_WIDE_BEAM_HIT);
        gCurrentSprite.status = 0;
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            CoreXWideBeamInit();
            gCurrentSprite.pose++;
            break;
        case 1:
            SpriteUtilMoveEyeCoreXBeam(0x10);
            gCurrentSprite.pose++;
            break;
        default:
            if (gCurrentSprite.pose < 9)
                gCurrentSprite.pose++;
            SpriteUtilMoveEyeCoreXBeam(0x18);
            break;
    }
}

void CoreXPlasmaBeaminit(void)
{
    SoundPlay(0xcb);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0xc;
    gCurrentSprite.hitboxBottom = 0xc;
    gCurrentSprite.hitboxLeft = -0xc;
    gCurrentSprite.hitboxRight = 0xc;
    gCurrentSprite.status &= 0xfffb;
    switch (gCurrentSprite.work0) {
        case ACD_DIAGONAL_DOWN:
            gCurrentSprite.status |= SS_Y_FLIP;
            gCurrentSprite.pOam = sPlasmaBeamOam_Diagonal;
            break;
        case ACD_DIAGONAL_UP:
            gCurrentSprite.pOam = sPlasmaBeamOam_Diagonal;
            break;
        case ACD_DOWN:
            gCurrentSprite.status |= SS_Y_FLIP;
        case ACD_UP:
            gCurrentSprite.pOam = sPlasmaBeamOam_Vertical;
            break;
        case ACD_FORWARD:
        default:
            gCurrentSprite.pOam = sPlasmaBeamOam_Horizontal;
            break;
    }
}

void CoreXPlasmaBeam(void) {
    if (gCurrentSprite.roomSlot != 0 && gCurrentSprite.pose < 9)
        SpriteUtilMoveEyeCoreXBeamPart();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck != COLLISION_AIR) {
        ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_PLASMA_BEAM_HIT);
        gCurrentSprite.status = 0;
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            CoreXPlasmaBeaminit();
            gCurrentSprite.pose++;
            break;
        case 1:
            SpriteUtilMoveEyeCoreXBeam(0x10);
            gCurrentSprite.pose++;
            break;
        default:
            if (gCurrentSprite.pose < 9)
                gCurrentSprite.pose++;
            SpriteUtilMoveEyeCoreXBeam(0x18); // for some reason it's slower than Samus's plasma beam
            break;
    }
}

void CoreXWaveIceBeamInit(void) {
    if (gCurrentSprite.spriteId == SSPRITE_BEAM_CORE_X_ICE_BEAM)
        SoundPlay(0xcd);
    else
        SoundPlay(0xcc);
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.drawOrder = 1;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x10;
    gCurrentSprite.hitboxBottom = 0x10;
    gCurrentSprite.hitboxLeft = -0x10;
    gCurrentSprite.hitboxRight = 0x10;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    switch (gCurrentSprite.work0) {
        case ACD_DIAGONAL_DOWN:
            gCurrentSprite.status |= SS_Y_FLIP;
            if (gCurrentSprite.spriteId == SSPRITE_BEAM_CORE_X_ICE_BEAM)
                gCurrentSprite.pOam = sIceBeamOam_Diagonal;
            else
                gCurrentSprite.pOam = sWaveBeamOam_Diagonal;
            break;
        case ACD_DIAGONAL_UP:
            if (gCurrentSprite.spriteId == SSPRITE_BEAM_CORE_X_ICE_BEAM)
                gCurrentSprite.pOam = sIceBeamOam_Diagonal;
            else
                gCurrentSprite.pOam = sWaveBeamOam_Diagonal;
            break;
        case ACD_DOWN:
            gCurrentSprite.status |= SS_Y_FLIP;
        case ACD_UP:
            if (gCurrentSprite.spriteId == SSPRITE_BEAM_CORE_X_ICE_BEAM)
                gCurrentSprite.pOam = sIceBeamOam_Vertical;
            else
                gCurrentSprite.pOam = sWaveBeamOam_Vertical;
            break;
        case ACD_FORWARD:
        default:
            if (gCurrentSprite.spriteId == SSPRITE_BEAM_CORE_X_ICE_BEAM)
                gCurrentSprite.pOam = sIceBeamOam_Horizontal;
            else
                gCurrentSprite.pOam = sWaveBeamOam_Horizontal;
            break;
    }
}

void CoreXWaveIceBeam(void) {
    if (gCurrentSprite.roomSlot != 0)
        SpriteUtilMoveEyeCoreXWaveBeamPart();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    switch (gCurrentSprite.pose) {
        case 0:
            CoreXWaveIceBeamInit();
            gCurrentSprite.pose++;
            break;
        case 1:
            SpriteUtilMoveEyeCoreXBeam(0x10);
            gCurrentSprite.pose++;
            break;
        default:
            SpriteUtilMoveEyeCoreXBeam(0x18); // for some reason it's slower than Samus's wave/ice beam
            // Developers be like: TODO ice beam trail
            break;
    }
    gCurrentSprite.work1++;
}
