#include "data/sprites/zozoro.h"

const u32 sZozoroGfx[2 * 512] = INCBIN_U32("data/sprites/zozoro.gfx");
const u16 sZozoroPal[1 * 16] = INCBIN_U16("data/sprites/zozoro.pal");

static const u16 sZozoroOam_387ed4_Frame0[] = {
    4,
    0xee, 0x1f5, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x202,
    0xed, 0x1f3, OBJ_PALETTE_8 | 0x229
};

static const u16 sZozoroOam_387ed4_Frame1[] = {
    4,
    0xee, 0x1f5, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1f4, OBJ_PALETTE_8 | 0x203,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x204,
    0xed, 0x1f1, OBJ_PALETTE_8 | 0x22a
};

static const u16 sZozoroOam_387ed4_Frame2[] = {
    5,
    0xee, 0x1f5, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x205,
    0xed, 0x1f3, OBJ_PALETTE_8 | 0x22b
};

static const u16 sZozoroOam_387ed4_Frame3[] = {
    4,
    0xee, 0x1f5, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x208,
    0xed, 0x1f3, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_387ed4_Frame4[] = {
    4,
    0xee, 0x1f3, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xef, 0x4, OBJ_PALETTE_8 | 0x205,
    0xed, 0x1f3, OBJ_PALETTE_8 | 0x22d
};

static const u16 sZozoroOam_387f3c_Frame0[] = {
    4,
    0xee, 0x1f7, OBJ_PALETTE_8 | 0x20d,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x210,
    0xf0, 0x1f1, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_387f3c_Frame1[] = {
    3,
    0xed, 0x1fb, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x211,
    0xee, 0x1f5, OBJ_PALETTE_8 | 0x22d
};

static const u16 sZozoroOam_387f3c_Frame2[] = {
    3,
    0xed, 0x1fb, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x211,
    0xee, 0x1f5, OBJ_PALETTE_8 | 0x22d
};

static const u16 sZozoroOam_387f3c_Frame3[] = {
    4,
    0xee, 0x1f7, OBJ_PALETTE_8 | 0x20d,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x210,
    0xf0, 0x1f1, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_387f04_Frame1[] = {
    5,
    0xed, 0x1f5, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1f5, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xef, 0x4, OBJ_PALETTE_8 | 0x205,
    0xec, 0x1f1, OBJ_PALETTE_8 | 0x22a
};

static const u16 sZozoroOam_387f04_Frame2[] = {
    5,
    0xed, 0x1f5, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xee, 0x4, OBJ_PALETTE_8 | 0x205,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x22b
};

static const u16 sZozoroOam_387f04_Frame3[] = {
    5,
    0xed, 0x1f5, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xef, 0x4, OBJ_PALETTE_8 | 0x205,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x22b
};

static const u16 sZozoroOam_38787c[] = {
    4,
    0xee, 0x1f5, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x205,
    0xef, 0x1f2, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_3881fc_Frame2[] = {
    4,
    0xec, 0x1f4, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x205,
    0xf1, 0x1f1, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_387f64_Frame0[] = {
    4,
    0xf5, 0xa, OBJ_PALETTE_8 | 0x24a,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x242,
    0xf3, 0xb, OBJ_PALETTE_8 | 0x268
};

static const u16 sZozoroOam_387f64_Frame1[] = {
    4,
    0xf5, 0xa, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1, OBJ_PALETTE_8 | 0x262,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x244,
    0xf1, 0xb, OBJ_PALETTE_8 | 0x269
};

static const u16 sZozoroOam_387f64_Frame2[] = {
    5,
    0xf5, 0xa, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x264,
    0xf3, 0xb, OBJ_PALETTE_8 | 0x26a
};

static const u16 sZozoroOam_387f64_Frame3[] = {
    4,
    0xf5, 0xa, OBJ_PALETTE_8 | 0x248,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x24d,
    0xf3, 0xb, OBJ_PALETTE_8 | 0x26b
};

static const u16 sZozoroOam_387f64_Frame4[] = {
    5,
    0xf3, 0xa, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_8 | 0x264,
    0xf3, 0xb, OBJ_PALETTE_8 | 0x26c
};

static const u16 sZozoroOam_387fcc_Frame0[] = {
    4,
    0xf7, 0xa, OBJ_PALETTE_8 | 0x24c,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x26d,
    0xf1, 0x8, OBJ_PALETTE_8 | 0x26b
};

static const u16 sZozoroOam_387fcc_Frame1[] = {
    3,
    0xfb, 0xb, OBJ_PALETTE_8 | 0x248,
    0xf7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x251,
    0xf5, 0xa, OBJ_PALETTE_8 | 0x26c
};

static const u16 sZozoroOam_387fcc_Frame2[] = {
    3,
    0xfb, 0xb, OBJ_PALETTE_8 | 0x248,
    0xf7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x251,
    0xf5, 0xa, OBJ_PALETTE_8 | 0x26c
};

static const u16 sZozoroOam_387fcc_Frame3[] = {
    4,
    0xf7, 0xa, OBJ_PALETTE_8 | 0x24c,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x26d,
    0xf1, 0x8, OBJ_PALETTE_8 | 0x26b
};

static const u16 sZozoroOam_387f94_Frame1[] = {
    5,
    0xf5, 0xc, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x2, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x3, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_8 | 0x264,
    0xf1, 0xd, OBJ_PALETTE_8 | 0x269
};

static const u16 sZozoroOam_387f94_Frame2[] = {
    5,
    0xf5, 0xb, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x2, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x2, OBJ_PALETTE_8 | 0x264,
    0xf3, 0xc, OBJ_PALETTE_8 | 0x26a
};

static const u16 sZozoroOam_387f94_Frame3[] = {
    5,
    0xf5, 0xb, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_8 | 0x264,
    0xf3, 0xc, OBJ_PALETTE_8 | 0x26a
};

static const u16 sZozoroOam_3879fa[] = {
    4,
    0xf5, 0xa, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x262,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x244,
    0xf2, 0x9, OBJ_PALETTE_8 | 0x26b
};

static const u16 sZozoroOam_387a14[] = {
    4,
    0xf4, 0xc, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x262,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x244,
    0xf1, 0x7, OBJ_PALETTE_8 | 0x26b
};

static const u16 sZozoroOam_387ff4_Frame0[] = {
    6,
    0xed, 0x1f9, OBJ_PALETTE_8 | 0x20b,
    0xed, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x239,
    0xfa, 0x1, OBJ_PALETTE_8 | 0x213,
    0xed, 0x1f7, OBJ_PALETTE_8 | 0x229
};

static const u16 sZozoroOam_387ff4_Frame1[] = {
    6,
    0xed, 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0xed, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x214,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x239,
    0xfb, 0x3, OBJ_PALETTE_8 | 0x213,
    0xed, 0x1f5, OBJ_PALETTE_8 | 0x22a
};

static const u16 sZozoroOam_387ff4_Frame2[] = {
    6,
    0xed, 0x1fb, OBJ_PALETTE_8 | 0x20d,
    0xed, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x214,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x3, OBJ_PALETTE_8 | 0x213,
    0xec, 0x1f9, OBJ_PALETTE_8 | 0x22b
};

static const u16 sZozoroOam_387ff4_Frame3[] = {
    6,
    0xed, 0x1fa, OBJ_PALETTE_8 | 0x209,
    0xed, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x214,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x239,
    0xfb, 0x3, OBJ_PALETTE_8 | 0x213,
    0xec, 0x1f8, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_387ff4_Frame4[] = {
    6,
    0xee, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xee, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x214,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x239,
    0xfa, 0x2, OBJ_PALETTE_8 | 0x213,
    0xed, 0x1f8, OBJ_PALETTE_8 | 0x22d
};

static const u16 sZozoroOam_388054_Frame0[] = {
    6,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x24a,
    0xf2, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x25b,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x21a,
    0xf4, 0x3, OBJ_PALETTE_8 | 0x255,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x268
};

static const u16 sZozoroOam_388054_Frame1[] = {
    6,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x24b,
    0xf3, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x25b,
    0xf2, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a,
    0xf4, 0x4, OBJ_PALETTE_8 | 0x255,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x269
};

static const u16 sZozoroOam_388054_Frame2[] = {
    6,
    0xf7, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x24c,
    0xf2, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x25b,
    0xf1, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x21a,
    0xf4, 0x3, OBJ_PALETTE_8 | 0x255,
    0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x26a
};

static const u16 sZozoroOam_388054_Frame3[] = {
    6,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x248,
    0xf3, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x25b,
    0xf2, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a,
    0xf4, 0x4, OBJ_PALETTE_8 | 0x255,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x26b
};

static const u16 sZozoroOam_388054_Frame4[] = {
    6,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x249,
    0xf3, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x25b,
    0xf2, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x21a,
    0xf4, 0x2, OBJ_PALETTE_8 | 0x255,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x26c
};

static const u16 sZozoroOam_388174_Frame0[] = {
    4,
    0xec, 0x1f5, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x202,
    0xeb, 0x1f3, OBJ_PALETTE_8 | 0x229
};

static const u16 sZozoroOam_388174_Frame1[] = {
    4,
    0xee, 0x1f4, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x208,
    0xed, 0x1f0, OBJ_PALETTE_8 | 0x22a
};

static const u16 sZozoroOam_388174_Frame2[] = {
    4,
    0xed, 0x1f5, OBJ_PALETTE_8 | 0x20d,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x205,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x22b
};

static const u16 sZozoroOam_388174_Frame3[] = {
    4,
    0xee, 0x1f4, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x208,
    0xed, 0x1f2, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_388174_Frame4[] = {
    4,
    0xed, 0x1f3, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x205,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x22d
};

static const u16 sZozoroOam_3881a4_Frame0[] = {
    4,
    0xf5, 0xc, OBJ_PALETTE_8 | 0x24a,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x242,
    0xf3, 0xd, OBJ_PALETTE_8 | 0x268
};

static const u16 sZozoroOam_3881a4_Frame1[] = {
    4,
    0xf4, 0xa, OBJ_PALETTE_8 | 0x24b,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x24d,
    0xf0, 0xb, OBJ_PALETTE_8 | 0x269
};

static const u16 sZozoroOam_3881a4_Frame2[] = {
    5,
    0xf5, 0xb, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_8 | 0x264,
    0xf3, 0xc, OBJ_PALETTE_8 | 0x26a
};

static const u16 sZozoroOam_3881a4_Frame3[] = {
    4,
    0xf4, 0xa, OBJ_PALETTE_8 | 0x248,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x24d,
    0xf2, 0xb, OBJ_PALETTE_8 | 0x26b
};

static const u16 sZozoroOam_3881a4_Frame4[] = {
    5,
    0xf3, 0xb, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_8 | 0x264,
    0xf3, 0xc, OBJ_PALETTE_8 | 0x26c
};

static const u16 sZozoroOam_3881d4_Frame0[] = {
    4,
    0xfd, OBJ_Y_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x20b,
    0xf3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x202,
    0xfe, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x229
};

static const u16 sZozoroOam_3881d4_Frame1[] = {
    4,
    0xfd, OBJ_Y_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x209,
    0xf3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x208,
    0xfe, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_3881d4_Frame2[] = {
    4,
    0xfd, OBJ_Y_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x203,
    0xf3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x204,
    0xfe, OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x22a
};

static const u16 sZozoroOam_3881d4_Frame3[] = {
    4,
    0xfd, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x20a,
    0xf3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x205,
    0xfe, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x22d
};

static const u16 sZozoroOam_3881fc_Frame0[] = {
    4,
    0xf8, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x20b,
    0xf1, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x4, OBJ_PALETTE_8 | 0x21f,
    0xf9, OBJ_Y_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x229
};

static const u16 sZozoroOam_3881fc_Frame1[] = {
    4,
    0xf0, 0x1f4, OBJ_PALETTE_8 | 0x20c,
    0xf5, 0x1f1, OBJ_PALETTE_8 | 0x22a,
    0xf1, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x25d,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x4, OBJ_PALETTE_8 | 0x25f
};

static const u16 sZozoroOam_3880b4_Frame0[] = {
    6,
    0xeb, 0x1fa, OBJ_PALETTE_8 | 0x20b,
    0xeb, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x239,
    0xfb, 0x1, OBJ_PALETTE_8 | 0x213,
    0xeb, 0x1f8, OBJ_PALETTE_8 | 0x229
};

static const u16 sZozoroOam_3880b4_Frame1[] = {
    6,
    0xeb, 0x1fa, OBJ_PALETTE_8 | 0x20c,
    0xea, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x2, OBJ_PALETTE_8 | 0x213,
    0xeb, 0x1f6, OBJ_PALETTE_8 | 0x22a
};

static const u16 sZozoroOam_3880b4_Frame2[] = {
    6,
    0xec, 0x1fb, OBJ_PALETTE_8 | 0x20d,
    0xec, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x1, OBJ_PALETTE_8 | 0x213,
    0xeb, 0x1f9, OBJ_PALETTE_8 | 0x22b
};

static const u16 sZozoroOam_3880b4_Frame3[] = {
    6,
    0xec, 0x1fa, OBJ_PALETTE_8 | 0x209,
    0xeb, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x3, OBJ_PALETTE_8 | 0x213,
    0xeb, 0x1f8, OBJ_PALETTE_8 | 0x22c
};

static const u16 sZozoroOam_3880b4_Frame4[] = {
    6,
    0xec, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xec, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x2, OBJ_PALETTE_8 | 0x213,
    0xeb, 0x1f8, OBJ_PALETTE_8 | 0x22d
};

static const u16 sZozoroOam_388114_Frame0[] = {
    6,
    0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x24a,
    0xf3, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x233,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x217,
    0xef, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x21a,
    0xf2, 0x0, OBJ_PALETTE_8 | 0x255,
    0xfb, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x268
};

static const u16 sZozoroOam_388114_Frame1[] = {
    6,
    0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x24b,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x233,
    0xf2, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x21a,
    0xf1, 0x1, OBJ_PALETTE_8 | 0x255,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x269
};

static const u16 sZozoroOam_388114_Frame2[] = {
    6,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x24c,
    0xf3, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x217,
    0xef, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x21a,
    0xf2, 0x1, OBJ_PALETTE_8 | 0x255,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x26a
};

static const u16 sZozoroOam_388114_Frame3[] = {
    6,
    0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x248,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x233,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x217,
    0xef, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x21a,
    0xfb, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x26b,
    0xf0, 0x2, OBJ_PALETTE_8 | 0x255
};

static const u16 sZozoroOam_388114_Frame4[] = {
    6,
    0xfb, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x249,
    0xf4, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x233,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x21a,
    0xf1, 0x0, OBJ_PALETTE_8 | 0x255,
    0xfb, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x26c
};

const struct FrameData sZozoroOam_387ed4[6] = {
    [0] = {
        .pFrame = sZozoroOam_387ed4_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZozoroOam_387ed4_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZozoroOam_387ed4_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sZozoroOam_387ed4_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZozoroOam_387ed4_Frame4,
        .timer = 7
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_387f04[7] = {
    [0] = {
        .pFrame = sZozoroOam_387ed4_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sZozoroOam_387f04_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sZozoroOam_387f04_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZozoroOam_387f04_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sZozoroOam_387ed4_Frame3,
        .timer = 2
    },
    [5] = {
        .pFrame = sZozoroOam_387ed4_Frame4,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_387f3c[5] = {
    [0] = {
        .pFrame = sZozoroOam_387f3c_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZozoroOam_387f3c_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZozoroOam_387f3c_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZozoroOam_387f3c_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_387f64[6] = {
    [0] = {
        .pFrame = sZozoroOam_387f64_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZozoroOam_387f64_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZozoroOam_387f64_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sZozoroOam_387f64_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZozoroOam_387f64_Frame4,
        .timer = 7
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_387f94[7] = {
    [0] = {
        .pFrame = sZozoroOam_387f64_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sZozoroOam_387f94_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sZozoroOam_387f94_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZozoroOam_387f94_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sZozoroOam_387f64_Frame3,
        .timer = 2
    },
    [5] = {
        .pFrame = sZozoroOam_387f64_Frame4,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_387fcc[5] = {
    [0] = {
        .pFrame = sZozoroOam_387fcc_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZozoroOam_387fcc_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZozoroOam_387fcc_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZozoroOam_387fcc_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_387ff4[6] = {
    [0] = {
        .pFrame = sZozoroOam_387ff4_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZozoroOam_387ff4_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZozoroOam_387ff4_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sZozoroOam_387ff4_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZozoroOam_387ff4_Frame4,
        .timer = 7
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_388024[6] = {
    [0] = {
        .pFrame = sZozoroOam_387ff4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZozoroOam_387ff4_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZozoroOam_387ff4_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZozoroOam_387ff4_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZozoroOam_387ff4_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_388054[6] = {
    [0] = {
        .pFrame = sZozoroOam_388054_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZozoroOam_388054_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZozoroOam_388054_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sZozoroOam_388054_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZozoroOam_388054_Frame4,
        .timer = 7
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_388084[6] = {
    [0] = {
        .pFrame = sZozoroOam_388054_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZozoroOam_388054_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZozoroOam_388054_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZozoroOam_388054_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZozoroOam_388054_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_3880b4[6] = {
    [0] = {
        .pFrame = sZozoroOam_3880b4_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZozoroOam_3880b4_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZozoroOam_3880b4_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sZozoroOam_3880b4_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZozoroOam_3880b4_Frame4,
        .timer = 7
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_3880e4[6] = {
    [0] = {
        .pFrame = sZozoroOam_3880b4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZozoroOam_3880b4_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZozoroOam_3880b4_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZozoroOam_3880b4_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZozoroOam_3880b4_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_388114[6] = {
    [0] = {
        .pFrame = sZozoroOam_388114_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZozoroOam_388114_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZozoroOam_388114_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sZozoroOam_388114_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZozoroOam_388114_Frame4,
        .timer = 7
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_388144[6] = {
    [0] = {
        .pFrame = sZozoroOam_388114_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZozoroOam_388114_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZozoroOam_388114_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZozoroOam_388114_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZozoroOam_388114_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_388174[6] = {
    [0] = {
        .pFrame = sZozoroOam_388174_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sZozoroOam_388174_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sZozoroOam_388174_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sZozoroOam_388174_Frame3,
        .timer = 12
    },
    [4] = {
        .pFrame = sZozoroOam_388174_Frame4,
        .timer = 12
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_3881a4[6] = {
    [0] = {
        .pFrame = sZozoroOam_3881a4_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sZozoroOam_3881a4_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sZozoroOam_3881a4_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sZozoroOam_3881a4_Frame3,
        .timer = 12
    },
    [4] = {
        .pFrame = sZozoroOam_3881a4_Frame4,
        .timer = 12
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_3881d4[5] = {
    [0] = {
        .pFrame = sZozoroOam_3881d4_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZozoroOam_3881d4_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZozoroOam_3881d4_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZozoroOam_3881d4_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZozoroOam_3881fc[5] = {
    [0] = {
        .pFrame = sZozoroOam_3881fc_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZozoroOam_3881fc_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZozoroOam_3881fc_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sZozoroOam_387ed4_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_388224_39aa34[] = INCBIN_U8("data/Blob_388224_39aa34.bin");
