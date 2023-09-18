#include "sub_event_and_music.h"

#include "constants/event.h"

#include "structs/event.h"

/**
 * @brief 700bc | 38 | Updates the sub event counter for an SA-X encounter
 * 
 */
void SubEventUpdateForSaXEncounter(void)
{
    u16 subCounter;

    subCounter = 0;

    if (gEventCounter == EVENT_HIGH_JUMP_ABILITY_RECOVERED)
        subCounter = 0x28;
    else if (gEventCounter == EVENT_NOC_SA_X_ENCOUNTER)
        subCounter = 0x44;
    else if (gEventCounter == EVENT_ARC_SA_X_ENCOUNTER)
        subCounter = 0x5C;

    if (subCounter != 0)
    {
        gSubEventCounter = subCounter;
        SubEventUpdateMusic(SUB_EVENT_TRIGGER_TYPE_SA_X_ENCOUNTER);
    }
}

void SubEventUpdateForAbility(void)
{

}

void SubEventUpdateForNavCounversation(void)
{

}

void SubEventUpdate(u8 subEvent, u8 triggerType)
{

}

void SubEventUpdateMusic(u8 triggerType)
{

}
