#include "data/sprites/ridley_pre_spawn.h"

const u32 sRidleyPreSpawnGfx[512 * 2] = INCBIN_U32("data/sprites/ridley_pre_spawn.gfx");
const u16 sRidleyPreSpawnPal[16 * 2] = INCBIN_U16("data/sprites/ridley_pre_spawn.pal");

static const u16 sRidleyPreSpawnOam_3b0a9c_Frame0[] = {
    14,
    0xb9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x200,
    0xd9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xc1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x30, OBJ_PALETTE_8 | 0x232,
    0x1, 0x30, OBJ_PALETTE_8 | 0x272,
    0xe9, 0x1d8, OBJ_PALETTE_8 | 0x273,
    0xc9, 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xc9, 0x1d8, OBJ_PALETTE_8 | 0x213,
    0xd9, 0x1d8, OBJ_PALETTE_8 | 0x253,
    0xb9, 0x0, OBJ_PALETTE_8 | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0xa9, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x214
};

static const u16 sRidleyPreSpawnOam_3b0aac_Frame0[] = {
    15,
    0xbc, 0x1e8, OBJ_PALETTE_8 | 0x275,
    0xb9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x200,
    0xd9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xc1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x30, OBJ_PALETTE_8 | 0x232,
    0x1, 0x30, OBJ_PALETTE_8 | 0x272,
    0xe9, 0x1d8, OBJ_PALETTE_8 | 0x273,
    0xc9, 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xc9, 0x1d8, OBJ_PALETTE_8 | 0x213,
    0xd9, 0x1d8, OBJ_PALETTE_8 | 0x253,
    0xb9, 0x0, OBJ_PALETTE_8 | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0xa9, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x214
};

static const u16 sRidleyPreSpawnOam_3b0aac_Frame1[] = {
    15,
    0xbc, 0x1e8, OBJ_PALETTE_8 | 0x256,
    0xb9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x200,
    0xd9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xc1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x30, OBJ_PALETTE_8 | 0x232,
    0x1, 0x30, OBJ_PALETTE_8 | 0x272,
    0xe9, 0x1d8, OBJ_PALETTE_8 | 0x273,
    0xc9, 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xc9, 0x1d8, OBJ_PALETTE_8 | 0x213,
    0xd9, 0x1d8, OBJ_PALETTE_8 | 0x253,
    0xb9, 0x0, OBJ_PALETTE_8 | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0xa9, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x214
};

static const u16 sRidleyPreSpawnOam_3b0aac_Frame2[] = {
    15,
    0xbc, 0x1e8, OBJ_PALETTE_8 | 0x257,
    0xb9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x200,
    0xd9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xc1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x30, OBJ_PALETTE_8 | 0x232,
    0x1, 0x30, OBJ_PALETTE_8 | 0x272,
    0xe9, 0x1d8, OBJ_PALETTE_8 | 0x273,
    0xc9, 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xc9, 0x1d8, OBJ_PALETTE_8 | 0x213,
    0xd9, 0x1d8, OBJ_PALETTE_8 | 0x253,
    0xb9, 0x0, OBJ_PALETTE_8 | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0xa9, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x214
};

static const u16 sRidleyPreSpawnOam_3b0aac_Frame3[] = {
    15,
    0xbc, 0x1e8, OBJ_PALETTE_8 | 0x276,
    0xb9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x200,
    0xd9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xc1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x30, OBJ_PALETTE_8 | 0x232,
    0x1, 0x30, OBJ_PALETTE_8 | 0x272,
    0xe9, 0x1d8, OBJ_PALETTE_8 | 0x273,
    0xc9, 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xc9, 0x1d8, OBJ_PALETTE_8 | 0x213,
    0xd9, 0x1d8, OBJ_PALETTE_8 | 0x253,
    0xb9, 0x0, OBJ_PALETTE_8 | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0xa9, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x214
};

static const u16 sRidleyPreSpawnOam_3b0aac_Frame4[] = {
    15,
    0xbc, 0x1e8, OBJ_PALETTE_8 | 0x277,
    0xb9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x200,
    0xd9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xc1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xe1, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x30, OBJ_PALETTE_8 | 0x232,
    0x1, 0x30, OBJ_PALETTE_8 | 0x272,
    0xe9, 0x1d8, OBJ_PALETTE_8 | 0x273,
    0xc9, 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xc9, 0x1d8, OBJ_PALETTE_8 | 0x213,
    0xd9, 0x1d8, OBJ_PALETTE_8 | 0x253,
    0xb9, 0x0, OBJ_PALETTE_8 | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0xa9, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x214
};

const struct FrameData sRidleyPreSpawnOam_3b0a9c[2] = {
    [0] = {
        .pFrame = sRidleyPreSpawnOam_3b0a9c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRidleyPreSpawnOam_3b0aac[7] = {
    [0] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame3,
        .timer = 255
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRidleyPreSpawnOam_3b0ae4[4] = {
    [0] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame2,
        .timer = 4
    },
    [1] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sRidleyPreSpawnOam_3b0aac_Frame0,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};
