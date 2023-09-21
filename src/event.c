#include "event.h"
#include "globals.h"
#include "macros.h"
#include "sub_event_and_music.h"

#include "data/event_data.h"

#include "constants/event.h"
#include "constants/samus.h"

#include "structs/samus.h"

/**
 * @brief 74890 | 318 | Sets the current event
 * 
 * @param event Event
 */
void EventSet(u8 event)
{
    s32 i;

    // Set event
    gEventCounter = event;
    i = FALSE;

    // Apply special behavior if necessary (security hatches, or ability/download)
    switch (event)
    {
        case EVENT_NONE:
            if (gPauseScreenFlag != 0)
            {
                // Set no hatches
                gEquipment.securityHatchLevel = SECURITY_LEVEL_NO_HATCHES;
                i = TRUE;
            }
            break;

        case EVENT_NAVIGATION_ROOM_AFTER_QUARANTINE_BAY:
            // Unlock normal hatches
            gEquipment.securityHatchLevel = SECURITY_LEVEL_0;
            gSecurityHatchLevel = SECURITY_LEVEL_0;
            break;

        case EVENT_SECURITY_LEVEL_1_UNLOCKED:
            // Unlock level 1 hatches
            gEquipment.securityHatchLevel = sSecurityUnlockEvents[SECURITY_LEVEL_1 - 1].securityLevel;
            SubEventUpdate(sSecurityUnlockEvents[SECURITY_LEVEL_1 - 1].subEvent, SEVENT_TTYPE_UNLOCKING_SECURITY);
            break;

        case EVENT_SECURITY_LEVEL_2_UNLOCKED:
            // Unlock level 2 hatches
            gEquipment.securityHatchLevel = sSecurityUnlockEvents[SECURITY_LEVEL_2 - 1].securityLevel;
            SubEventUpdate(sSecurityUnlockEvents[SECURITY_LEVEL_2 - 1].subEvent, SEVENT_TTYPE_UNLOCKING_SECURITY);
            break;

        case EVENT_SECURITY_LEVEL_3_UNLOCKED:
            // Unlock level 3 hatches
            gEquipment.securityHatchLevel = sSecurityUnlockEvents[SECURITY_LEVEL_3 - 1].securityLevel;
            SubEventUpdate(sSecurityUnlockEvents[SECURITY_LEVEL_3 - 1].subEvent, SEVENT_TTYPE_UNLOCKING_SECURITY);
            break;

        case EVENT_SECURITY_LEVEL_4_UNLOCKED:
            // Unlock level 4 hatches
            gEquipment.securityHatchLevel = sSecurityUnlockEvents[SECURITY_LEVEL_4 - 1].securityLevel;
            SubEventUpdate(sSecurityUnlockEvents[SECURITY_LEVEL_4 - 1].subEvent, SEVENT_TTYPE_UNLOCKING_SECURITY);
            break;

        case EVENT_ENGAGED_TRO_2_SA_X:
            SubEventUpdate(SUB_EVENT_113, SEVENT_TTYPE_11);
            break;

        case EVENT_POWER_OUTAGE:
            // Backup the current hatch level
            gSecurityHatchLevelBackup = gEquipment.securityHatchLevel;

            // Set no hatches
            gEquipment.securityHatchLevel = SECURITY_LEVEL_NO_HATCHES;
            gSecurityHatchLevel = SECURITY_LEVEL_NO_HATCHES;
            break;

        case EVENT_PLASMA_BEAM_ABILITY_RECOVERED:
            // Check recover hatches
            if (gSecurityHatchLevelBackup != SECURITY_LEVEL_NO_HATCHES)
            {
                gEquipment.securityHatchLevel = gSecurityHatchLevelBackup;
                gSecurityHatchLevelBackup = SECURITY_LEVEL_NO_HATCHES;

                gCurrentEventBasedEffect = 0x2;
            }

            i = TRUE;
            break;

        case EVENT_MISSILE_DATA_DOWNLOADED:
        case EVENT_MORPH_BALL_ABILITY_RECOVERED:
        case EVENT_CHARGE_BEAM_ABILITY_RECOVERED:
        case EVENT_BOMB_DATA_DOWNLOADED:
        case EVENT_HIGH_JUMP_ABILITY_RECOVERED:
        case EVENT_SPEED_BOOSTER_ABILITY_RECOVERED:
        case EVENT_SUPER_MISSILE_DATA_DOWNLOADED:
        case EVENT_VARIA_SUIT_ABILITY_RECOVERED:
        case EVENT_ICE_MISSILE_DATA_DOWNLOADED:
        case EVENT_WIDE_BEAM_ABILITY_RECOVERED:
        case EVENT_POWER_BOMB_DATA_DOWNLOADED:
        case EVENT_SPACE_JUMP_ABILITY_RECOVERED:
        case EVENT_GRAVITY_SUIT_ABILITY_RECOVERED:
        case EVENT_DIFFUSION_MISSILE_DATA_DOWNLOADED:
        case EVENT_WAVE_BEAM_ABILITY_RECOVERED:
        case EVENT_SCREW_ATTACK_ABILITY_RECOVERED:
        case EVENT_ICE_BEAM_ABILITY_RECOVERED:
            i = TRUE;
    }

    if (i)
    {
        // Try to give ability
        for (i = ARRAY_SIZE(sAbilityRamValues) - 1; i != 0; i--)
        {
            if (gEventCounter != sObtainItemEvents[i])
                continue;

            gAbilityCount = i;

            gEquipment.beamStatus |= sAbilityRamValues[i].beamStatus;
            gEquipment.weaponsStatus |= sAbilityRamValues[i].weaponStatus;

            if (sAbilityRamValues[i].isSuit)
                RecoveringSuitInit();
            else
                gEquipment.suitMiscStatus |= sAbilityRamValues[i].suitStatus;

            SubEventUpdateForAbility();
            break;
        }
    }
}

u8 EventCheckPlayCutsceneDuringTransition(u8 dstRoom)
{

}

/**
 * @brief 74cf4 | 60 | Checks to update the event/sub event after a cutscene
 * 
 */
void EventCheckUpdateAfterCutscene(void)
{
    s32 i;

    // Set previous cutscene
    gPreviousCutscene = gCurrentCutscene;

    // Handle special cases
    if (gCurrentCutscene == CUTSCENE_MONOLOGUE_FEDERATION)
    {
        // Adam and samus conversation
        EventSet(EVENT_END_OF_FIRST_CONVERSATION);
    }

    if (gCurrentCutscene == CUTSCENE_RESTRICTED_LAB_DETACHING)
    {
        SubEventUpdate(SUB_EVENT_142, SEVENT_TTYPE_CUTSCENE_END);
        return;
    }

    // Check update sub event
    for (i = 0; i < ARRAY_SIZE(sMonologueEvents); i++)
    {
        if (gCurrentCutscene != sMonologueEvents[i].cutscene)
            continue;

        if (sMonologueEvents[i].subEventAtEnd != SUB_EVENT_NONE)
            SubEventUpdate(sMonologueEvents[i].subEventAtEnd, SEVENT_TTYPE_CUTSCENE_END);

        break;
    }
}

void EventCheckRoomHasEventTrigger(u8 room)
{
    // https://decomp.me/scratch/6B7IW

    s32 counter;
    s32 i;

    i = gEventCounter + 1;
    gRoomEventTrigger = EVENT_NONE;

    counter = 0;
    while (TRUE)
    {
        if (sEventLocationAndNavigationInfo[i].navRoom == NAV_ROOM_MAIN_DECK_ROOM_0 &&
            !sEventLocationAndNavigationInfo[i].download &&
            gCurrentArea == sEventLocationAndNavigationInfo[i].area &&
            room == sEventLocationAndNavigationInfo[i].room)
        {
            if (sEventLocationAndNavigationInfo[i].xStart == UCHAR_MAX)
                EventSet(i);
            else
                gRoomEventTrigger = i;

            break;
        }

        if (!sEventLocationAndNavigationInfo[i].skippable)
            break;

        i++;
        counter++;
    }

    if (counter != 0)
    {
        i = gEventCounter;
        if (i <= EVENT_NONE)
            return;

        if (sEventLocationAndNavigationInfo[i].navConversation != 0)
        {
            gPreviousNavigationConversation = sEventLocationAndNavigationInfo[i].navConversation;
            return;
        }

        i--;
        while (i > 0)
        {
            if (sEventLocationAndNavigationInfo[i].navConversation != 0)
            {
                gPreviousNavigationConversation = sEventLocationAndNavigationInfo[i].navConversation;
                break;
            }
            i--;
        }
    }
}

/**
 * @brief 74e28 | 84 | Checks for the current room event trigger
 * 
 */
void EventCheckRoomEventTrigger(void)
{
    // Check in range
    if (BLOCK_TO_SUB_PIXEL(sEventLocationAndNavigationInfo[gRoomEventTrigger].xStart) <= gSamusData.xPosition &&
        BLOCK_TO_SUB_PIXEL(sEventLocationAndNavigationInfo[gRoomEventTrigger].xEnd) >= gSamusData.xPosition &&
        BLOCK_TO_SUB_PIXEL(sEventLocationAndNavigationInfo[gRoomEventTrigger].ySart) <= gSamusData.yPosition &&
        BLOCK_TO_SUB_PIXEL(sEventLocationAndNavigationInfo[gRoomEventTrigger].yEnd) >= gSamusData.yPosition)
    {
        // Set room trigger event
        EventSet(gRoomEventTrigger);

        // Clear
        gRoomEventTrigger = EVENT_NONE;

        // Set sub event
        if (gEventCounter == EVENT_RESTRICTED_LABORATORY_EXPLOSION)
        {
            SoundPlay(0xFA);
            SubEventUpdate(SUB_EVENT_139, SEVENT_TTYPE_11);
            return;
        }

        if (gEventCounter == EVENT_RESTRICTED_ZONE_WARNING)
        {
            SubEventUpdate(SUB_EVENT_133, SEVENT_TTYPE_11);
            return;
        }

        if (gEventCounter == EVENT_TRIGGERED_BOX_2_RUMBLE)
        {
            SubEventUpdate(SUB_EVENT_134, SEVENT_TTYPE_11);
            return;
        }
    }
}

/**
 * @brief 74eac | 84 | Checks to update the event/sub event for a navigation conversation
 * 
 * @return u8 bool, downloading map
 */
u8 EventCheckSetNavigationRoomEvent(void)
{
    u8 downloadMap;
    u32 areaBit;

    downloadMap = FALSE;

    if (sEventLocationAndNavigationInfo[gEventCounter + 1].navRoom != NAV_ROOM_MAIN_DECK_ROOM_0)
    {
        if (sAreaNavigationRoomPairs[sEventLocationAndNavigationInfo[gEventCounter + 1].navRoom][0] == gCurrentArea ||
            sAreaNavigationRoomPairs[sEventLocationAndNavigationInfo[gEventCounter + 1].navRoom][0] == UCHAR_MAX)
        {
            if (sAreaNavigationRoomPairs[sEventLocationAndNavigationInfo[gEventCounter + 1].navRoom][1] - 1 == gCurrentRoom ||
                sAreaNavigationRoomPairs[sEventLocationAndNavigationInfo[gEventCounter + 1].navRoom][1] == UCHAR_MAX)
            {
                EventSet(gEventCounter + 1);
            }
        }
    }

    // Get bit for the map
    areaBit = 1 << gCurrentArea;

    // Check doesn't have map
    if (!(gEquipment.downloadedMaps & areaBit))
    {
        // Give map
        gEquipment.downloadedMaps |= areaBit;
        downloadMap = TRUE;
    }

    return downloadMap;
}

/**
 * @brief 74f30 | 40 | Checks to update the event/sub event for a download
 * 
 * @param setEvent Set event
 * @return u8 bool, was downloaded
 */
u8 EventCheckDownloadedDataItem(u8 setEvent)
{
    u8 downloaded;

    downloaded = FALSE;

    if (sEventLocationAndNavigationInfo[gEventCounter + 1].download)
    {
        if (setEvent)
            EventSet(gEventCounter + 1);

        downloaded = TRUE;
    }

    return downloaded;
}

/**
 * @brief 74f70 | 8c | Checks to update the event/sub event for security level unlock
 * 
 * @param unlock Unlock security level
 * @return u8 Current security level
 */
u8 EventCheckUnlockSecurityLevel(u8 unlock)
{
    s32 currentLevel;
    s32 actualLevel;
    s32 i;

    currentLevel = gEquipment.securityHatchLevel;

    if (currentLevel == SECURITY_LEVEL_NO_HATCHES)
        currentLevel = SECURITY_LEVEL_0;

    actualLevel = SECURITY_LEVEL_0;

    for (i = 0; i < ARRAY_SIZE(sSecurityUnlockEvents); i++)
    {
        if (gCurrentArea == sSecurityUnlockEvents[i].area)
        {
            actualLevel = sSecurityUnlockEvents[i].securityLevel;
            break;
        }
    }

    if (currentLevel >= actualLevel)
        return SECURITY_LEVEL_0;

    if (gEventCounter == sSecurityUnlockEvents[i].previousEvent)
    {
        if (unlock && gEventCounter + 1 == sSecurityUnlockEvents[i].nextEvent)
        {
            EventSet(gEventCounter + 1);
            SetCurrentEventBasedEffect(0x2);
        }
    }
    else
    {
        actualLevel = SECURITY_LEVEL_0;
    }
    
    return actualLevel;
}
