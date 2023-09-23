#ifndef DEBUG_MENU_DATA_H
#define DEBUG_MENU_DATA_H

#include "types.h"
#include "oam.h"

#include "constants/event.h"
#include "constants/menus/debug_menu.h"

#define DEBUG_SECTION_INFO_TOP(section) (sDebugSectionInfo[(section)][0])
#define DEBUG_SECTION_INFO_BOTTOM(section) (sDebugSectionInfo[(section)][1])
#define DEBUG_SECTION_INFO_LEFT(section) (sDebugSectionInfo[(section)][2])
#define DEBUG_SECTION_INFO_RIGHT(section) (sDebugSectionInfo[(section)][3])
#define DEBUG_SECTION_INFO_SECTION(section) (sDebugSectionInfo[(section)][4])
#define DEBUG_SECTION_INFO_HSIZE(section) (DEBUG_SECTION_INFO_RIGHT((section)) - DEBUG_SECTION_INFO_LEFT((section)))

extern const u8 sDebugMenuBeamFlags[5];
extern const u8 sDebugMenuMissileFlags[4];
extern const u8 sDebugMenuBombFlags[2];
extern const u8 sDebugMenuSuitFlags[2];
extern const u8 sDebugMenuMiscFlags[5];

extern const u8 sStatusScreenSectionSizes[5];

extern const u16 sDebugMenuNumbersIncrementValues[5];
extern const u16 sDebugMenuNumbersMaxValues[3];

// ... 

#define EVENT_NAME_SIZE 28
extern const u8 sDebugMenuEventNames[EVENT_END][EVENT_NAME_SIZE];

extern const u8 sDebugLocationSectionInfo[2][2];
extern const u8 sDebugSectionInfo[DEBUG_SECTION_END][5];

#endif /* DEBUG_MENU_DATA_H */
