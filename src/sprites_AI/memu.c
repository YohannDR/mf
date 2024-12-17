#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/memu.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

void MemuInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0x20;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    gCurrentSprite.pOam = sMemuOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    SpriteUtilChooseRandomXDirection();
    if (gSpriteRandomNumber >= 9)
        gCurrentSprite.status |= SS_FACING_DOWN;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void MemuIdleInit(void) {
    u8 offset;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    offset = gSpriteRandomNumber * 4;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.work4 = offset;
}

void MemuIdle(void) {
    u8 offset;
    s16 movement;

    if (gCurrentSprite.status & SS_HIDDEN) return;

    offset = gCurrentSprite.work4;
    movement = sMemuIdleYSpeed[offset];
    if (movement == SHORT_MAX) {
        movement = sMemuIdleYSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work4 = offset;
    gCurrentSprite.yPosition += movement;

    offset = gCurrentSprite.work3;
    movement = sMemuIdleXSpeed[gCurrentSprite.work3];
    if (movement == SHORT_MAX) {
        movement = sMemuIdleXSpeed[0];
        offset = 0;
    }
    offset++;
    gCurrentSprite.work3 = offset;
    gCurrentSprite.xPosition += movement;

    if (SpriteUtilCheckSamusNearSpriteLeftRight(0x200, 0x200) != NSLR_OUT_OF_RANGE)
        gCurrentSprite.pose = 0x17;
}

void MemuChasingSamusInit(void) {
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.unk_8 = gSpriteRandomNumber & 3; // Unused
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.scaling = 12;
    gCurrentSprite.pOam = sMemuOam_ChasingTarget;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    SpriteUtilMakeSpriteFaceSamusDirection();
    if (gCurrentSprite.yPosition > gSamusData.yPosition + gSamusData.drawDistanceTop)
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    else
        gCurrentSprite.status |= SS_FACING_DOWN;
}

void MemuChasingSamus(void) {
    u16 y, x, targetY, targetX, hitboxSize, speedCap;
    u8 i;

    y = gCurrentSprite.yPosition;
    x = gCurrentSprite.xPosition;
    hitboxSize = 0x18;

    // Push follower out of the way
    for (i = gCurrentSprite.primarySpriteRamSlot + 1; i < MAX_AMOUNT_OF_SPRITES; i++) {
        if (!(gSpriteData[i].status & SS_EXISTS)) continue;
        if (gSpriteData[i].properties & SP_SECONDARY_SPRITE) continue;
        if (!(gSpriteData[i].spriteId == PSPRITE_MEMU)) continue;
        targetY = gSpriteData[i].yPosition;
        targetX = gSpriteData[i].xPosition;
        if (y + hitboxSize > targetY - hitboxSize && y - hitboxSize < targetY + hitboxSize &&
            x + hitboxSize > targetX - hitboxSize && x - hitboxSize < targetX + hitboxSize) {
            if (gSpriteData[i].freezeTimer == 0) {
                if (y > targetY)
                    gSpriteData[i].yPosition -= 4;
                else
                    gSpriteData[i].yPosition += 4;
                if (x > targetX)
                    gSpriteData[i].xPosition -= 4;
                else
                    gSpriteData[i].xPosition += 4;
                gSpriteData[i].status ^= SS_FACING_RIGHT;
                gSpriteData[i].status ^= SS_FACING_DOWN;
            }
            break;
        }
    }

    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
    }

    if (gCurrentSprite.status & SS_FACING_DOWN) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status ^= SS_FACING_DOWN;
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck == COLLISION_SOLID)
            gCurrentSprite.status ^= SS_FACING_DOWN;
    }

    targetY = gSamusData.yPosition - 0x48;
    targetX = gSamusData.xPosition;
    speedCap = 4;
    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        // Move right
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > targetX - PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < speedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                gCurrentSprite.xPosition += (gCurrentSprite.work3 >> 2);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += (gCurrentSprite.work2 >> 2);
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
            if (gCurrentSprite.xPosition < targetX + PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < speedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                gCurrentSprite.xPosition -= (gCurrentSprite.work3 >> 2);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition -= (gCurrentSprite.work2 >> 2);
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
            if (gCurrentSprite.yPosition > targetY - PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < speedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                gCurrentSprite.yPosition += (gCurrentSprite.work4 >> 2);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += (gCurrentSprite.work1 >> 2);
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
            if (gCurrentSprite.yPosition < targetY + PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < speedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                gCurrentSprite.yPosition -= (gCurrentSprite.work4 >> 2);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition -= (gCurrentSprite.work1 >> 2);
            else
            {
                gCurrentSprite.status |= SS_FACING_DOWN;
                gCurrentSprite.work4 = 1;
            }
        }
    }

    if (--gCurrentSprite.scaling == 0) {
        gCurrentSprite.scaling = 12;
        if (gCurrentSprite.status & SS_ON_SCREEN)
            SoundPlayNotAlreadyPlaying(SOUND_MEMU_CHASING);
    }
}

void Memu(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_MEMU_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            MemuInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            MemuIdleInit();
            break;
        case SPRITE_POSE_IDLE:
            MemuIdle();
            break;
        case 0x17:
            MemuChasingSamusInit();
        case 0x18:
            MemuChasingSamus();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            MemuInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
    }
}
