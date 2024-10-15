#include "data/sprites/core_x_downloading_varia.h"
#include "macros.h"

const u32 sCoreXDownloadingVariaGfx[512 * 4] = INCBIN_U32("data/sprites/core_x_downloading_varia.gfx");
const u16 sCoreXDownloadingVariaPal[16 * 4] = INCBIN_U16("data/sprites/core_x_downloading_varia.pal");

static const u16 sFrameData_3151d4_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1e8, OBJ_PALETTE_9 | 0x290,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2d5,
    0xf8, 0x1f8, OBJ_PALETTE_9 | 0x2d4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x292,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_9 | 0x294,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x2d7
};

static const u16 sFrameData_3151e4_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1e8, OBJ_PALETTE_10 | 0x290,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x2d5,
    0xf8, 0x1f8, OBJ_PALETTE_10 | 0x2d4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_10 | 0x292,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_10 | 0x294,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x2d7
};

static const u16 sFrameData_315304_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1ff, OBJ_PALETTE_9 | 0x2d9,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x2b8,
    0x0, 0x1f0, OBJ_PALETTE_9 | 0x298
};

static const u16 sFrameData_315304_Frame1[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ff, OBJ_PALETTE_9 | 0x2da,
    0x6, 0x7, OBJ_PALETTE_9 | 0x2fb,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x299,
    0x8, 0x8, OBJ_PALETTE_9 | 0x29b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x8, OBJ_PALETTE_9 | 0x29c
};

static const u16 sFrameData_315304_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    0x8, 0x5, OBJ_PALETTE_9 | 0x2fa,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_9 | 0x29f
};

static const u16 sFrameData_315304_Frame6[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1ff, OBJ_PALETTE_9 | 0x2dc,
    0xf1, 0x7, OBJ_PALETTE_9 | 0x2dd
};

static const u16 sFrameData_315304_Frame7[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x0, OBJ_PALETTE_9 | 0x2bd
};

static const u16 sFrameData_315304_Frame8[OAM_DATA_SIZE(1)] = {
    1,
    0xf9, 0x1ff, OBJ_PALETTE_9 | 0x2fd
};

static const u16 sFrameData_315304_Frame3[OAM_DATA_SIZE(3)] = {
    3,
    0x8, 0x1f6, OBJ_PALETTE_9 | 0x2de,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x2b8,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x8, OBJ_PALETTE_9 | 0x298
};

static const u16 sFrameData_315304_Frame4[OAM_DATA_SIZE(4)] = {
    4,
    0x8, 0x1f8, OBJ_PALETTE_9 | 0x2fe,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x299,
    0x8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x29b,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x29c
};

static const u16 sFrameData_315304_Frame5[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1fa, OBJ_PALETTE_9 | 0x2df,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_9 | 0x29f
};

static const u16 sFrameData_31539c_Frame3[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x2f8
};

static const u16 sFrameData_315284_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x28c
};

static const u16 sFrameData_315284_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x288
};

static const u16 sFrameData_315284_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x284
};

static const u16 sFrameData_3151fc_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x280
};

static const u16 sFrameData_3151fc_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xef, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x200
};

static const u16 sFrameData_3151fc_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x204
};

static const u16 sFrameData_3151fc_Frame4[OAM_DATA_SIZE(1)] = {
    1,
    0xf1, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x208
};

static const u16 sFrameData_3151fc_Frame6[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x20c
};

static const u16 sFrameData_3151fc_Frame3[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x210
};

static const u16 sFrameData_3151fc_Frame5[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x214
};

static const u16 sFrameData_3151fc_Frame7[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x218
};

static const u16 sFrameData_3151fc_Frame9[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFrameData_3152bc_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x200
};

static const u16 sFrameData_3152bc_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x208
};

const struct FrameData sFrameData_3151d4[2] = {
    [0] = {
        .pFrame = sFrameData_3151d4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3151e4[3] = {
    [0] = {
        .pFrame = sFrameData_3151d4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_3151e4_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3151fc[17] = {
    [0] = {
        .pFrame = sFrameData_3151fc_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sFrameData_3151fc_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sFrameData_3151fc_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sFrameData_3151fc_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sFrameData_3151fc_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sFrameData_3151fc_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sFrameData_3151fc_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sFrameData_3151fc_Frame7,
        .timer = 1
    },
    [8] = {
        .pFrame = sFrameData_3151fc_Frame0,
        .timer = 1
    },
    [9] = {
        .pFrame = sFrameData_3151fc_Frame9,
        .timer = 1
    },
    [10] = {
        .pFrame = sFrameData_3151fc_Frame2,
        .timer = 1
    },
    [11] = {
        .pFrame = sFrameData_3151fc_Frame7,
        .timer = 1
    },
    [12] = {
        .pFrame = sFrameData_3151fc_Frame4,
        .timer = 1
    },
    [13] = {
        .pFrame = sFrameData_3151fc_Frame5,
        .timer = 1
    },
    [14] = {
        .pFrame = sFrameData_3151fc_Frame6,
        .timer = 1
    },
    [15] = {
        .pFrame = sFrameData_3151fc_Frame3,
        .timer = 1
    },
    [16] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_315284[7] = {
    [0] = {
        .pFrame = sFrameData_315284_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_315284_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_315284_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFrameData_3151fc_Frame1,
        .timer = 10
    },
    [4] = {
        .pFrame = sFrameData_315284_Frame2,
        .timer = 6
    },
    [5] = {
        .pFrame = sFrameData_315284_Frame1,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3152bc[9] = {
    [0] = {
        .pFrame = sFrameData_3152bc_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_3151fc_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_3152bc_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFrameData_3151fc_Frame6,
        .timer = 6
    },
    [4] = {
        .pFrame = sFrameData_3151fc_Frame3,
        .timer = 6
    },
    [5] = {
        .pFrame = sFrameData_3151fc_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sFrameData_3151fc_Frame7,
        .timer = 6
    },
    [7] = {
        .pFrame = sFrameData_3151fc_Frame9,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_315304[19] = {
    [0] = {
        .pFrame = sFrameData_315304_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sFrameData_315304_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sFrameData_315304_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sFrameData_315304_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sFrameData_315304_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sFrameData_315304_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sFrameData_315304_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sFrameData_315304_Frame7,
        .timer = 1
    },
    [8] = {
        .pFrame = sFrameData_315304_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sFrameData_315304_Frame0,
        .timer = 1
    },
    [10] = {
        .pFrame = sFrameData_315304_Frame1,
        .timer = 1
    },
    [11] = {
        .pFrame = sFrameData_315304_Frame2,
        .timer = 1
    },
    [12] = {
        .pFrame = sFrameData_315304_Frame6,
        .timer = 1
    },
    [13] = {
        .pFrame = sFrameData_315304_Frame7,
        .timer = 1
    },
    [14] = {
        .pFrame = sFrameData_315304_Frame8,
        .timer = 1
    },
    [15] = {
        .pFrame = sFrameData_315304_Frame3,
        .timer = 1
    },
    [16] = {
        .pFrame = sFrameData_315304_Frame4,
        .timer = 1
    },
    [17] = {
        .pFrame = sFrameData_315304_Frame5,
        .timer = 1
    },
    [18] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_31539c[5] = {
    [0] = {
        .pFrame = sFrameData_315304_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_315304_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_315304_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_31539c_Frame3,
        .timer = 20
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3153c4[5] = {
    [0] = {
        .pFrame = sFrameData_315304_Frame6,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_315304_Frame7,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_315304_Frame8,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_31539c_Frame3,
        .timer = 40
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3153ec[5] = {
    [0] = {
        .pFrame = sFrameData_315304_Frame3,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_315304_Frame4,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_315304_Frame5,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_31539c_Frame3,
        .timer = 60
    },
    [4] = FRAME_DATA_TERMINATOR
};

const u32 sVariaXAfterDownloadingGfx[512 * 2] = INCBIN_U32("data/sprites/varia_x_after_downloading.gfx");
