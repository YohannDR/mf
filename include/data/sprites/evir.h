#ifndef EVIR_DATA_H
#define EVIR_DATA_H

#include "types.h"
#include "oam.h"

extern const u32 sEvirGfx[512 * 2];
extern const u16 sEvirPal[16 * 2];

extern const struct FrameData sEvirOam_356abc[9];
extern const struct FrameData sEvirOam_356b04[8];
extern const struct FrameData sEvirOam_356b44[4];
extern const struct FrameData sEvirOam_356b64[4];
extern const struct FrameData sEvirOam_356b84[5];
extern const struct FrameData sEvirOam_356bac[4];

#endif /* EVIR_DATA_H */
