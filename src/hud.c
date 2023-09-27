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

/**
 * @brief 71c4c | 5f0 | Draws the energy on the hud
 * 
 */
void HudDrawEnergy(void)
{
    u16 energy;
    u8 digit;
    u8 needUpdate;
    u8 maxThousands;
    u8 maxHundreds;
    u8 maxTens;
    u8 currentThousands;
    u8 currentHundreds;
    u8 currentTens;

    needUpdate = FALSE;

    energy = gEquipment.maxEnergy;

    maxThousands = energy / 1000;
    digit = maxThousands % 10;
    if (gMaxEnergyDigits.thousands != digit)
    {
        gMaxEnergyDigits.thousands = digit;
        needUpdate++;
    }

    maxHundreds = energy / 100;
    digit = maxHundreds % 10;
    if (gMaxEnergyDigits.hundreds != digit)
    {
        gMaxEnergyDigits.hundreds = digit;
        needUpdate++;
    }

    maxTens = energy / 10;
    digit = maxTens % 10;
    if (gMaxEnergyDigits.tens != digit)
    {
        gMaxEnergyDigits.tens = digit;
        needUpdate++;
    }

    digit = energy / 1 % 10;
    if (gMaxEnergyDigits.ones != digit)
    {
        gMaxEnergyDigits.ones = digit;
        needUpdate++;
    }

    energy = gEquipment.currentEnergy;

    currentThousands = energy / 1000;
    digit = currentThousands % 10;
    if (gEnergyDigits.thousands != digit)
    {
        gEnergyDigits.thousands = digit;
        needUpdate++;
    }

    currentHundreds = energy / 100;
    digit = currentHundreds % 10;
    if (gEnergyDigits.hundreds != digit)
    {
        gEnergyDigits.hundreds = digit;
        needUpdate++;
    }

    currentTens = energy / 10;
    digit = currentTens % 10;
    if (gEnergyDigits.tens != digit)
    {
        gEnergyDigits.tens = digit;
        needUpdate++;

        DMA_SET(3, &sEnergyDigitsGfx[digit * 32], VRAM_OBJ + 0xE20, C_32_2_16(DMA_ENABLE, 32 / sizeof(u16)));
    }

    digit = energy / 1 % 10;
    if (gEnergyDigits.ones != digit)
    {
        gEnergyDigits.ones = digit;
        needUpdate++;

        DMA_SET(3, &sEnergyDigitsGfx[digit * 32], VRAM_OBJ + 0xE40, C_32_2_16(DMA_ENABLE, 32 / sizeof(u16)));
    }

    if (!needUpdate)
        return;

    if (energy < 30)
        gEquipment.lowHealth = TRUE;
    else
        gEquipment.lowHealth = FALSE;

    if (maxHundreds > 9)
    {
        DMA_SET(3, &sEnergyTanksGfx_Empty[10 * 256], VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, 160 / sizeof(u16)));

        if (maxHundreds > 10)
        {
            DMA_SET(3, &sEnergyTanksGfx_Empty[(maxHundreds - 10) * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 160 / sizeof(u16)));
        }
        else
        {
            DMA_SET(3, &sEnergyTanksGfx_Empty[0 * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 160 / sizeof(u16)));
        }
    }
    else if (maxHundreds != 0)
    {
        DMA_SET(3, &sEnergyTanksGfx_Empty[0 * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 160 / sizeof(u16)));
        DMA_SET(3, &sEnergyTanksGfx_Empty[maxHundreds * 256], VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, 160 / sizeof(u16)));
    }
    else
    {
        DMA_SET(3, &sEnergyTanksGfx_Empty[0 * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 16 * 5));
        DMA_SET(3, &sEnergyTanksGfx_Empty[0 * 256], VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, 16 * 5));
    }

    if (currentHundreds > 9)
    {
        DMA_SET(3, &sEnergyTanksGfx_Full[4 * 256], VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, 16 * 5));
    }
    switch (currentHundreds)
    {
        case 1:
            if (maxHundreds >= 2)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            break;

        case 3:
            if (maxHundreds >= 4)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xE80, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xE80, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }

        case 2:
            DMA_SET(3, &sEnergyTanksGfx_Full[0 * 256], VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, 16 * 1));
            break;

        case 5:
            if (maxHundreds >= 6)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xEA0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xEA0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }

        case 4:
            DMA_SET(3, &sEnergyTanksGfx_Full[1 * 256], VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, 16 * 2));
            break;

        case 7:
            if (maxHundreds >= 8)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xEC0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xEC0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }

        case 6:
            DMA_SET(3, &sEnergyTanksGfx_Full[2 * 256], VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, 16 * 3));
            break;

        case 9:
            if (maxHundreds >= 10)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xEE0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xEE0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }

        case 8:
            DMA_SET(3, &sEnergyTanksGfx_Full[3 * 256], VRAM_OBJ + 0xE60, C_32_2_16(DMA_ENABLE, 16 * 4));
            break;

        case 11:
            if (maxHundreds >= 12)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            break;

        case 13:
            if (maxHundreds >= 14)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xA80, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xA80, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }

        case 12:
            DMA_SET(3, &sEnergyTanksGfx_Full[0 * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 16 * 1));
            break;

        case 15:
            if (maxHundreds >= 16)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xAA0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xAA0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }

        case 14:
            DMA_SET(3, &sEnergyTanksGfx_Full[1 * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 16 * 2));
            break;

        case 17:
            if (maxHundreds >= 18)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xAC0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xAC0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }

        case 16:
            DMA_SET(3, &sEnergyTanksGfx_Full[2 * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 16 * 3));
            break;

        case 19:
            if (maxHundreds >= 20)
            {
                DMA_SET(3, sEnergyTankGfx_OneFullOneEmpty, VRAM_OBJ + 0xAE0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }
            else
            {
                DMA_SET(3, sEnergyTankGfx_OneFull, VRAM_OBJ + 0xAE0, C_32_2_16(DMA_ENABLE, sizeof(sEnergyTankGfx_OneFullOneEmpty) / sizeof(u16)));
            }

        case 18:
            DMA_SET(3, &sEnergyTanksGfx_Full[3 * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 16 * 4));
            break;

        case 20:
            DMA_SET(3, &sEnergyTanksGfx_Full[4 * 256], VRAM_OBJ + 0xA60, C_32_2_16(DMA_ENABLE, 16 * 5));
            break;
    }
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
