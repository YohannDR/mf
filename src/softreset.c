#include "softreset.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

/**
 * @brief 8b0 | 4 | V-blank for a softreset
 * 
 */
void Softreset_VBlank(void)
{
    return;
}

/**
 * @brief 8b4 | 34 | Checks if a softreset should happen
 * 
 */
void SoftresetCheck(void)
{
    if (gMainGameMode != GAME_MODE_SOFT_RESET && !gDisableSoftReset && (gButtonInput & SOFTRESET_KEYS) == SOFTRESET_KEYS)
        gMainGameMode = GAME_MODE_SOFT_RESET;
}

/**
 * @brief 8e8 | 4 |Empty function
 * 
 */
void Softreset_Empty(void)
{
    return;
}

/**
 * @brief 8ec | 100 | Performs a softreset
 * 
 */
void SoftReset(void)
{
    write16(REG_IME, FALSE);

    write16(REG_DISPSTAT, read16(REG_DISPSTAT) & ~DSTAT_IF_HBLANK);
    write16(REG_IE, read16(REG_IE) & ~IF_HBLANK);

    write16(REG_IME, TRUE);

    HazeTransferAndDeactivate();

    SET_BACKDROP_COLOR(COLOR_BLACK);

    write16(REG_DISPCNT, 0);
    write16(REG_BLDY, 16);
    write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET |BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);

    unk_3114();

    write16(REG_IME, FALSE);

    dma_fill32(3, 0, EWRAM_BASE, EWRAM_SIZE);
    dma_fill32(3, 0, IWRAM_BASE, IWRAM_SIZE - 0x200);

    ClearGfxRam();
    LoadInterruptCode();
    CallbackSetVBlank(Softreset_VBlank);

    Sram_ReadAll();

    write16(REG_IME, TRUE);
    InitializeAudio();

    gMainGameMode = GAME_MODE_TITLE;
    gSubGameMode1 = 0;
    gSubGameMode2 = 0;
    gRebootGame = FALSE;
    gUnk_03000B8F = 0;
    
    gButtonInput = KEY_NONE;
    gButtonInputCopy = KEY_NONE;
    gChangedInput = KEY_NONE;
}
