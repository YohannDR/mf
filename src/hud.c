#include "hud.h"
#include "oam.h"
#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "data/hud_data.h"

#include "constants/samus.h"

#include "structs/hud.h"
#include "structs/minimap.h"
#include "structs/samus.h"

/**
 * @brief 719f8 | 254 | Handles the oam of the hud
 * 
 */
void HudDrawOam(void)
{
    u32 oamSlot;
    u16* dst;

    dst = (u16*)gOamData;
    oamSlot = 0;

    // Left part of health bar
    *dst++ = 0;
    gOamData[oamSlot].split.y = SUB_PIXEL_TO_PIXEL(QUARTER_BLOCK_SIZE / 2);
    gOamData[oamSlot].split.shape = 0x1;

    *dst++ = 0;
    gOamData[oamSlot].split.x = SUB_PIXEL_TO_PIXEL(0);
    gOamData[oamSlot].split.size = 0x2;
    
    *dst++ = 0;
    gOamData[oamSlot].split.tileNum = 0x50;
    gOamData[oamSlot].split.paletteNum = 3;

    dst++;
    oamSlot++;

    // Right part of health bar
    *dst++ = 0;
    gOamData[oamSlot].split.y = SUB_PIXEL_TO_PIXEL(QUARTER_BLOCK_SIZE / 2);
    gOamData[oamSlot].split.shape = 0x1;
    
    *dst++ = 0;
    gOamData[oamSlot].split.x = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
    gOamData[oamSlot].split.size = 0x2;
    
    *dst++ = 0;
    gOamData[oamSlot].split.tileNum = 0x54;
    gOamData[oamSlot].split.paletteNum = 3;

    dst++;
    oamSlot++;

    if (gEquipment.weaponsStatus & MBF_ANY_MISSILE)
    {
        // Missile digits
        *dst++ = 0;
        gOamData[oamSlot].split.y = 0x2;
        gOamData[oamSlot].split.shape = 0x0;

        *dst++ = 0;
        gOamData[oamSlot].split.x = 0x44;
        gOamData[oamSlot].split.size = 0x1;

        *dst++ = 0;
        gOamData[oamSlot].split.tileNum = 0x58;
        gOamData[oamSlot].split.paletteNum = 3;

        dst++;
        oamSlot++;
    }

    if (gEquipment.weaponsStatus & MBF_POWER_BOMBS)
    {
        // Power bomb digits
        *dst++ = 0;
        gOamData[oamSlot].split.y = 0x2;
        gOamData[oamSlot].split.shape = 0x0;

        *dst++ = 0;
        gOamData[oamSlot].split.x = 0x54;
        gOamData[oamSlot].split.size = 0x1;

        *dst++ = 0;
        gOamData[oamSlot].split.tileNum = 0x5A;
        gOamData[oamSlot].split.paletteNum = 3;

        dst++;
        oamSlot++;
    }

    *dst++ = 0;
    gOamData[oamSlot].split.y = 0xA;
    gOamData[oamSlot].split.shape = 0x0;

    *dst++ = 0;
    gOamData[oamSlot].split.x = 0xDE;
    gOamData[oamSlot].split.size = 0x0;

    *dst++ = 0;

    if (gFrameCounter8Bit & 0x8)
        gOamData[oamSlot].split.tileNum = 0xC5;
    else
        gOamData[oamSlot].split.tileNum = 0xC6;
    gOamData[oamSlot].split.paletteNum = 6;

    dst++;
    oamSlot++;

    // Minimap
    *dst++ = 0;
    gOamData[oamSlot].split.y = 0xFA;
    gOamData[oamSlot].split.shape = 0x0;

    *dst++ = 0;
    gOamData[oamSlot].split.x = 0xD6;
    gOamData[oamSlot].split.size = 0x2;

    *dst = 0;
    gOamData[oamSlot].split.tileNum = 0xDC;
    gOamData[oamSlot].split.paletteNum = 6;
    
    oamSlot++;

    gNextOamSlot = oamSlot;
}

void HudDrawEnergy(void)
{

}

/**
 * @brief 7223c | 1f8 | Draws the missiles on the hud
 * 
 * @param skipUpdatingNumber Skip updating the digit value number flag
 */
void HudDrawMissiles(u8 skipUpdatingNumber)
{
    u8 digit;
    u16 missiles;

    u16 hundreds;
    u16 tens;
    u16 ones;

    u16 highlight;
    u8 row;
    u8 i;

    i = FALSE;
    if (skipUpdatingNumber)
    {
        i++;
    }
    else
    {
        missiles = gEquipment.currentMissiles;

        // Update hundreds
        digit = missiles / 100 % 10;

        if (gMissileDigits.hundreds != digit)
        {
            gMissileDigits.hundreds = digit;
            i++;
        }

        // Update tens
        digit = missiles / 10 % 10;

        if (gMissileDigits.tens != digit)
        {
            gMissileDigits.tens = digit;
            i++;
        }

        // Update ones
        digit = missiles / 1 % 10;

        if (gMissileDigits.ones != digit)
        {
            gMissileDigits.ones = digit;
            i++;
        }
    }

    if (!i)
        return;

    // Fetch values
    hundreds = gMissileDigits.hundreds;
    tens = gMissileDigits.tens;
    ones = gMissileDigits.ones;

    // Check set empty gfx
    if (hundreds == 0)
    {
        hundreds = 10;
        if (tens == 0)
            tens = 10;
    }

    // Offset for graphics
    hundreds *= 32;
    tens *= 32;
    ones *= 32;

    highlight = 0x160;

    if (gMissileHighlightStatus != 0)
    {
        // Change graphics for highlight
        hundreds += 0x300;
        tens += 0x300;
        ones += 0x300;

        highlight += 0x300;
    }

    // Update graphics
    for (row = 0, i = 0; i < 8; i++)
    {
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[hundreds];
        row++;
        hundreds++;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[hundreds];
        row++;
        hundreds += 3;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[tens];
        row++;
        tens++;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[tens];
        row++;
        tens += 3;
    }

    for (row = 32, i = 0; i < 8; i++)
    {
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[ones];
        row++;
        ones++;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[ones];
        row++;
        ones += 3;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[highlight];
        row++;
        highlight++;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[highlight];
        row++;
        highlight += 3;
    }

    // Transfer graphics
    DMA_SET(3, gAmmoDigitsGfx, VRAM_OBJ + 0xF00, C_32_2_16(DMA_ENABLE, sizeof(gAmmoDigitsGfx) / sizeof(u16)));
}

/**
 * @brief 72434 | 1f8 | Draws the power bombs on the hud
 * 
 * @param skipUpdatingNumber Skip updating the digit value number flag
 */
void HudDrawPowerBombs(u8 skipUpdatingNumber)
{
    u8 digit;
    u16 powerBombs;

    u16 hundreds;
    u16 tens;
    u16 ones;

    u16 highlight;
    u8 row;
    u8 i;

    i = FALSE;
    if (skipUpdatingNumber)
    {
        i++;
    }
    else
    {
        powerBombs = gEquipment.currentPowerBombs;

        // Update hundreds
        digit = powerBombs / 100 % 10;

        if (gPowerBombDigits.hundreds != digit)
        {
            gPowerBombDigits.hundreds = digit;
            i++;
        }

        // Update tens
        digit = powerBombs / 10 % 10;

        if (gPowerBombDigits.tens != digit)
        {
            gPowerBombDigits.tens = digit;
            i++;
        }

        // Update ones
        digit = powerBombs / 1 % 10;

        if (gPowerBombDigits.ones != digit)
        {
            gPowerBombDigits.ones = digit;
            i++;
        }
    }

    if (!i)
        return;

    // Fetch values
    hundreds = gPowerBombDigits.hundreds;
    tens = gPowerBombDigits.tens;
    ones = gPowerBombDigits.ones;

    // Check set empty gfx
    if (hundreds == 0)
    {
        hundreds = 10;
        if (tens == 0)
            tens = 10;
    }

    // Offset for graphics
    hundreds *= 32;
    tens *= 32;
    ones *= 32;

    highlight = 0x160;

    if (gPowerBombHighlightStatus != 0)
    {
        // Change graphics for highlight
        hundreds += 0x300;
        tens += 0x300;
        ones += 0x300;

        highlight += 0x300;
    }

    // Update graphics
    for (row = 0, i = 0; i < 8; i++)
    {
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[hundreds];
        row++;
        hundreds++;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[hundreds];
        row++;
        hundreds += 3;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[tens];
        row++;
        tens++;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[tens];
        row++;
        tens += 3;
    }

    for (row = 32, i = 0; i < 8; i++)
    {
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[ones];
        row++;
        ones++;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[ones];
        row++;
        ones += 3;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[highlight];
        row++;
        highlight++;
        gAmmoDigitsGfx[row] = sAmmoDigitsGfx[highlight];
        row++;
        highlight += 3;
    }

    // Transfer graphics
    DMA_SET(3, gAmmoDigitsGfx, VRAM_OBJ + 0xF40, C_32_2_16(DMA_ENABLE, sizeof(gAmmoDigitsGfx) / sizeof(u16)));
}

/**
 * @brief 7262c | 13c | Updates the graphics of the hud
 * 
 */
void HudUpdateGfx(void)
{
    if (gMissileHighlightStatus)
    {
        if (!(gSamusData.weaponHighlighted & 0x1))
        {
            DMA_SET(3, 0x83e799c, VRAM_OBJ + 0xB00, C_32_2_16(DMA_ENABLE, 0x20));

            gMissileHighlightStatus = FALSE;
            HudDrawMissiles(TRUE);
        }
    }
    else
    {
        if (gSamusData.weaponHighlighted & 0x1)
        {
            DMA_SET(3, 0x83e79dc, VRAM_OBJ + 0xB00, C_32_2_16(DMA_ENABLE, 0x20));

            gMissileHighlightStatus = TRUE;
            HudDrawMissiles(TRUE);
        }
    }

    if (gPowerBombHighlightStatus)
    {
        if (!(gSamusData.weaponHighlighted & 0x10))
        {
            DMA_SET(3, 0x83e7a1c, VRAM_OBJ + 0xB40, C_32_2_16(DMA_ENABLE, 0x20));

            gPowerBombHighlightStatus = FALSE;
            HudDrawPowerBombs(TRUE);
        }
    }
    else
    {
        if (gSamusData.weaponHighlighted & 0x10)
        {
            DMA_SET(3, 0x83e7a5c, VRAM_OBJ + 0xB40, C_32_2_16(DMA_ENABLE, 0x20));

            gPowerBombHighlightStatus = TRUE;
            HudDrawPowerBombs(TRUE);
        }
    }

    if (gMinimapUpdateFlag != 0)
    {
        gMinimapUpdateFlag--;

        DMA_SET(3, EWRAM_BASE + 0x35C00 + gMinimapUpdateFlag * 48 * sizeof(u16), VRAM_OBJ + 0x1F80 + gMinimapUpdateFlag * 0x400, C_32_2_16(DMA_ENABLE, 48))
    }
}

/**
 * @brief 72768 | 20 | Draws the hud
 * 
 */
void HudDraw(void)
{
    HudDrawEnergy();
    HudDrawMissiles(FALSE);
    HudDrawPowerBombs(FALSE);

    HudUpdateGfx();
    HudDrawOam();
}
