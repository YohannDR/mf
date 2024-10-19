#include "sprite.h"
#include "globals.h"
#include "sprite_util.h"
#include "macros.h"
#include "fixed_point.h"
#include "gba.h"

#include "data/sprite_data.h"
#include "data/generic_data.h"
#include "data/engine_pointers.h"

#include "structs/connection.h"
#include "structs/sprite_debris.h"
#include "structs/room.h"

/**
 * @brief e7a8 | 40 | Updates the sprite random number
 * 
 * @param slot Sprite slot
 */
void SpriteUpdateRandomNumber(u8 slot)
{
    u32 offset;

    offset = slot + gFrameCounter8Bit + gFrameCounter16Bit / 16 + (gCurrentSprite.xPosition + gCurrentSprite.yPosition);

    gSpriteRandomNumber = sRandomNumberTable[offset % ARRAY_SIZE(sRandomNumberTable)];
}

/**
 * @brief e7e8 | 2d4 | Updates the sprites
 * 
 */
void SpriteUpdate(void)
{
    u8 i;

    if (gSubGameMode1 == SUB_GAME_MODE_PLAYING)
    {
        // Update the debris
        SpriteDebrisUpdateAll();

        if (!SpriteUtilCheckStopSpritesPose())
        {
            // Handle collision
            SpriteUtilSamusAndSpriteCollision();

            // Update every sprite
            for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
            {
                if (!(gSpriteData[i].status & SS_EXISTS))
                    continue;

                // Copy to current sprite
                gCurrentSprite = gSpriteData[i];

                // Update rng and stun
                SpriteUpdateRandomNumber(i);
                SpriteUtilUpdateStunTimer();

                // Call AI
                if (gCurrentSprite.properties & SP_SECONDARY_SPRITE)
                    sSecondarySpritesAiPointers[gCurrentSprite.spriteId]();
                else
                    sPrimarySpritesAiPointers[gCurrentSprite.spriteId]();

                if (gCurrentSprite.status & SS_EXISTS)
                {
                    // If sprite still exists, update standing, animation and on screen flag
                    SpriteUtilSamusStandingOnSprite();
                    SpriteUpdateAnimation();
                    SpriteCheckOnScreen();
                }

                // Copy back to sprite data
                gSpriteData[i] = gCurrentSprite;
            }
        }
        else
        {
            // Samus is in a state where gameplay is pause
            for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
            {
                if (!(gSpriteData[i].status & SS_EXISTS))
                    continue;

                // Only update sprites that are either on pose 0 or have the always active flag
                if (gSpriteData[i].pose != 0 && !(gSpriteData[i].properties & SP_ALWAYS_ACTIVE))
                    continue;

                // Copy to current sprite
                gCurrentSprite = gSpriteData[i];

                // Update rng and stun
                SpriteUpdateRandomNumber(i);
                SpriteUtilUpdateStunTimer();

                // Call AI
                if (gCurrentSprite.properties & SP_SECONDARY_SPRITE)
                    sSecondarySpritesAiPointers[gCurrentSprite.spriteId]();
                else
                    sPrimarySpritesAiPointers[gCurrentSprite.spriteId]();

                if (gCurrentSprite.status & SS_EXISTS)
                {
                    // If sprite still exists, update standing, animation and on screen flag
                    SpriteUtilSamusStandingOnSprite();
                    SpriteUpdateAnimation();
                    SpriteCheckOnScreen();
                }

                // Copy back to sprite data
                gSpriteData[i] = gCurrentSprite;
            }
        }
    
        return;
    }

    if (gSubGameMode1 == SUB_GAME_MODE_FREE_MOVEMENT)
    {
        // In free movement, update all sprites without checking for collision
        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if (!(gSpriteData[i].status & SS_EXISTS))
                continue;

            // Copy to current sprite
            gCurrentSprite = gSpriteData[i];

            // Update rng and stun
            SpriteUpdateRandomNumber(i);
            SpriteUtilUpdateStunTimer();

            // Call AI
            if (gCurrentSprite.properties & SP_SECONDARY_SPRITE)
                sSecondarySpritesAiPointers[gCurrentSprite.spriteId]();
            else
                sPrimarySpritesAiPointers[gCurrentSprite.spriteId]();

            if (gCurrentSprite.status & SS_EXISTS)
            {
                // If sprite still exists, update standing, animation and on screen flag
                SpriteUtilSamusStandingOnSprite();
                SpriteUpdateAnimation();
                SpriteCheckOnScreen();
            }

            // Copy back to sprite data
            gSpriteData[i] = gCurrentSprite;
        }

        return;
    }

    // In any other sub game mode
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SS_EXISTS))
            continue;

        // Copy to current sprite
        gCurrentSprite = gSpriteData[i];

        // Update rng
        SpriteUpdateRandomNumber(i);

        if (gCurrentSprite.pose == 0)
        {
            // Call AI only for the initialization
            if (gCurrentSprite.properties & SP_SECONDARY_SPRITE)
                sSecondarySpritesAiPointers[gCurrentSprite.spriteId]();
            else
                sPrimarySpritesAiPointers[gCurrentSprite.spriteId]();
        }

        if (gCurrentSprite.status & SS_EXISTS)
        {
            // If sprite still exists, update on screen flag
            SpriteCheckOnScreen();
        }

        // Copy back to sprite data
        gSpriteData[i] = gCurrentSprite;
    }
}

/**
 * @brief eabc | 48 | Updates the animation of the current sprite
 * 
 */
void SpriteUpdateAnimation(void)
{
    // Don't update animation if freezed
    if (gCurrentSprite.freezeTimer != 0)
        return;

    // Update ADC
    gCurrentSprite.animationDurationCounter++;

    // Check timer for current frame
    if (gCurrentSprite.pOam[gCurrentSprite.currentAnimationFrame].timer >= gCurrentSprite.animationDurationCounter)
        return;

    // Reset timer and go to next frame
    gCurrentSprite.animationDurationCounter = 1;
    gCurrentSprite.currentAnimationFrame++;

    // Check animation has ended
    if (gCurrentSprite.pOam[gCurrentSprite.currentAnimationFrame].timer == 0)
    {
        // Loop animation
        gCurrentSprite.currentAnimationFrame = 0;
    }
}

/**
 * @brief eb04 | 9c | Draws all high-priority sprites (draw order between 1 and 8 with the high-priority status flag)
 * 
 */
void SpriteDrawAll_HighPriority(void)
{
    s32 i;
    s32 drawOrder;
    u16 drawStatus;
    u16 checkStatus;

    if (gSubGameMode1 != SUB_GAME_MODE_PLAYING)
        return;

    checkStatus = SS_EXISTS | SS_ON_SCREEN | SS_NOT_DRAWN | SS_HIGH_PRIORITY | SS_HIDDEN;
    drawStatus = SS_EXISTS | SS_ON_SCREEN | SS_HIGH_PRIORITY;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if ((gSpriteData[i].status & checkStatus) != drawStatus)
        {
            gSpriteDrawOrder[i] = 0;
            continue;
        }

        if (gSpriteData[i].drawOrder < 9)
            gSpriteDrawOrder[i] = gSpriteData[i].drawOrder;
        else
            gSpriteDrawOrder[i] = 0;
    }

    for (drawOrder = 1; drawOrder < 9; drawOrder++)
    {
        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if (gSpriteDrawOrder[i] == drawOrder)
            {
                gCurrentSprite = gSpriteData[i];
                SpriteDraw(i);
            }
        }
    }
}

/**
 * @brief eba0 | 98 | Draws all medium-priority sprites (draw order between 1 and 8 without the upper status flag)
 * 
 */
void SpriteDrawAll_MediumPriority(void)
{
    s32 i;
    s32 drawOrder;
    u16 drawStatus;
    u16 checkStatus;

    checkStatus = SS_EXISTS | SS_ON_SCREEN | SS_NOT_DRAWN | SS_HIGH_PRIORITY | SS_HIDDEN;
    drawStatus = SS_EXISTS | SS_ON_SCREEN;

    SpriteDebrisDrawAll();
    SA_XUpdateGFXAndDraw();

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if ((gSpriteData[i].status & checkStatus) != drawStatus)
        {
            gSpriteDrawOrder[i] = 0;
            continue;
        }

        if (gSpriteData[i].drawOrder < 9)
            gSpriteDrawOrder[i] = gSpriteData[i].drawOrder;
        else
            gSpriteDrawOrder[i] = 0;
    }

    for (drawOrder = 1; drawOrder < 9; drawOrder++)
    {
        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if (gSpriteDrawOrder[i] == drawOrder)
            {
                gCurrentSprite = gSpriteData[i];
                SpriteDraw(i);
            }
        }
    }
}

/**
 * @brief ec38 | 90 | Draws all low-priority sprites (draw order between 9 and 16, high-priority status flag hides the sprite)
 * 
 */
void SpriteDrawAll_LowPriority(void)
{
    s32 i;
    s32 drawOrder;
    u16 drawStatus;
    u16 checkStatus;

    checkStatus = SS_EXISTS | SS_ON_SCREEN | SS_NOT_DRAWN | SS_HIGH_PRIORITY | SS_HIDDEN;
    drawStatus = SS_EXISTS | SS_ON_SCREEN;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if ((gSpriteData[i].status & checkStatus) != drawStatus)
        {
            gSpriteDrawOrder[i] = 0;
            continue;
        }

        if (gSpriteData[i].drawOrder >= 9)
            gSpriteDrawOrder[i] = gSpriteData[i].drawOrder;
        else
            gSpriteDrawOrder[i] = 0;
    }

    for (drawOrder = 9; drawOrder < 17; drawOrder++)
    {
        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if (gSpriteDrawOrder[i] == drawOrder)
            {
                gCurrentSprite = gSpriteData[i];
                SpriteDraw(i);
            }
        }
    }
}

/**
 * @brief ecc8 | 8a0 | Draws the current sprite
 * 
 * @param slot Sprite slot
 */
void SpriteDraw(s32 slot)
{
    const u16* src;
    u16* dst;
    u8 prevSlot;
    u16 part1;
    u16 part2;

    u32 shape;
    u32 size;
    
    u16 dy;
    u16 dmy;

    s16 actualY;
    s16 actualX;
    s16 yScaling;
    s16 xScaling;
    s16 y;
    s16 x;
    s16 unk_2;
    s16 unk_3;
    s16 tmpX;
    s16 tmpY;
    s16 scaledX;
    s16 scaledY;

    u16 rotateScaleIndividual;
    s32 i;
    u16 partCount;
    
    s32 yOffset;
    s32 xOffset;
    
    u16 xFlip;
    u16 doubleSize;
    u16 mosaic;
    u16 yFlip;
    u32 bgPriority;
    u32 paletteRow;
    u32 gfxOffset;
    u16 xPosition;
    u16 yPosition;
    u16 rotation;
    u16 scaling;

    u8 offset;

    prevSlot = gNextOamSlot;
    src = gCurrentSprite.pOam[gCurrentSprite.currentAnimationFrame].pFrame;
    partCount = *src++;

    if (partCount + prevSlot >= OAM_BUFFER_DATA_SIZE)
        return;

    dst = (u16*)(gOamData + prevSlot);
    yPosition = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.yPosition) - SUB_PIXEL_TO_PIXEL(gBg1YPosition);
    xPosition = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.xPosition) - SUB_PIXEL_TO_PIXEL(gBg1XPosition);

    // Shortcuts for status
    xFlip = gCurrentSprite.status & SS_X_FLIP;
    rotateScaleIndividual = gCurrentSprite.status & SS_ROTATE_SCALE_INDIVIDUAL;
    doubleSize = gCurrentSprite.status & SS_DOUBLE_SIZE;
    mosaic = gCurrentSprite.status & SS_ENABLE_MOSAIC;
    yFlip = gCurrentSprite.status & SS_Y_FLIP;

    // Get graphical data
    // Palette offset by spriteset slot
    paletteRow = gCurrentSprite.spritesetGfxSlot + gCurrentSprite.paletteRow;
    // Gfx slot, scale to 2 rows of 8x8 tiles in VRAM
    gfxOffset = gCurrentSprite.spritesetGfxSlot * 64;
    bgPriority = gCurrentSprite.bgPriority;

    if (gSamusOnTopOfBackgrounds && bgPriority != 0)
        bgPriority--;

    if (gCurrentSprite.properties & SP_ABSOLUTE_POSITION)
    {
        yPosition = gCurrentSprite.yPosition;
        xPosition = gCurrentSprite.xPosition;
    }

    if (!(gCurrentSprite.status & SS_ROTATE_SCALE_WHOLE))
    {
        for (i = 0; i < partCount; i++)
        {
            // Raw copy
            part1 = *src++;
            *dst++ = part1;
            part2 = *src++;
            *dst++ = part2;
            *dst++ = *src++;

            // Apply position
            gOamData[prevSlot + i].split.y = part1 + yPosition;
            gOamData[prevSlot + i].split.x = part2 + xPosition;

            // Apply graphics
            gOamData[prevSlot + i].split.priority = bgPriority;
            // Add palette row and gfx offset
            gOamData[prevSlot + i].split.paletteNum += paletteRow;
            gOamData[prevSlot + i].split.tileNum += gfxOffset;

            if (xFlip)
            {
                // Enable X flip
                gOamData[prevSlot + i].split.xFlip ^= TRUE;

                shape = gOamData[prevSlot + i].split.shape;
                size = gOamData[prevSlot + i].split.size;
                offset = sOamXFlipOffsets[shape][size];

                // Properly offset x position
                gOamData[prevSlot + i].split.x = xPosition - (part2 + offset * 8);
            }

            if (yFlip)
            {
                // Enable Y flip
                gOamData[prevSlot + i].split.yFlip ^= TRUE;
                shape = gOamData[prevSlot + i].split.shape;
                size = gOamData[prevSlot + i].split.size;
                offset = sOamYFlipOffsets[shape][size];

                // Properly offset x position
                gOamData[prevSlot + i].split.y = yPosition - (part1 + offset * 8);
            }

            // Rotates and scales objects at their centers independently if SS_ROTATE_SCALE_INDIVIDUAL is set
            // Breaks if any of the objects are flipped
            if (rotateScaleIndividual)
            {
                if (doubleSize)
                {
                    // Rotation scaling and double size
                    gOamData[prevSlot + i].split.affineMode = 3;
                }
                else
                {
                    // Rotation scaling
                    gOamData[prevSlot + i].split.affineMode = 1;
                }

                // In this affine mode, X/Y flip are part of the matrix num, so this is just doing matrixNum = slot
                gOamData[prevSlot + i].split.yFlip = slot >> 4;
                gOamData[prevSlot + i].split.xFlip = slot >> 3;
                gOamData[prevSlot + i].split.matrixNum = slot;
            }

            if (mosaic)
            {
                // Semi transparent
                gOamData[prevSlot + i].split.mosaic = TRUE;
            }

            dst++;
        }

        // Update next oam slot
        gNextOamSlot = partCount + prevSlot;

        if (rotateScaleIndividual)
        {
            rotation = gCurrentSprite.rotation;
            scaling = gCurrentSprite.scaling;

            // Rotation matrix (column major mode) :
            // [ cos / scaling, -sin / scaling ]
            // [ sin / scaling,  cos / scaling ]

            // If x flipped, then negate scaling on the first column to manually flip the sprite since flipping
            // isn't supported by hardware when affine transformation is enabled
            if (xFlip)
            {
                gOamData[slot * 4 + 0].all.affineParam = FixedMultiplication(COS(rotation), FixedInverse(-scaling));
                gOamData[slot * 4 + 1].all.affineParam = FixedMultiplication(SIN(rotation), FixedInverse(-scaling));
            }
            else
            {
                gOamData[slot * 4 + 0].all.affineParam = FixedMultiplication(COS(rotation), FixedInverse(scaling));
                gOamData[slot * 4 + 1].all.affineParam = FixedMultiplication(SIN(rotation), FixedInverse(scaling));
            }
            
            gOamData[slot * 4 + 2].all.affineParam = FixedMultiplication(-SIN(rotation), FixedInverse(scaling));
            gOamData[slot * 4 + 3].all.affineParam = FixedMultiplication(COS(rotation), FixedInverse(scaling));
        }
    }
    else
    {
        rotation = gCurrentSprite.rotation;
        scaling = gCurrentSprite.scaling;

        yPosition += BLOCK_SIZE;
        xPosition += BLOCK_SIZE;

        for (i = 0; i < partCount; i++)
        {
            // Raw copy
            part1 = *src++;
            *dst++ = part1;
            part2 = *src++;
            *dst++ = part2;
            *dst++ = *src++;

            // Apply graphics
            gOamData[prevSlot + i].split.priority = bgPriority;
            // Add palette row and gfx offset
            gOamData[prevSlot + i].split.paletteNum += paletteRow;
            gOamData[prevSlot + i].split.tileNum += gfxOffset;

            // Rotates and scales the whole sprite, ignores flip
            shape = gOamData[prevSlot + i].split.shape;
            size = gOamData[prevSlot + i].split.size;
        
            // Get center relative to top-left corner of object
            yOffset = sOamYFlipOffsets[shape][size];
            yOffset *= 4;
            xOffset = sOamXFlipOffsets[shape][size];
            xOffset *= 4;
        
            // Get current positions
            y = MOD_AND(part1 + yPosition, 256);
            x = MOD_AND(part2 + xPosition, 512);
        
            // Get center of object relative to the sprite's position
            tmpY = y - yPosition + yOffset;
            tmpX = x - xPosition + xOffset;

            // Apply scaling
            tmpX = Q_8_8_TO_INT(tmpX * scaling) - tmpX;
            tmpY = Q_8_8_TO_INT(tmpY * scaling) - tmpY;
        
            x += tmpX;
            y += tmpY;
        
            // Offset to 0;0 temporally to apply the rotation
            unk_2 = x - xPosition + xOffset;
            unk_3 = y - yPosition + yOffset;
        
            // Rotation matrix
            x = Q_8_8_TO_INT(unk_2 * COS(rotation) - unk_3 * SIN(rotation));
            y = Q_8_8_TO_INT(unk_2 * SIN(rotation) + unk_3 * COS(rotation));
        
            // Offset it back to top-left corner
            if (doubleSize)
            {
                x -= xOffset * 2;
                y -= yOffset * 2;
            }
            else
            {
                x -= xOffset;
                y -= yOffset;
            }
        
            // Rotated position + position
            gOamData[prevSlot + i].split.y = MOD_AND(y + yPosition - BLOCK_SIZE, 256);
            gOamData[prevSlot + i].split.x = MOD_AND(x + xPosition - BLOCK_SIZE, 512);

            if (doubleSize)
            {
                // Rotation scaling and double size
                gOamData[prevSlot + i].split.affineMode = 3;
            }
            else
            {
                // Rotation scaling
                gOamData[prevSlot + i].split.affineMode = 1;
            }

            // Select proper matrix: mosaic flag doesn't enable mosaic and instead chooses between one of the two matrix slots
            if (mosaic)
            {
                if (gOamData[prevSlot + i].split.xFlip)
                {
                    gOamData[prevSlot + i].split.x--;
                    gOamData[prevSlot + i].split.yFlip = 29 >> 4;
                    gOamData[prevSlot + i].split.xFlip = 29 >> 3;
                    gOamData[prevSlot + i].split.matrixNum = 29;
                }
                else
                {
                    gOamData[prevSlot + i].split.yFlip = 28 >> 4;
                    gOamData[prevSlot + i].split.xFlip = 28 >> 3;
                    gOamData[prevSlot + i].split.matrixNum = 28;
                }
            }
            else
            {
                if (gOamData[prevSlot + i].split.xFlip)
                {
                    gOamData[prevSlot + i].split.x--;
                    gOamData[prevSlot + i].split.yFlip = 31 >> 4;
                    gOamData[prevSlot + i].split.xFlip = 31 >> 3;
                    gOamData[prevSlot + i].split.matrixNum = 31;
                }
                else
                {
                    gOamData[prevSlot + i].split.yFlip = 30 >> 4;
                    gOamData[prevSlot + i].split.xFlip = 30 >> 3;
                    gOamData[prevSlot + i].split.matrixNum = 30;
                }
            }

            dst++;
        }
        
        // Update next oam slot
        gNextOamSlot = partCount + prevSlot;

        // Setup matrices for normal and x flip
        
        // [ cos / scaling, -sin / scaling ]
        // [ sin / scaling,  cos / scaling ]
        // and
        // [ cos / -scaling, -sin / scaling ]
        // [ sin / -scaling,  cos / scaling ]
        dy = FixedMultiplication(-SIN(rotation), FixedInverse(scaling));
        dmy = FixedMultiplication(COS(rotation), FixedInverse(scaling));

        if (mosaic)
        {
            gOamData[28 * 4 + 0].all.affineParam = FixedMultiplication(COS(rotation), FixedInverse(scaling));
            gOamData[28 * 4 + 1].all.affineParam = FixedMultiplication(SIN(rotation), FixedInverse(scaling));
            gOamData[28 * 4 + 2].all.affineParam = dy;
            gOamData[28 * 4 + 3].all.affineParam = dmy;

            gOamData[29 * 4 + 0].all.affineParam = FixedMultiplication(COS(rotation), FixedInverse(-scaling));
            gOamData[29 * 4 + 1].all.affineParam = FixedMultiplication(SIN(rotation), FixedInverse(-scaling));
            gOamData[29 * 4 + 2].all.affineParam = dy;
            gOamData[29 * 4 + 3].all.affineParam = dmy;
        }
        else
        {
            gOamData[30 * 4 + 0].all.affineParam = FixedMultiplication(COS(rotation), FixedInverse(scaling));
            gOamData[30 * 4 + 1].all.affineParam = FixedMultiplication(SIN(rotation), FixedInverse(scaling));
            gOamData[30 * 4 + 2].all.affineParam = dy;
            gOamData[30 * 4 + 3].all.affineParam = dmy;

            gOamData[31 * 4 + 0].all.affineParam = FixedMultiplication(COS(rotation), FixedInverse(-scaling));
            gOamData[31 * 4 + 1].all.affineParam = FixedMultiplication(SIN(rotation), FixedInverse(-scaling));
            gOamData[31 * 4 + 2].all.affineParam = dy;
            gOamData[31 * 4 + 3].all.affineParam = dmy;
        }
    }
}

/**
 * @brief f568 | 14c | Checks if a sprite is on screen
 * 
 */
void SpriteCheckOnScreen(void)
{
    u16 bgBaseY;
    u16 bgBaseX;
    u16 bgXRange;
    u16 bgYRange;

    u16 spriteY;
    u16 spriteX;
    u16 spriteYRange;
    u16 spriteXRange;
    u16 spriteTop;
    u16 spriteBottom;
    u16 spriteLeft;
    u16 spriteRight;

    u32 drawOffsetY;
    u32 drawOffsetX;

    u16 bgYOffScreenRange;
    u16 bgXOffScreenRange;
    u16 spriteOffScreenLeft;
    u16 spriteOffScreenBottom;
    u16 spriteOffScreenYRange;
    u16 spriteOffScreenXRange;
    u16 spriteOffScreenTop;
    u16 spriteOffScreenRight;

    if (gCurrentSprite.properties & SP_ABSOLUTE_POSITION)
        return;

    bgBaseY = gBg1YPosition;
    bgBaseX = gBg1XPosition;

    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;

    bgYRange = bgBaseY + BLOCK_TO_SUB_PIXEL(CEIL(SCREEN_SIZE_X_BLOCKS / 2));
    spriteYRange = spriteY + BLOCK_TO_SUB_PIXEL(CEIL(SCREEN_SIZE_X_BLOCKS / 2));
    spriteBottom = bgYRange - PIXEL_TO_SUB_PIXEL(gCurrentSprite.drawDistanceBottom);
    drawOffsetY = PIXEL_TO_SUB_PIXEL(gCurrentSprite.drawDistanceTop) + SCREEN_SIZE_Y_SUB_PIXEL;
    spriteTop = bgYRange + drawOffsetY;

    bgXRange = bgBaseX + BLOCK_TO_SUB_PIXEL(CEIL(SCREEN_SIZE_X_BLOCKS / 2));
    spriteXRange = spriteX + BLOCK_TO_SUB_PIXEL(CEIL(SCREEN_SIZE_X_BLOCKS / 2));
    spriteLeft = bgXRange - PIXEL_TO_SUB_PIXEL(gCurrentSprite.drawDistanceHorizontal);
    drawOffsetX = PIXEL_TO_SUB_PIXEL(gCurrentSprite.drawDistanceHorizontal) + SCREEN_SIZE_X_SUB_PIXEL;
    spriteRight = bgXRange + drawOffsetX;

    if (spriteLeft < spriteXRange && spriteXRange < spriteRight && spriteBottom < spriteYRange && spriteYRange < spriteTop)
    {
        gCurrentSprite.status |= SS_ON_SCREEN;
        return;
    }

    gCurrentSprite.status &= ~SS_ON_SCREEN;

    if (gCurrentSprite.properties & SP_KILL_OFF_SCREEN)
    {
        bgYOffScreenRange = bgBaseY + BLOCK_SIZE * 10;
        spriteOffScreenYRange = spriteY + BLOCK_SIZE * 10;
        spriteOffScreenBottom = bgYOffScreenRange - BLOCK_SIZE * 9;
        spriteOffScreenTop = bgYOffScreenRange + BLOCK_SIZE * 19;

        bgXOffScreenRange = bgBaseX + BLOCK_SIZE * 10;
        spriteOffScreenXRange = spriteX + BLOCK_SIZE * 10;
        spriteOffScreenLeft = bgXOffScreenRange - BLOCK_SIZE * 9;
        spriteOffScreenRight = bgXOffScreenRange + BLOCK_SIZE * 24;

        if (spriteOffScreenLeft >= spriteOffScreenXRange || spriteOffScreenXRange >= spriteOffScreenRight || spriteOffScreenBottom >= spriteOffScreenYRange || spriteOffScreenYRange >= spriteOffScreenTop)
            gCurrentSprite.status = 0;
    }
}

/**
 * @brief f6b4 | b8 | Loads the sprite data
 * 
 */
void SpriteLoadAllData(void)
{
    // Checks has pause screen flag, hence not loading the room
    if (gPauseScreenFlag != 0)
        return;

    if (gUnk_03000be3 == 0 && !gIsLoadingFile)
    {
        // Reset sprite global data
        gAtmosphericStabilizersOnline = 0;
        gNormalXBarrierCoresDestroyed = 0;
        gSuperXBarrierCoresDestroyed = 0;
        gPowerBombXBarrierCoresDestroyed = 0;
        gGadorasDestroyed = 0;
        gMissilesHatchDestroyed = FALSE;
        gWaterLowered = FALSE;
    }

    // Clear sprite data
    SpriteClearData();

    // Load spriteset
    SpriteLoadSpriteset();

    // Check load escape graphics
    EscapeCheckReloadGraphics();

    // Check load location text
    SpriteUtilInitLocationText();

    // Load sprites
    SpriteLoadRoomSprites();

    // Reset boss work
    gBossWork0 = 0;
    gBossWork1 = 0;
    gBossWork2 = 0;
    gBossWork3 = 0;
    gBossWork4 = 0;
    gBossWork5 = 0;
}

/**
 * @brief f76c | 140 | Loads the spriteset for the current room
 * 
 */
void SpriteLoadSpriteset(void)
{
    s32 i;
    s32 j;
    s32 prevGfxSlot;
    s32 spriteset;
    s32 spriteId;
    s32 gfxSlot;

    // Loads debug sprite graphics
    DMA_SET(3, sSpritesGraphicsPointers[PSPRITE_UNUSED_16 - 0x10], VRAM_OBJ + 0x7800,
        C_32_2_16(DMA_ENABLE, sSpritesGraphicsLength[PSPRITE_UNUSED_16 - 0x10] / 2));

    DMA_SET(3, sSpritesPalettePointers[PSPRITE_UNUSED_16 - 0x10], PALRAM_OBJ + 0x1E0,
        C_32_2_16(DMA_ENABLE, 16));

    // Clear sprite ids and graphics slots
    for (i = 0; i < MAX_AMOUNT_OF_SPRITE_TYPES; i++)
    {
        gSpritesetSpriteIds[i] = PSPRITE_UNUSED_16;
        gSpritesetSpriteGfxSlots[i] = 0;
    }

    prevGfxSlot = UCHAR_MAX;

    // Get spriteset number
    // FIXME defines
    spriteset = gSpritesetNumber;
    if (spriteset >= ARRAY_SIZE(sSpritesetPointers) - 1)
    {
        if (gCurrentArea > 6)
            spriteset = ARRAY_SIZE(sSpritesetPointers) - 1;
        else
            spriteset = 0;
    }

    for (j = 0, i = 0; i < MAX_AMOUNT_OF_SPRITE_TYPES; i++)
    {
        // Get sprite id and graphics slot
        spriteId = sSpritesetPointers[spriteset][j * 2 + 0];
        gfxSlot = sSpritesetPointers[spriteset][j * 2 + 1];

        j++;

        // Check for terminator
        if (spriteId == PSPRITE_TARGET_CIRCLES)
            break;

        // Register sprite id and graphics slot
        gSpritesetSpriteIds[i] = spriteId;
        gSpritesetSpriteGfxSlots[i] = MOD_AND(gfxSlot, 8);

        // Prevent overwriting previous graphics
        // only works if they are directly back to back, having a pattern of X Y X will cause the second X graphics
        // to load over the first X graphics
        if (gfxSlot == prevGfxSlot)
            continue;

        prevGfxSlot = gfxSlot;
        if (gfxSlot == 8)
            continue;

        spriteId -= 0x10;

        // Load graphics
        DMA_SET(3, sSpritesGraphicsPointers[spriteId], VRAM_OBJ + 0x4000 + gfxSlot * 2048,
            C_32_2_16(DMA_ENABLE, sSpritesGraphicsLength[spriteId] / 2));

        // Load palete
        DMA_SET(3, sSpritesPalettePointers[spriteId], PALRAM_OBJ + 0x100 + gfxSlot * 16 * sizeof(u16),
            C_32_2_16(DMA_ENABLE, sSpritesGraphicsLength[spriteId] / 2048 * 16));
    }
}

/**
 * @brief f8ac | 44 | Loads the graphics of a sprite
 * 
 * @param spriteId Sprite id
 * @param gfxRow Graphics row
 * @param srcOffset Graphics offset (in chunks of 0x200)
 */
void SpriteLoadGfx(u8 spriteId, u8 gfxRow, u8 srcOffset)
{
    spriteId -= 0x10;
    
    DMA_SET(3, sSpritesGraphicsPointers[spriteId] + srcOffset * 0x200,
        VRAM_BASE + 0x14000 + gfxRow * 0x800 + srcOffset * 0x200, C_32_2_16(DMA_ENABLE, 0x200 / 2));
}

/**
 * @brief f8f0 | 40 | Loads the palette of a sprite
 * 
 * @param spriteId Sprite id
 * @param gfxRow Graphics row
 * @param length Palette length
 */
void SpriteLoadPal(u8 spriteId, u8 gfxRow, u8 length)
{
    spriteId -= 0x10;

    DMA_SET(3, sSpritesPalettePointers[spriteId], PALRAM_OBJ + 0x100 + gfxRow * 16 * sizeof(u16), C_32_2_16(DMA_ENABLE, length * 16));
}

/**
 * @brief f930 | 3c | Clears the sprite data
 * 
 */
void SpriteClearData(void)
{
    s32 i;

    // Clear all sprites
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        gSpriteData[i].status = 0;
        gSpriteData[i].standingOnSprite = FALSE;
    }

    // Clear all sprite debris
    for (i = 0; i < MAX_AMOUNT_OF_SPRITE_DEBRIS; i++)
        gSpriteDebris[i].exists = FALSE;
}

/**
 * @brief f96c | 48 | Loads the sprites of the current room
 * 
 */
void SpriteLoadRoomSprites(void)
{
    u8 i;
    u8 y;
    u8 x;
    u8 slot;
    
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        /*
            0 | Y position
            1 | X position
            2 | Spriteset slot
        */
        y = gCurrentRoomEntry.pEnemyRoomData[i * ENEMY_ROOM_DATA_SIZE + 0];

        // Terminator
        if (y == UCHAR_MAX)
            break;

        x = gCurrentRoomEntry.pEnemyRoomData[i * ENEMY_ROOM_DATA_SIZE + 1];
        slot = gCurrentRoomEntry.pEnemyRoomData[i * ENEMY_ROOM_DATA_SIZE + 2];
        SpriteInitPrimary(slot, y, x, i);
    }
}

/**
 * @brief f9b4 | 12c | Initializes a primary sprite
 * 
 * @param spritesetSlot Spriteset slot
 * @param yPosition Y Position
 * @param xPosition X Position
 * @param roomSlot Room slot
 */
void SpriteInitPrimary(u8 spritesetSlot, u16 yPosition, u16 xPosition, u8 roomSlot)
{
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        // Try to find an empty slot

        if (gSpriteData[i].status & SS_EXISTS)
            continue;

        // Found a free slot, initialize data

        // Set initial status
        if (spritesetSlot & 0x80)
            gSpriteData[i].status = SS_EXISTS | SS_HIDDEN;
        else
            gSpriteData[i].status = SS_EXISTS;

        spritesetSlot = MOD_AND(spritesetSlot, 0x80);
        gSpriteData[i].spritesetSlotAndProperties = spritesetSlot;

        if (spritesetSlot > 0x10)
        {
            spritesetSlot--;
            spritesetSlot %= 16;

            gSpriteData[i].spritesetGfxSlot = gSpritesetSpriteGfxSlots[spritesetSlot];
            gSpriteData[i].spriteId = gSpritesetSpriteIds[spritesetSlot];
        }
        else
        {
            gSpriteData[i].spritesetGfxSlot = 0;
            gSpriteData[i].spriteId = spritesetSlot - 1;
        }

        // Clear properties
        gSpriteData[i].properties = 0;

        // Set parameter data
        gSpriteData[i].yPosition = BLOCK_TO_SUB_PIXEL(yPosition) + BLOCK_SIZE;
        gSpriteData[i].xPosition = BLOCK_TO_SUB_PIXEL(xPosition) + HALF_BLOCK_SIZE;
        gSpriteData[i].roomSlot = roomSlot;

        // Reset common fields
        gSpriteData[i].bgPriority = 2;
        gSpriteData[i].drawOrder = 4;
        gSpriteData[i].pose = 0;
        gSpriteData[i].health = 0;
        gSpriteData[i].invincibilityStunFlashTimer = 0;
        gSpriteData[i].work0 = 0;
        gSpriteData[i].paletteRow = 0;
        gSpriteData[i].frozenPaletteRowOffset = 0;
        gSpriteData[i].ignoreSamusCollisionTimer = 1;

        // Set ram slot
        gSpriteData[i].primarySpriteRamSlot = i;

        gSpriteData[i].freezeTimer = 0;
        gSpriteData[i].work5 = 1;
        break;
    }
}

/**
 * @brief fae0 | e8 | Spawns a new secondary sprite
 * 
 * @param spriteId Sprite ID
 * @param partNumber Part number
 * @param gfxRow Graphics row
 * @param ramSlot Primary sprite ram slot
 * @param yPosition Y Position
 * @param xPosition X Position
 * @param statusToAdd Additional status
 * @return u8 Assigned sprite ram slot
 */
u8 SpriteSpawnSecondary(u8 spriteId, u8 partNumber, u8 gfxRow, u8 ramSlot, u16 yPosition, u16 xPosition, u16 statusToAdd)
{
    u8 i;
    u8 slot;

    slot = UCHAR_MAX;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        // Try to find an empty slot

        if (gSpriteData[i].status & SS_EXISTS)
            continue;

        // Found a free slot, initialize data

        // Set initial status
        gSpriteData[i].status = (SS_EXISTS | SS_ON_SCREEN | SS_NOT_DRAWN) | statusToAdd;

        // Flag as secondary sprite
        gSpriteData[i].properties = SP_SECONDARY_SPRITE;

        // Set parameter data
        gSpriteData[i].spritesetGfxSlot = gfxRow;
        gSpriteData[i].spriteId = spriteId;
        gSpriteData[i].yPosition = yPosition;
        gSpriteData[i].xPosition = xPosition;
        gSpriteData[i].roomSlot = partNumber;

        // Reset common fields
        gSpriteData[i].bgPriority = 2;
        gSpriteData[i].drawOrder = 4;
        gSpriteData[i].pose = 0;
        gSpriteData[i].health = 0;
        gSpriteData[i].invincibilityStunFlashTimer = 0;
        gSpriteData[i].work0 = 0;
        gSpriteData[i].paletteRow = 0;
        gSpriteData[i].frozenPaletteRowOffset = 0;
        gSpriteData[i].ignoreSamusCollisionTimer = 1;

        // Set ram slot
        gSpriteData[i].primarySpriteRamSlot = ramSlot;

        // Clear slot and properties
        gSpriteData[i].spritesetSlotAndProperties = UCHAR_MAX;
        gSpriteData[i].freezeTimer = 0;
        gSpriteData[i].work5 = 1;

        slot = i;
        break;
    }

    return slot;
}

/**
 * @brief fbc8 | dc | Spawns a new primary sprite
 * 
 * @param spriteId Sprite ID
 * @param partNumber Part number
 * @param gfxRow Graphics row
 * @param spritesetSlot Spriteset slot and properties
 * @param yPosition Y Position
 * @param xPosition X Position
 * @param statusToAdd Additional status
 * @return u8 Assigned sprite ram slot
 */
u8 SpriteSpawnPrimary(u8 spriteId, u8 partNumber, u8 gfxRow, u8 spritesetSlot, u16 yPosition, u16 xPosition, u16 statusToAdd)
{
    u8 i;
    u8 slot;

    slot = UCHAR_MAX;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        // Try to find an empty slot

        if (gSpriteData[i].status & SS_EXISTS)
            continue;

        // Found a free slot, initialize data

        // Set initial status
        gSpriteData[i].status = (SS_EXISTS | SS_ON_SCREEN | SS_NOT_DRAWN) | statusToAdd;

        // No properties
        gSpriteData[i].properties = 0;

        // Set parameter data
        gSpriteData[i].spritesetGfxSlot = gfxRow;
        gSpriteData[i].spriteId = spriteId;
        gSpriteData[i].yPosition = yPosition;
        gSpriteData[i].xPosition = xPosition;
        gSpriteData[i].roomSlot = partNumber;

        // Reset common fields
        gSpriteData[i].bgPriority = 2;
        gSpriteData[i].drawOrder = 4;
        gSpriteData[i].pose = 0;
        gSpriteData[i].health = 0;
        gSpriteData[i].invincibilityStunFlashTimer = 0;
        gSpriteData[i].work0 = 0;
        gSpriteData[i].paletteRow = 0;
        gSpriteData[i].frozenPaletteRowOffset = 0;
        gSpriteData[i].ignoreSamusCollisionTimer = 1;

        // Set ram slot
        gSpriteData[i].primarySpriteRamSlot = i;

        // Set slot and properties
        gSpriteData[i].spritesetSlotAndProperties = spritesetSlot;
        gSpriteData[i].freezeTimer = 0;
        gSpriteData[i].work5 = 1;

        slot = i;
        break;
    }

    return slot;
}

/**
 * @brief fca4 | ec | Initializes a new X parasite sprite
 * 
 * @param spriteId Sprite ID
 * @param partNumber Part number
 * @param gfxRow Graphics row
 * @param ramSlot Primary sprite ram slot
 * @param spritesetSlot Spriteset slot and properties
 * @param yPosition Y Position
 * @param xPosition X Position
 * @param statusToAdd Additional status
 * @return u8 Assigned sprite ram slot
 */
u8 SpriteSpawnNewXParasite(u8 spriteId, u8 partNumber, u8 gfxRow, u8 ramSlot, u8 spritesetSlot, u16 yPosition, u16 xPosition, u16 statusToAdd)
{
    u8 i;
    u8 slot;

    slot = UCHAR_MAX;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        // Try to find an empty slot

        if (gSpriteData[i].status & SS_EXISTS)
            continue;

        // Found a free slot, initialize data

        // Set initial status
        gSpriteData[i].status = (SS_EXISTS | SS_ON_SCREEN | SS_NOT_DRAWN) | statusToAdd;

        // No properties
        gSpriteData[i].properties = 0;

        // Set parameter data
        gSpriteData[i].spritesetGfxSlot = gfxRow;
        gSpriteData[i].spriteId = spriteId;
        gSpriteData[i].yPosition = yPosition;
        gSpriteData[i].xPosition = xPosition;
        gSpriteData[i].roomSlot = partNumber;

        // Reset common fields
        gSpriteData[i].bgPriority = 2;
        gSpriteData[i].drawOrder = 4;
        gSpriteData[i].pose = 0;
        gSpriteData[i].health = 0;
        gSpriteData[i].invincibilityStunFlashTimer = 0;
        gSpriteData[i].work0 = 0;
        gSpriteData[i].paletteRow = 0;
        gSpriteData[i].frozenPaletteRowOffset = 0;
        gSpriteData[i].ignoreSamusCollisionTimer = 1;

        // Set ram slot
        gSpriteData[i].primarySpriteRamSlot = ramSlot;

        // Set slot and properties
        gSpriteData[i].spritesetSlotAndProperties = spritesetSlot;
        gSpriteData[i].freezeTimer = 0;
        gSpriteData[i].work5 = 1;

        slot = i;
        break;
    }

    return slot;
}
