#include "data/sprites/sciser.h"
#include "macros.h"

const s16 sSciserBackgroundSpeedLeft[12] = {
    -1, 0, 0, 1,
    0, 0, 1, 0,
    0, -1, 0, 0
};

const s16 sSciserBackgroundSpeedRight[12] = {
    1, 0, 0, -1,
    0, 0, -1, 0,
    0, 1, 0, 0
};

const s16 sSciserProjectileFallingSpeed1[25] = {
    -4, -4, -3, -3,
    -2, -2, -1, -1,
    0, 0, 0, 0,
    1, 1, 2, 2,
    4, 4, 6, 6,
    8, 8, 12, 12,
    SHORT_MAX
};

const s16 sSciserProjectileFallingSpeed2[25] = {
    0, 1, 0, 1,
    0, 1, 0, 1,
    1, 1, 1, 1,
    1, 1, 2, 2,
    4, 4, 6, 6,
    7, 7, 8, 8,
    SHORT_MAX
};

const u32 sSciserGfx[512 * 2] = INCBIN_U32("data/sprites/sciser.gfx");
const u16 sSciserPal[16 * 2] = INCBIN_U16("data/sprites/sciser.pal");

static const u16 sFrameData_318e50_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    0xe8, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sFrameData_318e50_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x206,
    0xe7, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sFrameData_318e50_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x206,
    0xe7, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_318746[OAM_DATA_SIZE(6)] = {
    6,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x21a,
    0xe7, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x216
};

static const u16 sOam_31876c[OAM_DATA_SIZE(6)] = {
    6,
    0xe7, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x218,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x217
};

static const u16 sOam_318792[OAM_DATA_SIZE(6)] = {
    6,
    0xea, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x21a,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1f0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x217
};

static const u16 sFrameData_318ea0_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x20e,
    0xf3, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1fe, OBJ_PALETTE_8 | 0x20a
};

static const u16 sFrameData_318ea0_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x20e,
    0xf2, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x20e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20c
};

static const u16 sFrameData_318ea0_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    0xfd, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20e,
    0xf1, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1fe, OBJ_PALETTE_8 | 0x20a
};

static const u16 sOam_3187fa[OAM_DATA_SIZE(6)] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x25a,
    0x2, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x25a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x256
};

static const u16 sOam_318820[OAM_DATA_SIZE(6)] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x258,
    0x2, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fe, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x276
};

static const u16 sOam_318846[OAM_DATA_SIZE(6)] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x25a,
    0x2, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x25a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1fd, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, OBJ_PALETTE_8 | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x276
};

static const u16 sFrameData_318ef0_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x213
};

static const u16 sFrameData_318ef0_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_9 | 0x233
};

static const u16 sFrameData_318f08_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x242,
    0xe9, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x3, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFrameData_318f08_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x240,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x240,
    0xef, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xef, 0x4, OBJ_PALETTE_9 | 0x212,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sFrameData_318f08_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x242,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFrameData_318f30_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    0xef, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xef, 0x4, OBJ_PALETTE_9 | 0x212,
    0xe8, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x240,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x240,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sFrameData_318f30_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_9 | 0x212,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_9 | 0x240,
    0xea, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x240,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x204,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sFrameData_318f48_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_9 | 0x212,
    0xf3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x240,
    0xf3, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_9 | 0x240,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sFrameData_318f78_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xf1, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x4, OBJ_PALETTE_9 | 0x212,
    0xf3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_9 | 0x240,
    0xf3, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_9 | 0x240,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x204,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sFrameData_318f48_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xef, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xef, 0x4, OBJ_PALETTE_9 | 0x212,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_9 | 0x244,
    0xf2, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_9 | 0x244,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sOam_3189a0[OAM_DATA_SIZE(6)] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_9 | 0x212,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_9 | 0x244,
    0xf2, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_9 | 0x244,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x204,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sFrameData_318f48_Frame2[OAM_DATA_SIZE(6)] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xee, 0x4, OBJ_PALETTE_9 | 0x212,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_9 | 0x244,
    0xef, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_9 | 0x244,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x204
};

static const u16 sFrameData_318f48_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x246,
    0xe7, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x246,
    0xee, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xee, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFrameData_318f48_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x246,
    0xe9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x246,
    0xef, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xef, 0x4, OBJ_PALETTE_9 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFrameData_318f90_Frame2[OAM_DATA_SIZE(6)] = {
    6,
    0xec, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xec, 0x4, OBJ_PALETTE_9 | 0x212,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_9 | 0x240,
    0xe6, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_9 | 0x240,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x208,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x208
};

static const u16 sFrameData_318f90_Frame3[OAM_DATA_SIZE(6)] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xee, 0x4, OBJ_PALETTE_9 | 0x212,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_9 | 0x244,
    0xee, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_9 | 0x244,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x208,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x208
};

static const u16 sFrameData_318f90_Frame4[OAM_DATA_SIZE(6)] = {
    6,
    0xf1, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x4, OBJ_PALETTE_9 | 0x212,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_9 | 0x244,
    0xef, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_9 | 0x244,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x204,
    0xf3, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x204
};

static const u16 sFrameData_318fc0_Frame0[OAM_DATA_SIZE(5)] = {
    5,
    0x2, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_9 | 0x24e,
    0xf0, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_9 | 0x24c,
    0xf3, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x0, OBJ_PALETTE_9 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1fe, OBJ_PALETTE_9 | 0x20a
};

static const u16 sFrameData_318fc0_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xef, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x24c,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x24c,
    0xf4, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_9 | 0x254,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c
};

static const u16 sFrameData_318fc0_Frame2[OAM_DATA_SIZE(5)] = {
    5,
    0xee, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_9 | 0x24e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_9 | 0x24c,
    0xf5, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x0, OBJ_PALETTE_9 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x32 | 0x1fe, OBJ_PALETTE_9 | 0x20a
};

static const u16 sFrameData_318fe8_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_9 | 0x254,
    0xed, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x24c,
    0x3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x24c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c
};

static const u16 sFrameData_318fe8_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_9 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_9 | 0x24c,
    0x4, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_9 | 0x24c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x20c
};

static const u16 sFrameData_319000_Frame0[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_9 | 0x254,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24c,
    0x4, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c
};

static const u16 sFrameData_319030_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1ff, OBJ_PALETTE_9 | 0x254,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24c,
    0x5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x20c
};

static const u16 sFrameData_319000_Frame1[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_9 | 0x254,
    0xeb, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x250,
    0x5, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x250,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c
};

static const u16 sOam_318bc2[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_9 | 0x254,
    0xea, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x250,
    0x6, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x250,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_9 | 0x20c
};

static const u16 sFrameData_319000_Frame2[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x2, OBJ_PALETTE_9 | 0x254,
    0xea, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x250,
    0x6, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x250,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c
};

static const u16 sFrameData_319000_Frame3[OAM_DATA_SIZE(5)] = {
    5,
    0xed, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_9 | 0x252,
    0x3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_9 | 0x252,
    0xf4, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x2, OBJ_PALETTE_9 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1fe, OBJ_PALETTE_9 | 0x20a
};

static const u16 sFrameData_319000_Frame4[OAM_DATA_SIZE(5)] = {
    5,
    0xed, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_9 | 0x252,
    0x3, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_9 | 0x252,
    0xf4, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_9 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1fe, OBJ_PALETTE_9 | 0x20a
};

static const u16 sFrameData_319048_Frame2[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x5, OBJ_PALETTE_9 | 0x254,
    0x5, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_9 | 0x24c,
    0xeb, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_9 | 0x24c,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x248,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x248
};

static const u16 sFrameData_319048_Frame3[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x3, OBJ_PALETTE_9 | 0x254,
    0xe9, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x250,
    0x7, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x250,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x248,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x248
};

static const u16 sFrameData_319048_Frame4[OAM_DATA_SIZE(6)] = {
    6,
    0xf4, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1, OBJ_PALETTE_9 | 0x254,
    0xeb, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x250,
    0x5, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x250,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x20c
};

static const u16 sFrameData_318e78_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x206,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x204,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sFrameData_318e78_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    0xe9, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x206,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x204,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sFrameData_318ec8_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    0xf1, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20e,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20e,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x20a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x20a
};

static const u16 sFrameData_318ec8_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x20e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x20e,
    0x0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x24a,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x24a
};

static const u16 sFrameData_319078_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x21c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFrameData_319078_Frame1[OAM_DATA_SIZE(2)] = {
    2,
    0xf1, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x21e,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFrameData_319078_Frame2[OAM_DATA_SIZE(2)] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x21e,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFrameData_3190a0_Frame0[OAM_DATA_SIZE(2)] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x25c,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x25c
};

static const u16 sFrameData_3190a0_Frame1[OAM_DATA_SIZE(2)] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x25e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x25e
};

static const u16 sFrameData_3190a0_Frame2[OAM_DATA_SIZE(2)] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x25e,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x25e
};

static const u16 sFrameData_3190c8_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    0xfa, 0x1fc, OBJ_PALETTE_9 | 0x274,
    0x0, 0x1fc, OBJ_PALETTE_9 | 0x274,
    0xfd, 0x1ff, OBJ_PALETTE_9 | 0x274,
    0xfd, 0x1f9, OBJ_PALETTE_9 | 0x274
};

static const u16 sFrameData_3190c8_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    0xf8, 0x1fc, OBJ_PALETTE_9 | 0x275,
    0xfd, 0x1f7, OBJ_PALETTE_9 | 0x275,
    0x2, 0x1fc, OBJ_PALETTE_9 | 0x275,
    0xfd, 0x1, OBJ_PALETTE_9 | 0x275
};

static const u16 sFrameData_3190c8_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    0xf7, 0x1fc, OBJ_PALETTE_9 | 0x274,
    0x3, 0x1fc, OBJ_PALETTE_9 | 0x274,
    0xfd, 0x2, OBJ_PALETTE_9 | 0x274,
    0xfd, 0x1f6, OBJ_PALETTE_9 | 0x274
};

static const u16 sFrameData_3190c8_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    0xfd, 0x4, OBJ_PALETTE_9 | 0x275,
    0xf5, 0x1fc, OBJ_PALETTE_9 | 0x275,
    0xfd, 0x1f4, OBJ_PALETTE_9 | 0x275,
    0x5, 0x1fc, OBJ_PALETTE_9 | 0x275
};

static const u16 sOam_318de4[OAM_DATA_SIZE(0)] = {
    0
};

static const u16 sFrameData_3190f0_Frame0[OAM_DATA_SIZE(4)] = {
    4,
    0xfb, 0x1fb, OBJ_PALETTE_9 | 0x274,
    0xfe, OBJ_Y_FLIP | 0x1fb, OBJ_PALETTE_9 | 0x274,
    0xfb, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_9 | 0x274,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1fe, OBJ_PALETTE_9 | 0x274
};

static const u16 sFrameData_3190f0_Frame1[OAM_DATA_SIZE(4)] = {
    4,
    0xfa, 0x1fa, OBJ_PALETTE_9 | 0x275,
    0x0, 0x1fa, OBJ_PALETTE_9 | 0x275,
    0x0, 0x0, OBJ_PALETTE_9 | 0x275,
    0xfa, 0x0, OBJ_PALETTE_9 | 0x275
};

static const u16 sFrameData_3190f0_Frame2[OAM_DATA_SIZE(4)] = {
    4,
    0xf9, 0x1f9, OBJ_PALETTE_9 | 0x274,
    0xf9, 0x1, OBJ_PALETTE_9 | 0x274,
    0x1, 0x1f9, OBJ_PALETTE_9 | 0x274,
    0x1, 0x1, OBJ_PALETTE_9 | 0x274
};

static const u16 sFrameData_3190f0_Frame3[OAM_DATA_SIZE(4)] = {
    4,
    0xf7, 0x1f7, OBJ_PALETTE_9 | 0x275,
    0x3, 0x1f7, OBJ_PALETTE_9 | 0x275,
    0x3, 0x3, OBJ_PALETTE_9 | 0x275,
    0xf7, 0x3, OBJ_PALETTE_9 | 0x275
};

const struct FrameData sFrameData_318e50[5] = {
    [0] = {
        .pFrame = sFrameData_318e50_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFrameData_318e50_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sFrameData_318e50_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sFrameData_318e50_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318e78[5] = {
    [0] = {
        .pFrame = sFrameData_318e50_Frame1,
        .timer = 7
    },
    [1] = {
        .pFrame = sFrameData_318e78_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sFrameData_318e78_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sFrameData_318e78_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318ea0[5] = {
    [0] = {
        .pFrame = sFrameData_318ea0_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFrameData_318ea0_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sFrameData_318ea0_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sFrameData_318ea0_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318ec8[5] = {
    [0] = {
        .pFrame = sFrameData_318ea0_Frame1,
        .timer = 7
    },
    [1] = {
        .pFrame = sFrameData_318ec8_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sFrameData_318ec8_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sFrameData_318ec8_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318ef0[3] = {
    [0] = {
        .pFrame = sFrameData_318ef0_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_318ef0_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318f08[5] = {
    [0] = {
        .pFrame = sFrameData_318f08_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_318f08_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_318f08_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFrameData_318f08_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318f30[3] = {
    [0] = {
        .pFrame = sFrameData_318f30_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFrameData_318f30_Frame1,
        .timer = 8
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318f48[6] = {
    [0] = {
        .pFrame = sFrameData_318f48_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_318f48_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sFrameData_318f48_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sFrameData_318f48_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sFrameData_318f48_Frame4,
        .timer = 255
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318f78[3] = {
    [0] = {
        .pFrame = sFrameData_318f48_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_318f78_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318f90[6] = {
    [0] = {
        .pFrame = sFrameData_318f30_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_318f48_Frame3,
        .timer = 4
    },
    [2] = {
        .pFrame = sFrameData_318f90_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sFrameData_318f90_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sFrameData_318f90_Frame4,
        .timer = 255
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318fc0[5] = {
    [0] = {
        .pFrame = sFrameData_318fc0_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_318fc0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_318fc0_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFrameData_318fc0_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_318fe8[3] = {
    [0] = {
        .pFrame = sFrameData_318fe8_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFrameData_318fe8_Frame1,
        .timer = 8
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_319000[6] = {
    [0] = {
        .pFrame = sFrameData_319000_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_319000_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sFrameData_319000_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sFrameData_319000_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sFrameData_319000_Frame4,
        .timer = 255
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_319030[3] = {
    [0] = {
        .pFrame = sFrameData_319000_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_319030_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_319048[6] = {
    [0] = {
        .pFrame = sFrameData_318fe8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_319000_Frame3,
        .timer = 4
    },
    [2] = {
        .pFrame = sFrameData_319048_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sFrameData_319048_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sFrameData_319048_Frame4,
        .timer = 255
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_319078[5] = {
    [0] = {
        .pFrame = sFrameData_319078_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFrameData_319078_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_319078_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sFrameData_319078_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3190a0[5] = {
    [0] = {
        .pFrame = sFrameData_3190a0_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFrameData_3190a0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_3190a0_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sFrameData_3190a0_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3190c8[5] = {
    [0] = {
        .pFrame = sFrameData_3190c8_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sFrameData_3190c8_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sFrameData_3190c8_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3190c8_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3190f0[5] = {
    [0] = {
        .pFrame = sFrameData_3190f0_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sFrameData_3190f0_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sFrameData_3190f0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3190f0_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const u32 sGoldSciserGfx[512 * 2] = INCBIN_U32("data/sprites/gold_sciser.gfx");
const u16 sGoldSciserPal[16 * 2] = INCBIN_U16("data/sprites/gold_sciser.pal");

static const u8 sBlob_31a158_3420b4[] = INCBIN_U8("data/Blob_31a158_3420b4.bin");
