#include "menus/debug_menu.h"
#include "globals.h"
#include "gba.h"
#include "macros.h"
#include "event.h"

#include "data/menus/debug_menu.h"

#include "constants/menus/debug_menu.h"
#include "constants/samus.h"

#include "structs/menus/debug_menu.h"
#include "structs/event.h"
#include "structs/samus.h"
#include "structs/sprite.h"

void DebugMenuSoubroutine(void)
{

}

u32 DebugMenuModifyValues(void)
{
    s32 cursorY;
    s32 cursorX;
    s32 i;
    s32 j;
    s32 updateFlag;
    s32 disableInput;
    u8 eventBackup;
    u8 ebeBackup;
    u8 ebeCopyBackup;

    cursorY = PAUSE_SCREEN_DATA.oam[0].yPosition / (QUARTER_BLOCK_SIZE / 2);
    cursorX = PAUSE_SCREEN_DATA.oam[0].xPosition / (QUARTER_BLOCK_SIZE / 2);

    updateFlag = FALSE;
    
    for (i = 0; i < DEBUG_SECTION_END; i++)
    {
        if (sDebugSectionInfo[i][0] > cursorY)
            continue;

        if (sDebugSectionInfo[i][1] < cursorY)
            continue;

        if (sDebugSectionInfo[i][2] > cursorX)
            continue;

        if (sDebugSectionInfo[i][3] < cursorX)
            continue;

        updateFlag = TRUE;
        break;
    }

    if (!updateFlag)
        return;

    if (sDebugSectionInfo[i][4] != DEBUG_SECTION_EVENT && gChangedInput & KEY_B && PAUSE_SCREEN_DATA.debugMenuEditingValue)
    {
        PAUSE_SCREEN_DATA.debugMenuEditingValue = FALSE;
        UpdateMenuOamDataId(0, 0x1);

        if (sDebugSectionInfo[i][4] == DEBUG_SECTION_IN_GAME_TIME)
            gMaxInGameTimeFlag = FALSE;

        return;
    }

    cursorY = cursorY - sDebugSectionInfo[i][0];
    cursorX = sDebugSectionInfo[i][3] - cursorX;

    switch (sDebugSectionInfo[i][4])
    {
        case DEBUG_SECTION_BEAM:
            if (gChangedInput & KEY_A)
            {
                gEquipment.beamStatus ^= sDebugMenuBeamFlags[cursorY];
                gAbilityCount = 0;
            }
            break;

        case DEBUG_SECTION_MISSILE:
            if (gChangedInput & KEY_A)
            {
                gEquipment.weaponsStatus ^= sDebugMenuMissileFlags[cursorY];
                gAbilityCount = 0;
            }
            break;

        case DEBUG_SECTION_BOMB:
            if (gChangedInput & KEY_A)
            {
                gEquipment.weaponsStatus ^= sDebugMenuBombFlags[cursorY];
                gAbilityCount = 0;
            }
            break;

        case DEBUG_SECTION_SUIT:
            if (gChangedInput & KEY_A)
            {
                gEquipment.suitMiscStatus ^= sDebugMenuSuitFlags[cursorY];
                gAbilityCount = 0;
            }
            break;

        case DEBUG_SECTION_MISC:
            if (gChangedInput & KEY_A)
            {
                gEquipment.suitMiscStatus ^= sDebugMenuMiscFlags[cursorY];
                gAbilityCount = 0;
            }
            break;

        case DEBUG_SECTION_ENERGY_CURRENT:
        case DEBUG_SECTION_ENERGY_MAX:
        case DEBUG_SECTION_MISSILE_CURRENT:
        case DEBUG_SECTION_MISSILE_MAX:
        case DEBUG_SECTION_POWER_BOMB_CURRENT:
        case DEBUG_SECTION_POWER_BOMB_MAX:
            updateFlag = 0x0;
            if (gChangedInput & KEY_A)
            {
                PAUSE_SCREEN_DATA.oam[0].oamId = 0x9;
                PAUSE_SCREEN_DATA.debugMenuEditingValue = TRUE;
            }

            if (!PAUSE_SCREEN_DATA.debugMenuEditingValue)
                break;

            if (DebugMenuModifyHealthAndAmmo(cursorX, sDebugSectionInfo[i][4]))
            {
                updateFlag = 0x2;
            }
            break;

        case DEBUG_SECTION_ABILITY_COUNT:
            updateFlag = 0x0;

            if (gChangedInput & KEY_A)
            {
                PAUSE_SCREEN_DATA.oam[0].oamId = 0x9;
                PAUSE_SCREEN_DATA.debugMenuEditingValue = TRUE;
            }

            if (!PAUSE_SCREEN_DATA.debugMenuEditingValue)
                break;

            if (DebugMenuModifiyAbilityCount(cursorX))
            {
                updateFlag = 0x3;
            }
            break;

        case DEBUG_SECTION_SECURITY:
            if (gChangedInput & KEY_A)
            {
                if (gEquipment.securityHatchLevel == SECURITY_LEVEL_END - 1 - cursorX)
                    gEquipment.securityHatchLevel = SECURITY_LEVEL_3 - cursorX;
                else
                    gEquipment.securityHatchLevel = SECURITY_LEVEL_4 - cursorX;

                gSecurityHatchLevel = gEquipment.securityHatchLevel;
                gDebugMenuOptions.securityHatchLevel = gSecurityHatchLevel;
            }
            break;

        case DEBUG_SECTION_MAP:
            if (gChangedInput & KEY_A)
            {
                gEquipment.downloadedMaps ^= 1 << (AREA_SECTOR_6 - cursorX);
                gPreviousArea = UCHAR_MAX;
            }

            gDebugMenuOptions.downloadedMaps = gEquipment.downloadedMaps;
            break;

        case DEBUG_SECTION_EVENT:
            updateFlag = 0x0;
            disableInput = FALSE;

            if (!PAUSE_SCREEN_DATA.debugMenuEditingValue)
            {
                if (gChangedInput & KEY_A)
                {
                    PAUSE_SCREEN_DATA.debugMenuEditingValue = TRUE;
                    PAUSE_SCREEN_DATA.oam[0].oamId = 0x9;
    
                    updateFlag = 0x1;
    
                    write16(REG_WIN0V, C_16_2_8(0, 136));
                    write8(REG_WINOUT, WIN0_BG2);
    
                    PAUSE_SCREEN_DATA.dispcnt |= DCNT_BG0;
    
                    disableInput = 0x80;
                }

            }
            else
            {
                if (gChangedInput & (KEY_A | KEY_B))
                {
                    PAUSE_SCREEN_DATA.debugMenuEditingValue = FALSE;
                    UpdateMenuOamDataId(0, 0x1);

                    updateFlag = 0x1;

                    write16(REG_WIN0V, C_16_2_8(0, SCREEN_SIZE_Y));
                    write8(REG_WINOUT, WIN0_BG0 | WIN0_BG2 | WIN0_OBJ | WIN0_COLOR_EFFECT);
                }
            }

            if (!PAUSE_SCREEN_DATA.debugMenuEditingValue)
                break;

            if (!disableInput)
            {
                if (gChangedInput & KEY_DOWN)
                {
                    if (gEventCounter + sDebugMenuNumbersIncrementValues[cursorX] >= EVENT_END)
                        gEventCounter = EVENT_END - 1;
                    else
                        gEventCounter += sDebugMenuNumbersIncrementValues[cursorX];

                    disableInput = TRUE;
                }
                else if (gChangedInput & KEY_UP)
                {
                    if (gEventCounter - sDebugMenuNumbersIncrementValues[cursorX] < EVENT_NONE)
                        gEventCounter = EVENT_NONE;
                    else
                        gEventCounter -= sDebugMenuNumbersIncrementValues[cursorX];

                    disableInput = TRUE;
                }
                else if (gChangedInput & KEY_RIGHT)
                {
                    if (cursorX != 0)
                        PAUSE_SCREEN_DATA.oam[0].xPosition += QUARTER_BLOCK_SIZE / 2;
                }
                else if (gChangedInput & KEY_LEFT)
                {
                    if (cursorX < 2)
                        PAUSE_SCREEN_DATA.oam[0].xPosition -= QUARTER_BLOCK_SIZE / 2;
                }
                else
                {
                    DebugMenuCheckSetMaxHealthOrAmmo();
                }
            }

            if (!disableInput)
                break;

            gEquipment.beamStatus = 0;
            gEquipment.weaponsStatus = 0;
            gEquipment.suitMiscStatus = 0;

            ebeBackup = gCurrentEventBasedEffect;
            ebeCopyBackup = gCurrentEventBasedEffectCopy;
            eventBackup = gEventCounter;

            for (updateFlag = 0; updateFlag <= eventBackup; updateFlag++)
                EventSet(updateFlag);

            gCurrentEventBasedEffect = ebeBackup;
            gCurrentEventBasedEffectCopy = ebeCopyBackup;

            DebugMenuDrawSection(DEBUG_SECTION_ALL);
            DebugMenuDrawHealthAmmoAndEvent(DEBUG_SECTION_ALL);
            DebugMenuDrawAbilityCount();

            gSecurityHatchLevel = gEquipment.securityHatchLevel;
            gDebugMenuOptions.securityHatchLevel = gEquipment.securityHatchLevel;

            DebugMenuDrawEventText(gEventCounter);

            updateFlag = FALSE;
            if (gEventCounter > EVENT_WATER_LEVEL_LOWERED || (gEventCounter == EVENT_WATER_LEVEL_LOWERED && gCurrentEventBasedEffect == 0x80))
                updateFlag = TRUE;

            gWaterLowered = updateFlag;

            updateFlag = 0x0;
            break;

        case DEBUG_SECTION_SUB_EVENT:
            updateFlag = 0x0;
            disableInput = FALSE;

            if (!PAUSE_SCREEN_DATA.debugMenuEditingValue)
            {
                if (gChangedInput & KEY_A)
                {
                    PAUSE_SCREEN_DATA.debugMenuEditingValue = TRUE;
                    PAUSE_SCREEN_DATA.oam[0].oamId = 0x9;
                }
            }
            else
            {
                if (gChangedInput & (KEY_A | KEY_B))
                {
                    PAUSE_SCREEN_DATA.debugMenuEditingValue = FALSE;
                    UpdateMenuOamDataId(0, 0x1);
                }
            }

            if (!PAUSE_SCREEN_DATA.debugMenuEditingValue)
                break;

            if (disableInput)
                break;

            if (gChangedInput & KEY_DOWN)
            {
                if (gSubEventCounter + sDebugMenuNumbersIncrementValues[cursorX] >= SUB_EVENT_END)
                    gSubEventCounter = SUB_EVENT_END - 1;
                else
                    gSubEventCounter += sDebugMenuNumbersIncrementValues[cursorX];

                disableInput = TRUE;
            }
            else if (gChangedInput & KEY_UP)
            {
                if (gSubEventCounter - sDebugMenuNumbersIncrementValues[cursorX] < SUB_EVENT_NONE)
                    gSubEventCounter = SUB_EVENT_NONE;
                else
                    gSubEventCounter -= sDebugMenuNumbersIncrementValues[cursorX];

                disableInput = TRUE;
            }
            else if (gChangedInput & KEY_RIGHT)
            {
                if (cursorX != 0)
                    PAUSE_SCREEN_DATA.oam[0].xPosition += QUARTER_BLOCK_SIZE / 2;
            }
            else if (gChangedInput & KEY_LEFT)
            {
                if (cursorX < 2)
                    PAUSE_SCREEN_DATA.oam[0].xPosition -= QUARTER_BLOCK_SIZE / 2;
            }

            if (disableInput)
                updateFlag = 0x2;
            break;

        case DEBUG_SECTION_IN_GAME_TIME:
            updateFlag = 0x0;

            if (!PAUSE_SCREEN_DATA.debugMenuEditingValue)
            {
                if (gChangedInput & KEY_A)
                {
                    PAUSE_SCREEN_DATA.oam[0].oamId = 0x9;
                    PAUSE_SCREEN_DATA.debugMenuEditingValue = TRUE;
                    gMaxInGameTimeFlag = TRUE;
                    gInGameTimer.seconds = 0;
                    gInGameTimer.frames = 0;
                }
                break;
            }

            disableInput = FALSE;
            if (gChangedInput & KEY_DOWN)
            {
                if (cursorX > 3)
                {
                    cursorX -= 3;
                    if (gInGameTimer.hours + sDebugMenuNumbersIncrementValues[cursorX] > UCHAR_MAX)
                        gInGameTimer.hours = UCHAR_MAX;
                    else
                        gInGameTimer.hours += sDebugMenuNumbersIncrementValues[cursorX];
                }
                else if (cursorX < 2)
                {
                    if (gInGameTimer.minutes + sDebugMenuNumbersIncrementValues[cursorX] > 59)
                        gInGameTimer.minutes = 59;
                    else
                        gInGameTimer.minutes += sDebugMenuNumbersIncrementValues[cursorX];
                }

                disableInput = TRUE;
            }
            else if (gChangedInput & KEY_UP)
            {
                if (cursorX > 2)
                {
                    cursorX -= 3;
                    if (gInGameTimer.hours - sDebugMenuNumbersIncrementValues[cursorX] < 0)
                        gInGameTimer.hours = 0;
                    else
                        gInGameTimer.hours -= sDebugMenuNumbersIncrementValues[cursorX];
                }
                else if (cursorX < 2)
                {
                    if (gInGameTimer.minutes - sDebugMenuNumbersIncrementValues[cursorX] < 0)
                        gInGameTimer.minutes = 0;
                    else
                        gInGameTimer.minutes -= sDebugMenuNumbersIncrementValues[cursorX];
                }

                disableInput = TRUE;
            }
            else if (gChangedInput & KEY_RIGHT)
            {
                if (cursorX != 0)
                    PAUSE_SCREEN_DATA.oam[0].xPosition += QUARTER_BLOCK_SIZE / 2;
            }
            else if (gChangedInput & KEY_LEFT)
            {
                if (cursorX < 5)
                    PAUSE_SCREEN_DATA.oam[0].xPosition -= QUARTER_BLOCK_SIZE / 2;
            }

            if (disableInput)
                DebugMenuDrawIgt();
            break;

        case DEBUG_SECTION_QUICK_SAVE:
            if (gCurrentArea + gCurrentRoom != 0 && gChangedInput & KEY_A)
            {
                for (j = 0; j < 4; j++)
                    Sram_QuickSave(j);
            }
            break;

        default:
            updateFlag = 0x0;
    }

    if (updateFlag == 0x1)
        DebugMenuDrawSection(sDebugSectionInfo[i][4]);
    else if (updateFlag == 0x2)
        DebugMenuDrawHealthAmmoAndEvent(sDebugSectionInfo[i][4]);
    else if (updateFlag == 0x3)
        DebugMenuDrawSection(DEBUG_SECTION_ALL);

    if (updateFlag)
        DebugMenuDrawAbilityCount();
}

/**
 * @brief 7db34 | 40 | Draws the name of an event
 * 
 * @param event Event id
 */
void DebugMenuDrawEventText(u8 event)
{
    u16* dst;
    s32 i;

    dst = VRAM_BASE + 0x7800;

    for (i = 0; i < EVENT_NAME_SIZE; i++)
    {
        TextDrawDebugMenuCharacter(((sDebugMenuEventNames[event][i] & 0xE0) << 1) | (sDebugMenuEventNames[event][i] & 0x1F), &dst[i * 16], 0);
    }
}

void DebugMenuDrawSection(u8 section)
{

}

void SetAbilityCount(u8 abilityCount)
{

}

u32 DebugMenuModifiyAbilityCount(u8 cursorX)
{

}

void DebugMenuDrawAbilityCount(void)
{
    // https://decomp.me/scratch/W20fm

    s32 value;
    s32 i;
    s32 position;
    u16* dst;

    dst = VRAM_BASE + 0xC800;
    position = sDebugSectionInfo[DEBUG_SECTION_ABILITY_COUNT][0] * HALF_BLOCK_SIZE + sDebugSectionInfo[DEBUG_SECTION_ABILITY_COUNT][2];

    for (i = position, value = 10; value > 0; value /= 10, i++)
    {
        dst[i] = 0x3080 + gAbilityCount / value % 10;
    }
}

/**
 * @brief 7e0b0 | a8 | Draws the current room and last door used
 * 
 */
void DebugMenuDrawMenuAndDoor(void)
{
    s32 value;
    u16* dst;
    s32 position;
    s32 i;

    dst = VRAM_BASE + 0xC800;
    position = sDebugLocationSectionInfo[0][0] * HALF_BLOCK_SIZE + sDebugLocationSectionInfo[0][1];
    position += 2;

    for (i = position, value = 100; value > 0; value /= 10, i++)
    {
        dst[i] = 0x3080 + (gCurrentRoom + 1) / value % 10;
    }

    position = sDebugLocationSectionInfo[1][0] * HALF_BLOCK_SIZE + sDebugLocationSectionInfo[1][1];
    position += 2;

    for (i = position, value = 100; value > 0; value /= 10, i++)
    {
        dst[i] = 0x3080 + gLastDoorUsed / value % 10;
    }
}

void DebugMenuDrawIgt(void)
{

}

void unk_7e224(void)
{

}

u32 DebugMenuModifyHealthAndAmmo(u8 cursorX, u8 section)
{

}

/**
 * @brief 7e478 | a8 | Draws a numbered section of the debug menu (health, ammo or events)
 * 
 * @param section Section
 */
void DebugMenuDrawHealthAmmoAndEvent(u8 section)
{
    u8 drawAll;

    // Check draw all
    if (section == DEBUG_SECTION_ALL)
        drawAll = TRUE;
    else
        drawAll = FALSE;

    // Energy, draw both
    if (section == DEBUG_SECTION_ENERGY_CURRENT || section == DEBUG_SECTION_ENERGY_MAX || drawAll)
    {
        DebugMenuDrawNumber(gEquipment.currentEnergy, DEBUG_SECTION_ENERGY_CURRENT);
        DebugMenuDrawNumber(gEquipment.maxEnergy, DEBUG_SECTION_ENERGY_MAX);
    }

    // Missile, draw both
    if (section == DEBUG_SECTION_MISSILE_CURRENT || section == DEBUG_SECTION_MISSILE_MAX || drawAll)
    {
        DebugMenuDrawNumber(gEquipment.currentMissiles, DEBUG_SECTION_MISSILE_CURRENT);
        DebugMenuDrawNumber(gEquipment.maxMissiles, DEBUG_SECTION_MISSILE_MAX);
    }

    // Power bomb, draw both
    if (section == DEBUG_SECTION_POWER_BOMB_CURRENT || section == DEBUG_SECTION_POWER_BOMB_MAX || drawAll)
    {
        DebugMenuDrawNumber(gEquipment.currentPowerBombs, DEBUG_SECTION_POWER_BOMB_CURRENT);
        DebugMenuDrawNumber(gEquipment.maxPowerBombs, DEBUG_SECTION_POWER_BOMB_MAX);
    }

    // Event
    if (section == DEBUG_SECTION_EVENT || drawAll)
        DebugMenuDrawNumber(gEventCounter, DEBUG_SECTION_EVENT);

    // Sub event
    if (section == DEBUG_SECTION_SUB_EVENT || drawAll)
        DebugMenuDrawNumber(gSubEventCounter, DEBUG_SECTION_SUB_EVENT);
}

void DebugMenuDrawNumber(u16 value, u8 section)
{

}

/**
 * @brief 7e590 | 9c | Checks to set health/ammo to maximum or minimum
 * 
 */
void DebugMenuCheckSetMaxHealthOrAmmo(void)
{
    if (gChangedInput & (KEY_START | KEY_R))
    {
        // Set max value, update current, max then re-draw
        gEquipment.currentEnergy = sDebugMenuNumbersMaxValues[0];
        gEquipment.maxEnergy = sDebugMenuNumbersMaxValues[0];
        DebugMenuDrawHealthAmmoAndEvent(sDebugSectionInfo[DEBUG_SECTION_ENERGY_CURRENT][4]);

        gEquipment.currentMissiles = sDebugMenuNumbersMaxValues[1];
        gEquipment.maxMissiles = sDebugMenuNumbersMaxValues[1];
        DebugMenuDrawHealthAmmoAndEvent(sDebugSectionInfo[DEBUG_SECTION_MISSILE_CURRENT][4]);

        gEquipment.currentPowerBombs = sDebugMenuNumbersMaxValues[2];
        gEquipment.maxPowerBombs = sDebugMenuNumbersMaxValues[2];
        DebugMenuDrawHealthAmmoAndEvent(sDebugSectionInfo[DEBUG_SECTION_POWER_BOMB_CURRENT][4]);

        return;
    }

    if (gChangedInput & (KEY_SELECT | KEY_L))
    {
        // Set min value, update current, max then re-draw
        gEquipment.currentEnergy = 99;
        gEquipment.maxEnergy = 99;
        DebugMenuDrawHealthAmmoAndEvent(sDebugSectionInfo[DEBUG_SECTION_ENERGY_CURRENT][4]);

        gEquipment.currentMissiles = 10;
        gEquipment.maxMissiles = 10;
        DebugMenuDrawHealthAmmoAndEvent(sDebugSectionInfo[DEBUG_SECTION_MISSILE_CURRENT][4]);

        gEquipment.currentPowerBombs = 10;
        gEquipment.maxPowerBombs = 10;
        DebugMenuDrawHealthAmmoAndEvent(sDebugSectionInfo[DEBUG_SECTION_POWER_BOMB_CURRENT][4]);
    }
}

/**
 * @brief 7e62c | 20 | Draws everything on the debug menu
 * 
 */
void DebugMenuDrawEverything(void)
{
    DebugMenuDrawSection(DEBUG_SECTION_ALL);
    DebugMenuDrawHealthAmmoAndEvent(DEBUG_SECTION_ALL);
    DebugMenuDrawAbilityCount();
    DebugMenuDrawMenuAndDoor();
    DebugMenuDrawIgt();
}

void DebugMenuSetupCursor(void)
{

}
