#ifndef DEBUG_MENU_STRUCTS_H
#define DEBUG_MENU_STRUCTS_H

#include "types.h"
#include "oam.h"

struct DebugMenuOptions {
    u16 bldcnt;
    u8 bldalpha_evb;
    u8 bldalpha_eva;
    u8 bldalpha_evy;
    u8 frontWideCamera;
    u8 sectionCursor;
    u8 sectionSelector;
    u8 downloadedMaps;
    u8 securityHatchLevel;
    u8 mapScanLRAndStereo;
};

extern struct DebugMenuOptions gDebugMenuOptions;

#endif /* DEBUG_MENU_STRUCTS_H */
