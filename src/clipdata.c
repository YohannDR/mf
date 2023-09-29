#include "clipdata.h"
#include "gba.h"
#include "globals.h"
#include "macros.h"
#include "sub_event_and_music.h"

#include "data/clipdata_data.h"

#include "constants/clipdata.h"
#include "constants/event.h"

#include "structs/event.h"

u16 unk_689f0(void)
{

}

/**
 * @brief 68af0 | 2c | Transfers the clipdata code to RAM and sets the pointer to it
 * 
 */
void ClipdataSetupCode(void)
{
    // Copy code to RAM
    DMA_SET(3, ClipdataConvertToCollision, &IN_GAME_DATA.clipdataCode, C_32_2_16(DMA_ENABLE, sizeof(IN_GAME_DATA.clipdataCode) / sizeof(u16)));

    // Set pointer
    gClipdataCodePointer = (CollisionFunc_T)&IN_GAME_DATA.clipdataCode[1];
}

/**
 * @brief 68b1c | a4 | Gets information on the clipdata block at the position in parameters, only used for samus
 * 
 * @param yPosition Y position (in sub-pixels)
 * @param xPosition X position (in sub-pixels)
 * @return u32 Clipdata type (including solid flag)
 */
u32 ClipdataProcessForSamus(u16 yPosition, u16 xPosition)
{
    struct CollisionData collision;
    u32 type;

    // Check in bounds
    if (xPosition >= BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataWidth))
    {
        // Out of bounds on the X axis, consider everything solid
        return CLIPDATA_TYPE_SOLID_FLAG | CLIPDATA_TYPE_SOLID;
    }

    if (yPosition >= BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataHeight))
    {
        // Out of bounds on the Y axis, consider everything air
        return CLIPDATA_TYPE_AIR;
    }

    // Get tile position 
    collision.tileY = SUB_PIXEL_TO_BLOCK(yPosition);
    collision.tileX = SUB_PIXEL_TO_BLOCK(xPosition);

    // Get clipdata type
    type = gBackgroundsData.pClipDecomp[collision.tileY * gBackgroundsData.clipdataWidth + collision.tileX];

    if (type & CLIPDATA_TILEMAP_FLAG)
    {
        // Use tilemap values
        collision.type = sClipdataTilemapCollisionTypes[type & 0x7FFF];
    }
    else
    {
        // Use normal values
        collision.type = gTilemapAndClipPointers.pClipCollisions[type];
    }

    // Get sub pixel position
    collision.subPixelY = yPosition % BLOCK_SIZE;
    collision.subPixelX = xPosition % BLOCK_SIZE;

    // Actor is always samus
    collision.actor = COLLISION_ACTOR_SAMUS;

    // Call clipdata code
    type = gClipdataCodePointer(&collision);
    return type;
}

/**
 * @brief 68bc0 | 108 | Processes the clipdata at the position (hazard, movement, destruction, modification...) and gets the type of said clipdata
 * 
 * @param yPosition Y Position (in sub-pixels)
 * @param xPosition X Position (in sub-pixels)
 * @return u32 Clipdata type (including solid flag)
 */
u32 ClipdataProcess(u16 yPosition, u16 xPosition)
{
    struct CollisionData collision;
    u32 type;

    // Check in bounds
    if (xPosition >= BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataWidth) || yPosition >= BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataHeight))
    {
        gCurrentAffectingClipdata.movement = 0x0;
        gCurrentAffectingClipdata.hazard = 0x0;
        gCurrentClipdataAffectingAction = CAA_NONE;

        // Out of bounds on either axis, consider everything air
        return CLIPDATA_TYPE_AIR;
    }

    if (gCurrentClipdataAffectingAction == CAA_NONE)
        ClipdataCheckCurrentAffectingAtPosition(yPosition, xPosition);

    // Get tile position 
    collision.tileY = SUB_PIXEL_TO_BLOCK(yPosition);
    collision.tileX = SUB_PIXEL_TO_BLOCK(xPosition);

    // Get clipdata type
    type = collision.tileY * gBackgroundsData.clipdataWidth + collision.tileX;
    type = gBackgroundsData.pClipDecomp[type];

    if (gCurrentClipdataAffectingAction != CAA_NONE && gCurrentClipdataAffectingAction != CAA_REMOVE_SOLID &&
        gCurrentClipdataAffectingAction != CAA_MAKE_SOLID && gCurrentClipdataAffectingAction != CAA_MAKE_SOLID_STOP_ENEMY &&
        gCurrentClipdataAffectingAction != CAA_4)
    {
        // "Destructing" CCAA (projectiles, samus, bomb chain), then it's a non sprite
        collision.actor = COLLISION_ACTOR_NON_SPRITE;

        if (gCurrentClipdataAffectingAction == CAA_ENEMY_PROJECTILE)
            gCurrentClipdataAffectingAction = CAA_NONE;
    }
    else
    {
        // No CCAA, then consider it's a sprite
        collision.actor = COLLISION_ACTOR_SPRITE;
    }

    if (gCurrentClipdataAffectingAction != CAA_NONE)
    {
        // Apply CCAA if there's one
        BlockApplyCCAA(collision.tileY, collision.tileX, type);
        gCurrentClipdataAffectingAction = CAA_NONE;
    }

    if (type & CLIPDATA_TILEMAP_FLAG)
    {
        // Use tilemap values
        collision.type = sClipdataTilemapCollisionTypes[type & 0x7FFF];
    }
    else
    {
        // Use normal values
        collision.type = gTilemapAndClipPointers.pClipCollisions[type];
    }

    // Get sub pixel position
    collision.subPixelY = yPosition % BLOCK_SIZE;
    collision.subPixelX = xPosition % BLOCK_SIZE;

    // Call clipdata code
    return gClipdataCodePointer(&collision);
}

u32 ClipdataConvertToCollision(struct CollisionData* pCollision)
{

}

u32 ClipdataCheckCurrentAffectingAtPosition(u16 yPosition, u16 xPosition)
{

}

/**
 * @brief 68fc4 | 13c | Checks if an elevator can be used
 * 
 * @param movementClip Movement clipdata
 * @return u32 bool, can't be used
 */
u32 ClipdataCheckCantUseElevator(u16 movementClip)
{
    s32 i;
    s32 canUse;
    u8 cantUseFlags[ELEVATOR_END] = {0};

    gLastElevatorUsed = UCHAR_MAX;
    canUse = FALSE;

    // Try to find elevator room pair
    for (i = 0; i < ELEVATOR_END; i++)
    {
        // First pair
        if (gCurrentArea == sElevatorRoomPairs[i].area1 && gCurrentRoom == sElevatorRoomPairs[i].room1)
        {
            canUse = TRUE;
        }
        // Second pair
        else if (gCurrentArea == sElevatorRoomPairs[i].area2 && gCurrentRoom == sElevatorRoomPairs[i].room2)
        {
            canUse = TRUE;
        }

        if (canUse)
        {
            // Register elevator
            gLastElevatorUsed = i;
            break;
        }
    }

    if (canUse)
    {
        // Check for elevator ride events
        canUse = ARRAY_SIZE(sElevatorRideEvents);
        while (canUse > 0)
        {
            canUse--;

            // Check in the event range
            if (sElevatorRideEvents[canUse].eventStart <= gEventCounter && gEventCounter < sElevatorRideEvents[canUse].eventEnd)
            {
                // Apply flags
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_OPERATIONS_DECK]    |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_OPERATIONS_DECK];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_LOBBY]              |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_LOBBY];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_1]           |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_1];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_2]           |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_2];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_3]           |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_3];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_4]           |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_4];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_5]           |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_5];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_6]           |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_SECTOR_6];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_LOBBY_POWER_OUTAGE] |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_LOBBY_POWER_OUTAGE];
                cantUseFlags[ELEVATOR_MAIN_DECK_TO_HABITATIONS_DECK]   |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_MAIN_DECK_TO_HABITATIONS_DECK];
                cantUseFlags[ELEVATOR_RESTRICTED_ZONE_TO_SECTOR_1]     |= sElevatorRideEvents[canUse].cantUseFlags[ELEVATOR_RESTRICTED_ZONE_TO_SECTOR_1];
            }
        }

        canUse = cantUseFlags[gLastElevatorUsed];

        if (canUse)
            return canUse;
    }

    // Get trigger type and set elevator direction
    if (movementClip == 0x1)
    {
        i = SEVENT_TTYPE_STARTING_ELEVATOR_RIDE_DOWN;
        gElevatorDirection = 0x2;
    }
    else
    {
        i = SEVENT_TTYPE_STARTING_ELEVATOR_RIDE_UP;
        gElevatorDirection = 0x1;
    }

    SubEventUpdateMusic(i);

    return canUse;
}

/**
 * @brief 69100 | 84 | Checks for a ground effect at the position
 * 
 * @param yPosition Y position (in sub-pixels)
 * @param xPosition X position (in sub-pixels)
 * @return u32 Ground effect
 */
u32 ClipdataGetGroundEffect(u16 yPosition, u16 xPosition)
{
    u32 clipdata;
    u32 tileY;
    u32 tileX;

    // Check in bounds
    if (yPosition >= BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataHeight) || xPosition >= BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataWidth))
    {
        // Out of bounds on either axis, consider everything air
        return GROUND_EFFECT_NONE;
    }

    // Get tile position
    tileY = SUB_PIXEL_TO_BLOCK(yPosition);
    tileX = SUB_PIXEL_TO_BLOCK(xPosition);

    // Get clipdata
    clipdata = tileY * gBackgroundsData.clipdataWidth + tileX;
    clipdata = gBackgroundsData.pClipDecomp[clipdata];

    // Tilemap clipdata can't have a ground effect
    if (!(clipdata & CLIPDATA_TILEMAP_FLAG))
    {
        // Get behavior
        clipdata = gTilemapAndClipPointers.pClipBehaviors[clipdata];

        // Check for behavior
        if (clipdata == 0x0)
            clipdata = GROUND_EFFECT_NONE;
        else if (clipdata == 0x50)
            clipdata = GROUND_EFFECT_WET_GROUND;
        else if (clipdata == 0x51)
            clipdata = GROUND_EFFECT_DUSTY_GROUND;
        else if (clipdata == 0x54)
            clipdata = GROUND_EFFECT_VERY_DUSTY_GROUND;
        else if (clipdata == 0x52)
            clipdata = GROUND_EFFECT_4;
        else if (clipdata == 0x53)
            clipdata = GROUND_EFFECT_BUBBLY_GROUND;
        else
            clipdata = GROUND_EFFECT_NONE;
    }
    else
        clipdata = GROUND_EFFECT_NONE;


    return clipdata;
}
