#include "data/sprites/geruda.h"
#include "macros.h"

const s16 sGerudaIdleDownwardsMovement[36] = {
    0, 0, 0, 0,
    1, 1, 1, 1,
    2, 2, 2, 2,
    3, 3, 4, 4,
    4, 4, 3, 3,
    2, 2, 2, 2,
    1, 1, 1, 1,
    0, 0, 0, 0,
    0, 0, 0, 0
};

const s16 sGerudaIdleUpwardsMovement[29] = {
    -1, -1, -1, -1,
    -2, -2, -2, -2,
    -3, -3, -4, -4,
    -4, -4, -3, -3,
    -2, -2, -2, -2,
    -1, -1, -1, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const u32 sGerudaGfx[512 * 1] = INCBIN_U32("data/sprites/geruda.gfx");
const u16 sGerudaPal[16 * 1] = INCBIN_U16("data/sprites/geruda.pal");

static const u16 sGerudaOam_Idle_Frame0[] = {
    10,
    0xf3, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1fb, OBJ_PALETTE_8 | 0x20d,
    0xf9, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0x9, 0x1f4, OBJ_PALETTE_8 | 0x207,
    0xf3, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1ef, OBJ_PALETTE_8 | 0x20d,
    0x3, 0x3, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xb, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x236,
    0x3, 0x1fa, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xb, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x236
};

static const u16 sGerudaOam_Idle_Frame1[] = {
    10,
    0xf4, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1fc, OBJ_PALETTE_8 | 0x20d,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x202,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf4, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1ee, OBJ_PALETTE_8 | 0x20d,
    0x5, 0x3, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xd, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x238,
    0x5, 0x1fa, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xd, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x238
};

static const u16 sGerudaOam_Idle_Frame2[] = {
    10,
    0xf5, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1fc, OBJ_PALETTE_8 | 0x20d,
    0xf7, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    0x7, 0x1f8, OBJ_PALETTE_8 | 0x227,
    0xf5, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1ed, OBJ_PALETTE_8 | 0x20d,
    0x7, 0x3, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x218,
    0x7, 0x1fa, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x218
};

static const u16 sGerudaOam_AttackWarning_Frame0[] = {
    10,
    0xf4, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1fb, OBJ_PALETTE_8 | 0x22d,
    0xf7, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    0x7, 0x1f8, OBJ_PALETTE_8 | 0x227,
    0xf4, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1eb, OBJ_PALETTE_8 | 0x22d,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1fc, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x4, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f2, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1fa, OBJ_PALETTE_8 | 0x234
};

static const u16 sGerudaOam_Lunging_Frame0[] = {
    10,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20f,
    0xf9, 0x8, OBJ_PALETTE_8 | 0x211,
    0xf7, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    0x7, 0x1f8, OBJ_PALETTE_8 | 0x227,
    0xf9, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x20f,
    0xf9, 0x1f9, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1fc, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x4, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f2, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1fa, OBJ_PALETTE_8 | 0x234
};

static const u16 sGerudaOam_Swiping_Frame0[] = {
    10,
    0xf4, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x20f,
    0xf4, 0x7, OBJ_PALETTE_8 | 0x211,
    0xf7, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    0x7, 0x1f8, OBJ_PALETTE_8 | 0x227,
    0xf4, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x20f,
    0xf4, 0x1f8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1fc, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x4, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f2, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1fa, OBJ_PALETTE_8 | 0x234
};

static const u16 sGerudaOam_Swiping_Frame1[] = {
    10,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f3, OBJ_PALETTE_8 | 0x22d,
    0xf7, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    0x7, 0x1f8, OBJ_PALETTE_8 | 0x227,
    0xf4, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1e3, OBJ_PALETTE_8 | 0x22d,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1fc, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x4, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f2, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1fa, OBJ_PALETTE_8 | 0x234
};

static const u16 sGerudaOam_Swiping_Frame2[] = {
    10,
    0xfe, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe, 0x1f6, OBJ_PALETTE_8 | 0x20d,
    0xf9, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    0x9, 0x1f8, OBJ_PALETTE_8 | 0x227,
    0xfe, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe, 0x1e8, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1fc, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x4, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f2, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1fa, OBJ_PALETTE_8 | 0x234
};

static const u16 sGerudaOam_Swiping_Frame3[] = {
    10,
    0xf9, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1fa, OBJ_PALETTE_8 | 0x20d,
    0xf9, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    0x9, 0x1f8, OBJ_PALETTE_8 | 0x227,
    0xf9, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1ec, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1fc, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x4, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f2, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1fa, OBJ_PALETTE_8 | 0x234
};

static const u16 sGerudaOam_Swiping_Frame4[] = {
    10,
    0xf4, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1fb, OBJ_PALETTE_8 | 0x22d,
    0xf8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x227,
    0xf4, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1eb, OBJ_PALETTE_8 | 0x22d,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1fc, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x7, 0x4, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f2, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1fa, OBJ_PALETTE_8 | 0x234
};

static const u16 sGerudaOam_TurningAround_Frame0[] = {
    11,
    0xf5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x5, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x23c,
    0xf5, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1ee, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x206,
    0x7, 0x1fc, OBJ_PALETTE_8 | 0x228,
    0x7, 0x2, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_HORIZONTAL | 0xf, 0x2, OBJ_PALETTE_8 | 0x218,
    0x7, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_HORIZONTAL | 0xf, OBJ_X_FLIP | 0x1ee, OBJ_PALETTE_8 | 0x218
};

const struct FrameData sGerudaOam_Idle[5] = {
    [0] = {
        .pFrame = sGerudaOam_Idle_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sGerudaOam_Idle_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sGerudaOam_Idle_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sGerudaOam_Idle_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerudaOam_AttackWarning[2] = {
    [0] = {
        .pFrame = sGerudaOam_AttackWarning_Frame0,
        .timer = 6
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerudaOam_Lunging[2] = {
    [0] = {
        .pFrame = sGerudaOam_Lunging_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerudaOam_Swiping[6] = {
    [0] = {
        .pFrame = sGerudaOam_Swiping_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sGerudaOam_Swiping_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sGerudaOam_Swiping_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sGerudaOam_Swiping_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sGerudaOam_Swiping_Frame4,
        .timer = 5
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGerudaOam_TurningAround[2] = {
    [0] = {
        .pFrame = sGerudaOam_TurningAround_Frame0,
        .timer = 6
    },
    [1] = FRAME_DATA_TERMINATOR
};
