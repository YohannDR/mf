#include "data/sprites/yard.h"
#include "macros.h"

const u32 sYardGfx[512 * 3] = INCBIN_U32("data/sprites/yard.gfx");
const u16 sYardPal[16 * 3] = INCBIN_U16("data/sprites/yard.pal");

static const u16 sYardOam_3552c8_Frame0[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xeb, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xf3, 0x1f5, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1f7, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, OBJ_PALETTE_8 | 0x200,
    0xe5, 0x1fd, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f6, OBJ_PALETTE_8 | 0x241
};

static const u16 sYardOam_3552c8_Frame1[] = {
    6,
    0xf3, 0x1f3, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xe3, 0x1fb, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f4, OBJ_PALETTE_8 | 0x241,
    0xeb, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1f6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f9, OBJ_PALETTE_8 | 0x220
};

static const u16 sYardOam_3552c8_Frame2[] = {
    6,
    0xf2, 0x1f5, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xe9, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1f9, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xe3, 0x1fd, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1f6, OBJ_PALETTE_8 | 0x241
};

static const u16 sYardOam_3552e8_Frame0[] = {
    6,
    0xef, 0x1f5, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xe9, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1f6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xe3, 0x1fd, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1f6, OBJ_PALETTE_8 | 0x241
};

static const u16 sYardOam_3552e8_Frame1[] = {
    5,
    0xf0, 0x2, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf5, 0x1f4, OBJ_PALETTE_8 | 0x260,
    0xf1, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204
};

static const u16 sYardOam_3552e8_Frame2[] = {
    5,
    0xf0, 0x2, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf4, 0x1f3, OBJ_PALETTE_8 | 0x260,
    0xf1, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204
};

static const u16 sYardOam_3552e8_Frame3[] = {
    5,
    0xf0, 0x2, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf3, 0x1f3, OBJ_PALETTE_8 | 0x260,
    0xf1, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204
};

static const u16 sYardOam_3552e8_Frame4[] = {
    5,
    0xf0, 0x2, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf2, 0x1f2, OBJ_PALETTE_8 | 0x260,
    0xf1, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204
};

static const u16 sYardOam_355318_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x211,
    0xf8, 0x1f9, OBJ_PALETTE_8 | 0x213
};

static const u16 sYardOam_355318_Frame0[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1fc, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x4, OBJ_PALETTE_8 | 0x21e,
    0xf0, 0x2, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x211,
    0xf8, 0x1f9, OBJ_PALETTE_8 | 0x213
};

static const u16 sYardOam_355318_Frame2[] = {
    7,
    0xe4, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x214,
    0xec, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x233,
    0xf0, 0x2, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x211,
    0xf8, 0x1f9, OBJ_PALETTE_8 | 0x213
};

static const u16 sYardOam_355318_Frame4[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x4, OBJ_PALETTE_8 | 0x23e,
    0xf0, 0x2, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x211,
    0xf8, 0x1f9, OBJ_PALETTE_8 | 0x213
};

static const u16 sYardOam_3553e8_Frame0[] = {
    7,
    0xfa, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x6, OBJ_PALETTE_8 | 0x251,
    0xf3, 0x6, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fb, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x248,
    0xfb, 0x14, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x6, OBJ_PALETTE_8 | 0x271
};

static const u16 sYardOam_3553e8_Frame1[] = {
    5,
    0xf2, 0x5, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x5, OBJ_PALETTE_8 | 0x255,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x5, OBJ_PALETTE_8 | 0x271,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fb, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1, OBJ_PALETTE_8 | 0x249
};

static const u16 sYardOam_3553e8_Frame2[] = {
    7,
    0xf4, 0x6, OBJ_PALETTE_8 | 0x230,
    0xfb, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x7, OBJ_PALETTE_8 | 0x251,
    0xfc, 0x15, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x7, OBJ_PALETTE_8 | 0x271,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x24a
};

static const u16 sYardOam_355408_Frame0[] = {
    7,
    0xf4, 0x9, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fc, OBJ_PALETTE_8 | 0x264,
    0xfb, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x7, OBJ_PALETTE_8 | 0x251,
    0xfc, 0x15, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x7, OBJ_PALETTE_8 | 0x271,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x24a
};

static const u16 sYardOam_355408_Frame1[] = {
    5,
    0x1, 0x8, OBJ_PALETTE_8 | 0x26e,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1fa, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x2, OBJ_PALETTE_8 | 0x273,
    0xf3, 0x3, OBJ_PALETTE_8 | 0x22f,
    0xf6, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x246
};

static const u16 sYardOam_355408_Frame2[] = {
    5,
    0x1, 0x8, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1fa, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x2, OBJ_PALETTE_8 | 0x273,
    0xf2, 0x4, OBJ_PALETTE_8 | 0x22f,
    0xf6, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x246
};

static const u16 sYardOam_355408_Frame3[] = {
    5,
    0x1, 0x8, OBJ_PALETTE_8 | 0x26e,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1fa, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x2, OBJ_PALETTE_8 | 0x273,
    0xf2, 0x5, OBJ_PALETTE_8 | 0x22f,
    0xf6, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x246
};

static const u16 sYardOam_355408_Frame4[] = {
    5,
    0x1, 0x8, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1fa, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x2, OBJ_PALETTE_8 | 0x273,
    0xf1, 0x6, OBJ_PALETTE_8 | 0x22f,
    0xf6, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x246
};

static const u16 sYardOam_355438_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1fa, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x2, OBJ_PALETTE_8 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24b,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x24d
};

static const u16 sYardOam_355438_Frame0[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0x3, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x13, OBJ_Y_FLIP | 0x9, OBJ_PALETTE_8 | 0x21e,
    0x1, 0x8, OBJ_PALETTE_8 | 0x26e,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1fa, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x2, OBJ_PALETTE_8 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24b,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x24d
};

static const u16 sYardOam_355438_Frame2[] = {
    7,
    0x5, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x214,
    0xfd, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x233,
    0x1, 0x8, OBJ_PALETTE_8 | 0x26e,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1fa, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x2, OBJ_PALETTE_8 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24b,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x24d
};

static const u16 sYardOam_355438_Frame4[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0x3, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x9, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_HORIZONTAL | 0x13, OBJ_Y_FLIP | 0x9, OBJ_PALETTE_8 | 0x23e,
    0x1, 0x8, OBJ_PALETTE_8 | 0x26e,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1fa, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x2, OBJ_PALETTE_8 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24b,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x24d
};

static const u16 sYardOam_355370_Frame0[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1fb, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1f4, OBJ_PALETTE_8 | 0x241,
    0xef, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x242,
    0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1fa, OBJ_PALETTE_8 | 0x266
};

static const u16 sYardOam_355370_Frame1[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xe8, 0x1fd, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f6, OBJ_PALETTE_8 | 0x241,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1fb, OBJ_PALETTE_8 | 0x266
};

static const u16 sYardOam_355490_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x1, OBJ_PALETTE_8 | 0x255,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1, OBJ_PALETTE_8 | 0x271,
    0xf2, 0x1ff, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x205
};

static const u16 sYardOam_355490_Frame1[] = {
    7,
    0xfb, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x2, OBJ_PALETTE_8 | 0x251,
    0xfc, 0x10, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x2, OBJ_PALETTE_8 | 0x271,
    0xf2, 0x0, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_Y_FLIP | 0x1fd, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x205
};

static const u16 sYardOam_3553a8_Frame1[] = {
    6,
    0xf6, 0x1f9, OBJ_PALETTE_8 | 0x240,
    0xf6, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x22f,
    0xf9, OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xe6, 0x1fd, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f6, OBJ_PALETTE_8 | 0x241
};

static const u16 sYardOam_3553a8_Frame2[] = {
    6,
    0xf6, 0x1fa, OBJ_PALETTE_8 | 0x240,
    0xf7, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x1eb, OBJ_PALETTE_8 | 0x20b,
    0xe6, 0x1fc, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f5, OBJ_PALETTE_8 | 0x241,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x22f
};

static const u16 sYardOam_3554c8_Frame1[] = {
    7,
    0x1, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x260,
    0xf9, 0x2, OBJ_PALETTE_8 | 0x230,
    0xf5, 0x2, OBJ_PALETTE_8 | 0x260,
    0xfc, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x4, OBJ_PALETTE_8 | 0x251,
    0xfd, 0x12, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x4, OBJ_PALETTE_8 | 0x271
};

static const u16 sYardOam_3554c8_Frame2[] = {
    7,
    0xfa, 0x2, OBJ_PALETTE_8 | 0x230,
    0xff, OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x260,
    0xfb, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x4, OBJ_PALETTE_8 | 0x251,
    0xfc, 0x12, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x4, OBJ_PALETTE_8 | 0x271,
    0xf6, 0x0, OBJ_PALETTE_8 | 0x260
};

static const u16 sYardOam_355530_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x280
};

static const u16 sYardOam_355540_Frame0[] = {
    1,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x284
};

static const u16 sYardOam_355508_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x25c
};

static const u16 sYardOam_355508_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f8, OBJ_PALETTE_8 | 0x25e
};

static const u16 sYardOam_355508_Frame2[] = {
    1,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x25c
};

static const u16 sYardOam_355508_Frame3[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x25e
};

static const u16 sYardOam_355550_Frame0[] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x25d,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x25d,
    0xf8, 0x1f6, OBJ_PALETTE_8 | 0x288,
    0x2, 0x0, OBJ_PALETTE_8 | 0x288,
    0x0, 0x1f6, OBJ_PALETTE_8 | 0x27f,
    0xfc, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x27f,
    0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x288
};

static const u16 sYardOam_355550_Frame1[] = {
    6,
    0xf6, 0x2, OBJ_PALETTE_8 | 0x27f,
    0x2, 0x1f6, OBJ_PALETTE_8 | 0x27f,
    0xf7, 0x1f7, OBJ_PALETTE_8 | 0x27f,
    0x2, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x27f,
    0xfc, 0x1f3, OBJ_PALETTE_8 | 0x288,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x288
};

static const u16 sYardOam_355550_Frame2[] = {
    4,
    0x5, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x288,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x288,
    0xfc, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x288,
    0xf3, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x288
};

static const u16 sYardOam_3553a8_Frame0[] = {
    7,
    0xf4, 0x1f7, OBJ_PALETTE_8 | 0x240,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_HORIZONTAL | 0xe4, 0x1fb, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f4, OBJ_PALETTE_8 | 0x241,
    0xec, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1f4, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_PALETTE_8 | 0x220
};

static const u16 sYardOam_3554c8_Frame0[] = {
    6,
    0xf6, 0x3, OBJ_PALETTE_8 | 0x230,
    0xff, 0x0, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x5, OBJ_PALETTE_8 | 0x255,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x5, OBJ_PALETTE_8 | 0x271,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fb, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1ff, OBJ_PALETTE_8 | 0x249
};

const struct FrameData sYardOam_3552c8[4] = {
    [0] = {
        .pFrame = sYardOam_3552c8_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sYardOam_3552c8_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sYardOam_3552c8_Frame2,
        .timer = 12
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_3552e8[6] = {
    [0] = {
        .pFrame = sYardOam_3552e8_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sYardOam_3552e8_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sYardOam_3552e8_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sYardOam_3552e8_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sYardOam_3552e8_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355318[7] = {
    [0] = {
        .pFrame = sYardOam_355318_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sYardOam_355318_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sYardOam_355318_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sYardOam_355318_Frame1,
        .timer = 2
    },
    [4] = {
        .pFrame = sYardOam_355318_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sYardOam_355318_Frame1,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355350[4] = {
    [0] = {
        .pFrame = sYardOam_3552e8_Frame4,
        .timer = 2
    },
    [1] = {
        .pFrame = sYardOam_3552e8_Frame2,
        .timer = 2
    },
    [2] = {
        .pFrame = sYardOam_3552e8_Frame0,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355370[7] = {
    [0] = {
        .pFrame = sYardOam_355370_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sYardOam_355370_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sYardOam_355370_Frame0,
        .timer = 3
    },
    [3] = {
        .pFrame = sYardOam_355370_Frame1,
        .timer = 3
    },
    [4] = {
        .pFrame = sYardOam_355370_Frame0,
        .timer = 3
    },
    [5] = {
        .pFrame = sYardOam_355370_Frame1,
        .timer = 3
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_3553a8[4] = {
    [0] = {
        .pFrame = sYardOam_3553a8_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sYardOam_3553a8_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sYardOam_3553a8_Frame2,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_3553c8[4] = {
    [0] = {
        .pFrame = sYardOam_3553a8_Frame2,
        .timer = 6
    },
    [1] = {
        .pFrame = sYardOam_3553a8_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sYardOam_3553a8_Frame0,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_3553e8[4] = {
    [0] = {
        .pFrame = sYardOam_3553e8_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sYardOam_3553e8_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sYardOam_3553e8_Frame2,
        .timer = 12
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355408[6] = {
    [0] = {
        .pFrame = sYardOam_355408_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sYardOam_355408_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sYardOam_355408_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sYardOam_355408_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sYardOam_355408_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355438[7] = {
    [0] = {
        .pFrame = sYardOam_355438_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sYardOam_355438_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sYardOam_355438_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sYardOam_355438_Frame1,
        .timer = 2
    },
    [4] = {
        .pFrame = sYardOam_355438_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sYardOam_355438_Frame1,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355470[4] = {
    [0] = {
        .pFrame = sYardOam_355408_Frame4,
        .timer = 2
    },
    [1] = {
        .pFrame = sYardOam_355408_Frame2,
        .timer = 2
    },
    [2] = {
        .pFrame = sYardOam_355408_Frame0,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355490[7] = {
    [0] = {
        .pFrame = sYardOam_355490_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sYardOam_355490_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sYardOam_355490_Frame0,
        .timer = 3
    },
    [3] = {
        .pFrame = sYardOam_355490_Frame1,
        .timer = 3
    },
    [4] = {
        .pFrame = sYardOam_355490_Frame0,
        .timer = 3
    },
    [5] = {
        .pFrame = sYardOam_355490_Frame1,
        .timer = 3
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_3554c8[4] = {
    [0] = {
        .pFrame = sYardOam_3554c8_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sYardOam_3554c8_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sYardOam_3554c8_Frame2,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_3554e8[4] = {
    [0] = {
        .pFrame = sYardOam_3554c8_Frame2,
        .timer = 6
    },
    [1] = {
        .pFrame = sYardOam_3554c8_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sYardOam_3554c8_Frame0,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355508[5] = {
    [0] = {
        .pFrame = sYardOam_355508_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sYardOam_355508_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sYardOam_355508_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sYardOam_355508_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355530[2] = {
    [0] = {
        .pFrame = sYardOam_355530_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355540[2] = {
    [0] = {
        .pFrame = sYardOam_355540_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYardOam_355550[4] = {
    [0] = {
        .pFrame = sYardOam_355550_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sYardOam_355550_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sYardOam_355550_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};
