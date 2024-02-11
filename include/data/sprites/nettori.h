#ifndef NETTORI_DATA_H
#define NETTORI_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sNettoriEaterSporeFloatingYVelocity[64];
extern const s16 sNettoriEaterSporeFloatingSmallXVelocity[64];
extern const s16 sNettoriEaterSporeFloatingLargeXVelocity[64];
extern const s16 sNettoriEaterSporeMovingYVelocity[32];

extern const u32 sNettoriGfx[4096];
extern const u16 sNettoriPal[8 * 16];

extern const struct FrameData sNettoriOam_Idle[5];
extern const struct FrameData sNettoriOam_ChargingBeam[5];
extern const struct FrameData sNettoriPartOam_RightArmIdle[2];
extern const struct FrameData sNettoriPartOam_HeadIdle[2];
extern const struct FrameData sNettoriPartOam_HeadVinesIdle[5];
extern const struct FrameData sNettoriPartOam_HeadVinesShooting[5];
extern const struct FrameData sNettoriPartOam_PlasmaShootingHigh[16];
extern const struct FrameData sNettoriPartOam_LegIdle[2];
extern const struct FrameData sNettoriPartOam_BodyVinesIdle[5];
extern const struct FrameData sNettoriPartOam_BodyVinesShooting[5];
extern const struct FrameData sNettoriPartOam_PlasmaShootingLow[16];
extern const struct FrameData sNettoriPartOam_LeftArmIdle[2];
extern const struct FrameData sSamusEaterOam_Idle[5];
extern const struct FrameData sSamusEaterOam_EatingSamus[14];
extern const struct FrameData sSamusEaterBudOam_Idle[5];
extern const struct FrameData sSamusEaterBudOam_Shooting[9];
extern const struct FrameData sSamusEaterBudOam_TurningAround[2];
extern const struct FrameData sSamusEaterSporeOam_Idle[5];
extern const struct FrameData sSamusEaterSporeOam_Exploding[4];
extern const struct FrameData sNettoriPlasmaBeamOam_Moving[3];
extern const struct FrameData sNettoriPlasmaBeamOam_Emerging[23];
extern const struct FrameData sNettoriPlasmaBeamOam_Charging[3];

extern const u16 sNettoriPal_Purple[1 * 16];
extern const u16 sNettoriPal_Red[1 * 16];
extern const u16 sNettoriGlowingPal_1[1 * 16];
extern const u16 sNettoriGlowingPal_2[1 * 16];
extern const u16 sNettoriGlowingPal_3[1 * 16];

#endif /* NETTORI_DATA_H */
