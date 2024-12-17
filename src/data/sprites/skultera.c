#include "data/sprites/skultera.h"

const u32 sSkulteraGfx[2 * 512] = INCBIN_U32("data/sprites/skultera.gfx");
const u16 sSkulteraPal[2 * 16] = INCBIN_U16("data/sprites/skultera.pal");

static const u16 sSkulteraOam_IdleSmall_Frame0[] = {
    5,
    0xea, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f2, OBJ_PALETTE_8 | 0x260,
    0xf3, 0x1fe, OBJ_PALETTE_8 | 0x200,
    0xf4, 0x3, OBJ_PALETTE_8 | 0x201,
    0xf4, 0x7, OBJ_PALETTE_8 | 0x203
};

static const u16 sSkulteraOam_IdleSmall_Frame1[] = {
    5,
    0xea, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f2, OBJ_PALETTE_8 | 0x262,
    0xf4, 0x1fe, OBJ_PALETTE_8 | 0x201,
    0xf6, 0x3, OBJ_PALETTE_8 | 0x202,
    0xf4, 0x7, OBJ_PALETTE_8 | 0x204
};

static const u16 sSkulteraOam_IdleSmall_Frame2[] = {
    5,
    0xea, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f2, OBJ_PALETTE_8 | 0x262,
    0xf6, 0x1fe, OBJ_PALETTE_8 | 0x202,
    0xf3, 0x3, OBJ_PALETTE_8 | 0x200,
    0xf4, 0x7, OBJ_PALETTE_8 | 0x205
};

static const u16 sSkulteraOam_TurningAroundSmall_Frame0[] = {
    5,
    0xea, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f2, OBJ_PALETTE_8 | 0x262,
    0xf4, 0x8, OBJ_PALETTE_8 | 0x203,
    0xf4, 0x3, OBJ_PALETTE_8 | 0x201,
    0xf3, 0x1fe, OBJ_PALETTE_8 | 0x200
};

static const u16 sSkulteraOam_TurningAroundSmall_Frame1[] = {
    5,
    0xea, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f3, OBJ_PALETTE_8 | 0x264,
    0xf4, 0x1fc, OBJ_PALETTE_8 | 0x201,
    0xf6, 0x1, OBJ_PALETTE_8 | 0x202,
    0xf4, 0x6, OBJ_PALETTE_8 | 0x204
};

static const u16 sSkulteraOam_TurningAroundSmall_Frame2[] = {
    4,
    0xea, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x226,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f2, OBJ_PALETTE_8 | 0x266,
    0xf3, 0x1fe, OBJ_PALETTE_8 | 0x200,
    0xf4, 0x3, OBJ_PALETTE_8 | 0x205
};

static const u16 sSkulteraOam_TurningAroundSmall_Frame3[] = {
    4,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x264,
    0xf3, OBJ_X_FLIP | 0x1ee, OBJ_PALETTE_8 | 0x200,
    0xf4, 0x1fd, OBJ_PALETTE_8 | 0x203
};

static const u16 sSkulteraOam_TurningAroundSmall_Frame4[] = {
    3,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x262,
    0xf3, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x201
};

static const u16 sSkulteraOam_TurningAroundSmall_Frame5[] = {
    4,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x260,
    0xf6, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x202,
    0xf3, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x200
};

static const u16 sSkulteraOam_TurningAroundSmall_Frame6[] = {
    5,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x262,
    0xf3, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x200,
    0xf6, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x202,
    0xf4, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sSkulteraOam_TurningAroundSmall_Frame7[] = {
    5,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x262,
    0xf6, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x202,
    0xf3, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x200,
    0xf4, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x205
};

static const u16 sSkulteraOam_IdleLarge_Frame0[] = {
    5,
    0xe2, OBJ_SIZE_32x32 | 0x1ee, OBJ_PALETTE_9 | 0x208,
    0xda, 0x1fb, OBJ_PALETTE_9 | 0x206,
    0xf1, 0x0, OBJ_PALETTE_9 | 0x200,
    0xf3, 0x4, OBJ_PALETTE_9 | 0x201,
    OBJ_SHAPE_VERTICAL | 0xef, 0xa, OBJ_PALETTE_9 | 0x214
};

static const u16 sSkulteraOam_IdleLarge_Frame1[] = {
    5,
    0xd9, 0x1f9, OBJ_PALETTE_9 | 0x207,
    0xe1, OBJ_SIZE_32x32 | 0x1e6, OBJ_PALETTE_9 | 0x20b,
    0xf3, 0x0, OBJ_PALETTE_9 | 0x201,
    0xf5, 0x6, OBJ_PALETTE_9 | 0x202,
    0xf3, 0xb, OBJ_PALETTE_9 | 0x254
};

static const u16 sSkulteraOam_IdleLarge_Frame2[] = {
    5,
    0xd9, 0x1f9, OBJ_PALETTE_9 | 0x207,
    0xe1, OBJ_SIZE_32x32 | 0x1e6, OBJ_PALETTE_9 | 0x20b,
    0xf4, 0x1, OBJ_PALETTE_9 | 0x202,
    0xf2, 0x6, OBJ_PALETTE_9 | 0x200,
    0xf3, 0xb, OBJ_PALETTE_9 | 0x205
};

static const u16 sSkulteraOam_IdleLarge_Frame3[] = {
    5,
    0xd9, 0x1f9, OBJ_PALETTE_9 | 0x207,
    0xe1, OBJ_SIZE_32x32 | 0x1e6, OBJ_PALETTE_9 | 0x20b,
    0xf2, 0x0, OBJ_PALETTE_9 | 0x201,
    0xf3, 0x5, OBJ_PALETTE_9 | 0x202,
    0xf0, 0xa, OBJ_PALETTE_9 | 0x254
};

static const u16 sSkulteraOam_TurningAroundLarge_Frame0[] = {
    5,
    0xd9, 0x1f9, OBJ_PALETTE_9 | 0x207,
    0xe1, OBJ_SIZE_32x32 | 0x1e6, OBJ_PALETTE_9 | 0x20b,
    0xf1, 0x0, OBJ_PALETTE_9 | 0x201,
    0xf3, 0x6, OBJ_PALETTE_9 | 0x202,
    0xf3, 0xb, OBJ_PALETTE_9 | 0x254
};

static const u16 sSkulteraOam_TurningAroundLarge_Frame1[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x1f2, OBJ_PALETTE_9 | 0x20f,
    0xd9, 0x1f9, OBJ_PALETTE_9 | 0x213,
    0xf9, 0x2, OBJ_PALETTE_9 | 0x233,
    0xf2, 0x1fc, OBJ_PALETTE_9 | 0x201,
    0xf4, 0x1, OBJ_PALETTE_9 | 0x202,
    0xf2, 0x6, OBJ_PALETTE_9 | 0x204
};

static const u16 sSkulteraOam_TurningAroundLarge_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x1f0, OBJ_PALETTE_9 | 0x211,
    0xf9, 0x0, OBJ_PALETTE_9 | 0x273,
    0xd9, 0x1f7, OBJ_PALETTE_9 | 0x253,
    0xf1, 0x1fe, OBJ_PALETTE_9 | 0x200,
    0xf2, 0x3, OBJ_PALETTE_9 | 0x205
};

static const u16 sSkulteraOam_TurningAroundLarge_Frame3[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1f0, OBJ_PALETTE_9 | 0x20f,
    0xd9, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_9 | 0x213,
    0xf9, OBJ_X_FLIP | 0x1e8, OBJ_PALETTE_9 | 0x233,
    0xf1, OBJ_X_FLIP | 0x1ed, OBJ_PALETTE_9 | 0x200,
    0xf3, 0x1fd, OBJ_PALETTE_9 | 0x203
};

static const u16 sSkulteraOam_TurningAroundLarge_Frame4[] = {
    3,
    0xd9, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_9 | 0x207,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x20b,
    0xf1, OBJ_X_FLIP | 0x1ee, OBJ_PALETTE_9 | 0x201
};

static const u16 sSkulteraOam_TurningAroundLarge_Frame5[] = {
    4,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1eb, OBJ_PALETTE_9 | 0x208,
    0xda, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_9 | 0x206,
    0xf4, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_9 | 0x202,
    0xf1, OBJ_X_FLIP | 0x1ee, OBJ_PALETTE_9 | 0x200
};

static const u16 sSkulteraOam_TurningAroundLarge_Frame6[] = {
    5,
    0xd9, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_9 | 0x207,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f6, OBJ_PALETTE_9 | 0x20b,
    0xf1, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_9 | 0x200,
    0xf4, OBJ_X_FLIP | 0x1ef, OBJ_PALETTE_9 | 0x202,
    0xf2, OBJ_X_FLIP | 0x1ed, OBJ_PALETTE_9 | 0x204
};

static const u16 sSkulteraOam_TurningAroundLarge_Frame7[] = {
    5,
    0xd9, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_9 | 0x207,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1fa, OBJ_PALETTE_9 | 0x20b,
    0xf4, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x202,
    0xf1, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_9 | 0x200,
    0xf2, OBJ_X_FLIP | 0x1ee, OBJ_PALETTE_9 | 0x205
};

const struct FrameData sSkulteraOam_IdleSmall[4] = {
    [0] = {
        .pFrame = sSkulteraOam_IdleSmall_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sSkulteraOam_IdleSmall_Frame1,
        .timer = 14
    },
    [2] = {
        .pFrame = sSkulteraOam_IdleSmall_Frame2,
        .timer = 14
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSkulteraOam_TurningAroundSmall[9] = {
    [0] = {
        .pFrame = sSkulteraOam_TurningAroundSmall_Frame0,
        .timer = 13
    },
    [1] = {
        .pFrame = sSkulteraOam_TurningAroundSmall_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sSkulteraOam_TurningAroundSmall_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSkulteraOam_TurningAroundSmall_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sSkulteraOam_TurningAroundSmall_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sSkulteraOam_TurningAroundSmall_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sSkulteraOam_TurningAroundSmall_Frame6,
        .timer = 10
    },
    [7] = {
        .pFrame = sSkulteraOam_TurningAroundSmall_Frame7,
        .timer = 13
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSkulteraOam_ChasingSmall[4] = {
    [0] = {
        .pFrame = sSkulteraOam_IdleSmall_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sSkulteraOam_IdleSmall_Frame1,
        .timer = 9
    },
    [2] = {
        .pFrame = sSkulteraOam_IdleSmall_Frame2,
        .timer = 9
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSkulteraOam_IdleLarge[5] = {
    [0] = {
        .pFrame = sSkulteraOam_IdleLarge_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sSkulteraOam_IdleLarge_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sSkulteraOam_IdleLarge_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sSkulteraOam_IdleLarge_Frame3,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSkulteraOam_TurningAroundLarge[9] = {
    [0] = {
        .pFrame = sSkulteraOam_TurningAroundLarge_Frame0,
        .timer = 13
    },
    [1] = {
        .pFrame = sSkulteraOam_TurningAroundLarge_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sSkulteraOam_TurningAroundLarge_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSkulteraOam_TurningAroundLarge_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sSkulteraOam_TurningAroundLarge_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sSkulteraOam_TurningAroundLarge_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sSkulteraOam_TurningAroundLarge_Frame6,
        .timer = 10
    },
    [7] = {
        .pFrame = sSkulteraOam_TurningAroundLarge_Frame7,
        .timer = 13
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSkulteraOam_ChasingLarge[5] = {
    [0] = {
        .pFrame = sSkulteraOam_IdleLarge_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSkulteraOam_IdleLarge_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSkulteraOam_IdleLarge_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSkulteraOam_IdleLarge_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};
