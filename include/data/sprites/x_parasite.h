#ifndef X_PARASITE_DATA_H
#define X_PARASITE_DATA_H

#include "types.h"
#include "oam.h"

#define X_PARASITE_MOSAIC_MAX_INDEX (ARRAY_SIZE(sXParasiteMosaicValues) - 1)

extern const u16 sXParasiteMosaicValues[45];
extern const s16 sXParasite_3bdf30[120];
extern const s16 sXParasite_3be020[61];
extern const s16 sXParasiteIdleFloatingYMovement[65];
extern const s16 sXParasiteIdleFloatingXMovement[81];

extern const struct FrameData sXParasiteOam_Yellow[7];
extern const struct FrameData sXParasiteOam_Green[7];
extern const struct FrameData sXParasiteOam_Red[7];
extern const struct FrameData sXParasiteOam_Yellow_Slow[7];
extern const struct FrameData sXParasiteOam_Green_Slow[7];
extern const struct FrameData sXParasiteOam_Red_Slow[7];

#endif /* X_PARASITE_DATA_H */
