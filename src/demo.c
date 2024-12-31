#include "demo.h"
#include "callbacks.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "data/demo_data.h"

#include "constants/demo.h"
#include "constants/samus.h"

#include "structs/audio.h"
#include "structs/connection.h"
#include "structs/demo.h"
#include "structs/event.h"
#include "structs/samus.h"

/**
 * @brief 716f8 | c | Demo, empty v-blank
 * 
 */
void DemoVblank_Empty(void)
{
    vu8 c = 0;
}

/**
 * @brief 71704 | c | Demo v-blank
 * 
 */
void DemoVblank(void)
{
    UpdateAudio();
}

/**
 * @brief 71710 | ac | Loads the inputs of a demo
 * 
 */
void DemoLoadInputs(void)
{
    u8 demoId;

    CallbackSetVBlank(DemoVblank);

    if (gCurrentDemo >= DEMO_ID_END)
        gCurrentDemo = 0;

    demoId = sDemoNumbers[gCurrentDemo];

    // Clear ram and game state
    Sram_ResetForDemo();

    if (gDemoState == DEMO_STATE_LOADING)
    {
        // Load inputs and durations
        DmaTransfer(3, sDemoData[demoId].pInputs, gDemoInputs, sDemoData[demoId].inputsLength, 16);
        DmaTransfer(3, sDemoData[demoId].pDurations, gDemoInputDurations, sDemoData[demoId].durationLength, 16);

        gDemoState = DEMO_STATE_PLAYING;
    }

    gDemoInputCounter = 0;
    gCurrentDemo |= DEMO_ID_HALF_LOADED_FLAG;

    CallbackSetVBlank(DemoVblank_Empty);
}

/**
 * @brief 717bc | 110 | Loads a demo ram values
 * 
 * @param group Group to load
 */
void DemoLoadRam(u8 group)
{
    u8 demoId;

    demoId = sDemoNumbers[MOD_AND(gCurrentDemo, DEMO_ID_HALF_LOADED_FLAG)];

    if (group == 0)
    {
        gCurrentArea = sDemoRam[demoId].area;
        gLastDoorUsed = sDemoRam[demoId].lastDoorUsed;
        gCurrentRoom = 0;
        gAbilityCount = sDemoRam[demoId].abilityCount;
        gEquipment.securityHatchLevel = sDemoRam[demoId].securityLevel;
        gSecurityHatchLevelBackup = sDemoRam[demoId].securityLevel;
        gEquipment.downloadedMaps = sDemoRam[demoId].downloadedMaps;

        gEventCounter = sDemoRam[demoId].event;
        gSubEventCounter = sDemoRam[demoId].subEvent;
        gPreviousSubEvent = sDemoRam[demoId].subEvent;

        gEquipment.maxEnergy = sDemoRam[demoId].maxEnergy;
        gEquipment.currentEnergy = sDemoRam[demoId].currentEnergy;
        gEquipment.maxMissiles = sDemoRam[demoId].maxMissiles;
        gEquipment.currentMissiles = sDemoRam[demoId].currentMissiles;
        gEquipment.maxPowerBombs = sDemoRam[demoId].maxPowerBombs;
        gEquipment.currentPowerBombs = sDemoRam[demoId].currentPowerBombs;

        gSamusData.direction = sDemoRam[demoId].samusDirection;
        gSamusData.pose = SPOSE_STANDING;
        gSamusData.animationDurationCounter = 0;
        gSamusData.currentAnimationFrame = 0;

        DMA_SET(3, sDemo_3e40c8, EWRAM_BASE + 0x37200, C_32_2_16(DMA_ENABLE, 2));
    }
    else
    {
        gSamusData.xPosition = sDemoRam[demoId].samusX;
        gSamusData.yPosition = sDemoRam[demoId].samusY;

        gCurrentDemo &= ~DEMO_ID_HALF_LOADED_FLAG;

        gFrameCounter8Bit = 0;
        gFrameCounter16Bit = 0;
    }
}

/**
 * @brief 718cc | 5c | Initializes a demo
 * 
 */
void DemoInit(void)
{
    u32 rng;

    if (!gDemoPlaying)
    {
        gDemoPlaying = TRUE;

        rng = gFrameCounter8Bit + gFrameCounter16Bit / 256;

        gCurrentDemo = MOD_AND(rng, 2)
            ? DEMO_ID_END / 2
            : 0;
    }

    gDemoState = DEMO_STATE_LOADING;
    gMusicInfo.unk_21 = 0x11;

    DemoLoadInputs();
}

/**
 * @brief 71928 | d0 | Ends a demo
 * 
 */
void DemoEnd(void)
{
    if (gDemoState == DEMO_STATE_RECORDING)
    {
        DMA_SET(3, gDemoInputs, EWRAM_BASE + 0x3F800, C_32_2_16(DMA_ENABLE, ARRAY_SIZE(gDemoInputs)));
        DMA_SET(3, gDemoInputDurations, EWRAM_BASE + 0x3FA00, C_32_2_16(DMA_ENABLE, ARRAY_SIZE(gDemoInputDurations)));

        unk_e2c();
        gDemoState = DEMO_STATE_NONE;
        return;
    }

    gCurrentDemo++;

    if (gCurrentDemo >= DEMO_ID_END)
    {
        gMusicInfo.unk_21 = 0xF;
        gDemoState = DEMO_STATE_NONE;
        gCurrentDemo = 0;

        gSubGameMode2 = 0x1;
    }
    else if (gCurrentDemo == DEMO_ID_END / 2)
    {
        gMusicInfo.unk_21 = 0xF;
        gDemoState = DEMO_STATE_NONE;

        gSubGameMode2 = 0x1;
    }
    else if (gColorFading == 0x10)
    {
        gMusicInfo.unk_21 = 0x10;
        gDemoState = DEMO_STATE_NONE;
    }
    else
    {
        gDemoState = DEMO_STATE_LOADING;
    }

    if (gDemoState == DEMO_STATE_NONE)
    {
        unk_27e8(0);
        MusicFade(20);
    }
}
