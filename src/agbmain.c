#include "globals.h"

/**
 * @brief 230 | 568 | Main game loop
 * 
 */
void AgbMain(void)
{
    InitializeGame();

    while (TRUE)
    {
        gClearedEveryFrame = 0;
        UpdateAudio();

        if (gRebootGame)
            break;

        UpdateInput();
        SoftResetCheck();

        gFrameCounter8Bit++;
        gFrameCounter16Bit++;

        switch (gMainGameMode)
        {
            case GAME_MODE_TITLE:
                if (gSubGameMode2 == 0)
                {
                    if (SetLanguage(0))
                    {
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 1;
                    }
                }
                else if (gSubGameMode2 == 1)
                {
                    if (unk_87610())
                    {
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 4;
                    }
                }
                else if (gSubGameMode2 == 2)
                {
                    gPauseScreenFlag = unk_86854();

                    if (gPauseScreenFlag == 1)
                    {
                        gMainGameMode = GAME_MODE_FILE_SELECT_OR_INTRO;
                        gPauseScreenFlag = 0;
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 0;
                    }
                    else if (gPauseScreenFlag == 2)
                    {
                        gPauseScreenFlag = 0;
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 3;
                    }
                    else if (gPauseScreenFlag == 100)
                    {
                        unk_718cc();
                        gSubGameMode1 = 0;
                        gMainGameMode = GAME_MODE_DEMO;
                        gPauseScreenFlag = 0;
                    }
                }
                else if (gSubGameMode2 == 3)
                {
                    if (SetLanguage(1))
                    {
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 1;
                    }
                }
                else if (gSubGameMode2 == 4)
                {
                    gPauseScreenFlag = TitleScreenSubroutine();

                    if (gPauseScreenFlag == 1)
                    {
                        gMainGameMode = GAME_MODE_FILE_SELECT_OR_INTRO;
                        gPauseScreenFlag = 0;
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 0;
                    }
                    else if (gPauseScreenFlag == 2)
                    {
                        gPauseScreenFlag = 0;
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 3;
                    }
                    else if (gPauseScreenFlag == 100)
                    {
                        unk_718cc();
                        gSubGameMode1 = 0;
                        gMainGameMode = GAME_MODE_DEMO;
                        gPauseScreenFlag = 0;
                    }
                }
                break;

            case GAME_MODE_FILE_SELECT_OR_INTRO:
                if (gSubGameMode2 == 0)
                {
                    gPauseScreenFlag = unk_9e598();

                    if (gPauseScreenFlag == 1)
                    {
                        gPauseScreenFlag = 0;
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 1;
                    }
                    else if (gPauseScreenFlag == 2)
                    {
                        gMainGameMode = GAME_MODE_IN_GAME;
                        gPauseScreenFlag = 0;
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 0;
                    }
                    else if (gPauseScreenFlag == 3)
                    {
                        gMainGameMode = GAME_MODE_TITLE;
                        gPauseScreenFlag = 0;
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 1;
                    }
                }
                else if (gSubGameMode2 == 1)
                {
                    if (NewFileIntro())
                    {
                        gMainGameMode = GAME_MODE_MAP_SCREEN;
                        gPauseScreenFlag = 1;
                        gSubGameMode1 = 0;
                        gSubGameMode2 = 0;
                    }
                }
                break;

            case GAME_MODE_IN_GAME:
                if (InGameSubroutine())
                {
                    if (gPauseScreenFlag != 0)
                    {
                        if (gPauseScreenFlag == 6)
                            gMainGameMode = GAME_MODE_SA_X_CLOSE_UP;
                        else
                            gMainGameMode = GAME_MODE_MAP_SCREEN;
                    }
                    else
                    {
                        if (gCurrentCutscene != 0)
                        {
                            if (gCurrentCutscene & 0x80)
                            {
                                if (gCurrentCutscene == 0x81)
                                    gMainGameMode = GAME_MODE_DIED_FROM_SR388_COLLISION;
                                else
                                    gMainGameMode = GAME_MODE_ENDING;
                            }
                            else
                                gMainGameMode = GAME_MODE_CUTSCENE;

                            gSubGameMode1 = 0;
                        }
                        else
                        {
                            gMainGameMode = GAME_MODE_TITLE;
                            gSubGameMode1 = 0;
                        }
                    }
                }
                break;

            case GAME_MODE_MAP_SCREEN:
                if (unk_765f8())
                {
                    switch (gPauseScreenFlag)
                    {
                        case 4:
                            gPauseScreenFlag = 0;
                            gMainGameMode = GAME_MODE_IN_GAME;
                            break;

                        case 5:
                            gMainGameMode = GAME_MODE_CUTSCENE;
                            break;

                        case 1:
                            gMainGameMode = GAME_MODE_IN_GAME;
                            gPauseScreenFlag = 0;
                            gUnk_03000be3 = 0;
                            break;

                        case 2:
                        case 3:
                        case 6:
                        default:
                            gMainGameMode = GAME_MODE_IN_GAME;
                    }

                    gSubGameMode1 = 0;
                }
                break;

            case GAME_MODE_SOFT_RESET:
                SoftReset();
                break;

            case GAME_MODE_CUTSCENE:
                if (unk_9994c())
                {
                    if (gSubGameMode2 != 0)
                    {
                        gMainGameMode = GAME_MODE_DEBUG;
                    }
                    else
                    {
                        switch (gCurrentCutscene)
                        {
                            case 9:
                                gPauseScreenFlag = 4;
                                gMainGameMode = GAME_MODE_MAP_SCREEN;
                                break;
                            
                            case 11:
                            case 12:
                                gMainGameMode = GAME_MODE_GAME_OVER;
                                gPauseScreenFlag = 0;
                                break;

                            default:
                                gMainGameMode = GAME_MODE_IN_GAME;
                        }
                        gSubGameMode1 = 0;
                    }
                    gSubGameMode2 = 0;
                }
                break;

            case GAME_MODE_SA_X_CLOSE_UP:
                if (unk_9db74())
                {
                    gMainGameMode = GAME_MODE_IN_GAME;
                    gSubGameMode1 = 0;
                }
                break;

            case GAME_MODE_ERASE_SRAM_MENU:
                if (EraseSramMenuSubroutine())
                {
                    if (gSubGameMode2 == 1)
                        gRebootGame = 2;
                    else
                        gMainGameMode = GAME_MODE_TITLE;

                    gSubGameMode1 = 0;
                    gSubGameMode2 = 0;
                }
                break;

            case GAME_MODE_GAME_OVER:
                gSubGameMode2 = unk_9deb4();
                if (gSubGameMode2 == 1)
                {
                    if (unk_80968())
                    {
                        gMainGameMode = GAME_MODE_IN_GAME;
                        gPauseScreenFlag = 0;
                    }
                    else
                    {
                        gMainGameMode = GAME_MODE_MAP_SCREEN;
                        gPauseScreenFlag = 1;
                    }

                    gUnk_03000be3 = 0;
                    gCurrentCutscene = 0;
                    gSubGameMode1 = 0;
                }
                else if (gSubGameMode2 == 2)
                {
                    gMainGameMode = GAME_MODE_SOFT_RESET;
                }
                gSubGameMode2 = 0;
                break;

            case GAME_MODE_ENDING:
                if (unk_94e84())
                {
                    gMainGameMode = GAME_MODE_CREDITS;
                    gSubGameMode1 = 0;
                }
                break;

            case GAME_MODE_DIED_FROM_SR388_COLLISION:
                if (DiedFromSr388CollisionSubroutine())
                {
                    gMainGameMode = GAME_MODE_GAME_OVER;
                    gSubGameMode1 = 0;
                }
                break;

            case GAME_MODE_CREDITS:
                if (unk_a1c84())
                    gMainGameMode = GAME_MODE_SOFT_RESET;
                break;

            case GAME_MODE_DEMO:
                if (InGameSubroutine())
                {
                    gPauseScreenFlag = 0;
                    gUnk_03000be3 = 0;
                    gSubGameMode1 = 0;

                    if (gUnk_03001242 == 0)
                    {
                        gMainGameMode = GAME_MODE_TITLE;
                    }
                    else
                    {
                        unk_718cc();
                        gMainGameMode = GAME_MODE_DEMO;
                    }
                }
                break;

            case GAME_MODE_UNKNOWN:
                if (unk_87920())
                {
                    if (gSubGameMode2 != 0)
                        gMainGameMode = GAME_MODE_DEBUG;

                    gSubGameMode2 = 0;
                }
                break;

            case GAME_MODE_DEBUG:
                break;
        }

        gVBlankRequestFlag &= ~1;
        do {
            asm("swi #2");
        } while (!(gVBlankRequestFlag & 1));
    }
}
