#include "data/sprites/skree.h"
#include "macros.h"

#define SKREE_FALLING_ACCELERATION (PIXEL_SIZE / 2)

const s16 sSkreeGoingDownYVelocity[] = {
    SKREE_FALLING_ACCELERATION * 1,
    SKREE_FALLING_ACCELERATION * 2,
    SKREE_FALLING_ACCELERATION * 3,
    SKREE_FALLING_ACCELERATION * 4,
    SKREE_FALLING_ACCELERATION * 6,
    SKREE_FALLING_ACCELERATION * 7,
    SKREE_FALLING_ACCELERATION * 8,
    SKREE_FALLING_ACCELERATION * 9,
    SKREE_FALLING_ACCELERATION * 10,
    SKREE_FALLING_ACCELERATION * 11,
    SKREE_FALLING_ACCELERATION * 12,
    SHORT_MAX
};

const u32 sSkreeGfx[512] = INCBIN_U32("data/sprites/skree.gfx");
const u16 sSkreePal[16 * 1] = INCBIN_U16("data/sprites/skree.pal");

static const u16 sSkreeOam_WaitingForX_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sSkreeOam_Idle_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x203,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x203,
    0xf8, 0x1f3, OBJ_SPRITE_OAM | 0x205,
    0xf8, OBJ_X_FLIP | 0x5, OBJ_SPRITE_OAM | 0x205
};

static const u16 sSkreeOam_WaitingForX_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x206,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x208
};

static const u16 sSkreeOam_WaitingForX_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_SPRITE_OAM | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_SPRITE_OAM | 0x20b
};

static const u16 sSkreeOam_WaitingForX_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x20c,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sSkreeOam_Crashing_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sSkreeOam_Frame_2f912c[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_Y_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x26e,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x203,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x203,
    0xe8, OBJ_Y_FLIP | 0x1f3, OBJ_SPRITE_OAM | 0x205,
    0xe8, OBJ_X_FLIP | OBJ_Y_FLIP | 0x5, OBJ_SPRITE_OAM | 0x205
};

static const u16 sSkreeOam_Crashing_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x206,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x208
};

static const u16 sSkreeOam_Crashing_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_Y_FLIP | 0x1fc, OBJ_SPRITE_OAM | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_Y_FLIP | 0x1fc, OBJ_SPRITE_OAM | 0x20b
};

static const u16 sSkreeOam_Crashing_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x20c,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sSkreeOam_Frame_2f9176[OAM_DATA_SIZE(4)] = {
    0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1240,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1242,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1240,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1242
};

static const u16 sSkreeOam_Frame_2f9190[OAM_DATA_SIZE(4)] = {
    0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1244,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1246,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1244,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1246
};

static const u16 sSkreeOam_Frame_2f91aa[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x1248,
    0xf8, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x124a
};

static const u16 sSkreeOam_Frame_2f91b8[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x124c,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x124e
};

static const u16 sSkreeOam_Frame_2f91c6[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1240,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1242,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1240,
    0xe0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1242
};

static const u16 sSkreeOam_Frame_2f91e0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1244,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1246,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1244,
    0xe0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x1246
};

static const u16 sSkreeOam_Frame_2f91fa[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x1248,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x124a
};

static const u16 sSkreeOam_Frame_2f9208[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x124c,
    0xe0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x124e
};

static const u16 sSkreeOam_Frame_2f9216[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x225
};


const struct FrameData sSkreeOam_WaitingForX[5] = {
    [0] = {
        .pFrame = sSkreeOam_WaitingForX_Frame0,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [1] = {
        .pFrame = sSkreeOam_WaitingForX_Frame1,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [2] = {
        .pFrame = sSkreeOam_WaitingForX_Frame2,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [3] = {
        .pFrame = sSkreeOam_WaitingForX_Frame3,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSkreeOam_Idle[3] = {
    [0] = {
        .pFrame = sSkreeOam_WaitingForX_Frame0,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [1] = {
        .pFrame = sSkreeOam_Idle_Frame1,
        .timer = CONVERT_SECONDS(4.f / 15)
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSkreeOam_GoingDown[5] = {
    [0] = {
        .pFrame = sSkreeOam_WaitingForX_Frame0,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [1] = {
        .pFrame = sSkreeOam_WaitingForX_Frame1,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [2] = {
        .pFrame = sSkreeOam_WaitingForX_Frame2,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [3] = {
        .pFrame = sSkreeOam_WaitingForX_Frame3,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f9288[5] = {
    [0] = {
        .pFrame = sSkreeOam_Crashing_Frame0,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [1] = {
        .pFrame = sSkreeOam_Crashing_Frame1,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [2] = {
        .pFrame = sSkreeOam_Crashing_Frame2,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [3] = {
        .pFrame = sSkreeOam_Crashing_Frame3,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f92b0[3] = {
    [0] = {
        .pFrame = sSkreeOam_Crashing_Frame0,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [1] = {
        .pFrame = sSkreeOam_Frame_2f912c,
        .timer = CONVERT_SECONDS(4.f / 15)
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSkreeOam_Crashing[5] = {
    [0] = {
        .pFrame = sSkreeOam_Crashing_Frame0,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [1] = {
        .pFrame = sSkreeOam_Crashing_Frame1,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [2] = {
        .pFrame = sSkreeOam_Crashing_Frame2,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [3] = {
        .pFrame = sSkreeOam_Crashing_Frame3,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f92f0[5] = {
    [0] = {
        .pFrame = sSkreeOam_Frame_2f9176,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [1] = {
        .pFrame = sSkreeOam_Frame_2f91aa,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [2] = {
        .pFrame = sSkreeOam_WaitingForX_Frame2,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [3] = {
        .pFrame = sSkreeOam_Frame_2f91b8,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f9318[3] = {
    [0] = {
        .pFrame = sSkreeOam_Frame_2f9176,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [1] = {
        .pFrame = sSkreeOam_Frame_2f9190,
        .timer = CONVERT_SECONDS(4.f / 15)
    },
    [2] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f9330[5] = {
    [0] = {
        .pFrame = sSkreeOam_Frame_2f9176,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [1] = {
        .pFrame = sSkreeOam_Frame_2f91aa,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [2] = {
        .pFrame = sSkreeOam_WaitingForX_Frame2,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [3] = {
        .pFrame = sSkreeOam_Frame_2f91b8,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f9358[5] = {
    [0] = {
        .pFrame = sSkreeOam_Frame_2f91c6,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [1] = {
        .pFrame = sSkreeOam_Frame_2f91fa,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [2] = {
        .pFrame = sSkreeOam_Crashing_Frame2,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [3] = {
        .pFrame = sSkreeOam_Frame_2f9208,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f9380[3] = {
    [0] = {
        .pFrame = sSkreeOam_Frame_2f91c6,
        .timer = CONVERT_SECONDS(1.f / 6)
    },
    [1] = {
        .pFrame = sSkreeOam_Frame_2f91e0,
        .timer = CONVERT_SECONDS(4.f / 15)
    },
    [2] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f9398[5] = {
    [0] = {
        .pFrame = sSkreeOam_Frame_2f91c6,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [1] = {
        .pFrame = sSkreeOam_Frame_2f91fa,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [2] = {
        .pFrame = sSkreeOam_Crashing_Frame2,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [3] = {
        .pFrame = sSkreeOam_Frame_2f9208,
        .timer = CONVERT_SECONDS(1.f / 30)
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const struct FrameData sSkreeOam_2f93c0[2] = {
    [0] = {
        .pFrame = sSkreeOam_Frame_2f9216,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_2f93d0_35dd74[] = INCBIN_U8("data/Blob_2f93d0_35dd74.bin");
