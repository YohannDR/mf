#ifndef MESSAGE_BOX_DATA_H
#define MESSAGE_BOX_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sMessageBoxGfx[512 * 2];
extern const u16 sMessageBoxPal[16 * 2];

extern const struct FrameData sMessageBoxYesNoCursorOam[5];
extern const struct FrameData sMessageBoxOam_PopUp[11];
extern const struct FrameData sMessageBoxOam_Removal[11];
extern const struct FrameData sMessageBoxOam_Static[2];

#endif /* MESSAGE_BOX_DATA_H */
