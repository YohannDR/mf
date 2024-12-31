#include "data/sprites/bull.h"
#include "macros.h"

const u32 sBullGfx[512 * 1] = INCBIN_U32("data/sprites/bull.gfx");
const u16 sBullPal[16 * 1] = INCBIN_U16("data/sprites/bull.pal");

static const u16 sBullOam_Frame0[] = {
    4,
    0xed, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x200,
    0xfd, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x202,
    0xf5, 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xfd, 0x1f4, OBJ_PALETTE_8 | 0x205
};

static const u16 sBullOam_Frame1[] = {
    4,
    0xee, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xfe, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x208,
    0xf6, 0x1f4, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_VERTICAL | 0xfe, 0x1f4, OBJ_PALETTE_8 | 0x20a
};

static const u16 sBullOam_Frame3[] = {
    5,
    0xec, 0x1fc, OBJ_PALETTE_8 | 0x22b,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1fc, OBJ_PALETTE_8 | 0x20b,
    0xfc, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x20d,
    0xf4, 0x1f4, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sBullSmokeOam_Frame0[] = {
    4,
    0xef, 0x1ee, OBJ_PALETTE_8 | 0x237,
    0xf1, 0xa, OBJ_PALETTE_8 | 0x237,
    0x9, 0x1f1, OBJ_PALETTE_8 | 0x237,
    0x9, 0x5, OBJ_PALETTE_8 | 0x237
};

static const u16 sBullSmokeOam_Frame1[] = {
    8,
    0xe9, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_8 | 0x215,
    0xef, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1ee, OBJ_PALETTE_8 | 0x210,
    0xeb, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x215,
    0xf1, OBJ_Y_FLIP | 0xa, OBJ_PALETTE_8 | 0x210,
    0x7, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x215,
    0x9, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x210,
    0x7, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x215,
    0x9, 0x5, OBJ_PALETTE_8 | 0x210
};

static const u16 sBullSmokeOam_Frame2[] = {
    8,
    0xe6, OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_8 | 0x211,
    0xef, 0x1ee, OBJ_PALETTE_8 | 0x230,
    0xe8, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x211,
    0xf1, OBJ_X_FLIP | 0xa, OBJ_PALETTE_8 | 0x230,
    0xa, OBJ_SIZE_16x16 | 0x1e5, OBJ_PALETTE_8 | 0x211,
    0x9, OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x230,
    0xa, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x211,
    0x9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x230
};

static const u16 sBullSmokeOam_Frame3[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1db, OBJ_PALETTE_8 | 0x213,
    0xe0, OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_8 | 0x213,
    0x10, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x213,
    0x10, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x213
};

static const u16 sBullSmokeOam_Frame4[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1db, OBJ_PALETTE_8 | 0x215,
    0xde, OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_8 | 0x215,
    0xc, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x215,
    0xc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x215
};

static const u16 sBullSmokeOam_Frame5[] = {
    4,
    0xdc, 0x1df, OBJ_PALETTE_8 | 0x237,
    0xde, 0x19, OBJ_PALETTE_8 | 0x237,
    0xc, 0x1e2, OBJ_PALETTE_8 | 0x237,
    0xc, 0x14, OBJ_PALETTE_8 | 0x237
};

static const u16 sBullSmokeOam_Frame6[] = {
    4,
    0xda, 0x1df, OBJ_PALETTE_8 | 0x217,
    0xdc, 0x19, OBJ_PALETTE_8 | 0x217,
    0x9, 0x1e2, OBJ_PALETTE_8 | 0x217,
    0x9, 0x14, OBJ_PALETTE_8 | 0x217
};

static const u16 sBullSmokeOam_Frame7[] = {
    4,
    0xd9, 0x1df, OBJ_PALETTE_8 | 0x218,
    0xdb, 0x19, OBJ_PALETTE_8 | 0x218,
    0x9, 0x1e2, OBJ_PALETTE_8 | 0x218,
    0x9, 0x14, OBJ_PALETTE_8 | 0x218
};

const struct FrameData sBullOam[5] = {
    [0] = {
        .pFrame = sBullOam_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sBullOam_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sBullOam_Frame0,
        .timer = 8
    },
    [3] = {
        .pFrame = sBullOam_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBullSmokeOam[9] = {
    [0] = {
        .pFrame = sBullSmokeOam_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sBullSmokeOam_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sBullSmokeOam_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sBullSmokeOam_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBullSmokeOam_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sBullSmokeOam_Frame5,
        .timer = 7
    },
    [6] = {
        .pFrame = sBullSmokeOam_Frame6,
        .timer = 5
    },
    [7] = {
        .pFrame = sBullSmokeOam_Frame7,
        .timer = 5
    },
    [8] = FRAME_DATA_TERMINATOR
};
