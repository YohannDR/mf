#include "data/sprites/scientist.h"

const u32 sScientistGfx[2 * 512] = INCBIN_U32("data/sprites/scientist.gfx");
const u16 sScientistPal[2 * 16] = INCBIN_U16("data/sprites/scientist.pal");

static const u16 sScientistOam_Idle_Frame0[] = {
    4,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sScientistOam_Idle_Frame1[] = {
    5,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1fc, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x20a
};

static const u16 sScientistOam_Idle_Frame2[] = {
    5,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f4, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1fc, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x20c
};

static const u16 sScientistOam_TurningHead1_Frame1[] = {
    4,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x201,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sScientistOam_TurningHead1_Frame3[] = {
    4,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x221,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sScientistOam_TurningHead2_Frame2[] = {
    4,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sScientistOam_TurningHead2_Frame1[] = {
    4,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x203,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sScientistOam_TurningHead2_Frame3[] = {
    4,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x223,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sScientistOam_34da54_Frame0[] = {
    4,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x222,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sScientistOam_34da54_Frame1[] = {
    5,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x222,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f4, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1fc, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x20a
};

static const u16 sScientistOam_34da54_Frame2[] = {
    5,
    0xdc, 0x1fc, OBJ_PALETTE_8 | 0x222,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f4, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1fc, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x20c
};

static const u16 sScientistOam_TurningBody_Frame2[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x211,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x210,
    0xd8, 0x1fc, OBJ_PALETTE_8 | 0x20d
};

static const u16 sScientistOam_TurningBody_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x216,
    0xe0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x215,
    0xd8, 0x1fc, OBJ_PALETTE_8 | 0x22d
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame0[] = {
    5,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xee, 0x8, OBJ_PALETTE_8 | 0x21d,
    0xde, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xde, 0x8, OBJ_PALETTE_8 | 0x21a,
    0xd6, 0x0, OBJ_PALETTE_8 | 0x220
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame1[] = {
    6,
    0xe2, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x21e,
    0xea, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x10, OBJ_PALETTE_8 | 0x21d,
    0xdf, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xdf, 0xd, OBJ_PALETTE_8 | 0x21a,
    0xd7, 0x5, OBJ_PALETTE_8 | 0x220
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame2[] = {
    6,
    0xe2, OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x21e,
    0xea, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x18, OBJ_PALETTE_8 | 0x21d,
    0xdf, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x15, OBJ_PALETTE_8 | 0x21a,
    0xd7, 0xd, OBJ_PALETTE_8 | 0x220
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame3[] = {
    6,
    0xe2, OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x21e,
    0xea, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x18, OBJ_PALETTE_8 | 0x21d,
    0xdf, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x15, OBJ_PALETTE_8 | 0x21a,
    0xd7, 0xd, OBJ_PALETTE_8 | 0x220
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame13[] = {
    14,
    0xe6, 0x1fb, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_VERTICAL | 0xda, 0x3, OBJ_PALETTE_8 | 0x255,
    OBJ_SHAPE_VERTICAL | 0xea, 0x3, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0xb, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_VERTICAL | 0xde, 0xb, OBJ_PALETTE_8 | 0x259,
    OBJ_SHAPE_VERTICAL | 0xee, 0xb, OBJ_PALETTE_8 | 0x25a,
    0xde, 0x13, OBJ_PALETTE_8 | 0x278,
    0xe6, 0x13, OBJ_PALETTE_8 | 0x278,
    0xee, 0x13, OBJ_PALETTE_8 | 0x278,
    0xe6, 0x1b, OBJ_PALETTE_8 | 0x278,
    0xf6, 0x13, OBJ_PALETTE_8 | 0x25b,
    0xde, 0x1b, OBJ_PALETTE_8 | 0x25c,
    0xee, 0x1b, OBJ_PALETTE_8 | 0x27c,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x23, OBJ_PALETTE_8 | 0x25d
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame25[] = {
    11,
    0xe3, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x9, OBJ_PALETTE_9 | 0x268,
    0xd5, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_9 | 0x240,
    0xd9, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x24c,
    0xf1, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_9 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0xea, 0x11, OBJ_PALETTE_9 | 0x252,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x10, OBJ_PALETTE_9 | 0x247,
    0xe7, 0x20, OBJ_PALETTE_9 | 0x249,
    0xdc, OBJ_SIZE_16x16 | 0x13, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x9, OBJ_PALETTE_9 | 0x268,
    0xeb, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x24e
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame35[] = {
    11,
    0xe3, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x9, OBJ_PALETTE_9 | 0x268,
    0xd5, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_9 | 0x240,
    0xd9, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x24c,
    0xf1, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_9 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0xea, 0x11, OBJ_PALETTE_9 | 0x252,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x10, OBJ_PALETTE_9 | 0x247,
    0xe7, 0x20, OBJ_PALETTE_9 | 0x249,
    0xdc, OBJ_SIZE_16x16 | 0x13, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x9, OBJ_PALETTE_9 | 0x268,
    0xeb, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_9 | 0x24e
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame44[] = {
    12,
    0xe5, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xe1, 0x16, OBJ_PALETTE_9 | 0x268,
    0xd7, OBJ_SIZE_16x16 | 0x16, OBJ_PALETTE_9 | 0x240,
    0xdb, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_9 | 0x24c,
    0xf3, OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_9 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1e, OBJ_PALETTE_9 | 0x252,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1d, OBJ_PALETTE_9 | 0x247,
    0xe9, 0x2d, OBJ_PALETTE_9 | 0x249,
    0xe3, 0x2f, OBJ_PALETTE_9 | 0x267,
    0xde, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x16, OBJ_PALETTE_9 | 0x268,
    0xed, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_9 | 0x24e
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame45[] = {
    14,
    0xf8, 0x30, OBJ_PALETTE_8 | 0x27e,
    0xf6, 0x19, OBJ_PALETTE_8 | 0x25f,
    0xf8, 0x20, OBJ_PALETTE_8 | 0x25e,
    0xe8, OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x22, OBJ_PALETTE_9 | 0x268,
    0xde, OBJ_SIZE_16x16 | 0x1f, OBJ_PALETTE_9 | 0x240,
    0xe2, OBJ_SIZE_16x16 | 0x1d, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x20, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xee, 0x26, OBJ_PALETTE_9 | 0x252,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x25, OBJ_PALETTE_9 | 0x247,
    0xeb, 0x35, OBJ_PALETTE_9 | 0x249,
    0xe5, OBJ_SIZE_16x16 | 0x29, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x25, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2b, OBJ_PALETTE_9 | 0x252
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame46[] = {
    15,
    0xf8, 0x20, OBJ_PALETTE_8 | 0x27f,
    0xf7, 0x1d, OBJ_PALETTE_8 | 0x27f,
    0xf9, 0x1f, OBJ_PALETTE_8 | 0x25f,
    0xfa, 0x28, OBJ_PALETTE_8 | 0x27e,
    0xf8, 0x38, OBJ_PALETTE_8 | 0x25f,
    0xea, OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x2e, OBJ_PALETTE_9 | 0x268,
    0xdf, OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_9 | 0x240,
    0xe3, OBJ_SIZE_16x16 | 0x24, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x2a, OBJ_PALETTE_9 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x29, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x29, OBJ_PALETTE_9 | 0x247,
    0xe6, OBJ_SIZE_16x16 | 0x30, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x2d, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xed, 0x33, OBJ_PALETTE_9 | 0x252
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame47[] = {
    15,
    0xf8, 0x22, OBJ_PALETTE_8 | 0x27f,
    0xf8, 0x27, OBJ_PALETTE_8 | 0x27f,
    0xf9, 0x2d, OBJ_PALETTE_8 | 0x25f,
    0xf8, 0x3a, OBJ_PALETTE_8 | 0x27f,
    0xfa, 0x3b, OBJ_PALETTE_8 | 0x27f,
    0xea, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x30, OBJ_PALETTE_9 | 0x268,
    0xdf, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_9 | 0x240,
    0xe3, OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x2c, OBJ_PALETTE_9 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x2b, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x2b, OBJ_PALETTE_9 | 0x247,
    0xe6, OBJ_SIZE_16x16 | 0x32, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x30, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xee, 0x36, OBJ_PALETTE_9 | 0x252
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame48[] = {
    10,
    0xea, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x32, OBJ_PALETTE_9 | 0x268,
    0xdf, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x240,
    0xe3, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x2e, OBJ_PALETTE_9 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x2d, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x2d, OBJ_PALETTE_9 | 0x247,
    0xe6, OBJ_SIZE_16x16 | 0x34, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x33, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xee, 0x39, OBJ_PALETTE_9 | 0x252
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame49[] = {
    10,
    0xed, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x32, OBJ_PALETTE_9 | 0x268,
    0xdd, OBJ_SIZE_16x16 | 0x2b, OBJ_PALETTE_9 | 0x240,
    0xe4, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x2e, OBJ_PALETTE_9 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x2d, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x2d, OBJ_PALETTE_9 | 0x247,
    0xe4, OBJ_SIZE_16x16 | 0x34, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x32, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xee, 0x38, OBJ_PALETTE_9 | 0x252
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame50[] = {
    10,
    0xec, OBJ_SIZE_16x16 | 0x29, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x31, OBJ_PALETTE_9 | 0x268,
    0xdc, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x240,
    0xe5, OBJ_SIZE_16x16 | 0x29, OBJ_PALETTE_9 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x2f, OBJ_PALETTE_9 | 0x273,
    0xf0, OBJ_SIZE_16x16 | 0x2e, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x2d, OBJ_PALETTE_9 | 0x247,
    0xe3, OBJ_SIZE_16x16 | 0x33, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x31, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xee, 0x37, OBJ_PALETTE_9 | 0x252
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame51[] = {
    10,
    0xf1, OBJ_SIZE_16x16 | 0x29, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x31, OBJ_PALETTE_9 | 0x268,
    0xe0, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x2f, OBJ_PALETTE_9 | 0x273,
    0xf2, OBJ_SIZE_16x16 | 0x2e, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x2d, OBJ_PALETTE_9 | 0x247,
    0xe6, OBJ_SIZE_16x16 | 0x33, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x31, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xee, 0x37, OBJ_PALETTE_9 | 0x252,
    0xea, OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_9 | 0x24c
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame52[] = {
    10,
    0xf4, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x32, OBJ_PALETTE_9 | 0x268,
    0xe2, OBJ_SIZE_16x16 | 0x2b, OBJ_PALETTE_9 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x2f, OBJ_PALETTE_9 | 0x273,
    0xf2, OBJ_SIZE_16x16 | 0x2e, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x2d, OBJ_PALETTE_9 | 0x247,
    0xe8, OBJ_SIZE_16x16 | 0x34, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x32, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xee, 0x38, OBJ_PALETTE_9 | 0x252,
    0xeb, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24c
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame53[] = {
    10,
    0xf5, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x32, OBJ_PALETTE_9 | 0x268,
    0xe3, OBJ_SIZE_16x16 | 0x2b, OBJ_PALETTE_9 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x2f, OBJ_PALETTE_9 | 0x273,
    0xf3, OBJ_SIZE_16x16 | 0x2e, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x2d, OBJ_PALETTE_9 | 0x247,
    0xe9, OBJ_SIZE_16x16 | 0x34, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x34, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xef, 0x3a, OBJ_PALETTE_9 | 0x252,
    0xec, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24c
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame54[] = {
    11,
    0xf5, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x32, OBJ_PALETTE_9 | 0x268,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x2b, OBJ_PALETTE_9 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x33, OBJ_PALETTE_9 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x2f, OBJ_PALETTE_9 | 0x273,
    0xf3, OBJ_SIZE_16x16 | 0x2e, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x2d, OBJ_PALETTE_9 | 0x247,
    0xea, OBJ_SIZE_16x16 | 0x34, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x34, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xef, 0x3a, OBJ_PALETTE_9 | 0x252,
    0xec, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24c
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame55[] = {
    10,
    0xf6, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x32, OBJ_PALETTE_9 | 0x268,
    0xe5, OBJ_SIZE_16x16 | 0x2b, OBJ_PALETTE_9 | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x2f, OBJ_PALETTE_9 | 0x273,
    0xf3, OBJ_SIZE_16x16 | 0x2e, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x2d, OBJ_PALETTE_9 | 0x247,
    0xeb, OBJ_SIZE_16x16 | 0x34, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x34, OBJ_PALETTE_9 | 0x273,
    OBJ_SHAPE_VERTICAL | 0xef, 0x3a, OBJ_PALETTE_9 | 0x252,
    0xee, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_9 | 0x24c
};

static const u16 sScientistOam_TransformingIntoZebesian_Frame4[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_9 | 0x27b
};

const struct FrameData sScientistOam_Idle[13] = {
    [0] = {
        .pFrame = sScientistOam_Idle_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sScientistOam_Idle_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sScientistOam_Idle_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sScientistOam_Idle_Frame1,
        .timer = 8
    },
    [4] = {
        .pFrame = sScientistOam_Idle_Frame2,
        .timer = 8
    },
    [5] = {
        .pFrame = sScientistOam_Idle_Frame0,
        .timer = 8
    },
    [6] = {
        .pFrame = sScientistOam_Idle_Frame2,
        .timer = 8
    },
    [7] = {
        .pFrame = sScientistOam_Idle_Frame0,
        .timer = 8
    },
    [8] = {
        .pFrame = sScientistOam_Idle_Frame1,
        .timer = 8
    },
    [9] = {
        .pFrame = sScientistOam_Idle_Frame0,
        .timer = 8
    },
    [10] = {
        .pFrame = sScientistOam_Idle_Frame2,
        .timer = 8
    },
    [11] = {
        .pFrame = sScientistOam_Idle_Frame1,
        .timer = 8
    },
    [12] = FRAME_DATA_TERMINATOR
};

const struct FrameData sScientistOam_34da54[4] = {
    [0] = {
        .pFrame = sScientistOam_34da54_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sScientistOam_34da54_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sScientistOam_34da54_Frame2,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sScientistOam_TurningHead1[5] = {
    [0] = {
        .pFrame = sScientistOam_Idle_Frame0,
        .timer = 20
    },
    [1] = {
        .pFrame = sScientistOam_TurningHead1_Frame1,
        .timer = 40
    },
    [2] = {
        .pFrame = sScientistOam_Idle_Frame0,
        .timer = 8
    },
    [3] = {
        .pFrame = sScientistOam_TurningHead1_Frame3,
        .timer = 40
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sScientistOam_TurningHead2[5] = {
    [0] = {
        .pFrame = sScientistOam_Idle_Frame0,
        .timer = 20
    },
    [1] = {
        .pFrame = sScientistOam_TurningHead2_Frame1,
        .timer = 40
    },
    [2] = {
        .pFrame = sScientistOam_TurningHead2_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sScientistOam_TurningHead2_Frame3,
        .timer = 40
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sScientistOam_TurningBody[5] = {
    [0] = {
        .pFrame = sScientistOam_Idle_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sScientistOam_TurningHead1_Frame1,
        .timer = 30
    },
    [2] = {
        .pFrame = sScientistOam_TurningBody_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sScientistOam_TurningBody_Frame3,
        .timer = 255
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sScientistOam_TransformingIntoZebesian[65] = {
    [0] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame2,
        .timer = 3
    },
    [6] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame3,
        .timer = 3
    },
    [8] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 3
    },
    [9] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame2,
        .timer = 3
    },
    [10] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [11] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame3,
        .timer = 3
    },
    [12] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [13] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame13,
        .timer = 3
    },
    [14] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [15] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame3,
        .timer = 3
    },
    [16] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [17] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame13,
        .timer = 3
    },
    [18] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [19] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame3,
        .timer = 3
    },
    [20] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [21] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame3,
        .timer = 3
    },
    [22] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [23] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame13,
        .timer = 3
    },
    [24] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [25] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame25,
        .timer = 3
    },
    [26] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [27] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame13,
        .timer = 3
    },
    [28] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [29] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame25,
        .timer = 3
    },
    [30] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [31] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame13,
        .timer = 3
    },
    [32] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [33] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame25,
        .timer = 3
    },
    [34] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [35] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame35,
        .timer = 3
    },
    [36] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [37] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame25,
        .timer = 3
    },
    [38] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [39] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame35,
        .timer = 3
    },
    [40] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [41] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame25,
        .timer = 3
    },
    [42] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame4,
        .timer = 2
    },
    [43] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame35,
        .timer = 30
    },
    [44] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame44,
        .timer = 6
    },
    [45] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame45,
        .timer = 6
    },
    [46] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame46,
        .timer = 6
    },
    [47] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame47,
        .timer = 6
    },
    [48] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame48,
        .timer = 40
    },
    [49] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame49,
        .timer = 20
    },
    [50] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame50,
        .timer = 14
    },
    [51] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame51,
        .timer = 10
    },
    [52] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame52,
        .timer = 6
    },
    [53] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame53,
        .timer = 20
    },
    [54] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame54,
        .timer = 12
    },
    [55] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame55,
        .timer = 30
    },
    [56] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame54,
        .timer = 12
    },
    [57] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame53,
        .timer = 12
    },
    [58] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame54,
        .timer = 12
    },
    [59] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame55,
        .timer = 30
    },
    [60] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame54,
        .timer = 12
    },
    [61] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame53,
        .timer = 12
    },
    [62] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame54,
        .timer = 12
    },
    [63] = {
        .pFrame = sScientistOam_TransformingIntoZebesian_Frame55,
        .timer = 30
    },
    [64] = FRAME_DATA_TERMINATOR
};
