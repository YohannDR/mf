#include "data/sprites/powamp.h"

const u32 sPowampGfx[1 * 512] = INCBIN_U32("data/sprites/powamp.gfx");
const u16 sPowampPal[1 * 16] = INCBIN_U16("data/sprites/powamp.pal");

static const u16 sPowampOam_386678_Frame0[] = {
    2,
    0xe8, 0x1fc, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPowampOam_386678_Frame1[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sPowampOam_386678_Frame2[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x8 | 0x1ec, OBJ_PALETTE_8 | 0x20f,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sPowampOam_386678_Frame3[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x218,
    0xd0, 0x1fd, OBJ_PALETTE_8 | 0x232,
    0xdd, 0x9, OBJ_PALETTE_8 | 0x232,
    0xdd, 0x1f0, OBJ_PALETTE_8 | 0x232,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPowampOam_386658_Frame1[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xda, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xea, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x238,
    0xd2, 0x1fc, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_HORIZONTAL | 0xe2, 0x1, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0xe2, OBJ_X_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x230,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sPowampOam_386658_Frame2[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x238,
    0xd0, 0x1fc, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x230,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sPowampOam_386658_Frame0[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd9, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe9, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x238,
    0xd1, 0x1fc, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_HORIZONTAL | 0xe1, 0x1, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0xe1, OBJ_X_FLIP | 0x1ef, OBJ_PALETTE_8 | 0x230,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPowampOam_386638_Frame0[] = {
    2,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe9, 0x1fc, OBJ_PALETTE_8 | 0x21f
};

static const u16 sPowampOam_386638_Frame1[] = {
    2,
    0xea, 0x1fc, OBJ_PALETTE_8 | 0x21f,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sPowampOam_386638_Frame2[] = {
    2,
    0xe8, 0x1fc, OBJ_PALETTE_8 | 0x21f,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sPowampOam_386708_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x230
};

static const u16 sPowampOam_3866b0_Frame1[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x8 | 0x1ec, OBJ_PALETTE_8 | 0x20f,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sPowampOam_3866b0_Frame2[] = {
    2,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sPowampOam_3866e8_Frame0[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xd9, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe9, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x238,
    0xd1, 0x1fc, OBJ_PALETTE_8 | 0x233,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPowampOam_3866e8_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xda, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xea, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x238,
    0xd2, 0x1fc, OBJ_PALETTE_8 | 0x233,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sPowampOam_3866e8_Frame2[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x238,
    0xd0, 0x1fc, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

const struct FrameData sPowampOam_386638[4] = {
    [0] = {
        .pFrame = sPowampOam_386638_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sPowampOam_386638_Frame1,
        .timer = 9
    },
    [2] = {
        .pFrame = sPowampOam_386638_Frame2,
        .timer = 9
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowampOam_386658[4] = {
    [0] = {
        .pFrame = sPowampOam_386658_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sPowampOam_386658_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sPowampOam_386658_Frame2,
        .timer = 5
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowampOam_386678[7] = {
    [0] = {
        .pFrame = sPowampOam_386678_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sPowampOam_386678_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sPowampOam_386678_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sPowampOam_386678_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sPowampOam_386658_Frame1,
        .timer = 4
    },
    [5] = {
        .pFrame = sPowampOam_386658_Frame2,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowampOam_3866b0[7] = {
    [0] = {
        .pFrame = sPowampOam_386678_Frame3,
        .timer = 4
    },
    [1] = {
        .pFrame = sPowampOam_3866b0_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sPowampOam_3866b0_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sPowampOam_386678_Frame0,
        .timer = 4
    },
    [4] = {
        .pFrame = sPowampOam_386638_Frame1,
        .timer = 4
    },
    [5] = {
        .pFrame = sPowampOam_386638_Frame2,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowampOam_3866e8[4] = {
    [0] = {
        .pFrame = sPowampOam_3866e8_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sPowampOam_3866e8_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sPowampOam_3866e8_Frame2,
        .timer = 5
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowampOam_386708[2] = {
    [0] = {
        .pFrame = sPowampOam_386708_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
