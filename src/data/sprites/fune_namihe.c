#include "data/sprites/fune_namihe.h"

const u32 sFuneNamiheGfx[2 * 512] = INCBIN_U32("data/sprites/fune_namihe.gfx");
const u16 sFuneNamihePal[2 * 16] = INCBIN_U16("data/sprites/fune_namihe.pal");

static const u16 sFuneOam_341568_Frame0[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0xff, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xff, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFuneOam_341568_Frame1[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFuneOam_341568_Frame2[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x1, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x1, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFuneOam_3415b0_Frame0[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFuneOam_3415b0_Frame1[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x1, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x1, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFuneOam_3415b0_Frame2[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x3, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x3, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFuneOam_3415b0_Frame3[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x4, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200
};

static const u16 sFuneOam_3415f8_Frame4[] = {
    8,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xff, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x6, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x6, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame5[] = {
    9,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xfe, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0xfd, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xfd, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame6[] = {
    10,
    0xed, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xed, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xfd, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xfd, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x4, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x24, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame7[] = {
    11,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xfe, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0xfd, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xfd, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x24, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame8[] = {
    12,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xff, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x6, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x6, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_16x32 | 0x24, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x3c, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame9[] = {
    13,
    0xf1, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x1, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x24, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x3c, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x48, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame10[] = {
    14,
    0xf2, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf2, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x2, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x7, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x13, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x1f, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x2b, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x37, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x43, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x4f, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame11[] = {
    14,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xfe, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x5, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x5, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x14, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x2c, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x38, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x44, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x50, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame12[] = {
    14,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xfe, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x5, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x5, 0x1fd, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x7, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x12, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x1d, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x28, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x33, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x3e, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x48, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame13[] = {
    14,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xff, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x6, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x6, 0x1fc, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x12, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x1c, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x25, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x2e, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x37, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x40, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame14[] = {
    14,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x6, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x6, 0x1fc, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x28, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x38, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame15[] = {
    13,
    0xf1, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x1, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x6, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x6, 0x1fc, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x28, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame16[] = {
    12,
    0xf1, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x1, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x6, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x6, 0x1fc, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x28, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame17[] = {
    11,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0x0, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x4, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1fc, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame18[] = {
    10,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xfe, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x2, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x2, 0x1fc, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame19[] = {
    9,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xfe, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x2, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x2, 0x1fc, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3415f8_Frame20[] = {
    8,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_9 | 0x204,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_9 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_9 | 0x244,
    0xfe, 0x1ff, OBJ_PALETTE_9 | 0x246,
    0x2, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_9 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x2, 0x1fc, OBJ_PALETTE_9 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_9 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_9 | 0x202
};

static const u16 sFuneOam_3416d0_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x21a
};

static const u16 sFuneOam_3416d0_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x21c
};

static const u16 sFuneOam_3416d0_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x21e
};

static const u16 sFuneOam_3416f0_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x253
};

static const u16 sFuneOam_3416f0_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x255
};

static const u16 sFuneOam_3416f0_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x257
};

const struct FrameData sFuneOam_341568[9] = {
    [0] = {
        .pFrame = sFuneOam_341568_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sFuneOam_341568_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sFuneOam_341568_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sFuneOam_341568_Frame1,
        .timer = 16
    },
    [4] = {
        .pFrame = sFuneOam_341568_Frame0,
        .timer = 16
    },
    [5] = {
        .pFrame = sFuneOam_341568_Frame1,
        .timer = 16
    },
    [6] = {
        .pFrame = sFuneOam_341568_Frame2,
        .timer = 16
    },
    [7] = {
        .pFrame = sFuneOam_341568_Frame1,
        .timer = 16
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFuneOam_3415b0[9] = {
    [0] = {
        .pFrame = sFuneOam_3415b0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFuneOam_3415b0_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFuneOam_3415b0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFuneOam_3415b0_Frame3,
        .timer = 40
    },
    [4] = {
        .pFrame = sFuneOam_3415b0_Frame2,
        .timer = 8
    },
    [5] = {
        .pFrame = sFuneOam_3415b0_Frame1,
        .timer = 8
    },
    [6] = {
        .pFrame = sFuneOam_3415b0_Frame0,
        .timer = 8
    },
    [7] = {
        .pFrame = sFuneOam_341568_Frame0,
        .timer = 50
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFuneOam_3415f8[27] = {
    [0] = {
        .pFrame = sFuneOam_3415b0_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFuneOam_3415b0_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFuneOam_3415b0_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFuneOam_3415b0_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sFuneOam_3415f8_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sFuneOam_3415f8_Frame5,
        .timer = 6
    },
    [6] = {
        .pFrame = sFuneOam_3415f8_Frame6,
        .timer = 4
    },
    [7] = {
        .pFrame = sFuneOam_3415f8_Frame7,
        .timer = 4
    },
    [8] = {
        .pFrame = sFuneOam_3415f8_Frame8,
        .timer = 4
    },
    [9] = {
        .pFrame = sFuneOam_3415f8_Frame9,
        .timer = 3
    },
    [10] = {
        .pFrame = sFuneOam_3415f8_Frame10,
        .timer = 20
    },
    [11] = {
        .pFrame = sFuneOam_3415f8_Frame11,
        .timer = 3
    },
    [12] = {
        .pFrame = sFuneOam_3415f8_Frame12,
        .timer = 3
    },
    [13] = {
        .pFrame = sFuneOam_3415f8_Frame13,
        .timer = 3
    },
    [14] = {
        .pFrame = sFuneOam_3415f8_Frame14,
        .timer = 3
    },
    [15] = {
        .pFrame = sFuneOam_3415f8_Frame15,
        .timer = 3
    },
    [16] = {
        .pFrame = sFuneOam_3415f8_Frame16,
        .timer = 2
    },
    [17] = {
        .pFrame = sFuneOam_3415f8_Frame17,
        .timer = 2
    },
    [18] = {
        .pFrame = sFuneOam_3415f8_Frame18,
        .timer = 2
    },
    [19] = {
        .pFrame = sFuneOam_3415f8_Frame19,
        .timer = 2
    },
    [20] = {
        .pFrame = sFuneOam_3415f8_Frame20,
        .timer = 2
    },
    [21] = {
        .pFrame = sFuneOam_3415b0_Frame3,
        .timer = 2
    },
    [22] = {
        .pFrame = sFuneOam_3415b0_Frame2,
        .timer = 2
    },
    [23] = {
        .pFrame = sFuneOam_3415b0_Frame1,
        .timer = 2
    },
    [24] = {
        .pFrame = sFuneOam_3415b0_Frame0,
        .timer = 2
    },
    [25] = {
        .pFrame = sFuneOam_341568_Frame0,
        .timer = 50
    },
    [26] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFuneOam_3416d0[4] = {
    [0] = {
        .pFrame = sFuneOam_3416d0_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sFuneOam_3416d0_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sFuneOam_3416d0_Frame2,
        .timer = 5
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFuneOam_3416f0[4] = {
    [0] = {
        .pFrame = sFuneOam_3416f0_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sFuneOam_3416f0_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sFuneOam_3416f0_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

static const u16 sNamiheOam_341e6c_Frame0[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ef, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341e6c_Frame1[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ef, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x1, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x1, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341e6c_Frame2[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ef, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x2, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x2, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341eb4_Frame0[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ef, OBJ_PALETTE_8 | 0x22f,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341eb4_Frame1[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ef, OBJ_PALETTE_8 | 0x24f,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341eb4_Frame2[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ef, OBJ_PALETTE_8 | 0x26f,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341eb4_Frame3[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341f3c_Frame4[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ef, OBJ_PALETTE_8 | 0x211,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341f3c_Frame5[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ef, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341eb4_Frame4[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x1, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x1, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341eb4_Frame5[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x2, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x2, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341eb4_Frame6[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x4, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341eb4_Frame7[] = {
    7,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x6, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x6, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200
};

static const u16 sNamiheOam_341f3c_Frame12[] = {
    8,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xff, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame13[] = {
    9,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xfe, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0xfe, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xfe, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame14[] = {
    10,
    0xed, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xed, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfd, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xfd, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x7, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x7, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x24, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame15[] = {
    11,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xfe, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0xfe, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xfe, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x24, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame16[] = {
    12,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xff, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_16x32 | 0x24, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x3c, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame17[] = {
    13,
    0xf1, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x1, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x1, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x1, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x24, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x3c, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x48, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame18[] = {
    14,
    0xf2, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf2, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x2, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0xc, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xc, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x7, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x13, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x1f, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x2b, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x37, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x43, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x4f, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame19[] = {
    14,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xfe, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x8, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x14, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x2c, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x38, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x44, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x50, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame20[] = {
    14,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xfe, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x8, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x7, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x12, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x1d, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x28, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x33, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x3e, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x48, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame21[] = {
    14,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xef, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xff, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x12, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x1c, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x25, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x2e, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x37, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x40, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame22[] = {
    14,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0xa, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xa, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x28, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x38, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame23[] = {
    13,
    0xf1, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x1, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0xb, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xb, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x28, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x30, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame24[] = {
    12,
    0xf1, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf1, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x1, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0xb, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xb, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x28, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame25[] = {
    12,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0x0, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0xa, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xa, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame26[] = {
    10,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xfe, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x8, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame27[] = {
    9,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xfe, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x8, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x10, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_341f3c_Frame28[] = {
    8,
    0xee, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20b,
    0xee, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xfe, 0x1ef, OBJ_PALETTE_8 | 0x24b,
    0xfe, 0x1ff, OBJ_PALETTE_8 | 0x24d,
    0x8, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_SIZE_16x32 | 0x0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x8, OBJ_PALETTE_8 | 0x202
};

static const u16 sNamiheOam_342074_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x213
};

static const u16 sNamiheOam_342074_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x215
};

static const u16 sNamiheOam_342074_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x217
};

static const u16 sNamiheOam_342094_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x253
};

static const u16 sNamiheOam_342094_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x255
};

static const u16 sNamiheOam_342094_Frame2[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x257
};

const struct FrameData sNamiheOam_341e6c[9] = {
    [0] = {
        .pFrame = sNamiheOam_341e6c_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sNamiheOam_341e6c_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sNamiheOam_341e6c_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sNamiheOam_341e6c_Frame1,
        .timer = 16
    },
    [4] = {
        .pFrame = sNamiheOam_341e6c_Frame0,
        .timer = 16
    },
    [5] = {
        .pFrame = sNamiheOam_341e6c_Frame1,
        .timer = 16
    },
    [6] = {
        .pFrame = sNamiheOam_341e6c_Frame2,
        .timer = 16
    },
    [7] = {
        .pFrame = sNamiheOam_341e6c_Frame1,
        .timer = 16
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNamiheOam_341eb4[17] = {
    [0] = {
        .pFrame = sNamiheOam_341eb4_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sNamiheOam_341eb4_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sNamiheOam_341eb4_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sNamiheOam_341eb4_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sNamiheOam_341eb4_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sNamiheOam_341eb4_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sNamiheOam_341eb4_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sNamiheOam_341eb4_Frame7,
        .timer = 50
    },
    [8] = {
        .pFrame = sNamiheOam_341eb4_Frame6,
        .timer = 8
    },
    [9] = {
        .pFrame = sNamiheOam_341eb4_Frame5,
        .timer = 8
    },
    [10] = {
        .pFrame = sNamiheOam_341eb4_Frame4,
        .timer = 8
    },
    [11] = {
        .pFrame = sNamiheOam_341eb4_Frame3,
        .timer = 10
    },
    [12] = {
        .pFrame = sNamiheOam_341eb4_Frame2,
        .timer = 4
    },
    [13] = {
        .pFrame = sNamiheOam_341eb4_Frame1,
        .timer = 4
    },
    [14] = {
        .pFrame = sNamiheOam_341eb4_Frame0,
        .timer = 4
    },
    [15] = {
        .pFrame = sNamiheOam_341e6c_Frame0,
        .timer = 50
    },
    [16] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNamiheOam_341f3c[39] = {
    [0] = {
        .pFrame = sNamiheOam_341eb4_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sNamiheOam_341eb4_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sNamiheOam_341eb4_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sNamiheOam_341eb4_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sNamiheOam_341f3c_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sNamiheOam_341f3c_Frame5,
        .timer = 5
    },
    [6] = {
        .pFrame = sNamiheOam_341f3c_Frame4,
        .timer = 6
    },
    [7] = {
        .pFrame = sNamiheOam_341eb4_Frame3,
        .timer = 2
    },
    [8] = {
        .pFrame = sNamiheOam_341eb4_Frame4,
        .timer = 3
    },
    [9] = {
        .pFrame = sNamiheOam_341eb4_Frame5,
        .timer = 3
    },
    [10] = {
        .pFrame = sNamiheOam_341eb4_Frame6,
        .timer = 3
    },
    [11] = {
        .pFrame = sNamiheOam_341eb4_Frame7,
        .timer = 3
    },
    [12] = {
        .pFrame = sNamiheOam_341f3c_Frame12,
        .timer = 6
    },
    [13] = {
        .pFrame = sNamiheOam_341f3c_Frame13,
        .timer = 6
    },
    [14] = {
        .pFrame = sNamiheOam_341f3c_Frame14,
        .timer = 4
    },
    [15] = {
        .pFrame = sNamiheOam_341f3c_Frame15,
        .timer = 4
    },
    [16] = {
        .pFrame = sNamiheOam_341f3c_Frame16,
        .timer = 4
    },
    [17] = {
        .pFrame = sNamiheOam_341f3c_Frame17,
        .timer = 3
    },
    [18] = {
        .pFrame = sNamiheOam_341f3c_Frame18,
        .timer = 20
    },
    [19] = {
        .pFrame = sNamiheOam_341f3c_Frame19,
        .timer = 3
    },
    [20] = {
        .pFrame = sNamiheOam_341f3c_Frame20,
        .timer = 3
    },
    [21] = {
        .pFrame = sNamiheOam_341f3c_Frame21,
        .timer = 3
    },
    [22] = {
        .pFrame = sNamiheOam_341f3c_Frame22,
        .timer = 3
    },
    [23] = {
        .pFrame = sNamiheOam_341f3c_Frame23,
        .timer = 3
    },
    [24] = {
        .pFrame = sNamiheOam_341f3c_Frame24,
        .timer = 2
    },
    [25] = {
        .pFrame = sNamiheOam_341f3c_Frame25,
        .timer = 2
    },
    [26] = {
        .pFrame = sNamiheOam_341f3c_Frame26,
        .timer = 2
    },
    [27] = {
        .pFrame = sNamiheOam_341f3c_Frame27,
        .timer = 2
    },
    [28] = {
        .pFrame = sNamiheOam_341f3c_Frame28,
        .timer = 2
    },
    [29] = {
        .pFrame = sNamiheOam_341eb4_Frame7,
        .timer = 2
    },
    [30] = {
        .pFrame = sNamiheOam_341eb4_Frame6,
        .timer = 2
    },
    [31] = {
        .pFrame = sNamiheOam_341eb4_Frame5,
        .timer = 2
    },
    [32] = {
        .pFrame = sNamiheOam_341eb4_Frame4,
        .timer = 2
    },
    [33] = {
        .pFrame = sNamiheOam_341eb4_Frame3,
        .timer = 4
    },
    [34] = {
        .pFrame = sNamiheOam_341eb4_Frame2,
        .timer = 4
    },
    [35] = {
        .pFrame = sNamiheOam_341eb4_Frame1,
        .timer = 4
    },
    [36] = {
        .pFrame = sNamiheOam_341eb4_Frame0,
        .timer = 4
    },
    [37] = {
        .pFrame = sNamiheOam_341e6c_Frame0,
        .timer = 50
    },
    [38] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNamiheOam_342074[4] = {
    [0] = {
        .pFrame = sNamiheOam_342074_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sNamiheOam_342074_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sNamiheOam_342074_Frame2,
        .timer = 5
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sNamiheOam_342094[4] = {
    [0] = {
        .pFrame = sNamiheOam_342094_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sNamiheOam_342094_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sNamiheOam_342094_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};
