#include "data/sprites/message_box.h"

const u32 sMessageBoxGfx[512 * 2] = INCBIN_U32("data/sprites/message_box.gfx");
const u16 sMessageBoxPal[16 * 2] = INCBIN_U16("data/sprites/message_box.pal");

static const u16 sMessageBoxOam_31f730_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x21e
};

static const u16 sMessageBoxOam_31f730_Frame1[] = {
    1,
    0xfc, 0x1fd, OBJ_PALETTE_8 | 0x21e
};

static const u16 sMessageBoxOam_31f730_Frame2[] = {
    1,
    0xfc, 0x1fe, OBJ_PALETTE_8 | 0x21e
};

static const u16 sMessageBoxOam_31f758_Frame0[] = {
    2,
    0xfc, 0x1f8, OBJ_PALETTE_8 | 0x21d,
    0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21d
};

static const u16 sMessageBoxOam_31f758_Frame1[] = {
    3,
    0xfc, 0x1e8, OBJ_PALETTE_8 | 0x21d,
    0xfc, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f758_Frame2[] = {
    5,
    0xfc, 0x1c8, OBJ_PALETTE_8 | 0x21d,
    0xfc, OBJ_X_FLIP | 0x30, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x10, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f758_Frame3[] = {
    7,
    0xfc, 0x1a8, OBJ_PALETTE_8 | 0x21d,
    0xfc, OBJ_X_FLIP | 0x50, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x30, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f758_Frame4[] = {
    9,
    0xfc, 0x188, OBJ_PALETTE_8 | 0x21d,
    0xfc, OBJ_X_FLIP | 0x70, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x50, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f758_Frame5[] = {
    18,
    0xfa, 0x188, OBJ_PALETTE_8 | 0x21d,
    0xfa, OBJ_X_FLIP | 0x70, OBJ_PALETTE_8 | 0x21d,
    0xfe, 0x188, OBJ_PALETTE_8 | 0x21d,
    0xfe, OBJ_X_FLIP | 0x70, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x8 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x8 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x8 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x8 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x8 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x8 | 0x50, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x8 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x8 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x8 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x8 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x8 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x8 | 0x50, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f758_Frame6[] = {
    9,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x188, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x70, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x50, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f758_Frame7[] = {
    18,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x188, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_X_FLIP | 0x70, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_Y_FLIP | 0x188, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | OBJ_Y_FLIP | 0x70, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_SIZE_32x16 | 0x50, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x50, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f758_Frame8[] = {
    18,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x188, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_X_FLIP | 0x70, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xfc, OBJ_Y_FLIP | 0x188, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x70, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x50, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x50, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f758_Frame9[] = {
    18,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x188, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x70, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xfe, OBJ_Y_FLIP | 0x188, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | 0x70, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x50, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x190, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1b0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x30, OBJ_PALETTE_8 | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x50, OBJ_PALETTE_8 | 0x25c
};

static const u16 sMessageBoxOam_31f808_Frame0[] = {
    18,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x190, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1b0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x30, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x50, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x188, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x70, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x188, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x70, OBJ_PALETTE_8 | 0x23d,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x190, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1b0, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1d0, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x10, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x30, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x50, OBJ_PALETTE_8 | 0x258
};

static const u16 sOam_31f72c[] = {
    0
};

const struct FrameData sMessageBoxOam_31f730[5] = {
    [0] = {
        .pFrame = sMessageBoxOam_31f730_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sMessageBoxOam_31f730_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sMessageBoxOam_31f730_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sMessageBoxOam_31f730_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMessageBoxOam_31f758[11] = {
    [0] = {
        .pFrame = sMessageBoxOam_31f758_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sMessageBoxOam_31f758_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sMessageBoxOam_31f758_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sMessageBoxOam_31f758_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sMessageBoxOam_31f758_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sMessageBoxOam_31f758_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sMessageBoxOam_31f758_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sMessageBoxOam_31f758_Frame7,
        .timer = 2
    },
    [8] = {
        .pFrame = sMessageBoxOam_31f758_Frame8,
        .timer = 3
    },
    [9] = {
        .pFrame = sMessageBoxOam_31f758_Frame9,
        .timer = 3
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMessageBoxOam_31f7b0[11] = {
    [0] = {
        .pFrame = sMessageBoxOam_31f758_Frame9,
        .timer = 3
    },
    [1] = {
        .pFrame = sMessageBoxOam_31f758_Frame8,
        .timer = 3
    },
    [2] = {
        .pFrame = sMessageBoxOam_31f758_Frame7,
        .timer = 2
    },
    [3] = {
        .pFrame = sMessageBoxOam_31f758_Frame6,
        .timer = 2
    },
    [4] = {
        .pFrame = sMessageBoxOam_31f758_Frame5,
        .timer = 2
    },
    [5] = {
        .pFrame = sMessageBoxOam_31f758_Frame4,
        .timer = 1
    },
    [6] = {
        .pFrame = sMessageBoxOam_31f758_Frame3,
        .timer = 1
    },
    [7] = {
        .pFrame = sMessageBoxOam_31f758_Frame2,
        .timer = 1
    },
    [8] = {
        .pFrame = sMessageBoxOam_31f758_Frame1,
        .timer = 1
    },
    [9] = {
        .pFrame = sMessageBoxOam_31f758_Frame0,
        .timer = 1
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMessageBoxOam_31f808[2] = {
    [0] = {
        .pFrame = sMessageBoxOam_31f808_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
