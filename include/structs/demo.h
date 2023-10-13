#ifndef DEMO_STRUCTS_H
#define DEMO_STRUCTS_H

#include "types.h"

struct DemoData {
    const u16* const pInputs;
    u16 inputsLength;
    const u16* const pDurations;
    u16 durationLength;
};

struct DemoRam {
    u8 area;
    u8 lastDoorUsed;
    u8 securityLevel;
    u8 downloadedMaps;
    u8 event;
    u16 subEvent;
    u8 abilityCount;
    u16 maxEnergy;
    u16 currentEnergy;
    u16 maxMissiles;
    u16 currentMissiles;
    u8 maxPowerBombs;
    u8 currentPowerBombs;
    u16 samusDirection;
    u16 samusX;
    u16 samusY;
};

extern u8 gDemoPlaying;
extern u8 gDemoState;
extern u8 gCurrentDemo;

extern u16 gDemoInputCounter;

extern u16 gDemoInputs[256];
extern u16 gDemoInputDurations[256];

#endif /* DEMO_STRUCTS_H */
