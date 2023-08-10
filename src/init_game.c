#include "globals.h"
#include "gba.h"
#include "macros.h"

#include "softreset.h"

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

    write16(REG_IE, IF_VBLANK | IF_DMA2 | IF_GAMEPAK);
    write16(REG_DISPSTAT, DSTAT_IF_VBLANK);
    write16(REG_WAITCNT, WAIT_SRAM_4CYCLES | WAIT_BANK0_3CYCLES
        | WAIT_BANK0_SUBSEQUENT_1CYCLE
        | WAIT_BANK1_3CYCLES | WAIT_BANK1_SUBSEQUENT_1CYCLE
        | WAIT_BANK2_3CYCLES | WAIT_BANK2_SUBSEQUENT_1CYCLE
        | WAIT_GAMEPACK_CGB);

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
