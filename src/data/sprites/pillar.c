#include "data/sprites/pillar.h"

const u32 sPillarGfx[512 * 1] = INCBIN_U32("data/sprites/pillar.gfx");
const u16 sPillarPal[16 * 1] = INCBIN_U16("data/sprites/pillar.pal");

static const u16 sPillarOam_37a984_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sPillarOam_37a984_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sPillarOam_37a984_Frame4[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sPillarOam_37a7b4_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame1[] = {
    2,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x208
};

static const u16 sPillarOam_37a7b4_Frame2[] = {
    2,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20a
};

static const u16 sPillarOam_37a7b4_Frame3[] = {
    2,
    0xea, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20c
};

static const u16 sPillarOam_37a7b4_Frame4[] = {
    2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame5[] = {
    2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208
};

static const u16 sPillarOam_37a7b4_Frame6[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame7[] = {
    2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame8[] = {
    2,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame9[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xde, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame10[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame11[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xda, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xea, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame12[] = {
    3,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame13[] = {
    3,
    0xd6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame14[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xd4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame15[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xd2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame16[] = {
    3,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame17[] = {
    4,
    0xce, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xde, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame18[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xcc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame19[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xca, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xda, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xea, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame20[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame21[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xc6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xd6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame22[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xc4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xd4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame23[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xc2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xd2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a7b4_Frame24[] = {
    4,
    0xc0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sPillarOam_37a94c_Frame0[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xc0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sPillarOam_37a94c_Frame1[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sPillarOam_37a94c_Frame4[] = {
    4,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xc0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sPillarOam_37ab8c_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212
};

static const u16 sPillarOam_37ab8c_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x214
};

static const u16 sPillarOam_37ab8c_Frame4[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x216
};

static const u16 sPillarOam_37a9bc_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210
};

static const u16 sPillarOam_37a9bc_Frame1[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf8, 0xa, OBJ_PALETTE_8 | 0x211
};

static const u16 sPillarOam_37a9bc_Frame2[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xf8, 0xc, OBJ_PALETTE_8 | 0x217
};

static const u16 sPillarOam_37a9bc_Frame3[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xf8, 0xe, OBJ_PALETTE_8 | 0x217
};

static const u16 sPillarOam_37a9bc_Frame4[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x210
};

static const u16 sPillarOam_37a9bc_Frame5[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0xa, OBJ_PALETTE_8 | 0x210
};

static const u16 sPillarOam_37a9bc_Frame6[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x212
};

static const u16 sPillarOam_37a9bc_Frame7[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x212
};

static const u16 sPillarOam_37a9bc_Frame8[] = {
    2,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x214
};

static const u16 sPillarOam_37a9bc_Frame9[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1a, OBJ_PALETTE_8 | 0x215
};

static const u16 sPillarOam_37a9bc_Frame10[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1c, OBJ_PALETTE_8 | 0x213
};

static const u16 sPillarOam_37a9bc_Frame11[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1e, OBJ_PALETTE_8 | 0x213
};

static const u16 sPillarOam_37a9bc_Frame12[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x20, OBJ_PALETTE_8 | 0x211
};

static const u16 sPillarOam_37a9bc_Frame13[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x1a, OBJ_PALETTE_8 | 0x210
};

static const u16 sPillarOam_37a9bc_Frame14[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x216,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x216,
    0xf8, OBJ_SIZE_16x16 | 0x1c, OBJ_PALETTE_8 | 0x216
};

static const u16 sPillarOam_37a9bc_Frame15[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x216,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x216,
    0xf8, OBJ_SIZE_16x16 | 0x1e, OBJ_PALETTE_8 | 0x216
};

static const u16 sPillarOam_37a9bc_Frame16[] = {
    3,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x210
};

static const u16 sPillarOam_37a9bc_Frame17[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x2a, OBJ_PALETTE_8 | 0x211
};

static const u16 sPillarOam_37a9bc_Frame18[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x2c, OBJ_PALETTE_8 | 0x213
};

static const u16 sPillarOam_37a9bc_Frame19[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x2e, OBJ_PALETTE_8 | 0x213
};

static const u16 sPillarOam_37a9bc_Frame20[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x30, OBJ_PALETTE_8 | 0x213
};

static const u16 sPillarOam_37a9bc_Frame21[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x2a, OBJ_PALETTE_8 | 0x214
};

static const u16 sPillarOam_37a9bc_Frame22[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x2c, OBJ_PALETTE_8 | 0x214
};

static const u16 sPillarOam_37a9bc_Frame23[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x2e, OBJ_PALETTE_8 | 0x212
};

static const u16 sPillarOam_37a9bc_Frame24[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x210,
    0xf8, OBJ_SIZE_16x16 | 0x30, OBJ_PALETTE_8 | 0x210
};

static const u16 sPillarOam_37ab54_Frame0[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x212,
    0xf8, OBJ_SIZE_16x16 | 0x30, OBJ_PALETTE_8 | 0x212
};

static const u16 sPillarOam_37ab54_Frame1[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x214,
    0xf8, OBJ_SIZE_16x16 | 0x30, OBJ_PALETTE_8 | 0x214
};

static const u16 sPillarOam_37ab54_Frame4[] = {
    4,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x216,
    0xf8, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x216,
    0xf8, OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x216,
    0xf8, OBJ_SIZE_16x16 | 0x30, OBJ_PALETTE_8 | 0x216
};

const struct FrameData sPillarOam_37a7b4[26] = {
    [0] = {
        .pFrame = sPillarOam_37a7b4_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sPillarOam_37a7b4_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sPillarOam_37a7b4_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sPillarOam_37a7b4_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sPillarOam_37a7b4_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sPillarOam_37a7b4_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sPillarOam_37a7b4_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sPillarOam_37a7b4_Frame7,
        .timer = 2
    },
    [8] = {
        .pFrame = sPillarOam_37a7b4_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sPillarOam_37a7b4_Frame9,
        .timer = 2
    },
    [10] = {
        .pFrame = sPillarOam_37a7b4_Frame10,
        .timer = 2
    },
    [11] = {
        .pFrame = sPillarOam_37a7b4_Frame11,
        .timer = 2
    },
    [12] = {
        .pFrame = sPillarOam_37a7b4_Frame12,
        .timer = 2
    },
    [13] = {
        .pFrame = sPillarOam_37a7b4_Frame13,
        .timer = 2
    },
    [14] = {
        .pFrame = sPillarOam_37a7b4_Frame14,
        .timer = 2
    },
    [15] = {
        .pFrame = sPillarOam_37a7b4_Frame15,
        .timer = 2
    },
    [16] = {
        .pFrame = sPillarOam_37a7b4_Frame16,
        .timer = 2
    },
    [17] = {
        .pFrame = sPillarOam_37a7b4_Frame17,
        .timer = 2
    },
    [18] = {
        .pFrame = sPillarOam_37a7b4_Frame18,
        .timer = 2
    },
    [19] = {
        .pFrame = sPillarOam_37a7b4_Frame19,
        .timer = 2
    },
    [20] = {
        .pFrame = sPillarOam_37a7b4_Frame20,
        .timer = 2
    },
    [21] = {
        .pFrame = sPillarOam_37a7b4_Frame21,
        .timer = 2
    },
    [22] = {
        .pFrame = sPillarOam_37a7b4_Frame22,
        .timer = 2
    },
    [23] = {
        .pFrame = sPillarOam_37a7b4_Frame23,
        .timer = 2
    },
    [24] = {
        .pFrame = sPillarOam_37a7b4_Frame24,
        .timer = 2
    },
    [25] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPillarOam_37a884[25] = {
    [0] = {
        .pFrame = sPillarOam_37a7b4_Frame24,
        .timer = 2
    },
    [1] = {
        .pFrame = sPillarOam_37a7b4_Frame23,
        .timer = 2
    },
    [2] = {
        .pFrame = sPillarOam_37a7b4_Frame22,
        .timer = 2
    },
    [3] = {
        .pFrame = sPillarOam_37a7b4_Frame21,
        .timer = 2
    },
    [4] = {
        .pFrame = sPillarOam_37a7b4_Frame20,
        .timer = 2
    },
    [5] = {
        .pFrame = sPillarOam_37a7b4_Frame19,
        .timer = 2
    },
    [6] = {
        .pFrame = sPillarOam_37a7b4_Frame18,
        .timer = 2
    },
    [7] = {
        .pFrame = sPillarOam_37a7b4_Frame17,
        .timer = 2
    },
    [8] = {
        .pFrame = sPillarOam_37a7b4_Frame16,
        .timer = 2
    },
    [9] = {
        .pFrame = sPillarOam_37a7b4_Frame15,
        .timer = 2
    },
    [10] = {
        .pFrame = sPillarOam_37a7b4_Frame14,
        .timer = 2
    },
    [11] = {
        .pFrame = sPillarOam_37a7b4_Frame13,
        .timer = 2
    },
    [12] = {
        .pFrame = sPillarOam_37a7b4_Frame12,
        .timer = 2
    },
    [13] = {
        .pFrame = sPillarOam_37a7b4_Frame11,
        .timer = 2
    },
    [14] = {
        .pFrame = sPillarOam_37a7b4_Frame10,
        .timer = 2
    },
    [15] = {
        .pFrame = sPillarOam_37a7b4_Frame9,
        .timer = 2
    },
    [16] = {
        .pFrame = sPillarOam_37a7b4_Frame8,
        .timer = 2
    },
    [17] = {
        .pFrame = sPillarOam_37a7b4_Frame7,
        .timer = 2
    },
    [18] = {
        .pFrame = sPillarOam_37a7b4_Frame6,
        .timer = 2
    },
    [19] = {
        .pFrame = sPillarOam_37a7b4_Frame5,
        .timer = 2
    },
    [20] = {
        .pFrame = sPillarOam_37a7b4_Frame4,
        .timer = 2
    },
    [21] = {
        .pFrame = sPillarOam_37a7b4_Frame3,
        .timer = 2
    },
    [22] = {
        .pFrame = sPillarOam_37a7b4_Frame2,
        .timer = 2
    },
    [23] = {
        .pFrame = sPillarOam_37a7b4_Frame1,
        .timer = 2
    },
    [24] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPillarOam_37a94c[7] = {
    [0] = {
        .pFrame = sPillarOam_37a94c_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sPillarOam_37a94c_Frame1,
        .timer = 20
    },
    [2] = {
        .pFrame = sPillarOam_37a94c_Frame0,
        .timer = 14
    },
    [3] = {
        .pFrame = sPillarOam_37a7b4_Frame24,
        .timer = 14
    },
    [4] = {
        .pFrame = sPillarOam_37a94c_Frame4,
        .timer = 50
    },
    [5] = {
        .pFrame = sPillarOam_37a7b4_Frame24,
        .timer = 14
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPillarOam_37a984[7] = {
    [0] = {
        .pFrame = sPillarOam_37a984_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sPillarOam_37a984_Frame1,
        .timer = 20
    },
    [2] = {
        .pFrame = sPillarOam_37a984_Frame0,
        .timer = 14
    },
    [3] = {
        .pFrame = sPillarOam_37a7b4_Frame0,
        .timer = 14
    },
    [4] = {
        .pFrame = sPillarOam_37a984_Frame4,
        .timer = 50
    },
    [5] = {
        .pFrame = sPillarOam_37a7b4_Frame0,
        .timer = 14
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPillarOam_37a9bc[26] = {
    [0] = {
        .pFrame = sPillarOam_37a9bc_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sPillarOam_37a9bc_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sPillarOam_37a9bc_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sPillarOam_37a9bc_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sPillarOam_37a9bc_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sPillarOam_37a9bc_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sPillarOam_37a9bc_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sPillarOam_37a9bc_Frame7,
        .timer = 2
    },
    [8] = {
        .pFrame = sPillarOam_37a9bc_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sPillarOam_37a9bc_Frame9,
        .timer = 2
    },
    [10] = {
        .pFrame = sPillarOam_37a9bc_Frame10,
        .timer = 2
    },
    [11] = {
        .pFrame = sPillarOam_37a9bc_Frame11,
        .timer = 2
    },
    [12] = {
        .pFrame = sPillarOam_37a9bc_Frame12,
        .timer = 2
    },
    [13] = {
        .pFrame = sPillarOam_37a9bc_Frame13,
        .timer = 2
    },
    [14] = {
        .pFrame = sPillarOam_37a9bc_Frame14,
        .timer = 2
    },
    [15] = {
        .pFrame = sPillarOam_37a9bc_Frame15,
        .timer = 2
    },
    [16] = {
        .pFrame = sPillarOam_37a9bc_Frame16,
        .timer = 2
    },
    [17] = {
        .pFrame = sPillarOam_37a9bc_Frame17,
        .timer = 2
    },
    [18] = {
        .pFrame = sPillarOam_37a9bc_Frame18,
        .timer = 2
    },
    [19] = {
        .pFrame = sPillarOam_37a9bc_Frame19,
        .timer = 2
    },
    [20] = {
        .pFrame = sPillarOam_37a9bc_Frame20,
        .timer = 2
    },
    [21] = {
        .pFrame = sPillarOam_37a9bc_Frame21,
        .timer = 2
    },
    [22] = {
        .pFrame = sPillarOam_37a9bc_Frame22,
        .timer = 2
    },
    [23] = {
        .pFrame = sPillarOam_37a9bc_Frame23,
        .timer = 2
    },
    [24] = {
        .pFrame = sPillarOam_37a9bc_Frame24,
        .timer = 2
    },
    [25] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPillarOam_37aa8c[25] = {
    [0] = {
        .pFrame = sPillarOam_37a9bc_Frame24,
        .timer = 2
    },
    [1] = {
        .pFrame = sPillarOam_37a9bc_Frame23,
        .timer = 2
    },
    [2] = {
        .pFrame = sPillarOam_37a9bc_Frame22,
        .timer = 2
    },
    [3] = {
        .pFrame = sPillarOam_37a9bc_Frame21,
        .timer = 2
    },
    [4] = {
        .pFrame = sPillarOam_37a9bc_Frame20,
        .timer = 2
    },
    [5] = {
        .pFrame = sPillarOam_37a9bc_Frame19,
        .timer = 2
    },
    [6] = {
        .pFrame = sPillarOam_37a9bc_Frame18,
        .timer = 2
    },
    [7] = {
        .pFrame = sPillarOam_37a9bc_Frame17,
        .timer = 2
    },
    [8] = {
        .pFrame = sPillarOam_37a9bc_Frame16,
        .timer = 2
    },
    [9] = {
        .pFrame = sPillarOam_37a9bc_Frame15,
        .timer = 2
    },
    [10] = {
        .pFrame = sPillarOam_37a9bc_Frame14,
        .timer = 2
    },
    [11] = {
        .pFrame = sPillarOam_37a9bc_Frame13,
        .timer = 2
    },
    [12] = {
        .pFrame = sPillarOam_37a9bc_Frame12,
        .timer = 2
    },
    [13] = {
        .pFrame = sPillarOam_37a9bc_Frame11,
        .timer = 2
    },
    [14] = {
        .pFrame = sPillarOam_37a9bc_Frame10,
        .timer = 2
    },
    [15] = {
        .pFrame = sPillarOam_37a9bc_Frame9,
        .timer = 2
    },
    [16] = {
        .pFrame = sPillarOam_37a9bc_Frame8,
        .timer = 2
    },
    [17] = {
        .pFrame = sPillarOam_37a9bc_Frame7,
        .timer = 2
    },
    [18] = {
        .pFrame = sPillarOam_37a9bc_Frame6,
        .timer = 2
    },
    [19] = {
        .pFrame = sPillarOam_37a9bc_Frame5,
        .timer = 2
    },
    [20] = {
        .pFrame = sPillarOam_37a9bc_Frame4,
        .timer = 2
    },
    [21] = {
        .pFrame = sPillarOam_37a9bc_Frame3,
        .timer = 2
    },
    [22] = {
        .pFrame = sPillarOam_37a9bc_Frame2,
        .timer = 2
    },
    [23] = {
        .pFrame = sPillarOam_37a9bc_Frame1,
        .timer = 2
    },
    [24] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPillarOam_37ab54[7] = {
    [0] = {
        .pFrame = sPillarOam_37ab54_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sPillarOam_37ab54_Frame1,
        .timer = 20
    },
    [2] = {
        .pFrame = sPillarOam_37ab54_Frame0,
        .timer = 14
    },
    [3] = {
        .pFrame = sPillarOam_37a9bc_Frame24,
        .timer = 14
    },
    [4] = {
        .pFrame = sPillarOam_37ab54_Frame4,
        .timer = 50
    },
    [5] = {
        .pFrame = sPillarOam_37a9bc_Frame24,
        .timer = 14
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sPillarOam_37ab8c[7] = {
    [0] = {
        .pFrame = sPillarOam_37ab8c_Frame0,
        .timer = 14
    },
    [1] = {
        .pFrame = sPillarOam_37ab8c_Frame1,
        .timer = 20
    },
    [2] = {
        .pFrame = sPillarOam_37ab8c_Frame0,
        .timer = 14
    },
    [3] = {
        .pFrame = sPillarOam_37a9bc_Frame0,
        .timer = 14
    },
    [4] = {
        .pFrame = sPillarOam_37ab8c_Frame4,
        .timer = 50
    },
    [5] = {
        .pFrame = sPillarOam_37a9bc_Frame0,
        .timer = 14
    },
    [6] = FRAME_DATA_TERMINATOR
};
