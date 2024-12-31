#include "data/sprites/sova.h"

const s16 sSova_3516fc[16] = {
    0, 0, 0, 1,
    2, 3, 4, 5,
    6, 7, 8, 9,
    10, 11, 12, SHORT_MAX
};

const u32 sSovaGfx[3 * 512] = INCBIN_U32("data/sprites/sova.gfx");
const u16 sSovaPal[3 * 16] = INCBIN_U16("data/sprites/sova.pal");

static const u16 sSovaOam_CrawlingOnFlatGround_Frame0[] = {
    5,
    0xf8, 0x1f7, OBJ_PALETTE_8 | 0x240,
    0xf8, 0x1, OBJ_PALETTE_8 | 0x241,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xe6, 0x4, OBJ_PALETTE_8 | 0x22e
};

static const u16 sSovaOam_CrawlingOnFlatGround_Frame1[] = {
    5,
    0xf9, 0x1f6, OBJ_PALETTE_8 | 0x260,
    0xf9, 0x1, OBJ_PALETTE_8 | 0x261,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x265,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x203,
    0xe8, 0x1f9, OBJ_PALETTE_8 | 0x22f
};

static const u16 sSovaOam_CrawlingOnFlatGround_Frame2[] = {
    5,
    0xf8, 0x1f6, OBJ_PALETTE_8 | 0x242,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x207,
    0xe6, 0x1fa, OBJ_PALETTE_8 | 0x22f
};

static const u16 sSovaOam_CrawlingOnFlatGround_Frame3[] = {
    5,
    0xf9, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x242,
    0xf9, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x265,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSovaOam_CrawlingOnWall_Frame0[] = {
    6,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x247,
    0x3, 0x0, OBJ_PALETTE_8 | 0x267,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x243,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    0xf8, 0x10, OBJ_PALETTE_8 | 0x212,
    0xf0, 0x8, OBJ_PALETTE_8 | 0x232
};

static const u16 sSovaOam_CrawlingOnWall_Frame1[] = {
    5,
    0xf7, 0x1ff, OBJ_PALETTE_8 | 0x248,
    0x2, 0x1ff, OBJ_PALETTE_8 | 0x268,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x244,
    0xf8, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x213,
    0xf0, 0x8, OBJ_PALETTE_8 | 0x215
};

static const u16 sSovaOam_CrawlingOnWall_Frame2[] = {
    5,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x249,
    0x0, 0x0, OBJ_PALETTE_8 | 0x269,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x243,
    0xf8, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x216,
    0xf1, 0xd, OBJ_PALETTE_8 | 0x235
};

static const u16 sSovaOam_CrawlingOnWall_Frame3[] = {
    6,
    0x1, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x249,
    0xf8, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x269,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x244,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x218,
    0xfa, 0x10, OBJ_PALETTE_8 | 0x21a,
    0xf0, 0x8, OBJ_PALETTE_8 | 0x23a
};

static const u16 sSovaOam_CrawlingOnCeiling_Frame0[] = {
    5,
    0x0, OBJ_Y_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x240,
    0x0, OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x241,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x245,
    0x2, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0x2, 0x4, OBJ_PALETTE_8 | 0x24c
};

static const u16 sSovaOam_CrawlingOnCeiling_Frame1[] = {
    5,
    0xff, OBJ_Y_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x260,
    0xff, OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x261,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x265,
    0x2, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x24d,
    OBJ_SHAPE_VERTICAL | 0x2, 0x4, OBJ_PALETTE_8 | 0x24f
};

static const u16 sSovaOam_CrawlingOnCeiling_Frame2[] = {
    5,
    0x0, OBJ_Y_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x242,
    0x0, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x245,
    0x2, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0x2, 0x4, OBJ_PALETTE_8 | 0x252
};

static const u16 sSovaOam_CrawlingOnCeiling_Frame3[] = {
    5,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x242,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x262,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x265,
    0x2, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x253,
    OBJ_SHAPE_VERTICAL | 0x2, 0x4, OBJ_PALETTE_8 | 0x255
};

static const u16 sSovaOam_CrawlingOnSlope_Frame0[] = {
    6,
    0xf9, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x28d,
    0xf5, 0x1fa, OBJ_PALETTE_8 | 0x240,
    0xfa, 0x4, OBJ_PALETTE_8 | 0x241,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x4, OBJ_PALETTE_8 | 0x27b,
    OBJ_SHAPE_VERTICAL | 0xf0, 0xc, OBJ_PALETTE_8 | 0x282
};

static const u16 sSovaOam_CrawlingOnSlope_Frame1[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x28f,
    0xf6, 0x1fa, OBJ_PALETTE_8 | 0x260,
    0xfb, 0x4, OBJ_PALETTE_8 | 0x261,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x283,
    0xf3, 0xc, OBJ_PALETTE_8 | 0x285,
    0xe8, 0x4, OBJ_PALETTE_8 | 0x2a5
};

static const u16 sSovaOam_CrawlingOnSlope_Frame2[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x28d,
    0xf5, 0x1fa, OBJ_PALETTE_8 | 0x242,
    0xfa, 0x3, OBJ_PALETTE_8 | 0x262,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x286,
    0xe8, 0x4, OBJ_PALETTE_8 | 0x289,
    OBJ_SHAPE_VERTICAL | 0xf0, 0xc, OBJ_PALETTE_8 | 0x288
};

static const u16 sSovaOam_CrawlingOnSlope_Frame3[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x28f,
    0xfb, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x242,
    0xf6, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x262,
    0xf0, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x28b,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fc, OBJ_PALETTE_8 | 0x28a,
    0xe8, 0x4, OBJ_PALETTE_8 | 0x2a9
};

static const u16 sSovaGroundFlameOam_Big_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x297
};

static const u16 sSovaGroundFlameOam_Big_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x299
};

static const u16 sSovaGroundFlameOam_Big_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x29b
};

static const u16 sSovaGroundFlameOam_Big_Frame3[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x29d,
    0xe8, 0x1fb, OBJ_PALETTE_8 | 0x27d
};

static const u16 sSovaGroundFlameOam_Small_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x291,
    0xf8, 0x5, OBJ_PALETTE_8 | 0x2b2
};

static const u16 sSovaGroundFlameOam_Small_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, OBJ_PALETTE_8 | 0x293,
    0xf0, 0x1fd, OBJ_PALETTE_8 | 0x292
};

static const u16 sSovaGroundFlameOam_Small_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fc, OBJ_PALETTE_8 | 0x2b3,
    0xf0, 0x1ff, OBJ_PALETTE_8 | 0x295
};

static const u16 sSovaGroundFlameOam_Small_Frame3[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, OBJ_PALETTE_8 | 0x2b5,
    0xf0, 0x1fb, OBJ_PALETTE_8 | 0x296
};

static const u16 sSovaGroundFlameOam_Disappearing_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x256
};

static const u16 sSovaGroundFlameOam_Disappearing_Frame2[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x257
};

static const u16 sSovaGroundFlameOam_Disappearing_Frame4[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x258
};

static const u16 sSovaGroundFlameOam_Disappearing_Frame6[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x259
};

static const u16 sSovaFallingFlameOam_Falling_Frame0[] = {
    2,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x297,
    0xfe, 0x1fb, OBJ_PALETTE_8 | 0x27e
};

static const u16 sSovaFallingFlameOam_Falling_Frame1[] = {
    2,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x299,
    0xfe, 0x1fb, OBJ_PALETTE_8 | 0x27f
};

static const u16 sSovaFallingFlameOam_Falling_Frame2[] = {
    2,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x29b,
    0xfe, 0x1fc, OBJ_PALETTE_8 | 0x29f
};

static const u16 sSovaFallingFlameOam_Falling_Frame3[] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x29d,
    0xe6, 0x1fb, OBJ_PALETTE_8 | 0x27d,
    0xfe, 0x1fc, OBJ_PALETTE_8 | 0x2bf
};

static const u16 sSovaFallingFlameOam_Exploding_Frame0[] = {
    1,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216
};

static const u16 sSovaFallingFlameOam_Exploding_Frame1[] = {
    7,
    0xec, 0x1f6, OBJ_PALETTE_8 | 0x292,
    0xee, 0x1ff, OBJ_PALETTE_8 | 0x257,
    0xf1, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x20c,
    0xfb, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x284,
    0xe9, 0x1fc, OBJ_PALETTE_8 | 0x295,
    0xf3, 0x1f5, OBJ_PALETTE_8 | 0x205,
    0xfd, 0x1, OBJ_PALETTE_8 | 0x275
};

static const u16 sSovaFallingFlameOam_Exploding_Frame2[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x208,
    0xef, 0x1f4, OBJ_PALETTE_8 | 0x292,
    0xec, 0x1ff, OBJ_PALETTE_8 | 0x257,
    0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x259,
    0xfb, OBJ_Y_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x284,
    0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x2a9,
    0xf0, 0x1, OBJ_PALETTE_8 | 0x279,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f9, OBJ_PALETTE_8 | 0x256
};

static const u16 sSovaFallingFlameOam_Exploding_Frame3[] = {
    10,
    0xed, 0x1f2, OBJ_PALETTE_8 | 0x2a9,
    0xea, 0x1f1, OBJ_PALETTE_8 | 0x295,
    0xea, 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_Y_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x270,
    0xf3, OBJ_X_FLIP | OBJ_Y_FLIP | 0x3, OBJ_PALETTE_8 | 0x259,
    0xed, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x2a9,
    0xf5, 0x1f9, OBJ_PALETTE_8 | 0x208,
    0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x279,
    0xe6, 0x1f9, OBJ_PALETTE_8 | 0x275,
    0xdf, 0x1fb, OBJ_PALETTE_8 | 0x215
};

static const u16 sSovaFallingFlameOam_Exploding_Frame4[] = {
    7,
    0xdf, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x259,
    0xec, 0x1f7, OBJ_PALETTE_8 | 0x295,
    0xed, 0x4, OBJ_PALETTE_8 | 0x25d,
    0xf0, 0x1f5, OBJ_PALETTE_8 | 0x270,
    0xef, 0x1f2, OBJ_PALETTE_8 | 0x256,
    0xdc, 0x1f8, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f9, OBJ_PALETTE_8 | 0x259
};

static const u16 sSovaGroundFlameOam_Disappearing_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x20a
};

const struct FrameData sSovaOam_CrawlingOnFlatGround[5] = {
    [0] = {
        .pFrame = sSovaOam_CrawlingOnFlatGround_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSovaOam_CrawlingOnFlatGround_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSovaOam_CrawlingOnFlatGround_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSovaOam_CrawlingOnFlatGround_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSovaOam_CrawlingOnWall[5] = {
    [0] = {
        .pFrame = sSovaOam_CrawlingOnWall_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSovaOam_CrawlingOnWall_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSovaOam_CrawlingOnWall_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSovaOam_CrawlingOnWall_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSovaOam_CrawlingOnCeiling[5] = {
    [0] = {
        .pFrame = sSovaOam_CrawlingOnCeiling_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSovaOam_CrawlingOnCeiling_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSovaOam_CrawlingOnCeiling_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSovaOam_CrawlingOnCeiling_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSovaOam_CrawlingOnSlope[5] = {
    [0] = {
        .pFrame = sSovaOam_CrawlingOnSlope_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSovaOam_CrawlingOnSlope_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSovaOam_CrawlingOnSlope_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSovaOam_CrawlingOnSlope_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSovaGroundFlameOam_Big[5] = {
    [0] = {
        .pFrame = sSovaGroundFlameOam_Big_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSovaGroundFlameOam_Big_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSovaGroundFlameOam_Big_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSovaGroundFlameOam_Big_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSovaGroundFlameOam_Small[5] = {
    [0] = {
        .pFrame = sSovaGroundFlameOam_Small_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSovaGroundFlameOam_Small_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSovaGroundFlameOam_Small_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSovaGroundFlameOam_Small_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSovaGroundFlameOam_Disappearing[9] = {
    [0] = {
        .pFrame = sSovaGroundFlameOam_Disappearing_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSovaGroundFlameOam_Disappearing_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sSovaGroundFlameOam_Disappearing_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSovaGroundFlameOam_Disappearing_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sSovaGroundFlameOam_Disappearing_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sSovaGroundFlameOam_Disappearing_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sSovaGroundFlameOam_Disappearing_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sSovaGroundFlameOam_Disappearing_Frame1,
        .timer = 1
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSovaFallingFlameOam_Falling[5] = {
    [0] = {
        .pFrame = sSovaFallingFlameOam_Falling_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSovaFallingFlameOam_Falling_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sSovaFallingFlameOam_Falling_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sSovaFallingFlameOam_Falling_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSovaFallingFlameOam_Exploding[6] = {
    [0] = {
        .pFrame = sSovaFallingFlameOam_Exploding_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSovaFallingFlameOam_Exploding_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sSovaFallingFlameOam_Exploding_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sSovaFallingFlameOam_Exploding_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sSovaFallingFlameOam_Exploding_Frame4,
        .timer = 4
    },
    [5] = FRAME_DATA_TERMINATOR
};
