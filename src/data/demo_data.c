#include "data/demo_data.h"
#include "gba.h"
#include "macros.h"

#include "constants/connection.h"
#include "constants/event.h"
#include "constants/samus.h"

/*const struct DemoData sDemoData[DEMO_ID_END] = {
    [DEMO_ID_SECTOR_2] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_SECTOR_5] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_SECTOR_4] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_MAIN_DECK] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_WALL_JUMP] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_SHINESPARK] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_LADDERS] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_POWER_BOMBS] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_SECTOR_3] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_SECTOR_6] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_ARACHNUS] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
    [DEMO_ID_SCREW_ATTACK] = {
        .pInputs = ,
        .inputsLength = ,
        .pDurations = ,
        .durationLength = 
    },
};*/

const struct DemoRam sDemoRam[DEMO_ID_END] = {
    [DEMO_ID_SECTOR_2] = {
        .area = AREA_SECTOR_2,
        .lastDoorUsed = 20,
        .securityLevel = SECURITY_LEVEL_1,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2
        ),
        .event = EVENT_BOMB_DATA_DOWNLOADED,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_BOMBS,
        .maxEnergy = 399,
        .currentEnergy = 246,
        .maxMissiles = 35,
        .currentMissiles = 32,
        .maxPowerBombs = 10,
        .currentPowerBombs = 10,
        .samusDirection = KEY_LEFT,
        .samusX = BLOCK_SIZE * 29 + QUARTER_BLOCK_SIZE / 2,
        .samusY = BLOCK_SIZE * 20 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_SECTOR_5] = {
        .area = AREA_SECTOR_5,
        .lastDoorUsed = 49,
        .securityLevel = SECURITY_LEVEL_3,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2 |
            1 << AREA_SECTOR_3 |
            1 << AREA_SECTOR_4 |
            1 << AREA_SECTOR_5 |
            1 << AREA_SECTOR_6
        ),
        .event = EVENT_ICE_MISSILE_DATA_DOWNLOADED,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_ICE_MISSILES,
        .maxEnergy = 799,
        .currentEnergy = 432,
        .maxMissiles = 75,
        .currentMissiles = 48,
        .maxPowerBombs = 10,
        .currentPowerBombs = 10,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2,
        .samusY = BLOCK_SIZE * 59 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_SECTOR_4] = {
        .area = AREA_SECTOR_4,
        .lastDoorUsed = 15,
        .securityLevel = SECURITY_LEVEL_1,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2 |
            1 << AREA_SECTOR_3
        ),
        .event = EVENT_NAVIGATION_ROOM_ENTERING_AQA,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_HIGH_JUMP,
        .maxEnergy = 499,
        .currentEnergy = 352,
        .maxMissiles = 50,
        .currentMissiles = 42,
        .maxPowerBombs = 10,
        .currentPowerBombs = 10,
        .samusDirection = KEY_LEFT,
        .samusX = BLOCK_SIZE * 29 - QUARTER_BLOCK_SIZE,
        .samusY = BLOCK_SIZE * 9 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_MAIN_DECK] = {
        .area = AREA_MAIN_DECK,
        .lastDoorUsed = 84,
        .securityLevel = SECURITY_LEVEL_0,
        .downloadedMaps = (0),
        .event = EVENT_NAVIGATION_ROOM_AFTER_MISSILES,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_MISSILES,
        .maxEnergy = 99,
        .currentEnergy = 99,
        .maxMissiles = 15,
        .currentMissiles = 15,
        .maxPowerBombs = 30,
        .currentPowerBombs = 30,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 9 - QUARTER_BLOCK_SIZE,
        .samusY = BLOCK_SIZE * 21 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_WALL_JUMP] = {
        .area = AREA_SECTOR_1,
        .lastDoorUsed = 109,
        .securityLevel = SECURITY_LEVEL_0,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK
        ),
        .event = EVENT_CHARGE_BEAM_ABILITY_RECOVERED,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_MORPH_BALL,
        .maxEnergy = 199,
        .currentEnergy = 157,
        .maxMissiles = 50,
        .currentMissiles = 50,
        .maxPowerBombs = 30,
        .currentPowerBombs = 22,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 9 - QUARTER_BLOCK_SIZE,
        .samusY = BLOCK_SIZE * 29 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_SHINESPARK] = {
        .area = AREA_SECTOR_2,
        .lastDoorUsed = 134,
        .securityLevel = SECURITY_LEVEL_4,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2 |
            1 << AREA_SECTOR_3 |
            1 << AREA_SECTOR_4 |
            1 << AREA_SECTOR_5 |
            1 << AREA_SECTOR_6
        ),
        .event = EVENT_SCREW_ATTACK_ABILITY_RECOVERED,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_SCREW_ATTACK,
        .maxEnergy = 1299,
        .currentEnergy = 1124,
        .maxMissiles = 130,
        .currentMissiles = 73,
        .maxPowerBombs = 24,
        .currentPowerBombs = 16,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 7 + QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2,
        .samusY = BLOCK_SIZE * 31 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_LADDERS] = {
        .area = AREA_SECTOR_4,
        .lastDoorUsed = 17,
        .securityLevel = SECURITY_LEVEL_1,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2 |
            1 << AREA_SECTOR_3
        ),
        .event = EVENT_SPEED_BOOSTER_ABILITY_RECOVERED,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_SPEED_BOOSTER,
        .maxEnergy = 499,
        .currentEnergy = 326,
        .maxMissiles = 50,
        .currentMissiles = 38,
        .maxPowerBombs = 10,
        .currentPowerBombs = 10,
        .samusDirection = KEY_LEFT,
        .samusX = BLOCK_SIZE * 55 + HALF_BLOCK_SIZE + PIXEL_SIZE + ONE_SUB_PIXEL,
        .samusY = BLOCK_SIZE * 9 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_POWER_BOMBS] = {
        .area = AREA_SECTOR_5,
        .lastDoorUsed = 64,
        .securityLevel = SECURITY_LEVEL_3,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2 |
            1 << AREA_SECTOR_3 |
            1 << AREA_SECTOR_4 |
            1 << AREA_SECTOR_5 |
            1 << AREA_SECTOR_6
        ),
        .event = EVENT_ESCAPED_ARC_SA_X,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_POWER_BOMBS,
        .maxEnergy = 799,
        .currentEnergy = 683,
        .maxMissiles = 85,
        .currentMissiles = 58,
        .maxPowerBombs = 16,
        .currentPowerBombs = 14,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE,
        .samusY = BLOCK_SIZE * 9 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_SECTOR_3] = {
        .area = AREA_SECTOR_3,
        .lastDoorUsed = 19,
        .securityLevel = SECURITY_LEVEL_2,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2 |
            1 << AREA_SECTOR_3
        ),
        .event = EVENT_BOX_DEFEATED,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_SUPER_MISSILES,
        .maxEnergy = 599,
        .currentEnergy = 436,
        .maxMissiles = 60,
        .currentMissiles = 35,
        .maxPowerBombs = 10,
        .currentPowerBombs = 10,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 21,
        .samusY = BLOCK_SIZE * 19 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_SECTOR_6] = {
        .area = AREA_SECTOR_6,
        .lastDoorUsed = 1,
        .securityLevel = SECURITY_LEVEL_4,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2 |
            1 << AREA_SECTOR_3 |
            1 << AREA_SECTOR_4 |
            1 << AREA_SECTOR_5 |
            1 << AREA_SECTOR_6
        ),
        .event = EVENT_NAVIGATION_ROOM_ENTERING_NOC_2,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_DIFFUSION_MISSILES,
        .maxEnergy = 999,
        .currentEnergy = 999,
        .maxMissiles = 110,
        .currentMissiles = 110,
        .maxPowerBombs = 24,
        .currentPowerBombs = 24,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 19 + HALF_BLOCK_SIZE,
        .samusY = BLOCK_SIZE * 9 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_ARACHNUS] = {
        .area = AREA_MAIN_DECK,
        .lastDoorUsed = 88,
        .securityLevel = SECURITY_LEVEL_0,
        .downloadedMaps = (0),
        .event = EVENT_NAVIGATION_ROOM_AFTER_MISSILES,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_MISSILES,
        .maxEnergy = 199,
        .currentEnergy = 199,
        .maxMissiles = 15,
        .currentMissiles = 15,
        .maxPowerBombs = 10,
        .currentPowerBombs = 10,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 51 + HALF_BLOCK_SIZE,
        .samusY = BLOCK_SIZE * 11 - ONE_SUB_PIXEL,
    },
    [DEMO_ID_SCREW_ATTACK] = {
        .area = AREA_SECTOR_1,
        .lastDoorUsed = 35,
        .securityLevel = SECURITY_LEVEL_4,
        .downloadedMaps = (
            1 << AREA_MAIN_DECK |
            1 << AREA_SECTOR_1 |
            1 << AREA_SECTOR_2 |
            1 << AREA_SECTOR_3 |
            1 << AREA_SECTOR_4 |
            1 << AREA_SECTOR_5 |
            1 << AREA_SECTOR_6
        ),
        .event = EVENT_SCREW_ATTACK_ABILITY_RECOVERED,
        .subEvent = SUB_EVENT_NONE,
        .abilityCount = ABILITY_COUNT_SCREW_ATTACK,
        .maxEnergy = 999,
        .currentEnergy = 769,
        .maxMissiles = 110,
        .currentMissiles = 73,
        .maxPowerBombs = 24,
        .currentPowerBombs = 20,
        .samusDirection = KEY_RIGHT,
        .samusX = BLOCK_SIZE * 8 + QUARTER_BLOCK_SIZE + PIXEL_SIZE,
        .samusY = BLOCK_SIZE * 39 - ONE_SUB_PIXEL,
    },
};

const u8 sDemoNumbers[DEMO_ID_END] = {
    [0] = DEMO_ID_SECTOR_2,
    [1] = DEMO_ID_SECTOR_5,
    [2] = DEMO_ID_SECTOR_4,
    [3] = DEMO_ID_MAIN_DECK,
    [4] = DEMO_ID_WALL_JUMP,
    [5] = DEMO_ID_SHINESPARK,
    [6] = DEMO_ID_LADDERS,
    [7] = DEMO_ID_POWER_BOMBS,
    [8] = DEMO_ID_SECTOR_3,
    [9] = DEMO_ID_SECTOR_6,
    [10] = DEMO_ID_ARACHNUS,
    [11] = DEMO_ID_SCREW_ATTACK,
};


const u8 sDemo_3e40c8[5 * 4] = {
    0x26, 0x2, 0x35, 0xA,
    0xE, 0x8, 0x0, 0x3,
    0xFF, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0,
    0x0, 0x0, 0x0, 0x0
};
