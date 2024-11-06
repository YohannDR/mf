#include "data/sprites/sidehopper.h"

const s16 sSidehopperBigHopVelocity[10] = {
    -8, -16, -16, -8,
    -4, 0, 4, 8,
    16, 16
};

const s16 sSidehopperLittleHopVelocity[10] = {
    -4, -8, -4, -2,
    0, 4, 8, 16,
    16, 16
};

const u32 sSidehopperGfx[512 * 1] = INCBIN_U32("data/sprites/sidehopper.gfx");
const u16 sSidehopperPal[16 * 1] = INCBIN_U16("data/sprites/sidehopper.pal");

static const u16 sSidehopperOam_31aca0_Frame0[] = {
    10,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf9, 0x1f8, OBJ_PALETTE_8 | 0x225,
    0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x225,
    0xf0, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xe8, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x204,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x20a,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x204,
    0xec, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSidehopperOam_31aca0_Frame1[] = {
    10,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf8, 0x1f8, OBJ_PALETTE_8 | 0x225,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x225,
    0xf1, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xe9, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x202,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x20d,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x202,
    0xec, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20d
};

static const u16 sSidehopperOam_31aca0_Frame2[] = {
    10,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf7, 0x1f8, OBJ_PALETTE_8 | 0x225,
    0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x225,
    0xf1, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xea, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x222,
    0xec, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x20a,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x222,
    0xec, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSidehopperOam_31ad10_Frame1[] = {
    10,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xfb, 0x1f8, OBJ_PALETTE_8 | 0x225,
    0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x225,
    0xf3, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x202,
    0xea, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x202,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    0xec, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20d
};

static const u16 sSidehopperOam_31ad10_Frame2[] = {
    10,
    0xed, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xfd, 0x1f8, OBJ_PALETTE_8 | 0x225,
    0xfd, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x225,
    0xf4, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x222,
    0xeb, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    0xee, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x222,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    0xee, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSidehopperOam_31ad30_Frame0[] = {
    12,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xeb, 0x1f8, OBJ_PALETTE_8 | 0x225,
    0xeb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x225,
    0xe7, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xea, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xfa, 0x1f3, OBJ_PALETTE_8 | 0x20e,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x20b,
    0xfa, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20e,
    0x4, 0x1f5, OBJ_PALETTE_8 | 0x22d,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f1, OBJ_PALETTE_8 | 0x213,
    0x4, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x22d,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x213
};

static const u16 sSidehopperOam_31ad30_Frame1[] = {
    12,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xeb, 0x1f8, OBJ_PALETTE_8 | 0x225,
    0xeb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x225,
    0xe7, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xea, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xfa, 0x1f3, OBJ_PALETTE_8 | 0x20e,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x20b,
    0xfa, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1f5, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f1, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_VERTICAL | 0x4, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x231
};

static const u16 sSidehopperOam_31ad30_Frame2[] = {
    12,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xeb, 0x1f8, OBJ_PALETTE_8 | 0x225,
    0xeb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x225,
    0xe7, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xea, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xfa, 0x1f3, OBJ_PALETTE_8 | 0x20e,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x20b,
    0xfa, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1f5, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f1, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x4, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x211
};

static const u16 sSidehopperOam_31acc8_Frame1[] = {
    9,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x217,
    0xf1, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xe9, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x202,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x20d,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x202,
    0xec, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20d
};

static const u16 sSidehopperOam_31acc8_Frame2[] = {
    10,
    0xea, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x219,
    0xfa, 0x0, OBJ_PALETTE_8 | 0x237,
    0xf2, 0x8, OBJ_PALETTE_8 | 0x238,
    0xf1, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xea, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x222,
    0xec, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x20a,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x222,
    0xec, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSidehopperOam_31acc8_Frame5[] = {
    9,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x217,
    0xf1, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xe9, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x202,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x20d,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x202,
    0xec, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20d
};

static const u16 sSidehopperOam_31acc8_Frame6[] = {
    10,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x219,
    0xfa, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x237,
    0xf2, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x238,
    0xf1, 0x1fc, OBJ_PALETTE_8 | 0x22a,
    0xea, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x222,
    0xec, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x20a,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x222,
    0xec, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x20a
};

const struct FrameData sSidehopperOam_31aca0[5] = {
    [0] = {
        .pFrame = sSidehopperOam_31aca0_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSidehopperOam_31aca0_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSidehopperOam_31aca0_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSidehopperOam_31aca0_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSidehopperOam_31acc8[9] = {
    [0] = {
        .pFrame = sSidehopperOam_31aca0_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSidehopperOam_31acc8_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSidehopperOam_31acc8_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSidehopperOam_31acc8_Frame1,
        .timer = 3
    },
    [4] = {
        .pFrame = sSidehopperOam_31aca0_Frame0,
        .timer = 3
    },
    [5] = {
        .pFrame = sSidehopperOam_31acc8_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sSidehopperOam_31acc8_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sSidehopperOam_31acc8_Frame5,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSidehopperOam_31ad10[4] = {
    [0] = {
        .pFrame = sSidehopperOam_31aca0_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sSidehopperOam_31ad10_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSidehopperOam_31ad10_Frame2,
        .timer = 12
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSidehopperOam_31ad30[4] = {
    [0] = {
        .pFrame = sSidehopperOam_31ad30_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSidehopperOam_31ad30_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sSidehopperOam_31ad30_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSidehopperOam_31ad50[4] = {
    [0] = {
        .pFrame = sSidehopperOam_31ad10_Frame2,
        .timer = 12
    },
    [1] = {
        .pFrame = sSidehopperOam_31ad10_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSidehopperOam_31aca0_Frame0,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};


extern const u32 sSidehopperGfx[512 * 1];
extern const u16 sSidehopperPal[16 * 1];

extern const struct FrameData sSidehopperOam_31aca0[5];
extern const struct FrameData sSidehopperOam_31acc8[9];
extern const struct FrameData sSidehopperOam_31ad10[4];
extern const struct FrameData sSidehopperOam_31ad30[4];
extern const struct FrameData sSidehopperOam_31ad50[4];
