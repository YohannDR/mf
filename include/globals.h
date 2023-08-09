#ifndef GLOBALS_H
#define GLOBALS_H

#include "types.h"

extern u8 gRebootGame;
extern u8 gClearedEveryFrame;
extern vu16 gVBlankRequestFlag;
extern s16 gMainGameMode;
extern u16 gSubGameMode1;
extern s8 gSubGameMode2;

extern u8 gFrameCounter8Bit;
extern u16 gFrameCounter16Bit;
extern s8 gPauseScreenFlag;
extern u8 gCurrentCutscene;
extern u8 gUnk_03000be3;
extern u8 gUnk_03001242;

#define GAME_MODE_TITLE 0
#define GAME_MODE_IN_GAME 1
#define GAME_MODE_SOFT_RESET 2
#define GAME_MODE_MAP_SCREEN 3
#define GAME_MODE_CUTSCENE 4
#define GAME_MODE_SA_X_CLOSE_UP 5
#define GAME_MODE_ERASE_SRAM_MENU 6
#define GAME_MODE_FILE_SELECT_OR_INTRO 7
#define GAME_MODE_GAME_OVER 8
#define GAME_MODE_ENDING 9
#define GAME_MODE_DIED_FROM_SR388_COLLISION 10
#define GAME_MODE_CREDITS 11
#define GAME_MODE_DEMO 12
#define GAME_MODE_UNKNOWN 13
#define GAME_MODE_DEBUG 14

#endif /* GLOBALS_H */
