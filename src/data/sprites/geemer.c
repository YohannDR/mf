#include "data/sprites/geemer.h"
#include "macros.h"

const u32 sGeemerGfx[512 * 2] = INCBIN_U32("data/sprites/geemer.gfx");
const u16 sGeemerPal[16 * 2] = INCBIN_U16("data/sprites/geemer.pal");

static const u16 sOam_2fc650[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc66a[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x208,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc684[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20a,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc69e[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2fc6b8[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc6d2[OAM_DATA_SIZE(4)] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2fc6ec[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x206,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x222,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sOam_2fc706[OAM_DATA_SIZE(5)] = {
    5,
    0xf9, 0x1f7, OBJ_PALETTE_8 | 0x20c,
    0xf9, 0x1, OBJ_PALETTE_8 | 0x20d,
    0xf0, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x208,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc726[OAM_DATA_SIZE(5)] = {
    5,
    0xfa, 0x1f6, OBJ_PALETTE_8 | 0x22c,
    0xfa, 0x1, OBJ_PALETTE_8 | 0x22d,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc746[OAM_DATA_SIZE(5)] = {
    5,
    0xfa, 0x1f6, OBJ_PALETTE_8 | 0x20e,
    0xfa, 0x1, OBJ_PALETTE_8 | 0x20f,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc766[OAM_DATA_SIZE(5)] = {
    5,
    0xf9, 0x1f6, OBJ_PALETTE_8 | 0x20c,
    0xf9, 0x1, OBJ_PALETTE_8 | 0x20d,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc786[OAM_DATA_SIZE(5)] = {
    5,
    0xfa, 0x1f6, OBJ_PALETTE_8 | 0x22c,
    0xfa, 0x1, OBJ_PALETTE_8 | 0x22d,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc7a6[OAM_DATA_SIZE(5)] = {
    5,
    0xfa, 0x1f6, OBJ_PALETTE_8 | 0x20e,
    0xfa, 0x1, OBJ_PALETTE_8 | 0x20f,
    0xf0, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x20a,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc7c6[OAM_DATA_SIZE(4)] = {
    4,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc7e0[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x206,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc7f4[OAM_DATA_SIZE(3)] = {
    3,
    0xef, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x206,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x206,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc808[OAM_DATA_SIZE(3)] = {
    3,
    0xef, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x206,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc81c[OAM_DATA_SIZE(3)] = {
    3,
    0xef, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x206,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fc830[OAM_DATA_SIZE(3)] = {
    3,
    0xef, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x206,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sOam_2fc844[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x22e
};

static const u16 sOam_2fc84c[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x22f
};

static const u16 sOam_2fc854[OAM_DATA_SIZE(1)] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x230
};

static const u16 sOam_2fc85c[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x246,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240
};

static const u16 sOam_2fc870[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x247,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x247,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240
};

static const u16 sOam_2fc884[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x248,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240
};

static const u16 sOam_2fc898[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x24a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x24a,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x242
};

static const u16 sOam_2fc8ac[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x24a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x24a,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x244
};

static const u16 sOam_2fc8c0[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f7, OBJ_PALETTE_8 | 0x246,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x246,
    0xf1, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x240
};

static const u16 sOam_2fc8d4[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x6, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2fc8ee[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x219,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x6, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2fc908[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21b,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x7, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2fc922[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x6, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2fc93c[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x5, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2fc956[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x6, OBJ_PALETTE_8 | 0x214
};

static const u16 sOam_2fc970[OAM_DATA_SIZE(4)] = {
    4,
    0xef, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x6, OBJ_PALETTE_8 | 0x214
};

static const u16 sOam_2fc98a[OAM_DATA_SIZE(5)] = {
    5,
    0xf7, 0x1ff, OBJ_PALETTE_8 | 0x21d,
    0x1, 0x1ff, OBJ_PALETTE_8 | 0x23d,
    0xee, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x219,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fc9aa[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x1fe, OBJ_PALETTE_8 | 0x21e,
    0x1, 0x1fe, OBJ_PALETTE_8 | 0x23e,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x219,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fc9ca[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x1fe, OBJ_PALETTE_8 | 0x21f,
    0x1, 0x1fe, OBJ_PALETTE_8 | 0x23f,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x219,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fc9ea[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x1ff, OBJ_PALETTE_8 | 0x21d,
    0x1, 0x1ff, OBJ_PALETTE_8 | 0x23d,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x219,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fca0a[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x1fe, OBJ_PALETTE_8 | 0x21e,
    0x1, 0x1fe, OBJ_PALETTE_8 | 0x23e,
    0xef, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21b,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fca2a[OAM_DATA_SIZE(5)] = {
    5,
    0xf6, 0x1fe, OBJ_PALETTE_8 | 0x21f,
    0x1, 0x1fe, OBJ_PALETTE_8 | 0x23f,
    0xee, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21b,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fca4a[OAM_DATA_SIZE(4)] = {
    4,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x217,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x6, OBJ_PALETTE_8 | 0x212
};

static const u16 sOam_2fca64[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x217,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fca78[OAM_DATA_SIZE(3)] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0xf8, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fca8c[OAM_DATA_SIZE(3)] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fcaa0[OAM_DATA_SIZE(3)] = {
    3,
    0xed, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0x2, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fcab4[OAM_DATA_SIZE(3)] = {
    3,
    0xed, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0x2, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x217,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x215
};

static const u16 sOam_2fcac8[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x254,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x252
};

static const u16 sOam_2fcadc[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x274,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x252
};

static const u16 sOam_2fcaf0[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x0, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x256,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x252
};

static const u16 sOam_2fcb04[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x258,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x258,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2fcb18[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x258,
    0xff, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x258,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x24e
};

static const u16 sOam_2fcb2c[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x0, OBJ_PALETTE_8 | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x254,
    0xf9, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x252
};

static const u16 sOam_2fcb40[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x24c,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x24c,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fcb54[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x24c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x24c,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fcb68[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x24c,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x24c,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x244
};

static const u16 sOam_2fcb7c[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x24c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x24c,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x242
};

static const u16 sOam_2fcb90[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x24c,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x24c,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240
};

static const u16 sOam_2fcba4[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x24c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x24c,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x240
};

static const u16 sOam_2fcbb8[OAM_DATA_SIZE(3)] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x25a,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x25a,
    0xf8, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fcbcc[OAM_DATA_SIZE(3)] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x25a,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x25a,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x211
};

static const u16 sOam_2fcbe0[OAM_DATA_SIZE(3)] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x25a,
    0x1, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x25a,
    0xf8, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x24e
};

static const u16 sOam_2fcbf4[OAM_DATA_SIZE(3)] = {
    3,
    0xef, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x25a,
    0x0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x25a,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x250
};

static const u16 sOam_2fcc08[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x25a,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x25a,
    0xf8, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x252
};

static const u16 sOam_2fcc1c[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x25a,
    0xfe, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x25a,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x252
};

static const u16 sOam_2fcc30[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x24c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x24c,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sOam_2fcc44[OAM_DATA_SIZE(3)] = {
    3,
    0xed, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x25a,
    0x2, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x25a,
    0xf8, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x211
};

const struct FrameData sFrameData_2fcc58[5] = {
    [0] = {
        .pFrame = sOam_2fc85c,
        .timer = 12,
    },
    [1] = {
        .pFrame = sOam_2fc870,
        .timer = 16,
    },
    [2] = {
        .pFrame = sOam_2fc85c,
        .timer = 12,
    },
    [3] = {
        .pFrame = sOam_2fc884,
        .timer = 12,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcc80[6] = {
    [0] = {
        .pFrame = sOam_2fc85c,
        .timer = 16,
    },
    [1] = {
        .pFrame = sOam_2fc898,
        .timer = 6,
    },
    [2] = {
        .pFrame = sOam_2fc8ac,
        .timer = 6,
    },
    [3] = {
        .pFrame = sOam_2fc66a,
        .timer = 4,
    },
    [4] = {
        .pFrame = sOam_2fc650,
        .timer = 20,
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fccb0[7] = {
    [0] = {
        .pFrame = sOam_2fc8c0,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2fc85c,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2fc8c0,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2fc85c,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2fc8c0,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2fc85c,
        .timer = 2,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcce8[6] = {
    [0] = {
        .pFrame = sOam_2fcac8,
        .timer = 16,
    },
    [1] = {
        .pFrame = sOam_2fcb04,
        .timer = 6,
    },
    [2] = {
        .pFrame = sOam_2fcb18,
        .timer = 6,
    },
    [3] = {
        .pFrame = sOam_2fc8ee,
        .timer = 4,
    },
    [4] = {
        .pFrame = sOam_2fc8d4,
        .timer = 20,
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcd18[5] = {
    [0] = {
        .pFrame = sOam_2fcac8,
        .timer = 12,
    },
    [1] = {
        .pFrame = sOam_2fcadc,
        .timer = 16,
    },
    [2] = {
        .pFrame = sOam_2fcac8,
        .timer = 12,
    },
    [3] = {
        .pFrame = sOam_2fcaf0,
        .timer = 12,
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcd40[7] = {
    [0] = {
        .pFrame = sOam_2fcb2c,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2fcac8,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2fcb2c,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2fcac8,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2fcb2c,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2fcac8,
        .timer = 2,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcd78[4] = {
    [0] = {
        .pFrame = sOam_2fc844,
        .timer = 3,
    },
    [1] = {
        .pFrame = sOam_2fc84c,
        .timer = 3,
    },
    [2] = {
        .pFrame = sOam_2fc854,
        .timer = 3,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcd98[9] = {
    [0] = {
        .pFrame = sOam_2fc650,
        .timer = 12,
    },
    [1] = {
        .pFrame = sOam_2fc66a,
        .timer = 12,
    },
    [2] = {
        .pFrame = sOam_2fc684,
        .timer = 6,
    },
    [3] = {
        .pFrame = sOam_2fc69e,
        .timer = 6,
    },
    [4] = {
        .pFrame = sOam_2fc650,
        .timer = 12,
    },
    [5] = {
        .pFrame = sOam_2fc66a,
        .timer = 12,
    },
    [6] = {
        .pFrame = sOam_2fc684,
        .timer = 6,
    },
    [7] = {
        .pFrame = sOam_2fc69e,
        .timer = 6,
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcde0[4] = {
    [0] = {
        .pFrame = sOam_2fc6b8,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2fc6d2,
        .timer = 4,
    },
    [2] = {
        .pFrame = sOam_2fc6ec,
        .timer = 4,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fce00[7] = {
    [0] = {
        .pFrame = sOam_2fc706,
        .timer = 5,
    },
    [1] = {
        .pFrame = sOam_2fc726,
        .timer = 5,
    },
    [2] = {
        .pFrame = sOam_2fc746,
        .timer = 5,
    },
    [3] = {
        .pFrame = sOam_2fc766,
        .timer = 5,
    },
    [4] = {
        .pFrame = sOam_2fc786,
        .timer = 5,
    },
    [5] = {
        .pFrame = sOam_2fc7a6,
        .timer = 5,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fce38[15] = {
    [0] = {
        .pFrame = sOam_2fc7c6,
        .timer = 20,
    },
    [1] = {
        .pFrame = sOam_2fc7e0,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2fc7f4,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2fc81c,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2fc808,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2fc81c,
        .timer = 2,
    },
    [6] = {
        .pFrame = sOam_2fc808,
        .timer = 2,
    },
    [7] = {
        .pFrame = sOam_2fc81c,
        .timer = 2,
    },
    [8] = {
        .pFrame = sOam_2fc808,
        .timer = 2,
    },
    [9] = {
        .pFrame = sOam_2fc81c,
        .timer = 2,
    },
    [10] = {
        .pFrame = sOam_2fc808,
        .timer = 2,
    },
    [11] = {
        .pFrame = sOam_2fc81c,
        .timer = 2,
    },
    [12] = {
        .pFrame = sOam_2fc808,
        .timer = 8,
    },
    [13] = {
        .pFrame = sOam_2fc7e0,
        .timer = 10,
    },
    [14] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fceb0[3] = {
    [0] = {
        .pFrame = sOam_2fc808,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2fc830,
        .timer = 3,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcec8[8] = {
    [0] = {
        .pFrame = sOam_2fcc30,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2fcb54,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2fcb68,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2fcb7c,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2fcb90,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2fcba4,
        .timer = 2,
    },
    [6] = {
        .pFrame = sOam_2fcb90,
        .timer = 255,
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcf08[4] = {
    [0] = {
        .pFrame = sOam_2fcb7c,
        .timer = 7,
    },
    [1] = {
        .pFrame = sOam_2fcb68,
        .timer = 7,
    },
    [2] = {
        .pFrame = sOam_2fcb40,
        .timer = 7,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcf28[9] = {
    [0] = {
        .pFrame = sOam_2fc8d4,
        .timer = 12,
    },
    [1] = {
        .pFrame = sOam_2fc8ee,
        .timer = 12,
    },
    [2] = {
        .pFrame = sOam_2fc908,
        .timer = 6,
    },
    [3] = {
        .pFrame = sOam_2fc922,
        .timer = 6,
    },
    [4] = {
        .pFrame = sOam_2fc8d4,
        .timer = 12,
    },
    [5] = {
        .pFrame = sOam_2fc8ee,
        .timer = 12,
    },
    [6] = {
        .pFrame = sOam_2fc908,
        .timer = 6,
    },
    [7] = {
        .pFrame = sOam_2fc922,
        .timer = 6,
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcf70[4] = {
    [0] = {
        .pFrame = sOam_2fc93c,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2fc956,
        .timer = 4,
    },
    [2] = {
        .pFrame = sOam_2fc970,
        .timer = 4,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcf90[7] = {
    [0] = {
        .pFrame = sOam_2fc98a,
        .timer = 5,
    },
    [1] = {
        .pFrame = sOam_2fc9aa,
        .timer = 5,
    },
    [2] = {
        .pFrame = sOam_2fc9ca,
        .timer = 5,
    },
    [3] = {
        .pFrame = sOam_2fc9ea,
        .timer = 5,
    },
    [4] = {
        .pFrame = sOam_2fca0a,
        .timer = 5,
    },
    [5] = {
        .pFrame = sOam_2fca2a,
        .timer = 5,
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fcfc8[15] = {
    [0] = {
        .pFrame = sOam_2fca4a,
        .timer = 20,
    },
    [1] = {
        .pFrame = sOam_2fca64,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2fca78,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2fcaa0,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2fca8c,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2fcaa0,
        .timer = 2,
    },
    [6] = {
        .pFrame = sOam_2fca8c,
        .timer = 2,
    },
    [7] = {
        .pFrame = sOam_2fcaa0,
        .timer = 2,
    },
    [8] = {
        .pFrame = sOam_2fca8c,
        .timer = 2,
    },
    [9] = {
        .pFrame = sOam_2fcaa0,
        .timer = 2,
    },
    [10] = {
        .pFrame = sOam_2fca8c,
        .timer = 2,
    },
    [11] = {
        .pFrame = sOam_2fcaa0,
        .timer = 2,
    },
    [12] = {
        .pFrame = sOam_2fca8c,
        .timer = 8,
    },
    [13] = {
        .pFrame = sOam_2fca64,
        .timer = 10,
    },
    [14] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fd040[3] = {
    [0] = {
        .pFrame = sOam_2fca8c,
        .timer = 4,
    },
    [1] = {
        .pFrame = sOam_2fcab4,
        .timer = 3,
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fd058[8] = {
    [0] = {
        .pFrame = sOam_2fcc44,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_2fcbcc,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_2fcbe0,
        .timer = 2,
    },
    [3] = {
        .pFrame = sOam_2fcbf4,
        .timer = 2,
    },
    [4] = {
        .pFrame = sOam_2fcc08,
        .timer = 2,
    },
    [5] = {
        .pFrame = sOam_2fcc1c,
        .timer = 2,
    },
    [6] = {
        .pFrame = sOam_2fcc08,
        .timer = 255,
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_2fd098[4] = {
    [0] = {
        .pFrame = sOam_2fcbf4,
        .timer = 7,
    },
    [1] = {
        .pFrame = sOam_2fcbe0,
        .timer = 7,
    },
    [2] = {
        .pFrame = sOam_2fcbb8,
        .timer = 7,
    },
    [3] = FRAME_DATA_TERMINATOR
};
