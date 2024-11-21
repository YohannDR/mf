#include "data/sprites/core_x.h"
#include "macros.h"

const s16 sCoreXIdleYSpeed[65] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 1, 1, 2,
    2, 1, 1, 1,
    0, 1, 0, 1,
    0, 1, 0, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, 0, -1, 0,
    -1, -1, -1, -2,
    -2, -1, -1, -1,
    0, -1, 0, -1,
    0, -1, 0, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sCoreXIdleXSpeed[81] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 1, 1, 1,
    1, 1, 2, 2,
    2, 2, 1, 1,
    1, 1, 1, 1,
    0, 1, 0, 1,
    0, 1, 0, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, 0, -1, 0,
    -1, -1, -1, -1,
    -1, -1, -2, -2,
    -2, -2, -1, -1,
    -1, -1, -1, -1,
    0, -1, 0, -1,
    0, -1, 0, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const u32 sMorphBallCoreXGfx[512 * 5] = INCBIN_U32("data/sprites/morph_ball_core_x.gfx");
const u16 sMorphBallCoreXPal[16 * 5] = INCBIN_U16("data/sprites/morph_ball_core_x.pal");

static const u16 sCoreXShellOam_White_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_9 | 0x28c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x290,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_9 | 0x30c,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x310
};

static const u16 sCoreXShellOam_Yellow_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_10 | 0x28c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_10 | 0x290,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_10 | 0x30c,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x310
};

static const u16 sCoreXShellOam_Red_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_11 | 0x28c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_11 | 0x290,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_11 | 0x30c,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_11 | 0x310
};

static const u16 sCoreXStaticOam_0_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1ff, OBJ_PALETTE_9 | 0x2d2,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x2b2,
    0x0, 0x1f0, OBJ_PALETTE_9 | 0x292
};

static const u16 sCoreXStaticOam_0_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ff, OBJ_PALETTE_9 | 0x2d3,
    0x6, 0x7, OBJ_PALETTE_9 | 0x2f4,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x293,
    0x8, 0x8, OBJ_PALETTE_9 | 0x295,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x8, OBJ_PALETTE_9 | 0x296
};

static const u16 sCoreXStaticOam_0_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    0x8, 0x5, OBJ_PALETTE_9 | 0x2f3,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x297,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_9 | 0x299
};

static const u16 sCoreXStaticOam_1_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1ff, OBJ_PALETTE_9 | 0x2d5,
    0xf1, 0x7, OBJ_PALETTE_9 | 0x2d6
};

static const u16 sCoreXStaticOam_1_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x0, OBJ_PALETTE_9 | 0x2b7
};

static const u16 sCoreXStaticOam_1_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    0xf9, 0x1ff, OBJ_PALETTE_9 | 0x2f6
};

static const u16 sCoreXStaticOam_2_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    0x8, 0x1f6, OBJ_PALETTE_9 | 0x2d7,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x2b2,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x8, OBJ_PALETTE_9 | 0x292
};

static const u16 sCoreXStaticOam_2_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    0x8, 0x1f8, OBJ_PALETTE_9 | 0x2f7,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x293,
    0x8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x295,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x296
};

static const u16 sCoreXStaticOam_2_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1fa, OBJ_PALETTE_9 | 0x2d8,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x297,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_9 | 0x299
};

static const u16 sCoreXAbilityOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x200
};

static const u16 sCoreXAbilityOam_Idle_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x204
};

static const u16 sCoreXAbilityOam_Idle_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x208
};

static const u16 sCoreXAbilityOam_Idle_Frame3[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x20c
};

static const u16 sCoreXAbilityOam_Idle_Frame4[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x210
};

static const u16 sCoreXAbilityOam_Idle_Frame5[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x214
};

static const u16 sCoreXAbilityOam_Idle_Frame6[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x218
};

static const u16 sCoreXAbilityOam_Idle_Frame7[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x21c
};

static const u16 sCoreXShellOam_Breaking_Frame1[OAM_DATA_SIZE(13)] = {
    13,
    0xec, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_11 | 0x2ad,
    OBJ_SHAPE_HORIZONTAL | 0xe4, 0x1ec, OBJ_PALETTE_11 | 0x28d,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1e4, OBJ_PALETTE_11 | 0x2ac,
    0xe7, 0x1, OBJ_PALETTE_11 | 0x28f,
    0xe7, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_11 | 0x290,
    0xf7, 0x11, OBJ_PALETTE_11 | 0x2d1,
    0x6, 0x1e5, OBJ_PALETTE_11 | 0x2ec,
    0xe, OBJ_SIZE_16x16 | 0x1e5, OBJ_PALETTE_11 | 0x30c,
    0x16, 0x1f5, OBJ_PALETTE_11 | 0x32e,
    0xa, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_11 | 0x30f,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x9, OBJ_PALETTE_11 | 0x2f0,
    0xa, 0x11, OBJ_PALETTE_11 | 0x311,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x312
};

static const u16 sCoreXShellOam_Breaking_Frame2[OAM_DATA_SIZE(10)] = {
    10,
    0xf7, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x312,
    0xf9, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_9 | 0x312,
    0xee, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_11 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1e3, OBJ_PALETTE_11 | 0x281,
    0x19, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_11 | 0x301,
    OBJ_SHAPE_VERTICAL | 0x11, 0x1e2, OBJ_PALETTE_11 | 0x2e0,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_11 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_X_FLIP | 0x6, OBJ_PALETTE_11 | 0x281,
    0x12, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_11 | 0x301,
    OBJ_SHAPE_VERTICAL | 0xa, OBJ_X_FLIP | 0x13, OBJ_PALETTE_11 | 0x2e0
};

static const u16 sCoreXShellOam_Breaking_Frame3[OAM_DATA_SIZE(14)] = {
    14,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x312,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x312,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x312,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x312,
    0xf4, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x312,
    0xfd, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_9 | 0x312,
    0xf0, OBJ_SIZE_16x16 | 0x1d9, OBJ_PALETTE_11 | 0x283,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1d9, OBJ_PALETTE_11 | 0x2c3,
    0x25, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_11 | 0x303,
    OBJ_SHAPE_VERTICAL | 0x22, 0x1ee, OBJ_PALETTE_11 | 0x305,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_11 | 0x283,
    OBJ_SHAPE_HORIZONTAL | 0xb, OBJ_X_FLIP | 0x9, OBJ_PALETTE_11 | 0x2c3,
    0x1c, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_11 | 0x303,
    OBJ_SHAPE_VERTICAL | 0x19, OBJ_X_FLIP | 0x4, OBJ_PALETTE_11 | 0x305
};

static const u16 sCoreXShellOam_Breaking_Frame4[OAM_DATA_SIZE(16)] = {
    16,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x312,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x312,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_9 | 0x312,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x312,
    0xed, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_9 | 0x312,
    0x9, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x312,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_9 | 0x312,
    0x9, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x312,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1d5, OBJ_PALETTE_11 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | 0x1da, OBJ_PALETTE_11 | 0x281,
    0x10, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_11 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_X_FLIP | OBJ_Y_FLIP | 0x7, OBJ_PALETTE_11 | 0x281,
    0x3a, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_11 | 0x301,
    OBJ_SHAPE_VERTICAL | 0x32, OBJ_X_FLIP | 0x1ea, OBJ_PALETTE_11 | 0x2e0,
    0x2c, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_11 | 0x301,
    OBJ_SHAPE_VERTICAL | 0x24, 0x6, OBJ_PALETTE_11 | 0x2e0
};

static const u16 sCoreXShellOam_Breaking_Frame5[OAM_DATA_SIZE(16)] = {
    16,
    0xef, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x312,
    0x1, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x312,
    0xf6, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x312,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x312,
    0xef, OBJ_X_FLIP | OBJ_Y_FLIP | 0x14, OBJ_PALETTE_9 | 0x332,
    0x19, 0x1e7, OBJ_PALETTE_9 | 0x333,
    0xef, OBJ_Y_FLIP | 0x1e4, OBJ_PALETTE_9 | 0x332,
    0x19, OBJ_X_FLIP | 0x11, OBJ_PALETTE_9 | 0x333,
    0x23, OBJ_SIZE_16x16 | 0x1d1, OBJ_PALETTE_11 | 0x303,
    OBJ_SHAPE_VERTICAL | 0x20, 0x1e1, OBJ_PALETTE_11 | 0x305,
    0x50, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1d9, OBJ_PALETTE_11 | 0x301,
    OBJ_SHAPE_VERTICAL | 0x48, OBJ_X_FLIP | 0x1e9, OBJ_PALETTE_11 | 0x2e0,
    0x2e, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_11 | 0x303,
    OBJ_SHAPE_VERTICAL | 0x2b, 0x12, OBJ_PALETTE_11 | 0x305,
    0x36, OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_11 | 0x301,
    OBJ_SHAPE_VERTICAL | 0x2e, 0x7, OBJ_PALETTE_11 | 0x2e0
};

static const u16 sCoreXShellOam_Breaking_Frame6[OAM_DATA_SIZE(9)] = {
    9,
    0x30, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_11 | 0x312,
    0x38, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_11 | 0x312,
    0x60, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_11 | 0x312,
    0x48, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_11 | 0x312,
    0xea, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x312,
    0x6, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x312,
    0xf6, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_9 | 0x312,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_9 | 0x312,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x332
};

static const u16 sCoreXShellOam_Breaking_Frame7[OAM_DATA_SIZE(8)] = {
    8,
    0x3e, OBJ_Y_FLIP | 0x1d8, OBJ_PALETTE_11 | 0x332,
    0x50, OBJ_X_FLIP | OBJ_Y_FLIP | 0x10, OBJ_PALETTE_11 | 0x332,
    0x78, 0x1d8, OBJ_PALETTE_11 | 0x332,
    0x68, OBJ_X_FLIP | 0x10, OBJ_PALETTE_11 | 0x332,
    0xf8, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x333,
    0xf0, 0x0, OBJ_PALETTE_9 | 0x333,
    0xc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x333,
    0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x333
};

static const u16 sCoreXStaticOam_0_Frame3[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x2ef
};

static const u16 sCoreXAbilityAuraOam_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29a
};

static const u16 sCoreXAbilityAuraOam_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29c
};

static const u16 sCoreXAbilityAuraOam_Frame8[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29e,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29e
};

static const u16 sCoreXAbilityAuraOam_Frame12[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2da,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2da,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2da,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2da
};

static const u16 sCoreXAbilityAuraOam_Frame16[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2dc,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2dc,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2dc,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2dc
};

static const u16 sCoreXAbilityAuraOam_Frame20[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2de,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2de,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2de,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2de
};

static const u16 sCoreXAbilityAuraOam_Frame24[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x314,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x314,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x314,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x314
};

static const u16 sCoreXAbilityAuraOam_Frame28[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x316,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x316,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x316,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x316
};

static const u16 sCoreXAbilityAuraOam_Frame32[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x318,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x318,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x318,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x318
};

static const u16 sCoreXAbilityAuraOam_Frame36[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x31a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x31a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x31a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x31a
};

static const u16 sCoreXAbilityOam_GettingAbsorbed_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x286
};

static const u16 sCoreXAbilityOam_GettingAbsorbed_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    0xee, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x286
};

const struct FrameData sCoreXAbilityOam_Idle[9] = {
    [0] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame7,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXAbilityOam_IdleFast[9] = {
    [0] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sCoreXAbilityOam_Idle_Frame7,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXAbilityOam_GettingAbsorbed[3] = {
    [0] = {
        .pFrame = sCoreXAbilityOam_GettingAbsorbed_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sCoreXAbilityOam_GettingAbsorbed_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXStaticOam_0[5] = {
    [0] = {
        .pFrame = sCoreXStaticOam_0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sCoreXStaticOam_0_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sCoreXStaticOam_0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 20
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXStaticOam_1[5] = {
    [0] = {
        .pFrame = sCoreXStaticOam_1_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sCoreXStaticOam_1_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sCoreXStaticOam_1_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 40
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXStaticOam_2[5] = {
    [0] = {
        .pFrame = sCoreXStaticOam_2_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sCoreXStaticOam_2_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sCoreXStaticOam_2_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 60
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXStaticOam_Unused[19] = {
    [0] = {
        .pFrame = sCoreXStaticOam_0_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sCoreXStaticOam_0_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sCoreXStaticOam_0_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sCoreXStaticOam_2_Frame0,
        .timer = 1
    },
    [4] = {
        .pFrame = sCoreXStaticOam_2_Frame1,
        .timer = 1
    },
    [5] = {
        .pFrame = sCoreXStaticOam_2_Frame2,
        .timer = 1
    },
    [6] = {
        .pFrame = sCoreXStaticOam_1_Frame0,
        .timer = 1
    },
    [7] = {
        .pFrame = sCoreXStaticOam_1_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sCoreXStaticOam_1_Frame2,
        .timer = 1
    },
    [9] = {
        .pFrame = sCoreXStaticOam_0_Frame0,
        .timer = 1
    },
    [10] = {
        .pFrame = sCoreXStaticOam_0_Frame1,
        .timer = 1
    },
    [11] = {
        .pFrame = sCoreXStaticOam_0_Frame2,
        .timer = 1
    },
    [12] = {
        .pFrame = sCoreXStaticOam_1_Frame0,
        .timer = 1
    },
    [13] = {
        .pFrame = sCoreXStaticOam_1_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sCoreXStaticOam_1_Frame2,
        .timer = 1
    },
    [15] = {
        .pFrame = sCoreXStaticOam_2_Frame0,
        .timer = 1
    },
    [16] = {
        .pFrame = sCoreXStaticOam_2_Frame1,
        .timer = 1
    },
    [17] = {
        .pFrame = sCoreXStaticOam_2_Frame2,
        .timer = 1
    },
    [18] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXShellOam_Breaking[9] = {
    [0] = {
        .pFrame = sCoreXShellOam_Red_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sCoreXShellOam_Breaking_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sCoreXShellOam_Breaking_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sCoreXShellOam_Breaking_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sCoreXShellOam_Breaking_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sCoreXShellOam_Breaking_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sCoreXShellOam_Breaking_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sCoreXShellOam_Breaking_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXAbilityAuraOam_Slow[41] = {
    [0] = {
        .pFrame = sCoreXAbilityAuraOam_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [2] = {
        .pFrame = sCoreXAbilityAuraOam_Frame0,
        .timer = 2
    },
    [3] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sCoreXAbilityAuraOam_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [6] = {
        .pFrame = sCoreXAbilityAuraOam_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [8] = {
        .pFrame = sCoreXAbilityAuraOam_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [10] = {
        .pFrame = sCoreXAbilityAuraOam_Frame8,
        .timer = 2
    },
    [11] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [12] = {
        .pFrame = sCoreXAbilityAuraOam_Frame12,
        .timer = 2
    },
    [13] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [14] = {
        .pFrame = sCoreXAbilityAuraOam_Frame12,
        .timer = 2
    },
    [15] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [16] = {
        .pFrame = sCoreXAbilityAuraOam_Frame16,
        .timer = 2
    },
    [17] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [18] = {
        .pFrame = sCoreXAbilityAuraOam_Frame16,
        .timer = 2
    },
    [19] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [20] = {
        .pFrame = sCoreXAbilityAuraOam_Frame20,
        .timer = 2
    },
    [21] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [22] = {
        .pFrame = sCoreXAbilityAuraOam_Frame20,
        .timer = 2
    },
    [23] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [24] = {
        .pFrame = sCoreXAbilityAuraOam_Frame24,
        .timer = 2
    },
    [25] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [26] = {
        .pFrame = sCoreXAbilityAuraOam_Frame24,
        .timer = 2
    },
    [27] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [28] = {
        .pFrame = sCoreXAbilityAuraOam_Frame28,
        .timer = 2
    },
    [29] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [30] = {
        .pFrame = sCoreXAbilityAuraOam_Frame28,
        .timer = 2
    },
    [31] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [32] = {
        .pFrame = sCoreXAbilityAuraOam_Frame32,
        .timer = 2
    },
    [33] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [34] = {
        .pFrame = sCoreXAbilityAuraOam_Frame32,
        .timer = 2
    },
    [35] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [36] = {
        .pFrame = sCoreXAbilityAuraOam_Frame36,
        .timer = 2
    },
    [37] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [38] = {
        .pFrame = sCoreXAbilityAuraOam_Frame36,
        .timer = 2
    },
    [39] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 2
    },
    [40] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXAbilityAuraOam_Fast[41] = {
    [0] = {
        .pFrame = sCoreXAbilityAuraOam_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [2] = {
        .pFrame = sCoreXAbilityAuraOam_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sCoreXAbilityAuraOam_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [6] = {
        .pFrame = sCoreXAbilityAuraOam_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [8] = {
        .pFrame = sCoreXAbilityAuraOam_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [10] = {
        .pFrame = sCoreXAbilityAuraOam_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [12] = {
        .pFrame = sCoreXAbilityAuraOam_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [14] = {
        .pFrame = sCoreXAbilityAuraOam_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [16] = {
        .pFrame = sCoreXAbilityAuraOam_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [18] = {
        .pFrame = sCoreXAbilityAuraOam_Frame16,
        .timer = 1
    },
    [19] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [20] = {
        .pFrame = sCoreXAbilityAuraOam_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [22] = {
        .pFrame = sCoreXAbilityAuraOam_Frame20,
        .timer = 1
    },
    [23] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [24] = {
        .pFrame = sCoreXAbilityAuraOam_Frame24,
        .timer = 1
    },
    [25] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [26] = {
        .pFrame = sCoreXAbilityAuraOam_Frame24,
        .timer = 1
    },
    [27] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [28] = {
        .pFrame = sCoreXAbilityAuraOam_Frame28,
        .timer = 1
    },
    [29] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [30] = {
        .pFrame = sCoreXAbilityAuraOam_Frame28,
        .timer = 1
    },
    [31] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [32] = {
        .pFrame = sCoreXAbilityAuraOam_Frame32,
        .timer = 1
    },
    [33] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [34] = {
        .pFrame = sCoreXAbilityAuraOam_Frame32,
        .timer = 1
    },
    [35] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [36] = {
        .pFrame = sCoreXAbilityAuraOam_Frame36,
        .timer = 1
    },
    [37] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [38] = {
        .pFrame = sCoreXAbilityAuraOam_Frame36,
        .timer = 1
    },
    [39] = {
        .pFrame = sCoreXStaticOam_0_Frame3,
        .timer = 1
    },
    [40] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXShellOam_White[2] = {
    [0] = {
        .pFrame = sCoreXShellOam_White_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXShellOam_Yellow[2] = {
    [0] = {
        .pFrame = sCoreXShellOam_Yellow_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sCoreXShellOam_Red[2] = {
    [0] = {
        .pFrame = sCoreXShellOam_Red_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const u32 sHiJumpCoreXGfx[512 * 5] = INCBIN_U32("data/sprites/hi_jump_core_x.gfx");
const u16 sHiJumpCoreXPal[16 * 5] = INCBIN_U16("data/sprites/hi_jump_core_x.pal");
const u32 sSpeedBoosterCoreXGfx[512 * 5] = INCBIN_U32("data/sprites/speed_booster_core_x.gfx");
const u16 sSpeedBoosterCoreXPal[16 * 5] = INCBIN_U16("data/sprites/speed_booster_core_x.pal");
const u32 sSpaceJumpCoreXGfx[512 * 5] = INCBIN_U32("data/sprites/space_jump_core_x.gfx");
const u16 sSpaceJumpCoreXPal[16 * 5] = INCBIN_U16("data/sprites/space_jump_core_x.pal");
const u32 sGravityCoreXGfx[512 * 5] = INCBIN_U32("data/sprites/gravity_core_x.gfx");
const u16 sGravityCoreXPal[16 * 5] = INCBIN_U16("data/sprites/gravity_core_x.pal");
const u32 sScrewAttackCoreXGfx[512 * 5] = INCBIN_U32("data/sprites/screw_attack_core_x.gfx");
const u16 sScrewAttackCoreXPal[16 * 5] = INCBIN_U16("data/sprites/screw_attack_core_x.pal");
