#ifndef ZORO_COCOON_H
#define ZORO_COCOON_H

#include "types.h"
#include "oam.h"

extern const u32 sZoroCocoonGfx[1024];
extern const u16 sZoroCocoonPal[2 * 16];

extern const struct FrameData sZoroCocoonOam_TransformedVertical[10];
extern const struct FrameData sZoroCocoonOam_UntransformedVertical[2];
extern const struct FrameData sZoroCocoonOam_TransformedHorizontal[10];
extern const struct FrameData sZoroCocoonOam_UntransformedHorizontal[2];

extern const u32 sZoroHuskGfx[512];
extern const u16 sZoroHuskPal[1 * 16];

extern const struct FrameData sZoroHuskOam_Vertical[2];
extern const struct FrameData sZoroHuskOam_Horizontal[2];

#endif /* ZORO_COCOON_H */
