#include "data/sprites/atmospheric_stabilizer.h"

const u32 sAtmosphericStabilizerGfx[3 * 512] = INCBIN_U32("data/sprites/atmospheric_stabilizer.gfx");
const u16 sAtmosphericStabilizerPal[3 * 16] = INCBIN_U16("data/sprites/atmospheric_stabilizer.pal");

static const u16 sAtmosphericStabilizerOam_327970_Frame0[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf7, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x28c
};

static const u16 sAtmosphericStabilizerOam_327970_Frame1[] = {
    5,
    0xf5, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x5, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAtmosphericStabilizerOam_327970_Frame2[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xfb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x270
};

static const u16 sAtmosphericStabilizerOam_327970_Frame3[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAtmosphericStabilizerOam_327970_Frame4[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x3, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f3, OBJ_PALETTE_9 | 0x250,
    0x4, 0x3, OBJ_PALETTE_9 | 0x252,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x28c
};

static const u16 sAtmosphericStabilizerOam_327970_Frame5[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf5, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x28e
};

static const u16 sOam_327110[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf7, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x28c
};

static const u16 sOam_327130[] = {
    5,
    0xf5, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x5, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAtmosphericStabilizerOam_327970_Frame6[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_9 | 0x270
};

static const u16 sAtmosphericStabilizerOam_327970_Frame7[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf9, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAtmosphericStabilizerOam_327970_Frame8[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x3, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f3, OBJ_PALETTE_9 | 0x250,
    0x4, 0x3, OBJ_PALETTE_9 | 0x252,
    0xf8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x28c
};

static const u16 sAtmosphericStabilizerOam_327970_Frame9[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAtmosphericStabilizerOam_327970_Frame10[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x28c
};

static const u16 sAtmosphericStabilizerOam_327970_Frame11[] = {
    5,
    0xf5, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x5, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf7, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAtmosphericStabilizerOam_327970_Frame12[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf6, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_9 | 0x270
};

static const u16 sAtmosphericStabilizerOam_327970_Frame13[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xf8, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAtmosphericStabilizerOam_327970_Frame14[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x3, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f3, OBJ_PALETTE_9 | 0x250,
    0x4, 0x3, OBJ_PALETTE_9 | 0x252,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_9 | 0x28c
};

static const u16 sAtmosphericStabilizerOam_327970_Frame15[] = {
    5,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252,
    0xfb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAtmosphericStabilizerOam_327640_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x286,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x28a
};

static const u16 sAtmosphericStabilizerOam_327640_Frame1[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f8, OBJ_PALETTE_7 | 0x221,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x286,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x28a
};

static const u16 sAtmosphericStabilizerOam_327640_Frame2[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f8, OBJ_PALETTE_7 | 0x221,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x24c,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x286,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x28a
};

static const u16 sAtmosphericStabilizerOam_3277d8_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x227,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x280,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x284
};

static const u16 sAtmosphericStabilizerOam_3277d8_Frame1[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f8, OBJ_PALETTE_7 | 0x221,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x227,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x280,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x284
};

static const u16 sAtmosphericStabilizerOam_3277d8_Frame2[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f8, OBJ_PALETTE_7 | 0x221,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x227,
    0xe8, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x280,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x284
};

static const u16 sAtmosphericStabilizerOam_3279f8_Frame0[] = {
    5,
    0xfa, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x27d,
    0xf5, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x5, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f5, OBJ_PALETTE_9 | 0x250,
    0x5, 0x5, OBJ_PALETTE_9 | 0x252
};

static const u16 sAtmosphericStabilizerOam_3279f8_Frame1[] = {
    5,
    0xf7, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x215,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x250,
    0x4, 0x4, OBJ_PALETTE_9 | 0x252
};

static const u16 sAtmosphericStabilizerOam_3279f8_Frame2[] = {
    5,
    0xfa, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x213,
    0xf5, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x3, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f3, OBJ_PALETTE_9 | 0x250,
    0x5, 0x3, OBJ_PALETTE_9 | 0x252
};

static const u16 sAtmosphericStabilizerOam_327a20_Frame0[] = {
    17,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x299,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x8, OBJ_PALETTE_10 | 0x25b,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_10 | 0x297,
    0xe5, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x217,
    0xe7, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_10 | 0x292,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x6, OBJ_PALETTE_10 | 0x294,
    0xf3, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_10 | 0x27b,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1e7, OBJ_PALETTE_10 | 0x2bb,
    0xe4, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_10 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f4, OBJ_PALETTE_10 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1e4, OBJ_PALETTE_10 | 0x25d,
    0xf4, 0x1f4, OBJ_PALETTE_10 | 0x25f,
    0xf7, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_10 | 0x255,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_10 | 0x257,
    0x9, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x253,
    0x4, OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_10 | 0x295,
    0xfe, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_10 | 0x219
};

static const u16 sAtmosphericStabilizerOam_327a30_Frame0[] = {
    13,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_10 | 0x297,
    0xe8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x257,
    0xd, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_10 | 0x259,
    0xe7, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_10 | 0x217,
    0x0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_10 | 0x299,
    OBJ_SHAPE_HORIZONTAL | 0x10, 0x1ea, OBJ_PALETTE_10 | 0x25b,
    0xe7, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_10 | 0x292,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x6, OBJ_PALETTE_10 | 0x294,
    0xf3, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_10 | 0x27b,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1e7, OBJ_PALETTE_10 | 0x2bb,
    0x6, OBJ_SIZE_16x16 | 0x1e5, OBJ_PALETTE_10 | 0x255,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x253,
    0xe, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_10 | 0x219
};

static const u16 sAtmosphericStabilizerOam_327a40_Frame0[] = {
    17,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_10 | 0x297,
    0xa, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_10 | 0x259,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_10 | 0x257,
    0x7, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_10 | 0x253,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_10 | 0x217,
    0xe4, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_10 | 0x295,
    0x0, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_10 | 0x27b,
    OBJ_SHAPE_HORIZONTAL | 0x10, 0x7, OBJ_PALETTE_10 | 0x2bb,
    0xf3, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_10 | 0x299,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0xb, OBJ_PALETTE_10 | 0x25b,
    0xe9, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_10 | 0x292,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x12, OBJ_PALETTE_10 | 0x294,
    0x6, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_10 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0x6, 0x1, OBJ_PALETTE_10 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0x16, 0x1f1, OBJ_PALETTE_10 | 0x25d,
    0x16, 0x1, OBJ_PALETTE_10 | 0x25f,
    0xe1, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_10 | 0x255
};

static const u16 sAtmosphericStabilizerOam_327a50_Frame0[] = {
    18,
    0xc, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_10 | 0x253,
    0x0, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_10 | 0x257,
    0x6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_10 | 0x297,
    0xf3, OBJ_SIZE_16x16 | 0x13, OBJ_PALETTE_10 | 0x219,
    0x4, OBJ_SIZE_16x16 | 0x1e6, OBJ_PALETTE_10 | 0x295,
    0xec, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_10 | 0x217,
    0xc, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_10 | 0x21b,
    0xf2, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_10 | 0x27b,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1e8, OBJ_PALETTE_10 | 0x2bb,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_10 | 0x299,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0xb, OBJ_PALETTE_10 | 0x25b,
    0xe6, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_10 | 0x292,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x2, OBJ_PALETTE_10 | 0x294,
    0xe9, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_10 | 0x255,
    0xe4, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_10 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x16, OBJ_PALETTE_10 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x6, OBJ_PALETTE_10 | 0x25d,
    0xf4, 0x16, OBJ_PALETTE_10 | 0x25f
};

static const u16 sAtmosphericStabilizerOam_327a60_Frame0[] = {
    17,
    0xf6, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_10 | 0x257,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_10 | 0x297,
    0x8, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_10 | 0x255,
    0xeb, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_10 | 0x27b,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1e7, OBJ_PALETTE_10 | 0x2bb,
    0x3, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_10 | 0x217,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_10 | 0x292,
    OBJ_SHAPE_VERTICAL | 0xe6, OBJ_X_FLIP | 0x1ef, OBJ_PALETTE_10 | 0x294,
    0xf3, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_10 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x17, OBJ_PALETTE_10 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x7, OBJ_PALETTE_10 | 0x25d,
    0x3, 0x17, OBJ_PALETTE_10 | 0x25f,
    0xe7, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_10 | 0x253,
    0xe3, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_10 | 0x219,
    0x9, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_10 | 0x295,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_10 | 0x299,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0xb, OBJ_PALETTE_10 | 0x25b
};

static const u16 sAtmosphericStabilizerOam_327a70_Frame0[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x292,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x8, OBJ_PALETTE_10 | 0x294
};

static const u16 sAtmosphericStabilizerOam_327a80_Frame0[] = {
    2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x299,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_PALETTE_10 | 0x25b
};

static const u16 sAtmosphericStabilizerOam_327a90_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x253
};

static const u16 sAtmosphericStabilizerOam_327aa0_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x257
};

static const u16 sAtmosphericStabilizerOam_327ae0_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x295
};

static const u16 sAtmosphericStabilizerOam_327af0_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x21b
};

static const u16 sAtmosphericStabilizerOam_327b00_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x219
};

static const u16 sAtmosphericStabilizerOam_327ab0_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x255
};

static const u16 sOam_327628[] = {
    2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x27b,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_PALETTE_10 | 0x2bb
};

static const u16 sAtmosphericStabilizerOam_327ad0_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x297
};

const struct FrameData sAtmosphericStabilizerOam_327640[4] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327660[16] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 3
    },
    [4] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 3
    },
    [5] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 3
    },
    [6] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 2
    },
    [7] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 2
    },
    [8] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 2
    },
    [9] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 5
    },
    [10] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 6
    },
    [11] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 7
    },
    [12] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 3
    },
    [13] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 4
    },
    [14] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 5
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_3276e0[31] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 8
    },
    [4] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 8
    },
    [5] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 8
    },
    [6] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 6
    },
    [7] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 6
    },
    [8] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 6
    },
    [9] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 6
    },
    [10] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 6
    },
    [11] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 6
    },
    [12] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 5
    },
    [13] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 5
    },
    [14] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 5
    },
    [15] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 5
    },
    [16] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 5
    },
    [17] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 5
    },
    [18] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 3
    },
    [19] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 3
    },
    [20] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 3
    },
    [21] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 3
    },
    [22] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 3
    },
    [23] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 3
    },
    [24] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 2
    },
    [25] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 2
    },
    [26] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 2
    },
    [27] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame0,
        .timer = 2
    },
    [28] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame1,
        .timer = 2
    },
    [29] = {
        .pFrame = sAtmosphericStabilizerOam_327640_Frame2,
        .timer = 2
    },
    [30] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_3277d8[4] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_3277f8[16] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 3
    },
    [4] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 3
    },
    [5] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 3
    },
    [6] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 2
    },
    [7] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 2
    },
    [8] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 2
    },
    [9] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 5
    },
    [10] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 6
    },
    [11] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 7
    },
    [12] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 3
    },
    [13] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 4
    },
    [14] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 5
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327878[31] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 8
    },
    [4] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 8
    },
    [5] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 8
    },
    [6] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 6
    },
    [7] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 6
    },
    [8] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 6
    },
    [9] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 6
    },
    [10] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 6
    },
    [11] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 6
    },
    [12] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 5
    },
    [13] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 5
    },
    [14] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 5
    },
    [15] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 5
    },
    [16] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 5
    },
    [17] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 5
    },
    [18] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 3
    },
    [19] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 3
    },
    [20] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 3
    },
    [21] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 3
    },
    [22] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 3
    },
    [23] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 3
    },
    [24] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 2
    },
    [25] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 2
    },
    [26] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 2
    },
    [27] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame0,
        .timer = 2
    },
    [28] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame1,
        .timer = 2
    },
    [29] = {
        .pFrame = sAtmosphericStabilizerOam_3277d8_Frame2,
        .timer = 2
    },
    [30] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327970[17] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame3,
        .timer = 7
    },
    [4] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame4,
        .timer = 7
    },
    [5] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame5,
        .timer = 7
    },
    [6] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame6,
        .timer = 7
    },
    [7] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame7,
        .timer = 7
    },
    [8] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame8,
        .timer = 7
    },
    [9] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame9,
        .timer = 7
    },
    [10] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame10,
        .timer = 7
    },
    [11] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame11,
        .timer = 7
    },
    [12] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame12,
        .timer = 7
    },
    [13] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame13,
        .timer = 7
    },
    [14] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame14,
        .timer = 7
    },
    [15] = {
        .pFrame = sAtmosphericStabilizerOam_327970_Frame15,
        .timer = 7
    },
    [16] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_3279f8[5] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_3279f8_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sAtmosphericStabilizerOam_3279f8_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sAtmosphericStabilizerOam_3279f8_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sAtmosphericStabilizerOam_3279f8_Frame1,
        .timer = 5
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327a20[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327a20_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327a30[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327a30_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327a40[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327a40_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327a50[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327a50_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327a60[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327a60_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327a70[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327a70_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327a80[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327a80_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327a90[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327a90_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327aa0[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327aa0_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327ab0[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327ab0_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327ac0[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327ab0_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327ad0[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327ad0_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327ae0[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327ae0_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327af0[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327af0_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAtmosphericStabilizerOam_327b00[2] = {
    [0] = {
        .pFrame = sAtmosphericStabilizerOam_327b00_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};
