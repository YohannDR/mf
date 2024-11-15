#include "macros.h"
#include "globals.h"

#include "gba/dma.h"

#include "data/sprites/core_x.h"
#include "data/sprites/core_x_downloading_varia.h"
#include "data/sprite_data.h"

#include "constants/audio.h"

#include "structs/sprite.h"

void CoreAbilityBeforeVariaCoreInit(void) {
    u8 ramSlot;

    gCurrentSprite.yPosition += 0x30;
    gCurrentSprite.pose = 2;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawOrder = 6;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.pOam = sCoreXAbilityBeforeVariaCoreOam_DownloadingVaria;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 2;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;

    ramSlot = SpriteSpawnSecondary(SSPRITE_CORE_X_SHELL_BEFORE_VARIA_CORE, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    ramSlot = SpriteSpawnSecondary(SSPRITE_CORE_X_STATIC_BEFORE_VARIA_CORE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    ramSlot = SpriteSpawnSecondary(SSPRITE_CORE_X_STATIC_BEFORE_VARIA_CORE, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    ramSlot = SpriteSpawnSecondary(SSPRITE_CORE_X_STATIC_BEFORE_VARIA_CORE, 2, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    ramSlot = SpriteSpawnSecondary(SSPRITE_CORE_X_STATIC_BEFORE_VARIA_CORE, 3, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
}

void CoreXAbilityBeforeVariaCoreIdle(void) {
    if (gCurrentSprite.work1 > 0) {
        if (--gCurrentSprite.work1 == 0) SoundPlay(0x231);
    }
}

void CoreXAbilityBeforeVariaCoreExplodingDataPad(void) {
    u8 yOffset, xOffset;
    s16 yMovement, xMovement;

    yOffset = gCurrentSprite.work4;
    yMovement = sCoreXIdleYSpeed[yOffset];
    if (yMovement == SHORT_MAX) {
        yMovement = sCoreXIdleYSpeed[0];
        yOffset = 0;
    }
    yOffset++;
    gCurrentSprite.work4 = yOffset;
    gCurrentSprite.yPosition += yMovement;

    xOffset = gCurrentSprite.work3;
    xMovement = sCoreXIdleXSpeed[xOffset];
    if (xMovement == SHORT_MAX) {
        xMovement = sCoreXIdleXSpeed[0];
        xOffset = 0;
    }
    xOffset++;
    gCurrentSprite.work3 = xOffset;
    gCurrentSprite.xPosition += xMovement;
}

void CoreXAbilityBeforeVariaCoreFloatingAway(void) {
    u8 offset;
    s16 movement;

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

    gCurrentSprite.yPosition -= 2;
    gCurrentSprite.xPosition += 3;
}

void CoreXAbilityBeforeVariaCore(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            CoreAbilityBeforeVariaCoreInit();
            break;
        case 2:
            CoreXAbilityBeforeVariaCoreIdle();
            break;
        case 0x18:
            CoreXAbilityBeforeVariaCoreExplodingDataPad();
            break;
        case 0x1a:
            CoreXAbilityBeforeVariaCoreFloatingAway();
            break;
    }
}

void CoreXShellBeforeVariaCore(void) {
    u8 primarySpriteSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gCurrentSprite.pose == 0) {
        gCurrentSprite.status |= SS_ROTATE_SCALE_WHOLE;
        gCurrentSprite.scaling = Q_8_8(1);
        gCurrentSprite.rotation = 0;
        gCurrentSprite.frozenPaletteRowOffset = 1;
        gCurrentSprite.status &= ~SS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 5;
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
        gCurrentSprite.health = 4096; // hardcoded health
        gCurrentSprite.drawDistanceTop = 0x18;
        gCurrentSprite.drawDistanceBottom = 0x18;
        gCurrentSprite.drawDistanceHorizontal = 0x18;
        gCurrentSprite.hitboxTop = -0x50;
        gCurrentSprite.hitboxBottom = 0x50;
        gCurrentSprite.hitboxLeft = -0x50;
        gCurrentSprite.hitboxRight = 0x50;
        gCurrentSprite.pOam = sCoreXShellBeforeVariaCoreOam_Downloading;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.work1 = 0;
        gCurrentSprite.pose = 2;
    } else if (gCurrentSprite.pose == 0x1a) {
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        gCurrentSprite.status ^= SS_NOT_DRAWN;
        gCurrentSprite.rotation += Q_8_8(7.f/128);
    } else {
        gCurrentSprite.work1++;
        if (gCurrentSprite.work1 >= 120)
            gCurrentSprite.rotation += DIV_SHIFT(gCurrentSprite.work1, 16);
        if (gCurrentSprite.work1 == 180) {
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.pose = 0x1a;
            gCurrentSprite.samusCollision = SSC_NONE;
            gSpriteData[primarySpriteSlot].pose = 0x1a;
            gSpriteData[primarySpriteSlot].pOam = sCoreXAbilityBeforeVariaCoreOam_FloatingAway;
            gSpriteData[primarySpriteSlot].animationDurationCounter = 0;
            gSpriteData[primarySpriteSlot].currentAnimationFrame = 0;
        } else if (gCurrentSprite.work1 == 120) {
            gSpriteData[primarySpriteSlot].pose = 0x18;
            gSpriteData[primarySpriteSlot].pOam = sCoreXAbilityBeforeVariaCoreOam_ExplodingDataPad;
            gSpriteData[primarySpriteSlot].animationDurationCounter = 0;
            gSpriteData[primarySpriteSlot].currentAnimationFrame = 0;
            gCurrentSprite.pOam = sCoreXShellBeforeVariaCoreOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
        else if (gCurrentSprite.work1 == 121)
            DMA_SET(3, sVariaXAfterDownloadingGfx+0*0x200, VRAM_OBJ+0x5800+0*0x200, C_32_2_16(DMA_ENABLE, 0x200/2))
        else if (gCurrentSprite.work1 == 122)
            DMA_SET(3, sVariaXAfterDownloadingGfx+1*0x200, VRAM_OBJ+0x5800+1*0x200, C_32_2_16(DMA_ENABLE, 0x200/2))
        else if (gCurrentSprite.work1 == 123)
            DMA_SET(3, sVariaXAfterDownloadingGfx+2*0x200, VRAM_OBJ+0x5800+2*0x200, C_32_2_16(DMA_ENABLE, 0x200/2))
        else if (gCurrentSprite.work1 == 124)
            DMA_SET(3, sVariaXAfterDownloadingGfx+3*0x200, VRAM_OBJ+0x5800+3*0x200, C_32_2_16(DMA_ENABLE, 0x200/2))
        else if (gCurrentSprite.work1 == 125)
            DMA_SET(3, sVariaXAfterDownloadingGfx+4*0x200, VRAM_OBJ+0x5800+4*0x200, C_32_2_16(DMA_ENABLE, 0x200/2))
        else if (gCurrentSprite.work1 == 126)
            DMA_SET(3, sVariaXAfterDownloadingGfx+5*0x200, VRAM_OBJ+0x5800+5*0x200, C_32_2_16(DMA_ENABLE, 0x200/2))
        else if (gCurrentSprite.work1 == 127)
            DMA_SET(3, sVariaXAfterDownloadingGfx+6*0x200, VRAM_OBJ+0x5800+6*0x200, C_32_2_16(DMA_ENABLE, 0x200/2))
        else if (gCurrentSprite.work1 == 128)
            DMA_SET(3, sVariaXAfterDownloadingGfx+7*0x200, VRAM_OBJ+0x5800+7*0x200, C_32_2_16(DMA_ENABLE, 0x200/2))
    }

    gCurrentSprite.yPosition = gSpriteData[primarySpriteSlot].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primarySpriteSlot].xPosition;
}

void CoreXStaticBeforeVariaCore(void) {
    u8 primarySpriteSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    primarySpriteSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gCurrentSprite.pose == 0) {
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
        if (gCurrentSprite.roomSlot == 0) {
            gCurrentSprite.pOam = sCoreXStaticBeforeVariaCoreOam_0;
        } else if (gCurrentSprite.roomSlot == 1) {
            gCurrentSprite.pOam = sCoreXStaticBeforeVariaCoreOam_1;
        } else if (gCurrentSprite.roomSlot == 2) {
            gCurrentSprite.pOam = sCoreXStaticBeforeVariaCoreOam_2;
        } else if (gCurrentSprite.roomSlot == 3) {
            gCurrentSprite.pOam = sCoreXStaticBeforeVariaCoreOam_3;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
        } else
            gCurrentSprite.status = 0;
    }
    if (gSpriteData[primarySpriteSlot].pose == 0x1a)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    else if (gSpriteData[primarySpriteSlot].pose == 0x18) {
        if (gCurrentSprite.roomSlot == 3)
            gCurrentSprite.status = 0;
        else
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
    }
    gCurrentSprite.yPosition = gSpriteData[primarySpriteSlot].yPosition;
    gCurrentSprite.xPosition = gSpriteData[primarySpriteSlot].xPosition;
}
