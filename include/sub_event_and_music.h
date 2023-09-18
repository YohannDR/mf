#ifndef SUB_EVENT_AND_MUSIC_H
#define SUB_EVENT_AND_MUSIC_H

#include "types.h"

void SubEventUpdateForSaXEncounter(void);
void SubEventUpdateForAbility(void);
void SubEventUpdateForNavCounversation(void);
void SubEventUpdate(u8 subEvent, u8 triggerType);
void SubEventUpdateMusic(u8 triggerType);

#endif /* SUB_EVENT_AND_MUSIC_H */
