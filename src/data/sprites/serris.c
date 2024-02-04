#include "data/sprites/serris.h"
#include "macros.h"

const s16 sSerris_373548[49] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 2, 3, 4,
    3, 2, 1, 0,
    1, 0, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, -2, -3, -4,
    -3, -2, -1, 0,
    -1, 0, -1, 0,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sSerris_3735aa[65] = {
    0, 0, 0, 0,
    1, 1, 1, 1,
    2, 2, 2, 2,
    3, 3, 3, 3,
    3, 3, 3, 3,
    2, 2, 2, 2,
    1, 1, 1, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, -1, -1, -1,
    -2, -2, -2, -2,
    -3, -3, -3, -3,
    -3, -3, -3, -3,
    -2, -2, -2, -2,
    -1, -1, -1, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sSerris_37362c[81] = {
    0, 0, 1, 1,
    2, 2, 3, 3,
    4, 4, 5, 5,
    6, 6, 7, 7,
    7, 7, 8, 8,
    8, 8, 7, 7,
    7, 7, 6, 6,
    5, 5, 4, 4,
    3, 3, 2, 2,
    1, 1, 0, 0,
    0, 0, -1, -1,
    -2, -2, -3, -3,
    -4, -4, -5, -5,
    -6, -6, -7, -7,
    -7, -7, -8, -8,
    -8, -8, -7, -7,
    -7, -7, -6, -6,
    -5, -5, -4, -4,
    -3, -3, -2, -2,
    -1, -1, 0, 0,
    SHORT_MAX
};

const s16 sSerrisPartDyingVelocity[8] = {
    -16, -12, -10, -8,
    -6, -4, -2,

    SHORT_MAX
};

const s16 sSerrisPartFallingVelocity[12] = {
    1, 2, 4, 6,
    8, 10, 12, 14,
    16, 18, 20,
    
    SHORT_MAX
};

const u32 sSerrisGfx[4096] = INCBIN_U32("data/sprites/serris.gfx");
const u16 sSerrisPal[16 * 8] = INCBIN_U16("data/sprites/serris.pal");

static const u16 sSerrisOam_Left_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x29c,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x310,
    0x10, 0x0, OBJ_SPRITE_OAM | 0x351,
    0x10, 0x1f8, OBJ_SPRITE_OAM | 0x350,
    0x10, 0x1f0, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_HeadDiagonalIdle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf8, OBJ_SIZE_32x32 | 0x1ec, OBJ_SPRITE_OAM | 0x38a,
    0xf0, 0x1f4, OBJ_SPRITE_OAM | 0x36b,
    0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x36c,
    0xf0, 0x4, OBJ_SPRITE_OAM | 0x36d
};

static const u16 sSerrisOam_HeadFrontIdle_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x36e,
    0x10, 0x1f8, OBJ_SPRITE_OAM | 0x3ef,
    0x10, 0x0, OBJ_SPRITE_OAM | 0x3f0
};

static const u16 sSerrisOam_Left_Frame4[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x21c,
    0xfe, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x310,
    0xe, 0x1ff, OBJ_SPRITE_OAM | 0x351,
    0xe, 0x1f7, OBJ_SPRITE_OAM | 0x350,
    0xe, 0x1ef, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_Left_Frame1[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x31c,
    0x2, OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x310,
    0x12, 0x1, OBJ_SPRITE_OAM | 0x351,
    0x12, 0x1f9, OBJ_SPRITE_OAM | 0x350,
    0x12, 0x1f1, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_Left_Frame2[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x29c,
    0x4, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x310,
    0x14, 0x2, OBJ_SPRITE_OAM | 0x351,
    0x14, 0x1fa, OBJ_SPRITE_OAM | 0x350,
    0x14, 0x1f2, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_3778a6[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x29c,
    0x8, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x310,
    0x18, 0x4, OBJ_SPRITE_OAM | 0x351,
    0x18, 0x1fc, OBJ_SPRITE_OAM | 0x350,
    0x18, 0x1f4, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_3778c6[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x21c,
    0xfc, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x310,
    0xc, 0x1fe, OBJ_SPRITE_OAM | 0x351,
    0xc, 0x1f6, OBJ_SPRITE_OAM | 0x350,
    0xc, 0x1ee, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_3778e6[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x31c,
    0x4, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x310,
    0x14, 0x2, OBJ_SPRITE_OAM | 0x351,
    0x14, 0x1fa, OBJ_SPRITE_OAM | 0x350,
    0x14, 0x1f2, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisPartOam_Left_Frame2[OAM_DATA_SIZE(8)] = {
    0x8,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1204,
    0xeb, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x1392,
    0xeb, 0x7, OBJ_SPRITE_OAM | 0x1394,
    0xee, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x1395,
    0xee, OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x1397,
    0xf7, 0x6, OBJ_SPRITE_OAM | 0x1359,
    0xf7, 0xe, OBJ_SPRITE_OAM | 0x135a,
    0xf7, 0x16, OBJ_SPRITE_OAM | 0x135b
};

static const u16 sSerrisPartOam_Left_Frame1[OAM_DATA_SIZE(8)] = {
    0x8,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1204,
    0xea, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x1352,
    0xea, 0x6, OBJ_SPRITE_OAM | 0x1354,
    0xed, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x1355,
    0xed, OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x1357,
    0xf6, 0x6, OBJ_SPRITE_OAM | 0x1339,
    0xf6, 0xe, OBJ_SPRITE_OAM | 0x133a,
    0xf6, 0x16, OBJ_SPRITE_OAM | 0x133b
};

static const u16 sSerrisPartOam_Left_Frame0[OAM_DATA_SIZE(8)] = {
    0x8,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1204,
    0xea, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x1312,
    0xea, 0x6, OBJ_SPRITE_OAM | 0x1314,
    0xed, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x1315,
    0xed, OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x1317,
    0xf6, 0x5, OBJ_SPRITE_OAM | 0x1319,
    0xf6, 0xd, OBJ_SPRITE_OAM | 0x131a,
    0xf6, 0x15, OBJ_SPRITE_OAM | 0x131b
};

static const u16 sSerrisPartOam_HeadJointDiagonalIdle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1208,
    0xea, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x13d3,
    0xef, OBJ_SIZE_16x16 | 0x3, OBJ_SPRITE_OAM | 0x13d5,
    0xf6, OBJ_SIZE_16x16 | 0x4, OBJ_SPRITE_OAM | 0x13d5
};

static const u16 sSerrisPartOam_HeadJointFrontIdle_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x120c,
    0xea, 0x1fc, OBJ_SPRITE_OAM | 0x13d2,
    0xf2, 0x1fc, OBJ_SPRITE_OAM | 0x13f2
};

static const u16 sSerrisOam_3779ca[OAM_DATA_SIZE(8)] = {
    0x8,
    0xf2, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3284,
    0xea, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x3312,
    0xea, 0x6, OBJ_SPRITE_OAM | 0x3314,
    0xed, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x3315,
    0xed, OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x3317,
    0xf6, 0x5, OBJ_SPRITE_OAM | 0x3319,
    0xf6, 0xd, OBJ_SPRITE_OAM | 0x331a,
    0xf6, 0x15, OBJ_SPRITE_OAM | 0x331b
};

static const u16 sSerrisOam_3779fc[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf2, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x339d,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33db,
    0xfa, 0x5, OBJ_SPRITE_OAM | 0x337a,
    0xfa, 0xd, OBJ_SPRITE_OAM | 0x337b
};

static const u16 sSerrisOam_377a1c[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf5, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288,
    0xf3, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x339d,
    0xf3, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33db,
    0xfd, 0x5, OBJ_SPRITE_OAM | 0x337a,
    0xfd, 0xd, OBJ_SPRITE_OAM | 0x337b
};

static const u16 sSerrisOam_377a3c[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf4, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288,
    0xf2, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x339d,
    0xf2, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33db,
    0xfc, 0x5, OBJ_SPRITE_OAM | 0x337a,
    0xfc, 0xd, OBJ_SPRITE_OAM | 0x337b
};

static const u16 sSerrisOam_377a5c[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf2, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x339d,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33db,
    0xfa, 0x5, OBJ_SPRITE_OAM | 0x337a,
    0xfa, 0xd, OBJ_SPRITE_OAM | 0x337b
};

static const u16 sSerrisOam_377a7c[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf1, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288,
    0xef, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x339d,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33db,
    0xf9, 0x5, OBJ_SPRITE_OAM | 0x337a,
    0xf9, 0xd, OBJ_SPRITE_OAM | 0x337b
};

static const u16 sSerrisOam_377a9c[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288,
    0xee, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x339d,
    0xee, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33db,
    0xf8, 0x5, OBJ_SPRITE_OAM | 0x337a,
    0xf8, 0xd, OBJ_SPRITE_OAM | 0x337b
};

static const u16 sSerrisOam_377abc[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288,
    0xed, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x339b,
    0xed, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33d9,
    0xf7, 0x5, OBJ_SPRITE_OAM | 0x32fa,
    0xf7, 0xd, OBJ_SPRITE_OAM | 0x32fb
};

static const u16 sSerrisOam_377adc[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288,
    0xed, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x3399,
    0xed, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33d7,
    0xf7, 0x5, OBJ_SPRITE_OAM | 0x32da,
    0xf7, 0xd, OBJ_SPRITE_OAM | 0x32db
};

static const u16 sSerrisOam_377afc[OAM_DATA_SIZE(7)] = {
    0x7,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x328c,
    0xf2, 0x1fa, OBJ_SPRITE_OAM | 0x33fe,
    0xea, 0x1fa, OBJ_SPRITE_OAM | 0x33de,
    0xf7, 0x3, OBJ_SPRITE_OAM | 0x33ff,
    0xef, 0x3, OBJ_SPRITE_OAM | 0x33df,
    0xfe, 0x4, OBJ_SPRITE_OAM | 0x33ff,
    0xf6, 0x4, OBJ_SPRITE_OAM | 0x33df
};

static const u16 sSerrisOam_377b28[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3290,
    0xf2, 0x1fc, OBJ_SPRITE_OAM | 0x33fd,
    0xea, 0x1fc, OBJ_SPRITE_OAM | 0x33dd
};

static const u16 sSerrisPartOam_Middle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1200
};

static const u16 sSerrisPartOam_SectionDiagonalIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1208
};

static const u16 sSerrisPartOam_SectionFrontIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x120c
};

static const u16 sSerrisOam_377b54[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf2, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3280
};

static const u16 sSerrisOam_377b5c[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf2, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288
};

static const u16 sSerrisOam_377b64[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf5, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288
};

static const u16 sSerrisOam_377b6c[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf4, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288
};

static const u16 sSerrisOam_377b74[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf2, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288
};

static const u16 sSerrisOam_377b7c[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf1, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288
};

static const u16 sSerrisOam_377b84[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3288
};

static const u16 sSerrisOam_377b8c[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x328c
};

static const u16 sSerrisOam_377b94[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3290
};

static const u16 sSerrisOam_377b9c[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x3306,
    OBJ_SHAPE_HORIZONTAL | 0x12, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x3346,
    0x6, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x3368,
    OBJ_SHAPE_HORIZONTAL | 0x16, 0x1f7, OBJ_SPRITE_OAM | 0x33a8
};

static const u16 sSerrisOam_377bb6[OAM_DATA_SIZE(4)] = {
    0x4,
    0x5, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x3300,
    0x25, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3304,
    0x15, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x3368,
    OBJ_SHAPE_HORIZONTAL | 0x25, 0x1f7, OBJ_SPRITE_OAM | 0x33a8
};

static const u16 sSerrisOam_377bd0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x3306,
    OBJ_SHAPE_HORIZONTAL | 0x14, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x3346
};

static const u16 sSerrisOam_377bde[OAM_DATA_SIZE(2)] = {
    0x2,
    0x2, OBJ_SIZE_16x16 | 0x1f5, OBJ_SPRITE_OAM | 0x3344,
    0xc, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3366
};

static const u16 sSerrisOam_377bec[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3368,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_SPRITE_OAM | 0x33a8
};

static const u16 sSerrisOam_377bfa[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3366
};

static const u16 sSerrisOam_377c02[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x3380,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x4, OBJ_SPRITE_OAM | 0x3382
};

static const u16 sSerrisOam_377c10[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x33c0,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x4, OBJ_SPRITE_OAM | 0x33c2
};

static const u16 sSerrisOam_377c1e[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x3383,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x4, OBJ_SPRITE_OAM | 0x3385
};

static const u16 sSerrisOam_377c2c[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf9, 0x1f2, OBJ_SPRITE_OAM | 0x3383,
    0x4, 0x1f2, OBJ_SPRITE_OAM | 0x33a3,
    0xf9, 0x6, OBJ_SPRITE_OAM | 0x3385,
    0x4, 0x6, OBJ_SPRITE_OAM | 0x33a5
};

static const u16 sSerrisPartOam_MiddleEnd_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1210
};

static const u16 sSerrisPartOam_MiddleEndDiagonalIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1214
};

static const u16 sSerrisPartOam_MiddleEndFrontIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1218
};

static const u16 sSerrisPartOam_TailJoint_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1294
};

static const u16 sSerrisPartOam_TailJointDiagonalIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1296
};

static const u16 sSerrisPartOam_TailJointFrontIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1298
};

static const u16 sSerrisPartOam_Tail_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x13c3
};

static const u16 sSerrisPartOam_TailIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x13c6
};

static const u16 sSerrisPartOam_TailFrontIdle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x13c8
};

static const u16 sMiniSerrisOam_Idle_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1f8, OBJ_SPRITE_OAM | 0x34a,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x30a,
    0xf6, OBJ_SIZE_16x16 | 0x3, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0xc, OBJ_SPRITE_OAM | 0x12d8
};

static const u16 sMiniSerrisOam_Idle_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f9, OBJ_SPRITE_OAM | 0x34a,
    0xf6, OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x30a,
    0xf5, OBJ_SIZE_16x16 | 0x4, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x12d6
};

static const u16 sMiniSerrisOam_Idle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f9, OBJ_SPRITE_OAM | 0x34a,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x30a,
    0xf4, OBJ_SIZE_16x16 | 0x4, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0xe, OBJ_SPRITE_OAM | 0x12d4
};

static const u16 sMiniSerrisOam_TurningLeft_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf7, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x30c,
    0x7, 0x1fa, OBJ_SPRITE_OAM | 0x34c,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x12d4
};

static const u16 sMiniSerrisOam_TurningLeft_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf7, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x30c,
    0x7, 0x1f8, OBJ_SPRITE_OAM | 0x34c,
    0xf4, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0x2, OBJ_SPRITE_OAM | 0x12d4
};

static const u16 sMiniSerrisOam_TurningLeft_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf7, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x30e,
    0x7, 0x1f6, OBJ_SPRITE_OAM | 0x34d,
    0xf4, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x12d4
};

static const u16 sMiniSerrisOam_TurningLeft_Frame3[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf7, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x30e,
    0x7, 0x1f4, OBJ_SPRITE_OAM | 0x34d,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1298
};

static const u16 sMiniSerrisOam_TurningLeft_Frame4[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x30c,
    0x7, OBJ_X_FLIP | 0x1f6, OBJ_SPRITE_OAM | 0x34c,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ee, OBJ_SPRITE_OAM | 0x129a
};

static const u16 sMiniSerrisOam_TurningLeft_Frame5[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x30c,
    0x7, OBJ_X_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x34c,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ed, OBJ_SPRITE_OAM | 0x129a,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x12d8
};

static const u16 sMiniSerrisOam_TurningLeft_Frame6[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_X_FLIP | 0x1f6, OBJ_SPRITE_OAM | 0x34a,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x30a,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ea, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e5, OBJ_SPRITE_OAM | 0x12d6
};

static const u16 sMiniSerrisOam_TurningRight_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x30c,
    0x7, OBJ_X_FLIP | 0x1fe, OBJ_SPRITE_OAM | 0x34c,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x12d4
};

static const u16 sMiniSerrisOam_TurningRight_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x30c,
    0x7, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x34c,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ee, OBJ_SPRITE_OAM | 0x12d4
};

static const u16 sMiniSerrisOam_TurningRight_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_SPRITE_OAM | 0x30e,
    0x7, OBJ_X_FLIP | 0x2, OBJ_SPRITE_OAM | 0x34d,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x12d4
};

static const u16 sMiniSerrisOam_TurningRight_Frame3[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x30e,
    0x7, OBJ_X_FLIP | 0x4, OBJ_SPRITE_OAM | 0x34d,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1298
};

static const u16 sMiniSerrisOam_TurningRight_Frame4[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf7, OBJ_SIZE_16x16 | 0x1fe, OBJ_SPRITE_OAM | 0x30c,
    0x7, 0x2, OBJ_SPRITE_OAM | 0x34c,
    0xf4, OBJ_SIZE_16x16 | 0x2, OBJ_SPRITE_OAM | 0x129a
};

static const u16 sMiniSerrisOam_TurningRight_Frame5[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf7, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x30c,
    0x7, 0x0, OBJ_SPRITE_OAM | 0x34c,
    0xf4, OBJ_SIZE_16x16 | 0x3, OBJ_SPRITE_OAM | 0x129a,
    0xf2, OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x12d8
};

static const u16 sMiniSerrisOam_TurningRight_Frame6[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1fa, OBJ_SPRITE_OAM | 0x34a,
    0xf7, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x30a,
    0xf4, OBJ_SIZE_16x16 | 0x6, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0xb, OBJ_SPRITE_OAM | 0x12d6
};

static const u16 sMiniSerrisOam_Fast_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1f8, OBJ_SPRITE_OAM | 0x34a,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x30a,
    0xf6, OBJ_SIZE_16x16 | 0x3, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0xc, OBJ_SPRITE_OAM | 0x12d8
};

static const u16 sMiniSerrisOam_Fast_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f9, OBJ_SPRITE_OAM | 0x34a,
    0xf6, OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x30a,
    0xf5, OBJ_SIZE_16x16 | 0x4, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x12d6
};

static const u16 sMiniSerrisOam_Fast_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1f9, OBJ_SPRITE_OAM | 0x34a,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x30a,
    0xf4, OBJ_SIZE_16x16 | 0x4, OBJ_SPRITE_OAM | 0x129a,
    0xf4, OBJ_SIZE_16x16 | 0xe, OBJ_SPRITE_OAM | 0x12d4
};

static const u16 sSerrisOam_Jumbled_Frame0[OAM_DATA_SIZE(25)] = {
    0x19,
    0xe8, OBJ_SIZE_32x32 | 0x188, OBJ_SPRITE_OAM | 0x29c,
    0xf8, OBJ_SIZE_16x16 | 0x198, OBJ_SPRITE_OAM | 0x310,
    0x8, 0x1a0, OBJ_SPRITE_OAM | 0x351,
    0x8, 0x198, OBJ_SPRITE_OAM | 0x350,
    0x8, 0x190, OBJ_SPRITE_OAM | 0x34f,
    0xe8, OBJ_SIZE_32x32 | 0x1a0, OBJ_SPRITE_OAM | 0x1204,
    0xe2, OBJ_SIZE_16x16 | 0x1a6, OBJ_SPRITE_OAM | 0x1312,
    0xe2, 0x1b6, OBJ_SPRITE_OAM | 0x1314,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1ad, OBJ_SPRITE_OAM | 0x1315,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1b5, OBJ_SPRITE_OAM | 0x1319,
    0xee, 0x1c5, OBJ_SPRITE_OAM | 0x131b,
    0xeb, OBJ_SIZE_32x32 | 0x1b0, OBJ_SPRITE_OAM | 0x101c,
    0xf4, OBJ_SIZE_32x32 | 0x1bf, OBJ_SPRITE_OAM | 0x109c,
    0x3, OBJ_SIZE_32x32 | 0x1cb, OBJ_SPRITE_OAM | 0x111c,
    0xd, OBJ_SIZE_32x32 | 0x1d7, OBJ_SPRITE_OAM | 0x109c,
    0x11, OBJ_SIZE_32x32 | 0x1e1, OBJ_SPRITE_OAM | 0x101c,
    0xf, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1200,
    0xa, OBJ_SIZE_32x32 | 0x1fd, OBJ_SPRITE_OAM | 0x1200,
    0x3, OBJ_SIZE_32x32 | 0x6, OBJ_SPRITE_OAM | 0x1200,
    0xfd, OBJ_SIZE_32x32 | 0x12, OBJ_SPRITE_OAM | 0x101c,
    0xf9, OBJ_SIZE_32x32 | 0x1d, OBJ_SPRITE_OAM | 0x101c,
    0xf8, OBJ_SIZE_32x32 | 0x2a, OBJ_SPRITE_OAM | 0x101c,
    0xf5, OBJ_SIZE_32x32 | 0x3c, OBJ_SPRITE_OAM | 0x1210,
    0xfd, OBJ_SIZE_16x16 | 0x4f, OBJ_SPRITE_OAM | 0x1294,
    0xff, OBJ_SIZE_16x16 | 0x58, OBJ_SPRITE_OAM | 0x13c3
};

static const u16 sSerrisOam_Right_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f8, OBJ_SPRITE_OAM | 0x29c,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x310,
    0x10, OBJ_X_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x351,
    0x10, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x350,
    0x10, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_Right_Frame4[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f8, OBJ_SPRITE_OAM | 0x21c,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x310,
    0xe, OBJ_X_FLIP | 0x1f9, OBJ_SPRITE_OAM | 0x351,
    0xe, OBJ_X_FLIP | 0x1, OBJ_SPRITE_OAM | 0x350,
    0xe, OBJ_X_FLIP | 0x9, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_Right_Frame1[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f8, OBJ_SPRITE_OAM | 0x31c,
    0x2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x310,
    0x12, OBJ_X_FLIP | 0x1f7, OBJ_SPRITE_OAM | 0x351,
    0x12, OBJ_X_FLIP | 0x1ff, OBJ_SPRITE_OAM | 0x350,
    0x12, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_Right_Frame2[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f8, OBJ_SPRITE_OAM | 0x29c,
    0x4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x310,
    0x14, OBJ_X_FLIP | 0x1f6, OBJ_SPRITE_OAM | 0x351,
    0x14, OBJ_X_FLIP | 0x1fe, OBJ_SPRITE_OAM | 0x350,
    0x14, OBJ_X_FLIP | 0x6, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_SpeedboostingLeft_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x29c,
    0xfc, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x310,
    0xc, 0x1fe, OBJ_SPRITE_OAM | 0x351,
    0xc, 0x1f6, OBJ_SPRITE_OAM | 0x350,
    0xc, 0x1ee, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisOam_SpeedboostingRight_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f8, OBJ_SPRITE_OAM | 0x29c,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x310,
    0xc, OBJ_X_FLIP | 0x1fa, OBJ_SPRITE_OAM | 0x351,
    0xc, OBJ_X_FLIP | 0x2, OBJ_SPRITE_OAM | 0x350,
    0xc, OBJ_X_FLIP | 0xa, OBJ_SPRITE_OAM | 0x34f
};

static const u16 sSerrisPartOam_Right_Frame2[OAM_DATA_SIZE(8)] = {
    0x8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1204,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x1392,
    0xeb, OBJ_X_FLIP | 0x1f1, OBJ_SPRITE_OAM | 0x1394,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x1395,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e3, OBJ_SPRITE_OAM | 0x1397,
    0xf7, OBJ_X_FLIP | 0x1f2, OBJ_SPRITE_OAM | 0x1359,
    0xf7, OBJ_X_FLIP | 0x1ea, OBJ_SPRITE_OAM | 0x135a,
    0xf7, OBJ_X_FLIP | 0x1e2, OBJ_SPRITE_OAM | 0x135b
};

static const u16 sSerrisPartOam_Right_Frame1[OAM_DATA_SIZE(8)] = {
    0x8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1204,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x1352,
    0xea, OBJ_X_FLIP | 0x1f2, OBJ_SPRITE_OAM | 0x1354,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x1355,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e3, OBJ_SPRITE_OAM | 0x1357,
    0xf6, OBJ_X_FLIP | 0x1f2, OBJ_SPRITE_OAM | 0x1339,
    0xf6, OBJ_X_FLIP | 0x1ea, OBJ_SPRITE_OAM | 0x133a,
    0xf6, OBJ_X_FLIP | 0x1e2, OBJ_SPRITE_OAM | 0x133b
};

static const u16 sSerrisPartOam_Right_Frame0[OAM_DATA_SIZE(8)] = {
    0x8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1204,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x1312,
    0xea, OBJ_X_FLIP | 0x1f2, OBJ_SPRITE_OAM | 0x1314,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x1315,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e3, OBJ_SPRITE_OAM | 0x1317,
    0xf6, OBJ_X_FLIP | 0x1f3, OBJ_SPRITE_OAM | 0x1319,
    0xf6, OBJ_X_FLIP | 0x1eb, OBJ_SPRITE_OAM | 0x131a,
    0xf6, OBJ_X_FLIP | 0x1e3, OBJ_SPRITE_OAM | 0x131b
};

static const u16 sSerrisBlockOam_Idle1_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2280
};

static const u16 sSerrisBlockOam_Crumbling1_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2282
};

static const u16 sSerrisBlockOam_Crumbling1_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2284
};

static const u16 sSerrisBlockOam_Crumbling1_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2286,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x228c,
    0xfa, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2288,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x0, OBJ_SPRITE_OAM | 0x228b
};

static const u16 sSerrisBlockOam_Crumbling1_Frame3[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfa, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2286,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x228c,
    0xfe, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2288,
    OBJ_SHAPE_VERTICAL | 0xfb, 0x0, OBJ_SPRITE_OAM | 0x228b
};

static const u16 sSerrisBlockOam_Crumbling1_Frame4[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfc, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2286,
    0xfa, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x228c,
    0x3, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2288,
    OBJ_SHAPE_VERTICAL | 0xfd, 0x0, OBJ_SPRITE_OAM | 0x228b
};

static const u16 sSerrisBlockOam_Crumbling1_Frame5[OAM_DATA_SIZE(5)] = {
    0x5,
    0x2, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2286,
    0xfd, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x228c,
    0x11, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2288,
    OBJ_SHAPE_VERTICAL | 0x5, 0x0, OBJ_SPRITE_OAM | 0x228b,
    0x12, 0x1fd, OBJ_SPRITE_OAM | 0x228a
};

static const u16 sSerrisBlockOam_Crumbling1_Frame6[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2286,
    0x3, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x228c,
    0x23, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2288,
    OBJ_SHAPE_VERTICAL | 0x14, 0x0, OBJ_SPRITE_OAM | 0x228b,
    0x23, 0x1fd, OBJ_SPRITE_OAM | 0x228a
};

static const u16 sSerrisBlockOam_Crumbling1_Frame7[OAM_DATA_SIZE(5)] = {
    0x5,
    0x1c, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2286,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x228c,
    0x38, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x2288,
    OBJ_SHAPE_VERTICAL | 0x24, 0x0, OBJ_SPRITE_OAM | 0x228b,
    0x37, 0x1fd, OBJ_SPRITE_OAM | 0x228a
};

static const u16 sSerrisBlockOam_Idle0_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c0
};

static const u16 sSerrisBlockOam_Crumbling0_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c2
};

static const u16 sSerrisBlockOam_Crumbling0_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c4
};

static const u16 sSerrisBlockOam_Crumbling0_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c6,
    0xfa, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22cc,
    0xfa, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c8,
    0xfc, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22ca
};

static const u16 sSerrisBlockOam_Crumbling0_Frame3[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfa, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c6,
    0xfc, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22cc,
    0xfb, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c8,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22ca
};

static const u16 sSerrisBlockOam_Crumbling0_Frame4[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfb, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c6,
    0xff, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22cc,
    0xfd, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c8,
    0x6, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22ca
};

static const u16 sSerrisBlockOam_Crumbling0_Frame5[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfd, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c6,
    0x4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22cc,
    0x3, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c8,
    0xe, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22ca
};

static const u16 sSerrisBlockOam_Crumbling0_Frame6[OAM_DATA_SIZE(4)] = {
    0x4,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c6,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22cc,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c8,
    0x17, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22ca
};

static const u16 sSerrisBlockOam_Crumbling0_Frame7[OAM_DATA_SIZE(4)] = {
    0x4,
    0x4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c6,
    0x10, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22cc,
    0x10, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22c8,
    0x23, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22ca
};


const struct FrameData sSerrisOam_HeadIdle[2] = {
    [0] = {
        .pFrame = sSerrisOam_Left_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisOam_HeadDiagonalIdle[2] = {
    [0] = {
        .pFrame = sSerrisOam_HeadDiagonalIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisOam_HeadFrontIdle[2] = {
    [0] = {
        .pFrame = sSerrisOam_HeadFrontIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisOam_Left[6] = {
    [0] = {
        .pFrame = sSerrisOam_Left_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSerrisOam_Left_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSerrisOam_Left_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSerrisOam_Left_Frame1,
        .timer = 8
    },
    [4] = {
        .pFrame = sSerrisOam_Left_Frame4,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisOam_Right[6] = {
    [0] = {
        .pFrame = sSerrisOam_Right_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSerrisOam_Right_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSerrisOam_Right_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSerrisOam_Right_Frame1,
        .timer = 8
    },
    [4] = {
        .pFrame = sSerrisOam_Right_Frame4,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisOam_SpeedboostingLeft[2] = {
    [0] = {
        .pFrame = sSerrisOam_SpeedboostingLeft_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisOam_SpeedboostingRight[2] = {
    [0] = {
        .pFrame = sSerrisOam_SpeedboostingRight_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisPartOam_HeadJointIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_Left_Frame0,
        .timer = 8
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_HeadJointDiagonalIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_HeadJointDiagonalIdle_Frame0,
        .timer = 8
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_HeadJointFrontIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_HeadJointFrontIdle_Frame0,
        .timer = 8
    },
    [1] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisPartOam_Left[5] = {
    [0] = {
        .pFrame = sSerrisPartOam_Left_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sSerrisPartOam_Left_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sSerrisPartOam_Left_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sSerrisPartOam_Left_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_HadJointFlapping[5] = {
    [0] = {
        .pFrame = sSerrisPartOam_Left_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSerrisPartOam_Left_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sSerrisPartOam_Left_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sSerrisPartOam_Left_Frame1,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378318[7] = {
    [0] = {
        .pFrame = sSerrisOam_3779ca,
        .timer = 8
    },
    [1] = {
        .pFrame = sSerrisOam_3779fc,
        .timer = 8
    },
    [2] = {
        .pFrame = sSerrisOam_377a1c,
        .timer = 4
    },
    [3] = {
        .pFrame = sSerrisOam_377a3c,
        .timer = 6
    },
    [4] = {
        .pFrame = sSerrisOam_377a5c,
        .timer = 6
    },
    [5] = {
        .pFrame = sSerrisOam_377a7c,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378350[5] = {
    [0] = {
        .pFrame = sSerrisOam_377adc,
        .timer = 12
    },
    [1] = {
        .pFrame = sSerrisOam_377abc,
        .timer = 12
    },
    [2] = {
        .pFrame = sSerrisOam_377a9c,
        .timer = 12
    },
    [3] = {
        .pFrame = sSerrisOam_377abc,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378378[5] = {
    [0] = {
        .pFrame = sSerrisOam_377adc,
        .timer = 2
    },
    [1] = {
        .pFrame = sSerrisOam_377abc,
        .timer = 2
    },
    [2] = {
        .pFrame = sSerrisOam_377a9c,
        .timer = 2
    },
    [3] = {
        .pFrame = sSerrisOam_377abc,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_3783a0[2] = {
    [0] = {
        .pFrame = sSerrisOam_377adc,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_3783b0[2] = {
    [0] = {
        .pFrame = sSerrisOam_377afc,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_3783c0[2] = {
    [0] = {
        .pFrame = sSerrisOam_377b28,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_Middle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_Middle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_SectionDiagonalIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_SectionDiagonalIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_SectionFrontIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_SectionFrontIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378400[7] = {
    [0] = {
        .pFrame = sSerrisOam_377b54,
        .timer = 8
    },
    [1] = {
        .pFrame = sSerrisOam_377b5c,
        .timer = 8
    },
    [2] = {
        .pFrame = sSerrisOam_377b64,
        .timer = 4
    },
    [3] = {
        .pFrame = sSerrisOam_377b6c,
        .timer = 6
    },
    [4] = {
        .pFrame = sSerrisOam_377b74,
        .timer = 6
    },
    [5] = {
        .pFrame = sSerrisOam_377b7c,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378438[2] = {
    [0] = {
        .pFrame = sSerrisOam_377b84,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378448[2] = {
    [0] = {
        .pFrame = sSerrisOam_377b8c,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378458[2] = {
    [0] = {
        .pFrame = sSerrisOam_377b94,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378468[5] = {
    [0] = {
        .pFrame = sSerrisOam_377b9c,
        .timer = 8
    },
    [1] = {
        .pFrame = sSerrisOam_377bb6,
        .timer = 4
    },
    [2] = {
        .pFrame = sSerrisOam_377bd0,
        .timer = 6
    },
    [3] = {
        .pFrame = sSerrisOam_377bde,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_378490[2] = {
    [0] = {
        .pFrame = sSerrisOam_377bec,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_3784a0[2] = {
    [0] = {
        .pFrame = sSerrisOam_377bfa,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_3784b0[5] = {
    [0] = {
        .pFrame = sSerrisOam_377c02,
        .timer = 4
    },
    [1] = {
        .pFrame = sSerrisOam_377c10,
        .timer = 4
    },
    [2] = {
        .pFrame = sSerrisOam_377c1e,
        .timer = 4
    },
    [3] = {
        .pFrame = sSerrisOam_377c2c,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisPartOam_MiddleEnd[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_MiddleEnd_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_MiddleEndDiagonalIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_MiddleEndDiagonalIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_MiddleEndFrontIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_MiddleEndFrontIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisPartOam_TailJoint[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_TailJoint_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_TailJointDiagonalIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_TailJointDiagonalIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_TailJointFrontIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_TailJointFrontIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_Tail[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_Tail_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_TailIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_TailIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisPartOam_TailFrontIdle[2] = {
    [0] = {
        .pFrame = sSerrisPartOam_TailFrontIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};


const struct FrameData sMiniSerrisOam_Idle[5] = {
    [0] = {
        .pFrame = sMiniSerrisOam_Idle_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sMiniSerrisOam_Idle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sMiniSerrisOam_Idle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sMiniSerrisOam_Idle_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMiniSerrisOam_Fast[5] = {
    [0] = {
        .pFrame = sMiniSerrisOam_Fast_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sMiniSerrisOam_Fast_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sMiniSerrisOam_Fast_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sMiniSerrisOam_Fast_Frame1,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMiniSerrisOam_TurningLeft[8] = {
    [0] = {
        .pFrame = sMiniSerrisOam_TurningLeft_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sMiniSerrisOam_TurningLeft_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sMiniSerrisOam_TurningLeft_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sMiniSerrisOam_TurningLeft_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sMiniSerrisOam_TurningLeft_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sMiniSerrisOam_TurningLeft_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sMiniSerrisOam_TurningLeft_Frame6,
        .timer = 4
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMiniSerrisOam_TurningRight[8] = {
    [0] = {
        .pFrame = sMiniSerrisOam_TurningRight_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sMiniSerrisOam_TurningRight_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sMiniSerrisOam_TurningRight_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sMiniSerrisOam_TurningRight_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sMiniSerrisOam_TurningRight_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sMiniSerrisOam_TurningRight_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sMiniSerrisOam_TurningRight_Frame6,
        .timer = 4
    },
    [7] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisOam_Jumbled[2] = {
    [0] = {
        .pFrame = sSerrisOam_Jumbled_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisOam_378648[2] = {
    [0] = {
        .pFrame = sSerrisOam_Right_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisPartOam_Right[5] = {
    [0] = {
        .pFrame = sSerrisPartOam_Right_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sSerrisPartOam_Right_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sSerrisPartOam_Right_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sSerrisPartOam_Right_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisBlockOam_Idle1[2] = {
    [0] = {
        .pFrame = sSerrisBlockOam_Idle1_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisBlockOam_Crumbling1[9] = {
    [0] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisBlockOam_Falling1[2] = {
    [0] = {
        .pFrame = sSerrisBlockOam_Crumbling1_Frame7,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};


const struct FrameData sSerrisBlockOam_Idle0[2] = {
    [0] = {
        .pFrame = sSerrisBlockOam_Idle0_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisBlockOam_Crumbling0[9] = {
    [0] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSerrisBlockOam_Falling0[2] = {
    [0] = {
        .pFrame = sSerrisBlockOam_Crumbling0_Frame7,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};


const u16 sSerrisSecondPhasePal[16 * 2] = INCBIN_U16("data/sprites/serris_phase_two.pal");
const u16 sSerrisThirdPhasePal[16 * 2] = INCBIN_U16("data/sprites/serris_phase_three.pal");

static const u8 sBlob_3787d0_3bdebc[] = INCBIN_U8("data/Blob_3787d0_3bdebc.bin");
