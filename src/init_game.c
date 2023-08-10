#include "globals.h"
#include "gba.h"
#include "macros.h"

void Softreset_VBlank(void);

/**
 * @brief 798 | 118 | Initializes the game
 * 
 */
void InitializeGame(void)
{
    write16(REG_DISPCNT, DCNT_BLANK);
    write16(REG_DISPSTAT, 0);
    write16(REG_IME, FALSE);

    dma_fill32(3, 0, EWRAM_BASE, EWRAM_SIZE);
    dma_fill32(3, 0, IWRAM_BASE, IWRAM_SIZE - 0x200);

    ClearGfxRam();
    LoadInterruptCode();
    SetVBlankCodePointer(Softreset_VBlank);

    unk_7eea4();

    write16(REG_IME, TRUE);
    InitializeAudio();

    write16(REG_IE, 0x2401);
    write16(REG_DISPSTAT, DSTAT_IF_VBLANK);
    write16(REG_WAITCNT, 0x45B4);

    gSubGameMode1 = 0;
    gSubGameMode2 = 0;

    gButtonInput = KEY_NONE;
    gButtonInputCopy = KEY_NONE;
    gChangedInput = KEY_NONE;

    UpdateInput();

    if (gChangedInput == (KEY_R | KEY_L))
    {
        gMainGameMode = GAME_MODE_ERASE_SRAM_MENU;
    }
    else
    {
        gMainGameMode = GAME_MODE_TITLE;
        gDebugFlag = FALSE;
    }

    gButtonInput = KEY_NONE;
    gButtonInputCopy = KEY_NONE;
    gChangedInput = KEY_NONE;

    gDisableSoftReset = FALSE;
}
