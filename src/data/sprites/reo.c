#include "data/sprites/reo.h"

const s16 sReoIdleYMovement[49] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 2, 3, 4,
    3, 2, 1, 0,
    1, 0, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, -2, -3, -4,
    -3, -2, -1, 0,
    -1, 0, -1, 0,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sReoGoingDownYSpeed[12] = {
    1, 1, 2, 2,
    3, 3, 4, 4,
    5, 5, 6, SHORT_MAX
};

const s16 sReoSlidingYSpeed[16] = {
    5, 5, 5, 5,
    4, 4, 4, 4,
    3, 3, 3, 2,
    2, 2, 1, SHORT_MAX
};

const s16 sReoGoingUpAccceleratingYSpeed[12] = {
    -1, -1, -2, -2,
    -3, -3, -4, -4,
    -5, -5, -6, SHORT_MAX
};

const s16 sReoGoingUpDeceleratingYSpeed[16] = {
    -5, -5, -5, -5,
    -4, -4, -4, -4,
    -3, -3, -3, -2,
    -2, -2, -1, SHORT_MAX
};

const u32 sReoGfx[1 * 512] = INCBIN_U32("data/sprites/reo.gfx");
const u16 sReoPal[1 * 16] = INCBIN_U16("data/sprites/reo.pal");

static const u16 sReoOam_33f128_Frame0[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x209,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x202
};

static const u16 sReoOam_33f128_Frame1[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f8, OBJ_PALETTE_8 | 0x201,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x201
};

static const u16 sReoOam_33f128_Frame2[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20d,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x200
};

static const u16 sReoOam_33f150_Frame0[] = {
    4,
    0xf2, 0x1f2, OBJ_PALETTE_8 | 0x208,
    0xf2, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x208,
    0xe5, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x203,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x203
};

static const u16 sReoOam_33f150_Frame1[] = {
    4,
    0xf2, 0x1f2, OBJ_PALETTE_8 | 0x211,
    0xf2, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x211,
    0xe5, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x205,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x205
};

static const u16 sReoOam_33f150_Frame2[] = {
    4,
    0xf2, 0x1f2, OBJ_PALETTE_8 | 0x207,
    0xf2, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x227
};

static const u16 sReoOam_33f178_Frame0[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20d,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x227
};

static const u16 sReoOam_33f178_Frame1[] = {
    6,
    0xf5, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20d,
    0xf5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x227
};

static const u16 sReoOam_33f178_Frame2[] = {
    6,
    0xf3, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x20d,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f1, OBJ_PALETTE_8 | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x227
};

const struct FrameData sReoOam_33f128[5] = {
    [0] = {
        .pFrame = sReoOam_33f128_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sReoOam_33f128_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sReoOam_33f128_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sReoOam_33f128_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sReoOam_33f150[5] = {
    [0] = {
        .pFrame = sReoOam_33f150_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sReoOam_33f150_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sReoOam_33f150_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sReoOam_33f150_Frame1,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sReoOam_33f178[4] = {
    [0] = {
        .pFrame = sReoOam_33f178_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sReoOam_33f178_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sReoOam_33f178_Frame2,
        .timer = 255
    },
    [3] = FRAME_DATA_TERMINATOR
};
