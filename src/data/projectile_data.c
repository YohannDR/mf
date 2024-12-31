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

static const u16 sNormalBeamOam_Horizontal_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x80
};

static const u16 sNormalBeamOam_Horizontal_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fa, OBJ_PALETTE_2 | 0xa0
};

static const u16 sNormalBeamOam_Diagonal_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x83
};

static const u16 sNormalBeamOam_Diagonal_Frame1[] = {
    1,
    0xfa, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_2 | 0x8b
};

static const u16 sNormalBeamOam_Vertical_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x82
};

static const u16 sNormalBeamOam_Vertical_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1fc, OBJ_PALETTE_2 | 0x8a
};

static const u16 sChargedNormalBeamOam_Horizontal_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x88
};

static const u16 sChargedNormalBeamOam_Horizontal_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fa, OBJ_PALETTE_2 | 0xa8
};

static const u16 sChargedNormalBeamOam_Diagonal_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x86
};

static const u16 sChargedNormalBeamOam_Diagonal_Frame1[] = {
    1,
    0xfa, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_2 | 0x8e
};

static const u16 sChargedNormalBeamOam_Vertical_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x85
};

static const u16 sChargedNormalBeamOam_Vertical_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1fc, OBJ_PALETTE_2 | 0x8d
};

static const u16 sParticleOam_ChargedNormalBeamTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x90
};

static const u16 sParticleOam_ChargedNormalBeamTrail_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x91
};

static const u16 sParticleOam_ChargedNormalBeamTrail_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sParticleOam_ChargedNormalBeamTrail_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sParticleOam_ChargedNormalBeamTrail_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb3
};

const struct FrameData sNormalBeamOam_Horizontal[3] = {
    [0] = {
        .pFrame = sNormalBeamOam_Horizontal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sNormalBeamOam_Horizontal_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNormalBeamOam_Diagonal[3] = {
    [0] = {
        .pFrame = sNormalBeamOam_Diagonal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sNormalBeamOam_Diagonal_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNormalBeamOam_Vertical[3] = {
    [0] = {
        .pFrame = sNormalBeamOam_Vertical_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sNormalBeamOam_Vertical_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedNormalBeamOam_Horizontal[3] = {
    [0] = {
        .pFrame = sChargedNormalBeamOam_Horizontal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargedNormalBeamOam_Horizontal_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedNormalBeamOam_Diagonal[3] = {
    [0] = {
        .pFrame = sChargedNormalBeamOam_Diagonal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargedNormalBeamOam_Diagonal_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedNormalBeamOam_Vertical[3] = {
    [0] = {
        .pFrame = sChargedNormalBeamOam_Vertical_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargedNormalBeamOam_Vertical_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ChargedNormalBeamTrail[6] = {
    [0] = {
        .pFrame = sParticleOam_ChargedNormalBeamTrail_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_ChargedNormalBeamTrail_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_ChargedNormalBeamTrail_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_ChargedNormalBeamTrail_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_ChargedNormalBeamTrail_Frame4,
        .timer = 2
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sChargeBeamOam_SingleHorizontal_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58d874[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

static const u16 sChargeBeamOam_SingleDiagonal_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58d884[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

static const u16 sChargeBeamOam_SingleVertical_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x92
};

static const u16 sOam_58d894[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

static const u16 sChargeBeamOam_DoubleHorizontal_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x80
};

static const u16 sChargeBeamOam_DoubleHorizontal_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fe, OBJ_PALETTE_2 | 0x8a
};

static const u16 sChargeBeamOam_DoubleDiagonal_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fa, OBJ_PALETTE_2 | 0x81,
    0x2, 0x1fa, OBJ_PALETTE_2 | 0xa1
};

static const u16 sChargeBeamOam_DoubleDiagonal_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8b,
    0x4, 0x1fc, OBJ_PALETTE_2 | 0xab
};

static const u16 sChargeBeamOam_DoubleVertical_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x83
};

static const u16 sChargeBeamOam_DoubleVertical_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f8, OBJ_PALETTE_2 | 0xa3
};

static const u16 sChargedChargeBeamOam_DoubleHorizontal_Frame0[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f8, OBJ_PALETTE_2 | 0x85,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_2 | 0x85,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x6, OBJ_PALETTE_2 | 0x8d
};

static const u16 sChargedChargeBeamOam_DoubleHorizontal_Frame1[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_2 | 0x8d,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x7, OBJ_PALETTE_2 | 0x8d,
    OBJ_SHAPE_VERTICAL | 0xf8, 0xe, OBJ_PALETTE_2 | 0x8d
};

static const u16 sChargedChargeBeamOam_DoubleDiagonal_Frame0[] = {
    3,
    0xf6, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_2 | 0x86,
    0xfb, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_2 | 0x86,
    0x0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_2 | 0x86
};

static const u16 sChargedChargeBeamOam_DoubleDiagonal_Frame1[] = {
    3,
    0xfa, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_2 | 0x8e,
    0xff, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_2 | 0x8e,
    0x4, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_2 | 0x8e
};

static const u16 sChargedChargeBeamOam_DoubleVertical_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_2 | 0x88,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1f8, OBJ_PALETTE_2 | 0x88,
    OBJ_SHAPE_HORIZONTAL | 0x6, 0x1f8, OBJ_PALETTE_2 | 0x88
};

static const u16 sChargedChargeBeamOam_DoubleVertical_Frame1[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1f8, OBJ_PALETTE_2 | 0x90,
    OBJ_SHAPE_HORIZONTAL | 0x5, 0x1f8, OBJ_PALETTE_2 | 0x90,
    OBJ_SHAPE_HORIZONTAL | 0xc, 0x1f8, OBJ_PALETTE_2 | 0x90
};

static const u16 sChargedChargeBeamOam_SingleHorizontal_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sChargedChargeBeamOam_SingleDiagonal_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sOam_58d960[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sParticleOam_ChargedChargeBeamTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xa2
};

static const u16 sParticleOam_ChargedChargeBeamTrail_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xa8
};

static const u16 sParticleOam_ChargedChargeBeamTrail_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xac
};

static const u16 sParticleOam_ChargedChargeBeamTrail_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb3
};

static const u16 sParticleOam_ChargedChargeBeamTrail_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

const struct FrameData sChargeBeamOam_DoubleHorizontal[3] = {
    [0] = {
        .pFrame = sChargeBeamOam_DoubleHorizontal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargeBeamOam_DoubleHorizontal_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargeBeamOam_DoubleDiagonal[3] = {
    [0] = {
        .pFrame = sChargeBeamOam_DoubleDiagonal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargeBeamOam_DoubleDiagonal_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargeBeamOam_DoubleVertical[3] = {
    [0] = {
        .pFrame = sChargeBeamOam_DoubleVertical_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargeBeamOam_DoubleVertical_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargeBeamOam_SingleHorizontal[2] = {
    [0] = {
        .pFrame = sChargeBeamOam_SingleHorizontal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargeBeamOam_SingleDiagonal[2] = {
    [0] = {
        .pFrame = sChargeBeamOam_SingleDiagonal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargeBeamOam_SingleVertical[2] = {
    [0] = {
        .pFrame = sChargeBeamOam_SingleVertical_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedChargeBeamOam_DoubleHorizontal[3] = {
    [0] = {
        .pFrame = sChargedChargeBeamOam_DoubleHorizontal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargedChargeBeamOam_DoubleHorizontal_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedChargeBeamOam_DoubleDiagonal[3] = {
    [0] = {
        .pFrame = sChargedChargeBeamOam_DoubleDiagonal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargedChargeBeamOam_DoubleDiagonal_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedChargeBeamOam_DoubleVertical[3] = {
    [0] = {
        .pFrame = sChargedChargeBeamOam_DoubleVertical_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sChargedChargeBeamOam_DoubleVertical_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedChargeBeamOam_SingleHorizontal[2] = {
    [0] = {
        .pFrame = sChargedChargeBeamOam_SingleHorizontal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedChargeBeamOam_SingleDiagonal[2] = {
    [0] = {
        .pFrame = sChargedChargeBeamOam_SingleDiagonal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedChargeBeamOam_SingleVertical[2] = {
    [0] = {
        .pFrame = sChargedChargeBeamOam_SingleDiagonal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ChargedChargeBeamTrail[6] = {
    [0] = {
        .pFrame = sParticleOam_ChargedChargeBeamTrail_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sParticleOam_ChargedChargeBeamTrail_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sParticleOam_ChargedChargeBeamTrail_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sParticleOam_ChargedChargeBeamTrail_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sParticleOam_ChargedChargeBeamTrail_Frame4,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sWideBeamOam_Horizontal_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x80
};

static const u16 sWideBeamOam_Horizontal_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x81
};

static const u16 sWideBeamOam_Horizontal_Frame2[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x82
};

static const u16 sWideBeamOam_Diagonal_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fa, OBJ_PALETTE_2 | 0x83,
    0x2, 0x1fa, OBJ_PALETTE_2 | 0xa3
};

static const u16 sWideBeamOam_Diagonal_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fa, OBJ_PALETTE_2 | 0x85,
    0x2, 0x1fa, OBJ_PALETTE_2 | 0xa4
};

static const u16 sWideBeamOam_Diagonal_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1fa, OBJ_PALETTE_2 | 0x87,
    0x2, 0x1fa, OBJ_PALETTE_2 | 0xa5
};

static const u16 sWideBeamOam_Vertical_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0xa6
};

static const u16 sWideBeamOam_Vertical_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x89
};

static const u16 sWideBeamOam_Vertical_Frame2[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0xa9
};

static const u16 sChargedWideBeamOam_Horizontal_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fc, OBJ_PALETTE_2 | 0x8b
};

static const u16 sChargedWideBeamOam_Horizontal_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1fd, OBJ_PALETTE_2 | 0x8b
};

static const u16 sChargedWideBeamOam_Diagonal_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x8c
};

static const u16 sChargedWideBeamOam_Diagonal_Frame1[] = {
    1,
    0xf9, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_2 | 0x8c
};

static const u16 sChargedWideBeamOam_Vertical_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_2 | 0x8e
};

static const u16 sChargedWideBeamOam_Vertical_Frame1[] = {
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

static const u16 sParticleOam_ChargedWideBeamTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sParticleOam_ChargedWideBeamTrail_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xb0,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xb0,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xb0,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xb0
};

static const u16 sParticleOam_ChargedWideBeamTrail_Frame2[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xb1,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xb1,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xb1,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xb1
};

static const u16 sParticleOam_ChargedWideBeamTrail_Frame3[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xb2,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xb2,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xb2,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xb2
};

static const u16 sParticleOam_ChargedWideBeamTrail_Frame4[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_2 | 0xb3,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xb3,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_2 | 0xb3,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_2 | 0xb3
};

const struct FrameData sWideBeamOam_Horizontal[4] = {
    [0] = {
        .pFrame = sWideBeamOam_Horizontal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sWideBeamOam_Horizontal_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sWideBeamOam_Horizontal_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sWideBeamOam_Diagonal[4] = {
    [0] = {
        .pFrame = sWideBeamOam_Diagonal_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sWideBeamOam_Diagonal_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sWideBeamOam_Diagonal_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sWideBeamOam_Vertical[4] = {
    [0] = {
        .pFrame = sWideBeamOam_Vertical_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sWideBeamOam_Vertical_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sWideBeamOam_Vertical_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedWideBeamOam_Horizontal[3] = {
    [0] = {
        .pFrame = sChargedWideBeamOam_Horizontal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedWideBeamOam_Horizontal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedWideBeamOam_Diagonal[3] = {
    [0] = {
        .pFrame = sChargedWideBeamOam_Diagonal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedWideBeamOam_Diagonal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedWideBeamOam_Vertical[3] = {
    [0] = {
        .pFrame = sChargedWideBeamOam_Vertical_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedWideBeamOam_Vertical_Frame1,
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

const struct FrameData sParticleOam_ChargedWideBeamTrail[6] = {
    [0] = {
        .pFrame = sParticleOam_ChargedWideBeamTrail_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sParticleOam_ChargedWideBeamTrail_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sParticleOam_ChargedWideBeamTrail_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sParticleOam_ChargedWideBeamTrail_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sParticleOam_ChargedWideBeamTrail_Frame4,
        .timer = 2
    },
    [5] = FRAME_DATA_TERMINATOR
};

static const u16 sPlasmaBeamOam_Horizontal_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0x80,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x80
};

static const u16 sPlasmaBeamOam_Horizontal_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0xa0,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xa0
};

static const u16 sPlasmaBeamOam_Diagonal_Frame0[] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x82,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x82
};

static const u16 sPlasmaBeamOam_Diagonal_Frame1[] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x86,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x86
};

static const u16 sPlasmaBeamOam_Vertical_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x84,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_2 | 0x84
};

static const u16 sPlasmaBeamOam_Vertical_Frame1[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x85,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_2 | 0x85
};

static const u16 sChargedPlasmaBeamOam_Horizontal_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0x88,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0x88
};

static const u16 sChargedPlasmaBeamOam_Horizontal_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0xa8,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_PALETTE_2 | 0xa8
};

static const u16 sChargedPlasmaBeamOam_Diagonal_Frame0[] = {
    2,
    0xf3, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_2 | 0x8a,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_2 | 0x8a
};

static const u16 sChargedPlasmaBeamOam_Diagonal_Frame1[] = {
    2,
    0xf3, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_2 | 0x8d,
    0xfd, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_2 | 0x8d
};

static const u16 sChargedPlasmaBeamOam_Vertical_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x8c,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_2 | 0x8c
};

static const u16 sChargedPlasmaBeamOam_Vertical_Frame1[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x8f,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_2 | 0x8f
};

static const u16 sParticleOam_ChargedPlasmaBeamTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x90
};

static const u16 sParticleOam_ChargedPlasmaBeamTrail_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x91
};

static const u16 sParticleOam_ChargedPlasmaBeamTrail_Frame2[] = {
    1,
    0xfc, 0x1fb, OBJ_PALETTE_2 | 0x92
};

static const u16 sParticleOam_ChargedPlasmaBeamTrail_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x93
};

static const u16 sParticleOam_ChargedPlasmaBeamTrail_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb0
};

static const u16 sParticleOam_ChargedPlasmaBeamTrail_Frame5[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb1
};

static const u16 sParticleOam_ChargedPlasmaBeamTrail_Frame6[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

const struct FrameData sPlasmaBeamOam_Horizontal[3] = {
    [0] = {
        .pFrame = sPlasmaBeamOam_Horizontal_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sPlasmaBeamOam_Horizontal_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPlasmaBeamOam_Diagonal[3] = {
    [0] = {
        .pFrame = sPlasmaBeamOam_Diagonal_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sPlasmaBeamOam_Diagonal_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPlasmaBeamOam_Vertical[3] = {
    [0] = {
        .pFrame = sPlasmaBeamOam_Vertical_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sPlasmaBeamOam_Vertical_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedPlasmaBeamOam_Horizontal[3] = {
    [0] = {
        .pFrame = sChargedPlasmaBeamOam_Horizontal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedPlasmaBeamOam_Horizontal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedPlasmaBeamOam_Diagonal[3] = {
    [0] = {
        .pFrame = sChargedPlasmaBeamOam_Diagonal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedPlasmaBeamOam_Diagonal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedPlasmaBeamOam_Vertical[3] = {
    [0] = {
        .pFrame = sChargedPlasmaBeamOam_Vertical_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedPlasmaBeamOam_Vertical_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ChargedPlasmaBeamTrail[8] = {
    [0] = {
        .pFrame = sParticleOam_ChargedPlasmaBeamTrail_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sParticleOam_ChargedPlasmaBeamTrail_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sParticleOam_ChargedPlasmaBeamTrail_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sParticleOam_ChargedPlasmaBeamTrail_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sParticleOam_ChargedPlasmaBeamTrail_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sParticleOam_ChargedPlasmaBeamTrail_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sParticleOam_ChargedPlasmaBeamTrail_Frame6,
        .timer = 3
    },
    [7] = FRAME_DATA_TERMINATOR
};

static const u16 sWaveBeamOam_Horizontal_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0x80,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_2 | 0x80
};

static const u16 sWaveBeamOam_Diagonal_Frame0[] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x82,
    0xfe, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x82
};

static const u16 sWaveBeamOam_Vertical_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x84,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fc, OBJ_PALETTE_2 | 0x84
};

static const u16 sChargedWaveBeamOam_Horizontal_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_2 | 0x87,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0x87
};

static const u16 sChargedWaveBeamOam_Horizontal_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_2 | 0xa7,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_2 | 0xa7
};

static const u16 sChargedWaveBeamOam_Diagonal_Frame0[] = {
    2,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x89,
    0xfe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x89
};

static const u16 sChargedWaveBeamOam_Diagonal_Frame1[] = {
    2,
    0xfe, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_2 | 0x8b,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_2 | 0x8b
};

static const u16 sChargedWaveBeamOam_Vertical_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x86,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fc, OBJ_PALETTE_2 | 0x86
};

static const u16 sChargedWaveBeamOam_Vertical_Frame1[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fc, OBJ_PALETTE_2 | 0x85,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_2 | 0x85
};

static const u16 sParticleOam_ChargedWaveBeamTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8d
};

static const u16 sParticleOam_ChargedWaveBeamTrail_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x8e
};

static const u16 sParticleOam_ChargedWaveBeamTrail_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x90
};

static const u16 sParticleOam_ChargedWaveBeamTrail_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x92
};

const struct FrameData sWaveBeamOam_Horizontal[2] = {
    [0] = {
        .pFrame = sWaveBeamOam_Horizontal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sWaveBeamOam_Diagonal[2] = {
    [0] = {
        .pFrame = sWaveBeamOam_Diagonal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sWaveBeamOam_Vertical[2] = {
    [0] = {
        .pFrame = sWaveBeamOam_Vertical_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedWaveBeamOam_Horizontal[3] = {
    [0] = {
        .pFrame = sChargedWaveBeamOam_Horizontal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedWaveBeamOam_Horizontal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedWaveBeamOam_Diagonal[3] = {
    [0] = {
        .pFrame = sChargedWaveBeamOam_Diagonal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedWaveBeamOam_Diagonal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedWaveBeamOam_Vertical[3] = {
    [0] = {
        .pFrame = sChargedWaveBeamOam_Vertical_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sChargedWaveBeamOam_Vertical_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ChargedWaveBeamTrail[5] = {
    [0] = {
        .pFrame = sParticleOam_ChargedWaveBeamTrail_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_ChargedWaveBeamTrail_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_ChargedWaveBeamTrail_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_ChargedWaveBeamTrail_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

static const u16 sIceBeamOam_Horizontal_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f4, OBJ_PALETTE_2 | 0x80,
    0xfc, 0x4, OBJ_PALETTE_2 | 0xa0
};

static const u16 sIceBeamOam_Diagonal_Frame0[] = {
    2,
    0xf7, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_2 | 0x82,
    0x4, 0x4, OBJ_PALETTE_2 | 0xa1
};

static const u16 sIceBeamOam_Vertical_Frame0[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1fc, OBJ_PALETTE_2 | 0x84,
    0x4, 0x1fc, OBJ_PALETTE_2 | 0x85
};

static const u16 sChargedIceBeamOam_Horizontal_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x86
};

static const u16 sChargedIceBeamOam_Diagonal_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x88
};

static const u16 sChargedIceBeamOam_Vertical_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_2 | 0x8a
};

static const u16 sParticleOam_IceBeamTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8c
};

static const u16 sParticleOam_IceBeamTrail_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8d
};

static const u16 sParticleOam_IceBeamTrail_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0x8e
};

static const u16 sParticleOam_IceBeamTrail_Frame3[] = {
    1,
    0xfd, 0x1fc, OBJ_PALETTE_2 | 0x8f
};

static const u16 sParticleOam_IceBeamTrail_Frame4[] = {
    1,
    0xfe, 0x1fc, OBJ_PALETTE_2 | 0x90
};

static const u16 sParticleOam_IceBeamTrail_Frame5[] = {
    1,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0x91
};

static const u16 sParticleOam_IceBeamTrail_Frame6[] = {
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

static const u16 sParticleOam_ChargedIceBeamTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xac
};

static const u16 sParticleOam_ChargedIceBeamTrail_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xad
};

static const u16 sParticleOam_ChargedIceBeamTrail_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_2 | 0xae
};

static const u16 sParticleOam_ChargedIceBeamTrail_Frame3[] = {
    1,
    0xfd, 0x1fc, OBJ_PALETTE_2 | 0xaf
};

static const u16 sParticleOam_ChargedIceBeamTrail_Frame4[] = {
    1,
    0xfe, 0x1fc, OBJ_PALETTE_2 | 0xb0
};

static const u16 sParticleOam_ChargedIceBeamTrail_Frame5[] = {
    1,
    0xff, 0x1fc, OBJ_PALETTE_2 | 0xb1
};

static const u16 sParticleOam_ChargedIceBeamTrail_Frame6[] = {
    1,
    0x0, 0x1fc, OBJ_PALETTE_2 | 0xb2
};

const struct FrameData sIceBeamOam_Horizontal[2] = {
    [0] = {
        .pFrame = sIceBeamOam_Horizontal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sIceBeamOam_Diagonal[2] = {
    [0] = {
        .pFrame = sIceBeamOam_Diagonal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sIceBeamOam_Vertical[2] = {
    [0] = {
        .pFrame = sIceBeamOam_Vertical_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedIceBeamOam_Horizontal[2] = {
    [0] = {
        .pFrame = sChargedIceBeamOam_Horizontal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedIceBeamOam_Diagonal[2] = {
    [0] = {
        .pFrame = sChargedIceBeamOam_Diagonal_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChargedIceBeamOam_Vertical[2] = {
    [0] = {
        .pFrame = sChargedIceBeamOam_Vertical_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_IceBeamTrail[8] = {
    [0] = {
        .pFrame = sParticleOam_IceBeamTrail_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sParticleOam_IceBeamTrail_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sParticleOam_IceBeamTrail_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sParticleOam_IceBeamTrail_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sParticleOam_IceBeamTrail_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sParticleOam_IceBeamTrail_Frame5,
        .timer = 5
    },
    [6] = {
        .pFrame = sParticleOam_IceBeamTrail_Frame6,
        .timer = 5
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ChargedIceBeamTrail[8] = {
    [0] = {
        .pFrame = sParticleOam_ChargedIceBeamTrail_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sParticleOam_ChargedIceBeamTrail_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sParticleOam_ChargedIceBeamTrail_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sParticleOam_ChargedIceBeamTrail_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sParticleOam_ChargedIceBeamTrail_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sParticleOam_ChargedIceBeamTrail_Frame5,
        .timer = 5
    },
    [6] = {
        .pFrame = sParticleOam_ChargedIceBeamTrail_Frame6,
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

static const u16 sNormalSuperMissileOam_Horizontal_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xfc, 0x4, OBJ_PALETTE_3 | 0xca
};

static const u16 sNormalSuperMissileOam_Horizontal_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xfc, 0x7, OBJ_PALETTE_3 | 0x16d
};

static const u16 sNormalSuperMissileOam_Diagonal_Frame0[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x1, 0x1, OBJ_PALETTE_3 | 0xca
};

static const u16 sNormalSuperMissileOam_Diagonal_Frame1[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x3, 0x3, OBJ_PALETTE_3 | 0x147
};

static const u16 sNormalSuperMissileOam_Vertical_Frame0[] = {
    3,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0x4, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sNormalSuperMissileOam_Vertical_Frame1[] = {
    3,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0x7, 0x1fc, OBJ_PALETTE_3 | 0x16c
};

static const u16 sParticleOam_SuperMissileTrail_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x143,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x143,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x143,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x143
};

static const u16 sParticleOam_SuperMissileTrail_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x144,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x144,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x144,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x144
};

static const u16 sParticleOam_SuperMissileTrail_Frame2[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x145,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x145,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x145,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x145
};

static const u16 sParticleOam_SuperMissileTrail_Frame3[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_3 | 0x146,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_3 | 0x146,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_3 | 0x146,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x146
};

static const u16 sParticleOam_SuperMissileTrail_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0x158
};

static const u16 sParticleOam_SuperMissileTrail_Frame5[] = {
    1,
    0xfb, 0x1fb, OBJ_PALETTE_3 | 0x159
};

static const u16 sParticleOam_SuperMissileTrail_Frame6[] = {
    1,
    0xfa, 0x1fd, OBJ_PALETTE_3 | 0x15a
};

static const u16 sParticleOam_SuperMissileTrail_Frame7[] = {
    1,
    0xf9, 0x1fb, OBJ_PALETTE_3 | 0x15b
};

static const u16 sParticleOam_SuperMissileTrail_Frame8[] = {
    1,
    0xf8, 0x1fd, OBJ_PALETTE_3 | 0x15c
};

static const u16 sIceMissileOam_Horizontal_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xf8, 0x4, OBJ_PALETTE_4 | 0xe5,
    0xf8, OBJ_X_FLIP | 0xa, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0xa, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_Y_FLIP | 0x4, OBJ_PALETTE_4 | 0xe5
};

static const u16 sIceMissileOam_Horizontal_Frame1[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xfc, 0xc, OBJ_PALETTE_4 | 0x16d,
    0xfc, 0x6, OBJ_PALETTE_4 | 0xcb
};

static const u16 sIceMissileOam_Diagonal_Frame0[] = {
    5,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x0, 0x1, OBJ_PALETTE_4 | 0xe5,
    0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_4 | 0xe5,
    0x7, OBJ_X_FLIP | OBJ_Y_FLIP | 0x7, OBJ_PALETTE_4 | 0xe5,
    0x7, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5
};

static const u16 sIceMissileOam_Diagonal_Frame1[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x7, 0x7, OBJ_PALETTE_4 | 0x147,
    0x2, 0x2, OBJ_PALETTE_4 | 0xcb
};

static const u16 sIceMissileOam_Vertical_Frame0[] = {
    6,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0x5, 0x1f8, OBJ_PALETTE_4 | 0xe5,
    0x5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5,
    0xb, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0xe5,
    0xb, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0xe5
};

static const u16 sIceMissileOam_Vertical_Frame1[] = {
    4,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd,
    0xd, 0x1fc, OBJ_PALETTE_4 | 0x16c,
    0x7, 0x1fc, OBJ_PALETTE_4 | 0xcb
};

static const u16 sParticleOam_IceMissileTrail_Frame0[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x143,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x143,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x143,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x143
};

static const u16 sParticleOam_IceMissileTrail_Frame1[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x144,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x144,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x144,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x144
};

static const u16 sParticleOam_IceMissileTrail_Frame2[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x145,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x145,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x145,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x145
};

static const u16 sParticleOam_IceMissileTrail_Frame3[] = {
    4,
    0xf8, 0x1f8, OBJ_PALETTE_4 | 0x146,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_4 | 0x146,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | 0x0, OBJ_PALETTE_4 | 0x146,
    0x0, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_4 | 0x146
};

static const u16 sParticleOam_NormalMissileTrail_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xca
};

static const u16 sParticleOam_NormalMissileTrail_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcb
};

static const u16 sParticleOam_NormalMissileTrail_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcc
};

static const u16 sParticleOam_NormalMissileTrail_Frame3[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xcd
};

static const u16 sDiffusionMissileOam_Horizontal_Frame0[] = {
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

static const u16 sDiffusionMissileOam_Horizontal_Frame1[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c,
    0xf0, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_4 | 0xda,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_4 | 0xda,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_PALETTE_4 | 0xda,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_4 | 0xda,
    0xfc, 0xd, OBJ_PALETTE_4 | 0x16d,
    0xfc, 0x6, OBJ_PALETTE_4 | 0xcb
};

static const u16 sDiffusionMissileOam_Diagonal_Frame0[] = {
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

static const u16 sDiffusionMissileOam_Diagonal_Frame1[] = {
    7,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e,
    0x7, 0x7, OBJ_PALETTE_4 | 0x147,
    0x2, 0x2, OBJ_PALETTE_4 | 0xcb,
    0xfe, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0xda,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_4 | 0xda,
    0xe, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_4 | 0xda,
    0xe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0xda
};

static const u16 sDiffusionMissileOam_Vertical_Frame0[] = {
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

static const u16 sDiffusionMissileOam_Vertical_Frame1[] = {
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

static const u16 sParticleOam_DiffusionMissileTrail_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x190
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x192
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x194
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x196
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame4[] = {
    1,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame5[] = {
    1,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame6[] = {
    1,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x188
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame7[] = {
    1,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame8[] = {
    1,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18c
};

static const u16 sParticleOam_DiffusionMissileTrail_Frame9[] = {
    1,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18e
};

static const u16 sParticleOam_ChargedDiffusionMissileTrail_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x190
};

static const u16 sParticleOam_ChargedDiffusionMissileTrail_Frame1[] = {
    2,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x192,
    0xfc, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_4 | 0x190
};

static const u16 sParticleOam_ChargedDiffusionMissileTrail_Frame2[] = {
    3,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x194,
    0xfd, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_4 | 0x192,
    0xfa, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_4 | 0x190
};

static const u16 sParticleOam_ChargedDiffusionMissileTrail_Frame3[] = {
    3,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_4 | 0x196,
    0xfe, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_4 | 0x194,
    0xfa, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_4 | 0x192
};

static const u16 sParticleOam_ChargedDiffusionMissileTrail_Frame4[] = {
    2,
    0xff, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_4 | 0x196,
    0xfa, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_4 | 0x194
};

static const u16 sParticleOam_ChargedDiffusionMissileTrail_Frame5[] = {
    2,
    0xfa, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_4 | 0x196,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x18a
};

static const u16 sMissileOam_Tumbling_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_3 | 0x9c
};

static const u16 sMissileOam_Tumbling_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e
};

static const u16 sMissileOam_Tumbling_Frame2[] = {
    2,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0x0, 0x1fc, OBJ_PALETTE_3 | 0xbd
};

static const u16 sMissileOam_Tumbling_Frame3[] = {
    1,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e
};

static const u16 sMissileOam_Tumbling_Frame4[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_3 | 0x9c
};

static const u16 sMissileOam_Tumbling_Frame5[] = {
    1,
    0xf8, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e
};

static const u16 sMissileOam_Tumbling_Frame6[] = {
    2,
    0x0, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xbc,
    0xf8, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_3 | 0xbd
};

static const u16 sMissileOam_Tumbling_Frame7[] = {
    1,
    0xf8, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_3 | 0x9e
};

const struct FrameData sNormalSuperMissileOam_Horizontal[3] = {
    [0] = {
        .pFrame = sNormalSuperMissileOam_Horizontal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sNormalSuperMissileOam_Horizontal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNormalSuperMissileOam_Diagonal[3] = {
    [0] = {
        .pFrame = sNormalSuperMissileOam_Diagonal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sNormalSuperMissileOam_Diagonal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNormalSuperMissileOam_Vertical[3] = {
    [0] = {
        .pFrame = sNormalSuperMissileOam_Vertical_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sNormalSuperMissileOam_Vertical_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_SuperMissileTrail[10] = {
    [0] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame8,
        .timer = 6
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sIceMissileOam_Horizontal[3] = {
    [0] = {
        .pFrame = sIceMissileOam_Horizontal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sIceMissileOam_Horizontal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sIceMissileOam_Diagonal[3] = {
    [0] = {
        .pFrame = sIceMissileOam_Diagonal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sIceMissileOam_Diagonal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sIceMissileOam_Vertical[3] = {
    [0] = {
        .pFrame = sIceMissileOam_Vertical_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sIceMissileOam_Vertical_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_NormalMissileTrail[10] = {
    [0] = {
        .pFrame = sParticleOam_NormalMissileTrail_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_NormalMissileTrail_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_NormalMissileTrail_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_NormalMissileTrail_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame8,
        .timer = 6
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_IceMissileTrail[10] = {
    [0] = {
        .pFrame = sParticleOam_IceMissileTrail_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_IceMissileTrail_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_IceMissileTrail_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_IceMissileTrail_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sParticleOam_SuperMissileTrail_Frame8,
        .timer = 6
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_DiffusionMissileTrail[11] = {
    [0] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame6,
        .timer = 8
    },
    [7] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame7,
        .timer = 8
    },
    [8] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame8,
        .timer = 8
    },
    [9] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame9,
        .timer = 8
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDiffusionMissileOam_Horizontal[3] = {
    [0] = {
        .pFrame = sDiffusionMissileOam_Horizontal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sDiffusionMissileOam_Horizontal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDiffusionMissileOam_Diagonal[3] = {
    [0] = {
        .pFrame = sDiffusionMissileOam_Diagonal_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sDiffusionMissileOam_Diagonal_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sDiffusionMissileOam_Vertical[3] = {
    [0] = {
        .pFrame = sDiffusionMissileOam_Vertical_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sDiffusionMissileOam_Vertical_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sParticleOam_ChargedDiffusionMissileTrail[11] = {
    [0] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileTrail_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileTrail_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileTrail_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileTrail_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileTrail_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sParticleOam_ChargedDiffusionMissileTrail_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame8,
        .timer = 6
    },
    [9] = {
        .pFrame = sParticleOam_DiffusionMissileTrail_Frame9,
        .timer = 6
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMissileOam_Tumbling[9] = {
    [0] = {
        .pFrame = sMissileOam_Tumbling_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sMissileOam_Tumbling_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sMissileOam_Tumbling_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sMissileOam_Tumbling_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sMissileOam_Tumbling_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sMissileOam_Tumbling_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sMissileOam_Tumbling_Frame6,
        .timer = 3
    },
    [7] = {
        .pFrame = sMissileOam_Tumbling_Frame7,
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

static const u16 sBombOam_Frame0[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14e
};

static const u16 sBombOam_Frame1[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14f
};

static const u16 sBombOam_Frame2[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x150
};

static const u16 sBombOam_Frame3[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x151
};

static const u16 sPowerBombOam_Frame0[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14b
};

static const u16 sPowerBombOam_Frame1[] = {
    1,
    0xf8, 0x1fc, OBJ_PALETTE_3 | 0x14c
};

static const u16 sPowerBombOam_Frame2[] = {
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

const struct FrameData sBombOam_Slow[5] = {
    [0] = {
        .pFrame = sBombOam_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sBombOam_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sBombOam_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sBombOam_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sBombOam_Fast[5] = {
    [0] = {
        .pFrame = sBombOam_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sBombOam_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sBombOam_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sBombOam_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowerBombOam_Slow[4] = {
    [0] = {
        .pFrame = sPowerBombOam_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sPowerBombOam_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sPowerBombOam_Frame2,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPowerBombOam_Fast[4] = {
    [0] = {
        .pFrame = sPowerBombOam_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sPowerBombOam_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sPowerBombOam_Frame2,
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
