#include "data/sprites/halzyn.h"
#include "macros.h"

const s16 sHalzynSwingingXVelocity[16] = {
    0, 0, 1, 2,
    3, 4, 5, 6,
    7, 6, 5, 4,
    3, 2, 1, 0
};

const s16 sHalzynSwingingYVelocity[16] = {
     0,  1,  2,  3,
     4,  3,  2,  1,
    -1, -2, -3, -4,
    -3, -2, -1,  0
};

const s16 sHalzynLungingVelocity[28] = {
    2, 4, 6, 8, 12, 14, 16, 18, 20, 22, 24, SHORT_MAX,
    22, 20, 18, 16, 14, 12, 8, 7, 6, 5, 4, 3, 2, 1, 0, SHORT_MAX
};

const u32 sHalzynGfx[1024] = INCBIN_U32("data/sprites/halzyn.gfx");
const u16 sHalzynPal[16 * 2] = INCBIN_U16("data/sprites/halzyn.pal");

static const u16 sOam_2ec964[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf0, 0x1f0, OBJ_PALETTE_8 | 0x250,
    0xf0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2ec978[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_SIZE_16x32 | 0x1ef, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2ec980[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_SIZE_16x32 | 0x1ed, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2ec988[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_SIZE_16x32 | 0x1ec, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2ec990[OAM_DATA_SIZE(3)] = {
    3,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xef, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x250,
    0xef, 0x1f0, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2ec9a4[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x250,
    0xf0, 0x1f0, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2ec9b8[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf1, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x250,
    0xf1, 0x1f0, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2ec9cc[OAM_DATA_SIZE(3)] = {
    3,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf2, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x250,
    0xf2, 0x1f0, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2ec9e0[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_SIZE_16x32 | 0x1ec, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2ec9e8[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_SIZE_16x32 | 0x1e7, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2ec9f6[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f4, OBJ_PALETTE_8 | 0x244
};

static const u16 sOam_2eca04[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xe2, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1f4, OBJ_PALETTE_8 | 0x209
};

static const u16 sOam_2eca12[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xf3, 0x1f3, OBJ_PALETTE_8 | 0x250,
    0xf3, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2eca26[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xf2, 0x1f2, OBJ_PALETTE_8 | 0x250,
    0xf2, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2eca3a[OAM_DATA_SIZE(5)] = {
    5,
    0xf8, 0x1f8, OBJ_PALETTE_8 | 0x26c,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x26c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x24c,
    0xf2, 0x1f3, OBJ_PALETTE_8 | 0x250,
    0xf2, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2eca5a[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x24e,
    0xf3, 0x1f3, OBJ_PALETTE_8 | 0x250,
    0xf3, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2eca6e[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_SIZE_16x32 | 0x1f1, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2eca76[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_SIZE_16x32 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2eca7e[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf1, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x250,
    0xf1, 0x1f0, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2eca92[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1f9, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_SIZE_16x32 | 0x1e9, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2ecaa0[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_SIZE_16x32 | 0x1e8, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2ecaae[OAM_DATA_SIZE(3)] = {
    3,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf4, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x250,
    0xf4, 0x1f3, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2ecac2[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf2, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x250,
    0xf2, 0x1f3, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2ecad6[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xf0, 0x1f0, OBJ_PALETTE_8 | 0x250,
    0xf0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x270
};

static const u16 sOam_2ecaea[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f8, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_PALETTE_8 | 0x210,
    0xf9, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x210,
    0xf1, 0x1f0, OBJ_PALETTE_8 | 0x270,
    0xf1, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x251
};

static const u16 sOam_2ecb0a[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x230,
    0xf0, 0x1f0, OBJ_PALETTE_8 | 0x251,
    0xf0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2ecb24[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x230,
    0xf0, 0x1f0, OBJ_PALETTE_8 | 0x250,
    0xf0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x270
};

static const u16 sOam_2ecb3e[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x230,
    0xf0, 0x1f0, OBJ_PALETTE_8 | 0x270,
    0xf0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x251
};

static const u16 sOam_2ecb58[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf0, 0x1f0, OBJ_PALETTE_8 | 0x251,
    0xf0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x230
};

static const u16 sOam_2ecb72[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x212,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2ecb86[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x210,
    0xea, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x252,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x252,
    0xf8, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x210
};

static const u16 sOam_2ecba6[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x230,
    0xe9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x214
};

static const u16 sOam_2ecbc0[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xe9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x212,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2ecbd4[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x216,
    0xea, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x252,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x252,
    0xf8, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x216
};

static const u16 sOam_2ecbf4[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f8, OBJ_PALETTE_8 | 0x24c,
    0xf9, 0x0, OBJ_PALETTE_8 | 0x26d,
    0xf9, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x26d,
    0xe9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x214
};

static const u16 sOam_2ecc14[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xed, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x218,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x218
};

static const u16 sOam_2ecc28[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x210,
    0xec, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x258,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x258,
    0xf8, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x210
};

static const u16 sOam_2ecc48[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_PALETTE_8 | 0x210,
    0xed, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21a,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x21a,
    0xf9, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x210
};

static const u16 sOam_2ecc68[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x230,
    0xed, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x218,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x218
};

static const u16 sOam_2ecc82[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x230,
    0xec, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x258,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x258
};

static const u16 sOam_2ecc9c[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xed, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21a,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x21a
};

static const u16 sOam_2eccb0[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x4, OBJ_PALETTE_8 | 0x271,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c,
    0xfa, 0x1fa, OBJ_PALETTE_8 | 0x271,
    0xf1, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x25a,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2eccd0[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x4, OBJ_PALETTE_8 | 0x271,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c,
    0xfa, 0x1fa, OBJ_PALETTE_8 | 0x271,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x252,
    0xf0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x25c
};

static const u16 sOam_2eccf0[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x4, OBJ_PALETTE_8 | 0x271,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c,
    0xfa, 0x1fa, OBJ_PALETTE_8 | 0x271,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x214,
    0xf1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x25c
};

static const u16 sOam_2ecd10[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x3, OBJ_PALETTE_8 | 0x271,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x256,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x271,
    0xf5, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x254,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2ecd30[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x3, OBJ_PALETTE_8 | 0x271,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x256,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x271,
    0xf6, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x254,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x252
};

static const u16 sOam_2ecd50[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x3, OBJ_PALETTE_8 | 0x271,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x256,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x271,
    0xf6, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x254,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x214
};

static const u16 sOam_2ecd70[OAM_DATA_SIZE(7)] = {
    7,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x236,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    0xee, 0x1f1, OBJ_PALETTE_8 | 0x251,
    0xee, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x251,
    0xfa, 0x1f8, OBJ_PALETTE_8 | 0x237,
    0xfa, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x237
};

static const u16 sOam_2ecd9c[OAM_DATA_SIZE(7)] = {
    7,
    0xe9, 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xe9, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x236,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    0xef, 0x1f1, OBJ_PALETTE_8 | 0x250,
    0xef, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x250,
    0xfa, 0x1f8, OBJ_PALETTE_8 | 0x237,
    0xfa, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x237
};

static const u16 sOam_2ecdc8[OAM_DATA_SIZE(7)] = {
    7,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x236,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    0xee, 0x1f1, OBJ_PALETTE_8 | 0x251,
    0xee, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x251,
    0xf6, 0x1f6, OBJ_PALETTE_8 | 0x271,
    0xf6, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x271
};

static const u16 sOam_2ecdf4[OAM_DATA_SIZE(7)] = {
    7,
    0xe9, 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xe9, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x236,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    0xef, 0x1f1, OBJ_PALETTE_8 | 0x250,
    0xef, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x250,
    0xf8, 0x1f7, OBJ_PALETTE_8 | 0x271,
    0xf8, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x271
};

static const u16 sOam_2ece20[OAM_DATA_SIZE(7)] = {
    7,
    0xe6, 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xe6, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x236,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x25e,
    0xf9, 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf9, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x237,
    0xee, 0x1f1, OBJ_PALETTE_8 | 0x251,
    0xee, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x251
};

static const u16 sOam_2ece4c[OAM_DATA_SIZE(7)] = {
    7,
    0xe7, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xe7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x236,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x25e,
    0xf9, 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf9, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x237,
    0xee, 0x1f1, OBJ_PALETTE_8 | 0x251,
    0xee, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x251
};

static const u16 sOam_2ece78[OAM_DATA_SIZE(7)] = {
    7,
    0xe7, 0x1f7, OBJ_PALETTE_8 | 0x236,
    0xe7, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x236,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x25e,
    0xef, 0x1f1, OBJ_PALETTE_8 | 0x251,
    0xef, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x251,
    0xf7, 0x3, OBJ_PALETTE_8 | 0x271,
    0xf7, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x271
};

static const u16 sOam_2ecea4[OAM_DATA_SIZE(7)] = {
    7,
    0xe7, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xe7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x236,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x25e,
    0xee, 0x1f1, OBJ_PALETTE_8 | 0x251,
    0xee, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x251,
    0xf8, 0x3, OBJ_PALETTE_8 | 0x271,
    0xf8, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x271
};

const struct FrameData sHalzynOam_Swinging[5] = {
    [0] = {
        .pFrame = sOam_2ec964,
        .timer = 15,
    },
    [1] = {
        .pFrame = sOam_2ec964,
        .timer = 11,
    },
    [2] = {
        .pFrame = sOam_2ec964,
        .timer = 13,
    },
    [3] = {
        .pFrame = sOam_2ec964,
        .timer = 11,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynWingOam_Idle[5] = {
    [0] = {
        .pFrame = sOam_2ec978,
        .timer = 15,
    },
    [1] = {
        .pFrame = sOam_2ec980,
        .timer = 11,
    },
    [2] = {
        .pFrame = sOam_2ec988,
        .timer = 13,
    },
    [3] = {
        .pFrame = sOam_2ec980,
        .timer = 11,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_FlyingUp[7] = {
    [0] = {
        .pFrame = sOam_2ec990,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2ec9a4,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2ec9b8,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2ec9cc,
        .timer = 4,
    },
    [4] = {
        .pFrame = sOam_2ec9b8,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2ec9a4,
        .timer = 2,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynWingOam_Flapping[7] = {
    [0] = {
        .pFrame = sOam_2ec9e0,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2ec9e8,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2ec9f6,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2eca04,
        .timer = 4,
    },
    [4] = {
        .pFrame = sOam_2ec9f6,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2ec9e8,
        .timer = 2,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_Lunging[8] = {
    [0] = {
        .pFrame = sOam_2eca12,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2eca26,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2eca12,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2eca3a,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2eca26,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2ec964,
        .timer = 20,
    },
    [6] = {
        .pFrame = sOam_2eca5a,
        .timer = 255,
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynWingOam_Lunging[8] = {
    [0] = {
        .pFrame = sOam_2eca6e,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2ec978,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2eca6e,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2eca76,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2ec978,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2ec978,
        .timer = 20,
    },
    [6] = {
        .pFrame = sOam_2eca76,
        .timer = 255,
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed010[7] = {
    [0] = {
        .pFrame = sOam_2ec964,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2ec964,
        .timer = 1,
    },
    [2] = {
        .pFrame = sOam_2eca7e,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2eca7e,
        .timer = 1,
    },
    [4] = {
        .pFrame = sOam_2eca7e,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2ec964,
        .timer = 1,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed048[7] = {
    [0] = {
        .pFrame = sOam_2ec978,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2ec980,
        .timer = 1,
    },
    [2] = {
        .pFrame = sOam_2eca92,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2ecaa0,
        .timer = 1,
    },
    [4] = {
        .pFrame = sOam_2eca92,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2ec980,
        .timer = 1,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_Landing[4] = {
    [0] = {
        .pFrame = sOam_2ec964,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2ecaae,
        .timer = 4,
    },
    [2] = {
        .pFrame = sOam_2ecac2,
        .timer = 255,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynWingOam_Landing[4] = {
    [0] = {
        .pFrame = sOam_2ec978,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2eca76,
        .timer = 4,
    },
    [2] = {
        .pFrame = sOam_2eca76,
        .timer = 255,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed0c0[4] = {
    [0] = {
        .pFrame = sOam_2ecad6,
        .timer = 7,
    },
    [1] = {
        .pFrame = sOam_2ecaea,
        .timer = 7,
    },
    [2] = {
        .pFrame = sOam_2ecb0a,
        .timer = 7,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed0e0[4] = {
    [0] = {
        .pFrame = sOam_2ecad6,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2ecaea,
        .timer = 4,
    },
    [2] = {
        .pFrame = sOam_2ecb0a,
        .timer = 4,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed100[4] = {
    [0] = {
        .pFrame = sOam_2ecb24,
        .timer = 7,
    },
    [1] = {
        .pFrame = sOam_2ecb3e,
        .timer = 7,
    },
    [2] = {
        .pFrame = sOam_2ecb58,
        .timer = 7,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed120[10] = {
    [0] = {
        .pFrame = sOam_2ecb72,
        .timer = 12,
    },
    [1] = {
        .pFrame = sOam_2ecb86,
        .timer = 12,
    },
    [2] = {
        .pFrame = sOam_2ecba6,
        .timer = 12,
    },
    [3] = {
        .pFrame = sOam_2ecb72,
        .timer = 12,
    },
    [4] = {
        .pFrame = sOam_2ecb86,
        .timer = 12,
    },
    [5] = {
        .pFrame = sOam_2ecba6,
        .timer = 12,
    },
    [6] = {
        .pFrame = sOam_2ecbc0,
        .timer = 8,
    },
    [7] = {
        .pFrame = sOam_2ecbd4,
        .timer = 8,
    },
    [8] = {
        .pFrame = sOam_2ecbf4,
        .timer = 8,
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed170[4] = {
    [0] = {
        .pFrame = sOam_2ecbc0,
        .timer = 8,
    },
    [1] = {
        .pFrame = sOam_2ecbd4,
        .timer = 8,
    },
    [2] = {
        .pFrame = sOam_2ecbf4,
        .timer = 8,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed190[7] = {
    [0] = {
        .pFrame = sOam_2ecc14,
        .timer = 9,
    },
    [1] = {
        .pFrame = sOam_2ecc28,
        .timer = 9,
    },
    [2] = {
        .pFrame = sOam_2ecc48,
        .timer = 9,
    },
    [3] = {
        .pFrame = sOam_2ecc68,
        .timer = 9,
    },
    [4] = {
        .pFrame = sOam_2ecc82,
        .timer = 9,
    },
    [5] = {
        .pFrame = sOam_2ecc9c,
        .timer = 9,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed1c8[4] = {
    [0] = {
        .pFrame = sOam_2eccb0,
        .timer = 3,
    },
    [1] = {
        .pFrame = sOam_2eccd0,
        .timer = 3,
    },
    [2] = {
        .pFrame = sOam_2eccf0,
        .timer = 3,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed1e8[4] = {
    [0] = {
        .pFrame = sOam_2ecd10,
        .timer = 3,
    },
    [1] = {
        .pFrame = sOam_2ecd30,
        .timer = 3,
    },
    [2] = {
        .pFrame = sOam_2ecd50,
        .timer = 3,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed208[3] = {
    [0] = {
        .pFrame = sOam_2ecd70,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2ecd9c,
        .timer = 16,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed220[3] = {
    [0] = {
        .pFrame = sOam_2ecdc8,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2ecdf4,
        .timer = 255,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed238[10] = {
    [0] = {
        .pFrame = sOam_2ec964,
        .timer = 20,
    },
    [1] = {
        .pFrame = sOam_2ece20,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2ece4c,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2ece20,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2ece4c,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2ece20,
        .timer = 2,
    },
    [6] = {
        .pFrame = sOam_2ece4c,
        .timer = 2,
    },
    [7] = {
        .pFrame = sOam_2ece20,
        .timer = 2,
    },
    [8] = {
        .pFrame = sOam_2ece4c,
        .timer = 10,
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed288[6] = {
    [0] = {
        .pFrame = sOam_2ece78,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2ecea4,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2ece78,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2ecea4,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2ece78,
        .timer = 255,
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed2b8[2] = {
    [0] = {
        .pFrame = sOam_2ec964,
        .timer = 255,
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynWingOam_Falling[2] = {
    [0] = {
        .pFrame = sOam_2ec988,
        .timer = 255,
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHalzynOam_2ed2d8[2] = {
    [0] = {
        .pFrame = sOam_2eca04,
        .timer = 255,
    },
    [1] = FRAME_DATA_TERMINATOR
};
