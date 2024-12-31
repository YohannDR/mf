#include "data/sprites/sa_x.h"

const s16 sSaXBeamForwardYMovement[4] = {
    64, -128, 64, SHORT_MAX
};

const s16 sSaXBeamDiagonalYMovement[4] = {
    52, -104, 52, SHORT_MAX
};

const s16 sSaXBeamDiagonalXMovement[4] = {
    -52, 104, -52, SHORT_MAX
};

const s16 sSaXWalkingSpeed[8] = {
    1, 2, 2, 2, 2, 2, 2, 2
};

const s16 sSaXRunningSpeed[8] = {
    4, 6, 8, 8, 8, 10, 10, 12
};

const s16 sSaXJumpYVelocity_0[10] = {
    -8, -4, 4, 8,
    12, 16, 16, 16,
    16, 16
};

const s16 sSaXJumpYVelocity_1[10] = {
    -8, -6, -4, 0,
    4, 8, 12, 16,
    16, 16
};

const s16 sSaXJumpYVelocity_2[10] = {
    -8, -12, -12, -8,
    -4, 0, 4, 8,
    12, 16
};

const s16 sSaXJumpYVelocity_3[18] = {
    -8, -12, -16, -16,
    -16, -12, -8, -6,
    -4, -2, 0, 0,
    0, 0, 4, 8,
    12, 16
};

const s16 sSaXJumpYVelocity_4[10] = {
    -2, -1, 2, 4,
    6, 8, 10, 12,
    16, 16
};

const s16 sSaXBossSpinJumpYVelocity_2[11] = {
    -8, -12, -16, -12,
    -8, -4, 0, 4,
    8, 12, 16
};

const s16 sSaXBossSpinJumpYVelocity_5[18] = {
    -8, -12, -16, -20,
    -16, -12, -8, -6,
    -4, -2, 0, 0,
    0, 0, 4, 8,
    12, 16
};

const s16 sSaXBossJumpYVelocity_1[10] = {
    -8, -12, -12, -8,
    -4, 0, 4, 8,
    12, 16
};

const s16 sSaXBossJumpYVelocity_2[10] = {
    -8, -12, -16, -12,
    -8, -4, 4, 8,
    12, 16
};

const s16 sSaXBossJumpYVelocity_3[10] = {
    0, 2, 0, -2,
    0, 2, 4, 8,
    12, 16
};

const s16 sSaX_2e6cc6[6] = {
    4, 6, 8, 10, 12, 16
};

const s16 sSaXBossKnockbackYMovement[12] = {
    -12, -10, -8, -6,
    -4, -2, 0, 0,
    0, 0, 0, SHORT_MAX
};

const s16 sSaX_2e6cea[28] = {
    0, 0, 0, 0,
    0, 0, 0, 0,
    -12, -10, -8, -6,
    -4, -2, 0, 0,
    0, 0, 0, SHORT_MAX,
    0, 0, 0, 0,
    0, 0, 0, 0
};

const u16 sSaXMosaicValues[30] = {
    0x11, 0x22, 0x33, 0x44,
    0x55, 0x66, 0x77, 0x88,
    0x77, 0x66, 0x55, 0x44,
    0x33, 0x22, 0x11, 0x22,
    0x33, 0x44, 0x55, 0x66,
    0x77, 0x88, 0x77, 0x66,
    0x55, 0x44, 0x33, 0x22,
    0x11, 0x00
};

const u32 sSaXWeaponsGfx[2 * 512] = INCBIN_U32("data/sa_x/weapons.gfx");
const u16 sSaXPalette_Default[2 * 16] = INCBIN_U16("data/sa_x/default.pal");

static const u16 sSaXBeamOam_Forward_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f4, OBJ_PALETTE_9 | 0x240,
    0xfc, 0x4, OBJ_PALETTE_9 | 0x260
};

static const u16 sSaXBeamOam_Diagonal_Frame0[] = {
    2,
    0xf7, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x242,
    0x4, 0x4, OBJ_PALETTE_9 | 0x261
};

static const u16 sSaXBeamOam_Vertical_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1fc, OBJ_PALETTE_9 | 0x244,
    0x4, 0x1fc, OBJ_PALETTE_9 | 0x245
};

static const u16 sSaXOam_Placeholder_Frame0[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x6, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x6, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXPowerBombOam_SpinningSlow_Frame0[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x248
};

static const u16 sSaXPowerBombOam_SpinningSlow_Frame1[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x249
};

static const u16 sSaXPowerBombOam_SpinningSlow_Frame2[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x24a
};

static const u16 sSaXMissileOam_Forward_Frame0[] = {
    5,
    0xf8, OBJ_X_FLIP | 0xb, OBJ_PALETTE_3 | 0x24f,
    0xf8, 0x5, OBJ_PALETTE_3 | 0x24f,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0xb, OBJ_PALETTE_3 | 0x24f,
    0x0, OBJ_Y_FLIP | 0x5, OBJ_PALETTE_3 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x268
};

static const u16 sSaXMissileOam_Forward_Frame1[] = {
    3,
    0xfc, 0xc, OBJ_PALETTE_3 | 0x270,
    0xfc, 0x6, OBJ_PALETTE_3 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x268
};

static const u16 sSaXMissileOam_Diagonal_Frame0[] = {
    5,
    0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_3 | 0x24f,
    0x0, 0x1, OBJ_PALETTE_3 | 0x24f,
    0x7, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x24f,
    0x7, OBJ_X_FLIP | OBJ_Y_FLIP | 0x7, OBJ_PALETTE_3 | 0x24f,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x246
};

static const u16 sSaXMissileOam_Diagonal_Frame1[] = {
    3,
    0x7, 0x7, OBJ_PALETTE_3 | 0x26f,
    0x2, 0x2, OBJ_PALETTE_3 | 0x250,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x246
};

static const u16 sSaXElevatorOam_2e8038_Frame0[] = {
    5,
    0xf8, 0x1ed, OBJ_PALETTE_3 | 0x24f,
    0xf8, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_3 | 0x24f,
    0x0, OBJ_Y_FLIP | 0x1ed, OBJ_PALETTE_3 | 0x24f,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_3 | 0x24f,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x268
};

static const u16 sSaXElevatorOam_2e8038_Frame1[] = {
    3,
    0xfc, OBJ_X_FLIP | 0x1ec, OBJ_PALETTE_3 | 0x270,
    0xfc, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_3 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x268
};

static const u16 sSaXMissileOam_Diagonal_XFlipped_Frame0[] = {
    5,
    0x0, 0x1f0, OBJ_PALETTE_3 | 0x24f,
    0x0, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_3 | 0x24f,
    0x7, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x24f,
    0x7, OBJ_Y_FLIP | 0x1f1, OBJ_PALETTE_3 | 0x24f,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x246
};

static const u16 sSaXMissileOam_Diagonal_XFlipped_Frame1[] = {
    3,
    0x7, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_3 | 0x26f,
    0x2, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_3 | 0x250,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x246
};

static const u16 sLabExplosionOam_Idle_Frame0[] = {
    1,
    0xcd, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame1[] = {
    1,
    0xcd, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame3[] = {
    1,
    0xd0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame4[] = {
    1,
    0xd0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame9[] = {
    1,
    0xd0, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame10[] = {
    1,
    0xd0, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame18[] = {
    1,
    0xcf, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame19[] = {
    1,
    0xcf, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame24[] = {
    1,
    0xe0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame25[] = {
    1,
    0xe0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame30[] = {
    1,
    0xe2, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame31[] = {
    1,
    0xe2, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame33[] = {
    1,
    0xe0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame34[] = {
    1,
    0xe0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame42[] = {
    1,
    0xe7, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame43[] = {
    1,
    0xe7, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame45[] = {
    1,
    0xd0, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_9 | 0x24b
};

static const u16 sLabExplosionOam_Idle_Frame46[] = {
    1,
    0xd0, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_9 | 0x24d
};

static const u16 sLabExplosionOam_Idle_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x265
};

const struct FrameData sSaXOam_Placeholder[2] = {
    [0] = {
        .pFrame = sSaXOam_Placeholder_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXBeamOam_Forward[2] = {
    [0] = {
        .pFrame = sSaXBeamOam_Forward_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXBeamOam_Diagonal[2] = {
    [0] = {
        .pFrame = sSaXBeamOam_Diagonal_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXBeamOam_Vertical[2] = {
    [0] = {
        .pFrame = sSaXBeamOam_Vertical_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXMissileOam_Diagonal[3] = {
    [0] = {
        .pFrame = sSaXMissileOam_Diagonal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSaXMissileOam_Diagonal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXMissileOam_Forward[3] = {
    [0] = {
        .pFrame = sSaXMissileOam_Forward_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSaXMissileOam_Forward_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXPowerBombOam_SpinningSlow[4] = {
    [0] = {
        .pFrame = sSaXPowerBombOam_SpinningSlow_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSaXPowerBombOam_SpinningSlow_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSaXPowerBombOam_SpinningSlow_Frame2,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXPowerBombOam_SpinningFast[4] = {
    [0] = {
        .pFrame = sSaXPowerBombOam_SpinningSlow_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sSaXPowerBombOam_SpinningSlow_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sSaXPowerBombOam_SpinningSlow_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXMissileOam_Diagonal_XFlipped[3] = {
    [0] = {
        .pFrame = sSaXMissileOam_Diagonal_XFlipped_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSaXMissileOam_Diagonal_XFlipped_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSaXElevatorOam_2e8038[3] = {
    [0] = {
        .pFrame = sSaXElevatorOam_2e8038_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSaXElevatorOam_2e8038_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sLabExplosionOam_Idle[49] = {
    [0] = {
        .pFrame = sLabExplosionOam_Idle_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sLabExplosionOam_Idle_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sLabExplosionOam_Idle_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sLabExplosionOam_Idle_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 4
    },
    [6] = {
        .pFrame = sLabExplosionOam_Idle_Frame3,
        .timer = 2
    },
    [7] = {
        .pFrame = sLabExplosionOam_Idle_Frame4,
        .timer = 2
    },
    [8] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 16
    },
    [9] = {
        .pFrame = sLabExplosionOam_Idle_Frame9,
        .timer = 2
    },
    [10] = {
        .pFrame = sLabExplosionOam_Idle_Frame10,
        .timer = 2
    },
    [11] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 4
    },
    [12] = {
        .pFrame = sLabExplosionOam_Idle_Frame9,
        .timer = 2
    },
    [13] = {
        .pFrame = sLabExplosionOam_Idle_Frame10,
        .timer = 2
    },
    [14] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 8
    },
    [15] = {
        .pFrame = sLabExplosionOam_Idle_Frame0,
        .timer = 2
    },
    [16] = {
        .pFrame = sLabExplosionOam_Idle_Frame1,
        .timer = 2
    },
    [17] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 4
    },
    [18] = {
        .pFrame = sLabExplosionOam_Idle_Frame18,
        .timer = 2
    },
    [19] = {
        .pFrame = sLabExplosionOam_Idle_Frame19,
        .timer = 2
    },
    [20] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 4
    },
    [21] = {
        .pFrame = sLabExplosionOam_Idle_Frame3,
        .timer = 2
    },
    [22] = {
        .pFrame = sLabExplosionOam_Idle_Frame4,
        .timer = 2
    },
    [23] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 4
    },
    [24] = {
        .pFrame = sLabExplosionOam_Idle_Frame24,
        .timer = 2
    },
    [25] = {
        .pFrame = sLabExplosionOam_Idle_Frame25,
        .timer = 2
    },
    [26] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 4
    },
    [27] = {
        .pFrame = sLabExplosionOam_Idle_Frame24,
        .timer = 2
    },
    [28] = {
        .pFrame = sLabExplosionOam_Idle_Frame25,
        .timer = 2
    },
    [29] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 24
    },
    [30] = {
        .pFrame = sLabExplosionOam_Idle_Frame30,
        .timer = 2
    },
    [31] = {
        .pFrame = sLabExplosionOam_Idle_Frame31,
        .timer = 2
    },
    [32] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 16
    },
    [33] = {
        .pFrame = sLabExplosionOam_Idle_Frame33,
        .timer = 2
    },
    [34] = {
        .pFrame = sLabExplosionOam_Idle_Frame34,
        .timer = 2
    },
    [35] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 4
    },
    [36] = {
        .pFrame = sLabExplosionOam_Idle_Frame33,
        .timer = 2
    },
    [37] = {
        .pFrame = sLabExplosionOam_Idle_Frame34,
        .timer = 2
    },
    [38] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 24
    },
    [39] = {
        .pFrame = sLabExplosionOam_Idle_Frame30,
        .timer = 2
    },
    [40] = {
        .pFrame = sLabExplosionOam_Idle_Frame31,
        .timer = 2
    },
    [41] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 8
    },
    [42] = {
        .pFrame = sLabExplosionOam_Idle_Frame42,
        .timer = 2
    },
    [43] = {
        .pFrame = sLabExplosionOam_Idle_Frame43,
        .timer = 2
    },
    [44] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 20
    },
    [45] = {
        .pFrame = sLabExplosionOam_Idle_Frame45,
        .timer = 2
    },
    [46] = {
        .pFrame = sLabExplosionOam_Idle_Frame46,
        .timer = 2
    },
    [47] = {
        .pFrame = sLabExplosionOam_Idle_Frame2,
        .timer = 8
    },
    [48] = FRAME_DATA_TERMINATOR
};

const u32 sSaXLabExplosionsGfx[2 * 512] = INCBIN_U32("data/sa_x/lab_explosions.gfx");
const u16 sSaXLabExplosionsPal[2 * 16] = INCBIN_U16("data/sa_x/lab_explosions.pal");
