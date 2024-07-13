#include "data/sprites/missile_hatch.h"
#include "macros.h"

const s16 sMissileHatchDebrisFallingXMovement[16] = {
    -10, -9, -8, -8,
     -7, -7, -6, -6,
     -5, -5, -4, -4,
     -3, -3, -2,
    SHORT_MAX
};

const u32 sMissileHatchGfx[512] = INCBIN_U32("data/sprites/missile_hatch.gfx");
const u16 sMissileHatchPal[1 * 16] = INCBIN_U16("data/sprites/missile_hatch.pal");

static const u16 sMissileHatchOam_Idle_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x206,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x202,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x204
};

static const u16 sMissileHatchDebrisOam_Falling0_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x208
};

static const u16 sMissileHatchDebrisOam_Falling0_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x209
};

static const u16 sMissileHatchDebrisOam_Falling0_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x20a
};

static const u16 sMissileHatchDebrisOam_Falling0_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x20b
};

static const u16 sMissileHatchDebrisOam_Frame_35fc54[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, 0x1fc, OBJ_SPRITE_OAM | 0x21e
};

static const u16 sMissileHatchDebrisOam_Frame_35fc5c[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, 0x1fc, OBJ_SPRITE_OAM | 0x23e
};

static const u16 sMissileHatchDebrisOam_Frame_35fc64[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf8, 0x1fc, OBJ_SPRITE_OAM | 0x21f
};

static const u16 sMissileHatchDebrisOam_Falling1_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x200
};

static const u16 sMissileHatchDebrisOam_Falling3_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x201
};

static const u16 sMissileHatchDebrisOam_Falling2_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x206
};


const struct FrameData sMissileHatchOam_Idle[2] = {
    [0] = {
        .pFrame = sMissileHatchOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileHatchDebrisOam_Falling0[5] = {
    [0] = {
        .pFrame = sMissileHatchDebrisOam_Falling0_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sMissileHatchDebrisOam_Falling0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sMissileHatchDebrisOam_Falling0_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sMissileHatchDebrisOam_Falling0_Frame3,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileHatchOam_35fcbc[2] = {
    [0] = {
        .pFrame = sMissileHatchDebrisOam_Frame_35fc54,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileHatchOam_35fccc[2] = {
    [0] = {
        .pFrame = sMissileHatchDebrisOam_Frame_35fc5c,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileHatchDebrisOam_Falling1[2] = {
    [0] = {
        .pFrame = sMissileHatchDebrisOam_Falling1_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileHatchDebrisOam_Falling2[2] = {
    [0] = {
        .pFrame = sMissileHatchDebrisOam_Falling2_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileHatchDebrisOam_Falling3[2] = {
    [0] = {
        .pFrame = sMissileHatchDebrisOam_Falling3_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};
