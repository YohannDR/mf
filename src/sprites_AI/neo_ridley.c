#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "data/frame_data_pointers.h"
#include "data/sprite_data.h"
#include "data/sprites/core_x.h"
#include "data/sprites/neo_ridley.h"
#include "data/sprites/x_parasite.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/projectile.h"
#include "constants/samus.h"

#include "structs/projectile.h"
#include "structs/samus.h"

void RidleyMove(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor) {
    u8 flip;
    u16 velocity;
    u8 hittingSolidX = FALSE, hittingSolidY = FALSE;
    u16 xBoundary;

    if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED)
        xBoundary = 0x120;
    else
        xBoundary = 0xc8;

    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition + xBoundary);
        if (gPreviousCollisionCheck != 0) hittingSolidX++;
    } else {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition - xBoundary);
        if (gPreviousCollisionCheck != 0) hittingSolidX++;
    }

    if (gCurrentSprite.status & SS_FACING_DOWN) {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0xe0, gSubSpriteData1.xPosition);
        if (gPreviousCollisionCheck == 0) {
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0xa0, gSubSpriteData1.xPosition);
            if (gPreviousCollisionCheck != 0) hittingSolidY++;
        } else hittingSolidY++;
    } else {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition - 0x180, gSubSpriteData1.xPosition);
        if (gPreviousCollisionCheck != 0) hittingSolidY++;
    }

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        if (!hittingSolidX)
        {
            // Move right
            if (gCurrentSprite.work2 == 0)
            {
                if (gSubSpriteData1.xPosition > dstX + BLOCK_SIZE * 4)
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
        else flip = TRUE;
    }
    else
    {
        if (!hittingSolidX)
        {
            // Move left
            if (gCurrentSprite.work2 == 0)
            {
                if (gSubSpriteData1.xPosition < dstX - BLOCK_SIZE * 4)
                    gCurrentSprite.work2 = gCurrentSprite.work3;
                else
                {
                    // Increase speed if below cap
                    if (gCurrentSprite.work3 < xSpeedCap)
                        gCurrentSprite.work3++;

                    // Apply speed
                    gSubSpriteData1.xPosition -= gCurrentSprite.work3 >> speedDivisor;
                }
            }
            else
            {
                if (--gCurrentSprite.work2 != 0)
                    gSubSpriteData1.xPosition -= gCurrentSprite.work2 >> speedDivisor;
                else
                    flip = TRUE;
            }
        }
        else flip = TRUE;
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
        if (gCurrentSprite.samusCollision != SSC_RIDLEY_CLAW_GRABBED)
            gCurrentSprite.pose = 3;
    }

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_DOWN)
    {
        if (!hittingSolidY)
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
        else flip = TRUE;
    }
    else
    {
        if (!hittingSolidY)
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
                    gSubSpriteData1.yPosition -= gCurrentSprite.work4 >> speedDivisor;
                }
            }
            else
            {
                if (--gCurrentSprite.work1 != 0)
                    gSubSpriteData1.yPosition -= gCurrentSprite.work1 >> speedDivisor;
                else
                    flip = TRUE;
            }
        }
        else flip = TRUE;
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_DOWN;
        gCurrentSprite.work4 = 1;
    }
}

void UpdateSubSpriteData2Animation(void) {
    gSubSpriteData2.animationDurationCounter++;
    if (gSubSpriteData2.pMultiOam[gSubSpriteData2.currentAnimationFrame].timer < gSubSpriteData2.animationDurationCounter) {
        gSubSpriteData2.animationDurationCounter = 1;
        gSubSpriteData2.currentAnimationFrame += 1;
        if (gSubSpriteData2.pMultiOam[gSubSpriteData2.currentAnimationFrame].timer == 0) {
            gSubSpriteData2.currentAnimationFrame = 0;
        }
    }
}

void RidleySyncSubSpritesPosition(void) {
    MultiSpriteDataInfo_T pData;

    pData = gSubSpriteData2.pMultiOam[gSubSpriteData2.currentAnimationFrame].pData;
    gCurrentSprite.yPosition = gSubSpriteData2.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.xPosition = gSubSpriteData2.xPosition - pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
    } else {
        gCurrentSprite.xPosition = gSubSpriteData2.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
    }
}

void RidleySyncSubSprites(void) {
    MultiSpriteDataInfo_T pData;
    u16 oamIdx;

    pData = gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].pData;

    oamIdx = pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX];
    
    if (gCurrentSprite.pOam != sRidleyFrameDataPointers[oamIdx])
    {
        gCurrentSprite.pOam = sRidleyFrameDataPointers[oamIdx];
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }

    gCurrentSprite.yPosition = gSubSpriteData1.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];

    if (gCurrentSprite.status & SS_X_FLIP)
    {
        gCurrentSprite.xPosition = gSubSpriteData1.xPosition - pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
    }
    else
    {
        gCurrentSprite.xPosition = gSubSpriteData1.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
    }

    if (gCurrentSprite.roomSlot == 1)
    {
        gSubSpriteData2.yPosition = gCurrentSprite.yPosition;
        gSubSpriteData2.xPosition = gCurrentSprite.xPosition;
    }
}

void RidleyTailSyncSubSprites(void) {
    MultiSpriteDataInfo_T pData;
    u16 oamIdx;

    pData = gSubSpriteData2.pMultiOam[gSubSpriteData2.currentAnimationFrame].pData;

    oamIdx = pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX];
    
    if (gCurrentSprite.pOam != sRidleyFrameDataPointers[oamIdx])
    {
        gCurrentSprite.pOam = sRidleyFrameDataPointers[oamIdx];
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }

    gCurrentSprite.yPosition = gSubSpriteData2.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];

    if (gCurrentSprite.status & SS_X_FLIP)
    {
        gCurrentSprite.xPosition = gSubSpriteData2.xPosition - pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
    }
    else
    {
        gCurrentSprite.xPosition = gSubSpriteData2.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
    }
}

void RidleyUpdatePalette(void) {
    u32 update = FALSE;
    u16 health = gCurrentSprite.health;
    u16 maxHealth = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    u16* pPal;

    switch (gBossWork1) {
        case 0:
            if (health <= maxHealth * 2 / 3) {
                pPal = (u16*)sRidleyPal + 3 * 16;
                gBossWork1 = 1;
                update = TRUE;
            }
            break;
        case 1:
            if (health <= maxHealth / 3) {
                pPal = (u16*)sRidleyPal + 5 * 16;
                gBossWork1 = 2;
                update = TRUE;
            }
            break;
    }
    if (update)
        DMA_SET(3, pPal, PALRAM_OBJ + 8 * 32, C_32_2_16(DMA_ENABLE, 2 * 16));
}

void RidleySetBackgroundPriority(void) {
    u16 yPosOnScreen = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.yPosition) - SUB_PIXEL_TO_PIXEL_(gBg1YPosition);
    if (yPosOnScreen >= SCREEN_SIZE_Y + 0x1f && yPosOnScreen <= SCREEN_SIZE_Y + 0x3b)
        gCurrentSprite.bgPriority = 2;
    else
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
}

void RidleyUpdateClawOam(void) {
    if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED) {
        if (gSubSpriteData1.pMultiOam != sRidleyMultiSpriteData_3a9f74) {
            gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_3a9f74;
            gSubSpriteData1.animationDurationCounter = 0;
            gSubSpriteData1.currentAnimationFrame = 0;
        }
    } else {
        if (gSubSpriteData1.pMultiOam != sRidleyMultiSpriteData_3a9944) {
            gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_3a9944;
            gSubSpriteData1.animationDurationCounter = 0;
            gSubSpriteData1.currentAnimationFrame = 0;
            gCurrentSprite.samusCollision = SSC_RIDLEY_CLAW_CAN_GRAB;
        }
    }
}


void RidleyTailStrikingCheckPlayEffects(void) {
    if (gCurrentSprite.xParasiteTimer + 0x14 <= 0x53e && gCurrentSprite.yPosition + 0x14 > 0x53e) {
        ScreenShakeStartVertical(40, 0x81);
        SoundPlay(0x1e8);
    }
    // Update previous Y position
    gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
}

void RidleyTailStrikeYMovement(u16 movement) {
    if (gSamusData.yPosition >= gSubSpriteData1.yPosition)
        if (gSubSpriteData1.yPosition < 0x440 && gCurrentSprite.yPosition + 0x14 <= 0x53e)
            gSubSpriteData1.yPosition += movement;
}

void RidleyFloatingMovement(void) {
    u16 dstY, dstX;

    if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED) {
        dstY = gXParasiteTargetYPosition;
        dstX = gXParasiteTargetXPosition;
    } else {
        u8 frameCounter = gFrameCounter8Bit;
        if (gSamusData.yPosition >= 0x2c0 && (frameCounter & 0x40) == 0) {
            dstY = gSamusData.yPosition - 0x200;
            dstX = gSamusData.xPosition;
        } else {
            dstY = gSamusData.yPosition;
            dstX = gSamusData.xPosition;
        }
    }
    RidleyMove(dstY, dstX, 0x18, 0x18, 2);
}

void RidleyUpdateHealthThreshold(void) {
    if (gCurrentSprite.status & SS_IGNORE_PROJECTILES) return;

    if (SPRITE_HAS_ISFT(gCurrentSprite) == 16)
        SoundPlayNotAlreadyPlaying(0x1e1);

    if (gCurrentSprite.health == 0 && gSubSpriteData1.health > 0) {
        // Final hit, start to die
        gCurrentSprite.pose = 0x1f;
        gBossWork5 = 0;
    } else {
        // Accumulated health
        gBossWork5 += gSubSpriteData1.health - gCurrentSprite.health;

        if (gBossWork5 > 500) {
            // Scream and reset accumulated health if taken enough damage
            if (gCurrentSprite.pose != 0x18 && gCurrentSprite.pose != 0x1a)
                gCurrentSprite.pose = 0x1f;
            gBossWork5 = 0;
        } else {
            if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
                SoundPlayNotAlreadyPlaying(0x1df);
        }
    }

    // Update previous health
    gSubSpriteData1.health = gCurrentSprite.health;
}

void RidleyWaveBeamCollsiion(void) {
    u16 spriteY, spriteX;
    u16 spriteTop, spriteBottom, spriteLeft, spriteRight;
    u16 projY, projX;
    u16 projTop, projBottom, projLeft, projRight;
    u8 i;

    if (gCurrentSprite.status & SS_IGNORE_PROJECTILES || gCurrentSprite.health == 0) return;

    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;

    spriteTop = spriteY + gCurrentSprite.hitboxTop;
    spriteBottom = spriteY + gCurrentSprite.hitboxBottom;
    spriteLeft = spriteX + gCurrentSprite.hitboxLeft;
    spriteRight = spriteX + gCurrentSprite.hitboxRight;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++) {
        if (!(gProjectileData[i].status & PROJ_STATUS_EXISTS)) continue;
        if (!(gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT)) continue;
        if (gProjectileData[i].type != PROJ_TYPE_WAVE_BEAM) continue;

        projY = gProjectileData[i].yPosition;
        projX = gProjectileData[i].xPosition;

        projTop = projY + gProjectileData[i].hitboxTop;
        projBottom = projY + gProjectileData[i].hitboxBottom;
        projLeft = projX + gProjectileData[i].hitboxLeft;
        projRight = projX + gProjectileData[i].hitboxRight;

        if (SpriteUtilCheckObjectsTouching(projTop, projBottom, projLeft, projRight, spriteTop, spriteBottom, spriteLeft, spriteRight)) {
            ParticleSet(projY, projX, PE_INVINCIBLE_HIT);
            gProjectileData[i].status = 0;
        }
    }
}

u32 RidleyCheckGrabSamusLeft(u16 yPosition, u16 xPosition) {
    u16 clawY, clawX;

    clawY = yPosition + 0xb4;
    if (gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_3a9a2c || gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_3a9a44)
        clawX = xPosition - 0x82;
    else
        clawX = xPosition - 0xe6;

    SpriteUtilCheckCollisionAtPosition(clawY, clawX + gSamusData.drawDistanceLeft);
    if (gPreviousCollisionCheck != COLLISION_AIR) return FALSE;
    SpriteUtilCheckCollisionAtPosition(clawY, clawX + gSamusData.drawDistanceRight);
    if (gPreviousCollisionCheck != COLLISION_AIR) return FALSE;

    return TRUE;
}

u32 RidleyCheckGrabSamusRight(u16 yPosition, u16 xPosition) {
    u16 clawY, clawX;

    clawY = yPosition + 0xb4;
    if (gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_3a9a2c || gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_3a9a44)
        clawX = xPosition + 0x82;
    else
        clawX = xPosition + 0xe6;

    SpriteUtilCheckCollisionAtPosition(clawY, clawX + gSamusData.drawDistanceLeft);
    if (gPreviousCollisionCheck != COLLISION_AIR) return FALSE;
    SpriteUtilCheckCollisionAtPosition(clawY, clawX + gSamusData.drawDistanceRight);
    if (gPreviousCollisionCheck != COLLISION_AIR) return FALSE;

    return TRUE;
}

void RidleySamusGrabbed(void) {
    if (gCurrentSprite.status & SS_SAMUS_COLLIDING) {
        gCurrentSprite.status &= ~SS_SAMUS_COLLIDING;
        gSamusData.yPosition = gCurrentSprite.yPosition + 0xb4;
        if (gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_3a9a2c || gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_3a9a44) {
            if (gCurrentSprite.status & SS_X_FLIP)
                gSamusData.xPosition = gCurrentSprite.xPosition + 0x82;
            else
                gSamusData.xPosition = gCurrentSprite.xPosition - 0x82;
        } else {
            if (gCurrentSprite.status & SS_X_FLIP)
                gSamusData.xPosition = gCurrentSprite.xPosition + 0xe6;
            else
                gSamusData.xPosition = gCurrentSprite.xPosition - 0xe6;
        }
    } else {
        if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED)
            gCurrentSprite.samusCollision = SSC_RIDLEY_CLAW_CAN_GRAB;
    }
}

void RidleySetSideHitboxes(void) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x80;
        gCurrentSprite.hitboxRight = 0xe0;
    } else {
        gCurrentSprite.hitboxLeft = -0xe0;
        gCurrentSprite.hitboxRight = 0x80;
    }
}

u8 RidleyXMovement_Unused(u16 movement) {
    u8 collided = FALSE;
    u16 xBoundary;

    if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED)
        xBoundary = 0x120;
    else
        xBoundary = 0xa0;

    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0x40, gSubSpriteData1.xPosition + xBoundary);
        if (gPreviousCollisionCheck != COLLISION_AIR)
            collided = TRUE;
        else
            gSubSpriteData1.xPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0x40, gSubSpriteData1.xPosition - xBoundary);
        if (gPreviousCollisionCheck != COLLISION_AIR)
            collided = TRUE;
        else
            gSubSpriteData1.xPosition -= movement;
    }

    return collided;
}

u8 RidleyTailXMovement(u16 movement) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    u8 collided = FALSE;

    if (gSpriteData[primaryRamSlot].status & SS_FACING_RIGHT) {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0x40, gSubSpriteData1.xPosition + 0xa0);
        if (gPreviousCollisionCheck != COLLISION_AIR)
            collided = TRUE;
        else
            gSubSpriteData1.xPosition += movement;
    } else {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition + 0x40, gSubSpriteData1.xPosition - 0xa0);
        if (gPreviousCollisionCheck != COLLISION_AIR)
            collided = TRUE;
        else
            gSubSpriteData1.xPosition -= movement;
    }

    if (collided)
        gSpriteData[primaryRamSlot].status ^= SS_FACING_RIGHT;

    return collided;
}
