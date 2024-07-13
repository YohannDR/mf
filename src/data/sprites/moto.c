#include "data/sprites/moto.h"
#include "macros.h"

const u32 sMotoGfx[1536] = INCBIN_U32("data/sprites/moto.gfx");
const u16 sMotoPal[48] = INCBIN_U16("data/sprites/moto.pal");

/*static*/ const u16 sMotoOam_Charging_Frame4[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1e3, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_SPRITE_OAM | 0x227,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1e8, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1e8, OBJ_SPRITE_OAM | 0x24a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Charging_Frame0[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x16 | 0x1e3, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1ec, OBJ_SPRITE_OAM | 0x227,
    0xef, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1e8, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xf7, OBJ_SIZE_32x8 | 0x1e8, OBJ_SPRITE_OAM | 0x24a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Charging_Frame1[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x16 | 0x1e3, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1ec, OBJ_SPRITE_OAM | 0x227,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1e8, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xf7, OBJ_SIZE_32x8 | 0x1e8, OBJ_SPRITE_OAM | 0x24a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Charging_Frame2[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_SIZE_32x16 | 0x1e2, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1eb, OBJ_SPRITE_OAM | 0x227,
    0xf2, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x252,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1e7, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x8 | 0x1e7, OBJ_SPRITE_OAM | 0x24a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x210
};

/*static*/ const u16 sMotoOam_Charging_Frame3[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_SIZE_32x16 | 0x1e1, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ea, OBJ_SPRITE_OAM | 0x227,
    0xf1, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1e6, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x8 | 0x1e6, OBJ_SPRITE_OAM | 0x24a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x210
};

/*static*/ const u16 sMotoOam_Idle_Frame0[OAM_DATA_SIZE(7)] = {
    0x7,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f6, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Idle_Frame1[OAM_DATA_SIZE(8)] = {
    0x8,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f6, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fa, OBJ_SPRITE_OAM | 0x248,
    0xf5, 0x1f2, OBJ_SPRITE_OAM | 0x23c,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Idle_Frame3[OAM_DATA_SIZE(7)] = {
    0x7,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f6, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf7, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Charging_Frame8[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1e1, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ea, OBJ_SPRITE_OAM | 0x227,
    0xf1, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1e6, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1e6, OBJ_SPRITE_OAM | 0x24a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x210
};

/*static*/ const u16 sMotoOam_Charging_Frame9[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1e1, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ea, OBJ_SPRITE_OAM | 0x227,
    0xf1, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1e6, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1e6, OBJ_SPRITE_OAM | 0x24a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x210
};

/*static*/ const u16 sMotoOam_Charging_Frame10[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1e1, OBJ_SPRITE_OAM | 0x203,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ea, OBJ_SPRITE_OAM | 0x227,
    0xf1, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x24e,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1e6, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1e6, OBJ_SPRITE_OAM | 0x24a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x210
};

/*static*/ const u16 sMotoOam_Walking_Frame0[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1e9, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ed, OBJ_SPRITE_OAM | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_SPRITE_OAM | 0x252,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1f1, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x1f1, OBJ_SPRITE_OAM | 0x247,
    0xef, OBJ_SIZE_16x16 | 0x1ef, OBJ_SPRITE_OAM | 0x214
};

/*static*/ const u16 sMotoOam_Walking_Frame1[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    0xee, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Walking_Frame2[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x210
};

/*static*/ const u16 sMotoOam_Walking_Frame3[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1e9, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ed, OBJ_SPRITE_OAM | 0x207,
    0xf2, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1f1, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x1f1, OBJ_SPRITE_OAM | 0x247,
    0xf2, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x212
};

/*static*/ const u16 sMotoOam_Walking_Frame4[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    0xf1, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xee, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Walking_Frame5[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xef, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_TurningAroundFIrstPart_Frame0[OAM_DATA_SIZE(6)] = {
    0x6,
    0xef, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x267,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x8 | 0x1ea, OBJ_SPRITE_OAM | 0x26a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_TurningAroundFIrstPart_Frame1[OAM_DATA_SIZE(6)] = {
    0x6,
    0xf0, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x267,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x1ea, OBJ_SPRITE_OAM | 0x26a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_2ef66a[OAM_DATA_SIZE(7)] = {
    0x7,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f6, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, OBJ_X_FLIP | 0x2, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1fa, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_X_FLIP | 0x1fa, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ee, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | OBJ_SIZE_32x8 | 0x1ee, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_WalkingSlowing_Frame0[OAM_DATA_SIZE(7)] = {
    0x7,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_SPRITE_OAM | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ef, OBJ_SPRITE_OAM | 0x23a,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ec, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe3, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x247,
    0xf3, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x214
};

/*static*/ const u16 sMotoOam_WalkingSlowing_Frame1[OAM_DATA_SIZE(7)] = {
    0x7,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_SPRITE_OAM | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ef, OBJ_SPRITE_OAM | 0x23a,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xf3, OBJ_SIZE_16x16 | 0x1f1, OBJ_SPRITE_OAM | 0x214
};

/*static*/ const u16 sMotoOam_2ef6ee[OAM_DATA_SIZE(8)] = {
    0x8,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f6, OBJ_SPRITE_OAM | 0x256,
    0xed, 0x1f2, OBJ_SPRITE_OAM | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fa, OBJ_SPRITE_OAM | 0x248,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_2ef720[OAM_DATA_SIZE(8)] = {
    0x8,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f6, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f6, OBJ_SPRITE_OAM | 0x256,
    0xef, 0x1f2, OBJ_SPRITE_OAM | 0x25c,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf7, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_Falling_Frame0[OAM_DATA_SIZE(7)] = {
    0x7,
    OBJ_SHAPE_HORIZONTAL | 0xe3, OBJ_SIZE_32x16 | 0x1eb, OBJ_SPRITE_OAM | 0x287,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1ee, OBJ_SPRITE_OAM | 0x28b,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1f3, OBJ_SPRITE_OAM | 0x280,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f3, OBJ_SPRITE_OAM | 0x27c,
    0xf4, 0x3, OBJ_SPRITE_OAM | 0x249,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x210
};

/*static*/ const u16 sMotoOam_Falling_Frame1[OAM_DATA_SIZE(8)] = {
    0x8,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x287,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ed, OBJ_SPRITE_OAM | 0x28b,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0xf2, 0x1f7, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x280,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f2, OBJ_SPRITE_OAM | 0x27c,
    0xf5, 0x2, OBJ_SPRITE_OAM | 0x249,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_WalkingCharged_Frame0[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ec, OBJ_SPRITE_OAM | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_SPRITE_OAM | 0x252,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x1ee, OBJ_SPRITE_OAM | 0x214
};

/*static*/ const u16 sMotoOam_WalkingCharged_Frame1[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    0xee, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_WalkingCharged_Frame2[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1e9, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ed, OBJ_SPRITE_OAM | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x210
};

/*static*/ const u16 sMotoOam_WalkingCharged_Frame3[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ec, OBJ_SPRITE_OAM | 0x207,
    0xf2, OBJ_SIZE_16x16 | 0x1f1, OBJ_SPRITE_OAM | 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x247,
    0xf2, OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x212
};

/*static*/ const u16 sMotoOam_WalkingCharged_Frame4[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1ea, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ee, OBJ_SPRITE_OAM | 0x207,
    0xf1, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xee, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoOam_WalkingCharged_Frame5[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_SIZE_32x16 | 0x1e9, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1ed, OBJ_SPRITE_OAM | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_SIZE_32x16 | 0x1f2, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f2, OBJ_SPRITE_OAM | 0x247,
    0xef, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x216
};

/*static*/ const u16 sMotoFrontOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x28d
};


const struct FrameData sMotoOam_Idle[5] = {
    [0] = {
        .pFrame = sMotoOam_Idle_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sMotoOam_Idle_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sMotoOam_Idle_Frame0,
        .timer = 7
    },
    [3] = {
        .pFrame = sMotoOam_Idle_Frame3,
        .timer = 7
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMotoOam_Walking[7] = {
    [0] = {
        .pFrame = sMotoOam_Walking_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sMotoOam_Walking_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sMotoOam_Walking_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sMotoOam_Walking_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sMotoOam_Walking_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sMotoOam_Walking_Frame5,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMotoOam_TurningAroundFirstPart[3] = {
    [0] = {
        .pFrame = sMotoOam_TurningAroundFIrstPart_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sMotoOam_TurningAroundFIrstPart_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMotoOam_TurningAroundSecondPart[3] = {
    [0] = {
        .pFrame = sMotoOam_TurningAroundFIrstPart_Frame1,
        .timer = 3
    },
    [1] = {
        .pFrame = sMotoOam_TurningAroundFIrstPart_Frame0,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMotoOam_WalkingSlowing[3] = {
    [0] = {
        .pFrame = sMotoOam_WalkingSlowing_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sMotoOam_WalkingSlowing_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMotoOam_Falling[3] = {
    [0] = {
        .pFrame = sMotoOam_Falling_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sMotoOam_Falling_Frame1,
        .timer = UCHAR_MAX
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMotoOam_Charging[14] = {
    [0] = {
        .pFrame = sMotoOam_Charging_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sMotoOam_Charging_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sMotoOam_Charging_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sMotoOam_Charging_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sMotoOam_Charging_Frame4,
        .timer = 1
    },
    [5] = {
        .pFrame = sMotoOam_Charging_Frame0,
        .timer = 3
    },
    [6] = {
        .pFrame = sMotoOam_Charging_Frame1,
        .timer = 3
    },
    [7] = {
        .pFrame = sMotoOam_Charging_Frame2,
        .timer = 4
    },
    [8] = {
        .pFrame = sMotoOam_Charging_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sMotoOam_Charging_Frame9,
        .timer = 1
    },
    [10] = {
        .pFrame = sMotoOam_Charging_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sMotoOam_Charging_Frame9,
        .timer = 5
    },
    [12] = {
        .pFrame = sMotoOam_Charging_Frame4,
        .timer = 2
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMotoOam_WalkingCharged[7] = {
    [0] = {
        .pFrame = sMotoOam_WalkingCharged_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sMotoOam_WalkingCharged_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sMotoOam_WalkingCharged_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sMotoOam_WalkingCharged_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sMotoOam_WalkingCharged_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sMotoOam_WalkingCharged_Frame5,
        .timer = 3
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sMotoFrontOam_Idle[2] = {
    [0] = {
        .pFrame = sMotoFrontOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

/*static*/ const u8 sBlob_2efa14_35dd74[] = INCBIN_U8("data/Blob_2efa14_35dd74.bin");
