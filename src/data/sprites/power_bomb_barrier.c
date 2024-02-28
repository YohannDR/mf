#include "data/sprites/power_bomb_barrier.h"
#include "macros.h"

const u32 sPowerBombBarrierGfx[1024] = INCBIN_U32("data/sprites/power_bomb_barrier.gfx");
const u16 sPowerBombBarrierPal[2 * 16] = INCBIN_U16("data/sprites/power_bomb_barrier.pal");

static const u16 sPowerBombBarrierStemOam_Idle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ef, OBJ_SPRITE_OAM | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c
};

static const u16 sPowerBombBarrierStemOam_Idle_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c
};

static const u16 sPowerBombBarrierStemOam_Idle_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c
};

static const u16 sPowerBombBarrierStemOam_Idle_Frame3[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c
};

static const u16 sPowerBombBarrierStemOam_Destroyed_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x24c
};

static const u16 sPowerBombBarrierStemOam_Destroyed_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x10, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x210
};

static const u16 sPowerBombBarrierStemOam_Destroyed_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0x11, OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x18, OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x214
};

static const u16 sPowerBombBarrierStemOam_Destroyed_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0x18, OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x25c
};

static const u16 sPowerBombBarrierStemOam_Destroyed_Frame4[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x27c,
    OBJ_SHAPE_HORIZONTAL | 0x18, OBJ_Y_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x27c
};

static const u16 sPowerBombBarrierOam_36179e[OAM_DATA_SIZE(1)] = {
    0x1,
    0x0, 0x0, OBJ_SPRITE_OAM | 0x1f8
};

static const u16 sPowerBombBarrierOam_Idle_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1200,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x121a
};

static const u16 sPowerBombBarrierOam_Idle_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1204,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x121c
};

static const u16 sPowerBombBarrierOam_Idle_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1208,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x121e
};

static const u16 sPowerBombBarrierOam_Idle_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x1204,
    0xf8, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x121c
};

const struct FrameData sPowerBombBarrierStemOam_Idle[41] = {
    [0] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 5
    },
    [5] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 5
    },
    [6] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 5
    },
    [7] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 5
    },
    [8] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 8
    },
    [9] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 8
    },
    [10] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 8
    },
    [11] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 8
    },
    [12] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 8
    },
    [13] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 8
    },
    [14] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 8
    },
    [15] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 8
    },
    [16] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 10
    },
    [17] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 10
    },
    [18] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 10
    },
    [19] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 10
    },
    [20] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 10
    },
    [21] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 10
    },
    [22] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 10
    },
    [23] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 10
    },
    [24] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 12
    },
    [25] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 12
    },
    [26] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 12
    },
    [27] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 12
    },
    [28] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 14
    },
    [29] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 14
    },
    [30] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 14
    },
    [31] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 14
    },
    [32] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 12
    },
    [33] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 12
    },
    [34] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 12
    },
    [35] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 12
    },
    [36] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame0,
        .timer = 8
    },
    [37] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame1,
        .timer = 8
    },
    [38] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame2,
        .timer = 8
    },
    [39] = {
        .pFrame = sPowerBombBarrierStemOam_Idle_Frame3,
        .timer = 8
    },
    [40] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowerBombBarrierStemOam_Destroyed[6] = {
    [0] = {
        .pFrame = sPowerBombBarrierStemOam_Destroyed_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sPowerBombBarrierStemOam_Destroyed_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sPowerBombBarrierStemOam_Destroyed_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sPowerBombBarrierStemOam_Destroyed_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sPowerBombBarrierStemOam_Destroyed_Frame4,
        .timer = 1
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowerBombBarrierOam_Idle[41] = {
    [0] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 5
    },
    [5] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 5
    },
    [6] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 5
    },
    [7] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 5
    },
    [8] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 8
    },
    [9] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 8
    },
    [10] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 8
    },
    [11] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 8
    },
    [12] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 8
    },
    [13] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 8
    },
    [14] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 8
    },
    [15] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 8
    },
    [16] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 10
    },
    [17] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 10
    },
    [18] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 10
    },
    [19] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 10
    },
    [20] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 10
    },
    [21] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 10
    },
    [22] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 10
    },
    [23] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 10
    },
    [24] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 12
    },
    [25] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 12
    },
    [26] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 12
    },
    [27] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 12
    },
    [28] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 14
    },
    [29] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 14
    },
    [30] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 14
    },
    [31] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 14
    },
    [32] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 12
    },
    [33] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 12
    },
    [34] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 12
    },
    [35] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 12
    },
    [36] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame0,
        .timer = 8
    },
    [37] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame1,
        .timer = 8
    },
    [38] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame2,
        .timer = 8
    },
    [39] = {
        .pFrame = sPowerBombBarrierOam_Idle_Frame3,
        .timer = 8
    },
    [40] = FRAME_DATA_TERMINATOR
};
