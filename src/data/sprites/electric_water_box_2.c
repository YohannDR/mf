#include "data/sprites/electric_water_box_2.h"

const u32 sBox2ElectricWaterDamageGfx[1 * 512] = INCBIN_U32("data/sprites/electric_water_box_2.gfx");
const u16 sBox2ElectricWaterDamagePal[1 * 16] = INCBIN_U16("data/sprites/electric_water_box_2.pal");

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame0[] = {
    2,
    0xde, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1, OBJ_PALETTE_8 | 0x202
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame1[] = {
    1,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x203
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame2[] = {
    2,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x205,
    0xf4, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x207
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame3[] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xde, 0x0, OBJ_PALETTE_8 | 0x20a,
    0xe6, 0x1f8, OBJ_PALETTE_8 | 0x229
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame4[] = {
    4,
    0xfa, 0x1ff, OBJ_PALETTE_8 | 0x22e,
    0xf1, 0x1fb, OBJ_PALETTE_8 | 0x20e,
    0xe7, 0x1f8, OBJ_PALETTE_8 | 0x22d,
    0xe3, 0x1, OBJ_PALETTE_8 | 0x20d
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame5[] = {
    4,
    0xed, 0x1, OBJ_PALETTE_8 | 0x22f,
    0xe6, 0x1f7, OBJ_PALETTE_8 | 0x20f,
    0xe2, 0x2, OBJ_PALETTE_8 | 0x210,
    0xf5, 0x1fd, OBJ_PALETTE_8 | 0x233
};

static const u16 sBox2ElectricWaterDamageOam_39f6c8_Frame6[] = {
    13,
    0xee, 0x1, OBJ_PALETTE_8 | 0x212,
    0xf7, 0x1, OBJ_PALETTE_8 | 0x235,
    0xf3, 0x1, OBJ_PALETTE_8 | 0x214,
    0xf4, 0x1f7, OBJ_PALETTE_8 | 0x230,
    0xeb, 0x1f3, OBJ_PALETTE_8 | 0x214,
    0xed, 0x1f7, OBJ_PALETTE_8 | 0x211,
    0xdc, 0x2, OBJ_PALETTE_8 | 0x233,
    0xe2, 0x4, OBJ_PALETTE_8 | 0x231,
    0xe1, 0x1f7, OBJ_PALETTE_8 | 0x211,
    0xed, 0x1, OBJ_PALETTE_8 | 0x22f,
    0xe6, 0x1f7, OBJ_PALETTE_8 | 0x20f,
    0xe2, 0x2, OBJ_PALETTE_8 | 0x210,
    0xf5, 0x1fd, OBJ_PALETTE_8 | 0x233
};

static const u16 sBox2ElectricWaterDamageOam_39f6c8_Frame7[] = {
    5,
    0xf1, 0x2, OBJ_PALETTE_8 | 0x235,
    0xeb, 0x3, OBJ_PALETTE_8 | 0x236,
    0xf0, 0x1f4, OBJ_PALETTE_8 | 0x213,
    0xe9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x214,
    0xe0, 0x1, OBJ_PALETTE_8 | 0x214
};

static const u16 sBox2ElectricWaterDamageOam_39f6c8_Frame8[] = {
    1,
    0x0, 0x1f8, OBJ_PALETTE_8 | 0x27f
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame6[] = {
    2,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame7[] = {
    1,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x203
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame8[] = {
    2,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x205,
    0xf4, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x207
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame9[] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xde, 0x0, OBJ_PALETTE_8 | 0x20a,
    0xe6, 0x1f8, OBJ_PALETTE_8 | 0x229
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame10[] = {
    4,
    0xfa, 0x1ff, OBJ_PALETTE_8 | 0x22e,
    0xf1, 0x1fb, OBJ_PALETTE_8 | 0x20e,
    0xe7, 0x1f8, OBJ_PALETTE_8 | 0x22d,
    0xe3, 0x1, OBJ_PALETTE_8 | 0x20d
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame11[] = {
    13,
    0xee, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x212,
    0xf7, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x235,
    0xf3, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x214,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x230,
    0xeb, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x214,
    0xed, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x211,
    0xdc, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x233,
    0xe2, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x231,
    0xe1, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x211,
    0xed, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x22f,
    0xe6, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x20f,
    0xe2, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x210,
    0xf5, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x233
};

static const u16 sBox2ElectricWaterDamageOam_39f658_Frame12[] = {
    5,
    0xf1, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x235,
    0xeb, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x236,
    0xf0, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x213,
    0xe9, 0x1f4, OBJ_PALETTE_8 | 0x214,
    0xe0, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x214
};

const struct FrameData sBox2ElectricWaterDamageOam_39f658[14] = {
    [0] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame8,
        .timer = 6
    },
    [9] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame9,
        .timer = 6
    },
    [10] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame10,
        .timer = 6
    },
    [11] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame11,
        .timer = 6
    },
    [12] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame12,
        .timer = 6
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBox2ElectricWaterDamageOam_39f6c8[10] = {
    [0] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f658_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f6c8_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f6c8_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sBox2ElectricWaterDamageOam_39f6c8_Frame8,
        .timer = 10
    },
    [9] = FRAME_DATA_TERMINATOR
};
