#include "data/sprites/geega.h"

const s16 sGeega_3791d4[65] = {
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

const u32 sGeegaGfx[512 * 1] = INCBIN_U32("data/sprites/geega.gfx");
const u16 sGeegaPal[16 * 1] = INCBIN_U16("data/sprites/geega.pal");

static const u16 sGeegaOam_379aa8_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sGeegaOam_379aa8_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sGeegaOam_379aa8_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGeegaOam_379ad0_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sGeegaOam_379ad0_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208
};

static const u16 sGeegaOam_379ad0_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a
};

const struct FrameData sGeegaOam_379aa8[5] = {
    [0] = {
        .pFrame = sGeegaOam_379aa8_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sGeegaOam_379aa8_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sGeegaOam_379aa8_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sGeegaOam_379aa8_Frame1,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGeegaOam_379ad0[5] = {
    [0] = {
        .pFrame = sGeegaOam_379ad0_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sGeegaOam_379ad0_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sGeegaOam_379ad0_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sGeegaOam_379ad0_Frame1,
        .timer = 1
    },
    [4] = FRAME_DATA_TERMINATOR
};
