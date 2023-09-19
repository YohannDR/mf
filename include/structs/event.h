#ifndef EVENT_STRUCTS_H
#define EVENT_STRUCTS_H

#include "types.h"

struct AbilityRamValue {
    u8 beamStatus;
    u8 weaponStatus;
    u8 suitStatus;
    u8 isSuit;
    u8 messageNumber;
    u16 subEvent;
};

extern u8 gAbilityCount;
extern u8 gEventCounter;
extern u8 gPreviousNavigationConversation;
extern u8 gPreviousCutscene;
extern u8 gRoomEventTrigger;

extern u16 gSubEventCounter;
extern u16 gPreviousSubEvent;

extern s8 gDoorUnlockTimer;

#endif /* EVENT_STRUCTS_H */
