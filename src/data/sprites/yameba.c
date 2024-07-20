#include "data/sprites/yameba.h"
#include "macros.h"

const s16 sYamebaIdleYMovement[65] = {
     0,  0,  0,  0,
     1,  0,  1,  0,
     1,  0,  1,  0,
     1,  1,  1,  2,
     2,  1,  1,  1,
     0,  1,  0,  1,
     0,  1,  0,  1,
     0,  0,  0,  0,
     0,  0,  0,  0,
    -1,  0, -1,  0,
    -1,  0, -1,  0,
    -1, -1, -1, -2,
    -2, -1, -1, -1,
     0, -1,  0, -1,
     0, -1,  0, -1,
     0,  0,  0,  0,
    SHORT_MAX
};

const s16 sYamebaIdleXMovement[81] = {
     0,  0,  0,  0,
     1,  0,  1,  0,
     1,  0,  1,  0,
     1,  1,  1,  1,
     1,  1,  2,  2,
     2,  2,  1,  1,
     1,  1,  1,  1,
     0,  1,  0,  1,
     0,  1,  0,  1,
     0,  0,  0,  0,
     0,  0,  0,  0,
    -1,  0, -1,  0,
    -1,  0, -1,  0,
    -1, -1, -1, -1,
    -1, -1, -2, -2,
    -2, -2, -1, -1,
    -1, -1, -1, -1,
     0, -1,  0, -1,
     0, -1,  0, -1,
     0,  0,  0,  0,
    SHORT_MAX
};

static const s16 sYameba_2f493c[65] = {
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
     0,  0,  0,  0,
    SHORT_MAX
};

static const s16 sYameba_2f49be[81] = {
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

const u32 sYamebaGfx[2 * 512] = INCBIN_U32("data/sprites/yameba.gfx");
const u16 sYamebaPal[2 * 16] = INCBIN_U16("data/sprites/yameba.pal");


static const u16 sYamebaOam_Small_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x200
};

static const u16 sYamebaOam_Small_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x202
};

static const u16 sYamebaOam_Small_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x204
};

static const u16 sYamebaOam_Small_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x206
};

static const u16 sYamebaOam_Small_Frame4[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x208
};

static const u16 sYamebaOam_Big_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x20a
};

static const u16 sYamebaOam_Big_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sYamebaOam_Big_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x212
};

static const u16 sYamebaOam_Big_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x216
};

static const u16 sYamebaOam_Big_Frame4[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x21a
};

static const u16 sYamebaOam_Small_Unused_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x240
};

static const u16 sYamebaOam_Small_Unused_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x242
};

static const u16 sYamebaOam_Small_Unused_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x244
};

static const u16 sYamebaOam_Small_Unused_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x246
};

static const u16 sYamebaOam_Small_Unused_Frame4[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x248,
};


const struct FrameData sYamebaOam_Small[9] = {
    [0] = {
        .pFrame = sYamebaOam_Small_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sYamebaOam_Small_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sYamebaOam_Small_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sYamebaOam_Small_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sYamebaOam_Small_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sYamebaOam_Small_Frame3,
        .timer = 8
    },
    [6] = {
        .pFrame = sYamebaOam_Small_Frame2,
        .timer = 8
    },
    [7] = {
        .pFrame = sYamebaOam_Small_Frame1,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYamebaOam_Big[9] = {
    [0] = {
        .pFrame = sYamebaOam_Big_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sYamebaOam_Big_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sYamebaOam_Big_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sYamebaOam_Big_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sYamebaOam_Big_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sYamebaOam_Big_Frame3,
        .timer = 8
    },
    [6] = {
        .pFrame = sYamebaOam_Big_Frame2,
        .timer = 8
    },
    [7] = {
        .pFrame = sYamebaOam_Big_Frame1,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sYamebaOam_Small_Unused[9] = {
    [0] = {
        .pFrame = sYamebaOam_Small_Unused_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sYamebaOam_Small_Unused_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sYamebaOam_Small_Unused_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sYamebaOam_Small_Unused_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sYamebaOam_Small_Unused_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sYamebaOam_Small_Unused_Frame3,
        .timer = 8
    },
    [6] = {
        .pFrame = sYamebaOam_Small_Unused_Frame2,
        .timer = 8
    },
    [7] = {
        .pFrame = sYamebaOam_Small_Unused_Frame1,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_2f5bf0_35dd74[] = INCBIN_U8("data/Blob_2f5bf0_35dd74.bin");
