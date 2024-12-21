#ifndef EVENT_DATA_H
#define EVENT_DATA_H

#include "constants/connection.h"
#include "constants/menus/pause_screen.h"
#include "constants/event.h"
#include "constants/samus.h"

#include "structs/event.h"

extern const struct EventLocationAndNavigationInfo sEventLocationAndNavigationInfo[EVENT_END];

extern const u8 sNumberOfTanksPerArea[AREA_NORMAL_END + 1][3];

extern const u8 sObtainItemEvents[ABILITY_COUNT_END];
extern const struct AbilityRamValue sAbilityRamValues[ABILITY_COUNT_END];

extern const u8 sAreaNavigationRoomPairs[NAV_ROOM_END + 1][2];

extern const u8 sAreasOfSubAreas[SUB_AREA_END];
extern const u8 sSubAreasOfSectors[AREA_END];

extern const u8 sUnk_57607d[SUB_AREA_END];
extern const u8 sUnk_57608a[SUB_AREA_END];

extern const struct MonologueEvent sMonologueEvents[6];
extern const struct SecurityUnlockEvent sSecurityUnlockEvents[SECURITY_LEVEL_END - 1];

extern const u8 sSubAreasOfMainDeckRooms[];

#endif /* EVENT_DATA_H */
