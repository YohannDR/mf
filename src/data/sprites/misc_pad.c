#include "data/sprites/misc_pad.h"

const u32 sControlPadGfx[2 * 512] = INCBIN_U32("data/sprites/control_pad.gfx");
const u16 sControlPadPal[2 * 16] = INCBIN_U16("data/sprites/control_pad.pal");

static const u16 sControlPadOam_34a044_Frame0[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x242,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xd0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x24b,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x242,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x208,
    0xd0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x249,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x24b
};

static const u16 sControlPadOam_34a044_Frame1[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x242,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x205,
    0xd0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x248,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x242,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x205,
    0xd0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x248
};

static const u16 sControlPadOam_34a044_Frame2[] = {
    8,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xd0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x245,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x202,
    0xd0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x245
};

static const u16 sControlPadOam_34a06c_Frame0[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x214,
    0xd0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x253,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x214,
    0xd0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x253
};

static const u16 sControlPadOam_34a06c_Frame1[] = {
    12,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x242,
    0xe0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x216,
    0xd0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x242,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x216,
    0xd0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x256
};

static const u16 sControlPadOam_34a06c_Frame2[] = {
    12,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x242,
    0xd0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x259,
    0xe0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x242,
    0xd0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x259,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x218
};

static const u16 sControlPadOam_34a0e4_Frame0[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x20e,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x20e,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_9 | 0x209,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x20a,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x20c,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24c,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x213
};

static const u16 sControlPadOam_34a094_Frame0[] = {
    15,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x20e,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x20e,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_9 | 0x209,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x20a,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24c,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x213
};

static const u16 sControlPadOam_34a094_Frame1[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x22e,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x22e,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x230,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e9, OBJ_PALETTE_9 | 0x209,
    0x9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x20a,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x20c,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24c,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x213
};

static const u16 sControlPadOam_34a094_Frame2[] = {
    13,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x24e,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x250,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e8, OBJ_PALETTE_9 | 0x209,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x20a,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x20c,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_9 | 0x209,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x213
};

static const u16 sControlPadOam_34a094_Frame3[] = {
    13,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x24e,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x250,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x250,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e7, OBJ_PALETTE_9 | 0x209,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x20a,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x11, OBJ_PALETTE_9 | 0x209,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x213
};

static const u16 sControlPadOam_34a03c[] = {
    0
};

static const u16 sControlPadOam_34a03e[] = {
    0
};

static const u16 sControlPadOam_34a040[] = {
    0
};

const struct FrameData sControlPadOam_34a044[5] = {
    [0] = {
        .pFrame = sControlPadOam_34a044_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sControlPadOam_34a044_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sControlPadOam_34a044_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sControlPadOam_34a044_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sControlPadOam_34a06c[5] = {
    [0] = {
        .pFrame = sControlPadOam_34a06c_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sControlPadOam_34a06c_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sControlPadOam_34a06c_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sControlPadOam_34a06c_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sControlPadOam_34a094[5] = {
    [0] = {
        .pFrame = sControlPadOam_34a094_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sControlPadOam_34a094_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sControlPadOam_34a094_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sControlPadOam_34a094_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sControlPadOam_34a0bc[5] = {
    [0] = {
        .pFrame = sControlPadOam_34a094_Frame3,
        .timer = 6
    },
    [1] = {
        .pFrame = sControlPadOam_34a094_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sControlPadOam_34a094_Frame1,
        .timer = 6
    },
    [3] = {
        .pFrame = sControlPadOam_34a094_Frame0,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sControlPadOam_34a0e4[2] = {
    [0] = {
        .pFrame = sControlPadOam_34a0e4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sControlPadOam_34a0f4[2] = {
    [0] = {
        .pFrame = sControlPadOam_34a094_Frame3,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const u32 sHabitationPadGfx[1 * 512] = INCBIN_U32("data/sprites/habitation_pad.gfx");
const u16 sHabitationPadPal[1 * 16] = INCBIN_U16("data/sprites/habitation_pad.pal");

static const u16 sHabitationPadOam_34acdc_Frame0[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21f,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x208,
    0xd8, 0x1e8, OBJ_PALETTE_8 | 0x21a,
    0xd8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f0, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x236
};

static const u16 sHabitationPadOam_34acdc_Frame1[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x222,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21f,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x208,
    0xd8, 0x1e8, OBJ_PALETTE_8 | 0x21a,
    0xd8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f0, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x218
};

static const u16 sHabitationPadOam_34acdc_Frame2[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x202,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21f,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xd8, 0x1e8, OBJ_PALETTE_8 | 0x21a,
    0xd8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f0, OBJ_PALETTE_8 | 0x238,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x238
};

static const u16 sHabitationPadOam_34ad04_Frame0[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, OBJ_PALETTE_8 | 0x224,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x224,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21f,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x208,
    0xd8, 0x1e8, OBJ_PALETTE_8 | 0x21a,
    0xd8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f0, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x214
};

static const u16 sHabitationPadOam_34ad04_Frame1[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21f,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xd8, 0x1e8, OBJ_PALETTE_8 | 0x21a,
    0xd8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f0, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x234
};

static const u16 sHabitationPadOam_34ad04_Frame2[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, OBJ_PALETTE_8 | 0x226,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x226,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21f,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21f,
    0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xd8, 0x1e8, OBJ_PALETTE_8 | 0x21a,
    0xd8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f0, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x216
};

static const u16 sHabitationPadOam_34ad7c_Frame0[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_8 | 0x20e,
    0x0, 0x1f8, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x20e,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_8 | 0x209,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x20a,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_8 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x213
};

static const u16 sHabitationPadOam_34ad2c_Frame0[] = {
    15,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_8 | 0x20e,
    0x0, 0x1f8, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x20e,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_8 | 0x209,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x20a,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_8 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x213
};

static const u16 sHabitationPadOam_34ad2c_Frame1[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_8 | 0x22e,
    0x0, 0x1f8, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x22e,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e9, OBJ_PALETTE_8 | 0x209,
    0x9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x20a,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_8 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x213
};

static const u16 sHabitationPadOam_34ad2c_Frame2[] = {
    13,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_8 | 0x23a,
    0x0, 0x1f8, OBJ_PALETTE_8 | 0x23c,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x23a,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e8, OBJ_PALETTE_8 | 0x209,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x20a,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x209,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_8 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x213
};

static const u16 sHabitationPadOam_34ad2c_Frame3[] = {
    13,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_8 | 0x23a,
    0x0, 0x1f8, OBJ_PALETTE_8 | 0x23c,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x23c,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x23a,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e7, OBJ_PALETTE_8 | 0x209,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x20a,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x11, OBJ_PALETTE_8 | 0x209,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_8 | 0x213,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x213
};

const struct FrameData sHabitationPadOam_34acdc[5] = {
    [0] = {
        .pFrame = sHabitationPadOam_34acdc_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sHabitationPadOam_34acdc_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sHabitationPadOam_34acdc_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sHabitationPadOam_34acdc_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHabitationPadOam_34ad04[5] = {
    [0] = {
        .pFrame = sHabitationPadOam_34ad04_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sHabitationPadOam_34ad04_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sHabitationPadOam_34ad04_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sHabitationPadOam_34ad04_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHabitationPadOam_34ad2c[5] = {
    [0] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHabitationPadOam_34ad54[5] = {
    [0] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame3,
        .timer = 6
    },
    [1] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame1,
        .timer = 6
    },
    [3] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame0,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHabitationPadOam_34ad7c[2] = {
    [0] = {
        .pFrame = sHabitationPadOam_34ad7c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHabitationPadOam_34ad8c[2] = {
    [0] = {
        .pFrame = sHabitationPadOam_34ad2c_Frame3,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
