#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "data/frame_data_pointers.h"
#include "data/samus_data.h"
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

#define RIDLEY_POSE_SCREAMING_AFTER_SPAWN 0x18
#define RIDLEY_POSE_RISING_AFTER_SPAWN 0x1a
#define RIDLEY_POSE_SCREAMING_INIT 0x1f
#define RIDLEY_POSE_SCREAMING 0x20
#define RIDLEY_POSE_TURNING_INTO_CORE_X 0x38
#define RIDLEY_POSE_FLYING_BACKWARDS_INIT 9
#define RIDLEY_POSE_FLYING_BACKWARDS 0xa
#define RIDLEY_POSE_TURNING_AROUND_INIT 3
#define RIDLEY_POSE_TURNING_AROUND_1 4
#define RIDLEY_POSE_TURNING_AROUND_2 5
#define RIDLEY_POSE_PREPARING_TAIL_ATTACK 0x29
#define RIDLEY_POSE_TAIL_ATTACK 0x2a
#define RIDLEY_POSE_SHOOTING_FIRE_INIT 0x2f
#define RIDLEY_POSE_SHOOTING_FIRE 0x30

#define RIDLEY_TAIL_POSE_WAITING_TO_WIND_UP 0x38
#define RIDLEY_TAIL_POSE_WINDING_UP_1 0x3a
#define RIDLEY_TAIL_POSE_WINDING_UP_2 0x3c
#define RIDLEY_TAIL_POSE_STRIKING_DOWN_1 0x3e
#define RIDLEY_TAIL_POSE_STRIKING_DOWN_2 0x40
#define RIDLEY_TAIL_POSE_STRIKING_DOWN_3 0x42
#define RIDLEY_TAIL_POSE_STRIKING_FORWARD 0x44
#define RIDLEY_TAIL_POSE_END_STRIKING 0x46

#define RIDLEY_FIRE_POSE_MOVING_TOWARD_SAMUS 0x18

#define RIDLEY_SCREAM_HEALTH_THRESHOLD 500

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
            gCurrentSprite.pose = RIDLEY_POSE_TURNING_AROUND_INIT;
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

void SpriteUtilUpdateSubSpriteData2Animation(void) {
    gSubSpriteData2.animationDurationCounter++;
    if (gSubSpriteData2.pMultiOam[gSubSpriteData2.currentAnimationFrame].timer < gSubSpriteData2.animationDurationCounter) {
        gSubSpriteData2.animationDurationCounter = 1;
        gSubSpriteData2.currentAnimationFrame += 1;
        if (gSubSpriteData2.pMultiOam[gSubSpriteData2.currentAnimationFrame].timer == 0) {
            gSubSpriteData2.currentAnimationFrame = 0;
        }
    }
}

void RidleyTailSyncSubSpritesPosition(void) {
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

    if (gCurrentSprite.roomSlot == RIDLEY_PART_TAIL_START)
    {
        // Sync tail's position
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
        if (gSubSpriteData1.pMultiOam != sRidleyMultiSpriteData_GrabbingSamus) {
            gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_GrabbingSamus;
            gSubSpriteData1.animationDurationCounter = 0;
            gSubSpriteData1.currentAnimationFrame = 0;
        }
    } else {
        if (gSubSpriteData1.pMultiOam != sRidleyMultiSpriteData_Idle) {
            gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_Idle;
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
        gCurrentSprite.pose = RIDLEY_POSE_SCREAMING_INIT;
        gBossWork5 = 0;
    } else {
        // Accumulated health
        gBossWork5 += gSubSpriteData1.health - gCurrentSprite.health;

        if (gBossWork5 > RIDLEY_SCREAM_HEALTH_THRESHOLD) {
            // Scream and reset accumulated health if taken enough damage
            if (gCurrentSprite.pose != RIDLEY_POSE_SCREAMING_AFTER_SPAWN && gCurrentSprite.pose != RIDLEY_POSE_RISING_AFTER_SPAWN)
                gCurrentSprite.pose = RIDLEY_POSE_SCREAMING_INIT;
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
    if (gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_TurningAround1 || gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_TurningAround2)
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
    if (gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_TurningAround1 || gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_TurningAround2)
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
        if (gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_TurningAround1 || gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_TurningAround2) {
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

void RidleyScreamingInit(void) {
    gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_ScreamingInPain;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = RIDLEY_POSE_SCREAMING;
    if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED)
        // Drop Samus
        SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
    if (gCurrentSprite.health > 0) {
        // Not dying
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.rotation = 60;
        SoundPlay(0x1de);
    } else {
        // Dying
        gCurrentSprite.samusCollision = 0;
        gCurrentSprite.rotation = 3 * 60;
        SoundPlay_3b1c(0x1e0);
    }
}

void RidleyScreaming(void) {
    u16 y, x;

    if (--gCurrentSprite.rotation == 0) {
        if (gCurrentSprite.health > 0) {
            RidleyUpdateClawOam();
            gCurrentSprite.pose = RIDLEY_POSE_PREPARING_TAIL_ATTACK;
        } else {
            // Start reverting to core-X
            gCurrentSprite.pose = RIDLEY_POSE_TURNING_INTO_CORE_X;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.status |= SS_ENABLE_MOSAIC;
            gCurrentSprite.invincibilityStunFlashTimer = 0;
            gCurrentSprite.paletteRow = 0;
            gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
            gCurrentSprite.status &= ~SS_NOT_DRAWN;
        }
        return;
    }

    if (gCurrentSprite.health > 0) {
        if (gCurrentSprite.rotation < 30)
            RidleyFloatingMovement();
        return;
    }

    // Death explosions
    y = gSubSpriteData1.yPosition;
    x = gSubSpriteData1.xPosition;

    switch (gCurrentSprite.rotation) {
        case 144:
            ParticleSet(y - 0x40, x - 0x10, PE_0x2F);
            ParticleSet(y + 0x20, x - 0x1a, PE_0x25);
            break;
        case 128:
            ParticleSet(y - 0x20, x + 0x1c, PE_0x25);
            ParticleSet(y + 0x40, x + 0x34, PE_0x22);
            break;
        case 112:
            ParticleSet(y - 0x20, x - 0x24, PE_0x21);
            ParticleSet(y + 0x40, x - 0x4c, PE_0x25);
            break;
        case 96:
            ParticleSet(y - 0x40, x + 0x58, PE_0x25);
            ParticleSet(y + 0x20, x + 0x20, PE_0x2F);
            break;
        case 80:
            ParticleSet(y - 0x48, x + 0x2a, PE_0x2F);
            ParticleSet(y, x - 0x1e, PE_0x21);
            break;
        case 64:
            ParticleSet(y - 0x40, x + 0x10, PE_0x2F);
            ParticleSet(y + 0x40, x - 0x34, PE_0x22);
            break;
        case 48:
            ParticleSet(y - 0x20, x - 0x1c, PE_0x21);
            ParticleSet(y + 0x46, x, PE_0x22);
            break;
        case 32:
            ParticleSet(y - 0x20, x + 0x24, PE_0x21);
            ParticleSet(y + 0x40, x - 0x58, PE_0x2F);
            break;
        case 16:
            ParticleSet(y + 0x30, x + 0x4c, PE_0x2F);
            ParticleSet(y - 0x40, x, PE_0x2F);
            break;
        case 0:
            // BUG: unused because of returning after starting to revert to core-X
            ParticleSet(y - 0x48, x - 0x2a, PE_0x2F);
            ParticleSet(y, x + 0x1e, PE_0x21);
            break;
    }
}

void RidleyTurningIntoCoreX(void) {
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    if (--gCurrentSprite.xParasiteTimer == 0) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
        gCurrentSprite.spriteId = PSPRITE_SCREW_ATTACK_ABILITY;
    }
    if (gCurrentSprite.xParasiteTimer < sizeof(sScrewAttackCoreXGfx) / 512)
        SpriteLoadGfx(PSPRITE_SCREW_ATTACK_ABILITY, 0, gCurrentSprite.xParasiteTimer);
    else if (gCurrentSprite.xParasiteTimer == sizeof(sScrewAttackCoreXGfx) / 512)
        SpriteLoadPal(PSPRITE_SCREW_ATTACK_ABILITY, 0, ARRAY_SIZE(sScrewAttackCoreXPal) / 16);
}

void RidleyForming(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gSubSpriteData1.animationDurationCounter--; // Freeze animation

    if (--gCurrentSprite.work1 > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    } else {
        gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_ENABLE_MOSAIC);
        gCurrentSprite.pose = RIDLEY_POSE_SCREAMING_AFTER_SPAWN;
        gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_ScreamingAfterSpawn;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
    }
}

void RidleyScreamingAfterSpawn(void) {
    if (gCurrentSprite.currentAnimationFrame == 4 && gCurrentSprite.animationDurationCounter == 1)
        SoundPlay(0x1dd);
    if (SpriteUtilCheckEndSubSprite1Anim()) {
        gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_RisingAfterSpawn;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        gCurrentSprite.pose = RIDLEY_POSE_RISING_AFTER_SPAWN;
        gCurrentSprite.work4 = 0;
        gSubSpriteData1.yPosition -= 0xe0;
        gCurrentSprite.yPosition -= 0xe0;
        gCurrentSprite.drawDistanceTop = 0x38;
        gCurrentSprite.drawDistanceBottom = 0x40;
        gCurrentSprite.hitboxTop = -0x60;
        gCurrentSprite.hitboxBottom = 0xa0;
    }
}

void RidleyRisingAfterSpawn(void) {
    if (gSubSpriteData1.yPosition >= 0x280) {
        u8 offset = gCurrentSprite.work4;
        s16 movement = sRidleyRisingAfterSpawnSpeed[offset];
        if (movement == SHORT_MAX) {
            movement = sRidleyRisingAfterSpawnSpeed[offset - 1];
            gSubSpriteData1.yPosition += movement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gSubSpriteData1.yPosition += movement;
        }
    } else if (SpriteUtilCheckEndSubSprite1Anim()) {
        RidleyUpdateClawOam();
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gCurrentSprite.work2 = 0;
        gCurrentSprite.work3 = 1;
        gCurrentSprite.work1 = 0;
        gCurrentSprite.work4 = 1;
        gCurrentSprite.rotation = (gSpriteRandomNumber + 1) * 16 - 1;
    }
}

void RidleyInit(void) {
    gBossWork1 = 0;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES | SS_FACING_RIGHT | SS_X_FLIP;
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawDistanceTop = 0x58;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x50;
    gCurrentSprite.hitboxTop = -0x140;
    gCurrentSprite.hitboxBottom = 0x10;
    RidleySetSideHitboxes();
    gCurrentSprite.roomSlot = RIDLEY_PART_BODY;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gSubSpriteData1.health = gCurrentSprite.health;
    gBossWork5 = 0;
    gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
    gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gSubSpriteData1.yPosition = gCurrentSprite.yPosition;
    gSubSpriteData1.xPosition = gCurrentSprite.xPosition;
    gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_ScreamingAfterSpawn;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gSubSpriteData1.work0 = 0;

    SpriteSpawnSecondary(SSPRITE_RIDLEY_PART, RIDLEY_PART_FRONT_WING, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_PART, RIDLEY_PART_TAIL_START, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_TAIL_PART, RIDLEY_TAIL_PART_TIP, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_TAIL_PART, RIDLEY_TAIL_PART_6, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_TAIL_PART, RIDLEY_TAIL_PART_5, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_TAIL_PART, RIDLEY_TAIL_PART_4, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_TAIL_PART, RIDLEY_TAIL_PART_3, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_TAIL_PART, RIDLEY_TAIL_PART_2, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_TAIL_PART, RIDLEY_TAIL_PART_1, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_TAIL_PART, RIDLEY_TAIL_PART_0, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_RIDLEY_PART, RIDLEY_PART_BACK_WING, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
}

void RidleyIdleInit(void) {
    RidleyUpdateClawOam();
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.rotation = (gSpriteRandomNumber + 1) * 16 - 1;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    if (gCurrentSprite.samusCollision != SSC_RIDLEY_CLAW_GRABBED)
        gCurrentSprite.samusCollision = SSC_RIDLEY_CLAW_CAN_GRAB;
}

void RidleyIdle(void) {
    u16 targetX;

    RidleyUpdateClawOam();
    RidleyFloatingMovement();
    if (gCurrentSprite.rotation == 0) {
        if (gCurrentSprite.samusCollision != SSC_RIDLEY_CLAW_GRABBED) {
            if (SpriteUtilCountSecondarySprites(SSPRITE_RIDLEY_FIRE) == 0) {
                gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
                gCurrentSprite.pose = RIDLEY_POSE_SHOOTING_FIRE_INIT;
                return;
            }
        }
    } else {
        gCurrentSprite.rotation--;
    }

    if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED)
        targetX = gXParasiteTargetXPosition;
    else
        targetX = gSamusData.xPosition;

    if (gCurrentSprite.status & SS_X_FLIP) {
        if (gCurrentSprite.status & SS_FACING_RIGHT) {
            if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED) return;
            if (gSamusData.yPosition <= gSubSpriteData1.yPosition + 0x80) return;
            targetX = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition);
            if (targetX >= 0x64) return;
            if (gSpriteRandomNumber != 0) return;
            if (SpriteUtilCountSecondarySprites(SSPRITE_RIDLEY_FIRE) == 0) {
                gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
                gCurrentSprite.pose = RIDLEY_POSE_SHOOTING_FIRE_INIT;
            }
        } else {
            if (targetX < gSubSpriteData1.xPosition)
                gCurrentSprite.pose = RIDLEY_POSE_FLYING_BACKWARDS_INIT;
        }
    } else {
        if (gCurrentSprite.status & SS_FACING_RIGHT) {
            if (targetX > gSubSpriteData1.xPosition)
                gCurrentSprite.pose = RIDLEY_POSE_FLYING_BACKWARDS_INIT;
        } else {
            if (gCurrentSprite.samusCollision == SSC_RIDLEY_CLAW_GRABBED) return;
            if (gSamusData.yPosition <= gSubSpriteData1.yPosition + 0x80) return;
            targetX = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition);
            if (targetX <= 0x8c) return;
            if (gSpriteRandomNumber != 0) return;
            if (SpriteUtilCountSecondarySprites(SSPRITE_RIDLEY_FIRE) == 0) {
                gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
                gCurrentSprite.pose = RIDLEY_POSE_SHOOTING_FIRE_INIT;
            }
        }
    }
}

void RidleyTurningAroundInit(void) {
    gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_TurningAround1;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = RIDLEY_POSE_TURNING_AROUND_1;
}

void RidleyTurningAround(void) {
    RidleyFloatingMovement();
    if (SpriteUtilCheckEndSubSprite1Anim()) {
        gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_TurningAround2;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        gCurrentSprite.pose = RIDLEY_POSE_TURNING_AROUND_2;
        gCurrentSprite.status ^= SS_X_FLIP;
        RidleySetSideHitboxes();
    }
}

void RidleyTurningAroundSecondPart(void) {
    RidleyUpdateClawOam();
    RidleyFloatingMovement();
    if (SpriteUtilCheckEndSubSprite1Anim()) {
        RidleyUpdateClawOam();
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
    }
}

void RidleyFlyingBackwardsInit(void) {
    gCurrentSprite.pose = RIDLEY_POSE_FLYING_BACKWARDS;
    gCurrentSprite.rotation = 10;
}

void RidleyFlyingBackwards(void) {
    RidleyUpdateClawOam();
    RidleyFloatingMovement();
    if (--gCurrentSprite.rotation == 0)
        gCurrentSprite.pose = RIDLEY_POSE_TURNING_AROUND_INIT;
}

void RidleyPreparingTailAttack(void) {
    RidleyUpdateClawOam();
}

void RidleyTailAttack(void) {
    RidleyUpdateClawOam();
}

void RidleyShootingFireInit(void) {
    gSubSpriteData1.pMultiOam = sRidleyMultiSpriteData_ShootingFire;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = RIDLEY_POSE_SHOOTING_FIRE;
}

void RidleyShootingFire(void) {
    u16 fireDir, fireX, fireY;

    RidleyFloatingMovement();
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (gSamusData.xPosition < gSubSpriteData1.xPosition)
                gCurrentSprite.pose = RIDLEY_POSE_TURNING_AROUND_INIT;
            else
                gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        } else {
            if (gSamusData.xPosition > gSubSpriteData1.xPosition)
                gCurrentSprite.pose = RIDLEY_POSE_TURNING_AROUND_INIT;
            else
                gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        }
        return;
    }

    if (gCurrentSprite.status & SS_X_FLIP) {
        fireDir = SS_FACING_RIGHT;
        fireX = gCurrentSprite.xPosition + 0xa0;
    } else {
        fireDir = 0;
        fireX = gCurrentSprite.xPosition - 0xa0;
    }
    fireY = gCurrentSprite.yPosition - 0x20;

    if (gSubSpriteData1.animationDurationCounter == 1) {
        if (gSubSpriteData1.currentAnimationFrame == 3) {
            SpriteSpawnSecondary(SSPRITE_RIDLEY_FIRE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, fireY, fireX, fireDir);
            SoundPlay(0x1e3);
        } else if (gSubSpriteData1.currentAnimationFrame == 7) {
            SpriteSpawnSecondary(SSPRITE_RIDLEY_FIRE, 2, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, fireY, fireX, fireDir);
        } else if (gSubSpriteData1.currentAnimationFrame == 11) {
            SpriteSpawnSecondary(SSPRITE_RIDLEY_FIRE, 4, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, fireY, fireX, fireDir);
        }
    }
}

void RidleyPartInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    switch (gCurrentSprite.roomSlot) {
        case RIDLEY_PART_FRONT_WING:
            gCurrentSprite.drawOrder = 3;
            gCurrentSprite.drawDistanceTop = 0x40;
            gCurrentSprite.drawDistanceBottom = 0x40;
            gCurrentSprite.drawDistanceHorizontal = 0x40;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.samusCollision = SSC_NONE;
            break;
        case RIDLEY_PART_TAIL_START:
            gCurrentSprite.drawDistanceTop = 1;
            gCurrentSprite.drawDistanceBottom = 1;
            gCurrentSprite.drawDistanceHorizontal = 1;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_HIDDEN;
            break;
        case RIDLEY_PART_BACK_WING:
            gCurrentSprite.drawOrder = 6;
            gCurrentSprite.drawDistanceTop = 0x40;
            gCurrentSprite.drawDistanceBottom = 0x40;
            gCurrentSprite.drawDistanceHorizontal = 0x20;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.samusCollision = SSC_NONE;
            break;
        default:
            gCurrentSprite.status = 0;
    }
    RidleySyncSubSprites();
}

void RidleyPartIdle(void) {
    // Check for palette index of first OAM entry
    u16 part2 = gCurrentSprite.pOam[gCurrentSprite.currentAnimationFrame].pFrame[OAM_DATA_SIZE(0) + 2];
    if ((part2 & OBJ_PALETTE_MASK) == OBJ_PALETTE_8) {
        gCurrentSprite.frozenPaletteRowOffset = 0;
        gCurrentSprite.drawDistanceTop = 0x40;
        gCurrentSprite.drawDistanceBottom = 0;
    } else {
        gCurrentSprite.frozenPaletteRowOffset = 1;
        gCurrentSprite.drawDistanceTop = 8;
        gCurrentSprite.drawDistanceBottom = 0x38;
    }
}

void RidleyTailPartInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.properties |= SS_X_FLIP;
    gCurrentSprite.health = 1;
    gCurrentSprite.drawOrder = gCurrentSprite.roomSlot + 4;
    gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
    if (gCurrentSprite.roomSlot == RIDLEY_TAIL_PART_TIP) {
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_Idle;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
        gCurrentSprite.status |= SS_ROTATE_SCALE_WHOLE;
        gCurrentSprite.scaling = Q_8_8(1);
        gCurrentSprite.rotation = 0;
        gCurrentSprite.xParasiteTimer = 0;
        gCurrentSprite.hitboxTop = -0x1c;
        gCurrentSprite.hitboxBottom = 0x1c;
        gCurrentSprite.hitboxLeft = -0x1c;
        gCurrentSprite.hitboxRight = 0x1c;
    } else {
        gCurrentSprite.hitboxTop = -0x14;
        gCurrentSprite.hitboxBottom = 0x14;
        gCurrentSprite.hitboxLeft = -0x14;
        gCurrentSprite.hitboxRight = 0x14;
    }
}

void RidleyTailPartTipHandleRotation(void) {
    if (gCurrentSprite.status & SS_FACING_DOWN) {
        if (gCurrentSprite.rotation == Q_8_8(7.f/8))
            gCurrentSprite.status &= ~SS_FACING_DOWN;
        else
            gCurrentSprite.rotation -= Q_8_8(1.f/256);
    } else {
        if (gCurrentSprite.rotation == Q_8_8(1.f/8))
            gCurrentSprite.status |= SS_FACING_DOWN;
        else
            gCurrentSprite.rotation += Q_8_8(1.f/256);
    }
}

void RidleyTailPartIdle(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    RidleyTailPartTipHandleRotation();
    if (gSubSpriteData1.pMultiOam != sRidleyMultiSpriteData_ScreamingInPain && gSubSpriteData2.pMultiOam == sRidleyTailMultiSpriteData_RidleyInPain) {
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_Idle;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
    }
    if (gSpriteData[primaryRamSlot].pose == RIDLEY_POSE_PREPARING_TAIL_ATTACK) {
        gCurrentSprite.pose = RIDLEY_TAIL_POSE_WAITING_TO_WIND_UP;
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_WaitingToWindUp;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
        gCurrentSprite.rotation = 0;
    }
}

void RidleyTailPartWaitingToWindUp(void) {
    if (SpriteUtilCheckEndSubSpriteData2Anim()) {
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_WindingUp1;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
        gCurrentSprite.pose = RIDLEY_TAIL_POSE_WINDING_UP_1;
    }
}

void RidleyTailPartWindingUp1(void) {
    if (gSubSpriteData2.currentAnimationFrame == 3 && gSubSpriteData2.animationDurationCounter == 1)
        SoundPlay(0x1e5);
    if (SpriteUtilCheckEndSubSpriteData2Anim()) {
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_WindingUp2;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
        gCurrentSprite.pose = RIDLEY_TAIL_POSE_WINDING_UP_2;
        gCurrentSprite.work1 = (gSpriteRandomNumber / 2) + 2;
    }
    if (gSubSpriteData1.yPosition >= 0x280)
        gSubSpriteData1.yPosition -= 2;
}

void RidleyTailPartWindingUp2(void) {
    u8 primaryRamSlot, facingSamus;

    if (gSubSpriteData2.currentAnimationFrame == 3 && gSubSpriteData2.animationDurationCounter == 1)
        SoundPlay(0x1e5);

    primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
    facingSamus = FALSE;

    if (!SpriteUtilCheckEndSubSpriteData2Anim())
        return;

    gSpriteData[primaryRamSlot].pose = RIDLEY_POSE_TAIL_ATTACK;
    gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_TIP_STRIKING;

    if (gSpriteData[primaryRamSlot].status & SS_X_FLIP) {
        if (gSubSpriteData1.xPosition > gSamusData.xPosition) {
            gSpriteData[primaryRamSlot].status &= ~SS_FACING_RIGHT;
        } else {
            gSpriteData[primaryRamSlot].status |= SS_FACING_RIGHT;
            facingSamus = TRUE;
        }
    } else {
        if (gSubSpriteData1.xPosition > gSamusData.xPosition) {
            gSpriteData[primaryRamSlot].status &= ~SS_FACING_RIGHT;
            facingSamus = TRUE;
        } else {
            gSpriteData[primaryRamSlot].status |= SS_FACING_RIGHT;
        }
    }

    if (facingSamus) {
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_StrikingForward;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
        gCurrentSprite.pose = RIDLEY_TAIL_POSE_STRIKING_FORWARD;
    } else {
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_StrikingDown1;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
        gCurrentSprite.pose = RIDLEY_TAIL_POSE_STRIKING_DOWN_1;
        // BUG: no "gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;"? (previous Y position for RidleyTailStrikingCheckPlayEffects)
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.rotation = Q_8_8(7.f/8);
        else
            gCurrentSprite.rotation = Q_8_8(1.f/8);
    }
}

void RidleyTailPartStrikingDown1(void) {
    if (gSubSpriteData2.currentAnimationFrame == 3 && gSubSpriteData2.animationDurationCounter == 1)
        SoundPlay(0x1e7);
    if (SpriteUtilCheckEndSubSpriteData2Anim()) {
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_StrikingDown2;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
        gCurrentSprite.pose = RIDLEY_TAIL_POSE_STRIKING_DOWN_2;
        return;
    }
    if (gSubSpriteData2.currentAnimationFrame < 8)
        RidleyTailStrikeYMovement(0xc);
    else if (gSubSpriteData1.yPosition >= 0x280)
        gSubSpriteData1.yPosition -= 8;
    RidleyTailXMovement(2);
    RidleyTailStrikingCheckPlayEffects();
}

void RidleyTailPartStrikingDown2(void) {
    u8 primaryRamSlot, ended;

    if (gSubSpriteData2.currentAnimationFrame == 0 && gSubSpriteData2.animationDurationCounter == 1)
        SoundPlay(0x1e7);

    ended = FALSE;
    primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;

    if (SpriteUtilCheckEndSubSpriteData2Anim()) {
        if (gSamusData.yPosition < gSubSpriteData1.yPosition || gSpriteData[primaryRamSlot].samusCollision == SSC_RIDLEY_CLAW_GRABBED)
            gCurrentSprite.work1 = 1;
        if (--gCurrentSprite.work1 > 0) {
            if (gSpriteData[primaryRamSlot].status & SS_FACING_RIGHT) {
                if (gSubSpriteData1.xPosition > gSamusData.xPosition) ended++;
            } else {
                if (gSubSpriteData1.xPosition < gSamusData.xPosition) ended++;
            }
        } else {
            ended++;
        }

        if (ended) {
            gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_StrikingDown3;
            gSubSpriteData2.animationDurationCounter = 0;
            gSubSpriteData2.currentAnimationFrame = 0;
            gCurrentSprite.pose = RIDLEY_TAIL_POSE_STRIKING_DOWN_3;
            return;
        }
    }
    if (gSubSpriteData2.currentAnimationFrame < 5)
        RidleyTailStrikeYMovement(0xc);
    else if (gSubSpriteData1.yPosition >= 0x280)
        gSubSpriteData1.yPosition -= 8;
    RidleyTailXMovement(4);
    RidleyTailStrikingCheckPlayEffects();
}

void RidleyTailPartStrikingDown3(void) {
    if (gSubSpriteData2.currentAnimationFrame == 0 && gSubSpriteData2.animationDurationCounter == 1)
        SoundPlay(0x1e7);
    if (SpriteUtilCheckEndSubSpriteData2Anim()) {
        if (gCurrentSprite.work1 > 0) {
            gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_WindingUp2;
            gSubSpriteData2.animationDurationCounter = 0;
            gSubSpriteData2.currentAnimationFrame = 0;
            gCurrentSprite.pose = RIDLEY_TAIL_POSE_WINDING_UP_2;
        } else {
            gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_DoneStriking;
            gSubSpriteData2.animationDurationCounter = 0;
            gSubSpriteData2.currentAnimationFrame = 0;
            gCurrentSprite.pose = RIDLEY_TAIL_POSE_END_STRIKING;
            gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
        }
        return;
    }
    if (gSubSpriteData2.currentAnimationFrame < 5)
        RidleyTailStrikeYMovement(0xc);
    else if (gSubSpriteData1.yPosition >= 0x280)
        gSubSpriteData1.yPosition -= 8;
    RidleyTailXMovement(2);
    RidleyTailStrikingCheckPlayEffects();
}

void RidleyTailPartStrikingForward(void) {
    u8 primaryRamSlot;

    if (gSubSpriteData2.currentAnimationFrame == 3 && gSubSpriteData2.animationDurationCounter == 1)
        SoundPlay(0x1e6);

    primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;

    if (SpriteUtilCheckEndSubSpriteData2Anim()) {
        if (gSamusData.yPosition < gSubSpriteData1.yPosition || gSpriteData[primaryRamSlot].samusCollision == SSC_RIDLEY_CLAW_GRABBED)
            gCurrentSprite.work1 = 1;
            if (--gCurrentSprite.work1 == 0) {
                gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_DoneStriking;
                gSubSpriteData2.animationDurationCounter = 0;
                gSubSpriteData2.currentAnimationFrame = 0;
                gCurrentSprite.pose = RIDLEY_TAIL_POSE_END_STRIKING;
                gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
            } else {
                gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_WindingUp2;
                gSubSpriteData2.animationDurationCounter = 0;
                gSubSpriteData2.currentAnimationFrame = 0;
                gCurrentSprite.pose = RIDLEY_TAIL_POSE_WINDING_UP_2;
            }
    } else {
        if (gSubSpriteData2.currentAnimationFrame >= 4 && gSubSpriteData2.currentAnimationFrame <= 12) {
            if (gSpriteData[primaryRamSlot].status & SS_X_FLIP)
                gCurrentSprite.pOam = sRidleyPartOam_TailTip;
            else
                gCurrentSprite.pOam = sRidleyPartOam_TailTip_XFlipped;
        }
        RidleyTailStrikeYMovement(4);
        RidleyTailXMovement(1);
    }
}

void RidleyTailPartDoneStriking(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;

    if (SpriteUtilCheckEndSubSpriteData2Anim()) {
        gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_Idle;
        gSubSpriteData2.animationDurationCounter = 0;
        gSubSpriteData2.currentAnimationFrame = 0;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        gSpriteData[primaryRamSlot].pose = SPRITE_POSE_IDLE;
        gSpriteData[primaryRamSlot].work2 = 0;
        gSpriteData[primaryRamSlot].work3 = 1;
        gSpriteData[primaryRamSlot].work1 = 0;
        gSpriteData[primaryRamSlot].work4 = 1;
        gSpriteData[primaryRamSlot].rotation = (gSpriteRandomNumber + 1) * 16 - 1;
        if (gSpriteData[primaryRamSlot].status & SS_X_FLIP)
            gSpriteData[primaryRamSlot].status |= SS_FACING_RIGHT;
        else
            gSpriteData[primaryRamSlot].status &= ~SS_FACING_RIGHT;
    }
}

void RidleyFireInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.drawOrder = SPRITE_POSE_IDLE;
    gCurrentSprite.drawDistanceTop = 0xc;
    gCurrentSprite.drawDistanceBottom = 0xc;
    gCurrentSprite.drawDistanceHorizontal = 0xc;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.pOam = sRidleyFireballOam_Big;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.rotation = 0;
    gCurrentSprite.scaling = 0x100;
    gCurrentSprite.work1 = 16;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    if (gCurrentSprite.yPosition < gSamusData.yPosition)
        gCurrentSprite.status |= SS_FACING_DOWN;
}

void RidleyFireMoving(void) {
    u16 movement = gCurrentSprite.work3++;
    if (gCurrentSprite.status & SS_FACING_RIGHT)
        gCurrentSprite.xPosition += movement;
    else
        gCurrentSprite.xPosition -= movement;
    gCurrentSprite.yPosition += gCurrentSprite.roomSlot;
    if (gCurrentSprite.status & SS_FACING_RIGHT)
        gCurrentSprite.rotation -= Q_8_8(1.f/8);
    else
        gCurrentSprite.rotation += Q_8_8(1.f/8);
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = RIDLEY_FIRE_POSE_MOVING_TOWARD_SAMUS;
        gCurrentSprite.work2 = 0;
        gCurrentSprite.work3 = 0x10;
        gCurrentSprite.work1 = 0;
        gCurrentSprite.work4 = 0x10;
    }
}

void RidleyFireMovingTowardsSamus(void) {
    u16 dstYOffset;

    if (gCurrentSprite.roomSlot == 4)
        dstYOffset = 8;
    else if (gCurrentSprite.roomSlot == 3)
        dstYOffset = 0x28;
    else if (gCurrentSprite.roomSlot == 2)
        dstYOffset = 0x48;
    else if (gCurrentSprite.roomSlot == 1)
        dstYOffset = 0x68;
    else
        dstYOffset = 0x82;

    SpriteUtilMoveRidleyFireball((u16)(gSamusData.yPosition - dstYOffset), gSamusData.xPosition, 0x20, 0x28, 2);

    if (gCurrentSprite.status & SS_FACING_RIGHT)
        gCurrentSprite.rotation -= Q_8_8(1.f/8);
    else
        gCurrentSprite.rotation += Q_8_8(1.f/8);

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck != COLLISION_AIR)
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
}

void RidleyFireExploding(void) {
    gCurrentSprite.status = 0;
    ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x25);
    SoundPlay(0x1e4);
}

void Ridley(void) {
    RidleyWaveBeamCollsiion();
    RidleySamusGrabbed();
    RidleyUpdateHealthThreshold();
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            RidleyInit();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X:
            RidleyForming();
            break;
        case RIDLEY_POSE_SCREAMING_AFTER_SPAWN:
            RidleyScreamingAfterSpawn();
            break;
        case RIDLEY_POSE_RISING_AFTER_SPAWN:
            RidleyRisingAfterSpawn();
            break;
        case RIDLEY_POSE_SCREAMING_INIT:
            RidleyScreamingInit();
        case RIDLEY_POSE_SCREAMING:
            RidleyScreaming();
            break;
        case RIDLEY_POSE_TURNING_INTO_CORE_X:
            RidleyTurningIntoCoreX();
            break;
        case SPRITE_POSE_IDLE_INIT:
            RidleyIdleInit();
        case SPRITE_POSE_IDLE:
            RidleyIdle();
            break;
        case RIDLEY_POSE_FLYING_BACKWARDS_INIT:
            RidleyFlyingBackwardsInit();
        case RIDLEY_POSE_FLYING_BACKWARDS:
            RidleyFlyingBackwards();
            break;
        case RIDLEY_POSE_TURNING_AROUND_INIT:
            RidleyTurningAroundInit();
        case RIDLEY_POSE_TURNING_AROUND_1:
            RidleyTurningAround();
            break;
        case RIDLEY_POSE_TURNING_AROUND_2:
            RidleyTurningAroundSecondPart();
            break;
        case RIDLEY_POSE_PREPARING_TAIL_ATTACK:
            RidleyPreparingTailAttack();
            break;
        case RIDLEY_POSE_TAIL_ATTACK:
            RidleyTailAttack();
            break;
        case RIDLEY_POSE_SHOOTING_FIRE_INIT:
            RidleyShootingFireInit();
        case RIDLEY_POSE_SHOOTING_FIRE:
            RidleyShootingFire();
            break;
    }
    SpriteUtilUpdateSubSpriteData1Animation();
    RidleySyncSubSprites();
    RidleySetBackgroundPriority();
    RidleyUpdatePalette();
}

void RidleyPart(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
        RidleyPartInit();
        return;
    }

    if (gSpriteData[primaryRamSlot].status & SS_X_FLIP)
        gCurrentSprite.status |= SS_X_FLIP;
    else
        gCurrentSprite.status &= ~SS_X_FLIP;

    if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC) {
        gCurrentSprite.status |= SS_ENABLE_MOSAIC;
        if (gSpriteData[primaryRamSlot].spriteId == PSPRITE_SCREW_ATTACK_ABILITY) {
            // Kill parts when Neo-Ridley reverts to core-X
            gCurrentSprite.status = 0;
            return;
        }
    } else {
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
    }

    RidleySyncSubSprites();
    if (!(gCurrentSprite.status & SS_HIDDEN)) {
        RidleyPartIdle();
        if (gSpriteData[primaryRamSlot].paletteRow != 0)
            gCurrentSprite.paletteRow = SPRITE_FLASHING_PALETTE_ROW + 8 - gCurrentSprite.frozenPaletteRowOffset;
        else
            gCurrentSprite.paletteRow = 0;
        if (gCurrentSprite.roomSlot == RIDLEY_PART_FRONT_WING)
            if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 1)
                if (gCurrentSprite.pOam != sRidleyPartOam_FrontWingShootingFireOrScreaming)
                    SoundPlay(0x1e2);
    }
}

void RidleyTailPart(void) {
    u8 primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[primaryRamSlot].status & SS_ENABLE_MOSAIC) {
        gCurrentSprite.status |= SS_IGNORE_PROJECTILES | SS_ENABLE_MOSAIC;
        if (gSpriteData[primaryRamSlot].spriteId == PSPRITE_SCREW_ATTACK_ABILITY) {
            // Kill tail when Neo-Ridley reverts to core-X
            gCurrentSprite.status = 0;
            return;
        }
    } else {
        gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_ENABLE_MOSAIC);
    }

    if (gCurrentSprite.roomSlot != RIDLEY_TAIL_PART_TIP) {
        if (gSpriteData[primaryRamSlot].status & SS_X_FLIP)
            gCurrentSprite.status |= SS_X_FLIP;
        else
            gCurrentSprite.status &= ~SS_X_FLIP;
        if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED)
            RidleyTailPartInit();
        RidleyTailSyncSubSprites();
    } else {
        if (gSpriteData[primaryRamSlot].status & SS_X_FLIP) {
            gCurrentSprite.status |= SS_X_FLIP;
            gCurrentSprite.pOam = sRidleyPartOam_TailTip_XFlipped;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        } else {
            gCurrentSprite.status &= ~SS_X_FLIP;
            gCurrentSprite.pOam = sRidleyPartOam_TailTip;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
        if (gSubSpriteData1.pMultiOam == sRidleyMultiSpriteData_ScreamingInPain && gSubSpriteData2.pMultiOam != sRidleyTailMultiSpriteData_RidleyInPain) {
            gSubSpriteData2.pMultiOam = sRidleyTailMultiSpriteData_RidleyInPain;
            gSubSpriteData2.animationDurationCounter = 0;
            gSubSpriteData2.currentAnimationFrame = 0;
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
        }
        switch (gCurrentSprite.pose) {
            case SPRITE_POSE_UNINITIALIZED:
                RidleyTailPartInit();
                break;
            case SPRITE_POSE_IDLE:
                RidleyTailPartIdle();
                break;
            case RIDLEY_TAIL_POSE_WAITING_TO_WIND_UP:
                RidleyTailPartWaitingToWindUp();
                break;
            case RIDLEY_TAIL_POSE_WINDING_UP_1:
                RidleyTailPartWindingUp1();
                break;
            case RIDLEY_TAIL_POSE_WINDING_UP_2:
                RidleyTailPartWindingUp2();
                break;
            case RIDLEY_TAIL_POSE_STRIKING_DOWN_1:
                RidleyTailPartStrikingDown1();
                break;
            case RIDLEY_TAIL_POSE_STRIKING_DOWN_2:
                RidleyTailPartStrikingDown2();
                break;
            case RIDLEY_TAIL_POSE_STRIKING_DOWN_3:
                RidleyTailPartStrikingDown3();
                break;
            case RIDLEY_TAIL_POSE_STRIKING_FORWARD:
                RidleyTailPartStrikingForward();
                break;
            case RIDLEY_TAIL_POSE_END_STRIKING:
                RidleyTailPartDoneStriking();
                break;
        }
        SpriteUtilUpdateSubSpriteData2Animation();
        RidleyTailSyncSubSpritesPosition();
    }
}

void RidleyFire(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            RidleyFireInit();
            break;
        case SPRITE_POSE_IDLE:
            RidleyFireMoving();
            break;
        case RIDLEY_FIRE_POSE_MOVING_TOWARD_SAMUS:
            RidleyFireMovingTowardsSamus();
            break;
        case SPRITE_POSE_STOPPED:
            RidleyFireExploding();
            break;
    }
}
