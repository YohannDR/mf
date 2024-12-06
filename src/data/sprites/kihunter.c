#include "data/sprites/kihunter.h"

const s16 sKihunterBugIdleYMovement[65] = {
    0, 0, 0, 0,
    1, 1, 1, 1,
    2, 2, 2, 2,
    3, 3, 3, 3,
    3, 3, 3, 3,
    2, 2, 2, 2,
    1, 1, 1, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, -1, -1, -1,
    -2, -2, -2, -2,
    -3, -3, -3, -3,
    -3, -3, -3, -3,
    -2, -2, -2, -2,
    -1, -1, -1, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sKihunterBugIdleXMovement[81] = {
    0, 0, 1, 1,
    2, 2, 3, 3,
    4, 4, 4, 5,
    5, 5, 6, 6,
    6, 7, 7, 7,
    7, 7, 7, 6,
    6, 6, 5, 5,
    5, 4, 4, 4,
    3, 3, 2, 2,
    1, 1, 0, 0,
    0, 0, -1, -1,
    -2, -2, -3, -3,
    -4, -4, -4, -5,
    -5, -5, -6, -6,
    -6, -7, -7, -7,
    -7, -7, -7, -6,
    -6, -6, -5, -5,
    -5, -4, -4, -4,
    -3, -3, -2, -2,
    -1, -1, 0, 0,
    SHORT_MAX
};

const s16 sKihunterSpitFallingSpeed[21] = {
    -4, -4, -3, -3,
    -2, -2, -1, -1,
    0, 0, 0, 0,
    1, 1, 2, 2,
    4, 4, 6, 8,
    SHORT_MAX
};

const s16 sKihunterGroundHighJumpSpeed[10] = {
    -16, -12, -8, -4, 0,
    4, 8, 12, 16, 16
};

const s16 sKihunterGroundLowJumpSpeed[10] = {
    -12, -8, -4, -2, 0,
    4, 8, 16, 16, 16
};

const s16 sKihunterFlyingIdleYMovement[49] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 1, 2, 2,
    2, 1, 1, 0,
    1, 0, 1, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, -1, -2, -2,
    -2, -1, -1, 0,
    -1, 0, -1, 0,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sKihunterFlyingSwoopingDownYSpeed[16] = {
    1, 2, 3, 4,
    5, 6, 7, 8,
    10, 12, 14, 12,
    10, 8, 6, SHORT_MAX
};

const s16 sKihunterFlyingSwoopingAcrossYSpeed[8] = {
    5, 5, 4, 4,
    3, 3, 2, SHORT_MAX
};

const s16 sKihunterFlyingAfterSwoopingAccceleratingYSpeed[12] = {
    -1, -1, -2, -2,
    -3, -3, -4, -5,
    -6, -7, -8, SHORT_MAX
};

const s16 sKihunterFlyingAfterSwoopingDeceleratingYSpeed[12] = {
    -7, -7, -6, -6,
    -5, -5, -4, -4,
    -4, -3, -2, SHORT_MAX
};

const u32 sKihunterGfx[3 * 512] = INCBIN_U32("data/sprites/kihunter.gfx");
const u16 sKihunterPal[3 * 16] = INCBIN_U16("data/sprites/kihunter.pal");

static const u16 sKihunterOam_33e454_Frame0[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    0xf5, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe5, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x259
};

static const u16 sKihunterOam_33e454_Frame1[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    0xf6, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe5, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x259
};

static const u16 sKihunterOam_33e454_Frame2[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    0xf5, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe4, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x259
};

static const u16 sKihunterOam_33e4a4_Frame1[] = {
    5,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1f8, OBJ_PALETTE_8 | 0x250,
    0xe4, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x20c
};

static const u16 sKihunterOam_33e4a4_Frame2[] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fa, OBJ_PALETTE_8 | 0x250,
    0xe3, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fb, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x255,
    0xf9, 0x1ea, OBJ_PALETTE_8 | 0x274
};

static const u16 sKihunterOam_33e474_Frame0[] = {
    1,
    0xdb, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x240
};

static const u16 sKihunterOam_33e474_Frame1[] = {
    1,
    0xea, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x242
};

static const u16 sKihunterOam_33e474_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ff, OBJ_PALETTE_8 | 0x244,
    0xe5, 0xf, OBJ_PALETTE_8 | 0x246
};

static const u16 sKihunterOam_33e4c4_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_PALETTE_8 | 0x268,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x6, OBJ_PALETTE_8 | 0x24a
};

static const u16 sKihunterOam_33e4c4_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f5, OBJ_PALETTE_8 | 0x247,
    0xf9, 0x5, OBJ_PALETTE_8 | 0x249
};

static const u16 sKihunterOam_33e494_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f4, OBJ_PALETTE_8 | 0x247,
    0xfa, 0x4, OBJ_PALETTE_8 | 0x249
};

static const u16 sKihunterOam_33e4c4_Frame3[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f3, OBJ_PALETTE_8 | 0x247,
    0xf9, 0x3, OBJ_PALETTE_8 | 0x249
};

static const u16 sKihunterOam_33e4c4_Frame4[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f2, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1fa, OBJ_PALETTE_8 | 0x266
};

static const u16 sKihunterOam_33e50c_Frame1[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    0xf5, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1fd, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x259
};

static const u16 sKihunterOam_33e50c_Frame2[] = {
    8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f8, OBJ_PALETTE_8 | 0x250,
    0xf3, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1fc, OBJ_PALETTE_8 | 0x272,
    0xe1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fd, OBJ_PALETTE_8 | 0x206,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1f3, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1fa, OBJ_PALETTE_8 | 0x25d
};

static const u16 sKihunterOam_33e50c_Frame3[] = {
    10,
    0xf4, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1fc, OBJ_PALETTE_8 | 0x272,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1e7, OBJ_PALETTE_8 | 0x24b,
    0xeb, 0x1f7, OBJ_PALETTE_8 | 0x254,
    0xe1, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1fd, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1eb, OBJ_PALETTE_8 | 0x25e,
    0xed, 0x1f6, OBJ_PALETTE_8 | 0x254,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x259
};

static const u16 sKihunterOam_33e50c_Frame4[] = {
    9,
    0xed, 0x1f7, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1e9, OBJ_PALETTE_8 | 0x26b,
    0xf5, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe4, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x208,
    0xec, 0x1f6, OBJ_PALETTE_8 | 0x254,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x259
};

static const u16 sKihunterOam_33e50c_Frame5[] = {
    9,
    0xed, 0x1f7, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1ef, OBJ_PALETTE_8 | 0x24d,
    0xf5, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe5, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    0xec, 0x1f5, OBJ_PALETTE_8 | 0x254,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x259
};

static const u16 sKihunterOam_33e50c_Frame6[] = {
    9,
    0xed, 0x1f7, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1ef, OBJ_PALETTE_8 | 0x24d,
    0xf5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x272,
    0xe5, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    0xec, 0x1f5, OBJ_PALETTE_8 | 0x254,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x25b
};

static const u16 sKihunterOam_33e50c_Frame7[] = {
    9,
    0xed, 0x1f7, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1ef, OBJ_PALETTE_8 | 0x24d,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x272,
    0xe5, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    0xec, 0x1f5, OBJ_PALETTE_8 | 0x254,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x25b
};

static const u16 sKihunterOam_33e554_Frame0[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fa, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ec, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1fb, OBJ_PALETTE_8 | 0x234,
    0xea, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fb, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f6, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ed, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x23c
};

static const u16 sKihunterOam_33e554_Frame1[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fb, OBJ_PALETTE_8 | 0x252,
    0xe8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1fb, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x23c
};

static const u16 sKihunterOam_33e554_Frame2[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe5, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x23c
};

static const u16 sKihunterOam_33e554_Frame3[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf6, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1fc, OBJ_PALETTE_8 | 0x272,
    0xe3, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x218
};

static const u16 sKihunterOam_33e6fc_Frame0[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f9, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1fc, OBJ_PALETTE_8 | 0x272,
    0xe9, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf5, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f3, OBJ_PALETTE_8 | 0x23a
};

static const u16 sKihunterOam_33e70c_Frame1[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f7, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1fc, OBJ_PALETTE_8 | 0x272,
    0xea, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf5, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f1, OBJ_PALETTE_8 | 0x25e
};

static const u16 sKihunterOam_33e5b4_Frame0[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe5, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f6, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ed, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x23c
};

static const u16 sKihunterOam_33e5b4_Frame1[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1ed, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fb, OBJ_PALETTE_8 | 0x252,
    0xe7, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f6, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ed, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x23c
};

static const u16 sKihunterOam_33e5b4_Frame2[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fc, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fb, OBJ_PALETTE_8 | 0x252,
    0xe8, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1fb, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f6, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ed, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x23c
};

static const u16 sKihunterOam_33e5ec_Frame0[] = {
    10,
    0xf3, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fc, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x252,
    0xe6, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1fc, OBJ_PALETTE_8 | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1ee, OBJ_PALETTE_8 | 0x25e,
    0xf5, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x259
};

static const u16 sKihunterOam_33e5ec_Frame1[] = {
    10,
    0xf2, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f3, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1ff, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x252,
    0xe6, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1fd, OBJ_PALETTE_8 | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f8, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ef, OBJ_PALETTE_8 | 0x25e,
    0xf5, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x25b
};

static const u16 sKihunterOam_33e61c_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x280,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_9 | 0x284
};

static const u16 sKihunterOam_33e62c_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x2aa
};

static const u16 sKihunterOam_33e62c_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x2ab
};

static const u16 sKihunterOam_33e62c_Frame2[] = {
    1,
    0xfd, OBJ_Y_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x2ab
};

static const u16 sKihunterOam_33e684_Frame7[] = {
    11,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218,
    0xe6, 0x1ef, OBJ_PALETTE_8 | 0x2a8
};

static const u16 sKihunterOam_33e684_Frame8[] = {
    11,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1e7, OBJ_PALETTE_8 | 0x288
};

static const u16 sKihunterOam_33e684_Frame9[] = {
    11,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1e8, OBJ_PALETTE_8 | 0x28a
};

static const u16 sKihunterOam_33e684_Frame10[] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218,
    0xe6, 0x1f0, OBJ_PALETTE_8 | 0x28b,
    0xe2, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x28c
};

static const u16 sKihunterOam_33e684_Frame11[] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218,
    0xe2, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x28c,
    0xe6, 0x1f0, OBJ_PALETTE_8 | 0x2a9
};

static const u16 sKihunterOam_33e64c_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x28e
};

static const u16 sKihunterOam_33e64c_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x28c
};

static const u16 sKihunterOam_33e664_Frame0[] = {
    3,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x290,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x292,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f7, OBJ_PALETTE_9 | 0x293
};

static const u16 sKihunterOam_33e664_Frame1[] = {
    4,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x295,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x4, OBJ_PALETTE_9 | 0x297,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f4, OBJ_PALETTE_9 | 0x2b3,
    0x4, OBJ_X_FLIP | 0x1, OBJ_PALETTE_9 | 0x2b8
};

static const u16 sKihunterOam_33e664_Frame2[] = {
    4,
    0xf4, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_9 | 0x298,
    OBJ_SHAPE_HORIZONTAL | 0x5, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_9 | 0x298,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x5, OBJ_PALETTE_9 | 0x298,
    0x5, 0x5, OBJ_PALETTE_9 | 0x2b8
};

static const u16 sKihunterOam_33e684_Frame4[] = {
    10,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1fb, OBJ_PALETTE_8 | 0x251,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe3, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ed, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x23c
};

static const u16 sKihunterOam_33e684_Frame5[] = {
    11,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1f7, OBJ_PALETTE_8 | 0x251,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218
};

static const u16 sKihunterOam_33e684_Frame6[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xdf, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1fd, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218
};

static const u16 sKihunterOam_33e684_Frame12[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218
};

static const u16 sKihunterOam_33e684_Frame13[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ee, OBJ_PALETTE_8 | 0x24b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fb, OBJ_PALETTE_8 | 0x251,
    0xf5, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xe4, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ec, OBJ_PALETTE_8 | 0x25e,
    0xf4, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x218
};

const struct FrameData sKihunterOam_33e454[4] = {
    [0] = {
        .pFrame = sKihunterOam_33e454_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sKihunterOam_33e454_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sKihunterOam_33e454_Frame2,
        .timer = 1
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e474[4] = {
    [0] = {
        .pFrame = sKihunterOam_33e474_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sKihunterOam_33e474_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sKihunterOam_33e474_Frame2,
        .timer = 1
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e494[2] = {
    [0] = {
        .pFrame = sKihunterOam_33e494_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e4a4[4] = {
    [0] = {
        .pFrame = sKihunterOam_33e454_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sKihunterOam_33e4a4_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sKihunterOam_33e4a4_Frame2,
        .timer = 255
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e4c4[9] = {
    [0] = {
        .pFrame = sKihunterOam_33e4c4_Frame0,
        .timer = 9
    },
    [1] = {
        .pFrame = sKihunterOam_33e4c4_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sKihunterOam_33e494_Frame0,
        .timer = 3
    },
    [3] = {
        .pFrame = sKihunterOam_33e4c4_Frame3,
        .timer = 9
    },
    [4] = {
        .pFrame = sKihunterOam_33e4c4_Frame4,
        .timer = 9
    },
    [5] = {
        .pFrame = sKihunterOam_33e4c4_Frame3,
        .timer = 4
    },
    [6] = {
        .pFrame = sKihunterOam_33e494_Frame0,
        .timer = 3
    },
    [7] = {
        .pFrame = sKihunterOam_33e4c4_Frame1,
        .timer = 9
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e50c[9] = {
    [0] = {
        .pFrame = sKihunterOam_33e454_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sKihunterOam_33e50c_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sKihunterOam_33e50c_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sKihunterOam_33e50c_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sKihunterOam_33e50c_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sKihunterOam_33e50c_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sKihunterOam_33e50c_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sKihunterOam_33e50c_Frame7,
        .timer = 6
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e554[5] = {
    [0] = {
        .pFrame = sKihunterOam_33e554_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sKihunterOam_33e554_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sKihunterOam_33e554_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sKihunterOam_33e554_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e57c[5] = {
    [0] = {
        .pFrame = sKihunterOam_33e554_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sKihunterOam_33e554_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sKihunterOam_33e554_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sKihunterOam_33e554_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e5a4[2] = {
    [0] = {
        .pFrame = sKihunterOam_33e554_Frame1,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e5b4[7] = {
    [0] = {
        .pFrame = sKihunterOam_33e5b4_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sKihunterOam_33e5b4_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sKihunterOam_33e5b4_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sKihunterOam_33e5b4_Frame1,
        .timer = 7
    },
    [4] = {
        .pFrame = sKihunterOam_33e5b4_Frame0,
        .timer = 7
    },
    [5] = {
        .pFrame = sKihunterOam_33e554_Frame2,
        .timer = 7
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e5ec[3] = {
    [0] = {
        .pFrame = sKihunterOam_33e5ec_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sKihunterOam_33e5ec_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e604[3] = {
    [0] = {
        .pFrame = sKihunterOam_33e5ec_Frame1,
        .timer = 2
    },
    [1] = {
        .pFrame = sKihunterOam_33e5ec_Frame0,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e61c[2] = {
    [0] = {
        .pFrame = sKihunterOam_33e61c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e62c[4] = {
    [0] = {
        .pFrame = sKihunterOam_33e62c_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sKihunterOam_33e62c_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sKihunterOam_33e62c_Frame2,
        .timer = 1
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e64c[3] = {
    [0] = {
        .pFrame = sKihunterOam_33e64c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sKihunterOam_33e64c_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e664[4] = {
    [0] = {
        .pFrame = sKihunterOam_33e664_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sKihunterOam_33e664_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sKihunterOam_33e664_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e684[15] = {
    [0] = {
        .pFrame = sKihunterOam_33e554_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sKihunterOam_33e554_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sKihunterOam_33e554_Frame0,
        .timer = 4
    },
    [3] = {
        .pFrame = sKihunterOam_33e554_Frame1,
        .timer = 6
    },
    [4] = {
        .pFrame = sKihunterOam_33e684_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sKihunterOam_33e684_Frame5,
        .timer = 4
    },
    [6] = {
        .pFrame = sKihunterOam_33e684_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sKihunterOam_33e684_Frame7,
        .timer = 3
    },
    [8] = {
        .pFrame = sKihunterOam_33e684_Frame8,
        .timer = 3
    },
    [9] = {
        .pFrame = sKihunterOam_33e684_Frame9,
        .timer = 3
    },
    [10] = {
        .pFrame = sKihunterOam_33e684_Frame10,
        .timer = 3
    },
    [11] = {
        .pFrame = sKihunterOam_33e684_Frame11,
        .timer = 3
    },
    [12] = {
        .pFrame = sKihunterOam_33e684_Frame12,
        .timer = 4
    },
    [13] = {
        .pFrame = sKihunterOam_33e684_Frame13,
        .timer = 6
    },
    [14] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e6fc[2] = {
    [0] = {
        .pFrame = sKihunterOam_33e6fc_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sKihunterOam_33e70c[3] = {
    [0] = {
        .pFrame = sKihunterOam_33e6fc_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sKihunterOam_33e70c_Frame1,
        .timer = 255
    },
    [2] = FRAME_DATA_TERMINATOR
};
