#include "data/sprites/nettori.h"
#include "macros.h"

const s16 sNettoriEaterSporeFloatingYVelocity[64] = {
     0,  0,  0,  0,
    -1,  0, -1,  0,
    -1,  0, -1,  0,
    -1, -1, -1, -2,
    -2, -1, -1, -1,
     0, -1,  0, -1,
     0, -1,  0, -1,
     0,  0,  0,  0,
     0,  0,  0,  0,
     1,  0,  1,  0,
     1,  0,  1,  0,
     1,  1,  1,  2,
     2,  1,  1,  1,
     0,  1,  0,  1,
     0,  1,  0,  1,
     0,  0,  0,
    SHORT_MAX
};

const s16 sNettoriEaterSporeFloatingSmallXVelocity[64] = {
     0,  0,  0,  1,
     0,  1,  1,  2,
     2,  3,  3,  4,
     4,  5,  5,  6,
     6,  5,  5,  4,
     4,  3,  3,  2,
     2,  1,  1,  0,
     1,  0,  0,  0,
     0,  0,  0, -1,
     0, -1, -1, -2,
    -2, -3, -3, -4,
    -4, -5, -5, -6,
    -6, -5, -5, -4,
    -4, -3, -3, -2,
    -2, -1, -1,  0,
    -1,  0,  0,
    SHORT_MAX
};

const s16 sNettoriEaterSporeFloatingLargeXVelocity[64] = {
     0,  0,  0, -1,
     0, -1, -1, -2,
    -2, -3, -3, -4,
    -4, -5, -5, -6,
    -6, -5, -5, -4,
    -4, -3, -3, -2,
    -2, -1, -1,  0,
    -1,  0,  0,  0,
     0,  0,  0,  1,
     0,  1,  1,  2,
     2,  3,  3,  4,
     4,  5,  5,  6,
     6,  5,  5,  4,
     4,  3,  3,  2,
     2,  1,  1,  0,
     1,  0,  0,
     SHORT_MAX
};

const s16 sNettoriEaterSporeMovingYVelocity[32] = {
    -10, -9, -8, -7,
     -6, -6, -5, -5,
     -4, -4, -3, -3,
     -2, -2, -1, -1,
      0,  0,  0,  0,
      0,  0,  0,  0,
      1,  2,  3,  4,
      5,  6,  8,
      SHORT_MAX
};


const u32 sNettoriGfx[4096] = INCBIN_U32("data/sprites/nettori.gfx");
const u16 sNettoriPal[8 * 16] = INCBIN_U16("data/sprites/nettori.pal");

static const u16 sNettoriOam_Idle_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    0xa0, OBJ_SIZE_32x32 | 0x1e0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xa8, OBJ_SIZE_8x32 | 0x0, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1e0, OBJ_SPRITE_OAM | 0x304,
    0xd0, OBJ_SIZE_16x16 | 0x1e0, OBJ_SPRITE_OAM | 0x344,
    OBJ_SHAPE_VERTICAL | 0xc8, OBJ_SIZE_8x32 | 0x0, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_16x32 | 0x1f0, OBJ_SPRITE_OAM | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x0, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_SPRITE_OAM | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1ea, OBJ_SPRITE_OAM | 0x268
};

static const u16 sNettoriOam_Idle_Frame1[OAM_DATA_SIZE(9)] = {
    0x9,
    0xa0, OBJ_SIZE_32x32 | 0x1e0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xa8, OBJ_SIZE_8x32 | 0x0, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1e0, OBJ_SPRITE_OAM | 0x300,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1e0, OBJ_SPRITE_OAM | 0x340,
    OBJ_SHAPE_VERTICAL | 0xc8, OBJ_SIZE_8x32 | 0x0, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_16x32 | 0x1f0, OBJ_SPRITE_OAM | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x0, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_SPRITE_OAM | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1ea, OBJ_SPRITE_OAM | 0x268
};

static const u16 sNettoriOam_Idle_Frame2[OAM_DATA_SIZE(9)] = {
    0x9,
    0xa0, OBJ_SIZE_32x32 | 0x1e0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xa8, OBJ_SIZE_8x32 | 0x0, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1e0, OBJ_SPRITE_OAM | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1e0, OBJ_SPRITE_OAM | 0x248,
    OBJ_SHAPE_VERTICAL | 0xc8, OBJ_SIZE_8x32 | 0x0, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_16x32 | 0x1f0, OBJ_SPRITE_OAM | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x0, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_SPRITE_OAM | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1ea, OBJ_SPRITE_OAM | 0x268
};

static const u16 sNettoriPartOam_PlasmaShootingHigh_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x1280
};

static const u16 sNettoriPartOam_PlasmaShootingHigh_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xa0, OBJ_SIZE_16x32 | 0x1e5, OBJ_SPRITE_OAM | 0x3308
};

static const u16 sNettoriPartOam_PlasmaShootingLow_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f8, OBJ_SPRITE_OAM | 0x3339,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, OBJ_SPRITE_OAM | 0x3378
};

static const u16 sNettoriPartOam_HeadVinesIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xa0, OBJ_SIZE_16x32 | 0x1e2, OBJ_SPRITE_OAM | 0x30a
};

static const u16 sNettoriPartOam_HeadVinesIdle_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xa0, OBJ_SIZE_16x32 | 0x1e0, OBJ_SPRITE_OAM | 0x30c,
    OBJ_SHAPE_VERTICAL | 0xa0, OBJ_SIZE_8x32 | 0x1f0, OBJ_SPRITE_OAM | 0x30e
};

static const u16 sNettoriPartOam_HeadVinesIdle_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xa0, OBJ_SIZE_16x32 | 0x1df, OBJ_SPRITE_OAM | 0x30f,
    OBJ_SHAPE_VERTICAL | 0xa0, OBJ_SIZE_8x32 | 0x1ef, OBJ_SPRITE_OAM | 0x311
};

static const u16 sNettoriPartOam_BodyVinesIdle_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1ee, OBJ_SPRITE_OAM | 0x376,
    OBJ_SHAPE_VERTICAL | 0xca, 0x1f6, OBJ_SPRITE_OAM | 0x337
};

static const u16 sNettoriPartOam_BodyVinesIdle_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xd9, OBJ_SIZE_16x16 | 0x1ee, OBJ_SPRITE_OAM | 0x354,
    0xd1, 0x1f6, OBJ_SPRITE_OAM | 0x335
};

static const u16 sNettoriPartOam_BodyVinesIdle_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd2, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x352
};

static const u16 sNettoriPartOam_RightArmIdle_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xcc, OBJ_SIZE_16x32 | 0x1df, OBJ_SPRITE_OAM | 0x211,
    OBJ_SHAPE_VERTICAL | 0xcc, 0x1d7, OBJ_SPRITE_OAM | 0x213
};

static const u16 sNettoriPartOam_HeadIdle_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xa4, OBJ_SIZE_32x32 | 0x1d7, OBJ_SPRITE_OAM | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xa6, 0x1cf, OBJ_SPRITE_OAM | 0x24c,
    0xc4, 0x1de, OBJ_SPRITE_OAM | 0x253
};

static const u16 sNettoriPartOam_LegIdle_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xdc, OBJ_SIZE_16x16 | 0x1ef, OBJ_SPRITE_OAM | 0x216,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1e7, OBJ_SPRITE_OAM | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xd4, 0x1ef, OBJ_SPRITE_OAM | 0x218
};

static const u16 sNettoriPartOam_LeftArmIdle_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xc4, OBJ_SIZE_16x16 | 0x1ef, OBJ_SPRITE_OAM | 0x214,
    0xd4, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x254,
    0xe4, 0x1ea, OBJ_SPRITE_OAM | 0x273
};

static const u16 sSamusEaterOam_Idle_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_64x32 | 0x1e0, OBJ_SPRITE_OAM | 0x1280
};

static const u16 sSamusEaterOam_Idle_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_64x32 | 0x1e0, OBJ_SPRITE_OAM | 0x1288
};

static const u16 sSamusEaterOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_64x32 | 0x1e0, OBJ_SPRITE_OAM | 0x1290
};

static const u16 sSamusEaterOam_EatingSamus_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x1380,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x8, OBJ_SPRITE_OAM | 0x1384
};

static const u16 sSamusEaterOam_EatingSamus_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x1386,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x8, OBJ_SPRITE_OAM | 0x138a
};

static const u16 sSamusEaterOam_EatingSamus_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe1, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x138c,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x8, OBJ_SPRITE_OAM | 0x1390
};

static const u16 sSamusEaterOam_EatingSamus_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x1392,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x8, OBJ_SPRITE_OAM | 0x1396
};

static const u16 sSamusEaterSporeOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x1258
};

static const u16 sSamusEaterSporeOam_Idle_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x1259
};

static const u16 sSamusEaterSporeOam_Idle_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x1278
};

static const u16 sSamusEaterSporeOam_Idle_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x1279
};

static const u16 sSamusEaterSporeOam_Exploding_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x1360
};

static const u16 sSamusEaterSporeOam_Exploding_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x1361
};

static const u16 sSamusEaterSporeOam_Exploding_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x1238
};

static const u16 sSamusEaterBudOam_TurningAround_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xfc, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x121e,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f7, OBJ_SPRITE_OAM | 0x1362
};

static const u16 sSamusEaterBudOam_Idle_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x125a,
    0xf7, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x1256
};

static const u16 sSamusEaterBudOam_Idle_Frame1[OAM_DATA_SIZE(3)] = {
    0x3,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x125c,
    0xfc, 0x0, OBJ_SPRITE_OAM | 0x1239,
    0xf7, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x1256
};

static const u16 sSamusEaterBudOam_Idle_Frame2[OAM_DATA_SIZE(3)] = {
    0x3,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x125e,
    0xfc, 0x0, OBJ_SPRITE_OAM | 0x1239,
    0xf7, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x1256
};

static const u16 sSamusEatingBudOam_Shooting_Frame3[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfd, OBJ_SIZE_16x16 | 0x1ec, OBJ_SPRITE_OAM | 0x121b,
    OBJ_SHAPE_VERTICAL | 0xfd, 0x1fc, OBJ_SPRITE_OAM | 0x121d,
    0xd, 0x1f4, OBJ_SPRITE_OAM | 0x1342,
    0xf8, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x1256
};

static const u16 sSamusEatingBudOam_Shooting_Frame4[OAM_DATA_SIZE(3)] = {
    0x3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1e3, OBJ_SPRITE_OAM | 0x12d8,
    0xc, 0x1fb, OBJ_SPRITE_OAM | 0x1343,
    0xf9, OBJ_SIZE_16x16 | 0x1f5, OBJ_SPRITE_OAM | 0x1256
};

static const u16 sNettoriPlasmaBeamOam_Moving_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2298
};

static const u16 sNettoriPlasmaBeamOam_Moving_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x229c
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x231a
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x231c
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f8, OBJ_SPRITE_OAM | 0x2298,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x231e
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x2398,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f8, OBJ_SPRITE_OAM | 0x229c
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame4[OAM_DATA_SIZE(3)] = {
    0x3,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x239a,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f4, OBJ_SPRITE_OAM | 0x2298,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1fa, OBJ_SPRITE_OAM | 0x2299
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame5[OAM_DATA_SIZE(3)] = {
    0x3,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f4, OBJ_SPRITE_OAM | 0x229c,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1fa, OBJ_SPRITE_OAM | 0x229d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x239c
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame6[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x2398,
    0xf9, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2298
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame7[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x239a,
    0xf9, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x229c
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame8[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf9, OBJ_SIZE_16x16 | 0x1ec, OBJ_SPRITE_OAM | 0x2298,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f8, OBJ_SPRITE_OAM | 0x2299,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x239c
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame9[OAM_DATA_SIZE(3)] = {
    0x3,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x2398,
    0xf9, OBJ_SIZE_16x16 | 0x1ec, OBJ_SPRITE_OAM | 0x229c,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f8, OBJ_SPRITE_OAM | 0x229d
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame10[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf9, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x2298,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f8, OBJ_SPRITE_OAM | 0x2299,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x239a
};

static const u16 sNettoriPlasmaBeamOam_Emerging_Frame11[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf9, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x229c,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f8, OBJ_SPRITE_OAM | 0x229d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x239c
};

static const u16 sNettoriPlasmaBeamOam_Charging_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2298
};

static const u16 sNettoriPlasmaBeamOam_Charging_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x229c
};


const struct FrameData sNettoriOam_Idle[5] = {
    [0] = {
        .pFrame = sNettoriOam_Idle_Frame0,
        .timer = 24
    },
    [1] = {
        .pFrame = sNettoriOam_Idle_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sNettoriOam_Idle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sNettoriOam_Idle_Frame1,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriOam_ChargingBeam[5] = {
    [0] = {
        .pFrame = sNettoriOam_Idle_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sNettoriOam_Idle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sNettoriOam_Idle_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sNettoriOam_Idle_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_RightArmIdle[2] = {
    [0] = {
        .pFrame = sNettoriPartOam_RightArmIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_HeadIdle[2] = {
    [0] = {
        .pFrame = sNettoriPartOam_HeadIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_HeadVinesIdle[5] = {
    [0] = {
        .pFrame = sNettoriPartOam_HeadVinesIdle_Frame0,
        .timer = 24
    },
    [1] = {
        .pFrame = sNettoriPartOam_HeadVinesIdle_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sNettoriPartOam_HeadVinesIdle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sNettoriPartOam_HeadVinesIdle_Frame1,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_HeadVinesShooting[5] = {
    [0] = {
        .pFrame = sNettoriPartOam_HeadVinesIdle_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sNettoriPartOam_HeadVinesIdle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sNettoriPartOam_HeadVinesIdle_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sNettoriPartOam_HeadVinesIdle_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_PlasmaShootingHigh[16] = {
    [0] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame0,
        .timer = 6
    },
    [3] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame0,
        .timer = 6
    },
    [5] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame0,
        .timer = 6
    },
    [7] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame0,
        .timer = 6
    },
    [9] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame0,
        .timer = 6
    },
    [11] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame0,
        .timer = 6
    },
    [13] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame0,
        .timer = UCHAR_MAX
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_LegIdle[2] = {
    [0] = {
        .pFrame = sNettoriPartOam_LegIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_BodyVinesIdle[5] = {
    [0] = {
        .pFrame = sNettoriPartOam_BodyVinesIdle_Frame0,
        .timer = 24
    },
    [1] = {
        .pFrame = sNettoriPartOam_BodyVinesIdle_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sNettoriPartOam_BodyVinesIdle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sNettoriPartOam_BodyVinesIdle_Frame1,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_BodyVinesShooting[5] = {
    [0] = {
        .pFrame = sNettoriPartOam_BodyVinesIdle_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sNettoriPartOam_BodyVinesIdle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sNettoriPartOam_BodyVinesIdle_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sNettoriPartOam_BodyVinesIdle_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_PlasmaShootingLow[16] = {
    [0] = {
        .pFrame = sNettoriPartOam_PlasmaShootingLow_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sNettoriPartOam_PlasmaShootingLow_Frame0,
        .timer = 6
    },
    [3] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sNettoriPartOam_PlasmaShootingLow_Frame0,
        .timer = 6
    },
    [5] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sNettoriPartOam_PlasmaShootingLow_Frame0,
        .timer = 6
    },
    [7] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sNettoriPartOam_PlasmaShootingLow_Frame0,
        .timer = 6
    },
    [9] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sNettoriPartOam_PlasmaShootingLow_Frame0,
        .timer = 6
    },
    [11] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sNettoriPartOam_PlasmaShootingLow_Frame0,
        .timer = 6
    },
    [13] = {
        .pFrame = sNettoriPartOam_PlasmaShootingHigh_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sNettoriPartOam_PlasmaShootingLow_Frame0,
        .timer = UCHAR_MAX
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPartOam_LeftArmIdle[2] = {
    [0] = {
        .pFrame = sNettoriPartOam_LeftArmIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSamusEaterOam_Idle[5] = {
    [0] = {
        .pFrame = sSamusEaterOam_Idle_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sSamusEaterOam_Idle_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sSamusEaterOam_Idle_Frame2,
        .timer = 20
    },
    [3] = {
        .pFrame = sSamusEaterOam_Idle_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSamusEaterOam_EatingSamus[14] = {
    [0] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame2,
        .timer = 10
    },
    [5] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame3,
        .timer = 10
    },
    [6] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame2,
        .timer = 10
    },
    [7] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame3,
        .timer = 10
    },
    [8] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame2,
        .timer = 10
    },
    [9] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame3,
        .timer = 10
    },
    [10] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame2,
        .timer = 10
    },
    [11] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame1,
        .timer = 6
    },
    [12] = {
        .pFrame = sSamusEaterOam_EatingSamus_Frame0,
        .timer = 6
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSamusEaterBudOam_Idle[5] = {
    [0] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSamusEaterBudOam_Shooting[9] = {
    [0] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSamusEatingBudOam_Shooting_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sSamusEatingBudOam_Shooting_Frame4,
        .timer = 30
    },
    [5] = {
        .pFrame = sSamusEatingBudOam_Shooting_Frame3,
        .timer = 8
    },
    [6] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame2,
        .timer = 8
    },
    [7] = {
        .pFrame = sSamusEaterBudOam_Idle_Frame1,
        .timer = 16
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSamusEaterBudOam_TurningAround[2] = {
    [0] = {
        .pFrame = sSamusEaterBudOam_TurningAround_Frame0,
        .timer = 8
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSamusEaterSporeOam_Idle[5] = {
    [0] = {
        .pFrame = sSamusEaterSporeOam_Idle_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSamusEaterSporeOam_Idle_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sSamusEaterSporeOam_Idle_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sSamusEaterSporeOam_Idle_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSamusEaterSporeOam_Exploding[4] = {
    [0] = {
        .pFrame = sSamusEaterSporeOam_Exploding_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sSamusEaterSporeOam_Exploding_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sSamusEaterSporeOam_Exploding_Frame2,
        .timer = 5
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPlasmaBeamOam_Moving[3] = {
    [0] = {
        .pFrame = sNettoriPlasmaBeamOam_Moving_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sNettoriPlasmaBeamOam_Moving_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPlasmaBeamOam_Emerging[23] = {
    [0] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame6,
        .timer = 3
    },
    [7] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame7,
        .timer = 3
    },
    [8] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame8,
        .timer = 3
    },
    [9] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame9,
        .timer = 3
    },
    [10] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame10,
        .timer = 3
    },
    [11] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame11,
        .timer = 3
    },
    [12] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame10,
        .timer = 3
    },
    [13] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame11,
        .timer = 3
    },
    [14] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame10,
        .timer = 3
    },
    [15] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame11,
        .timer = 3
    },
    [16] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame10,
        .timer = 3
    },
    [17] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame11,
        .timer = 3
    },
    [18] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame10,
        .timer = 3
    },
    [19] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame11,
        .timer = 3
    },
    [20] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame8,
        .timer = 2
    },
    [21] = {
        .pFrame = sNettoriPlasmaBeamOam_Emerging_Frame9,
        .timer = 2
    },
    [22] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNettoriPlasmaBeamOam_Charging[3] = {
    [0] = {
        .pFrame = sNettoriPlasmaBeamOam_Charging_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sNettoriPlasmaBeamOam_Charging_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};


const u16 sNettoriPal_Purple[1 * 16] = INCBIN_U16("data/sprites/nettori_purple.pal");
const u16 sNettoriPal_Red[1 * 16] = INCBIN_U16("data/sprites/nettori_red.pal");
const u16 sNettoriGlowingPal_1[1 * 16] = INCBIN_U16("data/sprites/nettori_glowing_1.pal");
const u16 sNettoriGlowingPal_2[1 * 16] = INCBIN_U16("data/sprites/nettori_glowing_2.pal");
const u16 sNettoriGlowingPal_3[1 * 16] = INCBIN_U16("data/sprites/nettori_glowing_3.pal");
