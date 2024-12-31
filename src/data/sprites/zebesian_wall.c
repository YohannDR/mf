#include "data/sprites/zebesian_wall.h"

const s16 sZebesianWallJumpYVelocity[34] = {
    -16, -15, -14, -13,
    -12, -11, -10, -9,
    -8, -7, -6, -5,
    -4, -3, -2, -1,
    0, 1, 2, 3,
    4, 5, 6, 7,
    8, 9, 10, 11,
    12, 13, 14, 15,
    16, SHORT_MAX
};

const s16 sZebesianWallJumpXVelocity[34] = {
    24, 20, 20, 20,
    20, 19, 19, 19,
    19, 18, 18, 18,
    18, 17, 17, 17,
    17, 16, 16, 16,
    16, 16, 16, 16,
    16, 16, 16, 16,
    16, 16, 16, 16,
    16, SHORT_MAX
};

const u32 sZebesianWallGfx[2 * 512] = INCBIN_U32("data/sprites/zebesian_wall.gfx");
const u16 sZebesianWallPal[2 * 16] = INCBIN_U16("data/sprites/zebesian_wall.pal");

static const u16 sZebesianWallOam_Crawling_Frame0[] = {
    13,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xf2, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x9, OBJ_PALETTE_8 | 0x215,
    0xef, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_VERTICAL | 0xef, 0x16, OBJ_PALETTE_8 | 0x247,
    0xea, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xd4, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b
};

static const u16 sZebesianWallOam_Crawling_Frame1[] = {
    13,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0xb, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x18, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x242,
    0xea, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x8, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_VERTICAL | 0x5, 0x5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x14, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    0x9, 0x1fe, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x4, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xd9, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f
};

static const u16 sZebesianWallOam_Crawling_Frame2[] = {
    14,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x3, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x8, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_VERTICAL | 0x1, 0x5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x10, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0xa, OBJ_PALETTE_8 | 0x235,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x18, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x242,
    0xe9, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xd, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    0xfe, 0x4, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x231
};

static const u16 sZebesianWallOam_Crawling_Frame3[] = {
    13,
    OBJ_SHAPE_VERTICAL | 0xd3, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x3, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xa, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x5, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x18, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x242,
    0xea, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xdd, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xf6, 0x4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x8, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_VERTICAL | 0x4, 0x4, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x12, 0x1fc, OBJ_PALETTE_8 | 0x24a
};

static const u16 sZebesianWallOam_Crawling_Frame4[] = {
    12,
    OBJ_SHAPE_VERTICAL | 0xd2, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xeb, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf6, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x209,
    0xed, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x242,
    0xea, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0x16, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0x8, 0x6, OBJ_PALETTE_8 | 0x207,
    0xfd, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x21f
};

static const u16 sZebesianWallOam_Idle_Frame0[] = {
    11,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xf3, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x242,
    0xeb, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xd4, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f
};

static const u16 sZebesianWallOam_Idle_Frame1[] = {
    13,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xf3, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0xa, OBJ_PALETTE_8 | 0x235,
    OBJ_SHAPE_VERTICAL | 0xef, 0x19, OBJ_PALETTE_8 | 0x246,
    0xef, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x242,
    0xea, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xd4, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f
};

static const u16 sZebesianWallOam_Idle_Frame2[] = {
    16,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, OBJ_PALETTE_8 | 0x21d,
    0xf2, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0xa, OBJ_PALETTE_8 | 0x235,
    0xef, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_VERTICAL | 0xef, 0x18, OBJ_PALETTE_8 | 0x247,
    0xea, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0xd, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xd4, OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1fb, OBJ_PALETTE_8 | 0x21d
};

static const u16 sZebesianWallOam_Idle_Frame8[] = {
    16,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fa, OBJ_PALETTE_8 | 0x21d,
    0xf2, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x213,
    0xee, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_VERTICAL | 0xee, 0x18, OBJ_PALETTE_8 | 0x248,
    0xe9, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x240,
    0xea, OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfd, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xd4, OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1fb, OBJ_PALETTE_8 | 0x21d
};

static const u16 sZebesianWallOam_Idle_Frame9[] = {
    16,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, OBJ_PALETTE_8 | 0x21d,
    0xf2, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x200,
    0xe9, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x213,
    0xee, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_VERTICAL | 0xee, 0x18, OBJ_PALETTE_8 | 0x247,
    0xe9, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x240,
    0xeb, OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xa, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfd, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x5, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xd4, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1fa, OBJ_PALETTE_8 | 0x21d
};

static const u16 sZebesianWallOam_TurningAround_Frame13[] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_SIZE_32x16 | 0x8, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x15, OBJ_PALETTE_8 | 0x202,
    0xea, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xb, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209
};

static const u16 sZebesianWallOam_TurningAround_Frame14[] = {
    13,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x2, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xe, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x8, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x6, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x18, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianWallOam_Jumping_Frame0[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xd6, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0xb, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xed, 0x18, OBJ_PALETTE_8 | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    0xe6, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x240,
    0xfe, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x18, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_VERTICAL | 0xdf, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | OBJ_Y_FLIP | 0xc, OBJ_PALETTE_8 | 0x231,
    0xfe, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x8, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_VERTICAL | 0xb, 0x11, OBJ_PALETTE_8 | 0x249,
    0xf2, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x200
};

static const u16 sZebesianWallOam_Jumping_Frame1[] = {
    16,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0x1b, OBJ_PALETTE_8 | 0x25a,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x25a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0xb, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xed, 0x18, OBJ_PALETTE_8 | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    0xe6, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x8, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_VERTICAL | 0xa, 0x10, OBJ_PALETTE_8 | 0x249,
    0x1, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0x7, 0x15, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_X_FLIP | OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x231,
    0xfc, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xf4, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x200
};

static const u16 sZebesianWallOam_Jumping_Frame2[] = {
    17,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xeb, OBJ_X_FLIP | 0x1b, OBJ_PALETTE_8 | 0x25a,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1f, OBJ_PALETTE_8 | 0x25a,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_VERTICAL | 0xd9, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0xb, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xed, 0x18, OBJ_PALETTE_8 | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    0xe6, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x8, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_VERTICAL | 0xa, 0x10, OBJ_PALETTE_8 | 0x249,
    0x1, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0x7, 0x15, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_X_FLIP | OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x231,
    0xfc, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe2, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xf4, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x200
};

static const u16 sZebesianWallOam_Jumping_Frame3[] = {
    17,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x25a,
    0xf6, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xdf, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21f,
    0xef, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0xb, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xed, 0x18, OBJ_PALETTE_8 | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x244,
    0xe6, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x8, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_VERTICAL | 0x7, 0xe, OBJ_PALETTE_8 | 0x249,
    0xff, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0x5, 0x13, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_HORIZONTAL | 0x6, OBJ_X_FLIP | OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x231,
    0xfc, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x1ff, OBJ_PALETTE_8 | 0x21f,
    0xf5, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x200
};

static const u16 sZebesianWallOam_Jumping_Frame4[] = {
    15,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x25a,
    OBJ_SHAPE_VERTICAL | 0xe2, OBJ_SIZE_8x32 | 0x4, OBJ_PALETTE_8 | 0x21f,
    0xf2, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x7, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x22f,
    0xfe, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x20c,
    0xed, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x213,
    0xe8, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x19, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xef, OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0x2, 0x11, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x25a,
    0xf7, OBJ_X_FLIP | 0x27, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianWallOam_Jumping_Frame5[] = {
    14,
    0xec, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x25a,
    OBJ_SHAPE_VERTICAL | 0xe2, OBJ_SIZE_8x32 | 0x4, OBJ_PALETTE_8 | 0x21f,
    0xf2, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x7, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x22f,
    0xfe, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x20c,
    0xed, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x213,
    0xe8, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x19, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xef, OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0x2, 0x11, OBJ_PALETTE_8 | 0x249,
    0xfa, OBJ_X_FLIP | 0x2c, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianWallOam_Jumping_Frame6[] = {
    12,
    OBJ_SHAPE_VERTICAL | 0xe2, OBJ_SIZE_8x32 | 0x4, OBJ_PALETTE_8 | 0x21f,
    0xf2, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x7, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x22f,
    0xfe, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x20c,
    0xed, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x213,
    0xe8, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x19, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xef, OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0x2, 0x11, OBJ_PALETTE_8 | 0x249
};

static const u16 sZebesianWallOam_Shooting_Frame3[] = {
    13,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xfd, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x10, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xf, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x8, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x6, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x205
};

static const u16 sZebesianWallOam_Shooting_Frame4[] = {
    13,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x12, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xf, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x8, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x6, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x205
};

static const u16 sZebesianWallOam_Shooting_Frame5[] = {
    15,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x240,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x21b,
    0xf4, OBJ_X_FLIP | 0x29, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x1c, OBJ_PALETTE_8 | 0x239,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xe, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x8, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianWallOam_Shooting_Frame6[] = {
    15,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xd, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    0xf4, OBJ_X_FLIP | 0x27, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x239,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | 0x14, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianWallOam_Shooting_Frame7[] = {
    15,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xd, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    0xf4, OBJ_X_FLIP | 0x27, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x239,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | 0x14, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianWallOam_Shooting_Frame8[] = {
    16,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xd, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    0xf4, OBJ_X_FLIP | 0x27, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x239,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | 0x14, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x21, OBJ_PALETTE_8 | 0x257
};

static const u16 sZebesianWallOam_Shooting_Frame13[] = {
    16,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xd, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    0xf4, OBJ_X_FLIP | 0x27, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x239,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | 0x14, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x24, OBJ_PALETTE_8 | 0x258
};

static const u16 sZebesianWallOam_Shooting_Frame20[] = {
    17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_Y_FLIP | 0x24, OBJ_PALETTE_8 | 0x259,
    OBJ_SHAPE_VERTICAL | 0xff, 0x24, OBJ_PALETTE_8 | 0x259,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xd, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    0xf4, OBJ_X_FLIP | 0x27, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x239,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | 0x14, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianWallOam_Shooting_Frame21[] = {
    15,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_8x32 | 0x1, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0xd, OBJ_PALETTE_8 | 0x26a,
    0xee, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x19, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xb, 0x7, OBJ_PALETTE_8 | 0x207,
    0xfe, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21d,
    0xf4, OBJ_X_FLIP | 0x26, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x239,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x16, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianWallBeamOam_Extended_Frame3[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x18, OBJ_PALETTE_8 | 0x255,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x8, OBJ_PALETTE_8 | 0x255,
    0xfc, 0x0, OBJ_PALETTE_8 | 0x273,
    0xfc, OBJ_X_FLIP | 0x28, OBJ_PALETTE_8 | 0x273
};

static const u16 sZebesianWallBeamOam_Extended_Frame0[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x18, OBJ_PALETTE_8 | 0x275,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x8, OBJ_PALETTE_8 | 0x275,
    0xfc, 0x0, OBJ_PALETTE_8 | 0x274,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x28, OBJ_PALETTE_8 | 0x274
};

static const u16 sZebesianWallBeamOam_Extended_Frame4[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_Y_FLIP | 0x18, OBJ_PALETTE_8 | 0x275,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_8 | 0x275,
    0xfc, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x274,
    0xfc, OBJ_X_FLIP | 0x28, OBJ_PALETTE_8 | 0x274
};

static const u16 sZebesianWallBeamOam_Extended_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_Y_FLIP | 0x18, OBJ_PALETTE_8 | 0x255,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_8 | 0x255,
    0xfc, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x273,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x28, OBJ_PALETTE_8 | 0x273
};

static const u16 sZebesianWallBeamOam_Extended_Frame2[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x8, OBJ_PALETTE_8 | 0x253,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x18, OBJ_PALETTE_8 | 0x253,
    0xfc, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x273,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x28, OBJ_PALETTE_8 | 0x273
};

static const u16 sZebesianWallBeamOam_Spawning_Frame0[] = {
    2,
    0xfc, 0x0, OBJ_PALETTE_8 | 0x273,
    0xfc, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x273
};

static const u16 sZebesianWallBeamOam_Spawning_Frame1[] = {
    2,
    0xfc, 0x0, OBJ_PALETTE_8 | 0x274,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x8, OBJ_PALETTE_8 | 0x274
};

static const u16 sZebesianWallBeamOam_Spawning_Frame3[] = {
    2,
    0xfc, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x274,
    0xfc, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x274
};

static const u16 sZebesianWallBeamOam_Extending_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x8, OBJ_PALETTE_8 | 0x255,
    0xfc, 0x0, OBJ_PALETTE_8 | 0x273,
    0xfc, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x273
};

static const u16 sZebesianWallBeamOam_Extending_Frame3[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x8, OBJ_PALETTE_8 | 0x275,
    0xfc, 0x0, OBJ_PALETTE_8 | 0x274,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x18, OBJ_PALETTE_8 | 0x274
};

static const u16 sZebesianWallBeamOam_Extending_Frame4[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_8 | 0x275,
    0xfc, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x274,
    0xfc, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x274
};

static const u16 sZebesianWallBeamOam_Extending_Frame1[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_8 | 0x255,
    0xfc, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x273,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x18, OBJ_PALETTE_8 | 0x273
};

static const u16 sZebesianWallBeamOam_Extending_Frame2[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x8, OBJ_PALETTE_8 | 0x253,
    0xfc, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x273,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x18, OBJ_PALETTE_8 | 0x273
};

const struct FrameData sZebesianWallOam_Crawling[9] = {
    [0] = {
        .pFrame = sZebesianWallOam_Crawling_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sZebesianWallOam_Crawling_Frame1,
        .timer = 9
    },
    [2] = {
        .pFrame = sZebesianWallOam_Crawling_Frame2,
        .timer = 9
    },
    [3] = {
        .pFrame = sZebesianWallOam_Crawling_Frame3,
        .timer = 9
    },
    [4] = {
        .pFrame = sZebesianWallOam_Crawling_Frame4,
        .timer = 9
    },
    [5] = {
        .pFrame = sZebesianWallOam_Crawling_Frame3,
        .timer = 9
    },
    [6] = {
        .pFrame = sZebesianWallOam_Crawling_Frame2,
        .timer = 9
    },
    [7] = {
        .pFrame = sZebesianWallOam_Crawling_Frame1,
        .timer = 9
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianWallOam_Idle[13] = {
    [0] = {
        .pFrame = sZebesianWallOam_Idle_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sZebesianWallOam_Idle_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZebesianWallOam_Idle_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sZebesianWallOam_Idle_Frame2,
        .timer = 6
    },
    [4] = {
        .pFrame = sZebesianWallOam_Idle_Frame1,
        .timer = 8
    },
    [5] = {
        .pFrame = sZebesianWallOam_Idle_Frame0,
        .timer = 15
    },
    [6] = {
        .pFrame = sZebesianWallOam_Idle_Frame1,
        .timer = 12
    },
    [7] = {
        .pFrame = sZebesianWallOam_Idle_Frame2,
        .timer = 10
    },
    [8] = {
        .pFrame = sZebesianWallOam_Idle_Frame8,
        .timer = 9
    },
    [9] = {
        .pFrame = sZebesianWallOam_Idle_Frame9,
        .timer = 9
    },
    [10] = {
        .pFrame = sZebesianWallOam_Idle_Frame2,
        .timer = 8
    },
    [11] = {
        .pFrame = sZebesianWallOam_Idle_Frame1,
        .timer = 12
    },
    [12] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianWallOam_323790[8] = {
    [0] = {
        .pFrame = sZebesianWallOam_Idle_Frame1,
        .timer = 12
    },
    [1] = {
        .pFrame = sZebesianWallOam_Idle_Frame8,
        .timer = 5
    },
    [2] = {
        .pFrame = sZebesianWallOam_Idle_Frame9,
        .timer = 2
    },
    [3] = {
        .pFrame = sZebesianWallOam_Idle_Frame8,
        .timer = 5
    },
    [4] = {
        .pFrame = sZebesianWallOam_Idle_Frame9,
        .timer = 2
    },
    [5] = {
        .pFrame = sZebesianWallOam_Idle_Frame8,
        .timer = 5
    },
    [6] = {
        .pFrame = sZebesianWallOam_Idle_Frame1,
        .timer = 2
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianWallOam_TurningAround[16] = {
    [0] = {
        .pFrame = sZebesianWallOam_Idle_Frame2,
        .timer = 2
    },
    [1] = {
        .pFrame = sZebesianWallOam_Idle_Frame8,
        .timer = 4
    },
    [2] = {
        .pFrame = sZebesianWallOam_Idle_Frame9,
        .timer = 1
    },
    [3] = {
        .pFrame = sZebesianWallOam_Idle_Frame2,
        .timer = 2
    },
    [4] = {
        .pFrame = sZebesianWallOam_Idle_Frame8,
        .timer = 4
    },
    [5] = {
        .pFrame = sZebesianWallOam_Idle_Frame9,
        .timer = 1
    },
    [6] = {
        .pFrame = sZebesianWallOam_Idle_Frame2,
        .timer = 2
    },
    [7] = {
        .pFrame = sZebesianWallOam_Idle_Frame8,
        .timer = 4
    },
    [8] = {
        .pFrame = sZebesianWallOam_Idle_Frame9,
        .timer = 1
    },
    [9] = {
        .pFrame = sZebesianWallOam_Idle_Frame2,
        .timer = 2
    },
    [10] = {
        .pFrame = sZebesianWallOam_Idle_Frame8,
        .timer = 4
    },
    [11] = {
        .pFrame = sZebesianWallOam_Idle_Frame9,
        .timer = 1
    },
    [12] = {
        .pFrame = sZebesianWallOam_Idle_Frame0,
        .timer = 4
    },
    [13] = {
        .pFrame = sZebesianWallOam_TurningAround_Frame13,
        .timer = 4
    },
    [14] = {
        .pFrame = sZebesianWallOam_TurningAround_Frame14,
        .timer = 40
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianWallOam_Jumping[8] = {
    [0] = {
        .pFrame = sZebesianWallOam_Jumping_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZebesianWallOam_Jumping_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sZebesianWallOam_Jumping_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZebesianWallOam_Jumping_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sZebesianWallOam_Jumping_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sZebesianWallOam_Jumping_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sZebesianWallOam_Jumping_Frame6,
        .timer = 255
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianWallOam_Shooting[27] = {
    [0] = {
        .pFrame = sZebesianWallOam_Idle_Frame9,
        .timer = 4
    },
    [1] = {
        .pFrame = sZebesianWallOam_TurningAround_Frame13,
        .timer = 8
    },
    [2] = {
        .pFrame = sZebesianWallOam_TurningAround_Frame14,
        .timer = 3
    },
    [3] = {
        .pFrame = sZebesianWallOam_Shooting_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sZebesianWallOam_Shooting_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZebesianWallOam_Shooting_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZebesianWallOam_Shooting_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sZebesianWallOam_Shooting_Frame7,
        .timer = 3
    },
    [8] = {
        .pFrame = sZebesianWallOam_Shooting_Frame8,
        .timer = 3
    },
    [9] = {
        .pFrame = sZebesianWallOam_Shooting_Frame7,
        .timer = 3
    },
    [10] = {
        .pFrame = sZebesianWallOam_Shooting_Frame8,
        .timer = 3
    },
    [11] = {
        .pFrame = sZebesianWallOam_Shooting_Frame7,
        .timer = 3
    },
    [12] = {
        .pFrame = sZebesianWallOam_Shooting_Frame8,
        .timer = 3
    },
    [13] = {
        .pFrame = sZebesianWallOam_Shooting_Frame13,
        .timer = 2
    },
    [14] = {
        .pFrame = sZebesianWallOam_Shooting_Frame8,
        .timer = 2
    },
    [15] = {
        .pFrame = sZebesianWallOam_Shooting_Frame13,
        .timer = 2
    },
    [16] = {
        .pFrame = sZebesianWallOam_Shooting_Frame8,
        .timer = 2
    },
    [17] = {
        .pFrame = sZebesianWallOam_Shooting_Frame13,
        .timer = 2
    },
    [18] = {
        .pFrame = sZebesianWallOam_Shooting_Frame8,
        .timer = 2
    },
    [19] = {
        .pFrame = sZebesianWallOam_Shooting_Frame13,
        .timer = 1
    },
    [20] = {
        .pFrame = sZebesianWallOam_Shooting_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sZebesianWallOam_Shooting_Frame21,
        .timer = 4
    },
    [22] = {
        .pFrame = sZebesianWallOam_Shooting_Frame7,
        .timer = 20
    },
    [23] = {
        .pFrame = sZebesianWallOam_Shooting_Frame3,
        .timer = 4
    },
    [24] = {
        .pFrame = sZebesianWallOam_TurningAround_Frame14,
        .timer = 4
    },
    [25] = {
        .pFrame = sZebesianWallOam_TurningAround_Frame13,
        .timer = 8
    },
    [26] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianWallBeamOam_Extended[6] = {
    [0] = {
        .pFrame = sZebesianWallBeamOam_Extended_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sZebesianWallBeamOam_Extended_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sZebesianWallBeamOam_Extended_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZebesianWallBeamOam_Extended_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZebesianWallBeamOam_Extended_Frame4,
        .timer = 1
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianWallBeamOam_Spawning[5] = {
    [0] = {
        .pFrame = sZebesianWallBeamOam_Spawning_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZebesianWallBeamOam_Spawning_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZebesianWallBeamOam_Spawning_Frame0,
        .timer = 4
    },
    [3] = {
        .pFrame = sZebesianWallBeamOam_Spawning_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianWallBeamOam_Extending[6] = {
    [0] = {
        .pFrame = sZebesianWallBeamOam_Extending_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sZebesianWallBeamOam_Extending_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sZebesianWallBeamOam_Extending_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZebesianWallBeamOam_Extending_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZebesianWallBeamOam_Extending_Frame4,
        .timer = 2
    },
    [5] = FRAME_DATA_TERMINATOR
};
