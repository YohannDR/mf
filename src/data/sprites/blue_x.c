#include "data/sprites/blue_x.h"
#include "macros.h"

const s16 sBlueXIdleYMovement[65] = {
     0,  0,  0,  0,
     1,  1,  1,  1,
     2,  2,  2,  2,
     3,  3,  3,  3,
     3,  3,  3,  3,
     2,  2,  2,  2,
     1,  1,  1,  1,
     0,  0,  0,  0,
     0,  0,  0,  0,
    -1, -1, -1, -1,
    -2, -2, -2, -2,
    -3, -3, -3, -3,
    -3, -3, -3, -3,
    -2, -2, -2, -2,
    -1, -1, -1, -1,
     0, 0, 0, 0,
     SHORT_MAX
};

const s16 sBlueXIdleXMovement[81] = {
     0,  0,  1,  1,
     2,  2,  3,  3,
     4,  4,  5,  5,
     6,  6,  7,  7,
     7,  7,  8,  8,
     8,  8,  7,  7,
     7,  7,  6,  6,
     5,  5,  4,  4,
     3,  3,  2,  2,
     1,  1,  0,  0,
     0,  0, -1, -1,
    -2, -2, -3, -3,
    -4, -4, -5, -5,
    -6, -6, -7, -7,
    -7, -7, -8, -8,
    -8, -8, -7, -7,
    -7, -7, -6, -6,
    -5, -5, -4, -4,
    -3, -3, -2, -2,
    -1, -1,  0,  0,
     SHORT_MAX
};

const u32 sBlueXGfx[1024] = INCBIN_U32("data/sprites/blue_x.gfx");
const u16 sBlueXPal[2 * 16] = INCBIN_U16("data/sprites/blue_x.pal");

static const u16 sBlueXOam_Moving_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x200
};

static const u16 sBlueXOam_Moving_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x204
};

static const u16 sBlueXOam_Moving_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x208
};

static const u16 sBlueXOam_Moving_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x20c
};

static const u16 sBlueXOam_Moving_Frame4[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x210
};

static const u16 sBlueXOam_Moving_Frame5[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x214
};

static const u16 sBlueXOam_Frame_35ef08[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x259
};

static const u16 sBlueXOam_Frame_35ef10[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x25a
};

static const u16 sBlueXOam_Frame_35ef18[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x25b
};

static const u16 sBlueXOam_Frame_35ef20[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x25c
};

static const u16 sBlueXOam_Frame_35ef28[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x25d
};

static const u16 sBlueXOam_Frame_35ef30[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x25e
};

static const u16 sBlueXOam_Frame_35ef38[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x25f
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame0[OAM_DATA_SIZE(7)] = {
    0x7,
    0xf4, 0x13, OBJ_SPRITE_OAM | 0x259,
    0x0, 0x1fc, OBJ_SPRITE_OAM | 0x25e,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x218,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x218,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x218,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x218,
    0x11, 0x1f1, OBJ_SPRITE_OAM | 0x25f
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame4[OAM_DATA_SIZE(8)] = {
    0x8,
    0xf6, 0xe, OBJ_SPRITE_OAM | 0x25a,
    0xe8, 0x1e8, OBJ_SPRITE_OAM | 0x259,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21a,
    0xfe, 0x1fc, OBJ_SPRITE_OAM | 0x25f,
    0xf4, 0x13, OBJ_SPRITE_OAM | 0x25c
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame8[OAM_DATA_SIZE(9)] = {
    0x9,
    0xf8, 0xa, OBJ_SPRITE_OAM | 0x25b,
    0xee, 0x1eb, OBJ_SPRITE_OAM | 0x25a,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21c,
    0xe8, 0x1e8, OBJ_SPRITE_OAM | 0x25c,
    0xf4, 0x13, OBJ_SPRITE_OAM | 0x25d,
    0xf6, 0xe, OBJ_SPRITE_OAM | 0x25c
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame12[OAM_DATA_SIZE(11)] = {
    0xb,
    0xf9, 0x6, OBJ_SPRITE_OAM | 0x25c,
    0xf2, 0x1ed, OBJ_SPRITE_OAM | 0x25b,
    0x14, 0x1ec, OBJ_SPRITE_OAM | 0x259,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21e,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21e,
    0xe8, 0x1e8, OBJ_SPRITE_OAM | 0x25d,
    0xf4, 0x13, OBJ_SPRITE_OAM | 0x25e,
    0xf6, 0xe, OBJ_SPRITE_OAM | 0x25d,
    0xee, 0x1eb, OBJ_SPRITE_OAM | 0x25c
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame16[OAM_DATA_SIZE(12)] = {
    0xc,
    0xfb, 0x3, OBJ_SPRITE_OAM | 0x25d,
    0xf5, 0x1f1, OBJ_SPRITE_OAM | 0x25c,
    0x11, 0x1f1, OBJ_SPRITE_OAM | 0x25a,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x218,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x218,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x218,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x218,
    0x14, 0x1ec, OBJ_SPRITE_OAM | 0x25c,
    0xe8, 0x1e8, OBJ_SPRITE_OAM | 0x25e,
    0xf4, 0x13, OBJ_SPRITE_OAM | 0x25f,
    0xf6, 0xe, OBJ_SPRITE_OAM | 0x25e,
    0xee, 0x1eb, OBJ_SPRITE_OAM | 0x25d
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame20[OAM_DATA_SIZE(12)] = {
    0xc,
    0xfc, 0x0, OBJ_SPRITE_OAM | 0x25e,
    0xf8, 0x1f5, OBJ_SPRITE_OAM | 0x25d,
    0xb, 0x1f5, OBJ_SPRITE_OAM | 0x25b,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21a,
    0x14, 0x1ec, OBJ_SPRITE_OAM | 0x25d,
    0xe8, 0x1e8, OBJ_SPRITE_OAM | 0x25f,
    0xf6, 0xe, OBJ_SPRITE_OAM | 0x25f,
    0xee, 0x1eb, OBJ_SPRITE_OAM | 0x25e,
    0x11, 0x1f1, OBJ_SPRITE_OAM | 0x25c
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame24[OAM_DATA_SIZE(10)] = {
    0xa,
    0xfc, 0x1fe, OBJ_SPRITE_OAM | 0x25f,
    0xfa, 0x1f8, OBJ_SPRITE_OAM | 0x25e,
    0x6, 0x1f8, OBJ_SPRITE_OAM | 0x25c,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21c,
    0x14, 0x1ec, OBJ_SPRITE_OAM | 0x25e,
    0xee, 0x1eb, OBJ_SPRITE_OAM | 0x25f,
    0x11, 0x1f1, OBJ_SPRITE_OAM | 0x25d
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame28[OAM_DATA_SIZE(7)] = {
    0x7,
    0x2, 0x1fb, OBJ_SPRITE_OAM | 0x25d,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21e,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x21e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x21e,
    0x14, 0x1ec, OBJ_SPRITE_OAM | 0x25f,
    0x11, 0x1f1, OBJ_SPRITE_OAM | 0x25e
};

static const u16 sBlueXAbsorbtionOam_FadingAway_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x218,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x218,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x218,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x218
};

static const u16 sBlueXAbsorbtionOam_FadingAway_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_SPRITE_OAM | 0x21a,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_SPRITE_OAM | 0x21a,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_SPRITE_OAM | 0x21a,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f1, OBJ_SPRITE_OAM | 0x21a
};

static const u16 sBlueXAbsorbtionOam_FadingAway_Frame4[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x21c,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_SPRITE_OAM | 0x21c,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_SPRITE_OAM | 0x21c,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x21c
};

static const u16 sBlueXAbsorbtionOam_FadingAway_Frame6[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf9, 0x1f8, OBJ_SPRITE_OAM | 0x27b,
    0xf9, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x27b,
    0xff, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_SPRITE_OAM | 0x27b,
    0xff, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x27b
};

static const u16 sBlueXAbsorbtionOam_FadingAway_Frame8[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1e0, OBJ_SPRITE_OAM | 0x27c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | OBJ_SIZE_32x8 | 0x0, OBJ_SPRITE_OAM | 0x27c
};

static const u16 sBlueXAbsorbtionOam_FadingAway_Frame10[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_SPRITE_OAM | 0x27c,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x27c
};

static const u16 sBlueXAbsorbtionOam_FadingAway_Frame12[OAM_DATA_SIZE(2)] = {
    0x2,
    0xfb, 0x1f8, OBJ_SPRITE_OAM | 0x27c,
    0xfb, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x27c
};

static const u16 sBlueXAbsorbtionOam_FadingAway_Frame14[OAM_DATA_SIZE(2)] = {
    0x2,
    0xfb, 0x1f9, OBJ_SPRITE_OAM | 0x27c,
    0xfb, OBJ_X_FLIP | 0x1ff, OBJ_SPRITE_OAM | 0x27c
};

static const u16 sBlueXAbsorbtionOam_Absorbing_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x258
};


const struct FrameData sBlueXOam_Moving[7] = {
    [0] = {
        .pFrame = sBlueXOam_Moving_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sBlueXOam_Moving_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sBlueXOam_Moving_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sBlueXOam_Moving_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sBlueXOam_Moving_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sBlueXOam_Moving_Frame5,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBlueXOam_Idle[7] = {
    [0] = {
        .pFrame = sBlueXOam_Moving_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sBlueXOam_Moving_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sBlueXOam_Moving_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sBlueXOam_Moving_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sBlueXOam_Moving_Frame4,
        .timer = 10
    },
    [5] = {
        .pFrame = sBlueXOam_Moving_Frame5,
        .timer = 10
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBlueXAbsorbtionOam_Absorbing[33] = {
    [0] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame0,
        .timer = 1
    },
    [3] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame4,
        .timer = 1
    },
    [7] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame8,
        .timer = 1
    },
    [11] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame12,
        .timer = 1
    },
    [15] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [16] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [18] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame16,
        .timer = 1
    },
    [19] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [20] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [22] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame20,
        .timer = 1
    },
    [23] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [24] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame24,
        .timer = 1
    },
    [25] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [26] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame24,
        .timer = 1
    },
    [27] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [28] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame28,
        .timer = 1
    },
    [29] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [30] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame28,
        .timer = 1
    },
    [31] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [32] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBlueXAbsorbtionOam_FadingAway[16] = {
    [0] = {
        .pFrame = sBlueXAbsorbtionOam_FadingAway_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sBlueXAbsorbtionOam_FadingAway_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sBlueXAbsorbtionOam_FadingAway_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sBlueXAbsorbtionOam_FadingAway_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sBlueXAbsorbtionOam_FadingAway_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sBlueXAbsorbtionOam_FadingAway_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sBlueXAbsorbtionOam_FadingAway_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sBlueXAbsorbtionOam_Absorbing_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sBlueXAbsorbtionOam_FadingAway_Frame14,
        .timer = 1
    },
    [15] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBlueXOam_Stunned[5] = {
    [0] = {
        .pFrame = sBlueXOam_Moving_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sBlueXOam_Moving_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sBlueXOam_Moving_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sBlueXOam_Moving_Frame1,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};
