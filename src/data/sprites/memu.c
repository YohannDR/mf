#include "data/sprites/memu.h"
#include "macros.h"

const s16 sMemuIdleYSpeed[65] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 1, 1, 2,
    2, 1, 1, 1,
    0, 1, 0, 1,
    0, 1, 0, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, 0, -1, 0,
    -1, -1, -1, -2,
    -2, -1, -1, -1,
    0, -1, 0, -1,
    0, -1, 0, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sMemuIdleXSpeed[81] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 1, 1, 1,
    1, 1, 2, 2,
    2, 2, 1, 1,
    1, 1, 1, 1,
    0, 1, 0, 1,
    0, 1, 0, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, 0, -1, 0,
    -1, -1, -1, -1,
    -1, -1, -2, -2,
    -2, -2, -1, -1,
    -1, -1, -1, -1,
    0, -1, 0, -1,
    0, -1, 0, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const u32 sMemuGfx[512 * 1] = INCBIN_U32("data/sprites/memu.gfx");
const u16 sMemuPal[16 * 1] = INCBIN_U16("data/sprites/memu.pal");

static const u16 sMemuOam_Idle_Frame0[] = {
    1,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sMemuOam_Idle_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x202
};

static const u16 sMemuOam_Idle_Frame2[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x206
};

static const u16 sMemuOam_Idle_Frame3[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x20a
};

const struct FrameData sMemuOam_Idle[5] = {
    [0] = {
        .pFrame = sMemuOam_Idle_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sMemuOam_Idle_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sMemuOam_Idle_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sMemuOam_Idle_Frame3,
        .timer = 5
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMemuOam_ChasingTarget[5] = {
    [0] = {
        .pFrame = sMemuOam_Idle_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sMemuOam_Idle_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sMemuOam_Idle_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sMemuOam_Idle_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};
