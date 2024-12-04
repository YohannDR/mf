#include "data/sprites/infant_metroid.h"

const s16 sMetroidFloatingInTubeYMovement_Background[32] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 1, 1, 2,
    2, 1, 1, 1,
    0, 1, 0, 1,
    0, 1, 0, 1,
    0, 0, 0, SHORT_MAX
};

const s16 sMetroidFloatingInTubeXMovement_Background[40] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 1, 1, 1,
    1, 1, 2, 2,
    2, 2, 1, 1,
    1, 1, 1, 1,
    0, 1, 0, 1,
    0, 1, 0, 1,
    0, 0, 0, SHORT_MAX
};

const s16 sMetroidFloatingInTubeYMovement[32] = {
    0, 0, 0, 0,
    1, 1, 1, 1,
    2, 2, 2, 2,
    3, 3, 3, 3,
    3, 3, 3, 3,
    2, 2, 2, 2,
    1, 1, 1, 1,
    0, 0, 0, SHORT_MAX
};

const s16 sMetroidFloatingInTubeXMovement[40] = {
    0, 0, 1, 1,
    2, 2, 3, 3,
    4, 4, 4, 4,
    5, 5, 5, 5,
    6, 6, 6, 6,
    6, 6, 6, 6,
    5, 5, 5, 5,
    4, 4, 4, 4,
    3, 3, 2, 2,
    1, 1, 0, SHORT_MAX
};

const s16 sMetroidSwayingYMovement[64] = {
    0, 0, 0, 0,
    1, 1, 1, 1,
    2, 2, 2, 3,
    3, 3, 4, 4,
    4, 4, 3, 3,
    3, 2, 2, 2,
    1, 1, 1, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, -1, -1, -1,
    -2, -2, -2, -3,
    -3, -3, -4, -4,
    -4, -4, -3, -3,
    -3, -2, -2, -2,
    -1, -1, -1, -1,
    0, 0, 0, SHORT_MAX
};

const s16 sMetroidSwayingXMovement[80] = {
    0, 0, 1, 1,
    2, 2, 3, 3,
    4, 4, 5, 5,
    6, 6, 7, 7,
    7, 7, 8, 8,
    8, 8, 7, 7,
    7, 7, 6, 6,
    5, 5, 4, 4,
    3, 3, 2, 2,
    1, 1, 0, 0,
    0, 0, -1, -1,
    -2, -2, -3, -3,
    -4, -4, -5, -5,
    -6, -6, -7, -7,
    -7, -7, -8, -8,
    -8, -8, -7, -7,
    -7, -7, -6, -6,
    -5, -5, -4, -4,
    -3, -3, -2, -2,
    -1, -1, 0, SHORT_MAX
};

const u32 sMetroidGfx[1 * 512] = INCBIN_U32("data/sprites/infant_metroid.gfx");
const u16 sMetroidPal[1 * 16] = INCBIN_U16("data/sprites/infant_metroid.pal");

static const u16 sMetroidOam_385294_Frame0[] = {
    2,
    0xfb, 0x1f9, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c
};

static const u16 sMetroidOam_385294_Frame1[] = {
    2,
    0xfa, 0x1f9, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e
};

static const u16 sMetroidOam_385294_Frame2[] = {
    2,
    0xf9, 0x1f9, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x210
};

static const u16 sMetroidOam_3852bc_Frame0[] = {
    2,
    0xfa, 0x1fa, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sMetroidOam_3852bc_Frame3[] = {
    2,
    0xfa, 0x1f9, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208
};

static const u16 sMetroidOam_3852bc_Frame1[] = {
    2,
    0xf9, 0x1fa, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a
};

static const u16 sMetroidOam_3852e4_Frame0[] = {
    1,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x214
};

static const u16 sMetroidOam_3852e4_Frame1[] = {
    1,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sMetroidOam_3852e4_Frame3[] = {
    1,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x216
};

static const u16 sMetroidOam_38530c_Frame0[] = {
    1,
    0xf9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x212
};

static const u16 sMetroidOam_38531c_Frame0[] = {
    2,
    0xfa, 0x1fb, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sMetroidOam_38531c_Frame1[] = {
    2,
    0xfb, 0x1fa, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sMetroidOam_38531c_Frame3[] = {
    2,
    0xfa, 0x1fb, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sMetroidOam_385344_Frame0[] = {
    2,
    0xfb, 0x1f9, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sMetroidOam_385344_Frame3[] = {
    2,
    0xfc, 0x1f9, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sMetroidOam_385344_Frame1[] = {
    2,
    0xfb, 0x1f9, OBJ_PALETTE_8 | 0x21a,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sMetroidOam_38536c_Frame0[] = {
    2,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21d
};

const struct FrameData sMetroidOam_385294[5] = {
    [0] = {
        .pFrame = sMetroidOam_385294_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sMetroidOam_385294_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sMetroidOam_385294_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sMetroidOam_385294_Frame1,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMetroidOam_3852bc[5] = {
    [0] = {
        .pFrame = sMetroidOam_3852bc_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sMetroidOam_3852bc_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sMetroidOam_3852bc_Frame0,
        .timer = 8
    },
    [3] = {
        .pFrame = sMetroidOam_3852bc_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMetroidOam_3852e4[5] = {
    [0] = {
        .pFrame = sMetroidOam_3852e4_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sMetroidOam_3852e4_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sMetroidOam_3852e4_Frame0,
        .timer = 12
    },
    [3] = {
        .pFrame = sMetroidOam_3852e4_Frame3,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMetroidOam_38530c[2] = {
    [0] = {
        .pFrame = sMetroidOam_38530c_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMetroidOam_38531c[5] = {
    [0] = {
        .pFrame = sMetroidOam_38531c_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sMetroidOam_38531c_Frame1,
        .timer = 9
    },
    [2] = {
        .pFrame = sMetroidOam_38531c_Frame0,
        .timer = 9
    },
    [3] = {
        .pFrame = sMetroidOam_38531c_Frame3,
        .timer = 9
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMetroidOam_385344[5] = {
    [0] = {
        .pFrame = sMetroidOam_385344_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sMetroidOam_385344_Frame1,
        .timer = 9
    },
    [2] = {
        .pFrame = sMetroidOam_385344_Frame0,
        .timer = 9
    },
    [3] = {
        .pFrame = sMetroidOam_385344_Frame3,
        .timer = 9
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMetroidOam_38536c[2] = {
    [0] = {
        .pFrame = sMetroidOam_38536c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
