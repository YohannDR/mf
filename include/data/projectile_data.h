#ifndef PROJECTILE_DATA_H
#define PROJECTILE_DATA_H

#include "types.h"
#include "oam.h"

extern const s16 sWaveBeamPartVelocity[16];
extern const s16 sWaveBeamPartVelocity_Unused[16];

extern const s16 sNormalMissileVelocity[7];
extern const s16 sSuperMissileVelocity[7];
extern const s16 sIceMissileVelocity[7];
extern const s16 sDiffusionMissileVelocity[7];

extern const s16 sTumblingMissileFallingVelocity[16];

extern const u16 sNormalBeamPal[1 * 16];
extern const u16 sChargeBeamPal[1 * 16];
extern const u16 sWideBeamPal[1 * 16];
extern const u16 sPlasmaBeamPal[1 * 16];
extern const u16 sWaveBeamPal[1 * 16];
extern const u16 sIceBeamPal[1 * 16];

extern const u8 sNormalBeamGfx_Top[20 * 32];
extern const u8 sNormalBeamGfx_Bottom[20 * 32];
extern const u8 sChargeBeamGfx_Top[20 * 32];
extern const u8 sChargeBeamGfx_Bottom[20 * 32];
extern const u8 sWideBeamGfx_Top[20 * 32];
extern const u8 sWideBeamGfx_Bottom[20 * 32];
extern const u8 sPlasmaBeamGfx_Top[20 * 32];
extern const u8 sPlasmaBeamGfx_Bottom[20 * 32];
extern const u8 sWaveBeamGfx_Top[20 * 32];
extern const u8 sWaveBeamGfx_Bottom[20 * 32];
extern const u8 sIceBeamGfx_Top[20 * 32];
extern const u8 sIceBeamGfx_Bottom[20 * 32];

extern const u8 sNormalMissileGfx_Top[4 * 32];
extern const u8 sNormalMissileGfx_Bottom[4 * 32];
extern const u8 sSuperMissileGfx_Top[4 * 32];
extern const u8 sSuperMissileGfx_Bottom[4 * 32];
extern const u8 sIceMissileGfx_Top[4 * 32];
extern const u8 sIceMissileGfx_Bottom[4 * 32];
extern const u8 sDiffusionMissileGfx_Top[4 * 32];
extern const u8 sDiffusionMissileGfx_Bottom[4 * 32];

extern const struct FrameData sNormalBeamOam_Horizontal[3];
extern const struct FrameData sNormalBeamOam_Diagonal[3];
extern const struct FrameData sNormalBeamOam_Vertical[3];
extern const struct FrameData sChargedNormalBeamOam_Horizontal[3];
extern const struct FrameData sChargedNormalBeamOam_Diagonal[3];
extern const struct FrameData sChargedNormalBeamOam_Vertical[3];
extern const struct FrameData sParticleOam_ChargedNormalBeamTrail[6];

extern const struct FrameData sChargeBeamOam_DoubleHorizontal[3];
extern const struct FrameData sChargeBeamOam_DoubleDiagonal[3];
extern const struct FrameData sChargeBeamOam_DoubleVertical[3];
extern const struct FrameData sChargeBeamOam_SingleHorizontal[2];
extern const struct FrameData sChargeBeamOam_SingleDiagonal[2];
extern const struct FrameData sChargeBeamOam_SingleVertical[2];
extern const struct FrameData sChargedChargeBeamOam_DoubleHorizontal[3];
extern const struct FrameData sChargedChargeBeamOam_DoubleDiagonal[3];
extern const struct FrameData sChargedChargeBeamOam_DoubleVertical[3];
extern const struct FrameData sChargedChargeBeamOam_SingleHorizontal[2];
extern const struct FrameData sChargedChargeBeamOam_SingleDiagonal[2];
extern const struct FrameData sChargedChargeBeamOam_SingleVertical[2];
extern const struct FrameData sParticleOam_ChargedChargeBeamTrail[6];

extern const struct FrameData sWideBeamOam_Horizontal[4];
extern const struct FrameData sWideBeamOam_Diagonal[4];
extern const struct FrameData sWideBeamOam_Vertical[4];
extern const struct FrameData sChargedWideBeamOam_Horizontal[3];
extern const struct FrameData sChargedWideBeamOam_Diagonal[3];
extern const struct FrameData sChargedWideBeamOam_Vertical[3];
extern const struct FrameData sOam_58dc84[2];
extern const struct FrameData sOam_58dc94[2];
extern const struct FrameData sOam_58dca4[2];
extern const struct FrameData sOam_58dcb4[2];
extern const struct FrameData sOam_58dcc4[2];
extern const struct FrameData sOam_58dcd4[2];
extern const struct FrameData sParticleOam_ChargedWideBeamTrail[6];

extern const struct FrameData sPlasmaBeamOam_Horizontal[3];
extern const struct FrameData sPlasmaBeamOam_Diagonal[3];
extern const struct FrameData sPlasmaBeamOam_Vertical[3];
extern const struct FrameData sChargedPlasmaBeamOam_Horizontal[3];
extern const struct FrameData sChargedPlasmaBeamOam_Diagonal[3];
extern const struct FrameData sChargedPlasmaBeamOam_Vertical[3];
extern const struct FrameData sParticleOam_ChargedPlasmaBeamTrail[8];

extern const struct FrameData sWaveBeamOam_Horizontal[2];
extern const struct FrameData sWaveBeamOam_Diagonal[2];
extern const struct FrameData sWaveBeamOam_Vertical[2];
extern const struct FrameData sChargedWaveBeamOam_Horizontal[3];
extern const struct FrameData sChargedWaveBeamOam_Diagonal[3];
extern const struct FrameData sChargedWaveBeamOam_Vertical[3];
extern const struct FrameData sParticleOam_ChargedWaveBeamTrail[5];

extern const struct FrameData sIceBeamOam_Horizontal[2];
extern const struct FrameData sIceBeamOam_Diagonal[2];
extern const struct FrameData sIceBeamOam_Vertical[2];
extern const struct FrameData sChargedIceBeamOam_Horizontal[2];
extern const struct FrameData sChargedIceBeamOam_Diagonal[2];
extern const struct FrameData sChargedIceBeamOam_Vertical[2];
extern const struct FrameData sParticleOam_IceBeamTrail[8];
extern const struct FrameData sParticleOam_ChargedIceBeamTrail[8];
extern const struct FrameData sOam_58e2b8[10];
extern const struct FrameData sOam_58e308[10];

extern const struct FrameData sNormalSuperMissileOam_Horizontal[3];
extern const struct FrameData sNormalSuperMissileOam_Diagonal[3];
extern const struct FrameData sNormalSuperMissileOam_Vertical[3];
extern const struct FrameData sParticleOam_SuperMissileTrail[10];
extern const struct FrameData sIceMissileOam_Horizontal[3];
extern const struct FrameData sIceMissileOam_Diagonal[3];
extern const struct FrameData sIceMissileOam_Vertical[3];
extern const struct FrameData sParticleOam_NormalMissileTrail[10];
extern const struct FrameData sParticleOam_IceMissileTrail[10];
extern const struct FrameData sParticleOam_DiffusionMissileTrail[11];
extern const struct FrameData sDiffusionMissileOam_Horizontal[3];
extern const struct FrameData sDiffusionMissileOam_Diagonal[3];
extern const struct FrameData sDiffusionMissileOam_Vertical[3];
extern const struct FrameData sParticleOam_ChargedDiffusionMissileTrail[11];
extern const struct FrameData sMissileOam_Tumbling[9];

extern const struct FrameData sOam_58eac0[5];
extern const struct FrameData sBombOam_Slow[5];
extern const struct FrameData sBombOam_Fast[5];
extern const struct FrameData sPowerBombOam_Slow[4];
extern const struct FrameData sPowerBombOam_Fast[4];

extern const u8 sFlareHorizontalGfx_Top[40 * 32];
extern const u8 sFlareHorizontalGfx_Bottom[40 * 32];
extern const u8 sFlareDiagonalGfx_Top[40 * 32];
extern const u8 sFlareDiagonalGfx_Bottom[40 * 32];
extern const u8 sFlareVerticalGfx_Top[40 * 32];
extern const u8 sFlareVerticalGfx_Bottom[40 * 32];

extern const struct FrameData sFlareOam[2];

#endif /* PROJECTILE_DATA_H */
