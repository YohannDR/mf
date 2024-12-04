#include "data/sprites/zebesian_aqua.h"

const u32 sZebesianAquaGfx[2 * 512] = INCBIN_U32("data/sprites/zebesian_aqua.gfx");
const u16 sZebesianAquaPal[2 * 16] = INCBIN_U16("data/sprites/zebesian_aqua.pal");

static const u16 sZebesianAquaOam_38172c_Frame0[] = {
    13,
    0xf6, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1f4, OBJ_PALETTE_8 | 0x219,
    0xde, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f7, OBJ_PALETTE_8 | 0x204,
    0xfc, 0x4, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x207,
    0xef, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x21a,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf2, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f0, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_38172c_Frame1[] = {
    13,
    0xf4, OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1f9, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1fa, OBJ_PALETTE_8 | 0x204,
    0xfd, 0x4, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x209,
    0xef, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21a,
    0xde, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xe2, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xdf, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf0, OBJ_SIZE_16x16 | 0x1e5, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f5, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_38172c_Frame2[] = {
    13,
    0xf3, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1fc, OBJ_PALETTE_8 | 0x219,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x205,
    0xfd, 0x4, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21c,
    0xde, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x240,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xee, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_38172c_Frame3[] = {
    13,
    0xf6, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1fd, OBJ_PALETTE_8 | 0x219,
    0xea, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x205,
    0xf1, OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x21e,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xdf, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf1, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1fa, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_38172c_Frame4[] = {
    13,
    0xf7, OBJ_SIZE_16x16 | 0x1e6, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f6, OBJ_PALETTE_8 | 0x219,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x21e,
    0xe0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x20f,
    0xdd, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fd, OBJ_PALETTE_8 | 0x270,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf2, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f1, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_38172c_Frame5[] = {
    13,
    0xf6, OBJ_SIZE_16x16 | 0x1dd, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1ed, OBJ_PALETTE_8 | 0x219,
    0xef, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21c,
    0xeb, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x202,
    0xfc, 0x6, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x211,
    0xdf, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x240,
    0xdd, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fd, OBJ_PALETTE_8 | 0x270,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf3, OBJ_SIZE_16x16 | 0x1dc, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1ec, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_381764_Frame0[] = {
    13,
    0xf6, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1f4, OBJ_PALETTE_8 | 0x219,
    0xde, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f7, OBJ_PALETTE_8 | 0x204,
    0xfc, 0x4, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x207,
    0xef, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x21a,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf2, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f0, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_381764_Frame1[] = {
    13,
    0xf6, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1f4, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f7, OBJ_PALETTE_8 | 0x204,
    0xfd, 0x4, OBJ_PALETTE_8 | 0x213,
    0xde, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x209,
    0xef, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21a,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf2, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f0, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_381764_Frame2[] = {
    13,
    0xf6, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1f4, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f7, OBJ_PALETTE_8 | 0x204,
    0xfd, 0x4, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21c,
    0xde, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x240,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf2, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f0, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_381764_Frame3[] = {
    13,
    0xf7, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f4, OBJ_PALETTE_8 | 0x219,
    0xdf, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f6, OBJ_PALETTE_8 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x21e,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf3, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1f0, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_381764_Frame4[] = {
    14,
    0xf8, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f3, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f6, OBJ_PALETTE_8 | 0x204,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x21e,
    0xdf, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x20f,
    0xdd, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fd, OBJ_PALETTE_8 | 0x270,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xea, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x202,
    0xf4, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1ef, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_381764_Frame5[] = {
    13,
    0xf7, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f4, OBJ_PALETTE_8 | 0x219,
    0xdf, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f6, OBJ_PALETTE_8 | 0x204,
    0xef, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21c,
    0xfc, 0x6, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x211,
    0xdd, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fd, OBJ_PALETTE_8 | 0x270,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf3, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1f0, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_380efe[] = {
    13,
    0xf1, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1fa, OBJ_PALETTE_8 | 0x219,
    0xfd, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xde, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1ef, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_38179c_Frame0[] = {
    12,
    0xfc, 0x4, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21e,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x248,
    0xdf, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x244,
    0xd7, 0x1f5, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1fd, OBJ_PALETTE_8 | 0x204,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f7, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ef, OBJ_PALETTE_8 | 0x214,
    0xe2, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fc, OBJ_PALETTE_8 | 0x252,
    0xf1, OBJ_SIZE_16x16 | 0x1e5, OBJ_PALETTE_8 | 0x246
};

static const u16 sZebesianAquaOam_38179c_Frame1[] = {
    10,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x248,
    0xdf, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x242,
    0xd7, 0x1fb, OBJ_PALETTE_8 | 0x257,
    0xe5, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f4, OBJ_PALETTE_8 | 0x204,
    0xef, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1f0, OBJ_PALETTE_8 | 0x214,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_8 | 0x246
};

static const u16 sZebesianAquaOam_38179c_Frame2[] = {
    10,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x248,
    0xdf, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x242,
    0xd7, 0x1fb, OBJ_PALETTE_8 | 0x257,
    0xe5, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f4, OBJ_PALETTE_8 | 0x204,
    0xef, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1f0, OBJ_PALETTE_8 | 0x214,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x21a,
    0xf0, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_8 | 0x246
};

static const u16 sZebesianAquaOam_381014[] = {
    12,
    0xfc, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x21e,
    0xf2, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x248,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x244,
    0xd7, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_VERTICAL | 0xe7, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1f9, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x214,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x252,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x246
};

static const u16 sZebesianAquaOam_38105e[] = {
    13,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x219,
    0xfd, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1ff, OBJ_PALETTE_8 | 0x204,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x20d,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1fa, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, OBJ_X_FLIP | 0xa, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_3817c4_Frame0[] = {
    13,
    0xf1, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1fa, OBJ_PALETTE_8 | 0x219,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xde, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1ef, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_3817c4_Frame1[] = {
    13,
    0xf3, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1fc, OBJ_PALETTE_8 | 0x219,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x204,
    0xdf, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xec, OBJ_SIZE_16x16 | 0x1dd, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1ed, OBJ_PALETTE_8 | 0x25d
};

static const u16 sZebesianAquaOam_3817c4_Frame2[] = {
    14,
    0xef, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, OBJ_PALETTE_8 | 0x25d,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe5, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x202,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xea, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1ea, OBJ_PALETTE_8 | 0x25d
};

static const u16 sZebesianAquaOam_3817c4_Frame3[] = {
    14,
    0xee, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fb, OBJ_PALETTE_8 | 0x25d,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe5, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x202,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xe9, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1ea, OBJ_PALETTE_8 | 0x25d
};

static const u16 sZebesianAquaOam_3817c4_Frame4[] = {
    16,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    0xe9, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x259,
    0xe9, 0x1ec, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f1, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe4, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x202,
    0xe4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x259,
    0xe4, 0x1d8, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1dd, OBJ_PALETTE_8 | 0x277,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214
};

static const u16 sZebesianAquaOam_3817c4_Frame5[] = {
    18,
    0xfd, 0x4, OBJ_PALETTE_8 | 0x213,
    0xf1, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21c,
    0xe9, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x259,
    0xe9, 0x1ec, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f1, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f2, OBJ_PALETTE_9 | 0x254,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf1, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x20d,
    0xe4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x259,
    0xe4, 0x1d8, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1dd, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1de, OBJ_PALETTE_9 | 0x254,
    0xe4, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x202,
    0xde, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1fc, OBJ_PALETTE_8 | 0x270,
    OBJ_SHAPE_VERTICAL | 0xdf, OBJ_SIZE_16x32 | 0x1f5, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1ed, OBJ_PALETTE_8 | 0x214
};

static const u16 sZebesianAquaOam_3817c4_Frame6[] = {
    17,
    0xfd, 0x4, OBJ_PALETTE_8 | 0x213,
    0xf1, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x21c,
    0xe9, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x259,
    0xe9, 0x1ec, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f1, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1ef, OBJ_PALETTE_9 | 0x25e,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf1, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x20d,
    0xe4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x259,
    0xe4, 0x1d8, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1dd, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1db, OBJ_PALETTE_9 | 0x25e,
    0xde, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1fc, OBJ_PALETTE_8 | 0x270,
    OBJ_SHAPE_VERTICAL | 0xdf, OBJ_SIZE_16x32 | 0x1f5, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x1ed, OBJ_PALETTE_8 | 0x214
};

static const u16 sZebesianAquaOam_3817c4_Frame7[] = {
    19,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_Y_FLIP | 0x1ef, OBJ_PALETTE_9 | 0x25f,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1ef, OBJ_PALETTE_9 | 0x25f,
    0xe9, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x259,
    0xe9, 0x1ec, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f1, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xdf, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_Y_FLIP | 0x1db, OBJ_PALETTE_9 | 0x25f,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1db, OBJ_PALETTE_9 | 0x25f,
    0xe4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x259,
    0xe4, 0x1d8, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1dd, OBJ_PALETTE_8 | 0x277,
    0xdd, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fd, OBJ_PALETTE_8 | 0x270,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214
};

static const u16 sZebesianAquaOam_3817c4_Frame8[] = {
    16,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    0xe9, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x259,
    0xe9, 0x1ed, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f2, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x204,
    0xdf, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe4, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x259,
    0xe4, 0x1d9, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1de, OBJ_PALETTE_8 | 0x277,
    0xe4, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x202,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214
};

static const u16 sZebesianAquaOam_3817c4_Frame9[] = {
    16,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xe9, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x259,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f1, OBJ_PALETTE_8 | 0x277,
    0xe9, 0x1ec, OBJ_PALETTE_8 | 0x258,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x259,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1dd, OBJ_PALETTE_8 | 0x277,
    0xe4, 0x1d8, OBJ_PALETTE_8 | 0x258,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21a,
    0xe4, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x202,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214
};

static const u16 sZebesianAquaOam_3817c4_Frame10[] = {
    14,
    0xef, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, OBJ_PALETTE_8 | 0x25d,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21a,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xe5, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x202,
    0xea, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1ea, OBJ_PALETTE_8 | 0x25d
};

static const u16 sZebesianAquaOam_3817c4_Frame11[] = {
    14,
    0xf3, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1fc, OBJ_PALETTE_8 | 0x219,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x204,
    0xdf, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xf0, OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x21a,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xe6, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x202,
    0xec, OBJ_SIZE_16x16 | 0x1dc, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1ec, OBJ_PALETTE_8 | 0x25d
};

static const u16 sZebesianAquaOam_38182c_Frame0[] = {
    2,
    0xfc, 0x1f8, OBJ_PALETTE_9 | 0x272,
    0xfc, 0x1fe, OBJ_PALETTE_9 | 0x273
};

static const u16 sZebesianAquaOam_38182c_Frame1[] = {
    2,
    0xfc, 0x1f8, OBJ_PALETTE_9 | 0x272,
    0xfc, 0x1ff, OBJ_PALETTE_9 | 0x273
};

static const u16 sZebesianAquaOam_38182c_Frame2[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f8, OBJ_PALETTE_9 | 0x272
};

static const u16 sZebesianAquaOam_38184c_Frame2[] = {
    14,
    0xef, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, OBJ_PALETTE_8 | 0x25d,
    0xfc, 0x5, OBJ_PALETTE_9 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_9 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xea, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1ea, OBJ_PALETTE_8 | 0x25d,
    0xe5, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianAquaOam_38184c_Frame3[] = {
    14,
    0xee, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fb, OBJ_PALETTE_8 | 0x25d,
    0xfc, 0x5, OBJ_PALETTE_9 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_9 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xe9, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1ea, OBJ_PALETTE_8 | 0x25d,
    0xe5, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianAquaOam_38184c_Frame4[] = {
    14,
    0xef, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, OBJ_PALETTE_8 | 0x25d,
    0xfc, 0x5, OBJ_PALETTE_9 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xea, OBJ_SIZE_16x16 | 0x1da, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1ea, OBJ_PALETTE_8 | 0x25d,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_9 | 0x250,
    0xe5, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x202
};

static const u16 sZebesianAquaOam_38184c_Frame5[] = {
    13,
    0xf3, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x1fc, OBJ_PALETTE_8 | 0x219,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x204,
    0xdf, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_9 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_9 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xec, OBJ_SIZE_16x16 | 0x1dd, OBJ_PALETTE_8 | 0x25b,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1ed, OBJ_PALETTE_8 | 0x25d
};

static const u16 sZebesianAquaOam_38184c_Frame6[] = {
    13,
    0xf2, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f8, OBJ_PALETTE_8 | 0x219,
    0xfc, 0x5, OBJ_PALETTE_8 | 0x233,
    0xf0, OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xde, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x240,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe1, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fd, OBJ_PALETTE_8 | 0x252,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xef, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1ef, OBJ_PALETTE_8 | 0x219
};

static const u16 sZebesianAquaOam_3816dc[] = {
    13,
    0xf6, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x1f4, OBJ_PALETTE_8 | 0x219,
    0xde, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1f7, OBJ_PALETTE_8 | 0x204,
    0xfc, 0x4, OBJ_PALETTE_8 | 0x213,
    0xf0, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x207,
    0xef, OBJ_SIZE_16x16 | 0x9, OBJ_PALETTE_8 | 0x21a,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fd, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_VERTICAL | 0xde, OBJ_SIZE_16x32 | 0x1f6, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1ee, OBJ_PALETTE_8 | 0x214,
    0xf2, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f0, OBJ_PALETTE_8 | 0x219
};

const struct FrameData sZebesianAquaOam_38172c[7] = {
    [0] = {
        .pFrame = sZebesianAquaOam_38172c_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sZebesianAquaOam_38172c_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sZebesianAquaOam_38172c_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sZebesianAquaOam_38172c_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sZebesianAquaOam_38172c_Frame4,
        .timer = 10
    },
    [5] = {
        .pFrame = sZebesianAquaOam_38172c_Frame5,
        .timer = 10
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianAquaOam_381764[7] = {
    [0] = {
        .pFrame = sZebesianAquaOam_381764_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sZebesianAquaOam_381764_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sZebesianAquaOam_381764_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sZebesianAquaOam_381764_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sZebesianAquaOam_381764_Frame4,
        .timer = 10
    },
    [5] = {
        .pFrame = sZebesianAquaOam_381764_Frame5,
        .timer = 10
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianAquaOam_38179c[5] = {
    [0] = {
        .pFrame = sZebesianAquaOam_38179c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZebesianAquaOam_38179c_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZebesianAquaOam_38179c_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZebesianAquaOam_38179c_Frame0,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianAquaOam_3817c4[13] = {
    [0] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame7,
        .timer = 1
    },
    [8] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame9,
        .timer = 10
    },
    [10] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame10,
        .timer = 8
    },
    [11] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame11,
        .timer = 8
    },
    [12] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianAquaOam_38182c[4] = {
    [0] = {
        .pFrame = sZebesianAquaOam_38182c_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZebesianAquaOam_38182c_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZebesianAquaOam_38182c_Frame2,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZebesianAquaOam_38184c[8] = {
    [0] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sZebesianAquaOam_3817c4_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZebesianAquaOam_38184c_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sZebesianAquaOam_38184c_Frame3,
        .timer = 9
    },
    [4] = {
        .pFrame = sZebesianAquaOam_38184c_Frame4,
        .timer = 10
    },
    [5] = {
        .pFrame = sZebesianAquaOam_38184c_Frame5,
        .timer = 8
    },
    [6] = {
        .pFrame = sZebesianAquaOam_38184c_Frame6,
        .timer = 6
    },
    [7] = FRAME_DATA_TERMINATOR
};
