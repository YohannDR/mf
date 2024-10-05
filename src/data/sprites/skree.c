#include "data/sprites/skree.h"
#include "macros.h"

const s16 sSkreeFallingVelocity[12] = {
    2,  4,  6,  8,
    12, 14, 16, 18,
    20, 22, 24, SHORT_MAX
};

const u32 sSkreeGfx[512] = INCBIN_U32("data/sprites/skree.gfx");
const u16 sSkreePal[16] = INCBIN_U16("data/sprites/skree.pal");

static const u16 sOam_2f90b4[OAM_DATA_SIZE(4)] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2f90ce[OAM_DATA_SIZE(4)] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x203,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x203,
    0xf8, 0x1f3, OBJ_PALETTE_8 | 0x205,
    0xf8, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x205
};

static const u16 sOam_2f90e8[OAM_DATA_SIZE(2)] = {
    2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208
};

static const u16 sOam_2f90f6[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_8 | 0x20b
};

static const u16 sOam_2f9104[OAM_DATA_SIZE(2)] = {
    2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e
};

static const u16 sOam_2f9112[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2f912c[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x26e,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x203,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x203,
    0xe8, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x205,
    0xe8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x205
};

static const u16 sOam_2f914c[OAM_DATA_SIZE(2)] = {
    2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208
};

static const u16 sOam_2f915a[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x20b
};

static const u16 sOam_2f9168[OAM_DATA_SIZE(2)] = {
    2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e
};

static const u16 sOam_2f9176[OAM_DATA_SIZE(4)] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x240,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x242,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x240,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x242
};

static const u16 sOam_2f9190[OAM_DATA_SIZE(4)] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x244,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x246,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x244,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x246
};

static const u16 sOam_2f91aa[OAM_DATA_SIZE(2)] = {
    2,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x248,
    0xf8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x24a
};

static const u16 sOam_2f91b8[OAM_DATA_SIZE(2)] = {
    2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x24c,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x24e
};

static const u16 sOam_2f91c6[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x240,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x242,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x240,
    0xe0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x242
};

static const u16 sOam_2f91e0[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x244,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x246,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x244,
    0xe0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x246
};

static const u16 sOam_2f91fa[OAM_DATA_SIZE(2)] = {
    2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x248,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x24a
};

static const u16 sOam_2f9208[OAM_DATA_SIZE(2)] = {
    2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x24c,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x24e
};

static const u16 sOam_2f9216[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x225
};

const struct FrameData sFrameData_2f9220[5] = {
    [0] = {
        .pFrame = sOam_2f90b4,
        .timer = 10,
    },
    [1] = {
        .pFrame = sOam_2f90e8,
        .timer = 10,
    },
    [2] = {
        .pFrame = sOam_2f90f6,
        .timer = 10,
    },
    [3] = {
        .pFrame = sOam_2f9104,
        .timer = 10,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f9248[3] = {
    [0] = {
        .pFrame = sOam_2f90b4,
        .timer = 10,
    },
    [1] = {
        .pFrame = sOam_2f90ce,
        .timer = 16,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f9260[5] = {
    [0] = {
        .pFrame = sOam_2f90b4,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2f90e8,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2f90f6,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2f9104,
        .timer = 2,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f9288[5] = {
    [0] = {
        .pFrame = sOam_2f9112,
        .timer = 10,
    },
    [1] = {
        .pFrame = sOam_2f914c,
        .timer = 10,
    },
    [2] = {
        .pFrame = sOam_2f915a,
        .timer = 10,
    },
    [3] = {
        .pFrame = sOam_2f9168,
        .timer = 10,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f92b0[3] = {
    [0] = {
        .pFrame = sOam_2f9112,
        .timer = 10,
    },
    [1] = {
        .pFrame = sOam_2f912c,
        .timer = 16,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f92c8[5] = {
    [0] = {
        .pFrame = sOam_2f9112,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2f914c,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2f915a,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2f9168,
        .timer = 2,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f92f0[5] = {
    [0] = {
        .pFrame = sOam_2f9176,
        .timer = 10,
    },
    [1] = {
        .pFrame = sOam_2f91aa,
        .timer = 10,
    },
    [2] = {
        .pFrame = sOam_2f90f6,
        .timer = 10,
    },
    [3] = {
        .pFrame = sOam_2f91b8,
        .timer = 10,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f9318[3] = {
    [0] = {
        .pFrame = sOam_2f9176,
        .timer = 10,
    },
    [1] = {
        .pFrame = sOam_2f9190,
        .timer = 16,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f9330[5] = {
    [0] = {
        .pFrame = sOam_2f9176,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2f91aa,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2f90f6,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2f91b8,
        .timer = 2,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f9358[5] = {
    [0] = {
        .pFrame = sOam_2f91c6,
        .timer = 10,
    },
    [1] = {
        .pFrame = sOam_2f91fa,
        .timer = 10,
    },
    [2] = {
        .pFrame = sOam_2f915a,
        .timer = 10,
    },
    [3] = {
        .pFrame = sOam_2f9208,
        .timer = 10,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f9380[3] = {
    [0] = {
        .pFrame = sOam_2f91c6,
        .timer = 10,
    },
    [1] = {
        .pFrame = sOam_2f91e0,
        .timer = 16,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f9398[5] = {
    [0] = {
        .pFrame = sOam_2f91c6,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2f91fa,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2f915a,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2f9208,
        .timer = 2,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2f93c0[2] = {
    [0] = {
        .pFrame = sOam_2f9216,
        .timer = 255,
    },
    [1] = FRAME_DATA_TERMINATOR
};
