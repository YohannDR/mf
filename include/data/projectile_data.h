#ifndef PROJECTILE_DATA_H
#define PROJECTILE_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sWaveBeamPartVelocity[16];

// ...

extern const u8 sFlareHorizontalGfx[80 * 32];
extern const u8 sFlareDiagonalGfx[80 * 32];
extern const u8 sFlareVerticalGfx[80 * 32];

extern const struct FrameData sFlareOam[2];

#endif /* PROJECTILE_DATA_H */
