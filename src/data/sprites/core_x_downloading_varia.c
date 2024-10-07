#include "data/sprites/core_x_downloading_varia.h"
#include "macros.h"

const u32 sCoreXDownloadingVariaGfx[512 * 4] = INCBIN_U32("data/sprites/core_x_downloading_varia.gfx");
const u16 sCoreXDownloadingVariaPal[16 * 4] = INCBIN_U16("data/sprites/core_x_downloading_varia.pal");

static const u16 sOam_315068[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1e8, OBJ_PALETTE_9 | 0x290,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2d5,
    0xf8, 0x1f8, OBJ_PALETTE_9 | 0x2d4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x292,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_9 | 0x294,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x2d7
};

static const u16 sOam_31508e[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1e8, OBJ_PALETTE_10 | 0x290,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x2d5,
    0xf8, 0x1f8, OBJ_PALETTE_10 | 0x2d4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_10 | 0x292,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_10 | 0x294,
    0x8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_10 | 0x2d7
};

static const u16 sOam_3150b4[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1ff, OBJ_PALETTE_9 | 0x2d9,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x2b8,
    0x0, 0x1f0, OBJ_PALETTE_9 | 0x298
};

static const u16 sOam_3150c8[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ff, OBJ_PALETTE_9 | 0x2da,
    0x6, 0x7, OBJ_PALETTE_9 | 0x2fb,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x299,
    0x8, 0x8, OBJ_PALETTE_9 | 0x29b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x8, OBJ_PALETTE_9 | 0x29c
};

static const u16 sOam_3150e8[OAM_DATA_SIZE(3)] = {
    3,
    0x8, 0x5, OBJ_PALETTE_9 | 0x2fa,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_9 | 0x29f
};

static const u16 sOam_3150fc[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1ff, OBJ_PALETTE_9 | 0x2dc,
    0xf1, 0x7, OBJ_PALETTE_9 | 0x2dd
};

static const u16 sOam_31510a[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x0, OBJ_PALETTE_9 | 0x2bd
};

static const u16 sOam_315112[OAM_DATA_SIZE(1)] = {
    1,
    0xf9, 0x1ff, OBJ_PALETTE_9 | 0x2fd
};

static const u16 sOam_31511a[OAM_DATA_SIZE(3)] = {
    3,
    0x8, 0x1f6, OBJ_PALETTE_9 | 0x2de,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x2b8,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x8, OBJ_PALETTE_9 | 0x298
};

static const u16 sOam_31512e[OAM_DATA_SIZE(4)] = {
    4,
    0x8, 0x1f8, OBJ_PALETTE_9 | 0x2fe,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x299,
    0x8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x29b,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_9 | 0x29c
};

static const u16 sOam_315148[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1fa, OBJ_PALETTE_9 | 0x2df,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x8, OBJ_PALETTE_9 | 0x29f
};

static const u16 sOam_31515c[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x2f8
};

static const u16 sOam_315164[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x28c
};

static const u16 sOam_31516c[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x288
};

static const u16 sOam_315174[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x284
};

static const u16 sOam_31517c[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x280
};

static const u16 sOam_315184[OAM_DATA_SIZE(1)] = {
    1,
    0xef, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_31518c[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x204
};

static const u16 sOam_315194[OAM_DATA_SIZE(1)] = {
    1,
    0xf1, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x208
};

static const u16 sOam_31519c[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x20c
};

static const u16 sOam_3151a4[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x210
};

static const u16 sOam_3151ac[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x214
};

static const u16 sOam_3151b4[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x218
};

static const u16 sOam_3151bc[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x21c
};

static const u16 sOam_3151c4[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_3151cc[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1ef, OBJ_PALETTE_8 | 0x208
};

const struct FrameData sFrameData_3151d4[2] = {
    [0] = {
        .pFrame = sOam_315068,
        .timer = 255,
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3151e4[3] = {
    [0] = {
        .pFrame = sOam_315068,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_31508e,
        .timer = 4,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3151fc[17] = {
    [0] = {
        .pFrame = sOam_315184,
        .timer = 1,
    },
    [1] = {
        .pFrame = sOam_31517c,
        .timer = 1,
    },
    [2] = {
        .pFrame = sOam_31518c,
        .timer = 1,
    },
    [3] = {
        .pFrame = sOam_3151a4,
        .timer = 1,
    },
    [4] = {
        .pFrame = sOam_315194,
        .timer = 1,
    },
    [5] = {
        .pFrame = sOam_3151ac,
        .timer = 1,
    },
    [6] = {
        .pFrame = sOam_31519c,
        .timer = 1,
    },
    [7] = {
        .pFrame = sOam_3151b4,
        .timer = 1,
    },
    [8] = {
        .pFrame = sOam_315184,
        .timer = 1,
    },
    [9] = {
        .pFrame = sOam_3151bc,
        .timer = 1,
    },
    [10] = {
        .pFrame = sOam_31518c,
        .timer = 1,
    },
    [11] = {
        .pFrame = sOam_3151b4,
        .timer = 1,
    },
    [12] = {
        .pFrame = sOam_315194,
        .timer = 1,
    },
    [13] = {
        .pFrame = sOam_3151ac,
        .timer = 1,
    },
    [14] = {
        .pFrame = sOam_31519c,
        .timer = 1,
    },
    [15] = {
        .pFrame = sOam_3151a4,
        .timer = 1,
    },
    [16] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_315284[7] = {
    [0] = {
        .pFrame = sOam_315164,
        .timer = 6,
    },
    [1] = {
        .pFrame = sOam_31516c,
        .timer = 6,
    },
    [2] = {
        .pFrame = sOam_315174,
        .timer = 6,
    },
    [3] = {
        .pFrame = sOam_31517c,
        .timer = 10,
    },
    [4] = {
        .pFrame = sOam_315174,
        .timer = 6,
    },
    [5] = {
        .pFrame = sOam_31516c,
        .timer = 6,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3152bc[9] = {
    [0] = {
        .pFrame = sOam_3151c4,
        .timer = 6,
    },
    [1] = {
        .pFrame = sOam_31518c,
        .timer = 6,
    },
    [2] = {
        .pFrame = sOam_3151cc,
        .timer = 6,
    },
    [3] = {
        .pFrame = sOam_31519c,
        .timer = 6,
    },
    [4] = {
        .pFrame = sOam_3151a4,
        .timer = 6,
    },
    [5] = {
        .pFrame = sOam_3151ac,
        .timer = 6,
    },
    [6] = {
        .pFrame = sOam_3151b4,
        .timer = 6,
    },
    [7] = {
        .pFrame = sOam_3151bc,
        .timer = 6,
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_315304[19] = {
    [0] = {
        .pFrame = sOam_3150b4,
        .timer = 1,
    },
    [1] = {
        .pFrame = sOam_3150c8,
        .timer = 1,
    },
    [2] = {
        .pFrame = sOam_3150e8,
        .timer = 1,
    },
    [3] = {
        .pFrame = sOam_31511a,
        .timer = 1,
    },
    [4] = {
        .pFrame = sOam_31512e,
        .timer = 1,
    },
    [5] = {
        .pFrame = sOam_315148,
        .timer = 1,
    },
    [6] = {
        .pFrame = sOam_3150fc,
        .timer = 1,
    },
    [7] = {
        .pFrame = sOam_31510a,
        .timer = 1,
    },
    [8] = {
        .pFrame = sOam_315112,
        .timer = 1,
    },
    [9] = {
        .pFrame = sOam_3150b4,
        .timer = 1,
    },
    [10] = {
        .pFrame = sOam_3150c8,
        .timer = 1,
    },
    [11] = {
        .pFrame = sOam_3150e8,
        .timer = 1,
    },
    [12] = {
        .pFrame = sOam_3150fc,
        .timer = 1,
    },
    [13] = {
        .pFrame = sOam_31510a,
        .timer = 1,
    },
    [14] = {
        .pFrame = sOam_315112,
        .timer = 1,
    },
    [15] = {
        .pFrame = sOam_31511a,
        .timer = 1,
    },
    [16] = {
        .pFrame = sOam_31512e,
        .timer = 1,
    },
    [17] = {
        .pFrame = sOam_315148,
        .timer = 1,
    },
    [18] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_31539c[5] = {
    [0] = {
        .pFrame = sOam_3150b4,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_3150c8,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_3150e8,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_31515c,
        .timer = 20,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3153c4[5] = {
    [0] = {
        .pFrame = sOam_3150fc,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_31510a,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_315112,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_31515c,
        .timer = 40,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3153ec[5] = {
    [0] = {
        .pFrame = sOam_31511a,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_31512e,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_315148,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_31515c,
        .timer = 60,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const u32 sVariaXAfterDownloadingGfx[512 * 2] = INCBIN_U32("data/sprites/varia_x_after_downloading.gfx");

static const u8 sBlob_316414_35dd74[] = INCBIN_U8("data/Blob_316414_35dd74.bin");
