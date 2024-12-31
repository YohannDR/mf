#include "location_text.h"
#include "globals.h"
#include "gba.h"

#include "data/engine_pointers.h"
#include "data/sprites/area_banner.h"
#include "data/spriteset.h"

#include "constants/connection.h"
#include "constants/room.h"
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
        case MAIN_DECK_7:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_10:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_25:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_26:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_27:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_28:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_29:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_30:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_61:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_75:
            locationText = LT_MAIN_DECK;
            break;

        case MAIN_DECK_48:
            locationText = LT_REACTOR_SILO;
            break;

        case MAIN_DECK_55:
            locationText = LT_REACTOR_SILO;
            break;

        case MAIN_DECK_68:
            locationText = LT_REACTOR_SILO;
            break;

        case MAIN_DECK_83:
            locationText = LT_REACTOR_SILO;
            break;

        case MAIN_DECK_62:
            locationText = LT_RESTRICTED_ZONE;
            break;

        case MAIN_DECK_67:
            locationText = LT_RESTRICTED_ZONE;
            break;

        case MAIN_DECK_60:
            locationText = LT_OPERATIONS_DECK;
            break;

        case MAIN_DECK_76:
            locationText = LT_HABITATIONS_DECK;
            break;

        case MAIN_DECK_6:
            locationText = LT_DOCKING_BAY;
            break;

        case MAIN_DECK_74:
            locationText = LT_OPERATIONS_ROOM;
            break;

        case MAIN_DECK_82:
            locationText = LT_OPERATIONS_ROOM;
            break;

        case MAIN_DECK_71:
            locationText = LT_QUARANTINE_BAY;
            break;

        case MAIN_DECK_46:
            locationText = LT_SUB_ZERO_CONTAINMENT;
            break;

        case MAIN_DECK_49:
            locationText = LT_CENTRAL_REACTOR_CORE;
            break;

        case MAIN_DECK_59:
            locationText = LT_CENTRAL_REACTOR_CORE;
            break;

        case MAIN_DECK_54:
            locationText = LT_AUXILARY_POWER_STATION;
            break;

        case MAIN_DECK_78:
            locationText = LT_RESTRICTED_LABORATORY;
            break;

        case MAIN_DECK_79:
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
        case SECTOR_1_31 + 1:
            locationText = LT_SECTOR_1;
            break;

        case SECTOR_1_41 + 1:
            locationText = LT_SECTOR_1;
            break;

        case SECTOR_1_48 + 1:
            locationText = LT_SECTOR_1;
            break;

        case SECTOR_1_49 + 1:
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
        case SECTOR_2_24:
            locationText = LT_SECTOR_2;
            break;

        case SECTOR_2_29:
            locationText = LT_SECTOR_2;
            break;

        case SECTOR_2_36:
            locationText = LT_SECTOR_2;
            break;

        case SECTOR_2_52:
            locationText = LT_SECTOR_2;
            break;

        case SECTOR_2_53:
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
        case SECTOR_3_20:
            locationText = LT_SECTOR_3;
            break;

        case SECTOR_3_37:
            locationText = LT_SECTOR_3;
            break;

        case SECTOR_3_38:
            locationText = LT_SECTOR_3;
            break;

        case SECTOR_3_17:
            locationText = LT_MAIN_BOILER;
            break;

        case SECTOR_3_29:
            locationText = LT_MAIN_BOILER;
            break;

        case SECTOR_3_25:
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
        case SECTOR_5_25 + 1:
            locationText = LT_SECTOR_5;
            break;

        case SECTOR_5_31 + 1:
            locationText = LT_SECTOR_5;
            break;

        case SECTOR_5_37 + 1:
            locationText = LT_SECTOR_5;
            break;

        case SECTOR_5_50 + 1:
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
        case SECTOR_4_23:
            locationText = LT_SECTOR_4;
            break;

        case SECTOR_4_27:
            locationText = LT_SECTOR_4;
            break;

        case SECTOR_4_43:
            locationText = LT_SECTOR_4;
            break;

        case SECTOR_4_44:
            locationText = LT_SECTOR_4;
            break;

        case SECTOR_4_33:
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
        case SECTOR_6_17 + 1:
            locationText = LT_SECTOR_6;
            break;

        case SECTOR_6_22 + 1:
            locationText = LT_SECTOR_6;
            break;

        case SECTOR_6_36 + 1:
            locationText = LT_SECTOR_6;
            break;

        case SECTOR_6_37 + 1:
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
        case SPRITESET_6:
            locationText = LT_NAVIGATION_ROOM;
            break;

        case SPRITESET_10:
            locationText = LT_RECHARGE_ROOM;
            break;

        case SPRITESET_11:
            locationText = LT_SAVE_ROOM;
            break;

        case SPRITESET_12:
            locationText = LT_DATA_ROOM;
            break;

        case SPRITESET_13:
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
                DMA_SET(3, sAreaBannerLocationPal, PALRAM_OBJ + 0x100 + gfxSlot * 16 * sizeof(u16), C_32_2_16(DMA_ENABLE, sizeof(sAreaBannerLocationPal) / sizeof(u16)));
            }
        }
    }

    return gfxSlot;
}
