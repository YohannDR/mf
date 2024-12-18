#ifndef YAKUZA_DATA_H
#define YAKUZA_DATA_H

#include "types.h"
#include "oam.h"

#include "structs/sprite.h"

enum YakuzaOam {
    FRAMEDATA_3B6F08,
    FRAMEDATA_3B6F30,
    FRAMEDATA_3B6F40,
    FRAMEDATA_3B6F58,
    FRAMEDATA_3B6F68,
    FRAMEDATA_3B6F90,
    FRAMEDATA_3B6FA8,
    FRAMEDATA_3B6FC0,
    FRAMEDATA_3B6FD0,
    FRAMEDATA_3B6FE8,
    FRAMEDATA_3B7010,
    FRAMEDATA_3B7028,
    FRAMEDATA_3B7060,
    FRAMEDATA_3B7088,
    FRAMEDATA_3B70B0,
    FRAMEDATA_3B70F8,
    FRAMEDATA_3B7120,
    FRAMEDATA_3B7140,
    FRAMEDATA_3B7150,
    FRAMEDATA_3B7188,
    FRAMEDATA_3B7198,
    FRAMEDATA_3B71C0,
    FRAMEDATA_3B7208,
    FRAMEDATA_3B7230,
    FRAMEDATA_3B7240,
    FRAMEDATA_3B7260,
    FRAMEDATA_3B7288,
    FRAMEDATA_3B72C0,
    FRAMEDATA_3B72E0,
    FRAMEDATA_3B7300,

    YAKUZA_OAM_END
};

enum YakuzaPart {
    YAKUZA_PART_EYE,
    YAKUZA_PART_BODY,
    YAKUZA_PART_LEGS,

    YAKUZA_PART_END
};

extern const s16 sYakuzaFireBurningSpeed[5];
extern const s16 sYakuza_3b0b0e[24];
extern const s16 sYakuzaSlammingSpeed[24];
extern const u8 sYakuzaMouthStartGlowingPalOffset[18];
extern const u8 sYakuzaMouthGlowingPalOffset[12];
extern const u8 sYakuzaMouthEndGlowingPalOffset[8];
extern const s16 sYakuzaPhase2Speed[16];

extern const struct MultiSpriteData sMultiSpriteData_3b0f28[5];
extern const struct MultiSpriteData sMultiSpriteData_3b0f50[2];
extern const struct MultiSpriteData sMultiSpriteData_3b0f60[5];
extern const struct MultiSpriteData sMultiSpriteData_3b0f88[2];
extern const struct MultiSpriteData sMultiSpriteData_3b0f98[5];
extern const struct MultiSpriteData sMultiSpriteData_3b0fc0[5];
extern const struct MultiSpriteData sMultiSpriteData_3b0fe8[3];
extern const struct MultiSpriteData sMultiSpriteData_3b1000[5];
extern const struct MultiSpriteData sMultiSpriteData_3b1028[3];
extern const struct MultiSpriteData sMultiSpriteData_3b1040[2];
extern const struct MultiSpriteData sMultiSpriteData_3b1050[2];
extern const struct MultiSpriteData sMultiSpriteData_3b1060[3];
extern const struct MultiSpriteData sMultiSpriteData_3b1078[5];
extern const struct MultiSpriteData sMultiSpriteData_3b10a0[2];
extern const struct MultiSpriteData sMultiSpriteData_3b10b0[7];
extern const struct MultiSpriteData sMultiSpriteData_3b10e8[5];
extern const struct MultiSpriteData sMultiSpriteData_3b1110[3];
extern const struct MultiSpriteData sMultiSpriteData_3b1128[5];
extern const struct MultiSpriteData sMultiSpriteData_3b1150[2];
extern const struct MultiSpriteData sMultiSpriteData_3b1160[3];
extern const struct MultiSpriteData sMultiSpriteData_3b1178[2];
extern const struct MultiSpriteData sMultiSpriteData_3b1188[5];
extern const struct MultiSpriteData sMultiSpriteData_3b11b0[2];
extern const struct MultiSpriteData sMultiSpriteData_3b11c0[2];

extern const u32 sYakuzaGfx[512 * 8];
extern const u16 sYakuzaPal[16 * 8];

extern const u16 sYakuzaMouthGlowingPal[8][16];

extern const struct FrameData sFrameData_3b6f08[5];
extern const struct FrameData sFrameData_3b6f30[2];
extern const struct FrameData sFrameData_3b6f40[3];
extern const struct FrameData sFrameData_3b6f58[2];
extern const struct FrameData sFrameData_3b6f68[5];
extern const struct FrameData sFrameData_3b6f90[3];
extern const struct FrameData sFrameData_3b6fa8[3];
extern const struct FrameData sFrameData_3b6fc0[2];
extern const struct FrameData sFrameData_3b6fd0[3];
extern const struct FrameData sFrameData_3b6fe8[5];
extern const struct FrameData sFrameData_3b7010[3];
extern const struct FrameData sFrameData_3b7028[7];
extern const struct FrameData sFrameData_3b7060[5];
extern const struct FrameData sFrameData_3b7088[5];
extern const struct FrameData sFrameData_3b70b0[9];
extern const struct FrameData sFrameData_3b70f8[5];
extern const struct FrameData sFrameData_3b7120[4];
extern const struct FrameData sFrameData_3b7140[2];
extern const struct FrameData sFrameData_3b7150[7];
extern const struct FrameData sFrameData_3b7188[2];
extern const struct FrameData sFrameData_3b7198[5];
extern const struct FrameData sFrameData_3b71c0[9];
extern const struct FrameData sFrameData_3b7208[5];
extern const struct FrameData sFrameData_3b7230[2];
extern const struct FrameData sFrameData_3b7240[4];
extern const struct FrameData sFrameData_3b7260[5];
extern const struct FrameData sYakuzaProjectileSpitOam[7];
extern const struct FrameData sYakuzaProjectileFireOam_Burning1[4];
extern const struct FrameData sYakuzaProjectileFireOam_Burning2[4];
extern const struct FrameData sYakuzaProjectileFireOam_Burning3[4];
extern const struct FrameData sFrameData_3b7320[2];
extern const struct FrameData sFrameData_3b7330[2];
extern const struct FrameData sFrameData_3b7340[2];
extern const struct FrameData sFrameData_3b7350[2];
extern const struct FrameData sFrameData_3b7360[2];
extern const struct FrameData sFrameData_3b7370[2];

#endif /* YAKUZA_DATA_H */
