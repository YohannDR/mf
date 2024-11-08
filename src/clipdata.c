#include "clipdata.h"
#include "gba.h"
#include "globals.h"
#include "macros.h"
#include "sub_event_and_music.h"

#include "data/clipdata_data.h"
#include "data/connection_data.h"

#include "constants/clipdata.h"
#include "constants/event.h"
#include "constants/samus.h"

#include "structs/connection.h"
#include "structs/event.h"
#include "structs/room.h"
#include "structs/samus.h"

/**
 * @brief 68974 | 7c | To document
 * 
 */
void unk_68974(void)
{
    if (gUnk_03004e48[0] == 0)
        return;
    
    switch (gUnk_03004e48[0])
    {
        case 1:
            DmaTransfer(3, VRAM_BASE + 0x1000, EWRAM_BASE + 0x20000, 0x1000, 16);
            gUnk_03004e48[1] = 0;
            gUnk_03004e48[0]++;

        case 2:
            if (unk_689f0())
                gUnk_03004e48[0]++;

        default:
            if (gUnk_03004e48[0] == 0x80)
            {
                DmaTransfer(3, EWRAM_BASE + 0x20000, VRAM_BASE + 0x1000, 0x1000, 16);
                gUnk_03004e48[0] = 0;
                gUnk_03004e48[1] = 0;
            }
    }
}

/**
 * @brief 689f0 | 100 | To document
 * 
 * @return s32 bool, to document
 */
s32 unk_689f0(void)
{
    s32 yPosition;
    s32 xPosition;
    s32 i;
    s32 clipdata;

    if (gUnk_03004e48[1] == 12)
        return TRUE;

    yPosition = SUB_PIXEL_TO_BLOCK(gBg1YPosition);
    xPosition = SUB_PIXEL_TO_BLOCK(gBg1XPosition);

    yPosition--;
    yPosition += gUnk_03004e48[1];
    xPosition--;

    for (i = 0; i <= 16; i++, xPosition++)
    {
        clipdata = yPosition * gBackgroundsData.clipdataWidth + xPosition;
        clipdata = gBackgroundsData.pClipDecomp[clipdata];

        if (clipdata & CLIPDATA_TILEMAP_FLAG)
            continue;

        clipdata = gTilemapAndClipPointers.pClipBehaviors[clipdata];

        if (clipdata == CLIP_BEHAVIOR_MISSILE_BLOCK_NEVER_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0x6;
        else if (clipdata == CLIP_BEHAVIOR_MISSILE_BLOCK_NO_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0xD;
        else if (clipdata == CLIP_BEHAVIOR_POWER_BOMB_BLOCK_NEVER_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0x7;
        else if (clipdata == CLIP_BEHAVIOR_SPEED_BOOST_BLOCK_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0x9;
        else if (clipdata == CLIP_BEHAVIOR_SCREW_ATTACK_BLOCK_NO_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0xA;
        else if (clipdata == CLIP_BEHAVIOR_CRUMBLE_BLOCK)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0x0;
        else if (clipdata == CLIP_BEHAVIOR_SHOT_BLOCK_NEVER_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0xC;
        else if (clipdata == CLIP_BEHAVIOR_TOP_LEFT_SHOT_BLOCK_NEVER_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0xC;
        else if (clipdata == CLIP_BEHAVIOR_TOP_RIGHT_SHOT_BLOCK_NEVER_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0xC;
        else if (clipdata == CLIP_BEHAVIOR_BOTTOM_LEFT_SHOT_BLOCK_NEVER_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0xC;
        else if (clipdata == CLIP_BEHAVIOR_BOTTOM_RIGHT_SHOT_BLOCK_NEVER_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0xC;
        else if (clipdata == CLIP_BEHAVIOR_SHOT_BLOCK_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0xC;
        else if (clipdata == CLIP_BEHAVIOR_BOMB_BLOCK_NEVER_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0x5;
        else if (clipdata == CLIP_BEHAVIOR_BOMB_BLOCK_REFORM)
            clipdata = CLIPDATA_TILEMAP_FLAG | 0x5;
        else
            continue;

        SetVramBg1BlockTilemapValu(clipdata, yPosition, xPosition);
    }

    gUnk_03004e48[1]++;

    return FALSE;
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
        gCurrentAffectingClipdata.movement = CLIPDATA_MOVEMENT_NONE;
        gCurrentAffectingClipdata.hazard = HAZARD_NONE;
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

/**
 * @brief 68cc8 | 1a8 | Returns the collision type for the current position
 * 
 * @param pCollision Pointer to a collision data structure
 * @return u32 Clipdata type (including solid flag)
 */
u32 ClipdataConvertToCollision(struct CollisionData* pCollision)
{
    s32 result;
    s32 clipdata;
    s32 hatchId;
    s32 tmp;

    result = CLIPDATA_TYPE_AIR;

    switch (pCollision->type)
    {
        case CLIPDATA_TYPE_SOLID:
            // No calculations needed, return type and add solid flag
            result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            break;

        case CLIPDATA_TYPE_LEFT_STEEP_FLOOR_SLOPE:
            // Checking if in the solid or air part of the slope
            // The slope forms a rectangle triangle with the right angle being in the bottom left
            // For the subpixels coordinates, 0,0 is the top left, and 3F,3F the bottom right
            // So in order to determine whether it's colliding with the solid part or not, we simply check if Y > X
            if (pCollision->subPixelY >= pCollision->subPixelX)
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            else
                result = pCollision->type;
            break;
            
        case CLIPDATA_TYPE_RIGHT_STEEP_FLOOR_SLOPE:
            // Checking if in the solid or air part of the slope
            // Same logic, however since the slope is "flipped" in regards to the coordinates, we substract the X to 3F
            if (pCollision->subPixelY >= SUB_PIXEL_POSITION_FLAG - pCollision->subPixelX)
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            else
                result = pCollision->type;
            break;

        case CLIPDATA_TYPE_LEFT_UPPER_SLIGHT_FLOOR_SLOPE:
            // Checking if in the solid or air part of the slope
            // Same logic, however the triangle hypotenuse is "larger" and extends on 2 block, with the angle being twice as big
            // Hence why the subpixel X is divided by 2, it's to compensate
            if (pCollision->subPixelY >= DIV_SHIFT(pCollision->subPixelX, 2))
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            else
                result = pCollision->type;
            break;

        case CLIPDATA_TYPE_LEFT_LOWER_SLIGHT_FLOOR_SLOPE:
            // Checking if in the solid or air part of the slope
            // Same logic, we add 0x3F because it's the lower part of the slope
            if (pCollision->subPixelY >= DIV_SHIFT(pCollision->subPixelX + SUB_PIXEL_POSITION_FLAG, 2))
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            else
                result = pCollision->type;
            break;

        case CLIPDATA_TYPE_RIGHT_LOWER_SLIGHT_FLOOR_SLOPE:
            // Checking if in the solid or air part of the slope
            // Same logic
            if (pCollision->subPixelY >= SUB_PIXEL_POSITION_FLAG - DIV_SHIFT(pCollision->subPixelX, 2))
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            else
                result = pCollision->type;
            break;

        case CLIPDATA_TYPE_RIGHT_UPPER_SLIGHT_FLOOR_SLOPE:
            // Checking if in the solid or air part of the slope
            // Same logic
            if (pCollision->subPixelY >= DIV_SHIFT(SUB_PIXEL_POSITION_FLAG - pCollision->subPixelX, 2))
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            else
                result = pCollision->type;
            break;

        case CLIPDATA_TYPE_AIR:
        case CLIPDATA_TYPE_PASS_THROUGH_BOTTOM:
            // No calculations needed, return type
            result = pCollision->type;
            break;

        case CLIPDATA_TYPE_ENEMY_ONLY:
            if (pCollision->actor > COLLISION_ACTOR_NON_SPRITE)
            {
                // Only for sprites
                pCollision->type = CLIPDATA_TYPE_AIR;
                result = CLIPDATA_TYPE_AIR;
            }
            else
            {
                // For non sprite
                pCollision->type = CLIPDATA_TYPE_SOLID;
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            }
            break;

        case CLIPDATA_TYPE_STOP_ENEMY:
            if (pCollision->actor <= COLLISION_ACTOR_NON_SPRITE)
            {
                // For non sprite
                pCollision->type = CLIPDATA_TYPE_AIR;
                result = CLIPDATA_TYPE_AIR;
            }
            else
            {
                // For sprite
                pCollision->type = CLIPDATA_TYPE_SOLID;
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            }
            break;

        case CLIPDATA_TYPE_TANK:
            if (pCollision->actor == COLLISION_ACTOR_SAMUS)
            {
                // For samus
                pCollision->type = CLIPDATA_TYPE_AIR;
                result = CLIPDATA_TYPE_AIR;
            }
            else
            {
                // For non samus
                pCollision->type = CLIPDATA_TYPE_SOLID;
                result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            }
            break;

        case CLIPDATA_TYPE_DOOR:
            clipdata = (gBackgroundsData.pClipDecomp + pCollision->tileY * gBackgroundsData.clipdataWidth)[pCollision->tileX];

            if (clipdata & CLIPDATA_TILEMAP_FLAG)
            {
                clipdata = sClipdataTilemapBehaviorTypes[clipdata & 0x7FFF];
            }
            else
            {
                clipdata = gTilemapAndClipPointers.pClipBehaviors[clipdata];
            }

            result = 0x7;
            if (clipdata > 0x7F)
            {
                result = 0x0;
                if (clipdata > 0x85)
                {
                    result = 0x1;
                    if (clipdata > 0x85)
                    {
                        result = 0x1;
                        if (clipdata > 0x8B)
                        {
                            result = 0x2;
                            if (clipdata > 0x91)
                            {
                                result = 0x3;
                                if (clipdata > 0x97)
                                {
                                    if (clipdata <= 0x9D)
                                        result = 0x4;
                                    else
                                        result = 0x7;
                                }
                            }
                        }
                    }
                }
            }

            if (result <= 4)
            {
                tmp = clipdata - 0x80;
                result = tmp - result * 6;
                clipdata = FALSE;

                if (gHatchData[result].unk_1_0 == 2)
                    clipdata = TRUE;
            }
            else
                clipdata = FALSE;

            result = CLIPDATA_TYPE_AIR;

            if (clipdata)
            {
                pCollision->type = result;
                break;
            }

            pCollision->type = CLIPDATA_TYPE_SOLID;
            result = pCollision->type | CLIPDATA_TYPE_SOLID_FLAG;
            break;
    }

    return result;
}

/**
 * @brief 68e70 | 154 | Updates the current affecting clipdata
 * 
 * @param yPosition Y position (in sub-pixels)
 * @param xPosition X position (in sub-pixels)
 * @return u32 Current affecting
 */
u32 ClipdataCheckCurrentAffectingAtPosition(u16 yPosition, u16 xPosition)
{
    u32 clipdata;
    u32 behavior;
    s32 tileY;
    s32 tileX;
    s32 array[3];

    // Reset values
    gCurrentAffectingClipdata.movement = CLIPDATA_MOVEMENT_NONE;
    gCurrentAffectingClipdata.hazard = HAZARD_NONE;

    // Check in bounds
    if (yPosition >= BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataHeight) || xPosition >= BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataWidth))
    {
        // Out of bounds on either axis, consider everything is none
        return C_32_2_16(HAZARD_NONE, CLIPDATA_MOVEMENT_NONE);
    }

    // Get tile position
    tileY = SUB_PIXEL_TO_BLOCK(yPosition);
    tileX = SUB_PIXEL_TO_BLOCK(xPosition);

    // Get clipdata at position
    clipdata = tileY * gBackgroundsData.clipdataWidth + tileX;
    clipdata = gBackgroundsData.pClipDecomp[clipdata];

    // Get behavior
    if (clipdata & CLIPDATA_TILEMAP_FLAG)
    {
        behavior = sClipdataTilemapBehaviorTypes[clipdata & 0x7FFF];
    }
    else
    {
        behavior = gTilemapAndClipPointers.pClipBehaviors[clipdata];
    }

    clipdata = CLIPDATA_MOVEMENT_NONE;

    // Check for movement clipdata
    if (behavior == CLIP_BEHAVIOR_WALL_LADDER)
        clipdata = CLIPDATA_MOVEMENT_WALL_LADDER;
    else if (behavior == CLIP_BEHAVIOR_PREVENTS_CLIMBING_INTO_FROM_LADDER)
        clipdata = CLIPDATA_MOVEMENT_PREVENTS_CLIMBING_INTO_FROM_LADDER;
    else if (behavior == CLIP_BEHAVIOR_CEILING_LADDER)
        clipdata = CLIPDATA_MOVEMENT_CEILING_LADDER;
    else if (behavior == CLIP_BEHAVIOR_ELEVATOR_DOWN)
        clipdata = CLIPDATA_MOVEMENT_ELEVATOR_DOWN;
    else if (behavior == CLIP_BEHAVIOR_ELEVATOR_UP)
        clipdata = CLIPDATA_MOVEMENT_ELEVATOR_UP;
    else if (behavior == CLIP_BEHAVIOR_10)
        clipdata = CLIPDATA_MOVEMENT_BEHAVIOR_10;
    else if (behavior == CLIP_BEHAVIOR_11)
        clipdata = CLIPDATA_MOVEMENT_BEHAVIOR_11;
    else if (behavior == CLIP_BEHAVIOR_96)
        clipdata = CLIPDATA_MOVEMENT_BEHAVIOR_96;

    // Check is elevator
    if (clipdata == CLIPDATA_MOVEMENT_ELEVATOR_DOWN || clipdata == CLIPDATA_MOVEMENT_ELEVATOR_UP)
    {
        // If not already riding, check if can use the elevator
        if (gSamusData.pose != SPOSE_USING_AN_ELEVATOR && ClipdataCheckCantUseElevator(clipdata))
        {
            // Can't use the elevator, so void the movement clipdata
            clipdata = CLIPDATA_MOVEMENT_NONE;
        }

        gDisableDoorsAndTanks = FALSE;
    }

    // Register movement clipdata
    gCurrentAffectingClipdata.movement = clipdata;

    clipdata = HAZARD_NONE;

    // Check for hazard clipdata
    if (behavior == CLIP_BEHAVIOR_WATER)
    {
        clipdata = HAZARD_WATER;
    }
    else
    {
        // Check BG0 exists
        if (gCurrentRoomEntry.bg0Prop != 0 && gCurrentRoomEntry.damagingEffect != 0x0)
        {
            // Check for full room effects
            if (gCurrentRoomEntry.damagingEffect == 0x5)
            {
                clipdata = HAZARD_COLD_KNOCKBACK;
            }
            else if (gCurrentRoomEntry.damagingEffect == 0x6)
            {
                clipdata = HAZARD_COLD;
            }
            else
            {
                // Different effect below and above effect

                // Check above effect
                if (gCurrentRoomEntry.damagingEffect == 0x3)
                    clipdata = HAZARD_HEAT;

                // Check below effect
                if (gEffectYPosition <= yPosition)
                {
                    // Set effect
                    if (gCurrentRoomEntry.damagingEffect == 0x1)
                        clipdata = HAZARD_WATER;
                    else if (gCurrentRoomEntry.damagingEffect == 0x2)
                        clipdata = HAZARD_LAVA;
                    else if (gCurrentRoomEntry.damagingEffect == 0x4)
                        clipdata = HAZARD_ACID;
                    else if (gCurrentRoomEntry.damagingEffect == 0x3)
                        clipdata = HAZARD_LAVA;
                }
            }
        }
    }

    // Register hazard
    gCurrentAffectingClipdata.hazard = clipdata;

    // Construct the result in an u32
    return C_32_2_16(gCurrentAffectingClipdata.movement, gCurrentAffectingClipdata.hazard);
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
    if (movementClip == CLIPDATA_MOVEMENT_ELEVATOR_DOWN)
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
        if (clipdata == CLIP_BEHAVIOR_NONE)
            clipdata = GROUND_EFFECT_NONE;
        else if (clipdata == CLIP_BEHAVIOR_WET_GROUND)
            clipdata = GROUND_EFFECT_WET_GROUND;
        else if (clipdata == CLIP_BEHAVIOR_DUSTY_GROUND)
            clipdata = GROUND_EFFECT_DUSTY_GROUND;
        else if (clipdata == CLIP_BEHAVIOR_VERY_DUSTY_GROUND)
            clipdata = GROUND_EFFECT_VERY_DUSTY_GROUND;
        else if (clipdata == CLIP_BEHAVIOR_82)
            clipdata = GROUND_EFFECT_4;
        else if (clipdata == CLIP_BEHAVIOR_BUBBLY_GROUND)
            clipdata = GROUND_EFFECT_BUBBLY_GROUND;
        else
            clipdata = GROUND_EFFECT_NONE;
    }
    else
        clipdata = GROUND_EFFECT_NONE;


    return clipdata;
}
