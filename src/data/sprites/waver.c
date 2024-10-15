#include "data/sprites/waver.h"
#include "macros.h"

const s16 sWaverDebrisFallingSpeed[30] = {
    -4, -4, -3, -3,
    -2, -2, -1, -1,
    0, 0, 1, 1,
    2, 2, 3, 3,
    4, 4, 5, 5,
    6, 6, 7, 7,
    8, 8, 9, 9,
    10, SHORT_MAX
};

const s16 sWaverFlyingSpeed[12] = {
    0, 1, 2, 3,
    4, 4, 4, 4,
    3, 2, 1, 0
};

const u32 sWaverGfx[512 * 2] = INCBIN_U32("data/sprites/waver.gfx");
const u16 sWaverPal[16 * 2] = INCBIN_U16("data/sprites/waver.pal");

static const u16 sFrameData_317608_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    0xfc, 0x1fd, OBJ_PALETTE_8 | 0x204,
    0xf3, 0x5, OBJ_PALETTE_8 | 0x220,
    0xf8, 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, 0x1f0, OBJ_PALETTE_8 | 0x242,
    0xed, 0x1ff, OBJ_PALETTE_8 | 0x241
};

static const u16 sFrameData_317608_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xfc, 0x1fd, OBJ_PALETTE_8 | 0x205,
    0xf7, 0x1fb, OBJ_PALETTE_8 | 0x260,
    0xf2, 0x5, OBJ_PALETTE_8 | 0x221,
    0xf8, 0x1f2, OBJ_PALETTE_8 | 0x201,
    0xec, 0x1f3, OBJ_PALETTE_8 | 0x240,
    0xe8, 0x1ff, OBJ_PALETTE_8 | 0x241
};

static const u16 sFrameData_317608_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    0xfb, 0x1fe, OBJ_PALETTE_8 | 0x206,
    0xf3, 0x1fc, OBJ_PALETTE_8 | 0x242,
    0xf2, 0x5, OBJ_PALETTE_8 | 0x222,
    0xf9, 0x1f2, OBJ_PALETTE_8 | 0x202,
    0xea, 0x1f3, OBJ_PALETTE_8 | 0x241
};

static const u16 sFrameData_317608_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    0xfa, 0x1fc, OBJ_PALETTE_8 | 0x207,
    0xf2, 0x6, OBJ_PALETTE_8 | 0x223,
    0xf9, 0x1f2, OBJ_PALETTE_8 | 0x203,
    0xf3, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x260,
    0xee, 0x1fe, OBJ_PALETTE_8 | 0x240
};

static const u16 sOam_31752e[OAM_DATA_SIZE(4)] = {
    4,
    0x8, 0x0, OBJ_PALETTE_8 | 0x263,
    0x8, 0x1f8, OBJ_PALETTE_8 | 0x262,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20e,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c
};

static const u16 sFrameData_3175c0_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x210
};

static const u16 sFrameData_317580_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x214
};

static const u16 sFrameData_317590_Frame1[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0x5, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_9 | 0x244
};

static const u16 sFrameData_317590_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x24c
};

static const u16 sFrameData_317590_Frame3[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x218
};

static const u16 sFrameData_317590_Frame4[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x21c
};

const struct FrameData sFrameData_317580[2] = {
    [0] = {
        .pFrame = sFrameData_317580_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_317590[6] = {
    [0] = {
        .pFrame = sFrameData_317580_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sFrameData_317590_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sFrameData_317590_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sFrameData_317590_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sFrameData_317590_Frame4,
        .timer = 10
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3175c0[3] = {
    [0] = {
        .pFrame = sFrameData_317580_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sFrameData_3175c0_Frame1,
        .timer = 10
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3175d8[6] = {
    [0] = {
        .pFrame = sFrameData_317580_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_317590_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sFrameData_317590_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sFrameData_317590_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sFrameData_317590_Frame4,
        .timer = 4
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_317608[5] = {
    [0] = {
        .pFrame = sFrameData_317608_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_317608_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_317608_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFrameData_317608_Frame3,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};
