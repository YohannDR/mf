#ifndef TITLE_SCREEN_DATA_H
#define TITLE_SCREEN_DATA_H

#include "types.h"
#include "oam.h"

extern const u8 sTitleScreenDebugTextCharactersGfx[768];

extern const u32 sTitleScreenLogoGfx[3153];
extern const u32 sTitleScreenLogoTileTable[597];
extern const u16 sTitleScreenLogoPal[16 * 8];
extern const u16 sTitleScreen_596e0c[16 * 8];

extern const struct FrameData sTitleScreenOam_Copyright[4];
extern const struct FrameData sTitleScreenOam_5973f0[3];
extern const struct FrameData sTitleScreenOam_Language[2];
extern const struct FrameData sTitleScreenOam_597418[9];
extern const struct FrameData sTitleScreenOam_PressStart[2];
extern const struct FrameData sTitleScreenOam_597470[7];

extern const struct FrameData sTitleScreenOam_590998[2];
extern const u8 sTitleScreenDebugText[4];

extern const u32 sTitleScreenObjectsGfx[1974];
extern const u16 sTitleScreenObjectsPal[16 * 16];

extern const u32 sTitleScreenSpaceBackgroundGfx[3270];
extern const u16 sTitleScreenSpaceBackgroundPal[16 * 8];
extern const u32 sTitleScreenSpaceBackgroundTileTable[418];

#endif /* TITLE_SCREEN_DATA_H */
