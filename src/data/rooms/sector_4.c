#include "data/rooms/sector_4.h"

const u32 sTileset_43_Gfx[] = INCBIN_U32("data/tilesets/43.gfx.lz");

const u32 sTileset_52_Gfx[] = INCBIN_U32("data/tilesets/52.gfx.lz");

const u32 sTileset_81_Gfx[] = INCBIN_U32("data/tilesets/81.gfx.lz");

const u32 sTileset_86_Gfx[] = INCBIN_U32("data/tilesets/86.gfx.lz");

const u32 sTileset_90_Gfx[] = INCBIN_U32("data/tilesets/90.gfx.lz");

const u32 sTileset_81_Bg_Gfx[] = INCBIN_U32("data/tilesets/81_Bg.gfx.lz");

const u32 sTileset_52_Bg_Gfx[] = INCBIN_U32("data/tilesets/52_Bg.gfx.lz");

const u32 sTileset_90_Bg_Gfx[] = INCBIN_U32("data/tilesets/90_Bg.gfx.lz");

const u32 sTileset_43_Bg_Gfx[] = INCBIN_U32("data/tilesets/43_Bg.gfx.lz");

const u16 sTileset_43_Tilemap[0xb42] = INCBIN_U16("data/tilesets/43.tt");

const u16 sTileset_52_Tilemap[0x982] = INCBIN_U16("data/tilesets/52.tt");

const u16 sTileset_81_Tilemap[0x742] = INCBIN_U16("data/tilesets/81.tt");

const u16 sTileset_86_Tilemap[0xb42] = INCBIN_U16("data/tilesets/86.tt");

const u16 sTileset_90_Tilemap[0x502] = INCBIN_U16("data/tilesets/90.tt");

const u16 sTileset_43_Pal[14 * 16] = INCBIN_U16("data/tilesets/43.pal");

const u16 sAnimatedPal_20[9 * 16] = INCBIN_U16("data/tilesets/animated_palettes/20.pal");

const u16 sTileset_52_Pal[14 * 16] = INCBIN_U16("data/tilesets/52.pal");

const u16 sTileset_81_Pal[14 * 16] = INCBIN_U16("data/tilesets/81.pal");

const u16 sTileset_86_Pal[14 * 16] = INCBIN_U16("data/tilesets/86.pal");

const u16 sTileset_90_Pal[14 * 16] = INCBIN_U16("data/tilesets/90.pal");

const u8 sSector4_0_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_0_Clipdata.tt.rle")
};

const u8 sSector4_0_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_0_Bg2.tt.rle")
};

const u8 sSector4_0_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_0_Bg1.tt.rle")
};

const u8 sSector4_0_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_1_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_1_Clipdata.tt.rle")
};

const u8 sSector4_1_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_1_Bg2.tt.rle")
};

const u8 sSector4_1_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_1_Bg1.tt.rle")
};

const u8 sSector4_1_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_2_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_2_Clipdata.tt.rle")
};

const u8 sSector4_2_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_2_Bg2.tt.rle")
};

const u8 sSector4_2_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_2_Bg1.tt.rle")
};

const u8 sSector4_2_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_3_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_3_Clipdata.tt.rle")
};

const u8 sSector4_3_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_3_Bg2.tt.rle")
};

const u8 sSector4_3_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)] = {
    5, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(10),
    12, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(10),
    16, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(10),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_3_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_3_Bg1.tt.rle")
};

const u8 sSector4_3_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    5, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(10),
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    10, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    12, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(10),
    16, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(10),
    18, 17, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(10),
    20, 17, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_4_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_4_Clipdata.tt.rle")
};

const u8 sSector4_4_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_4_Bg2.tt.rle")
};

const u8 sSector4_4_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_4_Bg1.tt.rle")
};

const u8 sSector4_4_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_5_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_5_Clipdata.tt.rle")
};

const u8 sSector4_5_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_5_Bg2.tt.rle")
};

const u8 sSector4_5_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)] = {
    2, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(7),
    4, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    4, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    8, 10, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_5_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_5_Bg1.tt.rle")
};

const u8 sSector4_5_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    4, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    4, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    8, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_6_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_6_Clipdata.tt.rle")
};

const u8 sSector4_6_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_6_Bg2.tt.rle")
};

const u8 sSector4_6_SpriteData1[ROOM_SPRITE_DATA_COUNT(11)] = {
    3, 29, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    5, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    6, 44, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    16, 34, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    19, 23, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    21, 7, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    23, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    24, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    24, 35, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    24, 39, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    26, 30, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_6_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_6_Bg1.tt.rle")
};

const u8 sSector4_6_SpriteData0[ROOM_SPRITE_DATA_COUNT(15)] = {
    3, 23, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    3, 29, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    5, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    6, 44, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    12, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    12, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 38, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    20, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    20, 26, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    20, 42, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    21, 7, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    24, 39, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    26, 30, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    32, 21, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_7_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_7_Clipdata.tt.rle")
};

const u8 sSector4_7_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_7_Bg2.tt.rle")
};

const u8 sSector4_7_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_7_Bg1.tt.rle")
};

const u8 sSector4_7_SpriteData0[ROOM_SPRITE_DATA_COUNT(13)] = {
    3, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 4, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    4, 13, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    5, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    12, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    14, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    15, 24, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    16, 30, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    17, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    19, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_7_Bg0[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_7_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector4_8_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_4_8, // Room
    3, // Count

    // Scroll 0
    32, 46, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 46, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 16, // X bounds
    12, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_8_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_8_Clipdata.tt.rle")
};

const u8 sSector4_8_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_8_Bg2.tt.rle")
};

const u8 sSector4_8_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_8_Bg1.tt.rle")
};

const u8 sSector4_8_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    3, 43, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    13, 42, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    15, 33, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    17, 21, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    20, 37, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    27, 5, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    33, 5, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    33, 10, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_8_Bg0[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_8_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector4_9_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_9_Clipdata.tt.rle")
};

const u8 sSector4_9_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_9_Bg2.tt.rle")
};

const u8 sSector4_9_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_9_Bg1.tt.rle")
};

const u8 sSector4_9_SpriteData0[ROOM_SPRITE_DATA_COUNT(17)] = {
    0, 7, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    0, 16, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    0, 23, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    0, 30, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    0, 40, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    3, 24, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    6, 15, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 29, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 36, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 12, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 22, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 32, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    13, 9, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    13, 15, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    13, 21, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    13, 27, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    13, 34, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_10_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_10_Clipdata.tt.rle")
};

const u8 sSector4_10_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_10_Bg2.tt.rle")
};

const u8 sSector4_10_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_10_Bg1.tt.rle")
};

const u8 sSector4_10_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    14, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    17, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_10_Bg0[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_10_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector4_11_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_11_Clipdata.tt.rle")
};

const u8 sSector4_11_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_11_Bg2.tt.rle")
};

const u8 sSector4_11_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_11_Bg1.tt.rle")
};

const u8 sSector4_11_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_12_Clipdata[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector4_12_Clipdata.tt.rle")
};

const u8 sSector4_12_Bg2[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector4_12_Bg2.tt.rle")
};

const u8 sSector4_12_Bg1[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector4_12_Bg1.tt.rle")
};

const u8 sSector4_12_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    2, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    2, 39, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 33, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 51, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 42, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    9, 52, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 45, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    11, 27, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    11, 38, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    11, 52, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_13_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_4_13, // Room
    2, // Count

    // Scroll 0
    32, 46, // X bounds
    2, 31, // Y bounds
    30, 9, // Breakable block position
    0, // Breakable block direction
    17, // Breakable block Y bound extension

    // Scroll 1
    2, 46, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_13_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_13_Clipdata.tt.rle")
};

const u8 sSector4_13_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_13_Bg2.tt.rle")
};

const u8 sSector4_13_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector4_13_Bg1.tt.rle")
};

const u8 sSector4_13_SpriteData0[ROOM_SPRITE_DATA_COUNT(13)] = {
    5, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    5, 28, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    8, 41, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    12, 43, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    17, 20, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    17, 28, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    18, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    19, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    22, 41, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    24, 15, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    26, 26, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    26, 40, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    28, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_14_Clipdata[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector4_14_Clipdata.tt.rle")
};

const u8 sSector4_14_Bg2[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector4_14_Bg2.tt.rle")
};

const u8 sSector4_14_Bg1[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector4_14_Bg1.tt.rle")
};

const u8 sSector4_14_SpriteData0[ROOM_SPRITE_DATA_COUNT(18)] = {
    0, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 9, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    11, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    12, 13, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    14, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    19, 4, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    19, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    22, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    23, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    26, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    26, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    30, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    32, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    35, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    37, 6, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    41, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    41, 7, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_15_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_15_Clipdata.tt.rle")
};

const u8 sSector4_15_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_15_Bg2.tt.rle")
};

const u8 sSector4_15_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_15_Bg1.tt.rle")
};

const u8 sSector4_15_SpriteData0[ROOM_SPRITE_DATA_COUNT(13)] = {
    2, 37, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    4, 41, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    4, 45, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    5, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    6, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    6, 29, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    8, 37, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    10, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 36, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_16_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_16_Clipdata.tt.rle")
};

const u8 sSector4_16_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_16_Bg2.tt.rle")
};

const u8 sSector4_16_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_16_Bg1.tt.rle")
};

const u8 sSector4_16_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    6, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    9, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    13, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    16, 5, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    17, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    18, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    20, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    22, 8, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    22, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    23, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    25, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_17_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_4_17, // Room
    2, // Count

    // Scroll 0
    2, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    10, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_17_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector4_17_Clipdata.tt.rle")
};

const u8 sSector4_17_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector4_17_Bg2.tt.rle")
};

const u8 sSector4_17_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector4_17_Bg1.tt.rle")
};

const u8 sSector4_17_SpriteData0[ROOM_SPRITE_DATA_COUNT(15)] = {
    6, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    9, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    9, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    13, 20, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 25, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    14, 23, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    14, 27, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 21, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    17, 33, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    19, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    22, 32, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    23, 17, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    23, 20, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    23, 25, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    23, 30, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_18_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_18_Clipdata.tt.rle")
};

const u8 sSector4_18_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_18_Bg2.tt.rle")
};

const u8 sSector4_18_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_18_Bg1.tt.rle")
};

const u8 sSector4_18_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    3, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 6, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    10, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_19_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector4_19_Clipdata.tt.rle")
};

const u8 sSector4_19_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector4_19_Bg2.tt.rle")
};

const u8 sSector4_19_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector4_19_Bg1.tt.rle")
};

const u8 sSector4_19_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    4, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    13, 20, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    18, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    18, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    21, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    22, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    24, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_20_Clipdata[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_20_Clipdata.tt.rle")
};

const u8 sSector4_20_Bg2[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_20_Bg2.tt.rle")
};

const u8 sSector4_20_SpriteData1[ROOM_SPRITE_DATA_COUNT(13)] = {
    12, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    12, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    12, 50, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    13, 34, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    13, 44, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    16, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    16, 41, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    18, 36, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    18, 46, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    18, 52, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    19, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    19, 34, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    19, 42, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_20_Bg1[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_20_Bg1.tt.rle")
};

const u8 sSector4_20_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    3, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    5, 54, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    7, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 22, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    10, 38, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    10, 54, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    12, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    12, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    12, 50, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    16, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    22, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_21_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_4_21, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    32, 41, // Y bounds
    13, 34, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    39, 61, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_21_Clipdata[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector4_21_Clipdata.tt.rle")
};

const u8 sSector4_21_Bg2[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector4_21_Bg2.tt.rle")
};

const u8 sSector4_21_SpriteData1[ROOM_SPRITE_DATA_COUNT(11)] = {
    10, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    21, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    22, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    31, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    42, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    44, 8, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    46, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    47, 4, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    48, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    54, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_21_Bg1[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector4_21_Bg1.tt.rle")
};

const u8 sSector4_21_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    10, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    21, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    22, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    31, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    40, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    42, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    46, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    47, 4, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    54, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    61, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_22_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_22_Clipdata.tt.rle")
};

const u8 sSector4_22_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_22_Bg2.tt.rle")
};

const u8 sSector4_22_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_22_Bg1.tt.rle")
};

const u8 sSector4_22_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_23_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_4_23, // Room
    2, // Count

    // Scroll 0
    17, 61, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 21, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_23_Clipdata[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_23_Clipdata.tt.rle")
};

const u8 sSector4_23_Bg2[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_23_Bg2.tt.rle")
};

const u8 sSector4_23_Bg1[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_23_Bg1.tt.rle")
};

const u8 sSector4_23_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)] = {
    3, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 24, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 32, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 37, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    5, 44, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    5, 49, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 54, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 41, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 56, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    7, 34, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 34, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_24_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_4_24, // Room
    3, // Count

    // Scroll 0
    2, 46, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    18, 32, // X bounds
    2, 12, // Y bounds
    18, 4, // Breakable block position
    0, // Breakable block direction
    2, // Breakable block Y bound extension

    // Scroll 2
    32, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_24_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector4_24_Clipdata.tt.rle")
};

const u8 sSector4_24_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector4_24_Bg2.tt.rle")
};

const u8 sSector4_24_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector4_24_Bg1.tt.rle")
};

const u8 sSector4_24_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    5, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    6, 21, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    13, 21, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 27, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 36, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    18, 34, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    19, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_25_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector4_25_Clipdata.tt.rle")
};

const u8 sSector4_25_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector4_25_Bg2.tt.rle")
};

const u8 sSector4_25_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector4_25_Bg1.tt.rle")
};

const u8 sSector4_25_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    21, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    22, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    22, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    23, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    25, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    25, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    26, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    35, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_26_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_26_Clipdata.tt.rle")
};

const u8 sSector4_26_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_26_Bg2.tt.rle")
};

const u8 sSector4_26_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_26_Bg1.tt.rle")
};

const u8 sSector4_26_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 8, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_27_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_4_27, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector4_27_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector4_27_Clipdata.tt.rle")
};

const u8 sSector4_27_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector4_27_Bg2.tt.rle")
};

const u8 sSector4_27_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector4_27_Bg1.tt.rle")
};

const u8 sSector4_27_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    15, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_28_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector4_28_Clipdata.tt.rle")
};

const u8 sSector4_28_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector4_28_Bg2.tt.rle")
};

const u8 sSector4_28_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector4_28_Bg1.tt.rle")
};

const u8 sSector4_28_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    3, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    3, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    3, 19, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    3, 23, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    8, 7, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    8, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    8, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    8, 21, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    8, 27, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_28_Bg0[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector4_28_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector4_29_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_29_Clipdata.tt.rle")
};

const u8 sSector4_29_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_29_Bg2.tt.rle")
};

const u8 sSector4_29_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_29_Bg1.tt.rle")
};

const u8 sSector4_29_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_30_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_30_Clipdata.tt.rle")
};

const u8 sSector4_30_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_30_Bg2.tt.rle")
};

const u8 sSector4_30_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_30_Bg1.tt.rle")
};

const u8 sSector4_30_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    14, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_30_Bg0[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector4_30_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector4_31_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector4_31_Clipdata.tt.rle")
};

const u8 sSector4_31_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector4_31_Bg2.tt.rle")
};

const u8 sSector4_31_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector4_31_Bg1.tt.rle")
};

const u8 sSector4_31_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    9, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    10, 17, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    10, 21, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_31_Bg0[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector4_31_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector4_32_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_32_Clipdata.tt.rle")
};

const u8 sSector4_32_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_32_Bg2.tt.rle")
};

const u8 sSector4_32_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_32_Bg1.tt.rle")
};

const u8 sSector4_32_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 8, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_33_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_4_33, // Room
    2, // Count

    // Scroll 0
    17, 61, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 17, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_33_Clipdata[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_33_Clipdata.tt.rle")
};

const u8 sSector4_33_Bg2[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_33_Bg2.tt.rle")
};

const u8 sSector4_33_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)] = {
    8, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    12, 43, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    17, 15, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    17, 43, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_33_Bg1[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector4_33_Bg1.tt.rle")
};

const u8 sSector4_33_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    8, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    10, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    10, 41, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    12, 43, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    17, 15, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    17, 43, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    23, 19, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_34_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_4_34, // Room
    3, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    10, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 16, // X bounds
    21, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_34_Clipdata[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector4_34_Clipdata.tt.rle")
};

const u8 sSector4_34_Bg2[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector4_34_Bg2.tt.rle")
};

const u8 sSector4_34_Bg1[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector4_34_Bg1.tt.rle")
};

const u8 sSector4_34_SpriteData0[ROOM_SPRITE_DATA_COUNT(17)] = {
    0, 13, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    0, 25, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 0, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 20, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    5, 26, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    6, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 29, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    11, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    18, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    19, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    21, 6, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    21, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    29, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    29, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    31, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    35, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_35_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_4_35, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    41, 71, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_35_Clipdata[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector4_35_Clipdata.tt.rle")
};

const u8 sSector4_35_Bg2[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector4_35_Bg2.tt.rle")
};

const u8 sSector4_35_Bg1[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector4_35_Bg1.tt.rle")
};

const u8 sSector4_35_SpriteData0[ROOM_SPRITE_DATA_COUNT(14)] = {
    17, 12, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    20, 18, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    22, 5, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    23, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    27, 0, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    29, 12, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    31, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    33, 0, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    36, 5, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    38, 9, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    38, 18, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    40, 18, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    43, 0, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    44, 0, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_36_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_4_36, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    10, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_36_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_36_Clipdata.tt.rle")
};

const u8 sSector4_36_SpriteData2[ROOM_SPRITE_DATA_COUNT(8)] = {
    3, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    4, 4, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    4, 28, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    6, 14, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    7, 20, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    12, 13, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(8),
    13, 16, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(8),
    13, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(10),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_36_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_36_Bg2.tt.rle")
};

const u8 sSector4_36_SpriteData1[ROOM_SPRITE_DATA_COUNT(13)] = {
    3, 8, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(11),
    3, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(11),
    3, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    3, 24, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(11),
    4, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    4, 28, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    6, 14, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    6, 22, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(11),
    7, 20, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    8, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(11),
    8, 17, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(11),
    12, 13, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(8),
    13, 16, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(8),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_36_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector4_36_Bg1.tt.rle")
};

const u8 sSector4_36_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    1, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    1, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    3, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    4, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    4, 28, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(6),
    6, 14, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    7, 20, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    12, 13, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(8),
    13, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    13, 16, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(8),
    13, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(10),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_37_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_37_Clipdata.tt.rle")
};

const u8 sSector4_37_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_37_Bg2.tt.rle")
};

const u8 sSector4_37_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_37_Bg1.tt.rle")
};

const u8 sSector4_37_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    3, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    3, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    5, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_38_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_38_Clipdata.tt.rle")
};

const u8 sSector4_38_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_38_Bg2.tt.rle")
};

const u8 sSector4_38_SpriteData1[ROOM_SPRITE_DATA_COUNT(11)] = {
    2, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    3, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    4, 27, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    8, 36, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    9, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    9, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    9, 19, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    9, 24, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    9, 27, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    10, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_38_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector4_38_Bg1.tt.rle")
};

const u8 sSector4_38_SpriteData0[ROOM_SPRITE_DATA_COUNT(13)] = {
    2, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    3, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    4, 27, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    5, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    8, 36, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    9, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    9, 19, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    9, 24, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    9, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    9, 27, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    10, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 21, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_39_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_39_Clipdata.tt.rle")
};

const u8 sSector4_39_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_39_Bg2.tt.rle")
};

const u8 sSector4_39_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_39_Bg1.tt.rle")
};

const u8 sSector4_39_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_40_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector4_40_Clipdata.tt.rle")
};

const u8 sSector4_40_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector4_40_Bg2.tt.rle")
};

const u8 sSector4_40_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector4_40_Bg1.tt.rle")
};

const u8 sSector4_40_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    11, 6, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    11, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    13, 14, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    17, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    17, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    18, 2, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    19, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    20, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    20, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    21, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(7),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_41_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_41_Clipdata.tt.rle")
};

const u8 sSector4_41_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_41_Bg2.tt.rle")
};

const u8 sSector4_41_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_41_Bg1.tt.rle")
};

const u8 sSector4_41_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    4, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    4, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    6, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_42_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_4_42, // Room
    1, // Count

    // Scroll 0
    17, 46, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector4_42_Clipdata[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector4_42_Clipdata.tt.rle")
};

const u8 sSector4_42_Bg2[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector4_42_Bg2.tt.rle")
};

const u8 sSector4_42_Bg1[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector4_42_Bg1.tt.rle")
};

const u8 sSector4_42_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    5, 31, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    8, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    20, 43, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_42_Bg0[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector4_42_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector4_43_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_43_Clipdata.tt.rle")
};

const u8 sSector4_43_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_43_Bg2.tt.rle")
};

const u8 sSector4_43_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_43_Bg1.tt.rle")
};

const u8 sSector4_43_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_44_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_44_Clipdata.tt.rle")
};

const u8 sSector4_44_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_44_Bg2.tt.rle")
};

const u8 sSector4_44_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_44_Bg1.tt.rle")
};

const u8 sSector4_44_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_45_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_45_Clipdata.tt.rle")
};

const u8 sSector4_45_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_45_Bg2.tt.rle")
};

const u8 sSector4_45_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_45_Bg1.tt.rle")
};

const u8 sSector4_45_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector4_46_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_46_Clipdata.tt.rle")
};

const u8 sSector4_46_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_46_Bg2.tt.rle")
};

const u8 sSector4_46_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_46_Bg1.tt.rle")
};

const u8 sSector4_46_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    5, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    7, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    9, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    9, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector4_46_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_46_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector4_47_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_47_Clipdata.tt.rle")
};

const u8 sSector4_47_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_47_Bg2.tt.rle")
};

const u8 sSector4_47_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector4_47_Bg1.tt.rle")
};

const u8 sSector4_47_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u32 sSector1_38_Bg0[] = {
    2, _INCBIN_U32("data/rooms/Sector1_38_Bg0.tt.lz")
};

const u32 sSector4_3_Bg0[] = {
    2, _INCBIN_U32("data/rooms/Sector4_3_Bg0.tt.lz")
};

const u32 sSector4_42_Bg3[] = {
    2, _INCBIN_U32("data/rooms/Sector4_42_Bg3.tt.lz")
};

const u32 sSector4_12_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector4_12_Bg3.tt.lz")
};

const u32 sSector4_31_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector4_31_Bg3.tt.lz")
};

const u32 sSector4_6_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector4_6_Bg3.tt.lz")
};
