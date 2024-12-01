#include "data/sprites/beam_core_x.h"

const s16 sIceBeamAbilityFloatingYMovement[65] = {
    0, 0, 0, 0,
    1, 1, 1, 1,
    2, 2, 2, 2,
    3, 3, 3, 3,
    3, 3, 3, 3,
    2, 2, 2, 2,
    1, 1, 1, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, -1, -1, -1,
    -2, -2, -2, -2,
    -3, -3, -3, -3,
    -3, -3, -3, -3,
    -2, -2, -2, -2,
    -1, -1, -1, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const u32 sChargeBeamCoreXGfx[5 * 512] = INCBIN_U32("data/sprites/charge_beam_core_x.gfx");
const u16 sChargeBeamCoreXPal[5 * 16] = INCBIN_U16("data/sprites/charge_beam_core_x.pal");

static const u16 sBeamCoreXOam_32af80_Frame0[] = {
    4,
    0xf2, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x5, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f5, OBJ_PALETTE_8 | 0x248,
    0x2, 0x5, OBJ_PALETTE_8 | 0x24a
};

static const u16 sBeamCoreXOam_32af80_Frame1[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f5, OBJ_PALETTE_8 | 0x20b,
    0x1, 0x1f5, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x1fd, OBJ_PALETTE_8 | 0x20c
};

static const u16 sBeamCoreXOam_32af80_Frame2[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f7, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_8x32 | 0x7, OBJ_PALETTE_8 | 0x210
};

static const u16 sBeamCoreXOam_32af80_Frame3[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_8x32 | 0x6, OBJ_PALETTE_8 | 0x213
};

static const u16 sBeamCoreXOam_32af80_Frame4[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f3, OBJ_PALETTE_8 | 0x214,
    0x0, 0x1f3, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1fb, OBJ_PALETTE_8 | 0x215
};

static const u16 sBeamCoreXOam_32af80_Frame5[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f9, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_8 | 0x237,
    0x9, 0x1f9, OBJ_PALETTE_8 | 0x278
};

static const u16 sBeamCoreXOam_32af80_Frame6[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f9, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_8 | 0x23b,
    0x8, 0x1f9, OBJ_PALETTE_8 | 0x27c
};

static const u16 sBeamCoreXOam_32af80_Frame7[] = {
    5,
    0xfb, 0x1f0, OBJ_PALETTE_8 | 0x2c8,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x2a9,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x8, OBJ_PALETTE_8 | 0x2ab,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1f8, OBJ_PALETTE_8 | 0x2e9,
    0x3, 0x8, OBJ_PALETTE_8 | 0x2eb
};

static const u16 sBeamCoreXOam_32afc8_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x28c
};

static const u16 sBeamCoreXOam_32afc8_Frame1[] = {
    1,
    0xee, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x28c
};

static const u16 sBeamCoreXOam_32b0a8_Frame0[] = {
    1,
    0xe0, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_9 | 0x200
};

static const u16 sBeamCoreXOam_32b0b8_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x2d4
};

static const u16 sBeamCoreXOam_32b0c8_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x29e
};

static const u16 sBeamCoreXOam_32b0c8_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x29c
};

static const u16 sBeamCoreXOam_32b0c8_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x29a
};

static const u16 sBeamCoreXOam_32b0c8_Frame4[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x298
};

static const u16 sBeamCoreXOam_32b0c8_Frame5[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x296
};

static const u16 sBeamCoreXOam_32b100_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x290
};

static const u16 sBeamCoreXOam_32b110_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x292
};

static const u16 sBeamCoreXOam_32b110_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x2d0
};

static const u16 sBeamCoreXOam_32b110_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x2d2
};

static const u16 sBeamCoreXOam_32b110_Frame4[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x2d6
};

static const u16 sBeamCoreXOam_32b110_Frame5[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x2d8
};

static const u16 sBeamCoreXOam_32b110_Frame6[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x2da
};

static const u16 sBeamCoreXOam_32b110_Frame7[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x2dc
};

static const u16 sBeamCoreXOam_32b110_Frame8[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_11 | 0x2de
};

static const u16 sBeamCoreXOam_32afe0_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x200
};

static const u16 sBeamCoreXOam_32afe0_Frame0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x314,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x314,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x314,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x314
};

static const u16 sBeamCoreXOam_32afe0_Frame4[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x316,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x316,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x316,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x316
};

static const u16 sBeamCoreXOam_32afe0_Frame8[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x318,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x318,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x318,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x318
};

static const u16 sBeamCoreXOam_32afe0_Frame12[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x31a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x31a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x31a,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x31a
};

static const u16 sBeamCoreXOam_32afe0_Frame16[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x31c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x31c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x31c,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x31c
};

static const u16 sBeamCoreXOam_32afe0_Frame20[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x31e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x31e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_11 | 0x31e,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_11 | 0x31e
};

const struct FrameData sBeamCoreXOam_32af80[9] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32af80_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBeamCoreXOam_32af80_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBeamCoreXOam_32af80_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBeamCoreXOam_32af80_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBeamCoreXOam_32af80_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBeamCoreXOam_32af80_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sBeamCoreXOam_32af80_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sBeamCoreXOam_32af80_Frame7,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32afc8[3] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32afc8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sBeamCoreXOam_32afc8_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32afe0[25] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame0,
        .timer = 2
    },
    [3] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [4] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [6] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [8] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [10] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame8,
        .timer = 2
    },
    [11] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [12] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame12,
        .timer = 2
    },
    [13] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [14] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame12,
        .timer = 2
    },
    [15] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [16] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame16,
        .timer = 2
    },
    [17] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [18] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame16,
        .timer = 2
    },
    [19] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [20] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame20,
        .timer = 2
    },
    [21] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [22] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame20,
        .timer = 2
    },
    [23] = {
        .pFrame = sBeamCoreXOam_32afe0_Frame1,
        .timer = 1
    },
    [24] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32b0a8[2] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32b0a8_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32b0b8[2] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32b0b8_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32b0c8[7] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32b0b8_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame5,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32b100[2] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32b100_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32b110[10] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32b100_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBeamCoreXOam_32b110_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBeamCoreXOam_32b110_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBeamCoreXOam_32b110_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBeamCoreXOam_32b110_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBeamCoreXOam_32b110_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sBeamCoreXOam_32b110_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sBeamCoreXOam_32b110_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sBeamCoreXOam_32b110_Frame8,
        .timer = 6
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32b160[10] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32b100_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sBeamCoreXOam_32b110_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sBeamCoreXOam_32b110_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sBeamCoreXOam_32b110_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sBeamCoreXOam_32b110_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sBeamCoreXOam_32b110_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sBeamCoreXOam_32b110_Frame6,
        .timer = 3
    },
    [7] = {
        .pFrame = sBeamCoreXOam_32b110_Frame7,
        .timer = 3
    },
    [8] = {
        .pFrame = sBeamCoreXOam_32b110_Frame8,
        .timer = 3
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBeamCoreXOam_32b1b0[7] = {
    [0] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame5,
        .timer = 4
    },
    [1] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame4,
        .timer = 4
    },
    [2] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame3,
        .timer = 4
    },
    [3] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame2,
        .timer = 6
    },
    [4] = {
        .pFrame = sBeamCoreXOam_32b0c8_Frame1,
        .timer = 6
    },
    [5] = {
        .pFrame = sBeamCoreXOam_32b0b8_Frame0,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const u32 sWideBeamCoreXGfx[5 * 512] = INCBIN_U32("data/sprites/wide_beam_core_x.gfx");
const u16 sWideBeamCoreXPal[5 * 16] = INCBIN_U16("data/sprites/wide_beam_core_x.pal");
const u32 sPlasmaBeamCoreXGfx[5 * 512] = INCBIN_U32("data/sprites/plasma_beam_core_x.gfx");
const u16 sPlasmaBeamCoreXPal[5 * 16] = INCBIN_U16("data/sprites/plasma_beam_core_x.pal");
const u32 sWaveBeamCoreXGfx[5 * 512] = INCBIN_U32("data/sprites/wave_beam_core_x.gfx");
const u16 sWaveBeamCoreXPal[5 * 16] = INCBIN_U16("data/sprites/wave_beam_core_x.pal");
const u32 sIceBeamCoreXGfx[5 * 512] = INCBIN_U32("data/sprites/ice_beam_core_x.gfx");
const u16 sIceBeamCoreXPal[5 * 16] = INCBIN_U16("data/sprites/ice_beam_core_x.pal");
