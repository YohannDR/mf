#include "data/sprites/choot.h"
#include "macros.h"

const s16 sChootJumpVelocity[53] = {
    -12, -12, -12, -12,
    -12, -12, -12, -12,
    -11, -11, -11, -11,
    -10, -10, -10, -10,
    -9, -9, -9, -9,
    -8, -8, -8, -8,
    -8, -8, -8, -8,
    -7, -7, -7, -7,
    -6, -6, -6, -6,
    -5, -5, -5, -5,
    -4, -4, -4, -4,
    -3, -3, -3, -3,
    -2, -2, -2, -2,
    SHORT_MAX
};

const u32 sChootGfx[512 * 1] = INCBIN_U32("data/sprites/choot.gfx");
const u16 sChootPal[16 * 1] = INCBIN_U16("data/sprites/choot.pal");

static const u16 sChootOam_Idle_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x220
};

static const u16 sChootOam_Launching_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x220
};

static const u16 sChootOam_Launching_Frame1[] = {
    2,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sChootOam_Jumping_Frame0[] = {
    1,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sChootOam_Opening_Frame3[] = {
    2,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x206
};

static const u16 sChootOam_FloatingDown_Frame0[] = {
    2,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x208
};

static const u16 sChootOam_FloatingDown_Frame1[] = {
    2,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20a
};

static const u16 sChootOam_FloatingDown_Frame2[] = {
    2,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20c,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c
};

static const u16 sChootSpitOam_Spawning_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x20e
};

static const u16 sChootSpitOam_Falling_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x20f
};

static const u16 sChootSpitOam_ExplodingMidair_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x216
};

static const u16 sChootSpitOam_ExplodingMidair_Frame1[] = {
    4,
    0xf6, 0x1f6, OBJ_PALETTE_8 | 0x218,
    0xf6, 0x2, OBJ_PALETTE_8 | 0x219,
    0x2, 0x1f6, OBJ_PALETTE_8 | 0x238,
    0x2, 0x2, OBJ_PALETTE_8 | 0x239
};

static const u16 sChootSpitOam_ExplodingMidair_Frame2[] = {
    4,
    0xf4, 0x1f4, OBJ_PALETTE_8 | 0x21a,
    0xf4, 0x4, OBJ_PALETTE_8 | 0x21b,
    0x4, 0x1f4, OBJ_PALETTE_8 | 0x23a,
    0x4, 0x4, OBJ_PALETTE_8 | 0x23b
};

static const u16 sChootSpitOam_ExplodingMidair_Frame3[] = {
    4,
    0xf2, 0x1f2, OBJ_PALETTE_8 | 0x21c,
    0xf2, 0x6, OBJ_PALETTE_8 | 0x21c,
    0x6, 0x6, OBJ_PALETTE_8 | 0x21c,
    0x6, 0x1f2, OBJ_PALETTE_8 | 0x21c
};

static const u16 sChootSpitOam_ExplodingOnGround_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sChootSpitOam_ExplodingOnGround_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x210
};

static const u16 sChootSpitOam_ExplodingOnGround_Frame2[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f5, OBJ_PALETTE_8 | 0x212,
    0xf8, 0x3, OBJ_PALETTE_8 | 0x233
};

static const u16 sChootSpitOam_ExplodingOnGround_Frame3[] = {
    2,
    0xf8, 0x1f0, OBJ_PALETTE_8 | 0x214,
    0xf8, 0x8, OBJ_PALETTE_8 | 0x215
};

static const u16 sChootSpitOam_ExplodingOnGround_Frame4[] = {
    2,
    0xf8, 0x1f0, OBJ_PALETTE_8 | 0x234,
    0xf8, 0x8, OBJ_PALETTE_8 | 0x235
};

const struct FrameData sChootOam_Idle[2] = {
    [0] = {
        .pFrame = sChootOam_Idle_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChootOam_Launching[3] = {
    [0] = {
        .pFrame = sChootOam_Launching_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChootOam_Launching_Frame1,
        .timer = 8
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChootOam_Jumping[2] = {
    [0] = {
        .pFrame = sChootOam_Jumping_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChootOam_Opening[5] = {
    [0] = {
        .pFrame = sChootOam_Launching_Frame1,
        .timer = 6
    },
    [1] = {
        .pFrame = sChootOam_Launching_Frame0,
        .timer = 4
    },
    [2] = {
        .pFrame = sChootOam_Idle_Frame0,
        .timer = 4
    },
    [3] = {
        .pFrame = sChootOam_Opening_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChootOam_FloatingDown[5] = {
    [0] = {
        .pFrame = sChootOam_FloatingDown_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sChootOam_FloatingDown_Frame1,
        .timer = 9
    },
    [2] = {
        .pFrame = sChootOam_FloatingDown_Frame2,
        .timer = 9
    },
    [3] = {
        .pFrame = sChootOam_FloatingDown_Frame1,
        .timer = 9
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChootSpitOam_Spawning[2] = {
    [0] = {
        .pFrame = sChootSpitOam_Spawning_Frame0,
        .timer = 8
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChootSpitOam_Falling[2] = {
    [0] = {
        .pFrame = sChootSpitOam_Falling_Frame0,
        .timer = 2
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChootSpitOam_ExplodingMidair[5] = {
    [0] = {
        .pFrame = sChootSpitOam_ExplodingMidair_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sChootSpitOam_ExplodingMidair_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sChootSpitOam_ExplodingMidair_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sChootSpitOam_ExplodingMidair_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChootSpitOam_ExplodingOnGround[6] = {
    [0] = {
        .pFrame = sChootSpitOam_ExplodingOnGround_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sChootSpitOam_ExplodingOnGround_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sChootSpitOam_ExplodingOnGround_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sChootSpitOam_ExplodingOnGround_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sChootSpitOam_ExplodingOnGround_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};
