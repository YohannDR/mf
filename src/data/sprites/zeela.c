#include "data/sprites/zeela.h"

const s16 sZeelaProjectileMovement[32] = {
    -4, -12, -11, -10,
    -9, -8, -7, -6,
    -5, -4, -3, -2,
    -1, 0, 0, 0,
    0, 0, 0, 1,
    2, 3, 4, 5,
    6, 7, 8, 9,
    10, 11, 12, SHORT_MAX
};

const u32 sZeelaGfx[2 * 512] = INCBIN_U32("data/sprites/zeela.gfx");
const u16 sZeelaPal[2 * 16] = INCBIN_U16("data/sprites/zeela.pal");

static const u16 sZeelaOam_350584_Frame0[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf8, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f4, OBJ_PALETTE_8 | 0x20e,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x237,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a
};

static const u16 sZeelaOam_350584_Frame1[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xfa, 0x1f2, OBJ_PALETTE_8 | 0x238,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x211,
    0xf1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20f,
    0xf9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x237,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a
};

static const u16 sZeelaOam_350584_Frame2[] = {
    6,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf8, 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x211,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x213,
    0xf9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c
};

static const u16 sZeelaOam_350584_Frame3[] = {
    6,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xfa, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x238,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x215,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x213,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x237,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c
};

static const u16 sZeelaOam_350584_Frame4[] = {
    6,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf8, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x20e,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a
};

static const u16 sZeelaOam_3505b4_Frame0[] = {
    6,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f4, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x20e,
    0xf9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a
};

static const u16 sZeelaOam_3505b4_Frame1[] = {
    6,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f4, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x20e,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x237,
    0xf9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x237,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c
};

static const u16 sZeelaOam_3505b4_Frame2[] = {
    6,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x20f,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20f,
    0xf9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c
};

static const u16 sZeelaOam_3505b4_Frame3[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f4, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x20e,
    0xf9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c
};

static const u16 sZeelaOam_3502e2[] = {
    6,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xef, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x211,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x211,
    0xf9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a
};

static const u16 sZeelaOam_350308[] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x20f,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20f,
    0xf9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x217,
    0xf9, 0x1f3, OBJ_PALETTE_8 | 0x217,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c
};

static const u16 sZeelaOam_3505dc_Frame0[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x240,
    0x5, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x257,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x24f,
    0xf3, 0x1ff, OBJ_PALETTE_8 | 0x277,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24a
};

static const u16 sZeelaOam_3505dc_Frame1[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x242,
    0xf2, 0x1fe, OBJ_PALETTE_8 | 0x278,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x24f,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x251,
    0x5, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24a
};

static const u16 sZeelaOam_3505dc_Frame2[] = {
    7,
    0xf8, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x240,
    0xf3, 0x0, OBJ_PALETTE_8 | 0x24e,
    0xef, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x257,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x253,
    0x5, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24c
};

static const u16 sZeelaOam_3505dc_Frame3[] = {
    6,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x242,
    0x6, OBJ_Y_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x278,
    0xf0, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x253,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x255,
    0xf3, 0x1ff, OBJ_PALETTE_8 | 0x277,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24c
};

static const u16 sZeelaOam_3505dc_Frame4[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x240,
    0x5, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x24e,
    0xf2, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x255,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x257,
    0xf3, 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0xf8, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x24a
};

static const u16 sZeelaOam_35060c_Frame0[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1fe, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_Y_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x257,
    0xf3, 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0x5, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24a
};

static const u16 sZeelaOam_35060c_Frame1[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ff, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x257,
    0xf3, 0x1ff, OBJ_PALETTE_8 | 0x277,
    0x5, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x277,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x24c
};

static const u16 sZeelaOam_35060c_Frame2[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x244,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x24f,
    0xf3, 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0x5, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0xf8, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x24c,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x24f
};

static const u16 sZeelaOam_35060c_Frame3[] = {
    6,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ff, OBJ_PALETTE_8 | 0x257,
    0xf3, 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0x5, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x24e,
    0xf8, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x257
};

static const u16 sZeelaOam_350634_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x219
};

static const u16 sZeelaOam_350634_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x21a
};

static const u16 sZeelaOam_35064c_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b
};

static const u16 sZeelaOam_35064c_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21d
};

static const u16 sZeelaOam_35064c_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x218
};

static const u16 sZeelaOam_35066c_Frame0[] = {
    4,
    0xfb, 0x1fb, OBJ_PALETTE_8 | 0x239,
    0xff, 0x1fb, OBJ_PALETTE_8 | 0x239,
    0xfb, 0x1ff, OBJ_PALETTE_8 | 0x239,
    0xff, 0x1ff, OBJ_PALETTE_8 | 0x239
};

static const u16 sZeelaOam_35066c_Frame1[] = {
    4,
    0xfa, 0x1fa, OBJ_PALETTE_8 | 0x23a,
    0x0, 0x1fa, OBJ_PALETTE_8 | 0x23a,
    0xfa, 0x0, OBJ_PALETTE_8 | 0x23a,
    0x0, 0x0, OBJ_PALETTE_8 | 0x23a
};

static const u16 sZeelaOam_35066c_Frame2[] = {
    4,
    0xf9, 0x1f9, OBJ_PALETTE_8 | 0x239,
    0x1, 0x1f9, OBJ_PALETTE_8 | 0x239,
    0xf9, 0x1, OBJ_PALETTE_8 | 0x239,
    0x1, 0x1, OBJ_PALETTE_8 | 0x239
};

static const u16 sZeelaOam_35066c_Frame3[] = {
    4,
    0xf7, 0x1f7, OBJ_PALETTE_8 | 0x23a,
    0x3, 0x1f7, OBJ_PALETTE_8 | 0x23a,
    0xf7, 0x3, OBJ_PALETTE_8 | 0x23a,
    0x3, 0x3, OBJ_PALETTE_8 | 0x23a
};

static const u16 sZeelaOam_350694_Frame0[] = {
    4,
    0xfa, 0x1fc, OBJ_PALETTE_8 | 0x239,
    0xfd, 0x1f9, OBJ_PALETTE_8 | 0x239,
    0x0, 0x1fc, OBJ_PALETTE_8 | 0x239,
    0xfd, 0x1ff, OBJ_PALETTE_8 | 0x239
};

static const u16 sZeelaOam_350694_Frame1[] = {
    4,
    0xf8, 0x1fc, OBJ_PALETTE_8 | 0x23a,
    0xfd, 0x1f7, OBJ_PALETTE_8 | 0x23a,
    0x2, 0x1fc, OBJ_PALETTE_8 | 0x23a,
    0xfd, 0x1, OBJ_PALETTE_8 | 0x23a
};

static const u16 sZeelaOam_350694_Frame2[] = {
    4,
    0xf7, 0x1fc, OBJ_PALETTE_8 | 0x239,
    0xfd, 0x1f6, OBJ_PALETTE_8 | 0x239,
    0x3, 0x1fc, OBJ_PALETTE_8 | 0x239,
    0xfd, 0x2, OBJ_PALETTE_8 | 0x239
};

static const u16 sZeelaOam_350694_Frame3[] = {
    4,
    0xf5, 0x1fc, OBJ_PALETTE_8 | 0x23a,
    0xfd, 0x1f4, OBJ_PALETTE_8 | 0x23a,
    0x5, 0x1fc, OBJ_PALETTE_8 | 0x23a,
    0xfd, 0x4, OBJ_PALETTE_8 | 0x23a
};

const struct FrameData sZeelaOam_350584[6] = {
    [0] = {
        .pFrame = sZeelaOam_350584_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZeelaOam_350584_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZeelaOam_350584_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sZeelaOam_350584_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZeelaOam_350584_Frame4,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZeelaOam_3505b4[5] = {
    [0] = {
        .pFrame = sZeelaOam_3505b4_Frame0,
        .timer = 11
    },
    [1] = {
        .pFrame = sZeelaOam_3505b4_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sZeelaOam_3505b4_Frame2,
        .timer = 14
    },
    [3] = {
        .pFrame = sZeelaOam_3505b4_Frame3,
        .timer = 13
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZeelaOam_3505dc[6] = {
    [0] = {
        .pFrame = sZeelaOam_3505dc_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZeelaOam_3505dc_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZeelaOam_3505dc_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sZeelaOam_3505dc_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZeelaOam_3505dc_Frame4,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZeelaOam_35060c[5] = {
    [0] = {
        .pFrame = sZeelaOam_35060c_Frame0,
        .timer = 11
    },
    [1] = {
        .pFrame = sZeelaOam_35060c_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sZeelaOam_35060c_Frame2,
        .timer = 14
    },
    [3] = {
        .pFrame = sZeelaOam_35060c_Frame3,
        .timer = 13
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZeelaOam_350634[3] = {
    [0] = {
        .pFrame = sZeelaOam_350634_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZeelaOam_350634_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZeelaOam_35064c[4] = {
    [0] = {
        .pFrame = sZeelaOam_35064c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZeelaOam_35064c_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZeelaOam_35064c_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZeelaOam_35066c[5] = {
    [0] = {
        .pFrame = sZeelaOam_35066c_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sZeelaOam_35066c_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sZeelaOam_35066c_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZeelaOam_35066c_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZeelaOam_350694[5] = {
    [0] = {
        .pFrame = sZeelaOam_350694_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sZeelaOam_350694_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sZeelaOam_350694_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZeelaOam_350694_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const u32 sRedZeelaGfx[2 * 512] = INCBIN_U32("data/sprites/red_zeela.gfx");
const u16 sRedZeelaPal[2 * 16] = INCBIN_U16("data/sprites/red_zeela.pal");
