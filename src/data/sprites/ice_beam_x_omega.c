#include "data/sprites/ice_beam_x_omega.h"

const s16 sIceBeamAbilityOmegaFloatingBeforeSaXYMovement[65] = {
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

const s16 sIceBeamAbilityOmegaFloatingBeforeSaXXMovement[81] = {
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

const u32 sIceBeamAbilityOmegaGfx[512 * 2] = INCBIN_U32("data/sprites/ice_beam_x_omega.gfx");
const u16 sIceBeamAbilityOmegaPal[16 * 1] = INCBIN_U16("data/sprites/ice_beam_x_omega.pal");

static const u16 sIceBeamAbilityOmegaOam_Idle_Frame0[] = {
    4,
    0xf2, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f5, OBJ_PALETTE_8 | 0x240,
    0x2, 0x5, OBJ_PALETTE_8 | 0x242
};

static const u16 sIceBeamAbilityOmegaOam_Idle_Frame1[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f5, OBJ_PALETTE_8 | 0x203,
    0x1, 0x1f5, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x1fd, OBJ_PALETTE_8 | 0x204
};

static const u16 sIceBeamAbilityOmegaOam_Idle_Frame2[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f7, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_8x32 | 0x7, OBJ_PALETTE_8 | 0x208
};

static const u16 sIceBeamAbilityOmegaOam_Idle_Frame3[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_8x32 | 0x6, OBJ_PALETTE_8 | 0x20b
};

static const u16 sIceBeamAbilityOmegaOam_Idle_Frame4[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f3, OBJ_PALETTE_8 | 0x20c,
    0x0, 0x1f3, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x1fb, OBJ_PALETTE_8 | 0x20d
};

static const u16 sIceBeamAbilityOmegaOam_Idle_Frame5[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f9, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_8 | 0x22f,
    0x9, 0x1f9, OBJ_PALETTE_8 | 0x270
};

static const u16 sIceBeamAbilityOmegaOam_Idle_Frame6[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f9, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_8 | 0x233,
    0x8, 0x1f9, OBJ_PALETTE_8 | 0x274
};

static const u16 sIceBeamAbilityOmegaOam_Idle_Frame7[] = {
    5,
    0xfb, 0x1f0, OBJ_PALETTE_8 | 0x258,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x239,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x8, OBJ_PALETTE_8 | 0x23b,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1f8, OBJ_PALETTE_8 | 0x279,
    0x3, 0x8, OBJ_PALETTE_8 | 0x27b
};

static const u16 sIceBeamAbilityOmegaOam_GettingAbsorbed_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x21c
};

static const u16 sIceBeamAbilityOmegaOam_GettingAbsorbed_Frame1[] = {
    1,
    0xee, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x21c
};

const struct FrameData sIceBeamAbilityOmegaOam_Idle[9] = {
    [0] = {
        .pFrame = sIceBeamAbilityOmegaOam_Idle_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sIceBeamAbilityOmegaOam_Idle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sIceBeamAbilityOmegaOam_Idle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sIceBeamAbilityOmegaOam_Idle_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sIceBeamAbilityOmegaOam_Idle_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sIceBeamAbilityOmegaOam_Idle_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sIceBeamAbilityOmegaOam_Idle_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sIceBeamAbilityOmegaOam_Idle_Frame7,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sIceBeamAbilityOmegaOam_GettingAbsorbed[3] = {
    [0] = {
        .pFrame = sIceBeamAbilityOmegaOam_GettingAbsorbed_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sIceBeamAbilityOmegaOam_GettingAbsorbed_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};
