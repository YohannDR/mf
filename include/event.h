#ifndef EVENT_H
#define EVENT_H

#include "types.h"

void EventSet(u8 event);
u8 EventCheckPlayCutsceneDuringTransition(u8 dstRoom);
void EventCheckUpdateAfterCutscene(void);
void EventCheckRoomHasEventTrigger(u8 room);
void EventCheckRoomEventTrigger(void);
u8 EventCheckSetNavigationRoomEvent(void);
u8 EventCheckDownloadedDataItem(u8 setEvent);
u8 EventCheckUnlockSecurityLevel(u8 unlock);

#endif /* EVENT_H */
