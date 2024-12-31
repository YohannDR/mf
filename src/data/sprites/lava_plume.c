#include "data/sprites/lava_plume.h"

const u32 sLavaPlumeGfx[1 * 512] = INCBIN_U32("data/sprites/lava_plume.gfx");
const u16 sLavaPlumePal[1 * 16] = INCBIN_U16("data/sprites/lava_plume.pal");

static const u16 sLavaPlumeWarningOam_Idle0_Frame0[] = {
    2,
    0xf9, 0x5, OBJ_PALETTE_8 | 0x234,
    0xf9, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x234
};

static const u16 sLavaPlumeWarningOam_Idle0_Frame1[] = {
    2,
    0xf8, 0x5, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x214
};

static const u16 sLavaPlumeWarningOam_Idle0_Frame2[] = {
    2,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x218,
    0xf1, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x218
};

static const u16 sLavaPlumeWarningOam_Idle1_Frame3[] = {
    2,
    0xf1, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x21c,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c
};

static const u16 sLavaPlumeWarningOam_Idle0_Frame3[] = {
    2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21a,
    0xef, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x21a
};

static const u16 sLavaPlumeOam_GoingUp_Frame0[] = {
    1,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20e
};

static const u16 sLavaPlumeOam_GoingUp_Frame1[] = {
    2,
    0x0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame2[] = {
    3,
    0x6, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0x0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame3[] = {
    4,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x6, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0x0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame4[] = {
    5,
    0x14, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x206,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x6, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0x0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame5[] = {
    5,
    0x16, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x212,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x6, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0x0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame6[] = {
    5,
    0x18, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame7[] = {
    5,
    0x1a, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x212,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame8[] = {
    6,
    0x22, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1a, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x206,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame9[] = {
    6,
    0x28, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1a, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x212,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame10[] = {
    7,
    0x32, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0x26, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1a, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame11[] = {
    11,
    0x43, 0x2, OBJ_PALETTE_8 | 0x237,
    0x43, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x39, 0x2, OBJ_PALETTE_8 | 0x217,
    0x39, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0x32, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0x26, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1a, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x212,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame12[] = {
    12,
    0x42, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x47, 0x2, OBJ_PALETTE_8 | 0x237,
    0x47, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x3d, 0x2, OBJ_PALETTE_8 | 0x217,
    0x3d, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0x32, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0x26, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1a, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x206,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame13[] = {
    12,
    0x4a, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x4b, 0x2, OBJ_PALETTE_8 | 0x237,
    0x4b, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x41, 0x2, OBJ_PALETTE_8 | 0x217,
    0x41, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0x32, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0x26, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1a, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x212,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_GoingUp_Frame14[] = {
    12,
    0x4e, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x4b, 0x2, OBJ_PALETTE_8 | 0x237,
    0x4b, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x41, 0x2, OBJ_PALETTE_8 | 0x217,
    0x41, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0x32, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0x26, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1a, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_Idle_Frame0[] = {
    12,
    0x52, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x4b, 0x2, OBJ_PALETTE_8 | 0x237,
    0x4b, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x41, 0x2, OBJ_PALETTE_8 | 0x217,
    0x41, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0x32, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0x26, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1a, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x212,
    0xe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0x4, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_Stopping_Frame0[] = {
    11,
    0x42, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x3b, 0x2, OBJ_PALETTE_8 | 0x237,
    0x3b, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x31, 0x2, OBJ_PALETTE_8 | 0x217,
    0x31, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0x26, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0x1a, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x10, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x206,
    0x6, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xfe, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x210,
    0xfa, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_Stopping_Frame1[] = {
    10,
    0x2d, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x2a, 0x2, OBJ_PALETTE_8 | 0x237,
    0x2a, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x20, 0x2, OBJ_PALETTE_8 | 0x217,
    0x20, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0x15, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0xb, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0x1, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x212,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xfb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_Stopping_Frame2[] = {
    9,
    0x23, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x20, 0x2, OBJ_PALETTE_8 | 0x237,
    0x20, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x16, 0x2, OBJ_PALETTE_8 | 0x217,
    0x16, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0xd, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0x3, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0xf9, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xfb, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sLavaPlumeOam_Stopping_Frame3[] = {
    8,
    0x15, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x14, 0x2, OBJ_PALETTE_8 | 0x237,
    0x14, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xa, 0x2, OBJ_PALETTE_8 | 0x217,
    0xa, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0x1, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20c,
    0xfb, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x20e
};

static const u16 sLavaPlumeOam_Stopping_Frame4[] = {
    6,
    0x9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0xc, 0x2, OBJ_PALETTE_8 | 0x237,
    0xc, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0x2, 0x2, OBJ_PALETTE_8 | 0x217,
    0x2, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216
};

static const u16 sLavaPlumeOam_Stopping_Frame5[] = {
    5,
    0x2, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e,
    0x3, 0x2, OBJ_PALETTE_8 | 0x237,
    0x3, 0x1f8, OBJ_PALETTE_8 | 0x236,
    0xf9, 0x2, OBJ_PALETTE_8 | 0x217,
    0xf9, 0x1f8, OBJ_PALETTE_8 | 0x216
};

static const u16 sLavaPlumeOam_Stopping_Frame6[] = {
    1,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x21e
};

const struct FrameData sLavaPlumeWarningOam_Idle0[5] = {
    [0] = {
        .pFrame = sLavaPlumeWarningOam_Idle0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sLavaPlumeWarningOam_Idle0_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sLavaPlumeWarningOam_Idle0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sLavaPlumeWarningOam_Idle0_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLavaPlumeWarningOam_Idle1[6] = {
    [0] = {
        .pFrame = sLavaPlumeWarningOam_Idle0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sLavaPlumeWarningOam_Idle0_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sLavaPlumeWarningOam_Idle0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sLavaPlumeWarningOam_Idle1_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sLavaPlumeWarningOam_Idle0_Frame3,
        .timer = 2
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLavaPlumeOam_GoingUp[16] = {
    [0] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame7,
        .timer = 1
    },
    [8] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame9,
        .timer = 2
    },
    [10] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame10,
        .timer = 2
    },
    [11] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame11,
        .timer = 2
    },
    [12] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame12,
        .timer = 2
    },
    [13] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame13,
        .timer = 2
    },
    [14] = {
        .pFrame = sLavaPlumeOam_GoingUp_Frame14,
        .timer = 2
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLavaPlumeOam_Idle[2] = {
    [0] = {
        .pFrame = sLavaPlumeOam_Idle_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLavaPlumeOam_Stopping[8] = {
    [0] = {
        .pFrame = sLavaPlumeOam_Stopping_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sLavaPlumeOam_Stopping_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sLavaPlumeOam_Stopping_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sLavaPlumeOam_Stopping_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sLavaPlumeOam_Stopping_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sLavaPlumeOam_Stopping_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sLavaPlumeOam_Stopping_Frame6,
        .timer = 4
    },
    [7] = FRAME_DATA_TERMINATOR
};
