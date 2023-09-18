#include "event_checks.h"

#include "constants/event.h"

#include "structs/event.h"

/**
 * @brief 60940 | 214 | Tries to advance to the specified event
 * 
 * @param event New event
 * @return u32 bool, was set
 */
u32 EventCheckAdvance(u8 event)
{
    u32 setEvent;

    setEvent = TRUE;

    switch (event)
    {
        case EVENT_QUARANTINE_BAY_HORNOAD_DEAD:
        case EVENT_MORPH_BALL_ABILITY_RECOVERED:
        case EVENT_CHARGE_BEAM_ABILITY_RECOVERED:
        case EVENT_HIGH_JUMP_ABILITY_RECOVERED:
        case EVENT_SPEED_BOOSTER_ABILITY_RECOVERED:
        case EVENT_BOX_DEFEATED:
        case EVENT_NOC_DATA_ROOM_DESTROYED:
        case EVENT_VARIA_SUIT_ABILITY_RECOVERED:
        case EVENT_COOLING_UNIT_OPERATIONAL:
        case EVENT_SPACE_JUMP_ABILITY_RECOVERED:
        case EVENT_GRAVITY_SUIT_ABILITY_RECOVERED:
        case EVENT_WAVE_BEAM_ABILITY_RECOVERED:
        case EVENT_SCREW_ATTACK_ABILITY_RECOVERED:
        case EVENT_SA_X_DEFEATED:
            // Check current event is the previous of the new event
            if (gEventCounter != event - 1)
            {
                setEvent = FALSE;
                break;
            }

            // Unlock doors
            gDoorUnlockTimer = 60;
            break;

        case EVENT_ALL_STABILIZERS_ONLINE:
        case EVENT_WATER_LEVEL_LOWERED:
        case EVENT_ESCAPED_NOC_SA_X:
        case EVENT_WIDE_BEAM_ABILITY_RECOVERED:
        case EVENT_ANIMALS_RELEASED:
        case EVENT_AUXILARY_POWER_ENGAGED:
        case EVENT_ESCAPED_TRO_2_SA_X:
        case EVENT_PLASMA_BEAM_ABILITY_RECOVERED:
        case EVENT_60_SECONDS_TO_DETACHMENT:
        case EVENT_ORBIT_CHANGE_IMPLEMENTED:
        case EVENT_SA_X_KILLED_BY_OMEGA_METROID:
        case EVENT_ICE_BEAM_ABILITY_RECOVERED:
        case EVENT_OMEGA_METROID_DEFEATED:
        case EVENT_ESCAPED_ON_SHIP:
            // Check current event is the previous of the new event
            if (gEventCounter != event - 1)
            {
                setEvent = FALSE;
                break;
            }
    }

    if (setEvent)
        EventSet(event);

    return setEvent;
}

/**
 * @brief 60b54 | 18 | Checks if the current event is the navigation room after yazuka
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_NavAfterYakuza(void)
{
    return gEventCounter == EVENT_NAVIGATION_ROOM_AFTER_YAKUZA;
}

/**
 * @brief 60b6c | 18 | Checks if the current event is the engaged tro 2 SA-X
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_EngagedSaXTro2(void)
{
    return gEventCounter == EVENT_ENGAGED_TRO_2_SA_X;
}

/**
 * @brief 60b84 | 18 | Checks if the current event is after (including) the ice beam recovered
 * 
 * @return u32 bool, after or on event
 */
u32 EventCheckAfter_IceBeamRecovered(void)
{
    return gEventCounter >= EVENT_ICE_BEAM_ABILITY_RECOVERED;
}

/**
 * @brief 60b9c | 18 | Checks if the current event is after (including) the SA-X killed by omega
 * 
 * @return u32 bool, after or on event
 */
u32 EventCheckAfter_SaXKilledByOmega(void)
{
    return gEventCounter >= EVENT_SA_X_KILLED_BY_OMEGA_METROID;
}

/**
 * @brief 60bb4 | 18 | Checks if the current event is the entered operations deck
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_EnteredOperationsDeck(void)
{
    return gEventCounter == EVENT_ENTERED_OPERATION_DECK;
}

/**
 * @brief 60bcc | 18 | Checks if the current event is the triggered box 2 rumble
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_TriggeredBox2Rumble(void)
{
    return gEventCounter == EVENT_TRIGGERED_BOX_2_RUMBLE;
}

/**
 * @brief 60be4 | 18 | Checks if the current event is the restricted zone warning
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_RestrictedZoneWarning(void)
{
    return gEventCounter == EVENT_RESTRICTED_ZONE_WARNING;
}

/**
 * @brief 60bfc | 18 | Checks if the current event is after (including) the reached top of room after varia
 * 
 * @return u32 bool, after or on event
 */
u32 EventCheckAfter_ReachedTopOfRoomAfterVaria(void)
{
    return gEventCounter >= EVENT_REACHED_TOP_OF_ROOM_AFTER_VARIA;
}

/**
 * @brief 60c14 | 1c | Checks the power outage state relating to the current event
 * 
 * @return u32 power outage state
 */
u32 EventCheckOn_PowerOutage(void)
{
    u32 state;

    if (gEventCounter != EVENT_POWER_OUTAGE)
        state = POWER_OUTAGE_BEFORE;
    else
        state = POWER_OUTAGE_DURING;

    if (gEventCounter > EVENT_POWER_OUTAGE)
        state = POWER_OUTAGE_AFTER;

    return state;
}

/**
 * @brief 60c30 | 18 | Checks if the current event is the wave beam recovered
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_WaveBeamRecovered(void)
{
    return gEventCounter == EVENT_WAVE_BEAM_ABILITY_RECOVERED;
}

/**
 * @brief 60c48 | 18 | Checks if the current event is the restricted laboratory explosion
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_RestrictedLabExplosion(void)
{
    return gEventCounter == EVENT_RESTRICTED_LABORATORY_EXPLOSION;
}

/**
 * @brief 60c60 | 18 | Checks if the current event is the bombs SA-X quake
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_BombsQuake(void)
{
    return gEventCounter == EVENT_SA_X_QUAKE;
}

/**
 * @brief 60c78 | 18 | Checks if the current event is the bombs data downloaded
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_BombsDownloaded(void)
{
    return gEventCounter == EVENT_BOMB_DATA_DOWNLOADED;
}

/**
 * @brief 60c90 | 18 | Checks if the current event is the escaped SA-X noc
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_EscapedSaXNoc(void)
{
    return gEventCounter == EVENT_ESCAPED_NOC_SA_X;
}

/**
 * @brief 60ca8 | 18 | Checks if the current event is the engaged SA-X ARC
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_EngagedSaXArc(void)
{
    return gEventCounter == EVENT_ARC_SA_X_ENCOUNTER;
}

/**
 * @brief 60cc0 | 18 | Checks if the current event is the power bomb data downloaded
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_PowerBombsDownloaded(void)
{
    return gEventCounter == EVENT_POWER_BOMB_DATA_DOWNLOADED;
}

/**
 * @brief 60cd8 | 18 | Checks if the current event is the engaged SA-X NOC
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_EngagedSaXNoc(void)
{
    return gEventCounter == EVENT_NOC_SA_X_ENCOUNTER;
}

/**
 * @brief 60cf0 | 18 | Checks if the current event is the navigation room entering NOC
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_NavigationRoomEnteringNoc(void)
{
    return gEventCounter == EVENT_NAVIGATION_ROOM_ENTERING_NOC;
}

/**
 * @brief 60d08 | 18 | Checks if the current event is the high jump recovered
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_HighJumpRecovered(void)
{
    return gEventCounter == EVENT_HIGH_JUMP_ABILITY_RECOVERED;
}

/**
 * @brief 60d20 | 18 | Checks if the current event is after (including) the escaped the SA-X TRO (1)
 * 
 * @return u32 bool, after or on event
 */
u32 EventCheckAfter_EscapedSaXTro1(void)
{
    return gEventCounter >= EVENT_ESCAPED_TRO_1_SA_X;
}

/**
 * @brief 60d38 | 18 | Checks if the current event is after (including) the box defeated
 * 
 * @return u32 bool, after or on event
 */
u32 EventCheckAfter_BoxDefeated(void)
{
    return gEventCounter >= EVENT_BOX_DEFEATED;
}

/**
 * @brief 60d50 | 18 | Checks if the current event is the box rumble
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_BoxRumble(void)
{
    return gEventCounter == EVENT_TRIGGERED_BOX_RUMBLE;
}

/**
 * @brief 60d68 | 18 | Checks if the current event is the super missile data downloaded
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_SuperMissileDownloaded(void)
{
    return gEventCounter == EVENT_SUPER_MISSILE_DATA_DOWNLOADED;
}

/**
 * @brief 60d80 | 18 | Checks if the current event is the entered super missile data room
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_EnteredSuperMissileDataRoom(void)
{
    return gEventCounter == EVENT_ENTERED_SUPER_MISSILE_DATA_ROOM;
}

/**
 * @brief 60d98 | 18 | Checks if the current event is after (including) the water lowered
 * 
 * @return u32 bool, after or on event
 */
u32 EventCheckAfter_WaterLowered(void)
{
    return gEventCounter >= EVENT_WATER_LEVEL_LOWERED;
}

/**
 * @brief 60db0 | 18 | Checks if the current event is the navigation room before quarantine bay
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_NavigationRoomBeforeQuarantineBay(void)
{
    return gEventCounter == EVENT_NAVIGATION_ROOM_BEFORE_QUARANTINE_BAY;
}

/**
 * @brief 60dc8 | 30 | Checks if the current event needs to have the save stations disabled
 * 
 * @return u32 bool, disabled
 */
u32 EventCheckWith_SaveDisabled(void)
{
    u32 onEvent;

    onEvent = FALSE;

    if (gEventCounter == EVENT_NAVIGATION_ROOM_LEAVING_ARC || gEventCounter == EVENT_WIDE_BEAM_ABILITY_RECOVERED)
    {
        // Cooling unit meltdown
        onEvent = TRUE;
    }
    else if (gEventCounter == EVENT_POWER_OUTAGE || gEventCounter == EVENT_ENTERED_SHIP ||
        gEventCounter == EVENT_ENTERED_YAKUZA_ROOM || gEventCounter == EVENT_SPACE_JUMP_ABILITY_RECOVERED)
    {
        // All of power outage
        onEvent = TRUE;
    }
    else if (gEventCounter >= EVENT_ORBIT_CHANGE_IMPLEMENTED)
    {
        // After orbit change
        onEvent = TRUE;
    }

    return onEvent;
}

/**
 * @brief 60df8 | 24 | Checks if the current event needs to have the navigation rooms disabled
 * 
 * @return u32 bool, disabled
 */
u32 EventCheckWith_NavigationDisabled(void)
{
    u32 onEvent;

    onEvent = FALSE;

    if (gEventCounter == EVENT_POWER_OUTAGE || gEventCounter == EVENT_ENTERED_SHIP ||
        gEventCounter == EVENT_ENTERED_YAKUZA_ROOM || gEventCounter == EVENT_SPACE_JUMP_ABILITY_RECOVERED)
    {
        // All of power outage
        onEvent = TRUE;
    }
    else if (gEventCounter >= EVENT_ORBIT_CHANGE_IMPLEMENTED)
    {
        // After orbit change
        onEvent = TRUE;
    }

    return onEvent;
}

/**
 * @brief 60e1c | 20 | Checks if the current event needs to have the recharge stations disabled
 * 
 * @return u32 bool, disabled
 */
u32 EventCheckWith_RechargeDisabled(void)
{
    u32 onEvent;

    onEvent = FALSE;

    if (gEventCounter == EVENT_POWER_OUTAGE || gEventCounter == EVENT_ENTERED_SHIP ||
        gEventCounter == EVENT_ENTERED_YAKUZA_ROOM || gEventCounter == EVENT_SPACE_JUMP_ABILITY_RECOVERED)
    {
        // All of power outage
        onEvent = TRUE;
    }

    return onEvent;
}

/**
 * @brief 60e3c | 18 | Checks if the current event is the entered pump control unit
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_EnteredPumpControlUnit(void)
{
    return gEventCounter == EVENT_ENTERED_PUMP_CONTROL_UNIT;
}

/**
 * @brief 60e54 | 20 | Checks the current state of the cooling meltdown event
 * 
 * @return u32 meltdown state
 */
u32 EventCheckOn_Meltdown(void)
{
    u32 state;

    state = MELTDOWN_NONE;

    if (gEventCounter == EVENT_NAVIGATION_ROOM_LEAVING_ARC)
        state = MELTDOWN_DURING;
    else if (gEventCounter == EVENT_WIDE_BEAM_ABILITY_RECOVERED)
        state = MELTDOWN_CAN_BE_STOPPED;

    return state;
}

/**
 * @brief 60e74 | 18 | Checks if the current event is the navigation room leaving PYR (2)
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_NavigationRoomLeavingPyr2(void)
{
    return gEventCounter == EVENT_NAVIGATION_ROOM_LEAVING_PYR_2;
}

/**
 * @brief 60e8c | 18 | Checks if the current event is after (including) the animals released
 * 
 * @return u32 bool, after or on event
 */
u32 EventCheckAfter_AnimalsReleased(void)
{
    return gEventCounter >= EVENT_ANIMALS_RELEASED;
}

/**
 * @brief 60ea4 | 18 | Checks if the current event is the space jump recovered
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_SpaceJumpRecovered(void)
{
    return gEventCounter == EVENT_SPACE_JUMP_ABILITY_RECOVERED;
}

/**
 * @brief 60ebc | 18 | Checks if the current event is the SA-X defeated
 * 
 * @return u32 bool, on event
 */
u32 EventCheckOn_SaXDefeated(void)
{
    return gEventCounter == EVENT_SA_X_DEFEATED;
}

/**
 * @brief 60ed4 | 18 | Checks if the current event is after (including) the orbit change implemented
 * 
 * @return u32 bool, after or on event
 */
u32 EventCheckAfter_OrbitChange(void)
{
    return gEventCounter >= EVENT_ORBIT_CHANGE_IMPLEMENTED;
}

/**
 * @brief 60eec | f8 | Checks the current escape
 * 
 * @return u32 escape type
 */
u32 EventCheckOn_Escape(void)
{
    u32 escape;

    escape = ESCAPE_NONE;

    switch (gEventCounter)
    {
        case EVENT_NAVIGATION_ROOM_LEAVING_ARC:
        case EVENT_WIDE_BEAM_ABILITY_RECOVERED:
            escape = ESCAPE_MELTDOWN;
            break;

        case EVENT_60_SECONDS_TO_DETACHMENT:
            escape = ESCAPE_RESTRICTED_LAB;
            break;

        case EVENT_ORBIT_CHANGE_IMPLEMENTED:
        case EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_7:
        case EVENT_ENTERED_SHIP_ROOM:
        case EVENT_SA_X_KILLED_BY_OMEGA_METROID:
        case EVENT_ICE_BEAM_ABILITY_RECOVERED:
        case EVENT_OMEGA_METROID_DEFEATED:
            escape = ESCAPE_ORBIT_CHANGE;
    }

    return escape;
}

/**
 * @brief 60fe4 | 20 | Checks if the escape has ended
 * 
 * @return u32 bool, ended
 */
u32 EventCheckOn_EndEscape(void)
{
    u32 ended;

    ended = FALSE;

    if (gEventCounter == EVENT_COOLING_UNIT_OPERATIONAL)
        ended = TRUE;
    else if (gEventCounter == EVENT_ESCAPED_RESTRICTED_LABORATORY)
        ended = TRUE;
    else if (gEventCounter == EVENT_ESCAPED_ON_SHIP)
        ended = TRUE;

    return ended;
}
