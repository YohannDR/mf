#include "data/sprites/ripper.h"
#include "macros.h"

const u32 sRipperGfx[512] = INCBIN_U32("data/sprites/ripper.gfx");
const u16 sRipperPal[1 * 16] = INCBIN_U16("data/sprites/ripper.pal");

static const u16 sRipperOam_Idle_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf5, 0x1f4, OBJ_SPRITE_OAM | 0x220,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x201
};

static const u16 sRipperOam_Idle_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf5, 0x1f4, OBJ_SPRITE_OAM | 0x223,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x201
};

static const u16 sRipperOam_Idle_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf5, 0x1f4, OBJ_SPRITE_OAM | 0x203,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x201
};

static const u16 sRipperOam_TurningAround_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x204
};

const struct FrameData sRipperOam_Idle[5] = {
    [0] = {
        .pFrame = sRipperOam_Idle_Frame0,
        .timer = 8,
    },
    [1] = {
        .pFrame = sRipperOam_Idle_Frame1,
        .timer = 7,
    },
    [2] = {
        .pFrame = sRipperOam_Idle_Frame0,
        .timer = 8,
    },
    [3] = {
        .pFrame = sRipperOam_Idle_Frame3,
        .timer = 7,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sRipperOam_TurningAround[2] = {
    [0] = {
        .pFrame = sRipperOam_TurningAround_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};
