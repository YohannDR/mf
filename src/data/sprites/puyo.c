#include "data/sprites/puyo.h"

const s16 sPuyoJumpingUpSpeed[32] = {
    -16, -16, -15, -15,
    -14, -14, -13, -13,
    -12, -12, -11, -11,
    -10, -10, -9, -9,
    -8, -8, -7, -7,
    -6, -6, -5, -5,
    -4, -4, -3, -3,
    -2, -2, -1, SHORT_MAX
};

const s16 sPuyoJumpingDownSpeed[16] = {
    0, 0, 1, 1,
    2, 2, 3, 3,
    4, 4, 5, 5,
    6, 7, 8, SHORT_MAX
};

const u32 sPuyoGfx[1 * 512] = INCBIN_U32("data/sprites/puyo.gfx");
const u16 sPuyoPal[1 * 16] = INCBIN_U16("data/sprites/puyo.pal");

static const u16 sPuyoOam_37ce44_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPuyoOam_37ce44_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sPuyoOam_37ce44_Frame2[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sPuyoOam_37ce6c_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sPuyoOam_37ce6c_Frame2[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x208,
    0xf8, 0x4, OBJ_PALETTE_8 | 0x22a
};

static const u16 sPuyoOam_37ce6c_Frame3[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x222
};

static const u16 sPuyoOam_37ce6c_Frame4[] = {
    2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x208,
    0xf8, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x22a
};

static const u16 sPuyoOam_37ce6c_Frame5[] = {
    1,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

const struct FrameData sPuyoOam_37ce44[5] = {
    [0] = {
        .pFrame = sPuyoOam_37ce44_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sPuyoOam_37ce44_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sPuyoOam_37ce44_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sPuyoOam_37ce44_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPuyoOam_37ce6c[7] = {
    [0] = {
        .pFrame = sPuyoOam_37ce44_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sPuyoOam_37ce6c_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sPuyoOam_37ce6c_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sPuyoOam_37ce6c_Frame3,
        .timer = 7
    },
    [4] = {
        .pFrame = sPuyoOam_37ce6c_Frame4,
        .timer = 7
    },
    [5] = {
        .pFrame = sPuyoOam_37ce6c_Frame5,
        .timer = 7
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPuyoOam_37cea4[4] = {
    [0] = {
        .pFrame = sPuyoOam_37ce44_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sPuyoOam_37ce6c_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sPuyoOam_37ce6c_Frame2,
        .timer = 7
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPuyoOam_37cec4[2] = {
    [0] = {
        .pFrame = sPuyoOam_37ce6c_Frame3,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPuyoOam_37ced4[3] = {
    [0] = {
        .pFrame = sPuyoOam_37ce6c_Frame4,
        .timer = 7
    },
    [1] = {
        .pFrame = sPuyoOam_37ce6c_Frame5,
        .timer = 7
    },
    [2] = FRAME_DATA_TERMINATOR
};
