#include "data/sprites/navigation_pad.h"

const u32 sNavigationPadGfx[512 * 3] = INCBIN_U32("data/sprites/navigation_pad.gfx");
const u16 sNavigationPadPal[16 * 3] = INCBIN_U16("data/sprites/navigation_pad.pal");

static const u16 sNavigationPadOam_31e268_Frame0[] = {
    6,
    0xe0, OBJ_SIZE_32x32 | 0x1d8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1e0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x26a
};

static const u16 sNavigationPadOam_31e318_Frame0[] = {
    19,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x21a,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x21a,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_9 | 0x245,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x246,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24a,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0x18, 0x1e8, OBJ_PALETTE_9 | 0x259,
    0x18, 0x1f8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_HORIZONTAL | 0x18, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x259,
    0x18, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25b
};

static const u16 sNavigationPadOam_31e278_Frame0[] = {
    19,
    OBJ_SHAPE_HORIZONTAL | 0x18, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x25c,
    0x18, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0x18, 0x1e8, OBJ_PALETTE_9 | 0x25c,
    0x18, 0x1f8, OBJ_PALETTE_9 | 0x25e,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x21a,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x21a,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_9 | 0x245,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x246,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24a,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207
};

static const u16 sNavigationPadOam_31e278_Frame1[] = {
    19,
    OBJ_SHAPE_HORIZONTAL | 0x18, 0x1e8, OBJ_PALETTE_9 | 0x27c,
    0x18, 0x1f8, OBJ_PALETTE_9 | 0x27e,
    OBJ_SHAPE_HORIZONTAL | 0x18, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x27c,
    0x18, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x27e,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x23a,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x23a,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x23c,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e9, OBJ_PALETTE_9 | 0x245,
    0x9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x246,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24a,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207
};

static const u16 sNavigationPadOam_31e278_Frame2[] = {
    17,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x21d,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x21f,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e8, OBJ_PALETTE_9 | 0x245,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x246,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_9 | 0x245,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0x18, 0x1e8, OBJ_PALETTE_9 | 0x27c,
    0x18, 0x1f8, OBJ_PALETTE_9 | 0x27e,
    OBJ_SHAPE_HORIZONTAL | 0x18, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x27c,
    0x18, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x27e
};

static const u16 sNavigationPadOam_31e278_Frame3[] = {
    17,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x21d,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x21f,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x21f,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e7, OBJ_PALETTE_9 | 0x245,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x246,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x11, OBJ_PALETTE_9 | 0x245,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0x18, 0x1e8, OBJ_PALETTE_9 | 0x27c,
    0x18, 0x1f8, OBJ_PALETTE_9 | 0x27e,
    OBJ_SHAPE_HORIZONTAL | 0x18, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x27c,
    0x18, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x27e
};

static const u16 sNavigationPadOam_31e2a0_Frame0[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x20a
};

static const u16 sNavigationPadOam_31e2a0_Frame1[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x20d,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x20d
};

static const u16 sNavigationPadOam_31e2a0_Frame2[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x210,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sNavigationPadOam_31e2c8_Frame0[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x213,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x213
};

static const u16 sNavigationPadOam_31e2c8_Frame1[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x216
};

static const u16 sNavigationPadOam_31e2c8_Frame2[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x219,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x219
};

static const u16 sNavigationPadOam_31e328_Frame0[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x24c
};

static const u16 sNavigationPadOam_31e328_Frame1[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x250
};

static const u16 sNavigationPadOam_31e340_Frame0[] = {
    12,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sNavigationPadOam_31e340_Frame1[] = {
    15,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fc, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x1fc, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1fc, OBJ_PALETTE_8 | 0x256,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sNavigationPadOam_31e340_Frame2[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_8 | 0x257,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sNavigationPadOam_31e340_Frame3[] = {
    16,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x10, OBJ_PALETTE_8 | 0x277,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sNavigationPadOam_31e340_Frame4[] = {
    20,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x10, OBJ_PALETTE_8 | 0x277,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sNavigationPadOam_31e340_Frame5[] = {
    28,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x10, OBJ_PALETTE_8 | 0x277,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sNavigationPadOam_31e340_Frame6[] = {
    36,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x10, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xb, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xb, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xb, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xb, 0x10, OBJ_PALETTE_8 | 0x277,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

const struct FrameData sNavigationPadOam_31e268[2] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e268_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e278[5] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e278_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sNavigationPadOam_31e278_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sNavigationPadOam_31e278_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sNavigationPadOam_31e278_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e2a0[5] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e2a0_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sNavigationPadOam_31e2a0_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sNavigationPadOam_31e2a0_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sNavigationPadOam_31e2a0_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e2c8[5] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e2c8_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sNavigationPadOam_31e2c8_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sNavigationPadOam_31e2c8_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sNavigationPadOam_31e2c8_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e2f0[5] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e278_Frame3,
        .timer = 6
    },
    [1] = {
        .pFrame = sNavigationPadOam_31e278_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sNavigationPadOam_31e278_Frame1,
        .timer = 6
    },
    [3] = {
        .pFrame = sNavigationPadOam_31e278_Frame0,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e318[2] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e318_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e328[3] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e328_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sNavigationPadOam_31e328_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e340[8] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e340_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sNavigationPadOam_31e340_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sNavigationPadOam_31e340_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sNavigationPadOam_31e340_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sNavigationPadOam_31e340_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sNavigationPadOam_31e340_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sNavigationPadOam_31e340_Frame6,
        .timer = 1
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e380[2] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e278_Frame3,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNavigationPadOam_31e390[8] = {
    [0] = {
        .pFrame = sNavigationPadOam_31e340_Frame6,
        .timer = 1
    },
    [1] = {
        .pFrame = sNavigationPadOam_31e340_Frame5,
        .timer = 1
    },
    [2] = {
        .pFrame = sNavigationPadOam_31e340_Frame4,
        .timer = 1
    },
    [3] = {
        .pFrame = sNavigationPadOam_31e340_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sNavigationPadOam_31e340_Frame2,
        .timer = 2
    },
    [5] = {
        .pFrame = sNavigationPadOam_31e340_Frame1,
        .timer = 3
    },
    [6] = {
        .pFrame = sNavigationPadOam_31e340_Frame0,
        .timer = 3
    },
    [7] = FRAME_DATA_TERMINATOR
};
