#include "data/sprites/save_pad.h"
#include "macros.h"

const s16 sSavePlatformFloatingYMovement[49] = {
     0,  0,  0,  0,
     1,  0,  1,  0,
     1,  1,  2,  2,
     2,  1,  1,  0,
     1,  0,  1,  0,
     0,  0,  0,  0,
     0,  0,  0,  0,
    -1,  0, -1,  0,
    -1, -1, -2, -2,
    -2, -1, -1,  0,
    -1,  0, -1,  0,
     0,  0,  0,  0,
     SHORT_MAX
};

const u32 sSavePadGfx[3 * 512] = INCBIN_U32("data/sprites/save_pad.gfx");
const u16 sSavePadPal[3 * 16] = INCBIN_U16("data/sprites/save_pad.pal");

static const u16 sSavePlatformOam_Floating_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x202,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sSavePlatformOam_Floating_Frame1[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f0, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x209,
    0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x202,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x202,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x200
};

static const u16 sSavePlatformOam_Floating_Frame2[OAM_DATA_SIZE(6)] = {
    0x6,
    0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x202,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x202,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f0, OBJ_SPRITE_OAM | 0x229,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x229
};

static const u16 sSavePlatformOam_Floating_Frame3[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f0, OBJ_SPRITE_OAM | 0x20b,
    0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x202,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x202,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x200
};

static const u16 sSavePadOam_Idle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e8, OBJ_SPRITE_OAM | 0x203,
    0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x203,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x205
};

static const u16 sSavePadOam_LockedIn_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e8, OBJ_SPRITE_OAM | 0x223,
    0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x225,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x223,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x225
};

static const u16 sSavePadOam_LockedIn_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e8, OBJ_SPRITE_OAM | 0x206,
    0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x206,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x208
};

static const u16 sSavePadOam_LockedIn_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e8, OBJ_SPRITE_OAM | 0x226,
    0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x228,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x226,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x228
};

static const u16 sSavePadOam_Frame_2f13cc[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x22b
};

static const u16 sSavePadHologramOam_Opening_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd0, OBJ_SIZE_16x16 | 0x1e0, OBJ_SPRITE_OAM | 0x21a
};

static const u16 sSavePadHologramOam_Opening_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xd0, OBJ_SIZE_16x16 | 0x10, OBJ_SPRITE_OAM | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xd4, 0x1e0, OBJ_SPRITE_OAM | 0x218
};

static const u16 sSavePadHologramOam_Opening_Frame2[OAM_DATA_SIZE(3)] = {
    0x3,
    0xd0, OBJ_SIZE_16x16 | 0x1e0, OBJ_SPRITE_OAM | 0x216,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1fc, OBJ_SPRITE_OAM | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xd4, 0x10, OBJ_SPRITE_OAM | 0x238
};

static const u16 sSavePadHologramOam_Opening_Frame3[OAM_DATA_SIZE(3)] = {
    0x3,
    0xd0, OBJ_SIZE_16x16 | 0x1e0, OBJ_SPRITE_OAM | 0x216,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x213,
    0xd0, OBJ_SIZE_16x16 | 0x10, OBJ_SPRITE_OAM | 0x21c
};

static const u16 sSavePadHologramOam_Opening_Frame4[OAM_DATA_SIZE(5)] = {
    0x5,
    0xd0, OBJ_SIZE_16x16 | 0x1e0, OBJ_SPRITE_OAM | 0x216,
    0xd0, OBJ_SIZE_16x16 | 0x10, OBJ_SPRITE_OAM | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1fb, OBJ_SPRITE_OAM | 0x215,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x3, OBJ_SPRITE_OAM | 0x214,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f3, OBJ_SPRITE_OAM | 0x213
};

static const u16 sSavePadHologramOam_Flashing_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xd0, OBJ_SIZE_16x16 | 0x1e0, OBJ_SPRITE_OAM | 0x216,
    0xd0, OBJ_SIZE_16x16 | 0x10, OBJ_SPRITE_OAM | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f3, OBJ_SPRITE_OAM | 0x20f,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1fb, OBJ_SPRITE_OAM | 0x210,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x3, OBJ_SPRITE_OAM | 0x211
};

static const u16 sSavePadHologramOam_Flashing_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sSavePadOam_Disabled_Frame0[OAM_DATA_SIZE(8)] = {
    0x8,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e8, OBJ_SPRITE_OAM | 0x203,
    0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x203,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x205,
    0xf0, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_SPRITE_OAM | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x202
};


const struct FrameData sSavePlatformOam_Floating[7] = {
    [0] = {
        .pFrame = sSavePlatformOam_Floating_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSavePlatformOam_Floating_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSavePlatformOam_Floating_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSavePlatformOam_Floating_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sSavePlatformOam_Floating_Frame2,
        .timer = 8
    },
    [5] = {
        .pFrame = sSavePlatformOam_Floating_Frame1,
        .timer = 8
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSavePadOam_Idle[2] = {
    [0] = {
        .pFrame = sSavePadOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSavePadOam_2f14d4[2] = {
    [0] = {
        .pFrame = sSavePadOam_Frame_2f13cc,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSavePadOam_LockedIn[6] = {
    [0] = {
        .pFrame = sSavePadOam_LockedIn_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSavePadOam_LockedIn_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSavePadOam_LockedIn_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSavePadOam_LockedIn_Frame1,
        .timer = 8
    },
    [4] = {
        .pFrame = sSavePadOam_LockedIn_Frame0,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSavePadHologramOam_Opening[6] = {
    [0] = {
        .pFrame = sSavePadHologramOam_Opening_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sSavePadHologramOam_Opening_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sSavePadHologramOam_Opening_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sSavePadHologramOam_Opening_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sSavePadHologramOam_Opening_Frame4,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSavePadHologramOam_Closing[6] = {
    [0] = {
        .pFrame = sSavePadHologramOam_Opening_Frame4,
        .timer = 3
    },
    [1] = {
        .pFrame = sSavePadHologramOam_Opening_Frame3,
        .timer = 3
    },
    [2] = {
        .pFrame = sSavePadHologramOam_Opening_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sSavePadHologramOam_Opening_Frame1,
        .timer = 3
    },
    [4] = {
        .pFrame = sSavePadHologramOam_Opening_Frame0,
        .timer = 3
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSavePadHologramOam_Flashing[3] = {
    [0] = {
        .pFrame = sSavePadHologramOam_Flashing_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sSavePadHologramOam_Flashing_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSavePadOam_Disabled[2] = {
    [0] = {
        .pFrame = sSavePadOam_Disabled_Frame0,
        .timer = UCHAR_MAX
    }
};

static const u8 sBlob_2f159c_35dd74[] = INCBIN_U8("data/Blob_2f159c_35dd74.bin");
