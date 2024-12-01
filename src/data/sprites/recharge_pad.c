#include "data/sprites/recharge_pad.h"

const u32 sRechargePadGfx[3 * 512] = INCBIN_U32("data/sprites/recharge_pad.gfx");
const u16 sRechargePadPal[3 * 16] = INCBIN_U16("data/sprites/recharge_pad.pal");

static const u16 sRechargePadOam_325700_Frame0[] = {
    5,
    0xe7, 0x8, OBJ_PALETTE_8 | 0x27a,
    0xd0, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24a
};

static const u16 sRechargePadOam_325710_Frame1[] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xdf, 0xc, OBJ_PALETTE_8 | 0x20d,
    0xef, 0xc, OBJ_PALETTE_8 | 0x24d,
    0xe7, 0x8, OBJ_PALETTE_8 | 0x279,
    0xd0, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24a
};

static const u16 sRechargePadOam_325710_Frame2[] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x10, OBJ_PALETTE_8 | 0x20c,
    0xef, 0x10, OBJ_PALETTE_8 | 0x24c,
    0xe7, 0x8, OBJ_PALETTE_8 | 0x279,
    0xd0, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24a
};

static const u16 sRechargePadOam_325710_Frame3[] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x10, OBJ_PALETTE_8 | 0x20d,
    0xef, 0x10, OBJ_PALETTE_8 | 0x24d,
    0xe7, 0x8, OBJ_PALETTE_8 | 0x279,
    0xd0, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24a
};

static const u16 sRechargePadOam_325758_Frame0[] = {
    6,
    0xe7, 0x10, OBJ_PALETTE_8 | 0x27a,
    0xe7, 0x8, OBJ_PALETTE_8 | 0x279,
    0xd0, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x246,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x24a
};

static const u16 sRechargePadOam_325640_Frame0[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x250
};

static const u16 sRechargePadOam_325640_Frame1[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x253
};

static const u16 sRechargePadOam_325640_Frame2[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x256
};

static const u16 sRechargePadOam_325668_Frame0[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x210
};

static const u16 sRechargePadOam_325668_Frame1[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x213
};

static const u16 sRechargePadOam_325668_Frame2[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x216
};

static const u16 sRechargePadOam_325690_Frame0[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x219
};

static const u16 sRechargePadOam_325690_Frame1[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x21c
};

static const u16 sRechargePadOam_325690_Frame2[] = {
    2,
    0xd5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x8, OBJ_PALETTE_8 | 0x21f
};

static const u16 sRechargePadOam_3256b8_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x0, OBJ_PALETTE_8 | 0x26c
};

static const u16 sRechargePadOam_3256b8_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xd2, 0x1ff, OBJ_PALETTE_8 | 0x26c
};

static const u16 sRechargePadOam_3256b8_Frame2[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xd4, 0x1fe, OBJ_PALETTE_8 | 0x26c
};

static const u16 sRechargePadOam_3256b8_Frame3[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1fd, OBJ_PALETTE_8 | 0x26c
};

static const u16 sRechargePadOam_3256b8_Frame4[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fc, OBJ_PALETTE_8 | 0x26c
};

static const u16 sRechargePadOam_3256b8_Frame5[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1fb, OBJ_PALETTE_8 | 0x26c
};

static const u16 sRechargePadOam_3256b8_Frame6[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1fa, OBJ_PALETTE_8 | 0x26c
};

static const u16 sRechargePadOam_3256b8_Frame7[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1f9, OBJ_PALETTE_8 | 0x26c
};

static const u16 sRechargePadOam_325738_Frame0[] = {
    10,
    0xe7, 0x10, OBJ_PALETTE_9 | 0x27a,
    0xe7, 0x8, OBJ_PALETTE_9 | 0x279,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_9 | 0x257,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_9 | 0x25b,
    0xd0, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x8, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_9 | 0x24a,
    0xd0, 0x10, OBJ_PALETTE_9 | 0x205
};

static const u16 sRechargePadOam_325738_Frame1[] = {
    10,
    0xe7, 0x10, OBJ_PALETTE_9 | 0x27a,
    0xe7, 0x8, OBJ_PALETTE_9 | 0x279,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_9 | 0x277,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_9 | 0x27b,
    0xd0, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x8, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_9 | 0x24a,
    0xd0, 0x10, OBJ_PALETTE_9 | 0x205
};

static const u16 sRechargePadOam_325738_Frame2[] = {
    9,
    0xe7, 0x10, OBJ_PALETTE_9 | 0x27a,
    0xe7, 0x8, OBJ_PALETTE_9 | 0x279,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_9 | 0x259,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x20a,
    0xd0, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x8, OBJ_PALETTE_9 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_9 | 0x24a,
    0xd0, 0x10, OBJ_PALETTE_9 | 0x205
};

static const u16 sRechargePadOam_3257d0_Frame0[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x285,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x285,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_9 | 0x280,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x281,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x283,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x281,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x280,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_9 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25e,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x25d,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25d
};

static const u16 sRechargePadOam_325780_Frame0[] = {
    15,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x283,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x285,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x285,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_9 | 0x280,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x281,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x281,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x280,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_9 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25e,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x25d,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25d
};

static const u16 sRechargePadOam_325780_Frame1[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x2a5,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x2a7,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x2a5,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x2a7,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e9, OBJ_PALETTE_9 | 0x280,
    0x9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x281,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x283,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x281,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x280,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_9 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25e,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x25d,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25d
};

static const u16 sRechargePadOam_325780_Frame2[] = {
    13,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x288,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x28a,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x28a,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e8, OBJ_PALETTE_9 | 0x280,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x281,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x283,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x281,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_9 | 0x280,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x25d,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25d
};

static const u16 sRechargePadOam_325780_Frame3[] = {
    13,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x288,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x28a,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x28a,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x283,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e7, OBJ_PALETTE_9 | 0x280,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x281,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x281,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x11, OBJ_PALETTE_9 | 0x280,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x25d,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x25d
};

const struct FrameData sRechargePadOam_325640[5] = {
    [0] = {
        .pFrame = sRechargePadOam_325640_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sRechargePadOam_325640_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sRechargePadOam_325640_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sRechargePadOam_325640_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_325668[5] = {
    [0] = {
        .pFrame = sRechargePadOam_325668_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sRechargePadOam_325668_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sRechargePadOam_325668_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sRechargePadOam_325668_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_325690[5] = {
    [0] = {
        .pFrame = sRechargePadOam_325690_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sRechargePadOam_325690_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sRechargePadOam_325690_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sRechargePadOam_325690_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_3256b8[9] = {
    [0] = {
        .pFrame = sRechargePadOam_3256b8_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sRechargePadOam_3256b8_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sRechargePadOam_3256b8_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sRechargePadOam_3256b8_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sRechargePadOam_3256b8_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sRechargePadOam_3256b8_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sRechargePadOam_3256b8_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sRechargePadOam_3256b8_Frame7,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_325700[2] = {
    [0] = {
        .pFrame = sRechargePadOam_325700_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_325710[5] = {
    [0] = {
        .pFrame = sRechargePadOam_325700_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sRechargePadOam_325710_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sRechargePadOam_325710_Frame2,
        .timer = 20
    },
    [3] = {
        .pFrame = sRechargePadOam_325710_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_325738[4] = {
    [0] = {
        .pFrame = sRechargePadOam_325738_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sRechargePadOam_325738_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sRechargePadOam_325738_Frame2,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_325758[5] = {
    [0] = {
        .pFrame = sRechargePadOam_325758_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sRechargePadOam_325710_Frame3,
        .timer = 8
    },
    [2] = {
        .pFrame = sRechargePadOam_325710_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sRechargePadOam_325710_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_325780[5] = {
    [0] = {
        .pFrame = sRechargePadOam_325780_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sRechargePadOam_325780_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sRechargePadOam_325780_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sRechargePadOam_325780_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_3257a8[5] = {
    [0] = {
        .pFrame = sRechargePadOam_325780_Frame3,
        .timer = 6
    },
    [1] = {
        .pFrame = sRechargePadOam_325780_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sRechargePadOam_325780_Frame1,
        .timer = 6
    },
    [3] = {
        .pFrame = sRechargePadOam_325780_Frame0,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_3257d0[2] = {
    [0] = {
        .pFrame = sRechargePadOam_3257d0_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRechargePadOam_3257e0[2] = {
    [0] = {
        .pFrame = sRechargePadOam_325780_Frame3,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
