#ifndef GATE_DATA_H
#define GATE_DATA_H

#include "macros.h"
#include "oam.h"

extern const u32 sGateGfx[1 * 512];
extern const u16 sGatePal[1 * 16];

extern const struct FrameData sGateOam_OpenedThin[2];
extern const struct FrameData sGateOam_ClosingThin[15];
extern const struct FrameData sGateOam_OpeningThin[15];
extern const struct FrameData sGateOam_ClosedThin[14];
extern const struct FrameData sGateOam_OpenedFat[2];
extern const struct FrameData sGateOam_ClosingFat[15];
extern const struct FrameData sGateOam_OpeningFat[15];
extern const struct FrameData sGateOam_ClosedFat[19];
extern const struct FrameData sGateSwitchOam_IdleLeft[4];
extern const struct FrameData sGateSwitchOam_PressingLeft[3];
extern const struct FrameData sGateSwitchOam_IdleRight[4];
extern const struct FrameData sGateSwitchOam_PressingRight[3];
extern const struct FrameData sGateSwitchOam_PressedLeft[2];
extern const struct FrameData sGateSwitchOam_PressedRight[2];

#endif /* GATE_DATA_H */
