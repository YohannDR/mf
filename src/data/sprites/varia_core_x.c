#include "data/sprites/varia_core_x.h"

const s16 sVariaSuitAbilitySpawningYMovement[65] = {
    0, 0, 0, 0,
    1, 1, 1, 1,
    2, 2, 2, 2,
    3, 3, 3, 3,
    4, 4, 4, 4,
    4, 3, 2, 1,
    0, 0, 0, 0,
    -1, -2, -3, -4,
    -6, -8, -10, -12,
    -14, -16, -18, -20,
    -24, -28, -32, -32,
    -32, -32, -28, -24,
    -20, -18, -16, -14,
    -12, -10, -8, -7,
    -6, -5, -4, -3,
    -2, -1, -1, 0,
    SHORT_MAX
};

const s16 sVariaSuitAbilitySpawningXMovement[57] = {
    0, -1, -2, -3,
    -4, -5, -6, -7,
    -8, -9, -10, -11,
    -12, -14, -16, -18,
    -20, -24, -28, -32,
    -32, -32, -32, -32,
    -32, -32, -32, -32,
    -32, -32, -32, -32,
    -32, -32, -32, -32,
    -32, -32, -32, -32,
    -32, -28, -24, -20,
    -18, -16, -14, -12,
    -10, -8, -6, -4,
    -2, -1, -1, 0,
    SHORT_MAX
};

const u32 sVariaCoreXGfx[8 * 512] = INCBIN_U32("data/sprites/varia_core_x.gfx");
const u16 sVariaCoreXPal[8 * 16] = INCBIN_U16("data/sprites/varia_core_x.pal");

static const u16 sVariaCoreXOam_3a5e40_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_9 | 0x28c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x290,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_9 | 0x30c,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x310
};

static const u16 sVariaCoreXOam_3a5e50_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_10 | 0x28c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_10 | 0x290,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_10 | 0x30c,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x310
};

static const u16 sVariaCoreXOam_3a5b68_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_11 | 0x28c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_11 | 0x290,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_11 | 0x30c,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_11 | 0x310
};

static const u16 sVariaCoreXOam_3a5a58_Frame0[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1ff, OBJ_PALETTE_9 | 0x2d2,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x2b2,
    0x0, 0x1f0, OBJ_PALETTE_9 | 0x292
};

static const u16 sVariaCoreXOam_3a5a58_Frame1[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ff, OBJ_PALETTE_9 | 0x2d3,
    0x6, 0x7, OBJ_PALETTE_9 | 0x2f4,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x293,
    0x8, 0x8, OBJ_PALETTE_9 | 0x295,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x8, OBJ_PALETTE_9 | 0x296
};

static const u16 sVariaCoreXOam_3a5a58_Frame2[] = {
    3,
    0x8, 0x5, OBJ_PALETTE_9 | 0x2f3,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x297,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_9 | 0x299
};

static const u16 sVariaCoreXOam_3a5a80_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1ff, OBJ_PALETTE_9 | 0x2d5,
    0xf1, 0x7, OBJ_PALETTE_9 | 0x2d6
};

static const u16 sVariaCoreXOam_3a5a80_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x0, OBJ_PALETTE_9 | 0x2b7
};

static const u16 sVariaCoreXOam_3a5a80_Frame2[] = {
    1,
    0xf9, 0x1ff, OBJ_PALETTE_9 | 0x2f6
};

static const u16 sVariaCoreXOam_3a5aa8_Frame0[] = {
    3,
    0x8, 0x1f6, OBJ_PALETTE_9 | 0x2d7,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x2b2,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x8, OBJ_PALETTE_9 | 0x292
};

static const u16 sVariaCoreXOam_3a5aa8_Frame1[] = {
    4,
    0x8, 0x1f8, OBJ_PALETTE_9 | 0x2f7,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x293,
    0x8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x295,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x296
};

static const u16 sVariaCoreXOam_3a5aa8_Frame2[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1fa, OBJ_PALETTE_9 | 0x2d8,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x297,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_9 | 0x299
};

static const u16 sVariaCoreXOam_3a59b0_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x200
};

static const u16 sVariaCoreXOam_3a59b0_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x204
};

static const u16 sVariaCoreXOam_3a59b0_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x208
};

static const u16 sVariaCoreXOam_3a59b0_Frame3[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x20c
};

static const u16 sVariaCoreXOam_3a59b0_Frame4[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x210
};

static const u16 sVariaCoreXOam_3a59b0_Frame5[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x214
};

static const u16 sVariaCoreXOam_3a59b0_Frame6[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x218
};

static const u16 sVariaCoreXOam_3a59b0_Frame7[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x21c
};

static const u16 sVariaCoreXOam_3a5b68_Frame1[] = {
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

static const u16 sVariaCoreXOam_3a5b68_Frame2[] = {
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

static const u16 sVariaCoreXOam_3a5b68_Frame3[] = {
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

static const u16 sVariaCoreXOam_3a5b68_Frame4[] = {
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

static const u16 sVariaCoreXOam_3a5b68_Frame5[] = {
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

static const u16 sVariaCoreXOam_3a5b68_Frame6[] = {
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

static const u16 sVariaCoreXOam_3a5b68_Frame7[] = {
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

static const u16 sVariaCoreXOam_3a5a58_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x2ef
};

static const u16 sVariaCoreXOam_3a5bb0_Frame0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29a
};

static const u16 sVariaCoreXOam_3a5bb0_Frame4[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29c
};

static const u16 sVariaCoreXOam_3a5bb0_Frame8[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x29e,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x29e
};

static const u16 sVariaCoreXOam_3a5bb0_Frame12[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2da,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2da,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2da,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2da
};

static const u16 sVariaCoreXOam_3a5bb0_Frame16[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2dc,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2dc,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2dc,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2dc
};

static const u16 sVariaCoreXOam_3a5bb0_Frame20[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2de,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2de,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2de,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2de
};

static const u16 sVariaCoreXOam_3a5bb0_Frame24[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x314,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x314,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x314,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x314
};

static const u16 sVariaCoreXOam_3a5bb0_Frame28[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x316,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x316,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x316,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x316
};

static const u16 sVariaCoreXOam_3a5bb0_Frame32[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x318,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x318,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x318,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x318
};

static const u16 sVariaCoreXOam_3a5bb0_Frame36[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x31a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x31a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x31a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x31a
};

static const u16 sVariaCoreXOam_3a5a40_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x286
};

static const u16 sVariaCoreXOam_3a5a40_Frame1[] = {
    1,
    0xee, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x286
};

static const u16 sVariaCoreXOam_3a5e70_Frame0[] = {
    3,
    0xec, OBJ_SIZE_32x32 | 0x1ec, OBJ_PALETTE_12 | 0x340,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_SIZE_8x32 | 0xc, OBJ_PALETTE_12 | 0x344,
    OBJ_SHAPE_HORIZONTAL | 0xc, OBJ_SIZE_32x8 | 0x1ec, OBJ_PALETTE_12 | 0x3c0
};

static const u16 sVariaCoreXOam_3a5e70_Frame1[] = {
    3,
    0xec, OBJ_SIZE_32x32 | 0x1ec, OBJ_PALETTE_12 | 0x345,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_SIZE_8x32 | 0xc, OBJ_PALETTE_12 | 0x349,
    OBJ_SHAPE_HORIZONTAL | 0xc, OBJ_SIZE_32x8 | 0x1ec, OBJ_PALETTE_12 | 0x3c5
};

static const u16 sVariaCoreXOam_3a5e70_Frame2[] = {
    3,
    0xec, OBJ_SIZE_32x32 | 0x1ec, OBJ_PALETTE_12 | 0x34a,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_SIZE_8x32 | 0xc, OBJ_PALETTE_12 | 0x34e,
    OBJ_SHAPE_HORIZONTAL | 0xc, OBJ_SIZE_32x8 | 0x1ec, OBJ_PALETTE_12 | 0x3ca
};

static const u16 sVariaCoreXOam_3a5ef8_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_12 | 0x34f
};

static const u16 sVariaCoreXOam_3a5ef8_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_12 | 0x353
};

static const u16 sVariaCoreXOam_3a5ef8_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_12 | 0x357
};

const struct FrameData sVariaCoreXOam_3a59b0[9] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame7,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a59f8[9] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sVariaCoreXOam_3a59b0_Frame7,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5a40[3] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5a40_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5a40_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5a58[5] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 20
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5a80[5] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 40
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5aa8[5] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 60
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5ad0[19] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame0,
        .timer = 1
    },
    [4] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame1,
        .timer = 1
    },
    [5] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame2,
        .timer = 1
    },
    [6] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame0,
        .timer = 1
    },
    [7] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame2,
        .timer = 1
    },
    [9] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame0,
        .timer = 1
    },
    [10] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame1,
        .timer = 1
    },
    [11] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame2,
        .timer = 1
    },
    [12] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame0,
        .timer = 1
    },
    [13] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sVariaCoreXOam_3a5a80_Frame2,
        .timer = 1
    },
    [15] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame0,
        .timer = 1
    },
    [16] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame1,
        .timer = 1
    },
    [17] = {
        .pFrame = sVariaCoreXOam_3a5aa8_Frame2,
        .timer = 1
    },
    [18] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5b68[9] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame7,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5bb0[41] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame0,
        .timer = 2
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [6] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [8] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [10] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame8,
        .timer = 2
    },
    [11] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [12] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame12,
        .timer = 2
    },
    [13] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [14] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame12,
        .timer = 2
    },
    [15] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [16] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame16,
        .timer = 2
    },
    [17] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [18] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame16,
        .timer = 2
    },
    [19] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [20] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame20,
        .timer = 2
    },
    [21] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [22] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame20,
        .timer = 2
    },
    [23] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [24] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame24,
        .timer = 2
    },
    [25] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [26] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame24,
        .timer = 2
    },
    [27] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [28] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame28,
        .timer = 2
    },
    [29] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [30] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame28,
        .timer = 2
    },
    [31] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [32] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame32,
        .timer = 2
    },
    [33] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [34] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame32,
        .timer = 2
    },
    [35] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [36] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame36,
        .timer = 2
    },
    [37] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [38] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame36,
        .timer = 2
    },
    [39] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 2
    },
    [40] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5cf8[41] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [6] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [8] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [10] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [12] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [14] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [16] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [18] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame16,
        .timer = 1
    },
    [19] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [20] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [22] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame20,
        .timer = 1
    },
    [23] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [24] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame24,
        .timer = 1
    },
    [25] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [26] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame24,
        .timer = 1
    },
    [27] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [28] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame28,
        .timer = 1
    },
    [29] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [30] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame28,
        .timer = 1
    },
    [31] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [32] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame32,
        .timer = 1
    },
    [33] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [34] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame32,
        .timer = 1
    },
    [35] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [36] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame36,
        .timer = 1
    },
    [37] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [38] = {
        .pFrame = sVariaCoreXOam_3a5bb0_Frame36,
        .timer = 1
    },
    [39] = {
        .pFrame = sVariaCoreXOam_3a5a58_Frame3,
        .timer = 1
    },
    [40] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5e40[2] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5e40_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5e50[2] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5e50_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5e60[2] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5b68_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5e70[12] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame0,
        .timer = 50
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame1,
        .timer = 3
    },
    [4] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame0,
        .timer = 3
    },
    [5] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame2,
        .timer = 5
    },
    [6] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame1,
        .timer = 3
    },
    [7] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame0,
        .timer = 30
    },
    [8] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame1,
        .timer = 2
    },
    [9] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame2,
        .timer = 4
    },
    [10] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame1,
        .timer = 2
    },
    [11] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5ed0[5] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5e70_Frame1,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sVariaCoreXOam_3a5ef8[12] = {
    [0] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame0,
        .timer = 50
    },
    [1] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame1,
        .timer = 3
    },
    [4] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame0,
        .timer = 3
    },
    [5] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame2,
        .timer = 5
    },
    [6] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame1,
        .timer = 3
    },
    [7] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame0,
        .timer = 30
    },
    [8] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame1,
        .timer = 2
    },
    [9] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame2,
        .timer = 4
    },
    [10] = {
        .pFrame = sVariaCoreXOam_3a5ef8_Frame1,
        .timer = 2
    },
    [11] = FRAME_DATA_TERMINATOR
};
