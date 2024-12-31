#include "data/sprites/missile_barrier.h"

const u32 sMissileBarrierGfx[512 * 1] = INCBIN_U32("data/sprites/missile_barrier.gfx");
const u16 sMissileBarrierPal[16 * 1] = INCBIN_U16("data/sprites/missile_barrier.pal");

static const u16 sMissileBarrierStemOam_Idle_Frame0[] = {
    4,
    0x10, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sMissileBarrierStemOam_Idle_Frame1[] = {
    4,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0x10, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a
};

static const u16 sMissileBarrierStemOam_Idle_Frame2[] = {
    4,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0x10, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e
};

static const u16 sMissileBarrierStemOam_Destroyed_Frame0[] = {
    4,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0x10, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0x0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sMissileBarrierStemOam_Destroyed_Frame1[] = {
    2,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0x10, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sMissileBarrierStemOam_Destroyed_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x18, 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sMissileBarrierStemOam_Destroyed_Frame3[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x226,
    OBJ_SHAPE_HORIZONTAL | 0x18, 0x1f8, OBJ_PALETTE_8 | 0x226
};

static const u16 sMissileBarrierOam_Idle_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x16 | 0x1f5, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x5, OBJ_SIZE_32x8 | 0x1ed, OBJ_PALETTE_8 | 0x213,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21a
};

static const u16 sMissileBarrierOam_Idle_Frame1[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x16 | 0x1f5, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x5, OBJ_SIZE_32x8 | 0x1ed, OBJ_PALETTE_8 | 0x213,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21c
};

static const u16 sMissileBarrierOam_Idle_Frame2[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x16 | 0x1f5, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x5, OBJ_SIZE_32x8 | 0x1ed, OBJ_PALETTE_8 | 0x213,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sMissileBarrierOam_Idle_Frame3[] = {
    4,
    0xf3, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x5, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_HORIZONTAL | 0x3, OBJ_SIZE_32x8 | 0x1ed, OBJ_PALETTE_8 | 0x233,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21c
};

const struct FrameData sMissileBarrierStemOam_Idle[5] = {
    [0] = {
        .pFrame = sMissileBarrierStemOam_Idle_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sMissileBarrierStemOam_Idle_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sMissileBarrierStemOam_Idle_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sMissileBarrierStemOam_Idle_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileBarrierStemOam_Destroyed[5] = {
    [0] = {
        .pFrame = sMissileBarrierStemOam_Destroyed_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sMissileBarrierStemOam_Destroyed_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sMissileBarrierStemOam_Destroyed_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sMissileBarrierStemOam_Destroyed_Frame3,
        .timer = 1
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileBarrierOam_Idle[5] = {
    [0] = {
        .pFrame = sMissileBarrierOam_Idle_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sMissileBarrierOam_Idle_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sMissileBarrierOam_Idle_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sMissileBarrierOam_Idle_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};
