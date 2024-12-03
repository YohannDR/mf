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

extern const struct FrameData sOam_58d7ac[3];
extern const struct FrameData sOam_58d7c4[3];
extern const struct FrameData sOam_58d7dc[3];
extern const struct FrameData sOam_58d7f4[3];
extern const struct FrameData sOam_58d80c[3];
extern const struct FrameData sOam_58d824[3];
extern const struct FrameData sParticleOam_ChargedNormalBeamTrail[6];

extern const struct FrameData sOam_58d990[3];
extern const struct FrameData sOam_58d9a8[3];
extern const struct FrameData sOam_58d9c0[3];
extern const struct FrameData sOam_58d9d8[2];
extern const struct FrameData sOam_58d9e8[2];
extern const struct FrameData sOam_58d9f8[2];
extern const struct FrameData sOam_58da08[3];
extern const struct FrameData sOam_58da20[3];
extern const struct FrameData sOam_58da38[3];
extern const struct FrameData sOam_58da50[2];
extern const struct FrameData sOam_58da60[2];
extern const struct FrameData sOam_58da70[2];
extern const struct FrameData sParticleOam_ChargedChargeBeamTrail[6];

extern const struct FrameData sOam_58dbdc[4];
extern const struct FrameData sOam_58dbfc[4];
extern const struct FrameData sOam_58dc1c[4];
extern const struct FrameData sOam_58dc3c[3];
extern const struct FrameData sOam_58dc54[3];
extern const struct FrameData sOam_58dc6c[3];
extern const struct FrameData sOam_58dc84[2];
extern const struct FrameData sOam_58dc94[2];
extern const struct FrameData sOam_58dca4[2];
extern const struct FrameData sOam_58dcb4[2];
extern const struct FrameData sOam_58dcc4[2];
extern const struct FrameData sOam_58dcd4[2];
extern const struct FrameData sParticleOam_ChargedWideBeamTrail[6];

extern const struct FrameData sOam_58ddf4[3];
extern const struct FrameData sOam_58de0c[3];
extern const struct FrameData sOam_58de24[3];
extern const struct FrameData sOam_58de3c[3];
extern const struct FrameData sOam_58de54[3];
extern const struct FrameData sOam_58de6c[3];
extern const struct FrameData sParticleOam_ChargedPlasmaBeamTrail[8];

extern const struct FrameData sOam_58df64[2];
extern const struct FrameData sOam_58df74[2];
extern const struct FrameData sOam_58df84[2];
extern const struct FrameData sOam_58df94[3];
extern const struct FrameData sOam_58dfac[3];
extern const struct FrameData sOam_58dfc4[3];
extern const struct FrameData sParticleOam_ChargedWaveBeamTrail[5];

extern const struct FrameData sOam_58e1d8[2];
extern const struct FrameData sOam_58e1e8[2];
extern const struct FrameData sOam_58e1f8[2];
extern const struct FrameData sOam_58e208[2];
extern const struct FrameData sOam_58e218[2];
extern const struct FrameData sOam_58e228[2];
extern const struct FrameData sParticleOam_IceBeamTrail[8];
extern const struct FrameData sParticleOam_ChargedIceBeamTrail[8];
extern const struct FrameData sOam_58e2b8[10];
extern const struct FrameData sOam_58e308[10];

extern const struct FrameData sOam_58e7a8[3];
extern const struct FrameData sOam_58e7c0[3];
extern const struct FrameData sOam_58e7d8[3];
extern const struct FrameData sParticleOam_SuperMissileTrail[10];
extern const struct FrameData sOam_58e840[3];
extern const struct FrameData sOam_58e858[3];
extern const struct FrameData sOam_58e870[3];
extern const struct FrameData sParticleOam_NormalMissileTrail[10];
extern const struct FrameData sParticleOam_IceMissileTrail[10];
extern const struct FrameData sParticleOam_DiffusionMissileTrail[11];
extern const struct FrameData sOam_58e980[3];
extern const struct FrameData sOam_58e998[3];
extern const struct FrameData sOam_58e9b0[3];
extern const struct FrameData sParticleOam_ChargedDiffusionMissileTrail[11];
extern const struct FrameData sOam_58ea20[9];

extern const struct FrameData sOam_58eac0[5];
extern const struct FrameData sOam_58eae8[5];
extern const struct FrameData sOam_58eb10[5];
extern const struct FrameData sOam_58eb38[4];
extern const struct FrameData sOam_58eb58[4];

extern const u8 sFlareHorizontalGfx_Top[40 * 32];
extern const u8 sFlareHorizontalGfx_Bottom[40 * 32];
extern const u8 sFlareDiagonalGfx_Top[40 * 32];
extern const u8 sFlareDiagonalGfx_Bottom[40 * 32];
extern const u8 sFlareVerticalGfx_Top[40 * 32];
extern const u8 sFlareVerticalGfx_Bottom[40 * 32];

extern const struct FrameData sFlareOam[2];

#endif /* PROJECTILE_DATA_H */
