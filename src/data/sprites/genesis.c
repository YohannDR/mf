#include "data/sprites/genesis.h"

const u32 sGenesisGfx[512 * 2] = INCBIN_U32("data/sprites/genesis.gfx");
const u16 sGenesisPal[16 * 2] = INCBIN_U16("data/sprites/genesis.pal");

static const u16 sGenesisOam_37c360_Frame0[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20f,
    0xf8, 0xf, OBJ_PALETTE_8 | 0x231,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e2, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ee, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x240
};

static const u16 sGenesisOam_37c360_Frame1[] = {
    7,
    0xeb, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x212,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1, OBJ_PALETTE_8 | 0x242
};

static const u16 sGenesisOam_37c360_Frame2[] = {
    8,
    0xe9, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x214,
    0xe9, 0x6, OBJ_PALETTE_8 | 0x216,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x240,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x21c,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x243
};

static const u16 sGenesisOam_37c360_Frame3[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e8, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f4, OBJ_PALETTE_8 | 0x217,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x243,
    0xef, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf6, 0xb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x242
};

static const u16 sGenesisOam_37c360_Frame4[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x9, OBJ_PALETTE_8 | 0x242,
    0xef, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf5, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x240,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x212
};

static const u16 sGenesisOam_37c360_Frame5[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x21c,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    0xed, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x243,
    0xef, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf6, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xec, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f9, OBJ_PALETTE_8 | 0x216
};

static const u16 sGenesisOam_37c3d0_Frame2[] = {
    9,
    0xf1, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x20f,
    0xf9, 0xe, OBJ_PALETTE_8 | 0x231,
    0xf1, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21e,
    0xeb, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xec, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf5, 0xb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1e3, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1ef, OBJ_PALETTE_8 | 0x217,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x240
};

static const u16 sGenesisOam_37c3d0_Frame1[] = {
    9,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20f,
    0xf8, 0x10, OBJ_PALETTE_8 | 0x231,
    0xf0, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x21e,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf9, 0xb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e1, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ed, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240
};

static const u16 sGenesisOam_37c3d0_Frame0[] = {
    9,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20f,
    0xf8, 0xf, OBJ_PALETTE_8 | 0x231,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21e,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xef, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf8, 0xb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e2, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ee, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x240
};

static const u16 sGenesisOam_37c3f0_Frame0[] = {
    5,
    0xf6, 0x1e4, OBJ_PALETTE_8 | 0x24d,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x245,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x249,
    0x0, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x14, OBJ_PALETTE_8 | 0x26d
};

static const u16 sGenesisOam_37c3f0_Frame1[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1f5, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x15, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xc, OBJ_SIZE_32x8 | 0x1f5, OBJ_PALETTE_8 | 0x255,
    0xa, 0x1ed, OBJ_PALETTE_8 | 0x275,
    0xec, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x24e
};

static const u16 sGenesisOam_37c3f0_Frame2[] = {
    5,
    0x2, OBJ_Y_FLIP | 0x1e4, OBJ_PALETTE_8 | 0x24d,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x245,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x249,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x24b,
    0xf8, OBJ_Y_FLIP | 0x14, OBJ_PALETTE_8 | 0x26d
};

static const u16 sOam_37be20[] = {
    9,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20f,
    0x0, OBJ_Y_FLIP | 0x10, OBJ_PALETTE_8 | 0x231,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x21e,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xff, OBJ_Y_FLIP | 0xb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x1e1, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1ed, OBJ_PALETTE_8 | 0x217,
    0x0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240
};

static const u16 sGenesisOam_37c488_Frame0[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x21c,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x208,
    0xed, 0x1fb, OBJ_PALETTE_8 | 0x20c,
    0xed, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x243,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x21e
};

static const u16 sGenesisOam_37c450_Frame0[] = {
    7,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c
};

static const u16 sGenesisOam_37c498_Frame1[] = {
    8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xef, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fb, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fb, OBJ_PALETTE_8 | 0x20d,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c
};

static const u16 sGenesisOam_37c498_Frame2[] = {
    8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xee, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fb, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fb, OBJ_PALETTE_8 | 0x22d,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c
};

static const u16 sGenesisOam_37c498_Frame4[] = {
    8,
    0xf7, 0x1f6, OBJ_PALETTE_8 | 0x276,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xef, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c
};

static const u16 sGenesisOam_37c498_Frame5[] = {
    8,
    0xf8, 0x1f6, OBJ_PALETTE_8 | 0x277,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c
};

static const u16 sGenesisOam_37c498_Frame6[] = {
    9,
    0xf8, 0x1f6, OBJ_PALETTE_8 | 0x278,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x21a,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21e,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf8, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x21c,
    0xef, 0x1f5, OBJ_PALETTE_8 | 0x21b
};

static const u16 sGenesisOam_37c498_Frame7[] = {
    9,
    0xf8, 0x1f6, OBJ_PALETTE_8 | 0x259,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21e,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xef, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf8, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x21c,
    0xef, 0x1f4, OBJ_PALETTE_8 | 0x21b
};

static const u16 sGenesisOam_37c498_Frame8[] = {
    9,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x259,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x21e,
    0xf3, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf9, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x21c,
    0xef, 0x1f3, OBJ_PALETTE_8 | 0x21b
};

static const u16 sGenesisOam_37c498_Frame9[] = {
    9,
    0xfc, 0x1f3, OBJ_PALETTE_8 | 0x279,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x21e,
    0xf3, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf9, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x21c,
    0xef, 0x1f3, OBJ_PALETTE_8 | 0x21b
};

static const u16 sGenesisOam_37c498_Frame10[] = {
    9,
    0xfd, 0x1f2, OBJ_PALETTE_8 | 0x279,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x21e,
    0xf2, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf9, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x21c,
    0xef, 0x1f3, OBJ_PALETTE_8 | 0x21b
};

static const u16 sGenesisOam_37c498_Frame11[] = {
    9,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x1f1, OBJ_PALETTE_8 | 0x25a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21e,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    0xef, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf8, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x21c,
    0xef, 0x1f4, OBJ_PALETTE_8 | 0x21b
};

static const u16 sGenesisOam_37c498_Frame12[] = {
    9,
    OBJ_SHAPE_VERTICAL | 0x1, 0x1f1, OBJ_PALETTE_8 | 0x25b,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21e,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf8, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x21c,
    0xef, 0x1f5, OBJ_PALETTE_8 | 0x21b
};

static const u16 sGenesisOam_37c498_Frame13[] = {
    8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0x5, 0x1f1, OBJ_PALETTE_8 | 0x25c
};

static const u16 sGenesisOam_37c498_Frame14[] = {
    9,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c,
    0x9, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x259,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1f2, OBJ_PALETTE_8 | 0x25c
};

static const u16 sGenesisOam_37c498_Frame15[] = {
    9,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c,
    0xa, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x259,
    OBJ_SHAPE_VERTICAL | 0xc, 0x1f4, OBJ_PALETTE_8 | 0x25c
};

static const u16 sGenesisOam_37c498_Frame16[] = {
    9,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c,
    0xa, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x259,
    OBJ_SHAPE_VERTICAL | 0xc, 0x1f5, OBJ_PALETTE_8 | 0x25c
};

static const u16 sGenesisOam_37c498_Frame17[] = {
    9,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c,
    0xb, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x259,
    OBJ_SHAPE_VERTICAL | 0xe, 0x1f6, OBJ_PALETTE_8 | 0x25c
};

static const u16 sGenesisOam_37c498_Frame18[] = {
    8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c,
    0xc, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x278
};

static const u16 sGenesisOam_37c498_Frame19[] = {
    8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c,
    0xc, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x277
};

static const u16 sGenesisOam_37c498_Frame20[] = {
    8,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xed, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c,
    0xc, 0x1f7, OBJ_PALETTE_8 | 0x276
};

static const u16 sGenesisOam_37c548_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x25d
};

static const u16 sGenesisOam_37c558_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x25e
};

static const u16 sGenesisOam_37c558_Frame1[] = {
    3,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x25f,
    0xf9, 0x1f9, OBJ_PALETTE_8 | 0x27e,
    0xfe, 0x0, OBJ_PALETTE_8 | 0x27e
};

static const u16 sGenesisOam_37c558_Frame2[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x27e
};

static const u16 sGenesisOam_37c450_Frame1[] = {
    7,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xf1, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf8, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c
};

static const u16 sGenesisOam_37c450_Frame2[] = {
    7,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21e,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf8, 0xb, OBJ_PALETTE_8 | 0x22c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x21c
};

static const u16 sGenesisOam_37c478_Frame0[] = {
    9,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x20f,
    0xf8, 0xd, OBJ_PALETTE_8 | 0x231,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x21e,
    0xee, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xf7, 0xb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e6, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f2, OBJ_PALETTE_8 | 0x217,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x240
};

const struct FrameData sGenesisOam_37c360[7] = {
    [0] = {
        .pFrame = sGenesisOam_37c360_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sGenesisOam_37c360_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sGenesisOam_37c360_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sGenesisOam_37c360_Frame3,
        .timer = 7
    },
    [4] = {
        .pFrame = sGenesisOam_37c360_Frame4,
        .timer = 7
    },
    [5] = {
        .pFrame = sGenesisOam_37c360_Frame5,
        .timer = 7
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c398[7] = {
    [0] = {
        .pFrame = sGenesisOam_37c360_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sGenesisOam_37c360_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sGenesisOam_37c360_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sGenesisOam_37c360_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sGenesisOam_37c360_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sGenesisOam_37c360_Frame5,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c3d0[4] = {
    [0] = {
        .pFrame = sGenesisOam_37c3d0_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sGenesisOam_37c3d0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sGenesisOam_37c3d0_Frame2,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c3f0[4] = {
    [0] = {
        .pFrame = sGenesisOam_37c3f0_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sGenesisOam_37c3f0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sGenesisOam_37c3f0_Frame2,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c410[4] = {
    [0] = {
        .pFrame = sGenesisOam_37c3f0_Frame2,
        .timer = 6
    },
    [1] = {
        .pFrame = sGenesisOam_37c3f0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sGenesisOam_37c3f0_Frame0,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c430[4] = {
    [0] = {
        .pFrame = sGenesisOam_37c3d0_Frame2,
        .timer = 6
    },
    [1] = {
        .pFrame = sGenesisOam_37c3d0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sGenesisOam_37c3d0_Frame0,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c450[5] = {
    [0] = {
        .pFrame = sGenesisOam_37c450_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sGenesisOam_37c450_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sGenesisOam_37c450_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sGenesisOam_37c450_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c478[2] = {
    [0] = {
        .pFrame = sGenesisOam_37c478_Frame0,
        .timer = 10
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c488[2] = {
    [0] = {
        .pFrame = sGenesisOam_37c488_Frame0,
        .timer = 8
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c498[22] = {
    [0] = {
        .pFrame = sGenesisOam_37c450_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sGenesisOam_37c498_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sGenesisOam_37c498_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sGenesisOam_37c498_Frame1,
        .timer = 4
    },
    [4] = {
        .pFrame = sGenesisOam_37c498_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sGenesisOam_37c498_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sGenesisOam_37c498_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sGenesisOam_37c498_Frame7,
        .timer = 4
    },
    [8] = {
        .pFrame = sGenesisOam_37c498_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sGenesisOam_37c498_Frame9,
        .timer = 8
    },
    [10] = {
        .pFrame = sGenesisOam_37c498_Frame10,
        .timer = 8
    },
    [11] = {
        .pFrame = sGenesisOam_37c498_Frame11,
        .timer = 6
    },
    [12] = {
        .pFrame = sGenesisOam_37c498_Frame12,
        .timer = 6
    },
    [13] = {
        .pFrame = sGenesisOam_37c498_Frame13,
        .timer = 6
    },
    [14] = {
        .pFrame = sGenesisOam_37c498_Frame14,
        .timer = 6
    },
    [15] = {
        .pFrame = sGenesisOam_37c498_Frame15,
        .timer = 6
    },
    [16] = {
        .pFrame = sGenesisOam_37c498_Frame16,
        .timer = 6
    },
    [17] = {
        .pFrame = sGenesisOam_37c498_Frame17,
        .timer = 6
    },
    [18] = {
        .pFrame = sGenesisOam_37c498_Frame18,
        .timer = 6
    },
    [19] = {
        .pFrame = sGenesisOam_37c498_Frame19,
        .timer = 6
    },
    [20] = {
        .pFrame = sGenesisOam_37c498_Frame20,
        .timer = 6
    },
    [21] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c548[2] = {
    [0] = {
        .pFrame = sGenesisOam_37c548_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGenesisOam_37c558[4] = {
    [0] = {
        .pFrame = sGenesisOam_37c558_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sGenesisOam_37c558_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sGenesisOam_37c558_Frame2,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_37c578_39aa34[] = INCBIN_U8("data/Blob_37c578_39aa34.bin");
