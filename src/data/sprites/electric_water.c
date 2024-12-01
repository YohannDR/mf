#include "data/sprites/electric_water.h"

const u32 sElectricWaterGfx[2 * 512] = INCBIN_U32("data/sprites/electric_water.gfx");
const u16 sElectricWaterPal[2 * 16] = INCBIN_U16("data/sprites/electric_water.pal");

static const u16 sElectricWaterDamageOam_Idle_Frame0[] = {
    2,
    0xde, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1, OBJ_PALETTE_8 | 0x202
};

static const u16 sElectricWaterDamageOam_Idle_Frame1[] = {
    1,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x203
};

static const u16 sElectricWaterDamageOam_Idle_Frame2[] = {
    2,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x205,
    0xf4, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x207
};

static const u16 sElectricWaterDamageOam_Idle_Frame3[] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xde, 0x0, OBJ_PALETTE_8 | 0x20a,
    0xe6, 0x1f8, OBJ_PALETTE_8 | 0x229
};

static const u16 sElectricWaterDamageOam_Idle_Frame4[] = {
    4,
    0xfa, 0x1ff, OBJ_PALETTE_8 | 0x22e,
    0xf1, 0x1fb, OBJ_PALETTE_8 | 0x20e,
    0xe7, 0x1f8, OBJ_PALETTE_8 | 0x22d,
    0xe3, 0x1, OBJ_PALETTE_8 | 0x20d
};

static const u16 sElectricWaterDamageOam_Idle_Frame5[] = {
    4,
    0xed, 0x1, OBJ_PALETTE_8 | 0x22f,
    0xe6, 0x1f7, OBJ_PALETTE_8 | 0x20f,
    0xe2, 0x2, OBJ_PALETTE_8 | 0x210,
    0xf5, 0x1fd, OBJ_PALETTE_8 | 0x233
};

static const u16 sElectricWaterDamageOam_Stopping_Frame6[] = {
    13,
    0xee, 0x1, OBJ_PALETTE_8 | 0x212,
    0xf7, 0x1, OBJ_PALETTE_8 | 0x235,
    0xf3, 0x1, OBJ_PALETTE_8 | 0x214,
    0xf4, 0x1f7, OBJ_PALETTE_8 | 0x230,
    0xeb, 0x1f3, OBJ_PALETTE_8 | 0x214,
    0xed, 0x1f7, OBJ_PALETTE_8 | 0x211,
    0xdc, 0x2, OBJ_PALETTE_8 | 0x233,
    0xe2, 0x4, OBJ_PALETTE_8 | 0x231,
    0xe1, 0x1f7, OBJ_PALETTE_8 | 0x211,
    0xed, 0x1, OBJ_PALETTE_8 | 0x22f,
    0xe6, 0x1f7, OBJ_PALETTE_8 | 0x20f,
    0xe2, 0x2, OBJ_PALETTE_8 | 0x210,
    0xf5, 0x1fd, OBJ_PALETTE_8 | 0x233
};

static const u16 sElectricWaterDamageOam_Stopping_Frame7[] = {
    5,
    0xf1, 0x2, OBJ_PALETTE_8 | 0x235,
    0xeb, 0x3, OBJ_PALETTE_8 | 0x236,
    0xf0, 0x1f4, OBJ_PALETTE_8 | 0x213,
    0xe9, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x214,
    0xe0, 0x1, OBJ_PALETTE_8 | 0x214
};

static const u16 sElectricWaterDamageOam_Stopping_Frame8[] = {
    1,
    0x0, 0x1f8, OBJ_PALETTE_8 | 0x27f
};

static const u16 sElectricWireOam_Frame0[] = {
    6,
    0xee, 0x7, OBJ_PALETTE_8 | 0x216,
    0xf3, 0x1, OBJ_PALETTE_8 | 0x21d,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x21d,
    0xfd, 0xb, OBJ_PALETTE_8 | 0x21d,
    0x7, 0x1fe, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame1[] = {
    6,
    0xee, 0x7, OBJ_PALETTE_8 | 0x216,
    0xf7, 0x1, OBJ_PALETTE_8 | 0x236,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x236,
    0x7, 0x1fe, OBJ_PALETTE_8 | 0x236,
    0xfd, 0xc, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame2[] = {
    6,
    0xee, 0x7, OBJ_PALETTE_8 | 0x216,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x236,
    0x7, 0x1fe, OBJ_PALETTE_8 | 0x236,
    0xfd, 0xc, OBJ_PALETTE_8 | 0x236,
    0xf7, 0x1, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame3[] = {
    6,
    0xee, 0x7, OBJ_PALETTE_8 | 0x216,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x236,
    0x7, 0x1fe, OBJ_PALETTE_8 | 0x236,
    0xfd, 0xc, OBJ_PALETTE_8 | 0x236,
    0xf7, 0x1, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame4[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x8, OBJ_PALETTE_8 | 0x239,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x236,
    0x7, 0x1fe, OBJ_PALETTE_8 | 0x236,
    0xfd, 0xc, OBJ_PALETTE_8 | 0x236,
    0xf8, 0x1, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame5[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x8, OBJ_PALETTE_8 | 0x239,
    0xfd, 0x1f2, OBJ_PALETTE_8 | 0x236,
    0x8, 0x1fe, OBJ_PALETTE_8 | 0x236,
    0x1, 0xf, OBJ_PALETTE_8 | 0x236,
    0xf9, 0x2, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame6[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x7, OBJ_PALETTE_8 | 0x21b,
    0xfd, 0x1f2, OBJ_PALETTE_8 | 0x236,
    0x8, 0x1fe, OBJ_PALETTE_8 | 0x236,
    0x1, 0xf, OBJ_PALETTE_8 | 0x236,
    0xf9, 0x2, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame7[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x7, OBJ_PALETTE_8 | 0x21b,
    0xfd, 0x1f2, OBJ_PALETTE_8 | 0x236,
    0x8, 0x1fe, OBJ_PALETTE_8 | 0x236,
    0xf9, 0x2, OBJ_PALETTE_8 | 0x236,
    0x1, 0xf, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame8[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x7, OBJ_PALETTE_8 | 0x21b,
    0xfd, 0x1f2, OBJ_PALETTE_8 | 0x236,
    0x8, 0x1fe, OBJ_PALETTE_8 | 0x236,
    0xfa, 0x2, OBJ_PALETTE_8 | 0x236,
    0x1, 0xf, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame9[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x7, OBJ_PALETTE_8 | 0x21b,
    0x1, 0x1f1, OBJ_PALETTE_8 | 0x236,
    0xa, 0x1ff, OBJ_PALETTE_8 | 0x236,
    0x4, 0xf, OBJ_PALETTE_8 | 0x236,
    0xfb, 0x3, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame10[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x239,
    0x1, 0x1f1, OBJ_PALETTE_8 | 0x236,
    0xa, 0x1ff, OBJ_PALETTE_8 | 0x236,
    0x4, 0xf, OBJ_PALETTE_8 | 0x236,
    0xfb, 0x3, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame11[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x239,
    0x1, 0x1f1, OBJ_PALETTE_8 | 0x236,
    0xa, 0x1ff, OBJ_PALETTE_8 | 0x236,
    0x4, 0xf, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame12[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x1, 0x1f1, OBJ_PALETTE_8 | 0x236,
    0xa, 0x1ff, OBJ_PALETTE_8 | 0x236,
    0x4, 0xf, OBJ_PALETTE_8 | 0x236
};

static const u16 sElectricWireOam_Frame13[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x3, 0x1f1, OBJ_PALETTE_8 | 0x236,
    0xc, 0x1ff, OBJ_PALETTE_8 | 0x236
};

static const u16 sElectricWireOam_Frame14[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x3, 0x1f1, OBJ_PALETTE_8 | 0x236,
    0xc, 0x1ff, OBJ_PALETTE_8 | 0x236
};

static const u16 sElectricWireOam_Frame15[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x21b,
    0x3, 0x1f1, OBJ_PALETTE_8 | 0x236,
    0xc, 0x1ff, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame16[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x8, OBJ_PALETTE_8 | 0x239,
    0x3, 0x1f1, OBJ_PALETTE_8 | 0x236,
    0xc, 0x1ff, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame17[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x8, OBJ_PALETTE_8 | 0x239,
    0x10, 0x1ff, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame18[] = {
    3,
    0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x216,
    0x10, 0x1ff, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame19[] = {
    3,
    0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x216,
    0x10, 0x1ff, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame20[] = {
    3,
    0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x216,
    0x10, 0x1ff, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame21[] = {
    3,
    0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x216,
    0x12, 0x1ff, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame22[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x239,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame23[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x239,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame24[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame25[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame26[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame27[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x21b
};

static const u16 sElectricWireOam_Frame28[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame29[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame30[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame31[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x21b,
    0xf6, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame32[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x21b,
    0xf6, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame33[] = {
    3,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x0, OBJ_PALETTE_8 | 0x21b,
    0xf6, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame34[] = {
    3,
    0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x216,
    0xf6, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame35[] = {
    6,
    0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x216,
    0xf9, 0x1f8, OBJ_PALETTE_8 | 0x23c,
    0xf5, 0x1, OBJ_PALETTE_8 | 0x23c,
    0x1, 0x1fc, OBJ_PALETTE_8 | 0x23c,
    0xfd, 0x6, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame36[] = {
    6,
    0xeb, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x207,
    0xf9, 0x1f8, OBJ_PALETTE_8 | 0x23c,
    0xf5, 0x1, OBJ_PALETTE_8 | 0x23c,
    0x1, 0x1fc, OBJ_PALETTE_8 | 0x23c,
    0xfd, 0x6, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame37[] = {
    6,
    0xeb, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x207,
    0xf9, 0x1f8, OBJ_PALETTE_8 | 0x23c,
    0xf5, 0x1, OBJ_PALETTE_8 | 0x23c,
    0x1, 0x1fc, OBJ_PALETTE_8 | 0x23c,
    0xfd, 0x6, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame38[] = {
    6,
    0xeb, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x207,
    0xf9, 0x1f8, OBJ_PALETTE_8 | 0x23c,
    0xf5, 0x1, OBJ_PALETTE_8 | 0x23c,
    0x1, 0x1fc, OBJ_PALETTE_8 | 0x23c,
    0xfd, 0x6, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_Y_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x219
};

static const u16 sElectricWireOam_Frame39[] = {
    6,
    0xeb, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x207,
    0xf4, 0x0, OBJ_PALETTE_8 | 0x21c,
    0xfa, 0x1f6, OBJ_PALETTE_8 | 0x21c,
    0x4, 0x1fd, OBJ_PALETTE_8 | 0x21c,
    0xfd, 0x9, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame40[] = {
    6,
    0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x237,
    0xf4, 0x0, OBJ_PALETTE_8 | 0x21c,
    0xfa, 0x1f6, OBJ_PALETTE_8 | 0x21c,
    0x4, 0x1fd, OBJ_PALETTE_8 | 0x21c,
    0xfd, 0x9, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame41[] = {
    6,
    0xf6, OBJ_Y_FLIP | 0x7, OBJ_PALETTE_8 | 0x237,
    0xf4, 0x0, OBJ_PALETTE_8 | 0x21c,
    0xfa, 0x1f6, OBJ_PALETTE_8 | 0x21c,
    0x4, 0x1fd, OBJ_PALETTE_8 | 0x21c,
    0xfd, 0x9, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x7, OBJ_Y_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x239
};

static const u16 sElectricWireOam_Frame42[] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xf4, 0x0, OBJ_PALETTE_8 | 0x21c,
    0xfa, 0x1f6, OBJ_PALETTE_8 | 0x21c,
    0x4, 0x1fd, OBJ_PALETTE_8 | 0x21c,
    0xfd, 0x9, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame43[] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xf3, 0x1, OBJ_PALETTE_8 | 0x21d,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x21d,
    0xfd, 0xb, OBJ_PALETTE_8 | 0x21d,
    0x7, 0x1fe, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame44[] = {
    6,
    0xee, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xf3, 0x1, OBJ_PALETTE_8 | 0x21d,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x21d,
    0xfd, 0xb, OBJ_PALETTE_8 | 0x21d,
    0x7, 0x1fe, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWireOam_Frame45[] = {
    7,
    0xee, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x200,
    0xf3, 0x1, OBJ_PALETTE_8 | 0x21d,
    0xf9, 0x1f5, OBJ_PALETTE_8 | 0x21d,
    0xfd, 0xb, OBJ_PALETTE_8 | 0x21d,
    0x7, 0x1fe, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f9, OBJ_PALETTE_8 | 0x239,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f9, OBJ_PALETTE_8 | 0x217
};

static const u16 sElectricWaterOam_Frame0[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x20, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x40, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x60, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x180, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1a0, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1c0, OBJ_PALETTE_8 | 0x268,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_8 | 0x26c
};

static const u16 sElectricWaterOam_Frame1[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x20, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x40, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x60, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x180, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1a0, OBJ_PALETTE_8 | 0x268,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1c0, OBJ_PALETTE_8 | 0x26c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_8 | 0x260
};

static const u16 sElectricWaterOam_Frame2[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x20, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x40, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x60, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x180, OBJ_PALETTE_8 | 0x268,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1a0, OBJ_PALETTE_8 | 0x26c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1c0, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_8 | 0x264
};

static const u16 sElectricWaterOam_Frame3[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x20, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x40, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x60, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x180, OBJ_PALETTE_8 | 0x26c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1a0, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1c0, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_8 | 0x268
};

static const u16 sElectricWaterOam_Frame4[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x180, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1a0, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1c0, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x20, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x40, OBJ_PALETTE_8 | 0x268,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x60, OBJ_PALETTE_8 | 0x26c
};

static const u16 sElectricWaterOam_Frame5[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x180, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1a0, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1c0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x20, OBJ_PALETTE_8 | 0x268,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x40, OBJ_PALETTE_8 | 0x26c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x60, OBJ_PALETTE_8 | 0x260
};

static const u16 sElectricWaterOam_Frame6[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x180, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1a0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1c0, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_8 | 0x268,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x20, OBJ_PALETTE_8 | 0x26c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x40, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x60, OBJ_PALETTE_8 | 0x264
};

static const u16 sElectricWaterOam_Frame7[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x180, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1a0, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1c0, OBJ_PALETTE_8 | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x1e0, OBJ_PALETTE_8 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x0, OBJ_PALETTE_8 | 0x26c,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x20, OBJ_PALETTE_8 | 0x260,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x40, OBJ_PALETTE_8 | 0x264,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x8 | 0x60, OBJ_PALETTE_8 | 0x268
};

static const u16 sElectricWaterDamageOam_Idle_Frame6[] = {
    2,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sElectricWaterDamageOam_Idle_Frame7[] = {
    1,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x203
};

static const u16 sElectricWaterDamageOam_Idle_Frame8[] = {
    2,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x205,
    0xf4, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x207
};

static const u16 sElectricWaterDamageOam_Idle_Frame9[] = {
    3,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xde, 0x0, OBJ_PALETTE_8 | 0x20a,
    0xe6, 0x1f8, OBJ_PALETTE_8 | 0x229
};

static const u16 sElectricWaterDamageOam_Idle_Frame10[] = {
    4,
    0xfa, 0x1ff, OBJ_PALETTE_8 | 0x22e,
    0xf1, 0x1fb, OBJ_PALETTE_8 | 0x20e,
    0xe7, 0x1f8, OBJ_PALETTE_8 | 0x22d,
    0xe3, 0x1, OBJ_PALETTE_8 | 0x20d
};

static const u16 sElectricWaterDamageOam_Idle_Frame11[] = {
    13,
    0xee, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x212,
    0xf7, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x235,
    0xf3, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x214,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x230,
    0xeb, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x214,
    0xed, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x211,
    0xdc, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x233,
    0xe2, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x231,
    0xe1, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x211,
    0xed, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x22f,
    0xe6, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x20f,
    0xe2, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x210,
    0xf5, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x233
};

static const u16 sElectricWaterDamageOam_Idle_Frame12[] = {
    5,
    0xf1, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x235,
    0xeb, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x236,
    0xf0, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x213,
    0xe9, 0x1f4, OBJ_PALETTE_8 | 0x214,
    0xe0, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x214
};

const struct FrameData sElectricWaterDamageOam_Idle[14] = {
    [0] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame8,
        .timer = 6
    },
    [9] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame9,
        .timer = 6
    },
    [10] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame10,
        .timer = 6
    },
    [11] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame11,
        .timer = 6
    },
    [12] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame12,
        .timer = 6
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sElectricWaterDamageOam_Stopping[10] = {
    [0] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sElectricWaterDamageOam_Idle_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sElectricWaterDamageOam_Stopping_Frame6,
        .timer = 6
    },
    [7] = {
        .pFrame = sElectricWaterDamageOam_Stopping_Frame7,
        .timer = 6
    },
    [8] = {
        .pFrame = sElectricWaterDamageOam_Stopping_Frame8,
        .timer = 10
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sElectricWireOam[47] = {
    [0] = {
        .pFrame = sElectricWireOam_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sElectricWireOam_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sElectricWireOam_Frame2,
        .timer = 1
    },
    [3] = {
        .pFrame = sElectricWireOam_Frame3,
        .timer = 1
    },
    [4] = {
        .pFrame = sElectricWireOam_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sElectricWireOam_Frame5,
        .timer = 1
    },
    [6] = {
        .pFrame = sElectricWireOam_Frame6,
        .timer = 1
    },
    [7] = {
        .pFrame = sElectricWireOam_Frame7,
        .timer = 1
    },
    [8] = {
        .pFrame = sElectricWireOam_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sElectricWireOam_Frame9,
        .timer = 1
    },
    [10] = {
        .pFrame = sElectricWireOam_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sElectricWireOam_Frame11,
        .timer = 1
    },
    [12] = {
        .pFrame = sElectricWireOam_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sElectricWireOam_Frame13,
        .timer = 1
    },
    [14] = {
        .pFrame = sElectricWireOam_Frame14,
        .timer = 1
    },
    [15] = {
        .pFrame = sElectricWireOam_Frame15,
        .timer = 1
    },
    [16] = {
        .pFrame = sElectricWireOam_Frame16,
        .timer = 1
    },
    [17] = {
        .pFrame = sElectricWireOam_Frame17,
        .timer = 1
    },
    [18] = {
        .pFrame = sElectricWireOam_Frame18,
        .timer = 1
    },
    [19] = {
        .pFrame = sElectricWireOam_Frame19,
        .timer = 1
    },
    [20] = {
        .pFrame = sElectricWireOam_Frame20,
        .timer = 1
    },
    [21] = {
        .pFrame = sElectricWireOam_Frame21,
        .timer = 1
    },
    [22] = {
        .pFrame = sElectricWireOam_Frame22,
        .timer = 1
    },
    [23] = {
        .pFrame = sElectricWireOam_Frame23,
        .timer = 1
    },
    [24] = {
        .pFrame = sElectricWireOam_Frame24,
        .timer = 1
    },
    [25] = {
        .pFrame = sElectricWireOam_Frame25,
        .timer = 1
    },
    [26] = {
        .pFrame = sElectricWireOam_Frame26,
        .timer = 1
    },
    [27] = {
        .pFrame = sElectricWireOam_Frame27,
        .timer = 1
    },
    [28] = {
        .pFrame = sElectricWireOam_Frame28,
        .timer = 1
    },
    [29] = {
        .pFrame = sElectricWireOam_Frame29,
        .timer = 1
    },
    [30] = {
        .pFrame = sElectricWireOam_Frame30,
        .timer = 1
    },
    [31] = {
        .pFrame = sElectricWireOam_Frame31,
        .timer = 1
    },
    [32] = {
        .pFrame = sElectricWireOam_Frame32,
        .timer = 1
    },
    [33] = {
        .pFrame = sElectricWireOam_Frame33,
        .timer = 1
    },
    [34] = {
        .pFrame = sElectricWireOam_Frame34,
        .timer = 1
    },
    [35] = {
        .pFrame = sElectricWireOam_Frame35,
        .timer = 1
    },
    [36] = {
        .pFrame = sElectricWireOam_Frame36,
        .timer = 1
    },
    [37] = {
        .pFrame = sElectricWireOam_Frame37,
        .timer = 1
    },
    [38] = {
        .pFrame = sElectricWireOam_Frame38,
        .timer = 1
    },
    [39] = {
        .pFrame = sElectricWireOam_Frame39,
        .timer = 1
    },
    [40] = {
        .pFrame = sElectricWireOam_Frame40,
        .timer = 1
    },
    [41] = {
        .pFrame = sElectricWireOam_Frame41,
        .timer = 1
    },
    [42] = {
        .pFrame = sElectricWireOam_Frame42,
        .timer = 1
    },
    [43] = {
        .pFrame = sElectricWireOam_Frame43,
        .timer = 1
    },
    [44] = {
        .pFrame = sElectricWireOam_Frame44,
        .timer = 1
    },
    [45] = {
        .pFrame = sElectricWireOam_Frame45,
        .timer = 1
    },
    [46] = FRAME_DATA_TERMINATOR
};

const struct FrameData sElectricWaterOam[9] = {
    [0] = {
        .pFrame = sElectricWaterOam_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sElectricWaterOam_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sElectricWaterOam_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sElectricWaterOam_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sElectricWaterOam_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sElectricWaterOam_Frame5,
        .timer = 3
    },
    [6] = {
        .pFrame = sElectricWaterOam_Frame6,
        .timer = 3
    },
    [7] = {
        .pFrame = sElectricWaterOam_Frame7,
        .timer = 3
    },
    [8] = FRAME_DATA_TERMINATOR
};
