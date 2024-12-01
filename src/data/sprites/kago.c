#include "data/sprites/kago.h"

const s16 sKagoInsectHighJumpVelocity[10] = {
    -8, -16, -8, -4, 0,
    4, 8, 16, 16, 16
};

const s16 sKagoInsectMediumJumpVelocity[10] = {
    -5, -10, -5, -3, 0,
    4, 8, 12, 16, 16
};

const s16 sKagoInsectLowJumpVelocity[10] = {
    -4, -8, -4, -2, 0,
    4, 8, 12, 16, 16
};

const u32 sKagoGfx[2 * 512] = INCBIN_U32("data/sprites/kago.gfx");
const u16 sKagoPal[2 * 16] = INCBIN_U16("data/sprites/kago.pal");

static const u16 sKagoOam_337b4c_Frame0[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x210
};

static const u16 sKagoOam_337b4c_Frame1[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x230
};

static const u16 sKagoOam_337b4c_Frame2[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1ee, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x214
};

static const u16 sKagoOam_337b4c_Frame3[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ee, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ee, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1ef, OBJ_PALETTE_9 | 0x234
};

static const u16 sKagoOam_337b4c_Frame4[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ee, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ee, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1ee, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1ef, OBJ_PALETTE_9 | 0x234
};

static const u16 sKagoOam_337b4c_Frame5[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x214
};

static const u16 sKagoOam_337b4c_Frame6[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x230
};

static const u16 sKagoOam_337b4c_Frame8[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x200
};

static const u16 sKagoOam_337b4c_Frame9[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f2, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x214
};

static const u16 sKagoOam_337b4c_Frame10[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f2, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f2, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f3, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f1, OBJ_PALETTE_9 | 0x234
};

static const u16 sKagoOam_337b4c_Frame11[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f2, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f2, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f2, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f1, OBJ_PALETTE_9 | 0x234
};

static const u16 sKagoOam_337b4c_Frame12[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x214
};

static const u16 sKagoOam_337bbc_Frame13[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sKagoOam_337d84_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x250
};

static const u16 sKagoOam_337d84_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x252
};

static const u16 sKagoOam_337d84_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x254
};

static const u16 sKagoOam_337da4_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x256
};

static const u16 sKagoOam_337db4_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x258
};

static const u16 sKagoOam_337dc4_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x25a
};

static const u16 sKagoOam_337dc4_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x25c
};

static const u16 sKagoOam_337dc4_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x25e
};

static const u16 sKagoOam_337b24_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x244
};

static const u16 sKagoOam_337b24_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x248
};

static const u16 sKagoOam_337b24_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x24c
};

const struct FrameData sKagoOam_337b24[5] = {
    [0] = {
        .pFrame = sKagoOam_337b24_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sKagoOam_337b24_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sKagoOam_337b24_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sKagoOam_337b24_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337b4c[14] = {
    [0] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sKagoOam_337b4c_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sKagoOam_337b4c_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sKagoOam_337b4c_Frame3,
        .timer = 12
    },
    [4] = {
        .pFrame = sKagoOam_337b4c_Frame4,
        .timer = 12
    },
    [5] = {
        .pFrame = sKagoOam_337b4c_Frame5,
        .timer = 12
    },
    [6] = {
        .pFrame = sKagoOam_337b4c_Frame6,
        .timer = 12
    },
    [7] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 12
    },
    [8] = {
        .pFrame = sKagoOam_337b4c_Frame8,
        .timer = 12
    },
    [9] = {
        .pFrame = sKagoOam_337b4c_Frame9,
        .timer = 12
    },
    [10] = {
        .pFrame = sKagoOam_337b4c_Frame10,
        .timer = 12
    },
    [11] = {
        .pFrame = sKagoOam_337b4c_Frame11,
        .timer = 12
    },
    [12] = {
        .pFrame = sKagoOam_337b4c_Frame12,
        .timer = 12
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337bbc[15] = {
    [0] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sKagoOam_337b4c_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sKagoOam_337b4c_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sKagoOam_337b4c_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sKagoOam_337b4c_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sKagoOam_337b4c_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sKagoOam_337b4c_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 8
    },
    [8] = {
        .pFrame = sKagoOam_337b4c_Frame8,
        .timer = 8
    },
    [9] = {
        .pFrame = sKagoOam_337b4c_Frame9,
        .timer = 8
    },
    [10] = {
        .pFrame = sKagoOam_337b4c_Frame10,
        .timer = 8
    },
    [11] = {
        .pFrame = sKagoOam_337b4c_Frame11,
        .timer = 8
    },
    [12] = {
        .pFrame = sKagoOam_337b4c_Frame12,
        .timer = 8
    },
    [13] = {
        .pFrame = sKagoOam_337bbc_Frame13,
        .timer = 8
    },
    [14] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337c34[14] = {
    [0] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sKagoOam_337b4c_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sKagoOam_337b4c_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sKagoOam_337b4c_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sKagoOam_337b4c_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sKagoOam_337b4c_Frame5,
        .timer = 5
    },
    [6] = {
        .pFrame = sKagoOam_337b4c_Frame6,
        .timer = 5
    },
    [7] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 5
    },
    [8] = {
        .pFrame = sKagoOam_337b4c_Frame8,
        .timer = 5
    },
    [9] = {
        .pFrame = sKagoOam_337b4c_Frame9,
        .timer = 5
    },
    [10] = {
        .pFrame = sKagoOam_337b4c_Frame10,
        .timer = 5
    },
    [11] = {
        .pFrame = sKagoOam_337b4c_Frame11,
        .timer = 5
    },
    [12] = {
        .pFrame = sKagoOam_337b4c_Frame12,
        .timer = 5
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337ca4[14] = {
    [0] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sKagoOam_337b4c_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sKagoOam_337b4c_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sKagoOam_337b4c_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sKagoOam_337b4c_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sKagoOam_337b4c_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sKagoOam_337b4c_Frame6,
        .timer = 3
    },
    [7] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 3
    },
    [8] = {
        .pFrame = sKagoOam_337b4c_Frame8,
        .timer = 3
    },
    [9] = {
        .pFrame = sKagoOam_337b4c_Frame9,
        .timer = 3
    },
    [10] = {
        .pFrame = sKagoOam_337b4c_Frame10,
        .timer = 3
    },
    [11] = {
        .pFrame = sKagoOam_337b4c_Frame11,
        .timer = 3
    },
    [12] = {
        .pFrame = sKagoOam_337b4c_Frame12,
        .timer = 3
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337d14[14] = {
    [0] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sKagoOam_337b4c_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sKagoOam_337b4c_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sKagoOam_337b4c_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sKagoOam_337b4c_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sKagoOam_337b4c_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sKagoOam_337b4c_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sKagoOam_337b4c_Frame0,
        .timer = 2
    },
    [8] = {
        .pFrame = sKagoOam_337b4c_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sKagoOam_337b4c_Frame9,
        .timer = 2
    },
    [10] = {
        .pFrame = sKagoOam_337b4c_Frame10,
        .timer = 2
    },
    [11] = {
        .pFrame = sKagoOam_337b4c_Frame11,
        .timer = 2
    },
    [12] = {
        .pFrame = sKagoOam_337b4c_Frame12,
        .timer = 2
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337d84[4] = {
    [0] = {
        .pFrame = sKagoOam_337d84_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sKagoOam_337d84_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sKagoOam_337d84_Frame2,
        .timer = 16
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337da4[2] = {
    [0] = {
        .pFrame = sKagoOam_337da4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337db4[2] = {
    [0] = {
        .pFrame = sKagoOam_337db4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKagoOam_337dc4[4] = {
    [0] = {
        .pFrame = sKagoOam_337dc4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sKagoOam_337dc4_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sKagoOam_337dc4_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};
