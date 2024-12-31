#ifndef FUNE_NAMIHE_DATA_H
#define FUNE_NAMIHE_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sFuneNamiheGfx[2 * 512];
extern const u16 sFuneNamihePal[2 * 16];

extern const struct FrameData sFuneOam_Idle[9];
extern const struct FrameData sFuneOam_Spitting[9];
extern const struct FrameData sFuneOam_Lunging[27];
extern const struct FrameData sFuneSpitOam_Moving[4];
extern const struct FrameData sFuneSpitOam_Exploding[4];

extern const struct FrameData sNamiheOam_Idle[9];
extern const struct FrameData sNamiheOam_Spitting[17];
extern const struct FrameData sNamiheOam_Lunging[39];
extern const struct FrameData sNamiheSpitOam_Moving[4];
extern const struct FrameData sNamiheSpitOam_Exploding[4];

#endif /* FUNE_NAMIHE_DATA_H */
