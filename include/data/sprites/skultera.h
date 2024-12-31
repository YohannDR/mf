#ifndef SKULTERA_DATA_H
#define SKULTERA_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sSkulteraGfx[2 * 512];
extern const u16 sSkulteraPal[2 * 16];

extern const struct FrameData sSkulteraOam_IdleSmall[4];
extern const struct FrameData sSkulteraOam_TurningAroundSmall[9];
extern const struct FrameData sSkulteraOam_ChasingSmall[4];
extern const struct FrameData sSkulteraOam_IdleLarge[5];
extern const struct FrameData sSkulteraOam_TurningAroundLarge[9];
extern const struct FrameData sSkulteraOam_ChasingLarge[5];

#endif /* SKULTERA_DATA_H */
