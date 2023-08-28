#include "sprite_debris.h"
#include "globals.h"
#include "macros.h"

#include "data/particle_data.h"
#include "data/sprite_debris_data.h"

#include "constants/clipdata.h"

#include "structs/sprite.h"

/**
 * @brief 13b98 | 4e0 | Processes the current sprite debris
 * 
 */
void SpriteDebrisUpdateCurrent(void)
{
    u32 offset;
    u32 blockTop;
    s16 movement;

    gCurrentSpriteDebris.fallingTimer++;

    // u8 overflow
    if (gCurrentSpriteDebris.fallingTimer == 0)
    {
        gCurrentSpriteDebris.exists = FALSE;
        return;
    }

    offset = gCurrentSpriteDebris.arrayOffset / 2;
    if (offset >= SPRITE_DEBRIS_VELOCITY_ARRAY_SIZE)
        offset = SPRITE_DEBRIS_VELOCITY_ARRAY_SIZE - 1;

    switch (gCurrentSpriteDebris.type)
    {
        case DEBRIS_TYPE_HOPPING_SLOW_LEFT:
            if (gCurrentSpriteDebris.fallingTimer < 9)
                return;

        case DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_FALLING:
            movement = sDebris11Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition -= ONE_SUB_PIXEL;

            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSpriteDebris.yPosition, gCurrentSpriteDebris.xPosition);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSpriteDebris.yPosition = blockTop;
                gCurrentSpriteDebris.type = DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_BOUNCING;
                gCurrentSpriteDebris.arrayOffset = 0;
            }
            break;

        case DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_BOUNCING:
            movement = sDebris80Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition -= ONE_SUB_PIXEL;
            break;

        case DEBRIS_TYPE_HOPPING_SLOW_RIGHT:
            if (gCurrentSpriteDebris.fallingTimer < 6)
                return;

        case DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_FALLING:
            movement = sDebris12Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition += ONE_SUB_PIXEL;

            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSpriteDebris.yPosition, gCurrentSpriteDebris.xPosition);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSpriteDebris.yPosition = blockTop;
                gCurrentSpriteDebris.type = DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_BOUNCING;
                gCurrentSpriteDebris.arrayOffset = 0;
            }
            break;

        case DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_BOUNCING:
            movement = sDebris80Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition += ONE_SUB_PIXEL;
            break;

        case DEBRIS_TYPE_HOPPING_FAST_RIGHT:
            if (gCurrentSpriteDebris.fallingTimer < 3)
                return;

        case DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_FALLING:
            movement = sDebris13Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition += PIXEL_SIZE / 2;

            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSpriteDebris.yPosition, gCurrentSpriteDebris.xPosition);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSpriteDebris.yPosition = blockTop;
                gCurrentSpriteDebris.type = DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_BOUNCING;
                gCurrentSpriteDebris.arrayOffset = 0;
            }
            break;

        case DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_BOUNCING:
            movement = sDebris80Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition += PIXEL_SIZE / 2;
            break;

        case DEBRIS_TYPE_HOPPING_FAST_LEFT:
            movement = sDebris4Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition -= PIXEL_SIZE / 2;

            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSpriteDebris.yPosition, gCurrentSpriteDebris.xPosition);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSpriteDebris.yPosition = blockTop;
                gCurrentSpriteDebris.type = DEBRIS_TYPE_HOPPING_FAST_LEFT | DEBRIS_TYPE_BOUNCING;
                gCurrentSpriteDebris.arrayOffset = 0;
            }
            break;

        case DEBRIS_TYPE_HOPPING_FAST_LEFT | DEBRIS_TYPE_BOUNCING:
            movement = sDebris80Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition -= PIXEL_SIZE / 2;
            break;

        case DEBRIS_TYPE_LIGHT_SLOW_LEFT:
            movement = sDebris5Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition -= ONE_SUB_PIXEL;

            if (gCurrentSpriteDebris.fallingTimer < 20)
                break;

            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSpriteDebris.yPosition, gCurrentSpriteDebris.xPosition);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSpriteDebris.yPosition = blockTop;
                gCurrentSpriteDebris.type = DEBRIS_TYPE_HOPPING_SLOW_LEFT | DEBRIS_TYPE_BOUNCING;
                gCurrentSpriteDebris.arrayOffset = 0;
            }
            break;

        case DEBRIS_TYPE_HEAVY_SLOW_RIGHT:
            movement = sDebris6Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition += ONE_SUB_PIXEL;

            if (gCurrentSpriteDebris.fallingTimer < 20)
                break;

            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSpriteDebris.yPosition, gCurrentSpriteDebris.xPosition);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSpriteDebris.yPosition = blockTop;
                gCurrentSpriteDebris.type = DEBRIS_TYPE_HOPPING_SLOW_RIGHT | DEBRIS_TYPE_BOUNCING;
                gCurrentSpriteDebris.arrayOffset = 0;
            }
            break;

        case DEBRIS_TYPE_LIGHT_SLOW_RIGHT:
            movement = sDebris7Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition += ONE_SUB_PIXEL;

            if (gCurrentSpriteDebris.fallingTimer < 20)
                break;

            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSpriteDebris.yPosition, gCurrentSpriteDebris.xPosition);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSpriteDebris.yPosition = blockTop;
                gCurrentSpriteDebris.type = DEBRIS_TYPE_HOPPING_FAST_RIGHT | DEBRIS_TYPE_BOUNCING;
                gCurrentSpriteDebris.arrayOffset = 0;
            }
            break;

        case DEBRIS_TYPE_HEAVY_SLOW_LEFT:
            movement = sDebris8Velocity[offset];
            gCurrentSpriteDebris.yPosition += movement;
            gCurrentSpriteDebris.xPosition -= ONE_SUB_PIXEL;

            if (gCurrentSpriteDebris.fallingTimer < 20)
                break;

            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSpriteDebris.yPosition, gCurrentSpriteDebris.xPosition);

            if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
            {
                gCurrentSpriteDebris.yPosition = blockTop;
                gCurrentSpriteDebris.type = DEBRIS_TYPE_HOPPING_FAST_LEFT | DEBRIS_TYPE_BOUNCING;
                gCurrentSpriteDebris.arrayOffset = 0;
            }
            break;

        default:
            gCurrentSpriteDebris.exists = FALSE;
    }

    gCurrentSpriteDebris.arrayOffset++;
}

/**
 * @brief 14078 | 84 | Updates all the sprite debris
 * 
 */
void SpriteDebrisUpdateAll(void)
{
    s32 i;

    // Only update if playing
    if (gSubGameMode1 != SUB_GAME_MODE_PLAYING)
        return;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITE_DEBRIS; i++)
    {
        // Don't update if doesn't exists
        if (!gSpriteDebris[i].exists)
            continue;

        // Set current and update
        gCurrentSpriteDebris = gSpriteDebris[i];
        SpriteDebrisUpdateCurrent();

        // Update animation
        gCurrentSpriteDebris.animationDurationCounter++;

        if (gCurrentSpriteDebris.pOam[gCurrentSpriteDebris.currentAnimationFrame].timer < gCurrentSpriteDebris.animationDurationCounter)
        {
            gCurrentSpriteDebris.animationDurationCounter = 1;
            gCurrentSpriteDebris.currentAnimationFrame++;

            if (gCurrentSpriteDebris.pOam[gCurrentSpriteDebris.currentAnimationFrame].timer == 0)
                gCurrentSpriteDebris.currentAnimationFrame = 0;
        }

        // Write back to array
        gSpriteDebris[i] = gCurrentSpriteDebris;
    }
}

/**
 * @brief 140fc | 104 | Draws the current sprite debris
 * 
 * @param debrisSlot Debris slot
 */
void SpriteDebrisDraw(s32 debrisSlot)
{
    const u16* src;
    u16* dst;
    u16 yPosition;
    u16 xPosition;
    u8 partCount;
    u8 prevSlot;
    u8 count;
    u16 part1;
    u16 part2;
    u32 currSlot;

    if (gBg1YPosition + BLOCK_SIZE * 3 > gCurrentSpriteDebris.yPosition + BLOCK_SIZE * 4 ||
        gBg1YPosition + BLOCK_SIZE * 15 < gCurrentSpriteDebris.yPosition + BLOCK_SIZE * 4)
    {
        gSpriteDebris[debrisSlot].exists = FALSE;
        return;
    }

    prevSlot = gNextOamSlot;
    src = gCurrentSpriteDebris.pOam[gCurrentSpriteDebris.currentAnimationFrame].pFrame;
    partCount = *src++;

    if (partCount + prevSlot < OAM_BUFFER_DATA_SIZE)
    {
        dst = (u16*)(gOamData + prevSlot);

        xPosition = SUB_PIXEL_TO_PIXEL_(gCurrentSpriteDebris.xPosition) - SUB_PIXEL_TO_PIXEL(gBg1XPosition);
        yPosition = SUB_PIXEL_TO_PIXEL_(gCurrentSpriteDebris.yPosition) - SUB_PIXEL_TO_PIXEL(gBg1YPosition);

        for (count = 0; count < partCount; count++)
        {
            part1 = *src++;
            *dst++ = part1;
            part2 = *src++;
            *dst++ = part2;
            *dst++ = *src++;

            currSlot = prevSlot + count;
            gOamData[currSlot].split.y = part1 + yPosition;
            gOamData[currSlot].split.x = (part2 + xPosition) & 0x1FF;

            dst++;
        }

        gNextOamSlot = prevSlot + partCount;
    }
}

/**
 * @brief 14200 | 50 | Draws all the sprite debris
 * 
 */
void SpriteDebrisDrawAll(void)
{
    s32 i;

    // Only draw if playing
    if (gSubGameMode1 != SUB_GAME_MODE_PLAYING)
        return;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITE_DEBRIS; i++)
    {
        // Don't draw if doesn't exists
        if (!gSpriteDebris[i].exists)
            continue;

        // Don't draw if it just spawned
        if (gSpriteDebris[i].fallingTimer == 0)
            continue;

        // Set current and draw
        gCurrentSpriteDebris = gSpriteDebris[i];
        SpriteDebrisDraw(i);
    }
}

/**
 * @brief 14250 | c0 | Tries to initialize a sprite debris
 * 
 * @param cloudType Cloud type
 * @param debrisType Debris type
 * @param yPosition Y Position
 * @param xPosition X Position
 */
void SpriteDebrisInit(u8 cloudType, u8 debrisType, u16 yPosition, u16 xPosition)
{
    s32 i;
    u32 canSpawn;
    u8 newIndex;

    canSpawn = FALSE;

    // Try to find empty slot
    for (i = 0; i < MAX_AMOUNT_OF_SPRITE_DEBRIS; i++)
    {
        if (!gSpriteDebris[i].exists)
        {
            canSpawn = TRUE;
            break;
        }
    }

    if (!canSpawn)
    {
        // Couldn't find empty slot, find oldest sprite debris

        canSpawn = 0;
        newIndex = UCHAR_MAX;

        for (i = 0; i < MAX_AMOUNT_OF_SPRITE_DEBRIS; i++)
        {
            if (canSpawn < gSpriteDebris[i].fallingTimer)
            {
                canSpawn = gSpriteDebris[i].fallingTimer;
                newIndex = i;
            }
        }

        if (newIndex == UCHAR_MAX)
            return;

        i = newIndex;
    }

    // Set oam
    if (cloudType == 1)
    {
        if (debrisType < 3)
            gSpriteDebris[i].pOam = sSpriteDebrisOam_Cloud1;
        else
            gSpriteDebris[i].pOam = sSpriteDebrisOam_Cloud3;
    }
    else if (cloudType == 2)
    {
        if (debrisType < 3)
            gSpriteDebris[i].pOam = sSpriteDebrisOam_Cloud2;
        else
            gSpriteDebris[i].pOam = sSpriteDebrisOam_Cloud3;
    }
    else
        gSpriteDebris[i].pOam = sSpriteDebrisOam_Cloud3;

    // Setup data
    gSpriteDebris[i].exists = TRUE;
    gSpriteDebris[i].yPosition = yPosition;
    gSpriteDebris[i].xPosition = xPosition;
    gSpriteDebris[i].currentAnimationFrame = 0;
    gSpriteDebris[i].animationDurationCounter = 0;
    gSpriteDebris[i].type = debrisType;
    gSpriteDebris[i].fallingTimer = 0;
    gSpriteDebris[i].arrayOffset = 0;
}
