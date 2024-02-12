#include "data/sprites/gadora.h"
#include "macros.h"

const u32 sGadoraGfx[1024] = INCBIN_U32("data/sprites/gadora.gfx");
const u16 sGadoraPal[2 * 16] = INCBIN_U16("data/sprites/gadora.pal");

static const u16 sGadoraOam_EyeClosed_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x202,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x205,
    0x20, OBJ_Y_FLIP | 0x3, OBJ_SPRITE_OAM | 0x20f
};

static const u16 sGadoraOam_EyeClosed_Frame1[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x205,
    0xd8, 0x3, OBJ_SPRITE_OAM | 0x20f,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x202
};

static const u16 sGadoraOam_OpeningEye_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x206,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x208
};

static const u16 sGadoraOam_Vulnerable_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x0, OBJ_SPRITE_OAM | 0x20f,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sGadoraOam_Vulnerable_Frame1[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20e,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_Y_FLIP | 0x0, OBJ_SPRITE_OAM | 0x20f
};

static const u16 sGadoraOam_Shooting_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22f,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x26f,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x0, OBJ_SPRITE_OAM | 0x20a,
    0xe0, 0x1f8, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x0, OBJ_SPRITE_OAM | 0x20f,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x231,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x271,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sGadoraOam_Shooting_Frame2[OAM_DATA_SIZE(9)] = {
    0x9,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x231,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x271,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20e,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x22f,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x26f,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x0, OBJ_SPRITE_OAM | 0x20a,
    0x18, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_Y_FLIP | 0x0, OBJ_SPRITE_OAM | 0x20f
};

static const u16 sGadoraOam_Shooting_Frame1[OAM_DATA_SIZE(7)] = {
    0x7,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_SPRITE_OAM | 0x213,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x213,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x0, OBJ_SPRITE_OAM | 0x20f,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sGadoraOam_Shooting_Frame3[OAM_DATA_SIZE(7)] = {
    0x7,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x253,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x253,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20e,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_8x32 | 0x8, OBJ_SPRITE_OAM | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x20, OBJ_Y_FLIP | 0x0, OBJ_SPRITE_OAM | 0x20f
};

static const u16 sGadoraBeamOam_Idle_Frame0[OAM_DATA_SIZE(8)] = {
    0x8,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1235,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, OBJ_SPRITE_OAM | 0x1237,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x1275,
    0xf8, 0x8, OBJ_SPRITE_OAM | 0x1277,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1235,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_Y_FLIP | 0x8, OBJ_SPRITE_OAM | 0x1237,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x1275,
    0x0, OBJ_Y_FLIP | 0x8, OBJ_SPRITE_OAM | 0x1277
};

static const u16 sGadoraBeamOam_Idle_Frame1[OAM_DATA_SIZE(6)] = {
    0x6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1238,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x1278,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1238,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x1278,
    0xf8, 0x8, OBJ_SPRITE_OAM | 0x127a,
    0x0, OBJ_Y_FLIP | 0x8, OBJ_SPRITE_OAM | 0x127a
};

static const u16 sGadoraBeamOam_Idle_Frame2[OAM_DATA_SIZE(8)] = {
    0x8,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x123b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, OBJ_SPRITE_OAM | 0x127b,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x123b,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f9, OBJ_SPRITE_OAM | 0x127b,
    0xf8, 0x1f1, 0x212,
    0x0, OBJ_Y_FLIP | 0x1f1, 0x212,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_SPRITE_OAM | 0x1214,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x8, OBJ_SPRITE_OAM | 0x1214
};

static const u16 sGadoraBeamOam_Idle_Frame3[OAM_DATA_SIZE(8)] = {
    0x8,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x123d,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, OBJ_SPRITE_OAM | 0x123f,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x127d,
    0xf8, 0x8, OBJ_SPRITE_OAM | 0x127f,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x123d,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_Y_FLIP | 0x8, OBJ_SPRITE_OAM | 0x123f,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x127d,
    0x0, OBJ_Y_FLIP | 0x8, OBJ_SPRITE_OAM | 0x127f
};

static const u16 sGadoraRootsOam_Idle_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xdd, 0xc, OBJ_SPRITE_OAM | 0x215,
    0x1b, OBJ_Y_FLIP | 0xc, OBJ_SPRITE_OAM | 0x218,
    0xf9, 0xf, OBJ_SPRITE_OAM | 0x21c
};

static const u16 sGadoraRootsOam_Idle_Frame1[OAM_DATA_SIZE(3)] = {
    0x3,
    0xdd, 0xe, OBJ_SPRITE_OAM | 0x216,
    0x1b, OBJ_Y_FLIP | 0xc, OBJ_SPRITE_OAM | 0x219,
    0xfa, 0xf, OBJ_SPRITE_OAM | 0x21d
};

static const u16 sGadoraRootsOam_Idle_Frame2[OAM_DATA_SIZE(3)] = {
    0x3,
    0xdd, 0xd, OBJ_SPRITE_OAM | 0x217,
    0x1b, OBJ_Y_FLIP | 0xc, OBJ_SPRITE_OAM | 0x215,
    0xfa, 0xf, OBJ_SPRITE_OAM | 0x21e
};

static const u16 sGadoraRootsOam_Idle_Frame3[OAM_DATA_SIZE(3)] = {
    0x3,
    0xdd, 0xc, OBJ_SPRITE_OAM | 0x218,
    0x1b, OBJ_Y_FLIP | 0xe, OBJ_SPRITE_OAM | 0x216,
    0xfa, 0xf, OBJ_SPRITE_OAM | 0x21a
};

static const u16 sGadoraRootsOam_Idle_Frame4[OAM_DATA_SIZE(3)] = {
    0x3,
    0xdd, 0xc, OBJ_SPRITE_OAM | 0x219,
    0x1b, OBJ_Y_FLIP | 0xd, OBJ_SPRITE_OAM | 0x217,
    0xf8, 0xf, OBJ_SPRITE_OAM | 0x21b
};


const struct FrameData sGadoraRootsOam_Idle[6] = {
    [0] = {
        .pFrame = sGadoraRootsOam_Idle_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sGadoraRootsOam_Idle_Frame1,
        .timer = 9
    },
    [2] = {
        .pFrame = sGadoraRootsOam_Idle_Frame2,
        .timer = 9
    },
    [3] = {
        .pFrame = sGadoraRootsOam_Idle_Frame3,
        .timer = 9
    },
    [4] = {
        .pFrame = sGadoraRootsOam_Idle_Frame4,
        .timer = 9
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraOam_EyeClosed[3] = {
    [0] = {
        .pFrame = sGadoraOam_EyeClosed_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sGadoraOam_EyeClosed_Frame1,
        .timer = 12
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraOam_OpeningEye[2] = {
    [0] = {
        .pFrame = sGadoraOam_OpeningEye_Frame0,
        .timer = 6,
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraOam_ClosingEye[2] = {
    [0] = {
        .pFrame = sGadoraOam_OpeningEye_Frame0,
        .timer = 6
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraOam_Shooting[5] = {
    [0] = {
        .pFrame = sGadoraOam_Shooting_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sGadoraOam_Shooting_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sGadoraOam_Shooting_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sGadoraOam_Shooting_Frame3,
        .timer = 7
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraOam_Vulnerable[3] = {
    [0] = {
        .pFrame = sGadoraOam_Vulnerable_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sGadoraOam_Vulnerable_Frame1,
        .timer = 10
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraBeamOam_Idle[5] = {
    [0] = {
        .pFrame = sGadoraBeamOam_Idle_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sGadoraBeamOam_Idle_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sGadoraBeamOam_Idle_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sGadoraBeamOam_Idle_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraRootsOam_OpeningEye[6] = {
    [0] = {
        .pFrame = sGadoraRootsOam_Idle_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sGadoraRootsOam_Idle_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sGadoraRootsOam_Idle_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sGadoraRootsOam_Idle_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sGadoraRootsOam_Idle_Frame4,
        .timer = 5
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraOam_365110[3] = {
    [0] = {
        .pFrame = sGadoraOam_Shooting_Frame1,
        .timer = 12
    },
    [1] = {
        .pFrame = sGadoraOam_Shooting_Frame3,
        .timer = 12
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGadoraOam_365128[6] = {
    [0] = {
        .pFrame = sGadoraOam_Vulnerable_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sGadoraOam_Vulnerable_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sGadoraOam_OpeningEye_Frame0,
        .timer = 8
    },
    [3] = {
        .pFrame = sGadoraOam_EyeClosed_Frame0,
        .timer = 8
    },
    [4] = {
        .pFrame = sGadoraOam_EyeClosed_Frame1,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};
