#ifndef LOCATION_TEXT_H
#define LOCATION_TEXT_H

#include "types.h"

enum LocationText {
    LT_MAIN_DECK,
    LT_SECTOR_1,
    LT_SECTOR_2,
    LT_SECTOR_3,
    LT_SECTOR_4,
    LT_SECTOR_5,
    LT_SECTOR_6,
    LT_REACTOR_SILO,
    LT_RESTRICTED_ZONE,
    LT_OPERATIONS_DECK,
    LT_HABITATIONS_DECK,
    LT_DOCKING_BAY,
    LT_NAVIGATION_ROOM,
    LT_DATA_ROOM,
    LT_SECURITY_ROOM,
    LT_RECHARGE_ROOM,
    LT_SAVE_ROOM,
    LT_OPERATIONS_ROOM,
    LT_QUARANTINE_BAY,
    LT_SUB_ZERO_CONTAINMENT,
    LT_CENTRAL_REACTOR_CORE,
    LT_AUXILARY_POWER_STATION,
    LT_RESTRICTED_LABORATORY,
    LT_PUMP_CONTROL_UNIT,
    LT_MAIN_BOILER,
    LT_MAIN_BOILER_CONTROL_ROOM,

    LT_END,
};

u8 LocationTextGetMainDeck(void);
u8 LocationTextGetSector1(void);
u8 LocationTextGetSector2(void);
u8 LocationTextGetSector3(void);
u8 LocationTextGetSector5(void);
u8 LocationTextGetSector4(void);
u8 LocationTextGetSector6(void);
u8 LocationTextLoadGfx(void);
u8 LocationTextCheckLoad(void);

#endif /* LOCATION_TEXT_H */
