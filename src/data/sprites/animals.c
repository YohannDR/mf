#include "data/sprites/animals.h"

const s16 sAnimalLeavingEnclosureYSpeed[13] = {
    -6, -4, -2, 0,
    0, 2, 4, 6,
    8, 8, 8, 8,
    SHORT_MAX
};

const u32 sAnimalsGfx[4 * 512] = INCBIN_U32("data/sprites/animals.gfx");
const u16 sAnimalsPal[4 * 16] = INCBIN_U16("data/sprites/animals.pal");

static const u16 sAnimalsOam_384254_Frame0[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xf3, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f5, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287
};

static const u16 sAnimalsOam_384264_Frame1[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xf3, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    0xf1, 0x1f5, OBJ_PALETTE_9 | 0x288,
    0xf9, 0x1f5, OBJ_PALETTE_9 | 0x289,
    0xf1, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x288,
    0xf9, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x289,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287
};

static const u16 sAnimalsOam_384264_Frame2[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xf4, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    0xf2, 0x1f5, OBJ_PALETTE_9 | 0x288,
    0xfa, 0x1f5, OBJ_PALETTE_9 | 0x2a9,
    0xf2, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x288,
    0xfa, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2a9,
    0xf1, 0x1f8, OBJ_PALETTE_9 | 0x287,
    0xf8, 0x1f8, OBJ_PALETTE_9 | 0x2a7,
    0xf1, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287,
    0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x2a7
};

static const u16 sAnimalsOam_38428c_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x283,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f9, OBJ_PALETTE_9 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1, OBJ_PALETTE_9 | 0x21e,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x28a
};

static const u16 sAnimalsOam_38471c_Frame1[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x283,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f9, OBJ_PALETTE_9 | 0x25d,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1, OBJ_PALETTE_9 | 0x25e,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x28a
};

static const u16 sAnimalsOam_38471c_Frame2[] = {
    4,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_9 | 0x283,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f9, OBJ_PALETTE_9 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1, OBJ_PALETTE_9 | 0x21e,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x28a
};

static const u16 sAnimalsOam_38429c_Frame0[] = {
    3,
    0xe7, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_9 | 0x285,
    0xef, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_9 | 0x28c,
    OBJ_SHAPE_VERTICAL | 0xef, 0x3, OBJ_PALETTE_9 | 0x28e
};

static const u16 sAnimalsOam_38429c_Frame1[] = {
    2,
    0xe9, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_9 | 0x285,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_9 | 0x28f
};

static const u16 sAnimalsOam_38429c_Frame2[] = {
    2,
    0xeb, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_9 | 0x285,
    0xf1, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_9 | 0x291
};

static const u16 sAnimalsOam_38429c_Frame3[] = {
    2,
    0xea, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_9 | 0x285,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_9 | 0x293
};

static const u16 sAnimalsOam_3842c4_Frame0[] = {
    2,
    0xec, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x283,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x295
};

static const u16 sAnimalsOam_3842d4_Frame6[] = {
    5,
    0xf0, 0x1f5, OBJ_PALETTE_9 | 0x2c3,
    0xf0, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c3,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x285,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287
};

static const u16 sAnimalsOam_3842d4_Frame5[] = {
    5,
    0xf0, 0x1f5, OBJ_PALETTE_9 | 0x2c3,
    0xf0, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c3,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x283,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287
};

static const u16 sAnimalsOam_3842d4_Frame0[] = {
    6,
    0xf0, 0x1f5, OBJ_PALETTE_9 | 0x2c3,
    0xf0, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c3,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xf3, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287
};

static const u16 sAnimalsOam_3842d4_Frame1[] = {
    5,
    0xf0, 0x1f5, OBJ_PALETTE_9 | 0x2c3,
    0xf0, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c3,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x283,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287
};

static const u16 sAnimalsOam_3842d4_Frame2[] = {
    5,
    0xf0, 0x1f5, OBJ_PALETTE_9 | 0x2c3,
    0xf0, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c3,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x285,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_9 | 0x287,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x287
};

static const u16 sAnimalsOam_38446c_Frame0[] = {
    6,
    0xb8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2c9,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1f8, OBJ_PALETTE_9 | 0x2cb,
    0xb0, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xa8, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xa0, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0x98, 0x0, OBJ_PALETTE_9 | 0x2e3
};

static const u16 sAnimalsOam_38447c_Frame1[] = {
    6,
    0xb9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2c9,
    OBJ_SHAPE_HORIZONTAL | 0xc9, 0x1f8, OBJ_PALETTE_9 | 0x2cb,
    0xb1, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xa9, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xa1, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0x99, 0x0, OBJ_PALETTE_9 | 0x2e3
};

static const u16 sAnimalsOam_3844bc_Frame0[] = {
    5,
    0xb0, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x2cd,
    OBJ_SHAPE_HORIZONTAL | 0xc0, 0x1fa, OBJ_PALETTE_9 | 0x2eb,
    0xa0, 0x0, OBJ_PALETTE_9 | 0x2e2,
    0x98, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_9 | 0x2e2,
    0xa8, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_9 | 0x2e2
};

static const u16 sAnimalsOam_3844bc_Frame1[] = {
    6,
    0xb4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2c9,
    OBJ_SHAPE_HORIZONTAL | 0xc4, 0x1f8, OBJ_PALETTE_9 | 0x2cb,
    0xac, 0x1, OBJ_PALETTE_9 | 0x2e2,
    0xa4, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_9 | 0x2e2,
    0x9c, 0x1, OBJ_PALETTE_9 | 0x2e2,
    0x94, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_9 | 0x2e2
};

static const u16 sAnimalsOam_3844bc_Frame2[] = {
    6,
    0xb8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_9 | 0x2cf,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1f6, OBJ_PALETTE_9 | 0x2d1,
    0xa0, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_9 | 0x2e2,
    0x98, 0x1, OBJ_PALETTE_9 | 0x2e2,
    0xa8, 0x1, OBJ_PALETTE_9 | 0x2e2,
    0xb0, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_9 | 0x2e2
};

static const u16 sAnimalsOam_3844bc_Frame3[] = {
    7,
    0xbf, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2cd,
    OBJ_SHAPE_HORIZONTAL | 0xcf, 0x1f8, OBJ_PALETTE_9 | 0x2eb,
    0xb8, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xb0, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xa8, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xa0, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0x98, 0x0, OBJ_PALETTE_9 | 0x2e3
};

static const u16 sAnimalsOam_3844bc_Frame4[] = {
    7,
    0xbb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2cf,
    OBJ_SHAPE_HORIZONTAL | 0xcb, 0x1f8, OBJ_PALETTE_9 | 0x2d1,
    0xb4, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xac, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0xa4, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0x9c, 0x0, OBJ_PALETTE_9 | 0x2e3,
    0x94, 0x0, OBJ_PALETTE_9 | 0x2e3
};

static const u16 sAnimalsOam_384374_Frame3[] = {
    6,
    0xd2, 0x1f8, OBJ_PALETTE_9 | 0x2c4,
    0xde, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c4,
    OBJ_SHAPE_HORIZONTAL | 0xd9, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xe1, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f8, OBJ_PALETTE_9 | 0x2f1,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2d3
};

static const u16 sAnimalsOam_384374_Frame4[] = {
    6,
    0xcc, 0x1f8, OBJ_PALETTE_9 | 0x2c4,
    0xcd, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c4,
    OBJ_SHAPE_HORIZONTAL | 0xd1, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xd9, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f8, OBJ_PALETTE_9 | 0x2f1,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2d3
};

static const u16 sAnimalsOam_3843cc_Frame0[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xcf, 0x1f9, OBJ_PALETTE_9 | 0x280,
    0xd7, 0x1fd, OBJ_PALETTE_9 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0xe1, 0x1f9, OBJ_PALETTE_9 | 0x2f5,
    OBJ_SHAPE_HORIZONTAL | 0xd3, 0x1f9, OBJ_PALETTE_9 | 0x2f1,
    OBJ_SHAPE_HORIZONTAL | 0xdb, 0x1f9, OBJ_PALETTE_9 | 0x2d5,
    OBJ_SHAPE_VERTICAL | 0xd5, OBJ_X_FLIP | 0x2, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0xc6, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x288
};

static const u16 sAnimalsOam_3843cc_Frame1[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1f9, OBJ_PALETTE_9 | 0x280,
    0xd8, 0x1fd, OBJ_PALETTE_9 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0xe3, 0x1f9, OBJ_PALETTE_9 | 0x2f5,
    OBJ_SHAPE_HORIZONTAL | 0xd4, 0x1f9, OBJ_PALETTE_9 | 0x2f1,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f9, OBJ_PALETTE_9 | 0x2d5,
    OBJ_SHAPE_VERTICAL | 0xd7, OBJ_X_FLIP | 0x2, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0xc6, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x288
};

static const u16 sAnimalsOam_3843cc_Frame2[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xd2, 0x1f9, OBJ_PALETTE_9 | 0x280,
    0xda, 0x1fd, OBJ_PALETTE_9 | 0x2a1,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, OBJ_PALETTE_9 | 0x2f5,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1f9, OBJ_PALETTE_9 | 0x2f1,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1f9, OBJ_PALETTE_9 | 0x2d5,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x2, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0xc7, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x288
};

static const u16 sAnimalsOam_38441c_Frame0[] = {
    6,
    0xcb, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_9 | 0x283,
    OBJ_SHAPE_HORIZONTAL | 0xe1, 0x1f9, OBJ_PALETTE_9 | 0x2f5,
    OBJ_SHAPE_HORIZONTAL | 0xd3, 0x1f9, OBJ_PALETTE_9 | 0x2f1,
    OBJ_SHAPE_HORIZONTAL | 0xdb, 0x1f9, OBJ_PALETTE_9 | 0x2d5,
    OBJ_SHAPE_VERTICAL | 0xd5, OBJ_X_FLIP | 0x2, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0xc6, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x288
};

static const u16 sAnimalsOam_38441c_Frame1[] = {
    6,
    0xcc, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x285,
    OBJ_SHAPE_HORIZONTAL | 0xe3, 0x1f9, OBJ_PALETTE_9 | 0x2f5,
    OBJ_SHAPE_HORIZONTAL | 0xd4, 0x1f9, OBJ_PALETTE_9 | 0x2f1,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f9, OBJ_PALETTE_9 | 0x2d5,
    OBJ_SHAPE_VERTICAL | 0xd7, OBJ_X_FLIP | 0x2, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0xc6, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x288
};

static const u16 sAnimalsOam_38441c_Frame2[] = {
    6,
    0xce, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_9 | 0x285,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, OBJ_PALETTE_9 | 0x2f5,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1f9, OBJ_PALETTE_9 | 0x2f1,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1f9, OBJ_PALETTE_9 | 0x2d5,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x2, OBJ_PALETTE_9 | 0x288,
    OBJ_SHAPE_VERTICAL | 0xc7, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_9 | 0x288
};

static const u16 sAnimalsOam_38431c_Frame5[] = {
    6,
    0xdc, 0x1f4, OBJ_PALETTE_9 | 0x2c2,
    0xdc, OBJ_X_FLIP | 0x4, OBJ_PALETTE_9 | 0x2c2,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xe5, 0x1fc, OBJ_PALETTE_9 | 0x2a1,
    0xe2, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2c5,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2c5
};

static const u16 sAnimalsOam_38431c_Frame4[] = {
    6,
    0xdc, 0x1f4, OBJ_PALETTE_9 | 0x2c3,
    0xdc, OBJ_X_FLIP | 0x4, OBJ_PALETTE_9 | 0x2c3,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xe4, 0x1fc, OBJ_PALETTE_9 | 0x2a2,
    0xe3, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x2c7,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x2c7
};

static const u16 sAnimalsOam_38431c_Frame3[] = {
    6,
    0xdb, 0x1f5, OBJ_PALETTE_9 | 0x2c4,
    0xdb, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c4,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xe6, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0xe4, 0x1f8, OBJ_PALETTE_9 | 0x2f1,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2d3
};

static const u16 sAnimalsOam_38431c_Frame2[] = {
    6,
    0xda, 0x1f5, OBJ_PALETTE_9 | 0x2c4,
    0xda, OBJ_X_FLIP | 0x3, OBJ_PALETTE_9 | 0x2c4,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xe6, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    OBJ_SHAPE_HORIZONTAL | 0xe4, 0x1f8, OBJ_PALETTE_9 | 0x2f1,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2d3
};

static const u16 sAnimalsOam_38431c_Frame1[] = {
    5,
    0xf5, 0x1f3, OBJ_PALETTE_9 | 0x282,
    0xf5, OBJ_X_FLIP | 0x5, OBJ_PALETTE_9 | 0x282,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xf7, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2c0
};

static const u16 sAnimalsOam_38431c_Frame0[] = {
    5,
    0xf6, 0x1f3, OBJ_PALETTE_9 | 0x282,
    0xf6, OBJ_X_FLIP | 0x5, OBJ_PALETTE_9 | 0x282,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f8, OBJ_PALETTE_9 | 0x280,
    0xf6, 0x1fc, OBJ_PALETTE_9 | 0x2a0,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x2c0
};

static const u16 sAnimalsOam_38450c_Frame0[] = {
    4,
    0xd6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247
};

static const u16 sAnimalsOam_3846cc_Frame1[] = {
    4,
    0xd7, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247
};

static const u16 sAnimalsOam_3846cc_Frame2[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe5, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x247,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_8 | 0x267
};

static const u16 sAnimalsOam_3845e4_Frame1[] = {
    4,
    0xd6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x240,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247
};

static const u16 sAnimalsOam_3845e4_Frame0[] = {
    4,
    0xd7, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x240,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247
};

static const u16 sAnimalsOam_3845c4_Frame0[] = {
    5,
    0xde, 0x1f4, OBJ_PALETTE_8 | 0x211,
    0xd6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247
};

static const u16 sAnimalsOam_3845c4_Frame1[] = {
    5,
    0xde, 0x1f4, OBJ_PALETTE_8 | 0x212,
    0xd6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247
};

static const u16 sAnimalsOam_384584_Frame0[] = {
    4,
    0xe6, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x202,
    0xeb, 0x1f0, OBJ_PALETTE_8 | 0x213,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207
};

static const u16 sAnimalsOam_384584_Frame1[] = {
    4,
    0xee, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x242,
    0xec, 0x1f0, OBJ_PALETTE_8 | 0x214,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207
};

static const u16 sAnimalsOam_384584_Frame2[] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x242,
    0xed, 0x1f0, OBJ_PALETTE_8 | 0x214,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207
};

static const u16 sAnimalsOam_384584_Frame3[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x242,
    0xee, 0x1f0, OBJ_PALETTE_8 | 0x214,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247,
    0xe5, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x207
};

static const u16 sAnimalsOam_38451c_Frame0[] = {
    6,
    0xd6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xfc, 0x1f2, OBJ_PALETTE_8 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xe4, 0x1fa, OBJ_PALETTE_8 | 0x205,
    0xec, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x229,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fa, OBJ_PALETTE_8 | 0x269
};

static const u16 sAnimalsOam_38451c_Frame1[] = {
    5,
    0xd7, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1fa, OBJ_PALETTE_8 | 0x205,
    0xed, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x22b,
    0xfd, 0x1fe, OBJ_PALETTE_8 | 0x26b
};

static const u16 sAnimalsOam_38451c_Frame2[] = {
    6,
    0xd5, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xeb, 0xa, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xe3, 0x1fa, OBJ_PALETTE_8 | 0x205,
    0xeb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x22d,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f2, OBJ_PALETTE_8 | 0x26d
};

static const u16 sAnimalsOam_38451c_Frame3[] = {
    6,
    0xd6, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xfc, 0x1f2, OBJ_PALETTE_8 | 0x265,
    OBJ_SHAPE_HORIZONTAL | 0xe4, 0x1fa, OBJ_PALETTE_8 | 0x205,
    0xec, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x22f,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fa, OBJ_PALETTE_8 | 0x26f
};

static const u16 sAnimalsOam_38451c_Frame4[] = {
    5,
    0xd7, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1fa, OBJ_PALETTE_8 | 0x205,
    0xed, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x231,
    0xfd, 0x1fe, OBJ_PALETTE_8 | 0x271
};

static const u16 sAnimalsOam_38451c_Frame5[] = {
    6,
    0xd5, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xeb, 0xa, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_HORIZONTAL | 0xe3, 0x1fa, OBJ_PALETTE_8 | 0x205,
    0xeb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f2, OBJ_PALETTE_8 | 0x273
};

static const u16 sAnimalsOam_384554_Frame0[] = {
    3,
    0xd6, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x255,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x4, OBJ_PALETTE_8 | 0x219
};

static const u16 sAnimalsOam_384554_Frame1[] = {
    3,
    0xd6, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x6, OBJ_PALETTE_8 | 0x21c
};

static const u16 sAnimalsOam_3845fc_Frame0[] = {
    4,
    0xd6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x255,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247
};

static const u16 sAnimalsOam_3845fc_Frame1[] = {
    4,
    0xd6, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x215,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f2, OBJ_PALETTE_8 | 0x204,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x247
};

static const u16 sAnimalsOam_38461c_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x20b,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x20d
};

static const u16 sAnimalsOam_38462c_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, OBJ_PALETTE_8 | 0x20b,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x20e
};

static const u16 sAnimalsOam_38462c_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x20b,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x20f
};

static const u16 sAnimalsOam_38462c_Frame3[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f8, OBJ_PALETTE_8 | 0x20b,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sAnimalsOam_384654_Frame0[] = {
    3,
    0xf5, 0x1f8, OBJ_PALETTE_8 | 0x209,
    0xf5, 0x0, OBJ_PALETTE_8 | 0x20c,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x20d
};

static const u16 sAnimalsOam_384654_Frame1[] = {
    3,
    0xf5, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf5, 0x0, OBJ_PALETTE_8 | 0x20c,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x20d
};

static const u16 sAnimalsOam_3846f4_Frame1[] = {
    3,
    0xf5, 0x1f9, OBJ_PALETTE_8 | 0x20b,
    0xf6, 0x0, OBJ_PALETTE_8 | 0x20c,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x20d
};

static const u16 sAnimalsOam_3846f4_Frame2[] = {
    3,
    0xf6, 0x1f9, OBJ_PALETTE_8 | 0x20b,
    0xf7, 0x0, OBJ_PALETTE_8 | 0x20c,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x20d
};

static const u16 sAnimalsOam_384674_Frame0[] = {
    2,
    0xc4, 0x8, OBJ_PALETTE_10 | 0x29b,
    0xe7, 0x10, OBJ_PALETTE_10 | 0x29c
};

static const u16 sAnimalsOam_384744_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_10 | 0x2e4
};

static const u16 sAnimalsOam_384684_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x1f0, OBJ_PALETTE_10 | 0x29f,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f0, OBJ_PALETTE_10 | 0x29e,
    0xd0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_10 | 0x297,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_10 | 0x2db
};

static const u16 sAnimalsOam_384694_Frame0[] = {
    8,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f0, OBJ_PALETTE_10 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f0, OBJ_PALETTE_10 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xd0, 0x1f0, OBJ_PALETTE_10 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x1ee, OBJ_PALETTE_10 | 0x29f,
    0xf0, 0x1ee, OBJ_PALETTE_10 | 0x2bb,
    0xf8, 0x1ee, OBJ_PALETTE_10 | 0x2be,
    0xd0, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_10 | 0x297,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_10 | 0x2db
};

static const u16 sAnimalsOam_384694_Frame1[] = {
    7,
    0xea, 0x1f0, OBJ_PALETTE_10 | 0x2bd,
    0xe3, 0x1f0, OBJ_PALETTE_10 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x1ec, OBJ_PALETTE_10 | 0x29f,
    0xf0, 0x1ec, OBJ_PALETTE_10 | 0x2bb,
    0xf8, 0x1ec, OBJ_PALETTE_10 | 0x2be,
    0xd0, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_10 | 0x297,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_10 | 0x2db
};

static const u16 sAnimalsOam_384694_Frame2[] = {
    7,
    0xe8, 0x1f0, OBJ_PALETTE_10 | 0x2bd,
    0xe5, 0x1f0, OBJ_PALETTE_10 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x1ea, OBJ_PALETTE_10 | 0x29f,
    0xf0, 0x1ea, OBJ_PALETTE_10 | 0x2bb,
    0xf8, 0x1ea, OBJ_PALETTE_10 | 0x2be,
    0xd0, OBJ_SIZE_32x32 | 0x8, OBJ_PALETTE_10 | 0x297,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x8, OBJ_PALETTE_10 | 0x2db
};

static const u16 sAnimalsOam_384694_Frame3[] = {
    7,
    0xea, 0x1f0, OBJ_PALETTE_10 | 0x2bd,
    0xe3, 0x1f0, OBJ_PALETTE_10 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x1ec, OBJ_PALETTE_10 | 0x29f,
    0xf0, 0x1ec, OBJ_PALETTE_10 | 0x2bb,
    0xf8, 0x1ec, OBJ_PALETTE_10 | 0x2be,
    0xd0, OBJ_SIZE_32x32 | 0x7, OBJ_PALETTE_10 | 0x297,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x7, OBJ_PALETTE_10 | 0x2db
};

static const u16 sAnimalsOam_384694_Frame4[] = {
    7,
    0xe9, 0x1f0, OBJ_PALETTE_10 | 0x2bd,
    0xe4, 0x1f0, OBJ_PALETTE_10 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x1eb, OBJ_PALETTE_10 | 0x29f,
    0xf0, 0x1eb, OBJ_PALETTE_10 | 0x2bb,
    0xf8, 0x1eb, OBJ_PALETTE_10 | 0x2be,
    0xd0, OBJ_SIZE_32x32 | 0x9, OBJ_PALETTE_10 | 0x297,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x9, OBJ_PALETTE_10 | 0x2db
};

static const u16 sAnimalsOam_384694_Frame5[] = {
    7,
    0xe8, 0x1f0, OBJ_PALETTE_10 | 0x2bd,
    0xe5, 0x1f0, OBJ_PALETTE_10 | 0x29d,
    OBJ_SHAPE_VERTICAL | 0xd0, OBJ_SIZE_8x32 | 0x1ea, OBJ_PALETTE_10 | 0x29f,
    0xf0, 0x1ea, OBJ_PALETTE_10 | 0x2bb,
    0xf8, 0x1ea, OBJ_PALETTE_10 | 0x2be,
    0xd0, OBJ_SIZE_32x32 | 0xb, OBJ_PALETTE_10 | 0x297,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0xb, OBJ_PALETTE_10 | 0x2db
};

const struct FrameData sAnimalsOam_384254[2] = {
    [0] = {
        .pFrame = sAnimalsOam_384254_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384264[5] = {
    [0] = {
        .pFrame = sAnimalsOam_384254_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sAnimalsOam_384264_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sAnimalsOam_384264_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sAnimalsOam_384264_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38428c[2] = {
    [0] = {
        .pFrame = sAnimalsOam_38428c_Frame0,
        .timer = 8
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38429c[5] = {
    [0] = {
        .pFrame = sAnimalsOam_38429c_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sAnimalsOam_38429c_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sAnimalsOam_38429c_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sAnimalsOam_38429c_Frame3,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3842c4[2] = {
    [0] = {
        .pFrame = sAnimalsOam_3842c4_Frame0,
        .timer = 6
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3842d4[9] = {
    [0] = {
        .pFrame = sAnimalsOam_3842d4_Frame0,
        .timer = 40
    },
    [1] = {
        .pFrame = sAnimalsOam_3842d4_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sAnimalsOam_3842d4_Frame2,
        .timer = 40
    },
    [3] = {
        .pFrame = sAnimalsOam_3842d4_Frame1,
        .timer = 8
    },
    [4] = {
        .pFrame = sAnimalsOam_3842d4_Frame0,
        .timer = 4
    },
    [5] = {
        .pFrame = sAnimalsOam_3842d4_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sAnimalsOam_3842d4_Frame6,
        .timer = 40
    },
    [7] = {
        .pFrame = sAnimalsOam_3842d4_Frame5,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38431c[11] = {
    [0] = {
        .pFrame = sAnimalsOam_38431c_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sAnimalsOam_38431c_Frame1,
        .timer = 20
    },
    [2] = {
        .pFrame = sAnimalsOam_38431c_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sAnimalsOam_38431c_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sAnimalsOam_38431c_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sAnimalsOam_38431c_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sAnimalsOam_38431c_Frame4,
        .timer = 8
    },
    [7] = {
        .pFrame = sAnimalsOam_38431c_Frame2,
        .timer = 6
    },
    [8] = {
        .pFrame = sAnimalsOam_38431c_Frame1,
        .timer = 6
    },
    [9] = {
        .pFrame = sAnimalsOam_38431c_Frame0,
        .timer = 6
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384374[11] = {
    [0] = {
        .pFrame = sAnimalsOam_38431c_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sAnimalsOam_38431c_Frame1,
        .timer = 20
    },
    [2] = {
        .pFrame = sAnimalsOam_38431c_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sAnimalsOam_384374_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sAnimalsOam_384374_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sAnimalsOam_384374_Frame3,
        .timer = 4
    },
    [6] = {
        .pFrame = sAnimalsOam_38431c_Frame4,
        .timer = 6
    },
    [7] = {
        .pFrame = sAnimalsOam_38431c_Frame2,
        .timer = 3
    },
    [8] = {
        .pFrame = sAnimalsOam_38431c_Frame1,
        .timer = 6
    },
    [9] = {
        .pFrame = sAnimalsOam_38431c_Frame0,
        .timer = 40
    },
    [10] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3843cc[5] = {
    [0] = {
        .pFrame = sAnimalsOam_3843cc_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sAnimalsOam_3843cc_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sAnimalsOam_3843cc_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sAnimalsOam_3843cc_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3843f4[5] = {
    [0] = {
        .pFrame = sAnimalsOam_3843cc_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sAnimalsOam_3843cc_Frame1,
        .timer = 14
    },
    [2] = {
        .pFrame = sAnimalsOam_3843cc_Frame2,
        .timer = 14
    },
    [3] = {
        .pFrame = sAnimalsOam_3843cc_Frame1,
        .timer = 14
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38441c[5] = {
    [0] = {
        .pFrame = sAnimalsOam_38441c_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sAnimalsOam_38441c_Frame1,
        .timer = 14
    },
    [2] = {
        .pFrame = sAnimalsOam_38441c_Frame2,
        .timer = 14
    },
    [3] = {
        .pFrame = sAnimalsOam_38441c_Frame1,
        .timer = 14
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384444[5] = {
    [0] = {
        .pFrame = sAnimalsOam_38431c_Frame4,
        .timer = 9
    },
    [1] = {
        .pFrame = sAnimalsOam_38431c_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sAnimalsOam_38431c_Frame1,
        .timer = 6
    },
    [3] = {
        .pFrame = sAnimalsOam_38431c_Frame0,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38446c[2] = {
    [0] = {
        .pFrame = sAnimalsOam_38446c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38447c[4] = {
    [0] = {
        .pFrame = sAnimalsOam_38446c_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sAnimalsOam_38447c_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sAnimalsOam_38446c_Frame0,
        .timer = 16
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38449c[4] = {
    [0] = {
        .pFrame = sAnimalsOam_38446c_Frame0,
        .timer = 28
    },
    [1] = {
        .pFrame = sAnimalsOam_38447c_Frame1,
        .timer = 14
    },
    [2] = {
        .pFrame = sAnimalsOam_38446c_Frame0,
        .timer = 14
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3844bc[10] = {
    [0] = {
        .pFrame = sAnimalsOam_3844bc_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sAnimalsOam_3844bc_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sAnimalsOam_3844bc_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sAnimalsOam_3844bc_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sAnimalsOam_3844bc_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sAnimalsOam_38446c_Frame0,
        .timer = 8
    },
    [6] = {
        .pFrame = sAnimalsOam_38447c_Frame1,
        .timer = 10
    },
    [7] = {
        .pFrame = sAnimalsOam_38446c_Frame0,
        .timer = 12
    },
    [8] = {
        .pFrame = sAnimalsOam_38447c_Frame1,
        .timer = 16
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38450c[2] = {
    [0] = {
        .pFrame = sAnimalsOam_38450c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38451c[7] = {
    [0] = {
        .pFrame = sAnimalsOam_38451c_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sAnimalsOam_38451c_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sAnimalsOam_38451c_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sAnimalsOam_38451c_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sAnimalsOam_38451c_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sAnimalsOam_38451c_Frame5,
        .timer = 5
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384554[3] = {
    [0] = {
        .pFrame = sAnimalsOam_384554_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sAnimalsOam_384554_Frame1,
        .timer = 5
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38456c[3] = {
    [0] = {
        .pFrame = sAnimalsOam_384554_Frame1,
        .timer = 5
    },
    [1] = {
        .pFrame = sAnimalsOam_384554_Frame0,
        .timer = 5
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384584[8] = {
    [0] = {
        .pFrame = sAnimalsOam_384584_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sAnimalsOam_384584_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sAnimalsOam_384584_Frame2,
        .timer = 7
    },
    [3] = {
        .pFrame = sAnimalsOam_384584_Frame3,
        .timer = 7
    },
    [4] = {
        .pFrame = sAnimalsOam_384584_Frame2,
        .timer = 7
    },
    [5] = {
        .pFrame = sAnimalsOam_384584_Frame1,
        .timer = 7
    },
    [6] = {
        .pFrame = sAnimalsOam_384584_Frame0,
        .timer = 10
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3845c4[4] = {
    [0] = {
        .pFrame = sAnimalsOam_3845c4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sAnimalsOam_3845c4_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sAnimalsOam_3845c4_Frame0,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3845e4[3] = {
    [0] = {
        .pFrame = sAnimalsOam_3845e4_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sAnimalsOam_3845e4_Frame1,
        .timer = 8
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3845fc[4] = {
    [0] = {
        .pFrame = sAnimalsOam_3845fc_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sAnimalsOam_3845fc_Frame1,
        .timer = 30
    },
    [2] = {
        .pFrame = sAnimalsOam_3845fc_Frame0,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38461c[2] = {
    [0] = {
        .pFrame = sAnimalsOam_38461c_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38462c[5] = {
    [0] = {
        .pFrame = sAnimalsOam_38461c_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sAnimalsOam_38462c_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sAnimalsOam_38462c_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sAnimalsOam_38462c_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384654[4] = {
    [0] = {
        .pFrame = sAnimalsOam_384654_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sAnimalsOam_384654_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sAnimalsOam_384654_Frame0,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384674[2] = {
    [0] = {
        .pFrame = sAnimalsOam_384674_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384684[2] = {
    [0] = {
        .pFrame = sAnimalsOam_384684_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384694[7] = {
    [0] = {
        .pFrame = sAnimalsOam_384694_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sAnimalsOam_384694_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sAnimalsOam_384694_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sAnimalsOam_384694_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sAnimalsOam_384694_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sAnimalsOam_384694_Frame5,
        .timer = 8
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3846cc[5] = {
    [0] = {
        .pFrame = sAnimalsOam_38450c_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sAnimalsOam_3846cc_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sAnimalsOam_3846cc_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sAnimalsOam_3846cc_Frame1,
        .timer = 20
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_3846f4[5] = {
    [0] = {
        .pFrame = sAnimalsOam_38461c_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sAnimalsOam_3846f4_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sAnimalsOam_3846f4_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sAnimalsOam_3846f4_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_38471c[5] = {
    [0] = {
        .pFrame = sAnimalsOam_38428c_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sAnimalsOam_38471c_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sAnimalsOam_38471c_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sAnimalsOam_38471c_Frame1,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sAnimalsOam_384744[3] = {
    [0] = {
        .pFrame = sAnimalsOam_384674_Frame0,
        .timer = 32
    },
    [1] = {
        .pFrame = sAnimalsOam_384744_Frame1,
        .timer = 32
    },
    [2] = FRAME_DATA_TERMINATOR
};
