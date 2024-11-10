#include "macros.h"

#include "data/projectile_data.h"

const s16 sWaveBeamPartVelocity[16] = {
    24, 16, 8, 4,
    4, 8, 16, 24,
    32, 20, 8, 4,
    4, 8, 20, 32
};

const s16 sWaveBeamPartVelocity_Unused[16] = {
    24, 20, 16, 12,
    12, 8, 4, 0,
    0, 4, 8, 12,
    12, 16, 20, 24
};

const s16 sNormalMissileVelocity[7] = {
    4, 6, 8, 12,
    14, 16, 18
};

const s16 sSuperMissileVelocity[7] = {
    4, 6, 8, 12,
    16, 20, 24
};

const s16 sIceMissileVelocity[7] = {
    4, 8, 12, 16,
    20, 24, 28
};

const s16 sDiffusionMissileVelocity[7] = {
    8, 12, 16, 20,
    24, 28, 32
};

const s16 sTumblingMissileFallingVelocity[16] = {
    -12, -10, -8, -6,
    -4, -2, 0, 0,
    1, 2, 4, 8,
    12, 16, 20, SHORT_MAX
};

const u16 sNormalBeamPal[1 * 16] = INCBIN_U16("data/projectiles/normal_beam.pal");
const u16 sChargeBeamPal[1 * 16] = INCBIN_U16("data/projectiles/charge_beam.pal");
const u16 sWideBeamPal[1 * 16] = INCBIN_U16("data/projectiles/wide_beam.pal");
const u16 sPlasmaBeamPal[1 * 16] = INCBIN_U16("data/projectiles/plasma_beam.pal");
const u16 sWaveBeamPal[1 * 16] = INCBIN_U16("data/projectiles/wave_beam.pal");
const u16 sIceBeamPal[1 * 16] = INCBIN_U16("data/projectiles/ice_beam.pal");

const u8 sNormalBeamGfx_Top[20 * 32] = INCBIN_U8("data/projectiles/normal_beam_top.gfx");
const u8 sNormalBeamGfx_Bottom[20 * 32] = INCBIN_U8("data/projectiles/normal_beam_bottom.gfx");
const u8 sChargeBeamGfx_Top[20 * 32] = INCBIN_U8("data/projectiles/charge_beam_top.gfx");
const u8 sChargeBeamGfx_Bottom[20 * 32] = INCBIN_U8("data/projectiles/charge_beam_bottom.gfx");
const u8 sWideBeamGfx_Top[20 * 32] = INCBIN_U8("data/projectiles/wide_beam_top.gfx");
const u8 sWideBeamGfx_Bottom[20 * 32] = INCBIN_U8("data/projectiles/wide_beam_bottom.gfx");
const u8 sPlasmaBeamGfx_Top[20 * 32] = INCBIN_U8("data/projectiles/plasma_beam_top.gfx");
const u8 sPlasmaBeamGfx_Bottom[20 * 32] = INCBIN_U8("data/projectiles/plasma_beam_bottom.gfx");
const u8 sWaveBeamGfx_Top[20 * 32] = INCBIN_U8("data/projectiles/wave_beam_top.gfx");
const u8 sWaveBeamGfx_Bottom[20 * 32] = INCBIN_U8("data/projectiles/wave_beam_bottom.gfx");
const u8 sIceBeamGfx_Top[20 * 32] = INCBIN_U8("data/projectiles/ice_beam_top.gfx");
const u8 sIceBeamGfx_Bottom[20 * 32] = INCBIN_U8("data/projectiles/ice_beam_bottom.gfx");

const u8 sNormalMissileGfx_Top[4 * 32] = INCBIN_U8("data/projectiles/normal_missile_top.gfx");
const u8 sNormalMissileGfx_Bottom[4 * 32] = INCBIN_U8("data/projectiles/normal_missile_bottom.gfx");
const u8 sSuperMissileGfx_Top[4 * 32] = INCBIN_U8("data/projectiles/super_missile_top.gfx");
const u8 sSuperMissileGfx_Bottom[4 * 32] = INCBIN_U8("data/projectiles/super_missile_bottom.gfx");
const u8 sIceMissileGfx_Top[4 * 32] = INCBIN_U8("data/projectiles/ice_missile_top.gfx");
const u8 sIceMissileGfx_Bottom[4 * 32] = INCBIN_U8("data/projectiles/ice_missile_bottom.gfx");
const u8 sDiffusionMissileGfx_Top[4 * 32] = INCBIN_U8("data/projectiles/diffusion_missile_top.gfx");
const u8 sDiffusionMissileGfx_Bottom[4 * 32] = INCBIN_U8("data/projectiles/diffusion_missile_bottom.gfx");

static const u16 sOam_58d7ac_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x80
};

static const u16 sOam_58d7ac_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fa, OBJ_PALETTE_2 | 0xa0
};

static const u16 sOam_58d7c4_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x83
};

static const u16 sOam_58d7c4_Frame1[] = {
    1,
    0xfa, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_2 | 0x8b
};

static const u16 sOam_58d7dc_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x82
};

static const u16 sOam_58d7dc_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1fc, OBJ_PALETTE_2 | 0x8a
};

static const u16 sOam_58d7f4_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x88
};

static const u16 sOam_58d7f4_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fa, OBJ_PALETTE_2 | 0xa8
};

static const u16 sOam_58d80c_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x86
};

static const u16 sOam_58d80c_Frame1[] = {
    1,
    0xfa, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_2 | 0x8e
};

static const u16 sOam_58d824_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x85
};

static const u16 sOam_58d824_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1fc, OBJ_PALETTE_2 | 0x8d
};

static const u16 sOam_58d83c_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x90
};

static const u16 sOam_58d83c_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x91
};

static const u16 sOam_58d83c_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58d83c_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sOam_58d83c_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb3
};

const struct FrameData sOam_58d7ac[3] = {
    [0] = {
        .pFrame = sOam_58d7ac_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d7ac_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d7c4[3] = {
    [0] = {
        .pFrame = sOam_58d7c4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d7c4_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d7dc[3] = {
    [0] = {
        .pFrame = sOam_58d7dc_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d7dc_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d7f4[3] = {
    [0] = {
        .pFrame = sOam_58d7f4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d7f4_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d80c[3] = {
    [0] = {
        .pFrame = sOam_58d80c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d80c_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d824[3] = {
    [0] = {
        .pFrame = sOam_58d824_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d824_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d83c[6] = {
    [0] = {
        .pFrame = sOam_58d83c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58d83c_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sOam_58d83c_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sOam_58d83c_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sOam_58d83c_Frame4,
        .timer = 2
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_58d9d8_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58d874[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

static const u16 sOam_58d9e8_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58d884[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

static const u16 sOam_58d9f8_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58d894[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

static const u16 sOam_58d990_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x80
};

static const u16 sOam_58d990_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fe, OBJ_PALETTE_2 | 0x8a
};

static const u16 sOam_58d9a8_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fa, OBJ_PALETTE_2 | 0x81,
    0x2, 0x1fa, OBJ_PALETTE_2 | 0xa1
};

static const u16 sOam_58d9a8_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8b,
    0x4, 0x1fc, OBJ_PALETTE_2 | 0xab
};

static const u16 sOam_58d9c0_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x83
};

static const u16 sOam_58d9c0_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f8, OBJ_PALETTE_2 | 0xa3
};

static const u16 sOam_58da08_Frame0[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_2 | 0x85,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_2 | 0x85,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x6, OBJ_PALETTE_2 | 0x8d
};

static const u16 sOam_58da08_Frame1[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_2 | 0x8d,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x7, OBJ_PALETTE_2 | 0x8d,
    OBJ_SHAPE_VERTICAL | 0xf8, 0xe, OBJ_PALETTE_2 | 0x8d
};

static const u16 sOam_58da20_Frame0[] = {
    3,
    0xf6, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_2 | 0x86,
    0xfb, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_2 | 0x86,
    0x0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x86
};

static const u16 sOam_58da20_Frame1[] = {
    3,
    0xfa, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_2 | 0x8e,
    0xff, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_2 | 0x8e,
    0x4, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_2 | 0x8e
};

static const u16 sOam_58da38_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_2 | 0x88,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1f8, OBJ_PALETTE_2 | 0x88,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1f8, OBJ_PALETTE_2 | 0x88
};

static const u16 sOam_58da38_Frame1[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f8, OBJ_PALETTE_2 | 0x90,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f8, OBJ_PALETTE_2 | 0x90,
    OBJ_SHAPE_HORIZONTAL | 0xc, 0x1f8, OBJ_PALETTE_2 | 0x90
};

static const u16 sOam_58da50_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sOam_58da60_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sOam_58d960[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sOam_58da80_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xa2
};

static const u16 sOam_58da80_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xa8
};

static const u16 sOam_58da80_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xac
};

static const u16 sOam_58da80_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb3
};

static const u16 sOam_58da80_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

const struct FrameData sOam_58d990[3] = {
    [0] = {
        .pFrame = sOam_58d990_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d990_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d9a8[3] = {
    [0] = {
        .pFrame = sOam_58d9a8_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d9a8_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d9c0[3] = {
    [0] = {
        .pFrame = sOam_58d9c0_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58d9c0_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d9d8[2] = {
    [0] = {
        .pFrame = sOam_58d9d8_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d9e8[2] = {
    [0] = {
        .pFrame = sOam_58d9e8_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58d9f8[2] = {
    [0] = {
        .pFrame = sOam_58d9f8_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58da08[3] = {
    [0] = {
        .pFrame = sOam_58da08_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58da08_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58da20[3] = {
    [0] = {
        .pFrame = sOam_58da20_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58da20_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58da38[3] = {
    [0] = {
        .pFrame = sOam_58da38_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58da38_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58da50[2] = {
    [0] = {
        .pFrame = sOam_58da50_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58da60[2] = {
    [0] = {
        .pFrame = sOam_58da60_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58da70[2] = {
    [0] = {
        .pFrame = sOam_58da60_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58da80[6] = {
    [0] = {
        .pFrame = sOam_58da80_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sOam_58da80_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sOam_58da80_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sOam_58da80_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sOam_58da80_Frame4,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_58dbdc_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x80
};

static const u16 sOam_58dbdc_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x81
};

static const u16 sOam_58dbdc_Frame2[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x82
};

static const u16 sOam_58dbfc_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fa, OBJ_PALETTE_2 | 0x83,
    0x2, 0x1fa, OBJ_PALETTE_2 | 0xa3
};

static const u16 sOam_58dbfc_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fa, OBJ_PALETTE_2 | 0x85,
    0x2, 0x1fa, OBJ_PALETTE_2 | 0xa4
};

static const u16 sOam_58dbfc_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fa, OBJ_PALETTE_2 | 0x87,
    0x2, 0x1fa, OBJ_PALETTE_2 | 0xa5
};

static const u16 sOam_58dc1c_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0xa6
};

static const u16 sOam_58dc1c_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x89
};

static const u16 sOam_58dc1c_Frame2[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0xa9
};

static const u16 sOam_58dc3c_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x8b
};

static const u16 sOam_58dc3c_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fd, OBJ_PALETTE_2 | 0x8b
};

static const u16 sOam_58dc54_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x8c
};

static const u16 sOam_58dc54_Frame1[] = {
    1,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_2 | 0x8c
};

static const u16 sOam_58dc6c_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x8e
};

static const u16 sOam_58dc6c_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfd, 0x1f8, OBJ_PALETTE_2 | 0x8e
};

static const u16 sOam_58dc84_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xa8
};

static const u16 sOam_58dc94_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x90
};

static const u16 sOam_58dca4_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x91
};

static const u16 sOam_58dcb4_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xae
};

static const u16 sOam_58dcc4_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xaf
};

static const u16 sOam_58dcd4_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58dce4_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sOam_58dce4_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xb0,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xb0,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xb0,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xb0
};

static const u16 sOam_58dce4_Frame2[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xb1,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xb1,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xb1,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xb1
};

static const u16 sOam_58dce4_Frame3[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xb2,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xb2,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xb2,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xb2
};

static const u16 sOam_58dce4_Frame4[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xb3,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xb3,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xb3,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xb3
};

const struct FrameData sOam_58dbdc[4] = {
    [0] = {
        .pFrame = sOam_58dbdc_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58dbdc_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOam_58dbdc_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dbfc[4] = {
    [0] = {
        .pFrame = sOam_58dbfc_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58dbfc_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOam_58dbfc_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dc1c[4] = {
    [0] = {
        .pFrame = sOam_58dc1c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58dc1c_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOam_58dc1c_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dc3c[3] = {
    [0] = {
        .pFrame = sOam_58dc3c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58dc3c_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dc54[3] = {
    [0] = {
        .pFrame = sOam_58dc54_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58dc54_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dc6c[3] = {
    [0] = {
        .pFrame = sOam_58dc6c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58dc6c_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dc84[2] = {
    [0] = {
        .pFrame = sOam_58dc84_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dc94[2] = {
    [0] = {
        .pFrame = sOam_58dc94_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dca4[2] = {
    [0] = {
        .pFrame = sOam_58dca4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dcb4[2] = {
    [0] = {
        .pFrame = sOam_58dcb4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dcc4[2] = {
    [0] = {
        .pFrame = sOam_58dcc4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dcd4[2] = {
    [0] = {
        .pFrame = sOam_58dcd4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dce4[6] = {
    [0] = {
        .pFrame = sOam_58dce4_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58dce4_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sOam_58dce4_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sOam_58dce4_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sOam_58dce4_Frame4,
        .timer = 2
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_58ddf4_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0x80,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x80
};

static const u16 sOam_58ddf4_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0xa0,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xa0
};

static const u16 sOam_58de0c_Frame0[] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x82,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x82
};

static const u16 sOam_58de0c_Frame1[] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x86,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x86
};

static const u16 sOam_58de24_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x84,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_2 | 0x84
};

static const u16 sOam_58de24_Frame1[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x85,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_2 | 0x85
};

static const u16 sOam_58de3c_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0x88,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x88
};

static const u16 sOam_58de3c_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0xa8,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xa8
};

static const u16 sOam_58de54_Frame0[] = {
    2,
    0xf3, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_2 | 0x8a,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_2 | 0x8a
};

static const u16 sOam_58de54_Frame1[] = {
    2,
    0xf3, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_2 | 0x8d,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_2 | 0x8d
};

static const u16 sOam_58de6c_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x8c,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_2 | 0x8c
};

static const u16 sOam_58de6c_Frame1[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x8f,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_2 | 0x8f
};

static const u16 sOam_58de84_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x90
};

static const u16 sOam_58de84_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x91
};

static const u16 sOam_58de84_Frame2[] = {
    1,
    0xfc, 0x1fb, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58de84_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sOam_58de84_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb0
};

static const u16 sOam_58de84_Frame5[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb1
};

static const u16 sOam_58de84_Frame6[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

const struct FrameData sOam_58ddf4[3] = {
    [0] = {
        .pFrame = sOam_58ddf4_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOam_58ddf4_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58de0c[3] = {
    [0] = {
        .pFrame = sOam_58de0c_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOam_58de0c_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58de24[3] = {
    [0] = {
        .pFrame = sOam_58de24_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOam_58de24_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58de3c[3] = {
    [0] = {
        .pFrame = sOam_58de3c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58de3c_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58de54[3] = {
    [0] = {
        .pFrame = sOam_58de54_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58de54_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58de6c[3] = {
    [0] = {
        .pFrame = sOam_58de6c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58de6c_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58de84[8] = {
    [0] = {
        .pFrame = sOam_58de84_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOam_58de84_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sOam_58de84_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sOam_58de84_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sOam_58de84_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sOam_58de84_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sOam_58de84_Frame6,
        .timer = 3
    },
    [7] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_58df64_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0x80,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_2 | 0x80
};

static const u16 sOam_58df74_Frame0[] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x82,
    0xfe, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x82
};

static const u16 sOam_58df84_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x84,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fc, OBJ_PALETTE_2 | 0x84
};

static const u16 sOam_58df94_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_2 | 0x87,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0x87
};

static const u16 sOam_58df94_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0xa7,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_2 | 0xa7
};

static const u16 sOam_58dfac_Frame0[] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x89,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x89
};

static const u16 sOam_58dfac_Frame1[] = {
    2,
    0xfe, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x8b,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x8b
};

static const u16 sOam_58dfc4_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x86,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fc, OBJ_PALETTE_2 | 0x86
};

static const u16 sOam_58dfc4_Frame1[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fc, OBJ_PALETTE_2 | 0x85,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x85
};

static const u16 sOam_58dfdc_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8d
};

static const u16 sOam_58dfdc_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x8e
};

static const u16 sOam_58dfdc_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x90
};

static const u16 sOam_58dfdc_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x92
};

const struct FrameData sOam_58df64[2] = {
    [0] = {
        .pFrame = sOam_58df64_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58df74[2] = {
    [0] = {
        .pFrame = sOam_58df74_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58df84[2] = {
    [0] = {
        .pFrame = sOam_58df84_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58df94[3] = {
    [0] = {
        .pFrame = sOam_58df94_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58df94_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dfac[3] = {
    [0] = {
        .pFrame = sOam_58dfac_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58dfac_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dfc4[3] = {
    [0] = {
        .pFrame = sOam_58dfc4_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58dfc4_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58dfdc[5] = {
    [0] = {
        .pFrame = sOam_58dfdc_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58dfdc_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOam_58dfdc_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sOam_58dfdc_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_58e1d8_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f4, OBJ_PALETTE_2 | 0x80,
    0xfc, 0x4, OBJ_PALETTE_2 | 0xa0
};

static const u16 sOam_58e1e8_Frame0[] = {
    2,
    0xf7, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_2 | 0x82,
    0x4, 0x4, OBJ_PALETTE_2 | 0xa1
};

static const u16 sOam_58e1f8_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1fc, OBJ_PALETTE_2 | 0x84,
    0x4, 0x1fc, OBJ_PALETTE_2 | 0x85
};

static const u16 sOam_58e208_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x86
};

static const u16 sOam_58e218_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x88
};

static const u16 sOam_58e228_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x8a
};

static const u16 sOam_58e238_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8c
};

static const u16 sOam_58e238_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8d
};

static const u16 sOam_58e238_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8e
};

static const u16 sOam_58e238_Frame3[] = {
    1,
    0xfd, 0x1fc, OBJ_PALETTE_2 | 0x8f
};

static const u16 sOam_58e238_Frame4[] = {
    1,
    0xfe, 0x1fc, OBJ_PALETTE_2 | 0x90
};

static const u16 sOam_58e238_Frame5[] = {
    1,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0x91
};

static const u16 sOam_58e238_Frame6[] = {
    1,
    0x0, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58e2b8_Frame0[] = {
    1,
    0xfe, 0x1fc, OBJ_PALETTE_2 | 0x8c
};

static const u16 sOam_58e2b8_Frame1[] = {
    2,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0x8d,
    0xfb, 0x1ff, OBJ_PALETTE_2 | 0x8c
};

static const u16 sOam_58e2b8_Frame2[] = {
    3,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0x8e,
    0xfb, 0x0, OBJ_PALETTE_2 | 0x8d,
    0xfa, 0x1f9, OBJ_PALETTE_2 | 0x8c
};

static const u16 sOam_58e2b8_Frame3[] = {
    3,
    0x0, 0x1fc, OBJ_PALETTE_2 | 0x8f,
    0xfb, 0x0, OBJ_PALETTE_2 | 0x8e,
    0xf9, 0x1f9, OBJ_PALETTE_2 | 0x8d
};

static const u16 sOam_58e2b8_Frame4[] = {
    3,
    0x0, 0x1fc, OBJ_PALETTE_2 | 0x90,
    0xfb, 0x0, OBJ_PALETTE_2 | 0x8f,
    0xf9, 0x1f9, OBJ_PALETTE_2 | 0x8e
};

static const u16 sOam_58e2b8_Frame5[] = {
    3,
    0x1, 0x1fc, OBJ_PALETTE_2 | 0x91,
    0xfb, 0x0, OBJ_PALETTE_2 | 0x90,
    0xf9, 0x1f9, OBJ_PALETTE_2 | 0x8f
};

static const u16 sOam_58e2b8_Frame6[] = {
    3,
    0x1, 0x1fc, OBJ_PALETTE_2 | 0x92,
    0xfb, 0x1, OBJ_PALETTE_2 | 0x91,
    0xf8, 0x1f9, OBJ_PALETTE_2 | 0x90
};

static const u16 sOam_58e2b8_Frame7[] = {
    2,
    0xfb, 0x1, OBJ_PALETTE_2 | 0x92,
    0xf8, 0x1f9, OBJ_PALETTE_2 | 0x91
};

static const u16 sOam_58e2b8_Frame8[] = {
    1,
    0xf8, 0x1f9, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58e308_Frame0[] = {
    1,
    0xfe, 0x1fc, OBJ_PALETTE_2 | 0xac
};

static const u16 sOam_58e308_Frame1[] = {
    2,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0xad,
    0xfb, 0x1ff, OBJ_PALETTE_2 | 0xac
};

static const u16 sOam_58e308_Frame2[] = {
    3,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0xae,
    0xfb, 0x0, OBJ_PALETTE_2 | 0xad,
    0xfa, 0x1f9, OBJ_PALETTE_2 | 0xac
};

static const u16 sOam_58e308_Frame3[] = {
    3,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0xaf,
    0xfb, 0x0, OBJ_PALETTE_2 | 0xae,
    0xf9, 0x1f9, OBJ_PALETTE_2 | 0xad
};

static const u16 sOam_58e308_Frame4[] = {
    3,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0xb0,
    0xfb, 0x0, OBJ_PALETTE_2 | 0xaf,
    0xf9, 0x1f9, OBJ_PALETTE_2 | 0xae
};

static const u16 sOam_58e308_Frame5[] = {
    3,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0xb1,
    0xfb, 0x0, OBJ_PALETTE_2 | 0xb0,
    0xf9, 0x1f9, OBJ_PALETTE_2 | 0xaf
};

static const u16 sOam_58e308_Frame6[] = {
    3,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0xb2,
    0xfb, 0x1, OBJ_PALETTE_2 | 0xb1,
    0xf8, 0x1f9, OBJ_PALETTE_2 | 0xb0
};

static const u16 sOam_58e308_Frame7[] = {
    2,
    0xfb, 0x1, OBJ_PALETTE_2 | 0xb2,
    0xf8, 0x1f9, OBJ_PALETTE_2 | 0xb1
};

static const u16 sOam_58e308_Frame8[] = {
    1,
    0xf8, 0x1f9, OBJ_PALETTE_2 | 0xb2
};

static const u16 sOam_58e278_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xac
};

static const u16 sOam_58e278_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xad
};

static const u16 sOam_58e278_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xae
};

static const u16 sOam_58e278_Frame3[] = {
    1,
    0xfd, 0x1fc, OBJ_PALETTE_2 | 0xaf
};

static const u16 sOam_58e278_Frame4[] = {
    1,
    0xfe, 0x1fc, OBJ_PALETTE_2 | 0xb0
};

static const u16 sOam_58e278_Frame5[] = {
    1,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0xb1
};

static const u16 sOam_58e278_Frame6[] = {
    1,
    0x0, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

const struct FrameData sOam_58e1d8[2] = {
    [0] = {
        .pFrame = sOam_58e1d8_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e1e8[2] = {
    [0] = {
        .pFrame = sOam_58e1e8_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e1f8[2] = {
    [0] = {
        .pFrame = sOam_58e1f8_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e208[2] = {
    [0] = {
        .pFrame = sOam_58e208_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e218[2] = {
    [0] = {
        .pFrame = sOam_58e218_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e228[2] = {
    [0] = {
        .pFrame = sOam_58e228_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e238[8] = {
    [0] = {
        .pFrame = sOam_58e238_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sOam_58e238_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sOam_58e238_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sOam_58e238_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sOam_58e238_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sOam_58e238_Frame5,
        .timer = 5
    },
    [6] = {
        .pFrame = sOam_58e238_Frame6,
        .timer = 5
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e278[8] = {
    [0] = {
        .pFrame = sOam_58e278_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sOam_58e278_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sOam_58e278_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sOam_58e278_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sOam_58e278_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sOam_58e278_Frame5,
        .timer = 5
    },
    [6] = {
        .pFrame = sOam_58e278_Frame6,
        .timer = 5
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e2b8[10] = {
    [0] = {
        .pFrame = sOam_58e2b8_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sOam_58e2b8_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sOam_58e2b8_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sOam_58e2b8_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sOam_58e2b8_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sOam_58e2b8_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sOam_58e2b8_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sOam_58e2b8_Frame7,
        .timer = 8
    },
    [8] = {
        .pFrame = sOam_58e2b8_Frame8,
        .timer = 8
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e308[10] = {
    [0] = {
        .pFrame = sOam_58e308_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sOam_58e308_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sOam_58e308_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sOam_58e308_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sOam_58e308_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sOam_58e308_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sOam_58e308_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sOam_58e308_Frame7,
        .timer = 8
    },
    [8] = {
        .pFrame = sOam_58e308_Frame8,
        .timer = 8
    },
    [9] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_58e7a8_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xfc, 0x4, OBJ_PALETTE_3 | 0xca
};

static const u16 sOam_58e7a8_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xfc, 0x7, OBJ_PALETTE_3 | 0x16d
};

static const u16 sOam_58e7c0_Frame0[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x1, 0x1, OBJ_PALETTE_3 | 0xca
};

static const u16 sOam_58e7c0_Frame1[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x3, 0x3, OBJ_PALETTE_3 | 0x147
};

static const u16 sOam_58e7d8_Frame0[] = {
    3,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0x4, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sOam_58e7d8_Frame1[] = {
    3,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0x7, 0x1fc, OBJ_PALETTE_3 | 0x16c
};

static const u16 sOam_58e7f0_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x143,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x143,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x143,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x143
};

static const u16 sOam_58e7f0_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x144,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x144,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x144,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x144
};

static const u16 sOam_58e7f0_Frame2[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x145,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x145,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x145,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x145
};

static const u16 sOam_58e7f0_Frame3[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x146,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x146,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x146,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x146
};

static const u16 sOam_58e7f0_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x158
};

static const u16 sOam_58e7f0_Frame5[] = {
    1,
    0xfb, 0x1fb, OBJ_PALETTE_3 | 0x159
};

static const u16 sOam_58e7f0_Frame6[] = {
    1,
    0xfa, 0x1fd, OBJ_PALETTE_3 | 0x15a
};

static const u16 sOam_58e7f0_Frame7[] = {
    1,
    0xf9, 0x1fb, OBJ_PALETTE_3 | 0x15b
};

static const u16 sOam_58e7f0_Frame8[] = {
    1,
    0xf8, 0x1fd, OBJ_PALETTE_3 | 0x15c
};

static const u16 sOam_58e840_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xf8, 0x4, OBJ_PALETTE_4 | 0xe5,
    0xf8, OBJ_X_FLIP | 0xa, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0xa, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_Y_FLIP | 0x4, OBJ_PALETTE_4 | 0xe5
};

static const u16 sOam_58e840_Frame1[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xfc, 0xc, OBJ_PALETTE_4 | 0x16d,
    0xfc, 0x6, OBJ_PALETTE_4 | 0xcb
};

static const u16 sOam_58e858_Frame0[] = {
    5,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x0, 0x1, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_4 | 0xe5,
    0x7, OBJ_X_FLIP | OBJ_Y_FLIP | 0x7, OBJ_PALETTE_4 | 0xe5,
    0x7, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5
};

static const u16 sOam_58e858_Frame1[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x7, 0x7, OBJ_PALETTE_4 | 0x147,
    0x2, 0x2, OBJ_PALETTE_4 | 0xcb
};

static const u16 sOam_58e870_Frame0[] = {
    6,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0x5, 0x1f8, OBJ_PALETTE_4 | 0xe5,
    0x5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5,
    0xb, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5,
    0xb, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0xe5
};

static const u16 sOam_58e870_Frame1[] = {
    4,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0xd, 0x1fc, OBJ_PALETTE_4 | 0x16c,
    0x7, 0x1fc, OBJ_PALETTE_4 | 0xcb
};

static const u16 sOam_58e8d8_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x143,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x143,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x143,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x143
};

static const u16 sOam_58e8d8_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x144,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x144,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x144,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x144
};

static const u16 sOam_58e8d8_Frame2[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x145,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x145,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x145,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x145
};

static const u16 sOam_58e8d8_Frame3[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x146,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x146,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x146,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x146
};

static const u16 sOam_58e888_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sOam_58e888_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcb
};

static const u16 sOam_58e888_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcc
};

static const u16 sOam_58e888_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcd
};

static const u16 sOam_58e980_Frame0[] = {
    9,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xf8, 0x4, OBJ_PALETTE_4 | 0xe5,
    0xf8, OBJ_X_FLIP | 0xa, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0xa, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_Y_FLIP | 0x4, OBJ_PALETTE_4 | 0xe5,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_4 | 0xd8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_4 | 0xd8,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_4 | 0xd8,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_4 | 0xd8
};

static const u16 sOam_58e980_Frame1[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xf0, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_4 | 0xda,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_4 | 0xda,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_4 | 0xda,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_4 | 0xda,
    0xfc, 0xd, OBJ_PALETTE_4 | 0x16d,
    0xfc, 0x6, OBJ_PALETTE_4 | 0xcb
};

static const u16 sOam_58e998_Frame0[] = {
    9,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x0, 0x1, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_4 | 0xe5,
    0x7, OBJ_X_FLIP | OBJ_Y_FLIP | 0x7, OBJ_PALETTE_4 | 0xe5,
    0x7, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0xd8,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_4 | 0xd8,
    0x8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_4 | 0xd8,
    0x8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0xd8
};

static const u16 sOam_58e998_Frame1[] = {
    7,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x7, 0x7, OBJ_PALETTE_4 | 0x147,
    0x2, 0x2, OBJ_PALETTE_4 | 0xcb,
    0xfe, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0xda,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_4 | 0xda,
    0xe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_4 | 0xda,
    0xe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0xda
};

static const u16 sOam_58e9b0_Frame0[] = {
    10,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0x5, 0x1f8, OBJ_PALETTE_4 | 0xe5,
    0x5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5,
    0xb, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5,
    0xb, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0xe5,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0xd8,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0xd8,
    0xc, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0xd8,
    0xc, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0xd8
};

static const u16 sOam_58e9b0_Frame1[] = {
    8,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0x5, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0xda,
    0x5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0xda,
    0x15, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_4 | 0xda,
    0x15, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_4 | 0xda,
    0xd, 0x1fc, OBJ_PALETTE_4 | 0x16c,
    0x6, 0x1fc, OBJ_PALETTE_4 | 0xcb
};

static const u16 sOam_58e928_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x190
};

static const u16 sOam_58e928_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x192
};

static const u16 sOam_58e928_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x194
};

static const u16 sOam_58e928_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x196
};

static const u16 sOam_58e928_Frame4[] = {
    1,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sOam_58e928_Frame5[] = {
    1,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sOam_58e928_Frame6[] = {
    1,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sOam_58e928_Frame7[] = {
    1,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sOam_58e928_Frame8[] = {
    1,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sOam_58e928_Frame9[] = {
    1,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sOam_58e9c8_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x190
};

static const u16 sOam_58e9c8_Frame1[] = {
    2,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x192,
    0xfc, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_4 | 0x190
};

static const u16 sOam_58e9c8_Frame2[] = {
    3,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x194,
    0xfd, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_4 | 0x192,
    0xfa, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_4 | 0x190
};

static const u16 sOam_58e9c8_Frame3[] = {
    3,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x196,
    0xfe, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0x194,
    0xfa, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_4 | 0x192
};

static const u16 sOam_58e9c8_Frame4[] = {
    2,
    0xff, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_4 | 0x196,
    0xfa, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_4 | 0x194
};

static const u16 sOam_58e9c8_Frame5[] = {
    2,
    0xfa, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_4 | 0x196,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sOam_58ea20_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c
};

static const u16 sOam_58ea20_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e
};

static const u16 sOam_58ea20_Frame2[] = {
    2,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd
};

static const u16 sOam_58ea20_Frame3[] = {
    1,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e
};

static const u16 sOam_58ea20_Frame4[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x9c
};

static const u16 sOam_58ea20_Frame5[] = {
    1,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e
};

static const u16 sOam_58ea20_Frame6[] = {
    2,
    0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0xf8, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xbd
};

static const u16 sOam_58ea20_Frame7[] = {
    1,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e
};

const struct FrameData sOam_58e7a8[3] = {
    [0] = {
        .pFrame = sOam_58e7a8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e7a8_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e7c0[3] = {
    [0] = {
        .pFrame = sOam_58e7c0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e7c0_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e7d8[3] = {
    [0] = {
        .pFrame = sOam_58e7d8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e7d8_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e7f0[10] = {
    [0] = {
        .pFrame = sOam_58e7f0_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58e7f0_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOam_58e7f0_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sOam_58e7f0_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sOam_58e7f0_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sOam_58e7f0_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sOam_58e7f0_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sOam_58e7f0_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sOam_58e7f0_Frame8,
        .timer = 6
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e840[3] = {
    [0] = {
        .pFrame = sOam_58e840_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e840_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e858[3] = {
    [0] = {
        .pFrame = sOam_58e858_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e858_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e870[3] = {
    [0] = {
        .pFrame = sOam_58e870_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e870_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e888[10] = {
    [0] = {
        .pFrame = sOam_58e888_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58e888_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOam_58e888_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sOam_58e888_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sOam_58e7f0_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sOam_58e7f0_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sOam_58e7f0_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sOam_58e7f0_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sOam_58e7f0_Frame8,
        .timer = 6
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e8d8[10] = {
    [0] = {
        .pFrame = sOam_58e8d8_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58e8d8_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOam_58e8d8_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sOam_58e8d8_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sOam_58e7f0_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sOam_58e7f0_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sOam_58e7f0_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sOam_58e7f0_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sOam_58e7f0_Frame8,
        .timer = 6
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e928[11] = {
    [0] = {
        .pFrame = sOam_58e928_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOam_58e928_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOam_58e928_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sOam_58e928_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sOam_58e928_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sOam_58e928_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sOam_58e928_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sOam_58e928_Frame7,
        .timer = 8
    },
    [8] = {
        .pFrame = sOam_58e928_Frame8,
        .timer = 8
    },
    [9] = {
        .pFrame = sOam_58e928_Frame9,
        .timer = 8
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e980[3] = {
    [0] = {
        .pFrame = sOam_58e980_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e980_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e998[3] = {
    [0] = {
        .pFrame = sOam_58e998_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e998_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e9b0[3] = {
    [0] = {
        .pFrame = sOam_58e9b0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58e9b0_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58e9c8[11] = {
    [0] = {
        .pFrame = sOam_58e9c8_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOam_58e9c8_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sOam_58e9c8_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sOam_58e9c8_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sOam_58e9c8_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sOam_58e9c8_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sOam_58e928_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sOam_58e928_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sOam_58e928_Frame8,
        .timer = 6
    },
    [9] = {
        .pFrame = sOam_58e928_Frame9,
        .timer = 6
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58ea20[9] = {
    [0] = {
        .pFrame = sOam_58ea20_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOam_58ea20_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sOam_58ea20_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sOam_58ea20_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sOam_58ea20_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sOam_58ea20_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sOam_58ea20_Frame6,
        .timer = 3
    },
    [7] = {
        .pFrame = sOam_58ea20_Frame7,
        .timer = 3
    },
    [8] = FRAME_DATA_TERMINATOR
};

static const u16 sOam_58eac0_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sOam_58eac0_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sOam_58eac0_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sOam_58eac0_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sOam_58eae8_Frame0[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14e
};

static const u16 sOam_58eae8_Frame1[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14f
};

static const u16 sOam_58eae8_Frame2[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x150
};

static const u16 sOam_58eae8_Frame3[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x151
};

static const u16 sOam_58eb38_Frame0[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14b
};

static const u16 sOam_58eb38_Frame1[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14c
};

static const u16 sOam_58eb38_Frame2[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14d
};

const struct FrameData sOam_58eac0[5] = {
    [0] = {
        .pFrame = sOam_58eac0_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOam_58eac0_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sOam_58eac0_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sOam_58eac0_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58eae8[5] = {
    [0] = {
        .pFrame = sOam_58eae8_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sOam_58eae8_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sOam_58eae8_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sOam_58eae8_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58eb10[5] = {
    [0] = {
        .pFrame = sOam_58eae8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOam_58eae8_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sOam_58eae8_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sOam_58eae8_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58eb38[4] = {
    [0] = {
        .pFrame = sOam_58eb38_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sOam_58eb38_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sOam_58eb38_Frame2,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOam_58eb58[4] = {
    [0] = {
        .pFrame = sOam_58eb38_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOam_58eb38_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sOam_58eb38_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

const u8 sFlareHorizontalGfx_Top[40 * 32] = INCBIN_U8("data/projectiles/flare_horizontal_top.gfx");
const u8 sFlareHorizontalGfx_Bottom[40 * 32] = INCBIN_U8("data/projectiles/flare_horizontal_bottom.gfx");
const u8 sFlareDiagonalGfx_Top[40 * 32] = INCBIN_U8("data/projectiles/flare_diagonal_top.gfx");
const u8 sFlareDiagonalGfx_Bottom[40 * 32] = INCBIN_U8("data/projectiles/flare_diagonal_bottom.gfx");
const u8 sFlareVerticalGfx_Top[40 * 32] = INCBIN_U8("data/projectiles/flare_vertical_top.gfx");
const u8 sFlareVerticalGfx_Bottom[40 * 32] = INCBIN_U8("data/projectiles/flare_vertical_bottom.gfx");

static const u16 sFlareOam_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_2 | 0x94,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_2 | 0x98
};

const struct FrameData sFlareOam[2] = {
    [0] = {
        .pFrame = sFlareOam_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
