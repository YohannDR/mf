#include "data/sprites/hornoad.h"
#include "macros.h"

const s16 sHornoadSpitYMovement[21] = {
    -4, -4, -3, -3,
    -2, -2, -1, -1,
     0,  0,  0,  0,
     1,  1,  2,  2,
     4,  4,  6,  8,
     SHORT_MAX
};

const s16 sHornoadJumpVelocityHigh[10] = {
    -6, -12, -6, -3,
     0,   4,  8,  12,
    16,  16
};

const s16 sHornoadJumpVelocityLow[10] = {
    -4,  -8, -4, -2,
     0,   4,  8, 16,
    16,  16
};

const u32 sHornoadGfx[512 * 3] = INCBIN_U32("data/sprites/hornoad.gfx");
const u16 sHornoadPal[16 * 3] = INCBIN_U16("data/sprites/hornoad.pal");

static const u16 sHornoadOam_TiltingHeadHidden_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf2, 0x1fc, OBJ_PALETTE_8 | 0x218,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_8 | 0x20f
};

static const u16 sHornoadOam_TiltingHeadHidden_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf1, 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_TiltingHeadHidden_Frame1[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_8 | 0x218,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_8 | 0x212
};

static const u16 sHornoadOam_MunchingHidden_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_MunchingHidden_Frame4[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ef, OBJ_PALETTE_8 | 0x208,
    0xeb, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1ff, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_MunchingHidden_Frame5[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_PALETTE_8 | 0x263,
    0xeb, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_MouthHangingOpenHidden_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf2, 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_MouthHangingOpenHidden_Frame2[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x257,
    0xf0, 0x1fe, OBJ_PALETTE_8 | 0x238,
    0xf2, 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_TurningAroundHidden_Frame1[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x249,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f5, OBJ_PALETTE_8 | 0x249
};

static const u16 sOam_2eabe0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x249,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x249
};

static const u16 sOam_2eabfa[] = {
    5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x237,
    0xf1, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2eac1a[] = {
    5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x237,
    0xf2, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2eac3a[] = {
    5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x237,
    0xf2, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_IdleHidden_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf2, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_IdleHidden_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf2, 0x1fb, OBJ_PALETTE_8 | 0x218,
    0xf6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_IdleHidden_Frame3[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf3, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f0, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_JumpingHidden_Frame0[] = {
    5,
    0xf7, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x216,
    0xf6, 0x1ff, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_JumpingHidden_Frame1[] = {
    5,
    0xf9, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x21a,
    0xf6, 0x1ff, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_JumpingHidden_Frame2[] = {
    5,
    0xf3, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x21c,
    0xf6, 0x1ff, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_JumpingHidden_Frame3[] = {
    5,
    0xf1, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x21e,
    0xf5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_LandingHidden_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf6, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_LandingHidden_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_FallingHidden_Frame0[] = {
    6,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21e,
    0xf2, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f7, OBJ_PALETTE_8 | 0x25d,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x203,
    0xf5, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x205
};

static const u16 sHornoadOam_FallingHidden_Frame1[] = {
    6,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x21a,
    0xf2, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f7, OBJ_PALETTE_8 | 0x25d,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x203,
    0xf4, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x205
};

static const u16 sHornoadOam_2eb594_Frame0[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf2, 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, OBJ_PALETTE_8 | 0x25d,
    0xec, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x203,
    0xf5, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1, OBJ_PALETTE_8 | 0x205
};

static const u16 sHornoadOam_2eb594_Frame1[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf2, 0x1fc, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f7, OBJ_PALETTE_8 | 0x25d,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x203,
    0xf4, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x205
};

static const u16 sHornoadSpawnerOam_Idle_Frame0[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x24c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24c
};

static const u16 sHornoadSpawnerOam_Idle_Frame1[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x24e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24e
};

static const u16 sHornoadSpawnerOam_Idle_Frame2[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x250,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x250
};

static const u16 sHornoadOam_TiltingHead_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f0, OBJ_PALETTE_9 | 0x265,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_9 | 0x212
};

static const u16 sHornoadOam_TiltingHead_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf1, 0x1fc, OBJ_PALETTE_9 | 0x218,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_PALETTE_9 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_TiltingHead_Frame3[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fc, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f0, OBJ_PALETTE_9 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_9 | 0x20f
};

static const u16 sHornoadOam_MouthHangingOpen_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf1, 0x1fc, OBJ_PALETTE_9 | 0x218,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_MouthHangingOpen_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fc, OBJ_PALETTE_9 | 0x218,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_MouthHangingOpen_Frame2[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf3, 0x1fc, OBJ_PALETTE_9 | 0x218,
    0xee, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_9 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_TurningAround_Frame1[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_9 | 0x249,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x259,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, OBJ_PALETTE_9 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f5, OBJ_PALETTE_9 | 0x249
};

static const u16 sOam_2eaf16[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_9 | 0x249,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_9 | 0x259,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_9 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x249
};

static const u16 sOam_2eaf30[] = {
    5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x237,
    0xf2, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_9 | 0x218,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Idle_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fb, OBJ_PALETTE_9 | 0x218,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f0, OBJ_PALETTE_9 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Idle_Frame1[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fb, OBJ_PALETTE_9 | 0x218,
    0xee, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_9 | 0x267,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f0, OBJ_PALETTE_9 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Idle_Frame3[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fb, OBJ_PALETTE_9 | 0x218,
    0xef, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f0, OBJ_PALETTE_9 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Jumping_Frame0[] = {
    5,
    0xf7, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_9 | 0x216,
    0xf6, 0x1ff, OBJ_PALETTE_9 | 0x218,
    0xeb, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_9 | 0x205,
    0xf2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x206
};

static const u16 sHornoadOam_Jumping_Frame1[] = {
    5,
    0xf9, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x21a,
    0xf6, 0x1ff, OBJ_PALETTE_9 | 0x218,
    0xeb, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_9 | 0x205,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x206
};

static const u16 sHornoadOam_Jumping_Frame2[] = {
    5,
    0xf3, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x21c,
    0xf6, 0x1ff, OBJ_PALETTE_9 | 0x218,
    0xeb, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_9 | 0x205,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x206
};

static const u16 sHornoadOam_Jumping_Frame3[] = {
    5,
    0xf1, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x21e,
    0xf5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x218,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_9 | 0x205,
    0xf3, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x206
};

static const u16 sHornoadOam_Landing_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf6, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x218,
    0xee, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f0, OBJ_PALETTE_9 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Landing_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf7, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x218,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_9 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Spitting_Frame2[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fd, OBJ_PALETTE_9 | 0x218,
    0xec, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x203,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Spitting_Frame3[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf1, 0x1fd, OBJ_PALETTE_9 | 0x218,
    0xea, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x203,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Spitting_Frame5[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_9 | 0x218,
    0xe8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    0xf3, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Spitting_Frame4[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf0, 0x1fb, OBJ_PALETTE_9 | 0x218,
    0xe8, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x203,
    0xf3, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1ff, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Spitting_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fb, OBJ_PALETTE_9 | 0x218,
    0xf6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_PALETTE_9 | 0x247
};

static const u16 sHornoadSpitOam_Idle_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x252
};

static const u16 sHornoadSpitOam_Idle_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x280
};

static const u16 sHornoadSpitOam_ExplodingOnGroundOrCeiling_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_10 | 0x274
};

static const u16 sHornoadSpitOam_ExplodingOnGroundOrCeiling_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_10 | 0x254,
    0xf8, 0x4, OBJ_PALETTE_10 | 0x256
};

static const u16 sHornoadSpitOam_ExplodingOnGroundOrCeiling_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_10 | 0x276,
    0xf8, 0x4, OBJ_PALETTE_10 | 0x278
};

static const u16 sHornoadSpitOam_ExplodingOnWall_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_10 | 0x219
};

static const u16 sHornoadSpitOam_ExplodingOnWall_Frame1[] = {
    2,
    0xf4, 0x0, OBJ_PALETTE_10 | 0x27e,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x0, OBJ_PALETTE_10 | 0x25f
};

static const u16 sHornoadSpitOam_ExplodingOnWall_Frame2[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x0, OBJ_PALETTE_10 | 0x282,
    0x4, 0x0, OBJ_PALETTE_10 | 0x283
};

static const u16 sHornoadSpitOam_ExplodingMidair_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_10 | 0x284
};

static const u16 sHornoadSpitOam_ExplodingMidair_Frame1[] = {
    3,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_10 | 0x286,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_10 | 0x288,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f7, OBJ_PALETTE_10 | 0x289
};

static const u16 sHornoadSpitOam_ExplodingMidair_Frame2[] = {
    4,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_10 | 0x28b,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_10 | 0x28d,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_10 | 0x2a9,
    0x4, 0x4, OBJ_PALETTE_10 | 0x2a3
};

static const u16 sHornoadSpawnerOam_Spawning_Frame0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x24c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f3, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x3, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadSpawnerOam_Spawning_Frame1[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x24e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f2, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x2, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadSpawnerOam_Spawning_Frame2[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x250,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1f2, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f2, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x2, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_Falling_Frame0[] = {
    6,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x21e,
    0xf2, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f7, OBJ_PALETTE_9 | 0x25d,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    0xf5, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Falling_Frame1[] = {
    6,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x21a,
    0xf2, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f7, OBJ_PALETTE_9 | 0x25d,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    0xf4, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sOam_2eb244[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fc, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, OBJ_PALETTE_9 | 0x25d,
    0xec, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x203,
    0xf5, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1, OBJ_PALETTE_9 | 0x205
};

static const u16 sOam_2eb26a[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fc, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f7, OBJ_PALETTE_9 | 0x25d,
    0xed, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x203,
    0xf4, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_9 | 0x205
};

static const u16 sHornoadOam_Munching_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf1, 0x1fc, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_PALETTE_9 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_9 | 0x202
};

static const u16 sOam_2eb2b0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_9 | 0x218,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_PALETTE_9 | 0x212
};

static const u16 sHornoadOam_Munching_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1f0, OBJ_PALETTE_9 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x0, OBJ_PALETTE_9 | 0x202
};

static const u16 sHornoadOam_Munching_Frame4[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ef, OBJ_PALETTE_9 | 0x208,
    0xeb, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1ff, OBJ_PALETTE_9 | 0x202
};

static const u16 sHornoadOam_Munching_Frame5[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf0, 0x1fc, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_PALETTE_9 | 0x263,
    0xeb, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x0, OBJ_PALETTE_9 | 0x202
};

static const u16 sHornoadOam_Spitting_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x237,
    0xf2, 0x1fb, OBJ_PALETTE_9 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_PALETTE_9 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_9 | 0x202
};

static const u16 sHornoadOam_2eb844_Frame0[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf5, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x28e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_2eb844_Frame1[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf4, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f0, OBJ_PALETTE_8 | 0x28e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f0, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_2eb844_Frame2[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf3, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_PALETTE_8 | 0x28e,
    0xf6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xef, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_2eb844_Frame3[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf4, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f0, OBJ_PALETTE_8 | 0x28e,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f0, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xef, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_2eb844_Frame4[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf5, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x0, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x2ae
};

static const u16 sHornoadOam_2eb844_Frame5[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf4, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f0, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x0, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f0, OBJ_PALETTE_8 | 0x2ae
};

static const u16 sHornoadOam_2eb844_Frame6[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf3, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_PALETTE_8 | 0x2ae,
    0xf6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xef, 0x0, OBJ_PALETTE_8 | 0x202
};

static const u16 sHornoadOam_2eb844_Frame7[] = {
    5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x237,
    0xf4, 0x1fb, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f0, OBJ_PALETTE_8 | 0x2ae,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f0, OBJ_PALETTE_8 | 0x243,
    OBJ_SHAPE_VERTICAL | 0xef, 0x0, OBJ_PALETTE_8 | 0x202
};

const struct FrameData sHornoadOam_TiltingHeadHidden[5] = {
    [0] = {
        .pFrame = sHornoadOam_TiltingHeadHidden_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sHornoadOam_TiltingHeadHidden_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sHornoadOam_TiltingHeadHidden_Frame0,
        .timer = 6
    },
    [3] = {
        .pFrame = sHornoadOam_TiltingHeadHidden_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_MunchingHidden[9] = {
    [0] = {
        .pFrame = sHornoadOam_TiltingHeadHidden_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sHornoadOam_MunchingHidden_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sHornoadOam_TiltingHeadHidden_Frame0,
        .timer = 10
    },
    [3] = {
        .pFrame = sHornoadOam_MunchingHidden_Frame1,
        .timer = 10
    },
    [4] = {
        .pFrame = sHornoadOam_MunchingHidden_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sHornoadOam_MunchingHidden_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sHornoadOam_MunchingHidden_Frame4,
        .timer = 4
    },
    [7] = {
        .pFrame = sHornoadOam_MunchingHidden_Frame5,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_MouthHangingOpenHidden[5] = {
    [0] = {
        .pFrame = sHornoadOam_TiltingHeadHidden_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sHornoadOam_MouthHangingOpenHidden_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sHornoadOam_MouthHangingOpenHidden_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sHornoadOam_MouthHangingOpenHidden_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_TurningAroundHidden[3] = {
    [0] = {
        .pFrame = sHornoadOam_MouthHangingOpenHidden_Frame1,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_TurningAroundHidden_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_TurninSecondPartHidden[3] = {
    [0] = {
        .pFrame = sHornoadOam_TurningAroundHidden_Frame1,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_MouthHangingOpenHidden_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_IdleHidden[5] = {
    [0] = {
        .pFrame = sHornoadOam_IdleHidden_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sHornoadOam_IdleHidden_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sHornoadOam_IdleHidden_Frame0,
        .timer = 10
    },
    [3] = {
        .pFrame = sHornoadOam_IdleHidden_Frame3,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_JumpingHidden[5] = {
    [0] = {
        .pFrame = sHornoadOam_JumpingHidden_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_JumpingHidden_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sHornoadOam_JumpingHidden_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sHornoadOam_JumpingHidden_Frame3,
        .timer = 255
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_LandingHidden[3] = {
    [0] = {
        .pFrame = sHornoadOam_LandingHidden_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sHornoadOam_LandingHidden_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_FallingHidden[3] = {
    [0] = {
        .pFrame = sHornoadOam_FallingHidden_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_FallingHidden_Frame1,
        .timer = 255
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_2eb594[3] = {
    [0] = {
        .pFrame = sHornoadOam_2eb594_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_2eb594_Frame1,
        .timer = 16
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadSpawnerOam_Idle[4] = {
    [0] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame2,
        .timer = 12
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadSpawnerOam_BeforeSpawning[7] = {
    [0] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame0,
        .timer = 4
    },
    [4] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame1,
        .timer = 4
    },
    [5] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame2,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_TiltingHead[5] = {
    [0] = {
        .pFrame = sHornoadOam_TiltingHead_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sHornoadOam_TiltingHead_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sHornoadOam_TiltingHead_Frame0,
        .timer = 6
    },
    [3] = {
        .pFrame = sHornoadOam_TiltingHead_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_Munching[9] = {
    [0] = {
        .pFrame = sHornoadOam_Munching_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sHornoadOam_Munching_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sHornoadOam_Munching_Frame0,
        .timer = 10
    },
    [3] = {
        .pFrame = sHornoadOam_Munching_Frame1,
        .timer = 10
    },
    [4] = {
        .pFrame = sHornoadOam_Munching_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sHornoadOam_Munching_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sHornoadOam_Munching_Frame4,
        .timer = 4
    },
    [7] = {
        .pFrame = sHornoadOam_Munching_Frame5,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_MouthHangingOpen[5] = {
    [0] = {
        .pFrame = sHornoadOam_MouthHangingOpen_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sHornoadOam_MouthHangingOpen_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sHornoadOam_MouthHangingOpen_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sHornoadOam_MouthHangingOpen_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_TurningAround[3] = {
    [0] = {
        .pFrame = sHornoadOam_MouthHangingOpen_Frame1,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_TurningAround_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_TurninSecondPart[3] = {
    [0] = {
        .pFrame = sHornoadOam_TurningAround_Frame1,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_MouthHangingOpen_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_Idle[5] = {
    [0] = {
        .pFrame = sHornoadOam_Idle_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sHornoadOam_Idle_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sHornoadOam_Idle_Frame0,
        .timer = 10
    },
    [3] = {
        .pFrame = sHornoadOam_Idle_Frame3,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_Jumping[5] = {
    [0] = {
        .pFrame = sHornoadOam_Jumping_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_Jumping_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sHornoadOam_Jumping_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sHornoadOam_Jumping_Frame3,
        .timer = 255
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_Landing[3] = {
    [0] = {
        .pFrame = sHornoadOam_Landing_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sHornoadOam_Landing_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_Spitting[7] = {
    [0] = {
        .pFrame = sHornoadOam_Spitting_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_Spitting_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sHornoadOam_Spitting_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sHornoadOam_Spitting_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sHornoadOam_Spitting_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sHornoadOam_Spitting_Frame5,
        .timer = 8
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadSpitOam_Idle[3] = {
    [0] = {
        .pFrame = sHornoadSpitOam_Idle_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sHornoadSpitOam_Idle_Frame1,
        .timer = 9
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadSpitOam_ExplodingOnGroundOrCeiling[4] = {
    [0] = {
        .pFrame = sHornoadSpitOam_ExplodingOnGroundOrCeiling_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadSpitOam_ExplodingOnGroundOrCeiling_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sHornoadSpitOam_ExplodingOnGroundOrCeiling_Frame2,
        .timer = 7
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadSpitOam_ExplodingOnWall[4] = {
    [0] = {
        .pFrame = sHornoadSpitOam_ExplodingOnWall_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sHornoadSpitOam_ExplodingOnWall_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sHornoadSpitOam_ExplodingOnWall_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadSpitOam_ExplodingMidair[4] = {
    [0] = {
        .pFrame = sHornoadSpitOam_ExplodingMidair_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sHornoadSpitOam_ExplodingMidair_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sHornoadSpitOam_ExplodingMidair_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadSpawnerOam_2eb7e4[2] = {
    [0] = {
        .pFrame = sHornoadSpawnerOam_Idle_Frame2,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadSpawnerOam_Spawning[4] = {
    [0] = {
        .pFrame = sHornoadSpawnerOam_Spawning_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadSpawnerOam_Spawning_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sHornoadSpawnerOam_Spawning_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_Falling[3] = {
    [0] = {
        .pFrame = sHornoadOam_Falling_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_Falling_Frame1,
        .timer = 255
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_2eb82c[3] = {
    [0] = {
        .pFrame = sHornoadOam_Spitting_Frame4,
        .timer = 4
    },
    [1] = {
        .pFrame = sHornoadOam_Spitting_Frame1,
        .timer = 16
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sHornoadOam_2eb844[13] = {
    [0] = {
        .pFrame = sHornoadOam_2eb844_Frame0,
        .timer = 34
    },
    [1] = {
        .pFrame = sHornoadOam_2eb844_Frame1,
        .timer = 22
    },
    [2] = {
        .pFrame = sHornoadOam_2eb844_Frame2,
        .timer = 18
    },
    [3] = {
        .pFrame = sHornoadOam_2eb844_Frame3,
        .timer = 16
    },
    [4] = {
        .pFrame = sHornoadOam_2eb844_Frame4,
        .timer = 34
    },
    [5] = {
        .pFrame = sHornoadOam_2eb844_Frame5,
        .timer = 22
    },
    [6] = {
        .pFrame = sHornoadOam_2eb844_Frame6,
        .timer = 18
    },
    [7] = {
        .pFrame = sHornoadOam_2eb844_Frame7,
        .timer = 16
    },
    [8] = {
        .pFrame = sHornoadOam_2eb844_Frame4,
        .timer = 34
    },
    [9] = {
        .pFrame = sHornoadOam_2eb844_Frame5,
        .timer = 22
    },
    [10] = {
        .pFrame = sHornoadOam_2eb844_Frame6,
        .timer = 18
    },
    [11] = {
        .pFrame = sHornoadOam_2eb844_Frame7,
        .timer = 16
    },
    [12] = FRAME_DATA_TERMINATOR
};
