#include "macros.h"
#include "globals.h"

#include "data/audio.h"
#include "data/frame_data_pointers.h"
#include "data/sprite_data.h"
#include "data/sprites/core_x.h"
#include "data/sprites/nightmare.h"
#include "data/sprites/x_parasite.h"

#include "constants/audio.h"
#include "constants/particle.h"
#include "constants/projectile.h"
#include "constants/samus.h"

#include "structs/projectile.h"
#include "structs/samus.h"

void NightmareMoveToPosition(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor) {
    u8 flip;
    u16 velocity;

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        // Move right
        if (gCurrentSprite.work2 == 0)
        {
            if (gSubSpriteData1.xPosition > dstX + PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                gSubSpriteData1.xPosition += (gCurrentSprite.work3 >> speedDivisor);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gSubSpriteData1.xPosition += (gCurrentSprite.work2 >> speedDivisor);
            else
                flip = TRUE;
        }
    }
    else
    {
        // Move left
        if (gCurrentSprite.work2 == 0)
        {
            if (gSubSpriteData1.xPosition < dstX - PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                velocity = gCurrentSprite.work3 >> speedDivisor;
                if ((gSubSpriteData1.xPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gSubSpriteData1.xPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gSubSpriteData1.xPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gSubSpriteData1.xPosition -= velocity;
            }
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
        SoundPlayNotAlreadyPlaying(0x2a6);
    }

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_DOWN)
    {
        // Move down
        if (gCurrentSprite.work1 == 0)
        {
            if (gSubSpriteData1.yPosition > dstY - PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                gSubSpriteData1.yPosition += (gCurrentSprite.work4 >> speedDivisor);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gSubSpriteData1.yPosition += (gCurrentSprite.work1 >> speedDivisor);
            else
                flip = TRUE;
        }
    }
    else
    {
        // Move up
        if (gCurrentSprite.work1 == 0)
        {
            if (gSubSpriteData1.yPosition < dstY + PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                velocity = gCurrentSprite.work4 >> speedDivisor;
                if ((gSubSpriteData1.yPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gSubSpriteData1.yPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gSubSpriteData1.yPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gSubSpriteData1.yPosition -= velocity;
            }
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_DOWN;
        gCurrentSprite.work4 = 1;
        SoundPlayNotAlreadyPlaying(0x2a6);
    }
}

void NightmareSyncSubSprites(void) {
    MultiSpriteDataInfo_T pData;
    u16 oamIdx;

    pData = gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].pData;

    oamIdx = pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX];
    
    if (gCurrentSprite.pOam != sNightmareFrameDataPointers[oamIdx])
    {
        gCurrentSprite.pOam = sNightmareFrameDataPointers[oamIdx];
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }

    gCurrentSprite.yPosition = gSubSpriteData1.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];
    gCurrentSprite.xPosition = gSubSpriteData1.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
}

void NightmarePlaySound(void) {
    if (gCurrentSprite.samusCollision != SSC_NONE && gSubSpriteData1.currentAnimationFrame == 0 && gSubSpriteData1.animationDurationCounter == 12) {
        SoundPlay(0x2a1);
    }
}

void NightmareMakeMissilesFall(void) {
    u8 i;
    u8 typeToCheck = PROJ_TYPE_ICE_MISSILE;
    u16 fallingSpeed;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++) {
        if (!(gProjectileData[i].status & PROJ_STATUS_EXISTS))
            continue;
        if (!(gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT))
            continue;
        if (gProjectileData[i].type != typeToCheck)
            continue;

        if ((gProjectileData[i].part & 3) == 0)
            gProjectileData[i].part++;
        if (gProjectileData[i].part < 0x2a)
            fallingSpeed = gProjectileData[i].part;
        else
            fallingSpeed = 0x2a;
        gProjectileData[i].yPosition += fallingSpeed;
    }
}

void NightmareReduceSamusXVelocity(void) {
    if (gEquipment.currentEnergy != 0) {
        if (gSamusData.xVelocity > 4)
            gSamusData.xVelocity -= 2;
        else if (gSamusData.xVelocity < -4)
            gSamusData.xVelocity += 2;
    }
}

void NightmareInit(void) {
    if (gEquipment.suitMiscStatus & SMF_GRAVITY_SUIT)
        gCurrentSprite.status = 0;
    else {
        u32 y, x;
        u8 primaryRamSlot, eyeRamSlot, mouthRamSlot;

        gCurrentSprite.yPosition += BLOCK_TO_SUB_PIXEL(0xb);
        gCurrentSprite.xPosition += BLOCK_SIZE;
        gSubSpriteData1.yPosition = gCurrentSprite.yPosition;
        gSubSpriteData1.xPosition = gCurrentSprite.xPosition;
        gCurrentSprite.roomSlot = NIGHTMARE_PART_BODY;
        gCurrentSprite.drawOrder = 12;
        gCurrentSprite.drawDistanceTop = 0x50;
        gCurrentSprite.drawDistanceBottom = 8;
        gCurrentSprite.drawDistanceHorizontal = 0x40;
        gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(0x40);
        gCurrentSprite.hitboxBottom = -PIXEL_TO_SUB_PIXEL(8);
        gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(0x28);
        gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(0x30);
        gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
        gSubSpriteData1.pMultiOam = sNightmareMultiOam_Used; // this is the only multi OAM used
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.work0 = 0;
        gCurrentSprite.pose = 0x37;
        gCurrentSprite.work1 = 3 * 60;
        gBossWork3 = 3 * 60;
        y = gSubSpriteData1.yPosition;
        x = gSubSpriteData1.xPosition;
        primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_CHIN_SLUDGE, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_EYE_SLUDGE, 0, primaryRamSlot, y, x, 0);
        eyeRamSlot = SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_EYE, 0, primaryRamSlot, y, x, 0);
        mouthRamSlot = SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_MOUTH, 0, primaryRamSlot, y, x, 0);
        gSpriteData[eyeRamSlot].numberOfXToForm = mouthRamSlot;
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_RIGHT_ARM_TOP, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_RIGHT_TURRET_1, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_RIGHT_TURRET_2, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_RIGHT_TURRET_3, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_RIGHT_ARM_BOTTOM, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_GENERATOR, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_LEFT_TURRET_1, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_LEFT_TURRET_2, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_PART, NIGHTMARE_PART_LEFT_TURRET_3, 0, primaryRamSlot, y, x, 0);
    }
}

void NightmareWaitingToAppear(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x38;
        ScreenShakeStartHorizontal(60, 0x81);
        ScreenShakeStartVertical(60, 0x81);
        gCurrentSprite.work1 = 60;
        unk_3b1c(0x2a0);
    }
}

void NightmareAppearing(void) {
    gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.work1 == 0) {
        ScreenShakeStartHorizontal(60, 0x81);
        ScreenShakeStartVertical(60, 0x81);
        gCurrentSprite.work1 = 60;
        unk_3b1c(0x2a0);
    }
    if (gSubSpriteData1.yPosition > BLOCK_TO_SUB_PIXEL(0x10))
        gSubSpriteData1.yPosition -= PIXEL_SIZE / 4;
    else
        gCurrentSprite.pose = 0x39;
}

void NightmarePhase1Init(void) {
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = PIXEL_SIZE / 4;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = PIXEL_SIZE / 4;
    gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
    gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
    gCurrentSprite.pose = 0x3a;
    PlayMusic(MUSIC_NIGHTMARE_BATTLE, 7);
}

void NightmarePhase1(void) {
    NightmareMoveToPosition(gSamusData.yPosition - BLOCK_TO_SUB_PIXEL(4), gAbilityRestingXPosition + BLOCK_TO_SUB_PIXEL(3), PIXEL_TO_SUB_PIXEL(2.5f) * 4, PIXEL_TO_SUB_PIXEL(0.5f) * 4, 2);
}

void NightmarePhase2ResettingPosition(void) {
    u8 reachedDst = 0;
    u16 dstY = gAbilityRestingYPosition - BLOCK_TO_SUB_PIXEL(2);
    u16 dstX = gAbilityRestingXPosition + BLOCK_TO_SUB_PIXEL(4);
    if (gSubSpriteData1.xPosition < dstX)
        gCurrentSprite.status |= SS_FACING_RIGHT;
    else
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    if (gSubSpriteData1.yPosition < dstY)
        gCurrentSprite.status |= SS_FACING_DOWN;
    else
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    if (gSubSpriteData1.yPosition < dstY + PIXEL_TO_SUB_PIXEL(1.5f) && gSubSpriteData1.yPosition > dstY - PIXEL_TO_SUB_PIXEL(1.5f))
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_DOWN)
        gSubSpriteData1.yPosition += PIXEL_SIZE / 4;
    else
        gSubSpriteData1.yPosition -= PIXEL_SIZE / 4;
    if (gSubSpriteData1.xPosition < dstX + PIXEL_TO_SUB_PIXEL(1.5f) && gSubSpriteData1.xPosition > dstX - PIXEL_TO_SUB_PIXEL(1.5f))
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_RIGHT)
        gSubSpriteData1.xPosition += PIXEL_SIZE / 4;
    else
        gSubSpriteData1.xPosition -= PIXEL_SIZE / 4;
    if (reachedDst == 2) {
        gCurrentSprite.pose = 1;
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    }
}

void NightmarePhase2MovementInit(void) {
    gCurrentSprite.pose = 2;
    gCurrentSprite.xParasiteTimer = 0;
    gCurrentSprite.work4 = 0;
}

void NightmarePhase2Movement(void) {
    u16 movement = sNightmarePhase2XSpeed[DIV_SHIFT(gCurrentSprite.xParasiteTimer, 32)];
    if (gCurrentSprite.xParasiteTimer < ARRAY_SIZE(sNightmarePhase2XSpeed) * 32 - 1)
        gCurrentSprite.xParasiteTimer++;
    else {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.xParasiteTimer = 0;
    }
    if (gCurrentSprite.status & SS_FACING_RIGHT)
        gSubSpriteData1.xPosition += movement;
    else
        gSubSpriteData1.xPosition -= movement;

    movement = sNightmarePhase2YSpeed[DIV_SHIFT(gCurrentSprite.work4, 8)];
    if (gCurrentSprite.work4 < ARRAY_SIZE(sNightmarePhase2YSpeed) * 8 - 1)
        gCurrentSprite.work4++;
    else
        gCurrentSprite.work4 = 0;
    gSubSpriteData1.yPosition += movement;
}

void NightmareMovingToPhase3Init(void) {
    gCurrentSprite.pose = 0x18;
}

void NightmareMovingToPhase3(void) {
    u8 reachedDst = 0;
    u16 dstY = gAbilityRestingYPosition;
    u16 dstX = gAbilityRestingXPosition + BLOCK_TO_SUB_PIXEL(3);
    if (gSubSpriteData1.xPosition < dstX)
        gCurrentSprite.status |= SS_FACING_RIGHT;
    else
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    if (gSubSpriteData1.yPosition < dstY)
        gCurrentSprite.status |= SS_FACING_DOWN;
    else
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    if (gSubSpriteData1.yPosition < dstY + PIXEL_TO_SUB_PIXEL(1.5f) && gSubSpriteData1.yPosition > dstY - PIXEL_TO_SUB_PIXEL(1.5f))
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_DOWN)
        gSubSpriteData1.yPosition += PIXEL_SIZE / 4;
    else
        gSubSpriteData1.yPosition -= PIXEL_SIZE / 4;
    if (gSubSpriteData1.xPosition < dstX + PIXEL_TO_SUB_PIXEL(1.5f) && gSubSpriteData1.xPosition > dstX - PIXEL_TO_SUB_PIXEL(1.5f))
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_RIGHT)
        gSubSpriteData1.xPosition += PIXEL_SIZE / 4;
    else
        gSubSpriteData1.xPosition -= PIXEL_SIZE / 4;
    if (reachedDst == 2) {
        gCurrentSprite.pose = 0x19;
    }
}

void NightmareReachedPhase3Position() {}

void NightmarePhase3SlowMovementInit(void) {}

void NightmarePhase3SlowMovement(void) {
    u8 switchToFastMovement = 0;
    if (gSubSpriteData1.yPosition < gSamusData.yPosition - PIXEL_TO_SUB_PIXEL(0x20))
        gSubSpriteData1.yPosition += PIXEL_SIZE / 4;
    else
        switchToFastMovement++;
    // Check if Nightmare is near the wall
    SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition - PIXEL_TO_SUB_PIXEL(0x30));
    if (gPreviousCollisionCheck != 0) {
        switchToFastMovement++;
    } else {
        gSubSpriteData1.xPosition -= PIXEL_SIZE / 4;
    }
    if (switchToFastMovement == 2)
        gCurrentSprite.pose = 0x1b;
}

void NightmarePhase3FastMovementInit(void) {
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = PIXEL_SIZE / 4;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = PIXEL_SIZE / 4;
    gCurrentSprite.pose = 0x1c;
    gCurrentSprite.xParasiteTimer = 5 * 60;
}

void NightmarePhase3FastMovement(void) {
    u16 dstX;
    u16 dstY;
    if (gCurrentSprite.xParasiteTimer > 4 * 60) {
        dstY = gXParasiteTargetYPosition;
        dstX = gXParasiteTargetXPosition;
    } else {
        dstY = gSamusData.yPosition - PIXEL_TO_SUB_PIXEL(0x20);
        dstX = gSamusData.xPosition;
    }
    NightmareMoveToPosition(dstY, dstX, PIXEL_TO_SUB_PIXEL(3) * 4, PIXEL_TO_SUB_PIXEL(3) * 4, 2);
    if (gCurrentSprite.xParasiteTimer > 0) {
        gCurrentSprite.xParasiteTimer--;
    } else {
        u16 posOnScreen = SUB_PIXEL_TO_PIXEL_(gSubSpriteData1.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition);
        if (posOnScreen > 0x8c && posOnScreen < SCREEN_SIZE_X - 0x18) {
            posOnScreen = SUB_PIXEL_TO_PIXEL_(gSubSpriteData1.yPosition) - SUB_PIXEL_TO_PIXEL_(gBg1YPosition);
            if (posOnScreen > 0x14 && posOnScreen < SCREEN_SIZE_Y - 0x3c)
                if (gSamusData.xPosition < gSubSpriteData1.xPosition - PIXEL_TO_SUB_PIXEL(0x10))
                    gCurrentSprite.pose = 0x1e;
        }
    }
}

void NightmareDeathFlash(void) {
    u8 work2 = gCurrentSprite.work2++;
    if ((work2 & 3) == 0) {
        if ((work2 & 4) != 0)
            gCurrentSprite.paletteRow = 13 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
        else
            gCurrentSprite.paletteRow = 0;
    }
}

void NightmareMovingToDeathPosition(void) {
    u8 reachedDst;
    u16 dstY, dstX;
    NightmareDeathFlash();
    reachedDst = 0;
    dstY = gAbilityRestingYPosition;
    dstX = gAbilityRestingXPosition + BLOCK_TO_SUB_PIXEL(3);
    if (gSubSpriteData1.xPosition < dstX)
        gCurrentSprite.status |= SS_FACING_RIGHT;
    else
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    if (gSubSpriteData1.yPosition < dstY)
        gCurrentSprite.status |= SS_FACING_DOWN;
    else
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    if (gSubSpriteData1.yPosition < dstY + PIXEL_TO_SUB_PIXEL(1.5f) && gSubSpriteData1.yPosition > dstY - PIXEL_TO_SUB_PIXEL(1.5f))
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_DOWN)
        gSubSpriteData1.yPosition += PIXEL_SIZE / 4;
    else
        gSubSpriteData1.yPosition -= PIXEL_SIZE / 4;
    if (gSubSpriteData1.xPosition < dstX + PIXEL_TO_SUB_PIXEL(1.5f) && gSubSpriteData1.xPosition > dstX - PIXEL_TO_SUB_PIXEL(1.5f))
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_RIGHT)
        gSubSpriteData1.xPosition += PIXEL_SIZE / 4;
    else
        gSubSpriteData1.xPosition -= PIXEL_SIZE / 4;
    if (reachedDst == 2) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = 0x22;
            gCurrentSprite.work1 = 60;
            unk_3b1c(0x2a4);
        }
    }
}

void NightmareTurningIntoCoreX(void) {
    if (gCurrentSprite.work1 > 0) {
        NightmareDeathFlash();
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.status |= SS_ENABLE_MOSAIC;
            gCurrentSprite.invincibilityStunFlashTimer = 0;
            gCurrentSprite.paletteRow = 0;
            gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
        }
    } else {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
        if (--gCurrentSprite.xParasiteTimer == 0) {
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
            gCurrentSprite.spriteId = PSPRITE_GRAVITY_SUIT_ABILITY;
        }
        if (gCurrentSprite.xParasiteTimer < ARRAY_SIZE(sGravityCoreXGfx) / 512 * 4)
            SpriteLoadGfx(PSPRITE_GRAVITY_SUIT_ABILITY, 0, gCurrentSprite.xParasiteTimer);
        else if (gCurrentSprite.xParasiteTimer == ARRAY_SIZE(sGravityCoreXGfx) / 512 * 4)
            SpriteLoadPal(PSPRITE_GRAVITY_SUIT_ABILITY, 0, ARRAY_SIZE(sGravityCoreXPal) / 16);
    }
}

void NightmarePartInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.pose = 2;
    gCurrentSprite.work0 = 0;
    switch (gCurrentSprite.roomSlot) {
        case NIGHTMARE_PART_CHIN_SLUDGE:
            gCurrentSprite.drawOrder = 9;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 0;
            gCurrentSprite.drawDistanceHorizontal = 0x28;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.status |= SS_NOT_DRAWN;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.samusCollision = SSC_NONE;
            break;
        case NIGHTMARE_PART_EYE_SLUDGE:
            gCurrentSprite.drawOrder = 9;
            gCurrentSprite.drawDistanceTop = 0x30;
            gCurrentSprite.drawDistanceBottom = 0;
            gCurrentSprite.drawDistanceHorizontal = 0x30;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.status |= SS_NOT_DRAWN;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.samusCollision = SSC_NONE;
            break;
        case NIGHTMARE_PART_EYE:
            gCurrentSprite.drawOrder = 10;
            gCurrentSprite.drawDistanceTop = 0x38;
            gCurrentSprite.drawDistanceBottom = 0;
            gCurrentSprite.drawDistanceHorizontal = 0x28;
            gCurrentSprite.hitboxTop = -0xa0;
            gCurrentSprite.hitboxBottom = -0x50;
            gCurrentSprite.hitboxLeft = -0xa0;
            gCurrentSprite.hitboxRight = 0;
            gCurrentSprite.status |= SS_HIDDEN;
            gCurrentSprite.samusCollision = SSC_NONE;
            break;
        case NIGHTMARE_PART_MOUTH:
            gCurrentSprite.drawOrder = 11;
            gCurrentSprite.drawDistanceTop = 0x38;
            gCurrentSprite.drawDistanceBottom = 0;
            gCurrentSprite.drawDistanceHorizontal = 0x30;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.status |= SS_HIDDEN;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.samusCollision = SSC_NONE;
            break;
        case NIGHTMARE_PART_RIGHT_ARM_TOP:
            gCurrentSprite.drawOrder = 4;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x10;
            gCurrentSprite.hitboxTop = -0x40;
            gCurrentSprite.hitboxBottom = 0x20;
            gCurrentSprite.hitboxLeft = -0x20;
            gCurrentSprite.hitboxRight = 0x20;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            gCurrentSprite.health = 1;
            break;
        case NIGHTMARE_PART_RIGHT_TURRET_1:
            gCurrentSprite.drawOrder = 5;
            gCurrentSprite.drawDistanceTop = 0x1a;
            gCurrentSprite.drawDistanceBottom = 0xa;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 8;
            gCurrentSprite.hitboxLeft = -0x18;
            gCurrentSprite.hitboxRight = 0x30;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            gCurrentSprite.health = 1;
            break;
        case NIGHTMARE_PART_RIGHT_TURRET_2:
            gCurrentSprite.drawOrder = 6;
            gCurrentSprite.drawDistanceTop = 0x20;
            gCurrentSprite.drawDistanceBottom = 0xa;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 8;
            gCurrentSprite.hitboxLeft = -0x18;
            gCurrentSprite.hitboxRight = 0x40;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            gCurrentSprite.health = 1;
            break;
        case NIGHTMARE_PART_RIGHT_TURRET_3:
            gCurrentSprite.drawOrder = 7;
            gCurrentSprite.drawDistanceTop = 0x1a;
            gCurrentSprite.drawDistanceBottom = 0xa;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 0x40;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            gCurrentSprite.health = 1;
            break;
        case NIGHTMARE_PART_RIGHT_ARM_BOTTOM:
            gCurrentSprite.drawOrder = 8;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x40;
            gCurrentSprite.hitboxBottom = 0x30;
            gCurrentSprite.hitboxLeft = -0x30;
            gCurrentSprite.hitboxRight = 0x48;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            gCurrentSprite.health = 1;
            break;
        case NIGHTMARE_PART_GENERATOR:
            gCurrentSprite.drawOrder = 11;
            gCurrentSprite.drawDistanceTop = 4;
            gCurrentSprite.drawDistanceBottom = 0x20;
            gCurrentSprite.drawDistanceHorizontal = 0x28;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 0x60;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 0x80;
            gCurrentSprite.frozenPaletteRowOffset = 3;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
            gSubSpriteData1.health = gCurrentSprite.health;
            gCurrentSprite.work1 = 0;
            gCurrentSprite.work2 = 0;
            gCurrentSprite.pose = 1;
            break;
        case NIGHTMARE_PART_LEFT_TURRET_1:
            gCurrentSprite.drawOrder = 13;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 0x20;
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x20;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            gCurrentSprite.health = 1;
            break;
        case NIGHTMARE_PART_LEFT_TURRET_2:
            gCurrentSprite.drawOrder = 14;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x60;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x20;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            gCurrentSprite.health = 1;
            break;
        case NIGHTMARE_PART_LEFT_TURRET_3:
            gCurrentSprite.drawOrder = 15;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x40;
            gCurrentSprite.hitboxBottom = 0x18;
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x20;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            gCurrentSprite.health = 1;
            break;
        default:
            gCurrentSprite.status = 0;
            break;
    }
    NightmareSyncSubSprites();
}

void NightmarePartDying(u8 primaryRamSlot) {
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.paletteRow = gSpriteData[primaryRamSlot].paletteRow;
}

void NightmarePartSpawnBeam(void) {
    if (gCurrentSprite.currentAnimationFrame == 11 && gCurrentSprite.animationDurationCounter == 3)
        SpriteSpawnSecondary(SSPRITE_NIGHTMARE_BEAM, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20, 0);
}

void NightmarePartRightArmTop(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
        case 2: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (gSpriteData[primaryRamSlot].pose == 0x22) {
                SpriteSpawnSecondary(SSPRITE_NIGHTMARE_FALLING_ARM, 0, 0, primaryRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
            } else if (gSpriteData[primaryRamSlot].pose == 0x20)
                NightmarePartDying(gCurrentSprite.primarySpriteRamSlot);
            break;
        }
    }
}

void NightmarePartRightArmBottom(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
        case 2: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (gSpriteData[primaryRamSlot].pose == 0x22) {
                SpriteSpawnSecondary(SSPRITE_NIGHTMARE_FALLING_ARM, 4, 0, primaryRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
            } else if (gSpriteData[primaryRamSlot].pose == 0x20)
                NightmarePartDying(gCurrentSprite.primarySpriteRamSlot);
            break;
        }
    }
}

void NightmarePartRightTurret1(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        case 2: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.work1 = 108;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd874;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (--gCurrentSprite.work1 == 0) {
                    if (gSpriteData[primaryRamSlot].pose == 2)
                        gCurrentSprite.pOam = sFrameData_3bdbec;
                    else if (gSpriteData[primaryRamSlot].pose == 0x1c)
                        gCurrentSprite.pOam = sFrameData_3bdbec;
                    else
                        gCurrentSprite.pOam = sFrameData_3bd8e4;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.pose = 0x1a;
                }
            }
            break;
        }
        case 0x1a: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd874;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (gCurrentSprite.pOam == sFrameData_3bd8e4)
                    NightmarePartSpawnBeam();
                if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                    gCurrentSprite.pOam = sFrameData_3bd874;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.work1 = gBossWork2;
                    gCurrentSprite.pose = 0x18;
                }
            }
            break;
        }
        case 0x1c: {
            NightmarePartDying(gCurrentSprite.primarySpriteRamSlot);
            if (gSpriteData[primaryRamSlot].pose == 0x22) {
                SpriteSpawnSecondary(SSPRITE_NIGHTMARE_FALLING_ARM, 1, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
            }
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
    }
}

void NightmarePartRightTurret2(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        case 2: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.work1 = 104;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd884;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (--gCurrentSprite.work1 == 0) {
                    if (gSpriteData[primaryRamSlot].pose == 2)
                        gCurrentSprite.pOam = sFrameData_3bdc64;
                    else if (gSpriteData[primaryRamSlot].pose == 0x1c)
                        gCurrentSprite.pOam = sFrameData_3bdc64;
                    else
                        gCurrentSprite.pOam = sFrameData_3bd95c;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.pose = 0x1a;
                }
            }
            break;
        }
        case 0x1a: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd884;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (gCurrentSprite.pOam == sFrameData_3bd95c)
                    NightmarePartSpawnBeam();
                if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                    gCurrentSprite.pOam = sFrameData_3bd884;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.work1 = gBossWork2;
                    gCurrentSprite.pose = 0x18;
                }
            }
            break;
        }
        case 0x1c: {
            NightmarePartDying(gCurrentSprite.primarySpriteRamSlot);
            if (gSpriteData[primaryRamSlot].pose == 0x22) {
                SpriteSpawnSecondary(SSPRITE_NIGHTMARE_FALLING_ARM, 2, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
            }
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
    }
}

void NightmarePartRightTurret3(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        case 2: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.work1 = 100;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd894;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (--gCurrentSprite.work1 == 0) {
                    if (gSpriteData[primaryRamSlot].pose == 0x1c)
                        gCurrentSprite.pOam = sFrameData_3bdcdc;
                    else
                        gCurrentSprite.pOam = sFrameData_3bd9d4;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.pose = 0x1a;
                }
            }
            break;
        }
        case 0x1a: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd894;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (gCurrentSprite.pOam == sFrameData_3bd9d4)
                    NightmarePartSpawnBeam();
                if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                    gCurrentSprite.pOam = sFrameData_3bd894;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gBossWork2 = gBossWork3;
                    gCurrentSprite.work1 = gBossWork3;
                    gCurrentSprite.pose = 0x18;
                }
            }
            break;
        }
        case 0x1c: {
            NightmarePartDying(gCurrentSprite.primarySpriteRamSlot);
            if (gSpriteData[primaryRamSlot].pose == 0x22) {
                SpriteSpawnSecondary(SSPRITE_NIGHTMARE_FALLING_ARM, 3, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
            }
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
    }
}

void NightmarePartLeftTurret1(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        case 2: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.work1 = 120;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd8b4;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (--gCurrentSprite.work1 == 0) {
                    if (gSpriteData[primaryRamSlot].pose == 2)
                        gCurrentSprite.pOam = sFrameData_3bdd54;
                    else if (gSpriteData[primaryRamSlot].pose == 0x1c)
                        gCurrentSprite.pOam = sFrameData_3bdd54;
                    else
                        gCurrentSprite.pOam = sFrameData_3bda4c;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.pose = 0x1a;
                }
            }
            break;
        }
        case 0x1a: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd8b4;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (gCurrentSprite.pOam == sFrameData_3bda4c)
                    NightmarePartSpawnBeam();
                if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                    gCurrentSprite.pOam = sFrameData_3bd8b4;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.work1 = gBossWork2;
                    gCurrentSprite.pose = 0x18;
                }
            }
            break;
        }
        case 0x1c: {
            NightmarePartDying(gCurrentSprite.primarySpriteRamSlot);
            if (gSpriteData[primaryRamSlot].pose == 0x22) {
                SpriteSpawnSecondary(SSPRITE_NIGHTMARE_FALLING_ARM, 5, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
            }
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
    }
}

void NightmarePartLeftTurret2(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        case 2: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.work1 = 116;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd8c4;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (--gCurrentSprite.work1 == 0) {
                    if (gSpriteData[primaryRamSlot].pose == 2)
                        gCurrentSprite.pOam = sFrameData_3bddcc;
                    else if (gSpriteData[primaryRamSlot].pose == 0x1c)
                        gCurrentSprite.pOam = sFrameData_3bddcc;
                    else
                        gCurrentSprite.pOam = sFrameData_3bdac4;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.pose = 0x1a;
                }
            }
            break;
        }
        case 0x1a: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd8c4;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (gCurrentSprite.pOam == sFrameData_3bdac4)
                    NightmarePartSpawnBeam();
                if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                    gCurrentSprite.pOam = sFrameData_3bd8c4;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.work1 = gBossWork2;
                    gCurrentSprite.pose = 0x18;
                }
            }
            break;
        }
        case 0x1c: {
            NightmarePartDying(gCurrentSprite.primarySpriteRamSlot);
            if (gSpriteData[primaryRamSlot].pose == 0x22) {
                SpriteSpawnSecondary(SSPRITE_NIGHTMARE_FALLING_ARM, 6, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
            }
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
    }
}

void NightmarePartLeftTurret3(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        case 2: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.work1 = 112;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd8d4;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (--gCurrentSprite.work1 == 0) {
                    if (gSpriteData[primaryRamSlot].pose == 0x1c)
                        gCurrentSprite.pOam = sFrameData_3bde44;
                    else
                        gCurrentSprite.pOam = sFrameData_3bdb3c;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.pose = 0x1a;
                }
            }
            break;
        }
        case 0x1a: {
            if (gSpriteData[primaryRamSlot].pose == 0x20) {
                gCurrentSprite.pOam = sFrameData_3bd8d4;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1c;
                NightmarePartDying(primaryRamSlot);
            } else {
                if (gCurrentSprite.pOam == sFrameData_3bdb3c)
                    NightmarePartSpawnBeam();
                if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                    gCurrentSprite.pOam = sFrameData_3bd8d4;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.work1 = gBossWork2;
                    gCurrentSprite.pose = 0x18;
                }
            }
            break;
        }
        case 0x1c: {
            NightmarePartDying(gCurrentSprite.primarySpriteRamSlot);
            if (gSpriteData[primaryRamSlot].pose == 0x22) {
                SpriteSpawnSecondary(SSPRITE_NIGHTMARE_FALLING_ARM, 7, 0, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
            }
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
    }
}

void NightmarePartEye(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    u8 mouthRamSlot = gCurrentSprite.numberOfXToForm;
    u16 maxHealth = gSpriteData[primaryRamSlot].health;
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 16)
        SoundPlayNotAlreadyPlaying(0x2a7);
    else if (SPRITE_HAS_ISFT(gCurrentSprite) == 5)
        SoundPlayNotAlreadyPlaying(0x2aa);
    switch (gCurrentSprite.pose) {
        case 2: {
            if (gSpriteData[primaryRamSlot].pose == 0x1a) {
                gCurrentSprite.status &= ~SS_HIDDEN;
                gCurrentSprite.pOam = sNightmarePartEyeOam_NotDrooping;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x18;
                gCurrentSprite.health = maxHealth;
                gSubSpriteData1.health = maxHealth;
                ParticleSet(gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition - 0x50, PE_0x3A);
                unk_3b1c(0x2a9);
            }
            break;
        }
        case 0x18: {
            gSpriteData[mouthRamSlot].paletteRow = gCurrentSprite.paletteRow;
            gSubSpriteData1.health = gCurrentSprite.health;
            if (gSubSpriteData1.health < maxHealth * 2 / 3) {
                gCurrentSprite.pose = 0x1a;
                gCurrentSprite.pOam = sNightmarePartEyeAndMouthOam_DroopALittle;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gSpriteData[mouthRamSlot].status |= SS_NOT_DRAWN;
                SoundPlay(0x2ad);
            }
            break;
        }
        case 0x1a: {
            gSpriteData[mouthRamSlot].paletteRow = gCurrentSprite.paletteRow;
            gSubSpriteData1.health = gCurrentSprite.health;
            if (gCurrentSprite.currentAnimationFrame != 0)
                gCurrentSprite.frozenPaletteRowOffset = 1;
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.pose = 0x1c;
                gCurrentSprite.pOam = sNightmarePartEyeOam_DroopingALittle;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gSpriteData[mouthRamSlot].pOam = sNightmarePartMouthOam_DroopingALittle;
                gSpriteData[mouthRamSlot].animationDurationCounter = 0;
                gSpriteData[mouthRamSlot].currentAnimationFrame = 0;
                gSpriteData[mouthRamSlot].status &= ~SS_NOT_DRAWN;
                gSpriteData[mouthRamSlot].frozenPaletteRowOffset = 1;
            }
            break;
        }
        case 0x1c: {
            gSpriteData[mouthRamSlot].paletteRow = gCurrentSprite.paletteRow;
            gSubSpriteData1.health = gCurrentSprite.health;
            if (gSubSpriteData1.health < maxHealth / 3) {
                gCurrentSprite.pose = 0x1e;
                gCurrentSprite.pOam = sNightmarePartEyeAndMouthOam_DroopMore;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gSpriteData[mouthRamSlot].status |= SS_NOT_DRAWN;
                SoundPlay(0x2ad);
            }
            break;
        }
        case 0x1e: {
            gSpriteData[mouthRamSlot].paletteRow = gCurrentSprite.paletteRow;
            gSubSpriteData1.health = gCurrentSprite.health;
            if (gCurrentSprite.currentAnimationFrame != 0)
                gCurrentSprite.frozenPaletteRowOffset = 2;
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.pose = 0x20;
                gCurrentSprite.pOam = sNightmarePartEyeOam_DroopingMore;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gSpriteData[mouthRamSlot].pOam = sNightmarePartMouthOam_DroopingMore;
                gSpriteData[mouthRamSlot].animationDurationCounter = 0;
                gSpriteData[mouthRamSlot].currentAnimationFrame = 0;
                gSpriteData[mouthRamSlot].status &= ~SS_NOT_DRAWN;
                gSpriteData[mouthRamSlot].frozenPaletteRowOffset = 2;
            }
            break;
        }
        case 0x20: {
            gSpriteData[mouthRamSlot].paletteRow = gCurrentSprite.paletteRow;
            gSubSpriteData1.health = gCurrentSprite.health;
            if (gCurrentSprite.health == 0) {
                gCurrentSprite.pose = 0x22;
                gCurrentSprite.work1 = 0;
                gCurrentSprite.invincibilityStunFlashTimer = 0;
                gSpriteData[primaryRamSlot].pose = 0x20;
                gSpriteData[primaryRamSlot].status |= SS_IGNORE_PROJECTILES;
                gSpriteData[primaryRamSlot].samusCollision = SSC_NONE;
                gSpriteData[primaryRamSlot].work1 = 80;
                gSpriteData[primaryRamSlot].work2 = 0;
            }
            break;
        }
        case 0x22: {
            u8 work1 = gCurrentSprite.work1++;
            if ((work1 & 3) == 0) {
                if ((work1 & 4) != 0)
                    gCurrentSprite.paletteRow = 13 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
                else
                    gCurrentSprite.paletteRow = 0;
            }
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC) {
                gCurrentSprite.paletteRow = 0;
                gCurrentSprite.pose = 0x24;
                gCurrentSprite.status |= SS_ENABLE_MOSAIC;
            }
            gSpriteData[mouthRamSlot].paletteRow = gCurrentSprite.paletteRow;
            break;
        }
        default: {
            if (gSpriteData[primaryRamSlot].spriteId == 0x48)
                gCurrentSprite.status = 0;
            break;
        }
    }
}

void NightmarePartMouth(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gCurrentSprite.pose) {
        default:
            if (gSpriteData[primaryRamSlot].spriteId == PSPRITE_GRAVITY_SUIT_ABILITY)
                gCurrentSprite.status = 0;
            break;
        case 2: {
            if (gSpriteData[primaryRamSlot].pose == 0x1a) {
                gCurrentSprite.status &= ~SS_HIDDEN;
                gCurrentSprite.pOam = sNightmarePartMouthOam_NotDrooping;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x18;
                gSpriteData[primaryRamSlot].pose = 0x1e;
            }
            break;
        }
        case 0x18: {
            if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 1) {
                SoundPlay(0x2ac);
            }
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC) {
                gCurrentSprite.paletteRow = 0;
                gCurrentSprite.pose = 0x24;
                gCurrentSprite.status |= SS_ENABLE_MOSAIC;
            }
            break;
        }
    }
}

void NightmarePartEyeSludge(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    u16 maxHealth = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    switch (gCurrentSprite.pose) {
        case 2: {
            if (gSubSpriteData1.health < maxHealth * 2 / 3) {
                gCurrentSprite.status &= ~SS_NOT_DRAWN;
                gCurrentSprite.pOam = sNightmarePartOam_EyeSludge;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x18;
                SoundPlay(0x2ab);
            }
            break;
        }
        case 0x18: {
            if (gSubSpriteData1.health < maxHealth / 3) {
                gCurrentSprite.pOam = sNightmarePartOam_EyeSludgeDroppingToChin;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work1 = 120;
                gCurrentSprite.pose = 0x1a;
                SoundPlay(0x2ab);
            }
            break;
        }
        case 0x1a: {
            if (gSubSpriteData1.health == 0) {
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work1 = 80;
                gCurrentSprite.pose = 0x1c;
                SoundPlay(0x2ab);
            } else {
                if (--gCurrentSprite.work1 == 0) {
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.work1 = 120;
                    SoundPlay(0x2ab);
                }
            }
            break;
        }
        case 0x1c: {
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work1 = 80;
                SoundPlay(0x2ab);
            }
            if (gSpriteData[primaryRamSlot].pose == 0x19) {
                gCurrentSprite.pose = 0x1e;
                gCurrentSprite.work1 = 80;
            }
            break;
        }
        case 0x1e: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x20;
            }
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
    }
}

void NightmarePartChinSludge(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    u16 maxHealth = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    switch (gCurrentSprite.pose) {
        case 2: {
            if (gSubSpriteData1.health < maxHealth / 3) {
                gCurrentSprite.work1 = 120;
                gCurrentSprite.pose = 0x18;
            }
            break;
        }
        case 0x18: {
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.status = gCurrentSprite.status & ~SS_NOT_DRAWN;
                gCurrentSprite.pOam = sNightmarePartOam_ChinSludge;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x1a;
                gCurrentSprite.work1 = 100;
            }
            break;
        }
        case 0x1a: {
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work1 = 100;
            }
            if (gSpriteData[primaryRamSlot].pose == 0x19) {
                gCurrentSprite.pose = 0x1c;
                gCurrentSprite.work1 = 80;
            }
            break;
        }
        case 0x1c: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.status |= SS_HIDDEN;
                gCurrentSprite.pose = 0x1e;
                gSpriteData[primaryRamSlot].pose = 0x1a;
            }
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC)
                gCurrentSprite.status = 0;
            break;
    }
}

void NightmarePartGeneratorUpdateGlowingPalette(void) {
    if ((gCurrentSprite.work1 & 7) == 0) {
        gCurrentSprite.paletteRow = sNightmareGeneratorGlowingPaletteRow[gCurrentSprite.work2 & 7];
        gCurrentSprite.work2 += 1;
    }
    gCurrentSprite.work1++;
}

void NightmarePartGeneratorUpdateDyingPalette(void) {
    u8 work1 = gCurrentSprite.work1++;
    if ((work1 & 3) == 0) {
        if ((work1 & 4) != 0)
            gCurrentSprite.paletteRow = 13 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
        else
            gCurrentSprite.paletteRow = 0;
    }
}

void NightmarePartGenerator(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 16)
        SoundPlayNotAlreadyPlaying(0x2a7);
    else if (SPRITE_HAS_ISFT(gCurrentSprite) == 5)
        SoundPlayNotAlreadyPlaying(0x2aa);
    switch(gCurrentSprite.pose) {
        case 1: {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
            if (gSpriteData[primaryRamSlot].pose == 0x3a) {
                gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
                gCurrentSprite.pose = 2;
            }
            break;
        }
        case 2: {
            u16 maxHealth;

            NightmarePartGeneratorUpdateGlowingPalette();
            gSubSpriteData1.health = gCurrentSprite.health;
            maxHealth = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
            if (gSubSpriteData1.health < maxHealth * 4 / 5) {
                gCurrentSprite.pose = 0x18;
                gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningReallySlow;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work0 = 0;
                gSamusPhysics.slowed = 0x80;
                gSpriteData[primaryRamSlot].pose = 0x3b;
                gBossWork3 = 60;
                SoundPlay(0x2a5);
            }
            break;
        }
        case 0x18: {
            NightmareMakeMissilesFall();
            NightmarePartGeneratorUpdateGlowingPalette();
            gSubSpriteData1.health = gCurrentSprite.health;
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                if (gCurrentSprite.work0 == 0)
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningSlow;
                else if (gCurrentSprite.work0 == 1)
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningALittleSlower;
                else if (gCurrentSprite.work0 == 2)
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningALittleFaster;
                else if (gCurrentSprite.work0 != 3) {
                    gCurrentSprite.pose = 0x1a;
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningReallyFast;
                    break;
                } else
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningFast;
                gCurrentSprite.work0++;
            }
            break;
        }
        case 0x1a: {
            NightmareMakeMissilesFall();
            NightmarePartGeneratorUpdateGlowingPalette();
            gSubSpriteData1.health = gCurrentSprite.health;
            if (gSubSpriteData1.health == 0) {
                gCurrentSprite.pose = 0x1c;
                gCurrentSprite.work1 = 0;
                gCurrentSprite.work0 = 0;
                gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningFast;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                ApplyMusicSoundFading(sMusicTrackDataRom[sSoundDataEntries[0x2a5].trackGroundNumber].pTrack, 120);
            }
            break;
        }
        case 0x1c: {
            NightmareMakeMissilesFall();
            NightmarePartGeneratorUpdateDyingPalette();
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                if (gCurrentSprite.work0 == 0)
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningALittleFaster;
                else if (gCurrentSprite.work0 == 1)
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningALittleSlower;
                else if (gCurrentSprite.work0 == 2)
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningSlow;
                else if (gCurrentSprite.work0 != 3) {
                    gCurrentSprite.pose = 0x1e;
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_Stationary;
                    gCurrentSprite.work0 = 60;
                    gCurrentSprite.samusCollision = SSC_NONE;
                    gSpriteData[primaryRamSlot].pose = 0x17;
                    gSamusPhysics.slowed = 0;
                    gBossWork3 = 100;
                    break;
                } else
                    gCurrentSprite.pOam = sNightmarePartGeneratorOam_SpinningReallySlow;
                gCurrentSprite.work0++;
            }
            break;
        }
        case 0x1e: {
            NightmarePartGeneratorUpdateDyingPalette();
            if (gSpriteData[primaryRamSlot].pose == 0x19)
                gCurrentSprite.pose = 0x20;
            break;
        }
        case 0x20: {
            gCurrentSprite.work0--;
            if (gCurrentSprite.work0 < 30) {
                gCurrentSprite.status ^= SS_NOT_DRAWN;
                if (gCurrentSprite.work0 == 0) {
                    gCurrentSprite.status |= SS_HIDDEN;
                    gCurrentSprite.pose = 0x22;
                    ParticleSet(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition + 0x50, PE_0x30);
                }
            } else if (gCurrentSprite.work0 == 30) {
                ParticleSet(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition + 0x40, PE_0x3A);
                gCurrentSprite.paletteRow = 0;
                unk_3b1c(0x2a8);
            } else
                NightmarePartGeneratorUpdateDyingPalette();
            break;
        }
        default:
            if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC) {
                gCurrentSprite.status = 0;
            }
            break;
    }
    if (gSamusPhysics.slowed == 0x80)
        NightmareReduceSamusXVelocity();
}

void NightmareBeamInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -8;
    gCurrentSprite.hitboxBottom = 8;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.pOam = sNightmareBeamOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
    gCurrentSprite.frozenPaletteRowOffset = 2;
    SoundPlay(0x2a2);
}

void NightmareBeamMoving(void) {
    gCurrentSprite.xPosition -= 0x14;
}

void NightmareFallingArmInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawOrder = 1;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.health = 0;
    switch (gCurrentSprite.roomSlot) {
        case 0:
            gCurrentSprite.pOam = sFrameData_3bd864;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x10;
            gCurrentSprite.work3 = 2;
            gCurrentSprite.work1 = 10;
            break;
        case 1:
            gCurrentSprite.pOam = sFrameData_3bd874;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work3 = 3;
            gCurrentSprite.work1 = 8;
            break;
        case 2:
            gCurrentSprite.pOam = sFrameData_3bd884;
            gCurrentSprite.drawDistanceTop = 0x20;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work3 = 4;
            gCurrentSprite.work1 = 6;
            break;
        case 3:
            gCurrentSprite.pOam = sFrameData_3bd894;
            gCurrentSprite.drawDistanceTop = 0x1c;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x20;
            gCurrentSprite.work3 = 5;
            gCurrentSprite.work1 = 4;
            break;
        case 4:
            gCurrentSprite.pOam = sFrameData_3bd8a4;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work3 = 6;
            gCurrentSprite.work1 = 2;
            break;
        case 5:
            gCurrentSprite.pOam = sFrameData_3bd8b4;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work3 = 3;
            gCurrentSprite.work1 = 8;
            break;
        case 6:
            gCurrentSprite.pOam = sFrameData_3bd8c4;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work3 = 4;
            gCurrentSprite.work1 = 6;
            break;
        case 7:
            gCurrentSprite.pOam = sFrameData_3bd8d4;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 10;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work3 = 5;
            gCurrentSprite.work1 = 4;
            break;
        default:
            gCurrentSprite.status = 0;
            break;
    }
}

void NightmareFallingArmMoving(void) {
    if (gCurrentSprite.work1 > 0) {
        if (--gCurrentSprite.work1 == 0) {
            if (gCurrentSprite.roomSlot == 0 || gCurrentSprite.roomSlot == 5)
                ParticleSet(gCurrentSprite.yPosition - 0x50, gCurrentSprite.xPosition, PE_0x3A);
            else
                ParticleSet(gCurrentSprite.yPosition - 0x50, gCurrentSprite.xPosition, PE_0x22);
        }
    } else {
        u8 offset = gCurrentSprite.work4;
        s16 movement = sSpritesFallingSpeedFast[offset];
        if (movement == SHORT_MAX) {
            movement = sSpritesFallingSpeedFast[offset - 1];
            gCurrentSprite.yPosition += movement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += movement;
        }
        if (gCurrentSprite.roomSlot < 5)
            gCurrentSprite.xPosition += gCurrentSprite.work3;
        else
            gCurrentSprite.xPosition -= gCurrentSprite.work3;
    }
}

void Nightmare(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            NightmareInit();
            break;
        case 0x37:
            NightmareWaitingToAppear();
            break;
        case 0x38:
            NightmareAppearing();
            break;
        case 0x39:
            NightmarePhase1Init();
        case 0x3a:
            NightmarePhase1();
            break;
        case 0x3b:
            NightmarePhase2ResettingPosition();
            break;
        case 1:
            NightmarePhase2MovementInit();
            break;
        case 2:
            NightmarePhase2Movement();
            break;
        case 0x17:
            NightmareMovingToPhase3Init();
        case 0x18:
            NightmareMovingToPhase3();
            break;
        case 0x19:
            NightmareReachedPhase3Position();
            break;
        case 0x1a:
            NightmarePhase3SlowMovementInit();
            break;
        case 0x1b:
            NightmarePhase3FastMovementInit();
        case 0x1c:
            NightmarePhase3FastMovement();
            break;
        case 0x1e:
            NightmarePhase3SlowMovement();
            break;
        case 0x20:
            NightmareMovingToDeathPosition();
            break;
        case 0x22:
            NightmareTurningIntoCoreX();
            break;
    }
    NightmarePlaySound();
    SpriteUtilUpdateSubSpriteData1Animation();
    NightmareSyncSubSprites();
}

void NightmarePart(void) {
    if (gCurrentSprite.pose == 0) {
        NightmarePartInit();
        return;
    }
    switch (gCurrentSprite.roomSlot) {
        case NIGHTMARE_PART_GENERATOR:
            NightmarePartGenerator();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_EYE_SLUDGE:
            NightmarePartEyeSludge();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_CHIN_SLUDGE:
            NightmarePartChinSludge();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_EYE:
            NightmarePartEye();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_MOUTH:
            NightmarePartMouth();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_RIGHT_TURRET_1:
            NightmarePartRightTurret1();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_RIGHT_TURRET_2:
            NightmarePartRightTurret2();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_RIGHT_TURRET_3:
            NightmarePartRightTurret3();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_LEFT_TURRET_1:
            NightmarePartLeftTurret1();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_LEFT_TURRET_2:
            NightmarePartLeftTurret2();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_LEFT_TURRET_3:
            NightmarePartLeftTurret3();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        case NIGHTMARE_PART_RIGHT_ARM_TOP:
            NightmarePartRightArmTop();
            NightmareSyncSubSprites();
            break;
        case NIGHTMARE_PART_RIGHT_ARM_BOTTOM:
            NightmarePartRightArmBottom();
            NightmareSyncSubSprites();
            break;
    }
}

void NightmareBeam(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            NightmareBeamInit();
            break;
        case 2:
            NightmareBeamMoving();
            break;
    }
}

void NightmareFallingArm(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case 0:
            NightmareFallingArmInit();
            break;
        case 2:
            NightmareFallingArmMoving();
            break;
    }
}
