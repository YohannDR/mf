#ifndef KAGO_DATA_H
#define KAGO_DATA_H

#include "macros.h"
#include "oam.h"

extern const s16 sKagoInsectHighJumpVelocity[10];
extern const s16 sKagoInsectMediumJumpVelocity[10];
extern const s16 sKagoInsectLowJumpVelocity[10];

extern const u32 sKagoGfx[2 * 512];
extern const u16 sKagoPal[2 * 16];

extern const struct FrameData sKagoOam_337b24[5];
extern const struct FrameData sKagoOam_337b4c[14];
extern const struct FrameData sKagoOam_337bbc[15];
extern const struct FrameData sKagoOam_337c34[14];
extern const struct FrameData sKagoOam_337ca4[14];
extern const struct FrameData sKagoOam_337d14[14];
extern const struct FrameData sKagoOam_337d84[4];
extern const struct FrameData sKagoOam_337da4[2];
extern const struct FrameData sKagoOam_337db4[2];
extern const struct FrameData sKagoOam_337dc4[4];

#endif /* KAGO_DATA_H */
