#include "sub_event_and_music.h"
#include "globals.h"
#include "macros.h"

#include "data/sub_event_data.h"

#include "constants/event.h"

#include "structs/event.h"

/**
 * @brief 700bc | 38 | Updates the sub event counter for an SA-X encounter
 * 
 */
void SubEventUpdateForSaXEncounter(void)
{
    u16 subEvent;

    subEvent = SUB_EVENT_NONE;

    if (gEventCounter == EVENT_HIGH_JUMP_ABILITY_RECOVERED)
        subEvent = SUB_EVENT_40;
    else if (gEventCounter == EVENT_NOC_SA_X_ENCOUNTER)
        subEvent = SUB_EVENT_68;
    else if (gEventCounter == EVENT_ARC_SA_X_ENCOUNTER)
        subEvent = SUB_EVENT_92;

    if (subEvent != SUB_EVENT_NONE)
    {
        gSubEventCounter = subEvent;
        SubEventUpdateMusic(SEVENT_TTYPE_SA_X_ENCOUNTER);
    }
}

/**
 * @brief 700f4 | 2c | Updates the sub event for an ability
 * 
 */
void SubEventUpdateForAbility(void)
{
    if (sAbilityRamValues[gAbilityCount].subEvent != SUB_EVENT_NONE)
    {
        gSubEventCounter = sAbilityRamValues[gAbilityCount].subEvent;
        SubEventUpdateMusic(SEVENT_TTYPE_DOWNLOADING_ITEM);
    }
}

/**
 * @brief 70120 | 44 | Updates the sub event for a navigation conversation
 * 
 */
void SubEventUpdateForNavCounversation(void)
{
    u32 i;

    for (i = 0; i < ARRAY_SIZE(sSubEventNavConversations); i++)
    {
        if (gPreviousNavigationConversation == sSubEventNavConversations[i][0])
        {
            // Found nav conversation, set sub event and update music
            gSubEventCounter = sSubEventNavConversations[i][1];
            SubEventUpdateMusic(SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION);
            break;
        }

        if (gPreviousNavigationConversation < sSubEventNavConversations[i][0])
            break;
    }
}

/**
 * @brief 70164 | 1c | Sets the current sub event
 * 
 * @param subEvent Sub event
 * @param triggerType Sub event trigger type
 */
void SubEventUpdate(u8 subEvent, u8 triggerType)
{
    // Set sub event and update music
    gSubEventCounter = subEvent;
    SubEventUpdateMusic(triggerType);
}

/**
 * @brief 70180 | 142c | Updates the music for the current sub event
 * 
 * @param triggerType Sub event trigger type
 */
void SubEventUpdateMusic(u8 triggerType)
{
    u8 type;
    u8 updateSubEvent;

    if (gCurrentArea >= AREA_DEBUG_1)
        return;

    if (triggerType != SEVENT_TTYPE_128)
    {
        if (sSubEventTriggerTypes[gSubEventCounter] != SEVENT_TTYPE_NONE && triggerType != sSubEventTriggerTypes[gSubEventCounter])
        {
            if (sSubEventTriggerTypes[gSubEventCounter] != SEVENT_TTYPE_32)
                return;

            if (triggerType == SEVENT_TTYPE_ENTERING_ROOM)
                type = 0x1;
            else if (triggerType == SEVENT_TTYPE_34)
                type = 0x2;
            else
                return;
        }
    }

    updateSubEvent = FALSE;

    switch (gSubEventCounter)
    {
        case SUB_EVENT_NONE:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_1:
            MusicPlay(0x1E, 2);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_2:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 20)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 20)
            {
                MusicPlay(0x2B, 2);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_3:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_4:
            if (gCurrentNavigationRoom != NAV_ROOM_MAIN_DECK_ROOM_0)
                break;

            if (type == 0x1)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2)
            {
                MusicPlay(0x2C, 2);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_5:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_6:
            MusicFade(60 * 3);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_7:
            if (gLastElevatorUsed != ELEVATOR_MAIN_DECK_TO_OPERATIONS_DECK)
                break;

            MusicPlay(0x3, 2);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_8:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 13)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 13)
            {
                MusicPlay(0x2E, 2);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_9:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 60)
            {
                MusicFade(60);
            }
            else if (type == 0x2 && gCurrentRoom == 60)
            {
                MusicPlay(0x1E, 2);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
            {
                updateSubEvent = TRUE + 1;
                gSubEventCounter = SUB_EVENT_8;
            }
            break;

        case SUB_EVENT_10:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_11:
            if (gCurrentNavigationRoom != NAV_ROOM_MAIN_DECK_ROOM_32)
                break;

            MusicPlay(0x34, 2);
            unk_38a8(0x33, 0);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_12:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gCurrentRoom == 35)
            {
                unk_372c(0x1E, 0x2C, 0x2);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_13:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 38)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 38)
            {
                MusicPlay(0x18, 2);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_14:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_15:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gCurrentRoom == 14)
            {
                unk_372c(0x1E, 0x2C, 0x2);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_16:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_17:
            unk_36c4();
            SoundStop(0xFC);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_18:
            MusicPlay(0x31, 2);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_19:
            MusicFade(60 * 5);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_20:
            unk_3b1c(0x229);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_21:
            MusicPlay(0x1E, 2);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_22:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_1_ROOM_2)
                break;

            if (type == 0x1)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2)
            {
                MusicPlay(0xB, 3);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_23:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_24:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor == 40)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 40)
            {
                MusicPlay(0x18, 6);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_25:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_26:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor != 40)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom != 40)
            {
                MusicPlay(0x4, 3);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_27:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_1_ROOM_2)
                break;

            if (type == 0x1)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2)
            {
                MusicPlay(0xB, 3);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_28:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (triggerType == SEVENT_TTYPE_ENTERING_ROOM)
            {
                if (gDestinationDoor == 1)
                {
                    MusicFade(60);
                    updateSubEvent = TRUE;
                    break;
                }
            }
            
            if (triggerType == SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION)
            {
                gSubEventCounter = SUB_EVENT_30;
                updateSubEvent = TRUE + 1;
            }
            break;

        case SUB_EVENT_29:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (gCurrentRoom == 1)
            {
                MusicPlay(0x4, 0);
                gSubEventCounter = SUB_EVENT_30;
                updateSubEvent = TRUE + 1;
            }
            break;

        case SUB_EVENT_30:
            if (gLastElevatorUsed != ELEVATOR_MAIN_DECK_TO_SECTOR_2)
                break;

            MusicFade(60 * 5);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_31:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (gCurrentRoom == 29)
            {
                unk_3778(0x1E, 0x12C, 0x4);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_32:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_3_ROOM_2)
                break;

            if (type == 0x1)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2)
            {
                MusicPlay(0xB, 4);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_33:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_34:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                MusicPlay(0x6, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_35:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_36:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_37:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 18)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 18)
            {
                MusicPlay(0x18, 4);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_38:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_39:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor != 18)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom != 18)
            {
                MusicPlay(0x6, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_40:
            unk_372c(0x1E, 0x15, 0x8);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_41:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor != 45)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom != 45)
            {
                MusicPlay(0x6, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_42:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_43:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_44:
            MusicFade(200);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_45:
            if (gLastElevatorUsed != ELEVATOR_MAIN_DECK_TO_SECTOR_2)
                break;

            MusicPlay(0x1E, 11);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_46:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_4_ROOM_2)
                break;

            if (type == 0x1)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2)
            {
                MusicPlay(0xB, 11);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_47:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_48:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                MusicPlay(0x9, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_49:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor == 31)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 31)
            {
                MusicPlay(0x5F, 5);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_50:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor == 42)
            {
                MusicFade(40);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 42)
            {
                MusicPlay(0x18, 6);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_51:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_52:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor != 42)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom != 42)
            {
                MusicPlay(0x9, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_53:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_54:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor == 4)
            {
                MusicFade(30);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 4)
            {
                MusicPlay(0xF, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_55:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_56:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor != 4)
            {
                MusicFade(30);
                break;
            }
            else if (type == 0x2 && gCurrentRoom != 4)
            {
                MusicPlay(0x7, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_57:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor == 21)
            {
                MusicFade(30);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 21)
            {
                MusicPlay(0xF, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_58:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_59:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor != 21)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom != 21)
            {
                MusicPlay(0x18, 6);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_60:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (gCurrentRoom == 23)
                updateSubEvent = TRUE;
            break;

        case SUB_EVENT_61:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (gCurrentRoom != 23)
            {
                unk_372c(0x14, 0x7, 0x0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_62:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_63:
            MusicFade(30);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_64:
            unk_372c(0x78, 0x1E, 0xB);
            SoundPlay(0xFC);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_65:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_6_ROOM_2)
                break;

            if (type == 0x1)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2)
            {
                MusicPlay(0xB, 0xB);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_66:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_68:
            unk_372c(0xA, 0x15, 0x8);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_67:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                MusicPlay(0xA, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_69:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 10)
            {
                MusicFade(70);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 10)
            {
                MusicPlay(0xA, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_70:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 12)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 12)
            {
                MusicPlay(0x18, 6);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_71:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_72:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor != 13)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom != 13)
            {
                MusicPlay(0xA, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_73:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_74:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 7)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 7)
            {
                MusicPlay(0x8, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_75:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_76:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_77:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                MusicFade(70);
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                MusicPlay(0x5A, 11);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
            {
                unk_3cd4(0x2CF);
            }
            break;

        case SUB_EVENT_78:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_2_ROOM_2)
                break;

            unk_3cfc();
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_79:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_80:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_81:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_82:
            if (gCurrentArea != AREA_SECTOR_3)
                break;

            if (type == 0x1 && gDestinationDoor == 29)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 29)
            {
                MusicPlay(0x7, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_83:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_84:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 46)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 46)
            {
                MusicPlay(0x5C, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_85:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 20)
            {
                MusicFade(60);
            }
            else if (type == 0x2 && gCurrentRoom == 20)
            {
                MusicPlay(0x2C, 10);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
            {
                updateSubEvent = TRUE + 1;
                gSubEventCounter = SUB_EVENT_84;
            }
            break;

        case SUB_EVENT_86:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_87:
            unk_372c(0x1E, 0x1E, 0x0);
            updateSubEvent = TRUE + 1;
            gSubEventCounter = SUB_EVENT_84;
            break;

        case SUB_EVENT_88:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_89:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 7)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 7)
            {
                MusicPlay(0x8, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_90:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_91:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 43)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 43)
            {
                MusicPlay(0x5F, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_92:
            unk_372c(0xA, 0x15, 0x8);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_93:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 22)
            {
                MusicFade(70);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 22)
            {
                MusicPlay(0x8, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_94:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_95:
            unk_372c(0x60, 0x3, 0xB);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_96:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gCurrentRoom == 31)
            {
                unk_372c(0x1E, 0x5C, 0xB);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_97:
            if (gCurrentNavigationRoom != NAV_ROOM_MAIN_DECK_ROOM_0)
                break;

            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_98:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_99:
            MusicFade(0);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_100:
            MusicPlay(0x59, 10);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_101:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 49)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 49)
            {
                MusicPlay(0x5F, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_102:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 86)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 86)
            {
                MusicPlay(0x18, 6);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_103:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_104:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (triggerType != SEVENT_TTYPE_ENTERING_ROOM)
                break;

            if (gDestinationDoor == 51)
            {
                MusicFade(60);
                gSubEventCounter = SUB_EVENT_105;
                updateSubEvent = TRUE + 1;
                break;
            }

            if (gDestinationDoor == 54)
            {
                unk_372c(0x1E, 0x3, 0xA);
                gSubEventCounter = SUB_EVENT_106;
                updateSubEvent = TRUE + 1;
            }
            break;

        case SUB_EVENT_105:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gCurrentRoom == 51)
            {
                MusicPlay(0x3, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_106:
            unk_36c4();
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_107:
            MusicPlay(0x2E, 10);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_108:
            if (gCurrentNavigationRoom != NAV_ROOM_MAIN_DECK_ROOM_56)
                break;

            if (type == 0x1)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2)
            {
                MusicPlay(0xB, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_109:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_110:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 24)
            {
                MusicFade(2);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 24)
            {
                MusicPlay(0x15, 8);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_111:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 55)
            {
                MusicFade(2);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 55)
            {
                MusicPlay(0x1E, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_112:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (gCurrentRoom == 24)
            {
                MusicPlay(0x15, 8);
                gSubEventCounter = SUB_EVENT_111;
                updateSubEvent = TRUE + 1;
            }
            break;

        case SUB_EVENT_113:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_114:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (gDestinationDoor == 32)
            {
                if (gEventCounter == EVENT_ESCAPED_TRO_2_SA_X)
                {
                    gSubEventCounter = SUB_EVENT_116;
                    updateSubEvent = TRUE + 1;
                    break;
                }

                MusicFade(30);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_115:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (gCurrentRoom == 32)
            {
                MusicPlay(0x6, 0);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_116:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 22)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 22)
            {
                MusicPlay(0x44, 7);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_117:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_118:
            if (gCurrentArea != AREA_SECTOR_2)
                break;

            if (type == 0x1 && gDestinationDoor == 12)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 12)
            {
                MusicPlay(0x6, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_119:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_120:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                MusicPlay(0x32, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_121:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 20)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 20)
            {
                MusicPlay(0x18, 6);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_122:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_123:
            if (gCurrentArea != AREA_SECTOR_5)
                break;

            if (type == 0x1 && gDestinationDoor == 27)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 27)
            {
                MusicPlay(0x2C, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_124:
            if (gCurrentArea != AREA_SECTOR_4)
                break;

            if (type == 0x1 && gDestinationDoor == 14)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 14)
            {
                MusicPlay(0x3C, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_125:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_126:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_127:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_128:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (gDestinationDoor == 26)
            {
                MusicFade(200);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_129:
            if (gLastElevatorUsed != ELEVATOR_MAIN_DECK_TO_SECTOR_3)
                break;

            MusicPlay(0x1E, 11);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_130:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_6_ROOM_2)
                break;

            if (type == 0x1)
            {
                MusicFade(50);
            }
            else if (type == 0x2)
            {
                MusicPlay(0xB, 11);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_131:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_132:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 0)
            {
                MusicFade(50);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 0)
            {
                MusicPlay(0xA, 0);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_133:
            unk_3cd4(0x2C8);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_134:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_135:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (type == 0x1 && gDestinationDoor == 16)
            {
                MusicFade(20);
            }
            else if (type == 0x2 && gCurrentRoom == 16)
            {
                MusicPlay(0x1B, 7);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
                unk_3cfc();
            break;

        case SUB_EVENT_136:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_137:
            if (gCurrentArea != AREA_SECTOR_6)
                break;

            if (gCurrentRoom != 16)
            {
                unk_3cd4(0x2C8);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_138:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 78)
            {
                MusicFade(40);
                unk_3cfc();
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 78)
            {
                MusicPlay(0x5F, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_139:
            MusicFade(20);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_140:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 79)
            {
                MusicFade(60);
            }
            else if (type == 0x2 && gCurrentRoom == 79)
            {
                MusicPlay(0x17, 10);
                updateSubEvent = TRUE;
            }

            if (updateSubEvent)
                unk_3dc4(0x2C9);
            break;

        case SUB_EVENT_141:
            MusicFade(60 * 10);
            unk_3cfc();
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_142:
            MusicPlay(0x3, 10);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_143:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_144:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_145:
            MusicFade(60 * 5);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_146:
            if (gLastElevatorUsed != ELEVATOR_RESTRICTED_ZONE_TO_SECTOR_1)
                break;

            MusicPlay(0x1E, 10);
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_147:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor == 30)
            {
                MusicFade(40);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 30)
            {
                MusicPlay(0x32, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_148:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor == 27)
            {
                MusicFade(40);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 27)
            {
                MusicPlay(0x18, 6);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_149:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_150:
            if (gCurrentArea != AREA_SECTOR_1)
                break;

            if (type == 0x1 && gDestinationDoor == 26)
            {
                MusicFade(40);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 26)
            {
                MusicPlay(0x32, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_151:
            if (gCurrentNavigationRoom != NAV_ROOM_SECTOR_1_ROOM_2)
                break;

            if (type == 0x1)
            {
                MusicFade(60);
            }
            else if (type == 0x2)
            {
                MusicPlay(0xB, 10);
                updateSubEvent = TRUE;
            }
            break;

        case SUB_EVENT_152:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_153:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 85)
            {
                MusicFade(60);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 85)
            {
                MusicPlay(0x2E, 10);
                updateSubEvent = TRUE;
                break;
            }
            break;

        case SUB_EVENT_154:
            updateSubEvent = TRUE;
            break;

        case SUB_EVENT_155:
            if (gCurrentArea != AREA_MAIN_DECK)
                break;

            if (type == 0x1 && gDestinationDoor == 63)
            {
                MusicFade(0);
                break;
            }
            else if (type == 0x2 && gCurrentRoom == 63)
            {
                MusicPlay(0x58, 7);
                updateSubEvent = TRUE;
                break;
            }
            break;
    }

    if (updateSubEvent == TRUE)
    {
        gPreviousSubEvent = gSubEventCounter;
        gSubEventCounter++;
    }
}
