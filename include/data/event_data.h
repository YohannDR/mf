#ifndef EVENT_DATA_H
#define EVENT_DATA_H

#include "constants/connection.h"
#include "constants/event.h"
#include "constants/samus.h"

#include "structs/event.h"

extern const struct EventLocationAndNavigationInfo sEventLocationAndNavigationInfo[EVENT_END];

extern const u8 sNumberOfTanksPerArea[AREA_NORMAL_END + 1][3];

extern const u8 sObtainItemEvents[ABILITY_COUNT_END];
extern const struct AbilityRamValue sAbilityRamValues[ABILITY_COUNT_END];

extern const u8 sAreaNavigationRoomPairs[NAV_ROOM_END + 1][2];

// ...

extern const struct MonologueEvent sMonologueEvents[6];
extern const struct SecurityUnlockEvent sSecurityUnlockEvents[SECURITY_LEVEL_END - 1];

#endif /* EVENT_DATA_H */
