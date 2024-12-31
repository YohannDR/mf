#include "data/sprites/lab_debris.h"

const u32 sLabDebrisGfx[1 * 512] = INCBIN_U32("data/sprites/lab_debris.gfx");
const u16 sLabDebrisPal[1 * 16] = INCBIN_U16("data/sprites/lab_debris.pal");

static const u16 sLabDebrisOam_385c1c_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sLabDebrisOam_385c2c_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x208
};

static const u16 sLabDebrisOam_385c3c_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sLabDebrisOam_385c4c_Frame0[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x20e,
    0x0, 0x1fa, OBJ_PALETTE_8 | 0x210
};

static const u16 sLabDebrisOam_385c5c_Frame0[] = {
    2,
    0xf1, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x211,
    0xe9, 0x1fb, OBJ_PALETTE_8 | 0x230
};

static const u16 sLabDebrisOam_385c6c_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_HORIZONTAL | 0xeb, OBJ_SIZE_32x8 | 0x1ef, OBJ_PALETTE_8 | 0x217
};

static const u16 sLabDebrisOam_385c7c_Frame0[] = {
    3,
    0xda, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x21b,
    0xea, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fc, OBJ_PALETTE_8 | 0x237
};

static const u16 sLabDebrisOam_385c8c_Frame0[] = {
    2,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x211,
    0xe9, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_8 | 0x230
};

static const u16 sLabDebrisOam_385c9c_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_HORIZONTAL | 0xeb, OBJ_X_FLIP | OBJ_SIZE_32x8 | 0x1ef, OBJ_PALETTE_8 | 0x217
};

const struct FrameData sLabDebrisOam_385c1c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c1c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabDebrisOam_385c2c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c2c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabDebrisOam_385c3c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c3c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabDebrisOam_385c4c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c4c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabDebrisOam_385c5c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c5c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabDebrisOam_385c6c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c6c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabDebrisOam_385c7c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c7c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabDebrisOam_385c8c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c8c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabDebrisOam_385c9c[2] = {
    [0] = {
        .pFrame = sLabDebrisOam_385c9c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
