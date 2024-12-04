#include "data/sprites/flashing_number.h"

const u32 sBigFlashingNumberGfx[1 * 512] = INCBIN_U32("data/sprites/big_flashing_number.gfx");
const u16 sBigFlashingNumberPal[1 * 16] = INCBIN_U16("data/sprites/big_flashing_number.pal");

static const u16 sBigFlashingNumberOam_37edfc_Frame0[] = {
    1,
    0xfc, 0x1fc, 0x21d
};

static const u16 sBigFlashingNumberOam_37edfc_Frame1[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x215
};

static const u16 sBigFlashingNumberOam_37edfc_Frame2[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sBigFlashingNumberOam_37edfc_Frame3[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21b
};

static const u16 sBigFlashingNumberOam_37edfc_Frame4[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sBigFlashingNumberOam_37ee44_Frame1[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xf7, 0x8, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x8, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x215
};

static const u16 sBigFlashingNumberOam_37ee44_Frame2[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xf7, 0x8, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x8, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sBigFlashingNumberOam_37ee44_Frame3[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xf7, 0x8, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x8, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21b
};

static const u16 sBigFlashingNumberOam_37ee44_Frame4[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20e,
    0xf7, 0x8, OBJ_PALETTE_8 | 0x234,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x8, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sBigFlashingNumberOam_37ee8c_Frame1[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x210,
    0xea, 0x8, OBJ_PALETTE_8 | 0x234,
    0xf4, 0x8, OBJ_PALETTE_8 | 0x234,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x215
};

static const u16 sBigFlashingNumberOam_37ee8c_Frame2[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x210,
    0xea, 0x8, OBJ_PALETTE_8 | 0x234,
    0xf4, 0x8, OBJ_PALETTE_8 | 0x234,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sBigFlashingNumberOam_37ee8c_Frame3[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x210,
    0xea, 0x8, OBJ_PALETTE_8 | 0x234,
    0xf4, 0x8, OBJ_PALETTE_8 | 0x234,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21b
};

static const u16 sBigFlashingNumberOam_37ee8c_Frame4[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x210,
    0xea, 0x8, OBJ_PALETTE_8 | 0x234,
    0xf4, 0x8, OBJ_PALETTE_8 | 0x234,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sBigFlashingNumberOam_37eed4_Frame1[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x215
};

static const u16 sBigFlashingNumberOam_37eed4_Frame2[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sBigFlashingNumberOam_37eed4_Frame3[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21b
};

static const u16 sBigFlashingNumberOam_37eed4_Frame4[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sBigFlashingNumberOam_37ef1c_Frame1[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x22e,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x215
};

static const u16 sBigFlashingNumberOam_37ef1c_Frame2[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x22e,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sBigFlashingNumberOam_37ef1c_Frame3[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x22e,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21b
};

static const u16 sBigFlashingNumberOam_37ef1c_Frame4[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x22e,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sBigFlashingNumberOam_37ef64_Frame1[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f7, OBJ_PALETTE_8 | 0x213,
    0xf4, 0x1f7, OBJ_PALETTE_8 | 0x233,
    0xe8, 0x8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xec, 0x8, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x215
};

static const u16 sBigFlashingNumberOam_37ef64_Frame2[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f7, OBJ_PALETTE_8 | 0x213,
    0xf4, 0x1f7, OBJ_PALETTE_8 | 0x233,
    0xe8, 0x8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xec, 0x8, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sBigFlashingNumberOam_37ef64_Frame3[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f7, OBJ_PALETTE_8 | 0x213,
    0xf4, 0x1f7, OBJ_PALETTE_8 | 0x233,
    0xe8, 0x8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xec, 0x8, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21b
};

static const u16 sBigFlashingNumberOam_37ef64_Frame4[] = {
    8,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x230,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f7, OBJ_PALETTE_8 | 0x213,
    0xf4, 0x1f7, OBJ_PALETTE_8 | 0x233,
    0xe8, 0x8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xec, 0x8, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x21e
};

const struct FrameData sBigFlashingNumberOam_37edfc[9] = {
    [0] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBigFlashingNumberOam_37ee44[9] = {
    [0] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBigFlashingNumberOam_37ee44_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBigFlashingNumberOam_37ee44_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBigFlashingNumberOam_37ee44_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBigFlashingNumberOam_37ee44_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBigFlashingNumberOam_37ee44_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sBigFlashingNumberOam_37ee44_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sBigFlashingNumberOam_37ee44_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBigFlashingNumberOam_37ee8c[9] = {
    [0] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBigFlashingNumberOam_37ee8c_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBigFlashingNumberOam_37ee8c_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBigFlashingNumberOam_37ee8c_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBigFlashingNumberOam_37ee8c_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBigFlashingNumberOam_37ee8c_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sBigFlashingNumberOam_37ee8c_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sBigFlashingNumberOam_37ee8c_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBigFlashingNumberOam_37eed4[9] = {
    [0] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBigFlashingNumberOam_37eed4_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBigFlashingNumberOam_37eed4_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBigFlashingNumberOam_37eed4_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBigFlashingNumberOam_37eed4_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBigFlashingNumberOam_37eed4_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sBigFlashingNumberOam_37eed4_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sBigFlashingNumberOam_37eed4_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBigFlashingNumberOam_37ef1c[9] = {
    [0] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBigFlashingNumberOam_37ef1c_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBigFlashingNumberOam_37ef1c_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBigFlashingNumberOam_37ef1c_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBigFlashingNumberOam_37ef1c_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBigFlashingNumberOam_37ef1c_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sBigFlashingNumberOam_37ef1c_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sBigFlashingNumberOam_37ef1c_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBigFlashingNumberOam_37ef64[9] = {
    [0] = {
        .pFrame = sBigFlashingNumberOam_37edfc_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBigFlashingNumberOam_37ef64_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBigFlashingNumberOam_37ef64_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBigFlashingNumberOam_37ef64_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBigFlashingNumberOam_37ef64_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBigFlashingNumberOam_37ef64_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sBigFlashingNumberOam_37ef64_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sBigFlashingNumberOam_37ef64_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const u32 sFlashingNumberGfx[1 * 512] = INCBIN_U32("data/sprites/flashing_number.gfx");
const u16 sFlashingNumberPal[1 * 16] = INCBIN_U16("data/sprites/flashing_number.pal");

static const u16 sFlashingNumberOam_37f948_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x23f
};

static const u16 sFlashingNumberOam_37f948_Frame1[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sFlashingNumberOam_37f948_Frame2[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFlashingNumberOam_37f948_Frame3[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFlashingNumberOam_37f948_Frame4[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFlashingNumberOam_37f990_Frame1[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sFlashingNumberOam_37f990_Frame2[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFlashingNumberOam_37f990_Frame3[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFlashingNumberOam_37f990_Frame4[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFlashingNumberOam_37f9d8_Frame1[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sFlashingNumberOam_37f9d8_Frame2[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFlashingNumberOam_37f9d8_Frame3[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFlashingNumberOam_37f9d8_Frame4[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFlashingNumberOam_37fa20_Frame1[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sFlashingNumberOam_37fa20_Frame2[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFlashingNumberOam_37fa20_Frame3[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFlashingNumberOam_37fa20_Frame4[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFlashingNumberOam_37fa68_Frame1[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sFlashingNumberOam_37fa68_Frame2[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFlashingNumberOam_37fa68_Frame3[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFlashingNumberOam_37fa68_Frame4[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFlashingNumberOam_37fab0_Frame1[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218
};

static const u16 sFlashingNumberOam_37fab0_Frame2[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFlashingNumberOam_37fab0_Frame3[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFlashingNumberOam_37fab0_Frame4[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x21e
};

const struct FrameData sFlashingNumberOam_37f948[9] = {
    [0] = {
        .pFrame = sFlashingNumberOam_37f948_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFlashingNumberOam_37f948_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFlashingNumberOam_37f948_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFlashingNumberOam_37f948_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sFlashingNumberOam_37f948_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sFlashingNumberOam_37f948_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sFlashingNumberOam_37f948_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sFlashingNumberOam_37f948_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFlashingNumberOam_37f990[9] = {
    [0] = {
        .pFrame = sFlashingNumberOam_37f948_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFlashingNumberOam_37f990_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFlashingNumberOam_37f990_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFlashingNumberOam_37f990_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sFlashingNumberOam_37f990_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sFlashingNumberOam_37f990_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sFlashingNumberOam_37f990_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sFlashingNumberOam_37f990_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFlashingNumberOam_37f9d8[9] = {
    [0] = {
        .pFrame = sFlashingNumberOam_37f948_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFlashingNumberOam_37f9d8_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFlashingNumberOam_37f9d8_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFlashingNumberOam_37f9d8_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sFlashingNumberOam_37f9d8_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sFlashingNumberOam_37f9d8_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sFlashingNumberOam_37f9d8_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sFlashingNumberOam_37f9d8_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFlashingNumberOam_37fa20[9] = {
    [0] = {
        .pFrame = sFlashingNumberOam_37f948_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFlashingNumberOam_37fa20_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFlashingNumberOam_37fa20_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFlashingNumberOam_37fa20_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sFlashingNumberOam_37fa20_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sFlashingNumberOam_37fa20_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sFlashingNumberOam_37fa20_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sFlashingNumberOam_37fa20_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFlashingNumberOam_37fa68[9] = {
    [0] = {
        .pFrame = sFlashingNumberOam_37f948_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFlashingNumberOam_37fa68_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFlashingNumberOam_37fa68_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFlashingNumberOam_37fa68_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sFlashingNumberOam_37fa68_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sFlashingNumberOam_37fa68_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sFlashingNumberOam_37fa68_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sFlashingNumberOam_37fa68_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFlashingNumberOam_37fab0[9] = {
    [0] = {
        .pFrame = sFlashingNumberOam_37f948_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFlashingNumberOam_37fab0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFlashingNumberOam_37fab0_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFlashingNumberOam_37fab0_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sFlashingNumberOam_37fab0_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sFlashingNumberOam_37fab0_Frame3,
        .timer = 6
    },
    [6] = {
        .pFrame = sFlashingNumberOam_37fab0_Frame2,
        .timer = 6
    },
    [7] = {
        .pFrame = sFlashingNumberOam_37fab0_Frame1,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};
