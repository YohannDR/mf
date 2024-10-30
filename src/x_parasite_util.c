#include "x_parasite_util.h"
#include "globals.h"
#include "macros.h"

#include "data/sprite_data.h"
#include "data/sprites/x_parasite.h"

#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/power_bomb.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u32 unk_61004(void) {
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
        if (gSpriteData[i].status & SS_EXISTS) {
            if (gSpriteData[i].pose >= SPRITE_POSE_TURNING_INTO_X && gSpriteData[i].pose <= SPRITE_POSE_TURNING_INTO_X + 2)
                return TRUE;
            if (gSpriteData[i].pose <= SPRITE_POSE_SPAWNING_FROM_X)
                if (gSpriteData[i].spritesetSlotAndProperties >= 0x20 && gSpriteData[i].spritesetSlotAndProperties < 0x50)
                    if (!(gSpriteData[i].properties & SP_CAN_ABSORB_X))
                        return TRUE;
        }
    }
    return FALSE;
}

u8 CountPrimarySpritesThatCantAbsorbX(void) {
    u8 count = 0;
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
        if (gSpriteData[i].status & SS_EXISTS) {
            if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X || gSpriteData[i].pose > SPRITE_POSE_TURNING_INTO_X + 2) {
                if (gSpriteData[i].pose <= SPRITE_POSE_SPAWNING_FROM_X)
                    if (gSpriteData[i].spritesetSlotAndProperties >= 0x20 && gSpriteData[i].spritesetSlotAndProperties < 0x50)
                        if (!(gSpriteData[i].properties & (SP_SECONDARY_SPRITE | SP_CAN_ABSORB_X)))
                            count++;
            } else {
                count++;
            }
        }
    }
    return count;
}

void XParasiteMove(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor) {
    u8 flip;
    u16 velocity;

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        // Move right
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > dstX - PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                gCurrentSprite.xPosition += (gCurrentSprite.work3 >> speedDivisor);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += (gCurrentSprite.work2 >> speedDivisor);
            else
                flip = TRUE;
        }
    }
    else
    {
        // Move left
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < dstX + PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                velocity = gCurrentSprite.work3 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
        if (++gCurrentSprite.unk_8 >= 4) gCurrentSprite.unk_8 = 0;
        SoundPlayNotAlreadyPlaying(0x141);
        if (gCurrentSprite.drawOrder == 1)
            gCurrentSprite.drawOrder = 16;
        else
            gCurrentSprite.drawOrder = 1;
    }

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_DOWN)
    {
        // Move down
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > dstY - PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                gCurrentSprite.yPosition += (gCurrentSprite.work4 >> speedDivisor);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += (gCurrentSprite.work1 >> speedDivisor);
            else
                flip = TRUE;
        }
    }
    else
    {
        // Move up
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < dstY + PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                velocity = gCurrentSprite.work4 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_DOWN;
        gCurrentSprite.work4 = 1;
        SoundPlayNotAlreadyPlaying(0x141);
    }
}

void XParasiteMoveWithSound(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor, u16 sound) {
    u8 flip;
    u16 velocity;

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        // Move right
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > dstX - PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                gCurrentSprite.xPosition += (gCurrentSprite.work3 >> speedDivisor);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += (gCurrentSprite.work2 >> speedDivisor);
            else
                flip = TRUE;
        }
    }
    else
    {
        // Move left
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < dstX + PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                velocity = gCurrentSprite.work3 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
        SoundPlayNotAlreadyPlaying(sound);
    }

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_DOWN)
    {
        // Move down
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > dstY - PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                gCurrentSprite.yPosition += (gCurrentSprite.work4 >> speedDivisor);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += (gCurrentSprite.work1 >> speedDivisor);
            else
                flip = TRUE;
        }
    }
    else
    {
        // Move up
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < dstY + PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                velocity = gCurrentSprite.work4 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_DOWN;
        gCurrentSprite.work4 = 1;
        SoundPlayNotAlreadyPlaying(sound);
    }
}

void SamusAbsorbX(void) {
    u16 energy, missiles, powerBombs;
    u8 tmp = gCurrentSprite.spritesetSlotAndProperties; // Needed to produce matching ASM.

    switch (tmp & 0xf0) {
        case 0x20:
            if (gCurrentSprite.samusCollision == SSC_RED_X_PARASITE) {
                energy = 500;
                missiles = 100;
                powerBombs = 10;
                ParticleSet(gSamusData.yPosition + gSamusData.drawDistanceTop / 2, gSamusData.xPosition, 0x1c);
            } else if (gCurrentSprite.samusCollision == SSC_GREEN_X_PARASITE) {
                energy = 0;
                missiles = 2;
                powerBombs = 0;
                ParticleSet(gSamusData.yPosition + gSamusData.drawDistanceTop / 2, gSamusData.xPosition, 0x1b);
            } else {
                energy = 10;
                missiles = 0;
                powerBombs = 0;
                ParticleSet(gSamusData.yPosition + gSamusData.drawDistanceTop / 2, gSamusData.xPosition, 0x1a);
            }
            SpriteUtilRefillSamus(energy, missiles, powerBombs);
            gSamusEnvironmentalEffects[0].externalTimer = 48;
            SoundPlay(0x92);
        case 0x30:
        case 0x40:
        default:
    }
}

void XParasiteGettingAbsorbedInit(void) {
    gCurrentSprite.pose = 0x5e;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
    gCurrentSprite.rotation = 0;
    gCurrentSprite.scaling = Q_8_8(1);
    gCurrentSprite.xParasiteTimer = 20;
    SamusAbsorbX();
}

void SpriteDyingInit(void) {
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.pose = SPRITE_POSE_DYING;
    gCurrentSprite.work1 = 44;
    SoundPlayNotAlreadyPlaying(0x142);
}

void SpriteDying(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.paletteRow != 0)
        gCurrentSprite.paletteRow = 0;
    if ((gCurrentSprite.work1 & 1) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.work1 == 0) {
        if (gCurrentSprite.properties & SP_SECONDARY_SPRITE) {
            gCurrentSprite.status = 0;
        } else {
            gCurrentSprite.pose = 0x5b;
            gCurrentSprite.spritesetGfxSlot = 0;
            gCurrentSprite.status |= SS_NOT_DRAWN;
        }
    }
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
}

void XParasiteSpawningInit(void) {
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.xParasiteTimer = 22;
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.pose = 0x5c;
    gCurrentSprite.work3 = (u32)(gSpriteRandomNumber << 0x1a) >> 0x18;
    gCurrentSprite.work4 = gCurrentSprite.work3;
}

void XParasiteDetermineType(u8 unk, u8 spriteId) {
    u16 randomNumber;
    u16 yellowXThreshold;
    u16 greenXThreshold;
    u16 redXThreshold;

    switch (gCurrentSprite.spritesetSlotAndProperties & 0xf0) {
        case 0x20: {
            if (unk == 2) {
                if (gSpriteRandomNumber < 5 || CheckEnergyFullAndMissilesNotFull()) {
                    gCurrentSprite.pOam = sXParasiteOam_Green;
                    gCurrentSprite.samusCollision = SSC_GREEN_X_PARASITE;
                    break;
                } else {
                    gCurrentSprite.pOam = sXParasiteOam_Yellow;
                    gCurrentSprite.samusCollision = SSC_YELLOW_X_PARASITE_SPAWN_ON_ROOM_LOAD;
                    break;
                }
            } else if (unk == 1) {
                randomNumber = (gSpriteRandomNumber & 3);
                randomNumber <<= 8;
                randomNumber |= gFrameCounter8Bit;
                randomNumber++;
                yellowXThreshold = sPrimarySpriteStats[spriteId][4];
                greenXThreshold = sPrimarySpriteStats[spriteId][5];
                redXThreshold = sPrimarySpriteStats[spriteId][6];
                if (redXThreshold > 0) {
                    redXThreshold = 1024 - redXThreshold;
                    if (randomNumber <= 1024 && randomNumber > redXThreshold) {
                        gCurrentSprite.pOam = sXParasiteOam_Red;
                        gCurrentSprite.samusCollision = SSC_RED_X_PARASITE;
                        break;
                    }
                } else {
                    redXThreshold = 1024;
                }
                if (greenXThreshold > 0) {
                    greenXThreshold = redXThreshold - greenXThreshold;
                    if (redXThreshold >= randomNumber && randomNumber > greenXThreshold) {
                        if (CheckMissilesFullAndEnergyNotFull()) {
                            gCurrentSprite.pOam = sXParasiteOam_Yellow;
                            gCurrentSprite.samusCollision = SSC_YELLOW_X_PARASITE_SPAWN_ON_ROOM_LOAD;
                            break;
                        } else {
                            gCurrentSprite.pOam = sXParasiteOam_Green;
                            gCurrentSprite.samusCollision = SSC_GREEN_X_PARASITE;
                            break;
                        }
                    }
                } else {
                    greenXThreshold = redXThreshold;
                }
                if (yellowXThreshold > 0 && greenXThreshold >= randomNumber && randomNumber > 0) {
                    if (CheckEnergyFullAndMissilesNotFull()) {
                        gCurrentSprite.pOam = sXParasiteOam_Green;
                        gCurrentSprite.samusCollision = SSC_GREEN_X_PARASITE;
                        break;
                    } else {
                        gCurrentSprite.pOam = sXParasiteOam_Yellow;
                        gCurrentSprite.samusCollision = SSC_YELLOW_X_PARASITE_SPAWN_ON_ROOM_LOAD;
                        break;
                    }
                } else {
                    gCurrentSprite.status = 0;
                }
            } else {
                gCurrentSprite.pOam = sXParasiteOam_Yellow;
                gCurrentSprite.samusCollision = SSC_YELLOW_X_PARASITE_SPAWN_ON_ROOM_LOAD;
            }
            break;
        }
        case 0x30: {
            gCurrentSprite.invincibilityStunFlashTimer &= 0x7f;
            gCurrentSprite.pOam = sXParasiteOam_Yellow;
            gCurrentSprite.samusCollision = SSC_YELLOW_X_PARASITE_SPAWN_ON_ROOM_LOAD;
            break;
        }
        case 0x40: {
            gCurrentSprite.pOam = sXParasiteOam_Yellow;
            gCurrentSprite.samusCollision = SSC_YELLOW_X_PARASITE;
            break;
        }
        default:
            gCurrentSprite.status = 0;
    }
}

void XParasiteInit(void) {
    if (gCurrentSprite.properties & SP_SECONDARY_SPRITE) {
        gCurrentSprite.status = 0;
        return;
    }
    switch (gCurrentSprite.spriteId) {
        case PSPRITE_X_PARASITE_CORE_X_FORMATION: {
            gCurrentSprite.pose = 0x5c;
            gCurrentSprite.work3 = 1;
            gCurrentSprite.work4 = 1;
            XParasiteDetermineType(0, 0);
            if ((gSpriteRandomNumber & 1) != 0)
                gCurrentSprite.drawOrder = 1;
            else
                gCurrentSprite.drawOrder = 16;
            break;
        }
        case PSPRITE_X_PARASITE_IN_ROOM:
        case PSPRITE_X_PARASITE_IN_ROOM_PROXIMITY: {
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.pose = 0x5c;
            gCurrentSprite.work3 = 1;
            gCurrentSprite.work4 = 1;
            XParasiteDetermineType(0, 0);
            break;
        }
        case PSPRITE_X_PARASITE_CORE_X_OR_PARASITE: {
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
            gCurrentSprite.status |= SS_ENABLE_MOSAIC;
            gCurrentSprite.xParasiteTimer = 44;
            gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
            gCurrentSprite.pose = 0x5c;
            gCurrentSprite.unk_8 = 0;
            gCurrentSprite.work2 = 0;
            gCurrentSprite.work3 = 1;
            gCurrentSprite.work1 = 0;
            gCurrentSprite.work4 = 1;
            XParasiteDetermineType(2, 0);
            if ((gSpriteRandomNumber & 1) != 0)
                gCurrentSprite.drawOrder = 1;
            else
                gCurrentSprite.drawOrder = 16;
            break;
        }
        case PSPRITE_X_PARASITE:
        case PSPRITE_X_PARASITE_AQUA_ZEBESIAN: {
            XParasiteSpawningInit();
            XParasiteDetermineType(1, gCurrentSprite.roomSlot);
            break;
        }
        default: {
            XParasiteSpawningInit();
            XParasiteDetermineType(1, gCurrentSprite.spriteId);
            gCurrentSprite.spriteId = PSPRITE_X_PARASITE;
            break;
        }
    }
    gCurrentSprite.invincibilityStunFlashTimer = 0;
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.properties &= ~SP_CAN_ABSORB_X;
    gCurrentSprite.status &= ~SS_SAMUS_COLLIDING;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x24;
    gCurrentSprite.hitboxBottom = 0x24;
    gCurrentSprite.hitboxLeft = -0x24;
    gCurrentSprite.hitboxRight = 0x24;
    gCurrentSprite.health = 1;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.frozenPaletteRowOffset = 0;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work2 = 0;
    if (gCurrentSprite.yPosition > gSamusData.yPosition + gSamusData.drawDistanceTop)
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    else
        gCurrentSprite.status |= SS_FACING_DOWN;
    SpriteUtilMakeSpriteFaceSamusDirection();
}

void XParasiteFlyingInit(void) {
    gCurrentSprite.pose = 0x5d;
    gCurrentSprite.xParasiteTimer = 5 * 60;
    gCurrentSprite.unk_8 = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    if (gCurrentSprite.spriteId != PSPRITE_X_PARASITE)
        gCurrentSprite.spriteId = PSPRITE_X_PARASITE;
}

void XParasiteIdleFloating(void) {
    if ((gCurrentSprite.invincibilityStunFlashTimer & 0x80) == 0) {
        u8 offset;
        s16 movement;
    
        offset = gCurrentSprite.work4;
        movement = sXParasiteIdleFloatingYMovement[offset];
        if (movement == SHORT_MAX) {
            movement = sXParasiteIdleFloatingYMovement[0];
            offset = 0;
        }
        offset++;
        gCurrentSprite.work4 = offset;
        gCurrentSprite.yPosition += movement;
    
        offset = gCurrentSprite.work3;
        movement = sXParasiteIdleFloatingXMovement[offset];
        if (movement == SHORT_MAX) {
            movement = sXParasiteIdleFloatingXMovement[0];
            offset = 0;
        }
        offset++;
        gCurrentSprite.work3 = offset;
        gCurrentSprite.xPosition += movement;
    }
    if (gCurrentSprite.status & SS_ENABLE_MOSAIC) {
        if (--gCurrentSprite.xParasiteTimer > 0) {
            gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
            if ((gCurrentSprite.spritesetSlotAndProperties & 0xf0) == 0x30 || gCurrentSprite.xParasiteTimer > 22)
                gCurrentSprite.ignoreSamusCollisionTimer = 1;
            else if (gCurrentSprite.status & SS_SAMUS_COLLIDING) {
                if (gCurrentSprite.spriteId != PSPRITE_X_PARASITE)
                    gCurrentSprite.spriteId = PSPRITE_X_PARASITE;
                XParasiteGettingAbsorbedInit();
            }
        } else {
            gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
            if ((gCurrentSprite.spritesetSlotAndProperties & 0xf0) == 0x30) {
                gCurrentSprite.ignoreSamusCollisionTimer = 1;
                XParasiteFlyingInit();
            } else {
                gCurrentSprite.xParasiteTimer = 60;
            }
        }
    } else {
        if (--gCurrentSprite.xParasiteTimer == 0)
            XParasiteFlyingInit();
        if (gCurrentSprite.status & SS_SAMUS_COLLIDING)
            XParasiteGettingAbsorbedInit();
    }
}

void XParasiteFlying(void) {
    if ((gCurrentSprite.spritesetSlotAndProperties & 0xf0) == 0x30) {
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        if ((gFrameCounter8Bit & 7) == 0) {
            if (gCurrentSprite.paletteRow == 0) {
                if (gCurrentSprite.samusCollision == SSC_RED_X_PARASITE)
                    gCurrentSprite.paletteRow = 3;
                else if (gCurrentSprite.samusCollision == SSC_GREEN_X_PARASITE)
                    gCurrentSprite.paletteRow = 2;
                else
                    gCurrentSprite.paletteRow = 1;
            } else {
                gCurrentSprite.paletteRow = 0;
            }
        }
        if (gCurrentSprite.xParasiteTimer == 0) {
            gCurrentSprite.paletteRow = 0;
            gCurrentSprite.pose = 0x61;
        } else {
            gCurrentSprite.xParasiteTimer--;
            if (XParasiteFlyingMovement() == 0) {
                gCurrentSprite.spritesetSlotAndProperties = 0x20;
                gCurrentSprite.paletteRow = 0;
            }
        }
    } else {
        if (gCurrentSprite.status & SS_SAMUS_COLLIDING) {
            XParasiteGettingAbsorbedInit();
        } else if ((gCurrentSprite.invincibilityStunFlashTimer & 0x80) != 0) {
            if (gCurrentPowerBomb.animationState == 0)
                gCurrentSprite.invincibilityStunFlashTimer &= 0x7f;
        } else if (gCurrentSprite.xParasiteTimer == 0) {
            gCurrentSprite.pose = 0x61;
        } else {
            gCurrentSprite.xParasiteTimer--;
            XParasiteFlyingMovement();
        }
    }
}

void XParasiteGettingAbsorbed(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    XParasiteStickToSamus();
    if (gCurrentSprite.scaling > Q_8_8(5.f/16))
        gCurrentSprite.scaling -= Q_8_8(1.f/32);
    else
        gCurrentSprite.status = 0;
}

u8 XParasiteFlyingMovement(void) {
    u8 unk = 0;
    u16 y = gCurrentSprite.yPosition;
    u16 x = gCurrentSprite.xPosition;
    u8 i;
    u16 targetY, targetX;
    u16 distY, distX;
    u8 ySpeedCap, xSpeedCap;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
        if (gSpriteData[i].status & SS_EXISTS && gSpriteData[i].properties & SP_CAN_ABSORB_X
            && gSpriteData[i].health > 0 && gSpriteData[i].freezeTimer == 0) {
            targetY = gSpriteData[i].yPosition;
            targetX = gSpriteData[i].xPosition;

            // Calculate and store taxicab distance from X parasite to other sprite
            if (y > targetY)
                distY = y - targetY;
            else
                distY = targetY - y;
            if (x > targetX)
                distX = x - targetX;
            else
                distX = targetX - x;
            gUnk_030007c0[i] = distY + distX;
            unk = 1;
            if (gCurrentSprite.pose == 0x5d)
                gCurrentSprite.xParasiteTimer = 300;
            if (y + 8 > targetY + gSpriteData[i].hitboxTop && y - 8 < targetY + gSpriteData[i].hitboxBottom
                && x + 8 > targetX + gSpriteData[i].hitboxLeft && x - 8 < targetX + gSpriteData[i].hitboxRight) {
                if (--gSpriteData[i].work5 == 0) {
                    if (gSpriteData[i].spritesetSlotAndProperties >= 0x10 && gSpriteData[i].spritesetSlotAndProperties < 0x20)
                        gSpriteData[i].spritesetSlotAndProperties = 0x20;
                    gSpriteData[i].pose = 0x59;
                    gSpriteData[i].status |= (SS_IGNORE_PROJECTILES | SS_ENABLE_MOSAIC);
                    gSpriteData[i].status &= ~SS_HIDDEN;
                    gSpriteData[i].properties &= ~SP_CAN_ABSORB_X;
                    gCurrentSprite.xPosition = gSpriteData[i].xPosition;
                    gCurrentSprite.pose = 0x63;
                } else {
                    gCurrentSprite.pose = 0x65;
                    gCurrentSprite.work2 = i;
                    gCurrentSprite.xParasiteTimer = gSpriteData[i].yPosition;
                    gCurrentSprite.unk_8 = gSpriteData[i].xPosition;
                }
                unk = 2;
                gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
                break;
            }
        } else {
            gUnk_030007c0[i] = 0x8000;
        }
    }
    if (unk == 2) {
        return 2;
    } else if (unk == 0) {
        targetY = gXParasiteTargetYPosition;
        targetX = gXParasiteTargetXPosition;
        if (gCurrentSprite.pose == 0x5d) {
            switch (gCurrentSprite.unk_8) {
                case 1: {
                    targetY -= 0x40;
                    if (gCurrentSprite.status & SS_FACING_RIGHT)
                        targetX += 0x40;
                    else
                        targetX -= 0x40;
                    break;
                }
                case 3: {
                    targetY += 0x40;
                    if (gCurrentSprite.status & SS_FACING_RIGHT)
                        targetX -= 0x40;
                    else
                        targetX += 0x40;
                }
            }
        }
        ySpeedCap = 0x14, xSpeedCap = 0x1c, i = 1;
    } else {
        u8 targetRamSlot = 1;
        // Get nearest sprite by taxicab distance
        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
            if (gUnk_030007c0[targetRamSlot] > gUnk_030007c0[i])
                targetRamSlot = i;
        }
        targetY = gSpriteData[targetRamSlot].yPosition + gSpriteData[targetRamSlot].hitboxTop +
            (gSpriteData[targetRamSlot].hitboxBottom - gSpriteData[targetRamSlot].hitboxTop) / 2;
        targetX = gSpriteData[targetRamSlot].xPosition;
        ySpeedCap = 0x14, xSpeedCap = 0x14, i = 1;
    }
    XParasiteMove(targetY, targetX, ySpeedCap, xSpeedCap, i);
    return unk;
}

void XParasiteFlyingAway(void) {
    u32 movement;

    if (gCurrentSprite.status & SS_SAMUS_COLLIDING) {
        XParasiteGettingAbsorbedInit();
    } else if ((gCurrentSprite.invincibilityStunFlashTimer & 0x80) != 0) {
        if (gCurrentPowerBomb.animationState == 0)
            gCurrentSprite.invincibilityStunFlashTimer &= 0x7f;
    } else {
        if (gCurrentSprite.work3 < 0xc8)
            gCurrentSprite.work3 += 1;
        movement = gCurrentSprite.work3 >> 3;
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            gCurrentSprite.xPosition += movement;
        else
            gCurrentSprite.xPosition -= movement;
        if (gCurrentSprite.work4 < 0xc8)
            gCurrentSprite.work4 += 1;
        movement = gCurrentSprite.work4 >> 3;
        if (gCurrentSprite.status & SS_FACING_DOWN)
            gCurrentSprite.yPosition += movement;
        else
            gCurrentSprite.yPosition -= movement;
        if (!(gCurrentSprite.status & SS_ON_SCREEN))
            gCurrentSprite.status = 0;
    }
}

void unk_620ec(void) {
    gCurrentSprite.paletteRow = 0;
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.pose = 0x66;
    gCurrentSprite.work1 = 44;
    gCurrentSprite.scaling = Q_8_8(75.f/64);
    SoundPlayNotAlreadyPlaying(0x143);
}

void unk_6212c(void) {
    u8 targetRamSlot;
    u16 tmp;

    gCurrentSprite.scaling -= Q_8_8(1.f/256);
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    targetRamSlot = gCurrentSprite.work2;
    if (gSpriteData[targetRamSlot].work5 == 0) {
        gCurrentSprite.status = 0;
    } else if (unk_61004() == 0 || gCurrentSprite.scaling == 0) {
        gSpriteData[targetRamSlot].work5++;
        gCurrentSprite.pose = 0x61;
        gCurrentSprite.status &= ~(SS_ENABLE_MOSAIC | SS_NOT_DRAWN);
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
    } else {
        if ((gCurrentSprite.work1 & 1) == 0) {
            gCurrentSprite.status ^= SS_NOT_DRAWN;
        }
        if (--gCurrentSprite.work1 == 0)
            gCurrentSprite.work1 = 44;
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
        if (gSpriteData[targetRamSlot].yPosition > gCurrentSprite.xParasiteTimer) {
            tmp = gSpriteData[targetRamSlot].yPosition - gCurrentSprite.xParasiteTimer;
            gCurrentSprite.yPosition += tmp;
        } else {
            tmp = gCurrentSprite.xParasiteTimer - gSpriteData[targetRamSlot].yPosition;
            gCurrentSprite.yPosition -= tmp;
        }
        if (gSpriteData[targetRamSlot].xPosition > gCurrentSprite.unk_8) {
            tmp = gSpriteData[targetRamSlot].xPosition - gCurrentSprite.unk_8;
            gCurrentSprite.xPosition += tmp;
        } else {
            tmp = gCurrentSprite.unk_8 - gSpriteData[targetRamSlot].xPosition;
            gCurrentSprite.xPosition -= tmp;
        }
        gCurrentSprite.xParasiteTimer = gSpriteData[targetRamSlot].yPosition;
        gCurrentSprite.unk_8 = gSpriteData[targetRamSlot].xPosition;
    }
}

void unk_6224c(void) {
    gCurrentSprite.paletteRow = 0;
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.pose = 0x64;
    gCurrentSprite.xParasiteTimer = 44;
    SoundPlayNotAlreadyPlaying(0x143);
}

void unk_62288(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if ((gCurrentSprite.xParasiteTimer & 1) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.xParasiteTimer == 0)
        gCurrentSprite.status = 0;
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
}

void SpriteSpawningFromX(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.xParasiteTimer > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    } else {
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.pose = 1;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }
}

void unk_62328(void) {
    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        // Move right
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > gSamusData.xPosition - PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < 10)
                    gCurrentSprite.work3++;

                // Apply speed
                gCurrentSprite.xPosition += gCurrentSprite.work3;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += gCurrentSprite.work2 >> 1;
            else
            {    
                gCurrentSprite.status &= ~SS_FACING_RIGHT;
                gCurrentSprite.work3 = 1;
            }
        }
    }
    else
    {
        // Move left
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < gSamusData.xPosition + PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < 10)
                    gCurrentSprite.work3++;

                // Apply speed
                gCurrentSprite.xPosition -= gCurrentSprite.work3;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                gCurrentSprite.xPosition -= gCurrentSprite.work2 >> 1;
            }
            else
            {    
                gCurrentSprite.status |= SS_FACING_RIGHT;
                gCurrentSprite.work3 = 1;
            }
        }
    }

    if (gCurrentSprite.status & SS_FACING_DOWN)
    {
        // Move down
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > gSamusData.yPosition - (BLOCK_SIZE + PIXEL_SIZE * 3))
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < 10)
                    gCurrentSprite.work4++;

                // Apply speed
                gCurrentSprite.yPosition += gCurrentSprite.work4;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += gCurrentSprite.work1 >> 1;
            else
            {    
                gCurrentSprite.status &= ~SS_FACING_DOWN;
                gCurrentSprite.work4 = 1;
            }
        }
    }
    else
    {
        // Move up
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < gSamusData.yPosition - (BLOCK_SIZE + PIXEL_SIZE))
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < 10)
                    gCurrentSprite.work4++;

                // Apply speed
                gCurrentSprite.yPosition -= gCurrentSprite.work4;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                gCurrentSprite.yPosition -= gCurrentSprite.work1 >> 1;
            }
            else
            {    
                gCurrentSprite.status |= SS_FACING_DOWN;
                gCurrentSprite.work4 = 1;
            }
        }
    }
}

void XParasiteStickToSamus(void) {
    u16 currentPosition, targetPosition, distance, movement;

    currentPosition = gCurrentSprite.xPosition + 0x200;
    targetPosition = gSamusData.xPosition + 0x200;
    if (currentPosition > targetPosition)
        distance = currentPosition - targetPosition;
    else
        distance = targetPosition - currentPosition;
    if (distance <= 8)
        movement = 0;
    else
        movement = DIV_SHIFT(distance - 8, 2);
    if (currentPosition > targetPosition)
        gCurrentSprite.xPosition -= movement;
    else if (currentPosition < targetPosition)
        gCurrentSprite.xPosition += movement;

    currentPosition = gCurrentSprite.yPosition + 0x200;
    if (SpriteUtilCheckMorphed())
        targetPosition = gSamusData.yPosition + 0x1d0;
    else
        targetPosition = gSamusData.yPosition + 0x1b2;
    if (currentPosition > targetPosition)
        distance = currentPosition - targetPosition;
    else
        distance = targetPosition - currentPosition;
    if (distance <= 8)
        movement = 0;
    else
        movement = DIV_SHIFT(distance - 8, 2);
    if (currentPosition > targetPosition)
        gCurrentSprite.yPosition -= movement;
    else if (currentPosition < targetPosition)
        gCurrentSprite.yPosition += movement;
}
