#include "data/sprites/evir.h"
#include "macros.h"

const u32 sEvirGfx[512 * 2] = INCBIN_U32("data/sprites/evir.gfx");
const u16 sEvirPal[16 * 2] = INCBIN_U16("data/sprites/evir.pal");

static const u16 sEvirOam_356abc_Frame0[] = {
    11,
    0xde, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    0xf2, 0x1, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xd6, 0x1f6, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xde, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe5, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0x7, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x8, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356abc_Frame1[] = {
    12,
    0xdf, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fa, OBJ_PALETTE_8 | 0x22c,
    0xef, 0x1ff, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x22c,
    0xe7, 0x1f7, OBJ_PALETTE_8 | 0x20f,
    0xd7, 0x1f6, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xdf, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe6, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x7, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356abc_Frame2[] = {
    12,
    0xdf, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f9, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f9, OBJ_PALETTE_8 | 0x22c,
    0xea, 0x1ff, OBJ_PALETTE_8 | 0x20e,
    0xe7, 0x1f8, OBJ_PALETTE_8 | 0x22f,
    0xd7, 0x1f7, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xdf, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xee, 0x7, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356abc_Frame3[] = {
    11,
    0xdf, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fa, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f7, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    0xd6, 0x1f6, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xde, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x7, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356abc_Frame4[] = {
    11,
    0xde, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    0xf2, 0x1, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xd5, 0x1f6, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xdd, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x7, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xed, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf6, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356abc_Frame5[] = {
    11,
    0xdf, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1fa, OBJ_PALETTE_8 | 0x22c,
    0xef, 0x1ff, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f7, OBJ_PALETTE_8 | 0x22c,
    0xd6, 0x1f6, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xde, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xef, 0x7, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356abc_Frame6[] = {
    11,
    0xdf, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f9, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f9, OBJ_PALETTE_8 | 0x22c,
    0xea, 0x1ff, OBJ_PALETTE_8 | 0x20e,
    0xd7, 0x1f6, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xdf, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe6, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x7, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356abc_Frame7[] = {
    11,
    0xde, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fa, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f7, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    0xd6, 0x1f6, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xde, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe6, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356b04_Frame0[] = {
    12,
    0xe6, 0x1f8, OBJ_PALETTE_8 | 0x20f,
    0xde, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fa, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f9, OBJ_PALETTE_8 | 0x22c,
    0xd6, 0x1f7, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xde, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe6, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356b04_Frame1[] = {
    12,
    0xe5, 0x1f8, OBJ_PALETTE_8 | 0x22f,
    0xdd, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fb, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fa, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f9, OBJ_PALETTE_8 | 0x22c,
    0xd5, 0x1f7, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xdd, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe5, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xec, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x24a,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356b04_Frame2[] = {
    11,
    0xde, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fa, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f9, OBJ_PALETTE_8 | 0x22c,
    0xd6, 0x1f6, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xde, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe5, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x9, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x8, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x24e,
    OBJ_SHAPE_VERTICAL | 0xf3, 0x0, OBJ_PALETTE_8 | 0x211
};

static const u16 sEvirOam_356b04_Frame3[] = {
    11,
    0xdf, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1fb, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1fc, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    0xd7, 0x1f7, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xdf, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe6, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0xa, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x9, OBJ_PALETTE_8 | 0x20b,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1, OBJ_PALETTE_8 | 0x212
};

static const u16 sEvirOam_356b04_Frame4[] = {
    11,
    0xe0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fc, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f9, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1fa, OBJ_PALETTE_8 | 0x22c,
    0xd8, 0x1f7, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe5, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xec, 0xb, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, 0xc, OBJ_PALETTE_8 | 0x20b,
    0xf5, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x250,
    0xef, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x24c
};

static const u16 sEvirOam_356b04_Frame5[] = {
    11,
    0xde, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1fa, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    0xd7, 0x1f7, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xdf, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe6, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xee, 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x7, OBJ_PALETTE_8 | 0x20b,
    0xf9, 0x1ff, OBJ_PALETTE_8 | 0x252,
    0xef, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x24c
};

static const u16 sEvirOam_356b04_Frame6[] = {
    11,
    0xde, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    0xf2, 0x1, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xd6, 0x1f7, OBJ_PALETTE_8 | 0x22e,
    OBJ_SHAPE_HORIZONTAL | 0xde, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe6, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xed, 0x6, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x5, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1fe, OBJ_PALETTE_8 | 0x210
};

static const u16 sEvirOam_356b44_Frame1[] = {
    8,
    0xeb, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xe3, OBJ_SIZE_32x16 | 0x1ee, OBJ_PALETTE_8 | 0x233,
    OBJ_SHAPE_HORIZONTAL | 0xdb, 0x1ee, OBJ_PALETTE_8 | 0x213,
    0xdb, 0x1fe, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1f6, OBJ_PALETTE_8 | 0x274,
    0xf3, 0x6, OBJ_PALETTE_8 | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1fd, OBJ_PALETTE_8 | 0x21d,
    0xeb, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x217
};

static const u16 sEvirOam_356b44_Frame2[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x259,
    0xdd, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x0, OBJ_PALETTE_8 | 0x23b,
    0xdd, 0x0, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0xfd, 0x1f8, OBJ_PALETTE_8 | 0x23d
};

static const u16 sEvirOam_356b84_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240
};

static const u16 sEvirOam_356b84_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x242
};

static const u16 sEvirOam_356b84_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x244
};

static const u16 sEvirOam_356b84_Frame3[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x246
};

static const u16 sEvirOam_356bac_Frame0[] = {
    4,
    0xf5, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x25d,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x3, OBJ_PALETTE_8 | 0x25f,
    0x5, 0x1f6, OBJ_PALETTE_8 | 0x21f,
    0x5, 0x1fe, OBJ_PALETTE_8 | 0x23f
};

static const u16 sEvirOam_356bac_Frame1[] = {
    10,
    0xf7, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x216,
    0x6, 0x1f5, OBJ_PALETTE_8 | 0x273,
    0xf4, 0x2, OBJ_PALETTE_8 | 0x21c,
    0xfc, 0x1f5, OBJ_PALETTE_8 | 0x216,
    0x5, OBJ_X_FLIP | OBJ_Y_FLIP | 0x2, OBJ_PALETTE_8 | 0x273,
    0x2, OBJ_Y_FLIP | 0x5, OBJ_PALETTE_8 | 0x21c,
    0xfa, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x273,
    0xf7, 0x1f0, OBJ_PALETTE_8 | 0x273,
    0x2, 0x1f1, OBJ_PALETTE_8 | 0x273,
    0x1, OBJ_Y_FLIP | 0x1, OBJ_PALETTE_8 | 0x21c
};

static const u16 sEvirOam_356bac_Frame2[] = {
    7,
    0xb, 0x1f5, OBJ_PALETTE_8 | 0x273,
    0x9, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, OBJ_PALETTE_8 | 0x273,
    0x3, OBJ_X_FLIP | 0xb, OBJ_PALETTE_8 | 0x273,
    0xf7, 0x1ed, OBJ_PALETTE_8 | 0x273,
    0x4, 0x1eb, OBJ_PALETTE_8 | 0x273,
    0xef, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x273,
    0xeb, OBJ_Y_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x273
};

const struct FrameData sEvirOam_356abc[9] = {
    [0] = {
        .pFrame = sEvirOam_356abc_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sEvirOam_356abc_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sEvirOam_356abc_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sEvirOam_356abc_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sEvirOam_356abc_Frame4,
        .timer = 10
    },
    [5] = {
        .pFrame = sEvirOam_356abc_Frame5,
        .timer = 10
    },
    [6] = {
        .pFrame = sEvirOam_356abc_Frame6,
        .timer = 10
    },
    [7] = {
        .pFrame = sEvirOam_356abc_Frame7,
        .timer = 10
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sEvirOam_356b04[8] = {
    [0] = {
        .pFrame = sEvirOam_356b04_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sEvirOam_356b04_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sEvirOam_356b04_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sEvirOam_356b04_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sEvirOam_356b04_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sEvirOam_356b04_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sEvirOam_356b04_Frame6,
        .timer = 10
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sEvirOam_356b44[4] = {
    [0] = {
        .pFrame = sEvirOam_356abc_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sEvirOam_356b44_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sEvirOam_356b44_Frame2,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sEvirOam_356b64[4] = {
    [0] = {
        .pFrame = sEvirOam_356b44_Frame2,
        .timer = 4
    },
    [1] = {
        .pFrame = sEvirOam_356b44_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sEvirOam_356abc_Frame0,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sEvirOam_356b84[5] = {
    [0] = {
        .pFrame = sEvirOam_356b84_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sEvirOam_356b84_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sEvirOam_356b84_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sEvirOam_356b84_Frame3,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sEvirOam_356bac[4] = {
    [0] = {
        .pFrame = sEvirOam_356bac_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sEvirOam_356bac_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sEvirOam_356bac_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};
