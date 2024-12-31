#include "data/menus/title_screen.h"
#include "macros.h"

const u8 sTitleScreenDebugTextCharactersGfx[768] = INCBIN_U8("data/menus/title_screen/characters.gfx");
const u8 sTitleScreenDebugText[2] = " ";

const u32 sTitleScreenObjectsGfx[] = INCBIN_U32("data/menus/title_screen/objects.gfx.lz");
const u16 sTitleScreenObjectsPal[16 * 16] = INCBIN_U16("data/menus/title_screen/objects.pal");

const u16 sTitleScreen_592d74[16 * 16] = INCBIN_U16("data/menus/title_screen/592d74.pal");
const u16 sTitleScreen_592f74[16 * 16] = INCBIN_U16("data/menus/title_screen/592f74.pal");
const u16 sTitleScreenPressStartPal[16 * 8] = INCBIN_U16("data/menus/title_screen/press_start.pal");

const u32 sTitleScreenLogoGfx[] = INCBIN_U32("data/menus/title_screen/logo.gfx.lz");
const u32 sTitleScreenLogoTileTable[] = INCBIN_U32("data/menus/title_screen/logo.tt.lz");
const u32 sTitleScreen_596884[] = INCBIN_U32("data/menus/title_screen/596884.tt.lz");
const u16 sTitleScreenLogoPal[16 * 8] = INCBIN_U16("data/menus/title_screen/logo.pal");
const u16 sTitleScreen_596e0c[16 * 8] = INCBIN_U16("data/menus/title_screen/596e0c.pal");

static const u16 sTitleScreenOam_Copyright_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1c5, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d4, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f8, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x18, 0xa
};

static const u16 sTitleScreenOam_596f26[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x40,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x44,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x48,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x74,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x78
};

static const u16 sTitleScreenOam_596f46[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, 0x80,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x84,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, 0x88,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, 0x74,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, 0x78
};

static const u16 sTitleScreenOam_596f66[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1e0, 0x8c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x0, 0x90,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1d8, 0x54,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f8, 0x58,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x18, 0x5c
};

static const u16 sTitleScreenOam_Language_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x4c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x50,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x54,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x58,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x5c
};

static const u16 sTitleScreenOam_596fa6[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x1040,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x1044,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x1048,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x74,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x78
};

static const u16 sTitleScreenOam_596fc6[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x104c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x1050,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x54,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x58,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x5c
};

static const u16 sTitleScreenOam_PressStart_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, 0xc0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0xc4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, 0xc8
};

static const u16 sTitleScreenOam_596ffa[OAM_DATA_SIZE(3)] = {
    0x3,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, 0x10c0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x10c4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, 0x10c8
};

static const u16 sTitleScreenOam_59700e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x140,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x144,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x148,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x174,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x178
};

static const u16 sTitleScreenOam_59702e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, 0x180,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x184,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, 0x188,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, 0x174,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, 0x178
};

static const u16 sTitleScreenOam_59704e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x1e0, 0x18c,
    OBJ_SHAPE_HORIZONTAL | 0xff, OBJ_SIZE_32x16 | 0x0, 0x190,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1d8, 0x154,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f8, 0x158,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x18, 0x15c
};

static const u16 sTitleScreenOam_59706e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfd, OBJ_SIZE_32x16 | 0x1e0, 0x14c,
    OBJ_SHAPE_HORIZONTAL | 0xfd, OBJ_SIZE_32x16 | 0x0, 0x150,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x154,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x158,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x15c
};

static const u16 sTitleScreenOam_59708e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x1140,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x1144,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x1148,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x174,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x178
};

static const u16 sTitleScreenOam_5970ae[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfd, OBJ_SIZE_32x16 | 0x1e0, 0x114c,
    OBJ_SHAPE_HORIZONTAL | 0xfd, OBJ_SIZE_32x16 | 0x0, 0x1150,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x154,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x158,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x15c
};

static const u16 sTitleScreenOam_5970ce[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x1c0,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x1c4,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x1c8,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x1f4,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x1f8
};

static const u16 sTitleScreenOam_5970ee[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, 0x208,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, 0x1f4,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, 0x1f8
};

static const u16 sTitleScreenOam_59710e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1e0, 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x0, 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1d8, 0x1d4,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f8, 0x1d8,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x18, 0x1dc
};

static const u16 sTitleScreenOam_59712e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x1cc,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x1d0,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x1d4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x1d8,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x1dc
};

static const u16 sTitleScreenOam_59714e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x11c0,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x11c4,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x11c8,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x1f4,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x1f8
};

static const u16 sTitleScreenOam_59716e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x11cc,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x11d0,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x1d4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x1d8,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x1dc
};

static const u16 sTitleScreenOam_59718e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x248,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x274,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x278
};

static const u16 sTitleScreenOam_5971ae[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, 0x280,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x284,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, 0x288,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, 0x274,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, 0x278
};

static const u16 sTitleScreenOam_5971ce[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1e0, 0x28c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x0, 0x290,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1d8, 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f8, 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x18, 0x25c
};

static const u16 sTitleScreenOam_5971ee[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x25c
};

static const u16 sTitleScreenOam_59720e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x1240,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x1244,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x1248,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x274,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x278
};

static const u16 sTitleScreenOam_59722e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x124c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x1250,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x254,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x258,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x25c
};

static const u16 sTitleScreenOam_59724e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x2c0,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x2c4,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x2c8,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x2f4,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x2f8
};

static const u16 sTitleScreenOam_59726e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, 0x300,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x304,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, 0x308,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, 0x2f4,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, 0x2f8
};

static const u16 sTitleScreenOam_59728e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1e0, 0x30c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x0, 0x310,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1d8, 0x2d4,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f8, 0x2d8,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x18, 0x2dc
};

static const u16 sTitleScreenOam_5972ae[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x2cc,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x2d0,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x2d4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x2d8,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x2dc
};

static const u16 sTitleScreenOam_5972ce[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x12c0,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x12c4,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x12c8,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x2f4,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x2f8
};

static const u16 sTitleScreenOam_5972ee[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x12cc,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x12d0,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x2d4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x2d8,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x2dc
};

static const u16 sTitleScreenOam_59730e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x340,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x344,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x348,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x374,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x378
};

static const u16 sTitleScreenOam_59732e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1d0, 0x380,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x384,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x10, 0x388,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, 0x374,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, 0x378
};

static const u16 sTitleScreenOam_59734e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1e0, 0x38c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x0, 0x390,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1d8, 0x354,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_SIZE_32x8 | 0x1f8, 0x358,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x18, 0x35c
};

static const u16 sTitleScreenOam_59736e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x34c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x350,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x354,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x358,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x35c
};

static const u16 sTitleScreenOam_59738e[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1d0, 0x1340,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x1f0, 0x1344,
    OBJ_SHAPE_HORIZONTAL | 0xf2, OBJ_SIZE_32x16 | 0x10, 0x1348,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x1e0, 0x374,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_SIZE_32x16 | 0x0, 0x378
};

static const u16 sTitleScreenOam_5973ae[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x1e0, 0x134c,
    OBJ_SHAPE_HORIZONTAL | 0xfe, OBJ_SIZE_32x16 | 0x0, 0x1350,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, 0x354,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, 0x358,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, 0x35c
};


const struct FrameData sTitleScreenOam_Copyright[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_Copyright_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5973e0[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_596f26,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5973f0[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_596f46,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_596f66,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_Language[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_Language_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597418[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_596f66,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_596f46,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597430[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_596fa6,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_596f26,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597448[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_596fc6,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_Language_Frame0,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_PressStart[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_PressStart_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597470[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_596ffa,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_PressStart_Frame0,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597488[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_59700e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597498[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59702e,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_59704e,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5974b0[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_59706e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5974c0[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59704e,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_59702e,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5974d8[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59708e,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_59700e,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5974f0[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_5970ae,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_59706e,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597508[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_5970ce,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597518[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_5970ee,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_59710e,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597530[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_59712e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597540[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59710e,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_5970ee,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597558[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59714e,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_5970ce,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597570[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59716e,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_59712e,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597588[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_59718e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597598[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_5971ae,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_5971ce,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5975b0[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_5971ee,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5975c0[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_5971ce,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_5971ae,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5975d8[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59720e,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_59718e,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5975f0[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59722e,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_5971ee,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597608[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_59724e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597618[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59726e,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_59728e,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597630[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_5972ae,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597640[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59728e,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_59726e,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597658[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_5972ce,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_59724e,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597670[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_5972ee,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_5972ae,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597688[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_59730e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_597698[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59732e,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_59734e,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5976b0[2] = {
    [0] = {
        .pFrame = sTitleScreenOam_59736e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5976c0[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59734e,
        .timer = 4
    },
    [1] = {
        .pFrame = sTitleScreenOam_59732e,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5976d8[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_59738e,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_59730e,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTitleScreenOam_5976f0[3] = {
    [0] = {
        .pFrame = sTitleScreenOam_5973ae,
        .timer = 3
    },
    [1] = {
        .pFrame = sTitleScreenOam_59736e,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_597708_72eee0[] = INCBIN_U8("data/Blob_597708_72eee0.bin");
