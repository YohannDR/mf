#ifndef SA_X_MONSTER_DATA_H
#define SA_X_MONSTER_DATA_H

#include "macros.h"
#include "oam.h"

#include "structs/sprite.h"

enum SaXMonsterOam {
    SaXMonsterPartOam_38f9b0,
    SaXMonsterPartOam_38fa18,
    SaXMonsterPartOam_38fae0,
    SaXMonsterPartOam_38fb08,
    SaXMonsterPartOam_38fb30,
    SaXMonsterPartOam_38fb58,
    SaXMonsterPartOam_38fb68,
    SaXMonsterPartOam_38fb90,
    SaXMonsterPartOam_38fbb8,
    SaXMonsterPartOam_38fbe0,
    SaXMonsterPartOam_38fc20,
    SaXMonsterPartOam_38fc58,
    SaXMonsterPartOam_38fc68,
    SaXMonsterPartOam_38fc78,
    SaXMonsterPartOam_38fc88,
    SaXMonsterPartOam_38fc98,
    SaXMonsterPartOam_38fcd0,
    SaXMonsterPartOam_38fce0,
    SaXMonsterPartOam_38fd08,
    SaXMonsterPartOam_38fd38,
    SaXMonsterPartOam_38fd60,
    SaXMonsterPartOam_38fd88,
    SaXMonsterPartOam_38fdb0,
    SaXMonsterPartOam_38fdc8,
    SaXMonsterPartOam_38fdf0,
    SaXMonsterPartOam_38fe18,
    SaXMonsterPartOam_38fe40,
    SaXMonsterPartOam_38fe58,
    SaXMonsterPartOam_38fe68,
    SaXMonsterPartOam_38fed0,
    SaXMonsterPartOam_38ff98,
    SaXMonsterPartOam_38ffc0,
    SaXMonsterPartOam_38ffe8,
    SaXMonsterPartOam_38fff8,
    SaXMonsterPartOam_390020,
    SaXMonsterPartOam_390048,
    SaXMonsterPartOam_390070,
    SaXMonsterPartOam_3900b0,
    SaXMonsterPartOam_3900e8,
    SaXMonsterPartOam_3900f8,
    SaXMonsterPartOam_390108,
    SaXMonsterPartOam_390140,
    SaXMonsterPartOam_390168,
    SaXMonsterPartOam_390198,
    SaXMonsterPartOam_3901c0,
    SaXMonsterPartOam_3901e8,
    SaXMonsterPartOam_390210,
    SaXMonsterPartOam_390228,
    SaXMonsterPartOam_390250,
    SaXMonsterPartOam_390278,
    SaXMonsterPartOam_3902a0,
    SaXMonsterPartOam_3902b8,
    SaXMonsterPartOam_3902e0,
    SaXMonsterPartOam_390308,
    SaXMonsterPartOam_390318,
    SaXMonsterPartOam_390360,
    SaXMonsterPartOam_390388,
    SaXMonsterPartOam_390398,
    SaXMonsterPartOam_3903d0,
    SaXMonsterPartOam_390408,
    SaXMonsterPartOam_390458,
    SaXMonsterPartOam_3904a8,
    SaXMonsterPartOam_3904c8,
    SaXMonsterPartOam_3904e8,
    SaXMonsterPartOam_3904f8,
    SaXMonsterPartOam_390508,

    SA_X_MONSTER_OAM_END
};

enum SaXMonsterPart {
    SA_X_MONSTER_PART_0,
    SA_X_MONSTER_PART_1,
    SA_X_MONSTER_PART_2,
    SA_X_MONSTER_PART_3,
    SA_X_MONSTER_PART_4,
    SA_X_MONSTER_PART_5,
    SA_X_MONSTER_PART_6,
    SA_X_MONSTER_PART_7,
    SA_X_MONSTER_PART_8,
    SA_X_MONSTER_PART_9,
    SA_X_MONSTER_PART_10,

    SA_X_MONSTER_PART_END
};

extern const s16 sSaXMonsterJumpingSpeed[40];
extern const s16 sSaXMonsterFallingSpeed[12];

extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388de4[5];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388e0c[5];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388e34[5];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388e5c[4];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388e7c[5];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388ea4[5];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388ecc[5];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388ef4[4];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f14[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f24[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f34[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f44[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f54[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f64[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f74[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f84[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388f94[2];
extern const struct MultiSpriteData sSaXMonsterMultiSpriteData_388fa4[2];

extern const u32 sSaXMonsterGfx[8 * 512];
extern const u16 sSaXMonsterPal[8 * 16];

extern const struct FrameData sSaXMonsterPartOam_38f9b0[13];
extern const struct FrameData sSaXMonsterPartOam_38fa18[25];
extern const struct FrameData sSaXMonsterPartOam_38fae0[5];
extern const struct FrameData sSaXMonsterPartOam_38fb08[5];
extern const struct FrameData sSaXMonsterPartOam_38fb30[5];
extern const struct FrameData sSaXMonsterPartOam_38fb58[2];
extern const struct FrameData sSaXMonsterPartOam_38fb68[5];
extern const struct FrameData sSaXMonsterPartOam_38fb90[5];
extern const struct FrameData sSaXMonsterPartOam_38fbb8[5];
extern const struct FrameData sSaXMonsterPartOam_38fbe0[8];
extern const struct FrameData sSaXMonsterPartOam_38fc20[7];
extern const struct FrameData sSaXMonsterPartOam_38fc58[2];
extern const struct FrameData sSaXMonsterPartOam_38fc68[2];
extern const struct FrameData sSaXMonsterPartOam_38fc78[2];
extern const struct FrameData sSaXMonsterPartOam_38fc88[2];
extern const struct FrameData sSaXMonsterPartOam_38fc98[7];
extern const struct FrameData sSaXMonsterPartOam_38fcd0[2];
extern const struct FrameData sSaXMonsterPartOam_38fce0[5];
extern const struct FrameData sSaXMonsterPartOam_38fd08[6];
extern const struct FrameData sSaXMonsterPartOam_38fd38[5];
extern const struct FrameData sSaXMonsterPartOam_38fd60[5];
extern const struct FrameData sSaXMonsterPartOam_38fd88[5];
extern const struct FrameData sSaXMonsterPartOam_38fdb0[3];
extern const struct FrameData sSaXMonsterPartOam_38fdc8[5];
extern const struct FrameData sSaXMonsterPartOam_38fdf0[5];
extern const struct FrameData sSaXMonsterPartOam_38fe18[5];
extern const struct FrameData sSaXMonsterPartOam_38fe40[3];
extern const struct FrameData sSaXMonsterPartOam_38fe58[2];
extern const struct FrameData sSaXMonsterPartOam_38fe68[13];
extern const struct FrameData sSaXMonsterPartOam_38fed0[25];
extern const struct FrameData sSaXMonsterPartOam_38ff98[5];
extern const struct FrameData sSaXMonsterPartOam_38ffc0[5];
extern const struct FrameData sSaXMonsterPartOam_38ffe8[2];
extern const struct FrameData sSaXMonsterPartOam_38fff8[5];
extern const struct FrameData sSaXMonsterPartOam_390020[5];
extern const struct FrameData sSaXMonsterPartOam_390048[5];
extern const struct FrameData sSaXMonsterPartOam_390070[8];
extern const struct FrameData sSaXMonsterPartOam_3900b0[7];
extern const struct FrameData sSaXMonsterPartOam_3900e8[2];
extern const struct FrameData sSaXMonsterPartOam_3900f8[2];
extern const struct FrameData sSaXMonsterPartOam_390108[7];
extern const struct FrameData sSaXMonsterPartOam_390140[5];
extern const struct FrameData sSaXMonsterPartOam_390168[6];
extern const struct FrameData sSaXMonsterPartOam_390198[5];
extern const struct FrameData sSaXMonsterPartOam_3901c0[5];
extern const struct FrameData sSaXMonsterPartOam_3901e8[5];
extern const struct FrameData sSaXMonsterPartOam_390210[3];
extern const struct FrameData sSaXMonsterPartOam_390228[5];
extern const struct FrameData sSaXMonsterPartOam_390250[5];
extern const struct FrameData sSaXMonsterPartOam_390278[5];
extern const struct FrameData sSaXMonsterPartOam_3902a0[3];
extern const struct FrameData sSaXMonsterPartOam_3902b8[5];
extern const struct FrameData sSaXMonsterPartOam_3902e0[5];
extern const struct FrameData sSaXMonsterPartOam_390308[2];
extern const struct FrameData sSaXMonsterPartOam_390318[9];
extern const struct FrameData sSaXMonsterPartOam_390360[5];
extern const struct FrameData sSaXMonsterPartOam_390388[2];
extern const struct FrameData sSaXMonsterPartOam_390398[7];
extern const struct FrameData sSaXMonsterPartOam_3903d0[7];
extern const struct FrameData sSaXMonsterPartOam_390408[10];
extern const struct FrameData sSaXMonsterPartOam_390458[10];
extern const struct FrameData sSaXMonsterPartOam_3904a8[4];
extern const struct FrameData sSaXMonsterPartOam_3904c8[4];
extern const struct FrameData sSaXMonsterPartOam_3904e8[2];
extern const struct FrameData sSaXMonsterPartOam_3904f8[2];
extern const struct FrameData sSaXMonsterPartOam_390508[2];

#endif /* SA_X_MONSTER_DATA_H */
