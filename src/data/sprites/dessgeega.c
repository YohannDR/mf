#include "data/sprites/dessgeega.h"

const s16 sDessgeegaBigHopVelocity[10] = {
    -8, -16, -16, -8,
    -4, 0, 4, 8,
    16, 16
};

const s16 sDessgeegaLittleHopVelocity[10] = {
    -4, -8, -4, -2,
    0, 4, 8, 16,
    16, 16
};

const u32 sDessgeegaGfx[512 * 1] = INCBIN_U32("data/sprites/dessgeega.gfx");
const u16 sDessgeegaPal[16 * 1] = INCBIN_U16("data/sprites/dessgeega.pal");

static const u16 sDessgeegaOam_31b8f0_Frame0[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xe9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x202,
    0xe4, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x227,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x227
};

static const u16 sDessgeegaOam_31b8f0_Frame1[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x203,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x220,
    0xe5, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x209,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x209
};

static const u16 sDessgeegaOam_31b8f0_Frame2[] = {
    10,
    0xe6, 0x1f8, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe6, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x204,
    0xe6, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x229,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x229
};

static const u16 sDessgeegaOam_31b960_Frame1[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1f8, OBJ_PALETTE_8 | 0x203,
    0xeb, 0x1f8, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x203,
    0xeb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x209,
    0xe6, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x209,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207
};

static const u16 sDessgeegaOam_31b960_Frame2[] = {
    10,
    0xed, 0x1f8, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xed, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x229,
    0xe8, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x229,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207
};

static const u16 sDessgeegaOam_31b980_Frame0[] = {
    14,
    0xd8, 0x1f8, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x204,
    0xe1, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf1, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1eb, OBJ_PALETTE_8 | 0x22b,
    0x4, 0x1ef, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x22b,
    0x4, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x211
};

static const u16 sDessgeegaOam_31b980_Frame1[] = {
    14,
    0xd8, 0x1f8, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x204,
    0xe1, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf1, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1eb, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1ef, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_VERTICAL | 0x4, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x20e
};

static const u16 sDessgeegaOam_31b980_Frame2[] = {
    14,
    0xd8, 0x1f8, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x221,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x204,
    0xe1, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1ec, OBJ_PALETTE_8 | 0x20b,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf1, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1eb, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1ef, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_VERTICAL | 0x4, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x20d
};

static const u16 sDessgeegaOam_31b918_Frame1[] = {
    9,
    0xe9, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x2, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1fa, OBJ_PALETTE_8 | 0x215,
    0xe5, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x209,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x209
};

static const u16 sDessgeegaOam_31b918_Frame2[] = {
    9,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1fb, OBJ_PALETTE_8 | 0x235,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xf1, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x218,
    0xe6, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x229,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x229
};

static const u16 sDessgeegaOam_31b918_Frame5[] = {
    9,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x215,
    0xe5, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x209,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x209
};

static const u16 sDessgeegaOam_31b918_Frame6[] = {
    9,
    OBJ_SHAPE_HORIZONTAL | 0xe9, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x235,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x218,
    0xe6, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ea, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ea, OBJ_PALETTE_8 | 0x229,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x229
};

static const u16 sDessgeegaOam_31b9c0_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x21a
};

static const u16 sDessgeegaOam_31b9d0_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x23a
};

static const u16 sDessgeegaOam_31b9d0_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x23b
};

static const u16 sDessgeegaOam_31b9d0_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x23c
};

const struct FrameData sDessgeegaOam_31b8f0[5] = {
    [0] = {
        .pFrame = sDessgeegaOam_31b8f0_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sDessgeegaOam_31b8f0_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sDessgeegaOam_31b8f0_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sDessgeegaOam_31b8f0_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDessgeegaOam_31b918[9] = {
    [0] = {
        .pFrame = sDessgeegaOam_31b8f0_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sDessgeegaOam_31b918_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sDessgeegaOam_31b918_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sDessgeegaOam_31b918_Frame1,
        .timer = 3
    },
    [4] = {
        .pFrame = sDessgeegaOam_31b8f0_Frame0,
        .timer = 3
    },
    [5] = {
        .pFrame = sDessgeegaOam_31b918_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sDessgeegaOam_31b918_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sDessgeegaOam_31b918_Frame5,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDessgeegaOam_31b960[4] = {
    [0] = {
        .pFrame = sDessgeegaOam_31b8f0_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sDessgeegaOam_31b960_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sDessgeegaOam_31b960_Frame2,
        .timer = 12
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDessgeegaOam_31b980[4] = {
    [0] = {
        .pFrame = sDessgeegaOam_31b980_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sDessgeegaOam_31b980_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sDessgeegaOam_31b980_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDessgeegaOam_31b9a0[4] = {
    [0] = {
        .pFrame = sDessgeegaOam_31b960_Frame2,
        .timer = 12
    },
    [1] = {
        .pFrame = sDessgeegaOam_31b960_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sDessgeegaOam_31b8f0_Frame0,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDessgeegaOam_31b9c0[2] = {
    [0] = {
        .pFrame = sDessgeegaOam_31b9c0_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDessgeegaOam_31b9d0[4] = {
    [0] = {
        .pFrame = sDessgeegaOam_31b9d0_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sDessgeegaOam_31b9d0_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sDessgeegaOam_31b9d0_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};
