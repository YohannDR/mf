#include "data/sprites/geruboss.h"
#include "macros.h"

const u32 sGerubossGfx[512 * 1] = INCBIN_U32("data/sprites/geruboss.gfx");
const u16 sGerubossPal[16 * 1] = INCBIN_U16("data/sprites/geruboss.pal");

static const u16 sGerubossOam_358df4_Frame0[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0x0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x9, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20f,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGerubossOam_358e14_Frame1[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0x0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20f,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGerubossOam_358e14_Frame2[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0x0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x7, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20f,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGerubossOam_358e3c_Frame1[] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1e9, OBJ_PALETTE_8 | 0x205,
    0xff, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf7, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x205,
    0xff, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_Y_FLIP | 0x1ed, OBJ_PALETTE_8 | 0x225,
    0xfa, OBJ_Y_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | OBJ_Y_FLIP | 0x3, OBJ_PALETTE_8 | 0x225,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x3, OBJ_PALETTE_8 | 0x224
};

static const u16 sGerubossOam_358e3c_Frame2[] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1e8, OBJ_PALETTE_8 | 0x205,
    0xfe, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x205,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x6, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x6, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_Y_FLIP | 0x1eb, OBJ_PALETTE_8 | 0x225,
    0xfa, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x225,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x224
};

static const u16 sGerubossOam_358e3c_Frame3[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1ec, OBJ_PALETTE_8 | 0x205,
    0x7, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x205,
    0x7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    0xea, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20d,
    0xea, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20d
};

static const u16 sGerubossOam_358e3c_Frame4[] = {
    16,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1eb, OBJ_PALETTE_8 | 0x205,
    0x4, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x205,
    0x4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    0xef, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20f,
    0xef, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x20f,
    0xfb, 0x1ea, OBJ_PALETTE_8 | 0x217,
    0xfb, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x217,
    0xea, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x215,
    0xea, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x215
};

static const u16 sGerubossOam_358e6c_Frame0[] = {
    18,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0x2, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0x2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x225,
    0xfc, OBJ_Y_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x224,
    0xf7, 0x1e8, OBJ_PALETTE_8 | 0x217,
    0xf7, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x217,
    0xe8, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x215,
    0xe8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x215
};

static const u16 sGerubossOam_358e6c_Frame1[] = {
    18,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0x2, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0x2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x225,
    0xfc, OBJ_Y_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x224,
    0xf7, 0x1e8, OBJ_PALETTE_8 | 0x218,
    0xf7, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x233
};

static const u16 sGerubossOam_358e6c_Frame2[] = {
    18,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0x2, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0x2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x225,
    0xfc, OBJ_Y_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x224,
    0xf7, 0x1e8, OBJ_PALETTE_8 | 0x237,
    0xf7, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x213
};

static const u16 sGerubossOam_358f3c_Frame3[] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0xfd, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0xfd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x225,
    0xfe, OBJ_Y_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x224
};

static const u16 sGerubossOam_358eec_Frame0[] = {
    18,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0xff, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf7, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0xff, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x225,
    0xfe, OBJ_Y_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x224,
    0xf5, 0x1e9, OBJ_PALETTE_8 | 0x217,
    0xf5, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x217,
    0xee, OBJ_Y_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x215,
    0xee, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x215
};

static const u16 sGerubossOam_358eec_Frame1[] = {
    9,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0xfc, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f8, OBJ_PALETTE_8 | 0x201,
    0x7, 0x1f8, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x201,
    0x7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x223,
    0x5, 0x1fc, OBJ_PALETTE_8 | 0x204
};

static const u16 sGerubossOam_358eec_Frame2[] = {
    11,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0xfa, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x202,
    0x2, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1ef, OBJ_PALETTE_8 | 0x225,
    0xfc, 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0xfc, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x224
};

static const u16 sGerubossOam_358eec_Frame3[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0xfb, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x202,
    0x0, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1ef, OBJ_PALETTE_8 | 0x225,
    0xfe, 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0x6, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0xfe, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x224,
    0xf, 0x1f4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x1f0, OBJ_PALETTE_8 | 0x215,
    0xf, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x215
};

static const u16 sGerubossOam_358eac_Frame0[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0xfb, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x202,
    0xff, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1ef, OBJ_PALETTE_8 | 0x225,
    0x0, 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0x0, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x224,
    0x14, 0x1f4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xc, 0x1f0, OBJ_PALETTE_8 | 0x215,
    0x14, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x215
};

static const u16 sGerubossOam_358eac_Frame1[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0xfb, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x202,
    0xff, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1ef, OBJ_PALETTE_8 | 0x225,
    0x0, 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0x0, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_VERTICAL | 0x14, 0x1f4, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xc, 0x1f0, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_VERTICAL | 0x14, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x233
};

static const u16 sGerubossOam_358eac_Frame2[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ea, OBJ_PALETTE_8 | 0x205,
    0xfb, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x205,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x202,
    0xff, 0x1fc, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1ef, OBJ_PALETTE_8 | 0x225,
    0x0, 0x1f7, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x225,
    0x0, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_VERTICAL | 0x14, 0x1f4, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xc, 0x1f0, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0x14, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x213
};

static const u16 sGerubossOam_358df4_Frame1[] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1eb, OBJ_PALETTE_8 | 0x205,
    0x0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x205,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_Y_FLIP | 0x1ed, OBJ_PALETTE_8 | 0x225,
    0xfa, OBJ_Y_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | OBJ_Y_FLIP | 0x3, OBJ_PALETTE_8 | 0x225,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x3, OBJ_PALETTE_8 | 0x224
};

static const u16 sGerubossOam_358df4_Frame2[] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ed, OBJ_PALETTE_8 | 0x205,
    0xff, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf7, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x205,
    0xff, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x7, 0x1f8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    0x7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_Y_FLIP | 0x1eb, OBJ_PALETTE_8 | 0x225,
    0xfa, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x225,
    0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x224
};

const struct FrameData sGerubossOam_358df4[4] = {
    [0] = {
        .pFrame = sGerubossOam_358df4_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sGerubossOam_358df4_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sGerubossOam_358df4_Frame2,
        .timer = 255
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358e14[5] = {
    [0] = {
        .pFrame = sGerubossOam_358df4_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sGerubossOam_358e14_Frame1,
        .timer = 14
    },
    [2] = {
        .pFrame = sGerubossOam_358e14_Frame2,
        .timer = 14
    },
    [3] = {
        .pFrame = sGerubossOam_358e14_Frame1,
        .timer = 14
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358e3c[6] = {
    [0] = {
        .pFrame = sGerubossOam_358df4_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sGerubossOam_358e3c_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sGerubossOam_358e3c_Frame2,
        .timer = 40
    },
    [3] = {
        .pFrame = sGerubossOam_358e3c_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sGerubossOam_358e3c_Frame4,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358e6c[4] = {
    [0] = {
        .pFrame = sGerubossOam_358e6c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sGerubossOam_358e6c_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sGerubossOam_358e6c_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358e8c[4] = {
    [0] = {
        .pFrame = sGerubossOam_358e6c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sGerubossOam_358e6c_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sGerubossOam_358e6c_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358eac[4] = {
    [0] = {
        .pFrame = sGerubossOam_358eac_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sGerubossOam_358eac_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sGerubossOam_358eac_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358ecc[4] = {
    [0] = {
        .pFrame = sGerubossOam_358eac_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sGerubossOam_358eac_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sGerubossOam_358eac_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358eec[5] = {
    [0] = {
        .pFrame = sGerubossOam_358eec_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sGerubossOam_358eec_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sGerubossOam_358eec_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sGerubossOam_358eec_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358f14[5] = {
    [0] = {
        .pFrame = sGerubossOam_358eec_Frame3,
        .timer = 4
    },
    [1] = {
        .pFrame = sGerubossOam_358eec_Frame2,
        .timer = 5
    },
    [2] = {
        .pFrame = sGerubossOam_358eec_Frame1,
        .timer = 5
    },
    [3] = {
        .pFrame = sGerubossOam_358eec_Frame0,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerubossOam_358f3c[5] = {
    [0] = {
        .pFrame = sGerubossOam_358eec_Frame3,
        .timer = 4
    },
    [1] = {
        .pFrame = sGerubossOam_358eec_Frame2,
        .timer = 5
    },
    [2] = {
        .pFrame = sGerubossOam_358eec_Frame1,
        .timer = 5
    },
    [3] = {
        .pFrame = sGerubossOam_358f3c_Frame3,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};
