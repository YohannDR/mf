#include "location_text.h"
#include "globals.h"
#include "gba.h"

#include "data/engine_pointers.h"

#include "constants/connection.h"
#include "constants/sprite.h"

#include "structs/connection.h"
#include "structs/sprite.h"

/**
 * @brief 14310 | 190 | Gets the location text for the main deck
 * 
 * @return u8 Location text
 */
u8 LocationTextGetMainDeck(void)
{
    u8 locationText;

    locationText = UCHAR_MAX;

    switch (gCurrentRoom)
    {
        case 7:
            locationText = LT_MAIN_DECK;
            break;

        case 10:
            locationText = LT_MAIN_DECK;
            break;

        case 25:
            locationText = LT_MAIN_DECK;
            break;

        case 26:
            locationText = LT_MAIN_DECK;
            break;

        case 27:
            locationText = LT_MAIN_DECK;
            break;

        case 28:
            locationText = LT_MAIN_DECK;
            break;

        case 29:
            locationText = LT_MAIN_DECK;
            break;

        case 30:
            locationText = LT_MAIN_DECK;
            break;

        case 61:
            locationText = LT_MAIN_DECK;
            break;

        case 75:
            locationText = LT_MAIN_DECK;
            break;

        case 48:
            locationText = LT_REACTOR_SILO;
            break;

        case 55:
            locationText = LT_REACTOR_SILO;
            break;

        case 68:
            locationText = LT_REACTOR_SILO;
            break;

        case 83:
            locationText = LT_REACTOR_SILO;
            break;

        case 62:
            locationText = LT_RESTRICTED_ZONE;
            break;

        case 67:
            locationText = LT_RESTRICTED_ZONE;
            break;

        case 60:
            locationText = LT_OPERATIONS_DECK;
            break;

        case 76:
            locationText = LT_HABITATIONS_DECK;
            break;

        case 6:
            locationText = LT_DOCKING_BAY;
            break;

        case 74:
            locationText = LT_OPERATIONS_ROOM;
            break;

        case 82:
            locationText = LT_OPERATIONS_ROOM;
            break;

        case 71:
            locationText = LT_QUARANTINE_BAY;
            break;

        case 46:
            locationText = LT_SUB_ZERO_CONTAINMENT;
            break;

        case 49:
            locationText = LT_CENTRAL_REACTOR_CORE;
            break;

        case 59:
            locationText = LT_CENTRAL_REACTOR_CORE;
            break;

        case 54:
            locationText = LT_AUXILARY_POWER_STATION;
            break;

        case 78:
            locationText = LT_RESTRICTED_LABORATORY;
            break;

        case 79:
            locationText = LT_RESTRICTED_LABORATORY;
            break;
    }

    return locationText;
}

/**
 * @brief 144a0 | 2c | Gets the location text for the sector 1
 * 
 * @return u8 Location text
 */
u8 LocationTextGetSector1(void)
{
    u8 locationText;

    locationText = UCHAR_MAX;

    switch (gCurrentRoom + 1)
    {
        case 32:
            locationText = LT_SECTOR_1;
            break;

        case 42:
            locationText = LT_SECTOR_1;
            break;

        case 49:
            locationText = LT_SECTOR_1;
            break;

        case 50:
            locationText = LT_SECTOR_1;
            break;
    }

    return locationText;
}

/**
 * @brief 144cc | a0 | Gets the location text for the sector 2
 * 
 * @return u8 Location text
 */
u8 LocationTextGetSector2(void)
{
    u8 locationText;

    locationText = UCHAR_MAX;

    switch (gCurrentRoom)
    {
        case 24:
            locationText = LT_SECTOR_2;
            break;

        case 29:
            locationText = LT_SECTOR_2;
            break;

        case 36:
            locationText = LT_SECTOR_2;
            break;

        case 52:
            locationText = LT_SECTOR_2;
            break;

        case 53:
            locationText = LT_SECTOR_2;
            break;
    }

    return locationText;
}

/**
 * @brief 1456c | 88 | Gets the location text for the sector 3
 * 
 * @return u8 Location text
 */
u8 LocationTextGetSector3(void)
{
    u8 locationText;

    locationText = UCHAR_MAX;

    switch (gCurrentRoom)
    {
        case 20:
            locationText = LT_SECTOR_3;
            break;

        case 37:
            locationText = LT_SECTOR_3;
            break;

        case 38:
            locationText = LT_SECTOR_3;
            break;

        case 17:
            locationText = LT_MAIN_BOILER;
            break;

        case 29:
            locationText = LT_MAIN_BOILER;
            break;

        case 25:
            locationText = LT_MAIN_BOILER_CONTROL_ROOM;
            break;
    }

    return locationText;
}

/**
 * @brief 145f4 | 2c | Gets the location text for the sector 5
 * 
 * @return u8 Location text
 */
u8 LocationTextGetSector5(void)
{
    u8 locationText;

    locationText = UCHAR_MAX;

    switch (gCurrentRoom + 1)
    {
        case 25 + 1:
            locationText = LT_SECTOR_5;
            break;

        case 31 + 1:
            locationText = LT_SECTOR_5;
            break;

        case 37 + 1:
            locationText = LT_SECTOR_5;
            break;

        case 50 + 1:
            locationText = LT_SECTOR_5;
    }

    return locationText;
}

/**
 * @brief 14620 | 84 | Gets the location text for the sector 4
 * 
 * @return u8 Location text
 */
u8 LocationTextGetSector4(void)
{
    u8 locationText;

    locationText = UCHAR_MAX;

    switch (gCurrentRoom)
    {
        case 23:
            locationText = LT_SECTOR_4;
            break;

        case 27:
            locationText = LT_SECTOR_4;
            break;

        case 43:
            locationText = LT_SECTOR_4;
            break;

        case 44:
            locationText = LT_SECTOR_4;
            break;

        case 33:
            locationText = LT_PUMP_CONTROL_UNIT;
    }

    return locationText;
}

/**
 * @brief 146a4 | 2c | Gets the location text for the sector 6
 * 
 * @return u8 Location text
 */
u8 LocationTextGetSector6(void)
{
    u8 locationText;

    locationText = UCHAR_MAX;

    switch (gCurrentRoom + 1)
    {
        case 17 + 1:
            locationText = LT_SECTOR_6;
            break;

        case 22 + 1:
            locationText = LT_SECTOR_6;
            break;

        case 36 + 1:
            locationText = LT_SECTOR_6;
            break;

        case 37 + 1:
            locationText = LT_SECTOR_6;
    }

    return locationText;
}

/**
 * @brief 146d0 | 84 | Loads the area banner graphics
 * 
 * @return u8 Gfx slot
 */
u8 LocationTextLoadGfx(void)
{
    u8 gfxSlot;
    u8 i;

    gfxSlot = 0x80;
    
    for (i = 0; i < MAX_AMOUNT_OF_SPRITE_TYPES; i++)
    {
        if (gSpritesetSpriteIds[i] == PSPRITE_AREA_BANNER)
        {
            gfxSlot = gSpritesetSpriteGfxSlots[i];
            break;
        }
    }

    if (gfxSlot > 7)
    {
        DMA_SET(3, sSpritesGraphicsPointers[PSPRITE_AREA_BANNER - 0x10], VRAM_OBJ + 0x7800, C_32_2_16(DMA_ENABLE, 0x800 / 2));
        DMA_SET(3, sSpritesPalettePointers[PSPRITE_AREA_BANNER - 0x10], PALRAM_OBJ + 0x1E0, C_32_2_16(DMA_ENABLE, 16));

        gfxSlot = 7;
    }

    return gfxSlot;
}

/**
 * @brief 14754 | 130 | Checks if a location text should load
 * 
 * @return u8 Gfx slot
 */
u8 LocationTextCheckLoad(void)
{
    u8 locationText;
    u8 gfxSlot;

    locationText = UCHAR_MAX;
    gfxSlot = UCHAR_MAX;

    switch (gSpritesetNumber)
    {
        case 6:
            locationText = LT_NAVIGATION_ROOM;
            break;

        case 10:
            locationText = LT_RECHARGE_ROOM;
            break;

        case 11:
            locationText = LT_SAVE_ROOM;
            break;

        case 12:
            locationText = LT_DATA_ROOM;
            break;

        case 13:
            locationText = LT_SECURITY_ROOM;
    }

    if (locationText != UCHAR_MAX)
    {
        gSpriteData[0].roomSlot = locationText;

        gfxSlot = LocationTextLoadGfx();
        DrawLocationText(locationText, gfxSlot);
        return gfxSlot;
    }

    if (gDisplayLocationName)
    {
        switch (gCurrentArea)
        {
            case AREA_MAIN_DECK:
                locationText = LocationTextGetMainDeck();
                break;
    
            case AREA_SECTOR_1:
                locationText = LocationTextGetSector1();
                break;
    
            case AREA_SECTOR_2:
                locationText = LocationTextGetSector2();
                break;
    
            case AREA_SECTOR_3:
                locationText = LocationTextGetSector3();
                break;
    
            case AREA_SECTOR_5:
                locationText = LocationTextGetSector5();
                break;
    
            case AREA_SECTOR_4:
                locationText = LocationTextGetSector4();
                break;
    
            case AREA_SECTOR_6:
                locationText = LocationTextGetSector6();
                break;
        }
    
        if (locationText != UCHAR_MAX)
        {
            gSpriteData[0].roomSlot = locationText;
    
            gfxSlot = LocationTextLoadGfx();
            DrawLocationText(locationText, gfxSlot);
            
            if (locationText < LT_NAVIGATION_ROOM)
            {
                DMA_SET(3, 0x82f82ec, PALRAM_OBJ + 0x100 + gfxSlot * 16 * sizeof(u16), C_32_2_16(DMA_ENABLE, 16));
            }
        }
    }

    return gfxSlot;
}
