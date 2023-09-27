#ifndef ESCAPE_DATA_H
#define ESCAPE_DATA_H

#include "types.h"
#include "macros.h"
#include "oam.h"

extern const u16 sEscapeDigitsPal[16 * 3];
extern const u8 sEscapeDigitsGfx[2048];
extern const u16 sEscapeDigitsOam[OAM_DATA_SIZE(8)];
extern const struct FrameData sEscapeTimerFrameData[2];

#endif /* ESCAPE_DATA_H */
