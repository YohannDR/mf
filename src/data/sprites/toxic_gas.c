#include "data/sprites/toxic_gas.h"

const u32 sToxicGasGfx[2 * 512] = INCBIN_U32("data/sprites/toxic_gas.gfx");
const u16 sToxicGasPal[2 * 16] = INCBIN_U16("data/sprites/toxic_gas.pal");

static const u16 sToxicGasOam_3364a8[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_2 | 0x10
};

static const u16 sToxicGasOam_3364b0[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_2 | 0x14
};

static const u16 sToxicGasOam_3364b8[] = {
    1,
    0xf8, 0x1f8, OBJ_PALETTE_8 | 0x274
};

static const u16 sToxicGasOam_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x200
};

static const u16 sToxicGasOam_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sToxicGasOam_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x208
};

static const u16 sToxicGasOam_Frame3[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x20c
};

static const u16 sToxicGasExplosionOam_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x1f5, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_8x32 | 0x5, OBJ_PALETTE_8 | 0x212
};

static const u16 sToxicGasExplosionOam_Frame1[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_SIZE_16x32 | 0x1f3, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_SIZE_8x32 | 0x3, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0x1eb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_8x32 | 0x1fb, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_SIZE_16x32 | 0x1fd, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_SIZE_8x32 | 0xd, OBJ_PALETTE_8 | 0x212
};

static const u16 sToxicGasExplosionOam_Frame2[] = {
    16,
    OBJ_SHAPE_VERTICAL | 0xea, OBJ_SIZE_16x32 | 0x1df, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xea, OBJ_SIZE_8x32 | 0x1ef, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1ed, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x1fd, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x1fd, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_8x32 | 0xd, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xeb, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xeb, OBJ_SIZE_8x32 | 0x18, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xfc, OBJ_SIZE_16x32 | 0x7, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xfc, OBJ_SIZE_8x32 | 0x17, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xfd, OBJ_SIZE_16x32 | 0x1e0, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xfd, OBJ_SIZE_8x32 | 0x1f0, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_SIZE_16x32 | 0x1ee, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_SIZE_8x32 | 0x1fe, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_SIZE_16x32 | 0x1ff, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_SIZE_8x32 | 0xf, OBJ_PALETTE_8 | 0x212
};

static const u16 sToxicGasExplosionOam_Frame3[] = {
    16,
    OBJ_SHAPE_VERTICAL | 0x1, OBJ_SIZE_16x32 | 0x1df, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0x1, OBJ_SIZE_8x32 | 0x1ef, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xb, OBJ_SIZE_16x32 | 0x1f2, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xb, OBJ_SIZE_8x32 | 0x2, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0x6, OBJ_SIZE_16x32 | 0x3, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0x6, OBJ_SIZE_8x32 | 0x13, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_16x32 | 0x1db, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_8x32 | 0x1eb, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xdc, OBJ_SIZE_16x32 | 0x1e3, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xdc, OBJ_SIZE_8x32 | 0x1f3, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xd6, OBJ_SIZE_16x32 | 0x1f5, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xd6, OBJ_SIZE_8x32 | 0x5, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x6, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_8x32 | 0x16, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0xb, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_8x32 | 0x1b, OBJ_PALETTE_8 | 0x215
};

static const u16 sToxicGasExplosionOam_Frame4[] = {
    20,
    OBJ_SHAPE_VERTICAL | 0xd, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1e9, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xd, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1e1, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xfe, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1e2, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xfe, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1da, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1da, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_8x32 | 0x1ea, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xd9, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xd9, OBJ_SIZE_8x32 | 0x1f4, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_16x32 | 0x9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_8x32 | 0x19, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_SIZE_16x32 | 0x13, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_SIZE_8x32 | 0x23, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_16x32 | 0xf, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_8x32 | 0x1f, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xf, OBJ_SIZE_16x32 | 0x7, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xf, OBJ_SIZE_8x32 | 0x17, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xd3, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xd3, OBJ_SIZE_8x32 | 0x6, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0x13, OBJ_SIZE_16x32 | 0x1f5, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0x13, OBJ_SIZE_8x32 | 0x5, OBJ_PALETTE_8 | 0x218
};

static const u16 sToxicGasExplosionOam_Frame5[] = {
    24,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_SIZE_16x32 | 0x1d6, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_SIZE_8x32 | 0x1e6, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xd7, OBJ_SIZE_16x32 | 0x1dd, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xd7, OBJ_SIZE_8x32 | 0x1ed, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xd6, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x14, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xd6, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0xc, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x17, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_8x32 | 0x27, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_16x32 | 0x17, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_8x32 | 0x27, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xe, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x15, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xe, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0xd, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xd, OBJ_SIZE_16x32 | 0x1dc, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xd, OBJ_SIZE_8x32 | 0x1ec, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xfd, OBJ_SIZE_16x32 | 0x1d4, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xfd, OBJ_SIZE_8x32 | 0x1e4, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xd2, OBJ_SIZE_16x32 | 0x1eb, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xd2, OBJ_SIZE_8x32 | 0x1fb, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xd3, OBJ_SIZE_16x32 | 0x1ff, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xd3, OBJ_SIZE_8x32 | 0xf, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0x16, OBJ_SIZE_16x32 | 0x1eb, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0x16, OBJ_SIZE_8x32 | 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0x15, OBJ_SIZE_16x32 | 0x1fd, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0x15, OBJ_SIZE_8x32 | 0xd, OBJ_PALETTE_8 | 0x21b
};

static const u16 sToxicGasExplosionOam_Frame6[] = {
    16,
    0xec, OBJ_SIZE_16x16 | 0x1d3, OBJ_PALETTE_8 | 0x25c,
    0xdc, OBJ_SIZE_16x16 | 0x1db, OBJ_PALETTE_8 | 0x25c,
    0xce, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x25c,
    0xcf, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x25c,
    0xe6, OBJ_SIZE_16x16 | 0x1f, OBJ_PALETTE_8 | 0x25c,
    0xfd, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x25c,
    0xc, OBJ_SIZE_16x16 | 0x1b, OBJ_PALETTE_8 | 0x25c,
    0x1f, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x25c,
    0x20, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x25c,
    0xfd, OBJ_SIZE_16x16 | 0x1d1, OBJ_PALETTE_8 | 0x25c,
    0x16, OBJ_SIZE_16x16 | 0x1dd, OBJ_PALETTE_8 | 0x25c,
    0xd7, OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_8 | 0x25c,
    0xd2, OBJ_SIZE_16x16 | 0x1e5, OBJ_PALETTE_8 | 0x25c,
    0x16, OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x25c,
    0xb, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x25c,
    0xee, OBJ_SIZE_16x16 | 0x1f, OBJ_PALETTE_8 | 0x25e
};

static const u16 sToxicGasExplosionOam_Frame7[] = {
    10,
    0x1e, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_8 | 0x25e,
    0xed, OBJ_SIZE_16x16 | 0x23, OBJ_PALETTE_8 | 0x25c,
    0xda, OBJ_SIZE_16x16 | 0x1d5, OBJ_PALETTE_8 | 0x219,
    0xf4, OBJ_SIZE_16x16 | 0x1d1, OBJ_PALETTE_8 | 0x21a,
    0xca, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x219,
    0xd, OBJ_SIZE_16x16 | 0x1d6, OBJ_PALETTE_8 | 0x239,
    0xc9, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21a,
    0xd9, OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x21a,
    0xc, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x23a,
    0x1d, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x23a
};

static const u16 sToxicGasExplosionOam_Frame8[] = {
    6,
    0x1f, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x25c,
    0xd5, 0x1da, OBJ_PALETTE_8 | 0x25c,
    0xd8, 0x1d, OBJ_PALETTE_8 | 0x25d,
    0x15, 0x1f, OBJ_PALETTE_8 | 0x27d,
    0xeb, 0x2d, OBJ_PALETTE_8 | 0x25d,
    0xfb, 0x2a, OBJ_PALETTE_8 | 0x27d
};

static const u16 sToxicGasExplosionOam_Frame9[] = {
    6,
    0x1c, 0x1ef, OBJ_PALETTE_8 | 0x27c,
    0x2a, 0x1e7, OBJ_PALETTE_8 | 0x27d,
    0x1d, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1e0, OBJ_PALETTE_8 | 0x27d,
    0xe1, OBJ_Y_FLIP | 0x2e, OBJ_PALETTE_8 | 0x25b,
    0xf0, 0x35, OBJ_PALETTE_8 | 0x25b,
    0xfd, 0x2b, OBJ_PALETTE_8 | 0x27d
};

const struct FrameData sToxicGasExplosionOam[11] = {
    [0] = {
        .pFrame = sToxicGasExplosionOam_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sToxicGasExplosionOam_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sToxicGasExplosionOam_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sToxicGasExplosionOam_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sToxicGasExplosionOam_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sToxicGasExplosionOam_Frame5,
        .timer = 5
    },
    [6] = {
        .pFrame = sToxicGasExplosionOam_Frame6,
        .timer = 5
    },
    [7] = {
        .pFrame = sToxicGasExplosionOam_Frame7,
        .timer = 5
    },
    [8] = {
        .pFrame = sToxicGasExplosionOam_Frame8,
        .timer = 5
    },
    [9] = {
        .pFrame = sToxicGasExplosionOam_Frame9,
        .timer = 5
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sToxicGasOam[5] = {
    [0] = {
        .pFrame = sToxicGasOam_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sToxicGasOam_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sToxicGasOam_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sToxicGasOam_Frame3,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};
