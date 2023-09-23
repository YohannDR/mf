#ifndef GLOBALS_H
#define GLOBALS_H

#include "types.h"
#include "structs/menus/pause_screen.h"

union NonGameplayRam {
    struct PauseScreenData pauseScreen;
};

extern union NonGameplayRam gNonGameplayRam;

#define PAUSE_SCREEN_DATA gNonGameplayRam.pauseScreen

extern u8 gRebootGame;
extern u8 gClearedEveryFrame;
extern vu16 gVBlankRequestFlag;
extern s16 gMainGameMode;
extern s16 gSubGameMode1;
extern s8 gSubGameMode2;

extern u8 gFrameCounter8Bit;
extern u16 gFrameCounter16Bit;
extern s8 gPauseScreenFlag;
extern u8 gCurrentCutscene;
extern s8 gIsLoadingFile;
extern s8 gUnk_03000be3;
extern u8 gDemoState;
extern u8 gUnk_03000B8F;
extern u8 gUnk_03000064;

extern u8 gCurrentEventBasedEffect;
extern u8 gCurrentEventBasedEffectCopy;

extern u8 gDebugFlag;
extern u16 gButtonInput;
extern u8 gNotPressingUp;
extern u16 gButtonInputCopy;
extern u16 gChangedInput;
extern u8 gDisableSoftReset;

extern u16 gBg1XPosition;
extern u16 gBg1YPosition;

extern u8 gCurrentArea;
extern u8 gPreviousArea;
extern u8 gDestinationDoor;
extern u8 gCurrentRoom;
extern u8 gLastDoorUsed;
extern u8 gCurrentNavigationRoom;
extern u8 gLastElevatorUsed;
extern u8 gSpritesetNumber;

extern u8 gDisplayLocationName;

extern u8 gSamusOnTopOfBackgrounds;

extern u16 gWrittenToBldcnt;
extern u16 gWrittenToBldy;
extern u8 gDisableScrolling;

extern u8 gInterruptCode[512];
extern void* gInterruptCodePointer;

struct BackgroundPositions {
    struct RawCoordsX bg[4];
    struct RawCoordsX doorTransition;
};

extern struct BackgroundPositions gBackgroundPositions;

struct BackgroundsData {
    struct {
        u16* pDecomp;
        u16 width;
        u16 height;
    } backgrounds[3];
    u16* pClipDecomp;
    u16 clipdataWidth;
    u16 clipdataHeight;
};

extern struct BackgroundsData gBackgroundsData;

struct Haze {
    void* pAffected;
    u16 unk_4;
    u8 size;
    u8 enabled:7;
    u8 active:1;
};

extern struct Haze gHazeInfo;

extern u16 gBackdropColor;
extern u8 gMaxInGameTimeFlag;

struct InGameTime {
    u8 hours;
    u8 minutes;
    u8 seconds;
    u8 frames;
};

extern struct InGameTime gInGameTimer;

enum Area {
    AREA_MAIN_DECK,
    AREA_SECTOR_1,
    AREA_SECTOR_2,
    AREA_SECTOR_3,
    AREA_SECTOR_4,
    AREA_SECTOR_5,
    AREA_SECTOR_6,

    AREA_NORMAL_END = AREA_SECTOR_6,

    AREA_DEBUG_1,
    AREA_DEBUG_2,
    AREA_DEBUG_3,
};

enum NavigationRoom {
    NAV_ROOM_MAIN_DECK_ROOM_0,
    NAV_ROOM_MAIN_DECK_ROOM_16,
    NAV_ROOM_MAIN_DECK_ROOM_9,
    NAV_ROOM_MAIN_DECK_ROOM_32,
    NAV_ROOM_SECTOR_1_ROOM_2,
    NAV_ROOM_SECTOR_2_ROOM_2,
    NAV_ROOM_SECTOR_3_ROOM_2,
    NAV_ROOM_SECTOR_4_ROOM_2,
    NAV_ROOM_SECTOR_5_ROOM_2,
    NAV_ROOM_SECTOR_6_ROOM_2,
    NAV_ROOM_MAIN_DECK_ROOM_56,
    NAV_ROOM_MAIN_DECK_ROOM_66,
};

enum Elevator {
    ELEVATOR_MAIN_DECK_TO_OPERATIONS_DECK,
    ELEVATOR_MAIN_DECK_TO_LOBBY,
    ELEVATOR_MAIN_DECK_TO_SECTOR_1,
    ELEVATOR_MAIN_DECK_TO_SECTOR_2,
    ELEVATOR_MAIN_DECK_TO_SECTOR_3,
    ELEVATOR_MAIN_DECK_TO_SECTOR_4,
    ELEVATOR_MAIN_DECK_TO_SECTOR_5,
    ELEVATOR_MAIN_DECK_TO_SECTOR_6,
    ELEVATOR_MAIN_DECK_TO_LOBBY_POWER_OUTAGE,
    ELEVATOR_MAIN_DECK_TO_HABITATIONS_DECK,
    ELEVATOR_RESTRICTED_ZONE_TO_SECTOR_1,
};

enum Cutscene {
    CUTSCENE_NONE,
    CUTSCENE_MONOLOGUE_INTRO,
    CUTSCENE_ELEVATOR_MONOLOGUE_REMIND,
    CUTSCENE_ELEVATOR_MONOLOGUE_TRUST,
    CUTSCENE_ELEVATOR_MONOLOGUE_SA_X,
    CUTSCENE_ELEVATOR_MONOLOGUE_ANIMALS,
    CUTSCENE_ELEVATOR_MONOLOGUE_INCIDENT,
    CUTSCENE_MONOLOGUE_FEDERATION,
    CUTSCENE_MONOLOGUE_END,
    CUTSCENE_SECRET_CONVERSATION,
    CUTSCENE_RESTRICTED_LAB_DETACHING,
    CUTSCENE_RESTRICTED_LAB_DETACHING_DYING,
    CUTSCENE_BSL_EXPLODING,

    CUTSCENE_END,
};

struct IoRegisters {
    u16 dispcnt;
    u16 bldcnt;
    u8 bldalpha_eva;
    u8 bldalpha_evb;
    u8 winin_L;
    u8 winin_R;
    u16 bg0Cnt;
    u16 bg1Cnt;
    u16 bg2Cnt;
    u16 bg3Cnt;
};

extern struct IoRegisters gIoRegisters;

extern u16 gEffectYPosition;

struct CurrentAffectingClipdata {
    u16 movement;
    u16 hazard;
};

extern struct CurrentAffectingClipdata gCurrentAffectingClipdata;

struct ButtonAssignments {
    u16 armMissiles;
    u16 diagonalAim;
    u16 swapMissiles;
    u16 pause;
};

extern struct ButtonAssignments gButtonAssignments;

extern u8 gWhichBgPositionIsWrittenToBg3Ofs;

extern u16 gWrittenToMosaic_H;
extern u16 gWrittenToMosaic_L;
extern u8 gCurrentClipdataAffectingAction;

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

// For in game

#define SUB_GAME_MODE_DOOR_TRANSITION 1
#define SUB_GAME_MODE_PLAYING 2
#define SUB_GAME_MODE_LOADING_ROOM 3
#define SUB_GAME_MODE_SA_X_ELEVATOR 4
#define SUB_GAME_MODE_DYING 5
#define SUB_GAME_MODE_FREE_MOVEMENT 6

#endif /* GLOBALS_H */
