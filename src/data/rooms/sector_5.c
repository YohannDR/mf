#include "data/rooms/sector_5.h"

const u32 sTileset_48_Gfx[] = INCBIN_U32("data/tilesets/48.gfx.lz");

const u32 sTileset_49_Gfx[] = INCBIN_U32("data/tilesets/49.gfx.lz");

const u32 sTileset_57_Gfx[] = INCBIN_U32("data/tilesets/57.gfx.lz");

const u32 sTileset_48_Bg_Gfx[] = INCBIN_U32("data/tilesets/48_Bg.gfx.lz");

const u32 sTileset_49_Bg_Gfx[] = INCBIN_U32("data/tilesets/49_Bg.gfx.lz");

const u32 sTileset_57_Bg_Gfx[] = INCBIN_U32("data/tilesets/57_Bg.gfx.lz");

const u16 sTileset_48_Pal[14 * 16] = INCBIN_U16("data/tilesets/48.pal");

const u16 sTileset_49_Pal[14 * 16] = INCBIN_U16("data/tilesets/49.pal");

const u16 sTileset_57_Pal[14 * 16] = INCBIN_U16("data/tilesets/57.pal");

const u16 sTileset_48_Tilemap[0xa42] = INCBIN_U16("data/tilesets/48.tt");

const u16 sTileset_49_Tilemap[0x802] = INCBIN_U16("data/tilesets/49.tt");

const u16 sTileset_57_Tilemap[0x602] = INCBIN_U16("data/tilesets/57.tt");

const u8 sSector5_0_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_0, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    16, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_0_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector5_0_Clipdata.tt.rle")
};

const u8 sSector5_0_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector5_0_Bg2.tt.rle")
};

const u8 sSector5_0_SpriteData1[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    13, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    13, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    16, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    17, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    24, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    26, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_0_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector5_0_Bg1.tt.rle")
};

const u8 sSector5_0_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    13, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    16, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    18, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    26, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_1_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_1_Clipdata.tt.rle")
};

const u8 sSector5_1_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_1_Bg2.tt.rle")
};

const u8 sSector5_1_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_1_Bg1.tt.rle")
};

const u8 sSector5_1_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_2_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_2_Clipdata.tt.rle")
};

const u8 sSector5_2_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_2_Bg2.tt.rle")
};

const u8 sSector5_2_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_2_Bg1.tt.rle")
};

const u8 sSector5_2_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_3_Clipdata[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector5_3_Clipdata.tt.rle")
};

const u8 sSector5_3_Bg2[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector5_3_Bg2.tt.rle")
};

const u8 sSector5_3_Bg1[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector5_3_Bg1.tt.rle")
};

const u8 sSector5_3_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    10, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    30, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    34, 28, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    34, 34, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    37, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    40, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    40, 18, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    40, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    40, 36, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_4_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_4, // Room
    2, // Count

    // Scroll 0
    2, 18, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_4_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_4_Clipdata.tt.rle")
};

const u8 sSector5_4_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_4_Bg2.tt.rle")
};

const u8 sSector5_4_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_4_Bg1.tt.rle")
};

const u8 sSector5_4_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    7, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_5_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_5_Clipdata.tt.rle")
};

const u8 sSector5_5_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_5_Bg2.tt.rle")
};

const u8 sSector5_5_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_5_Bg1.tt.rle")
};

const u8 sSector5_5_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_6_Clipdata[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector5_6_Clipdata.tt.rle")
};

const u8 sSector5_6_Bg2[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector5_6_Bg2.tt.rle")
};

const u8 sSector5_6_SpriteData1_Unused[ROOM_SPRITE_DATA_COUNT(1)] = {
    21, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_6_Bg1[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector5_6_Bg1.tt.rle")
};

const u8 sSector5_6_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    10, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    30, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    37, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    40, 18, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    40, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    40, 36, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_7_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_7, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 51, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    31, 46, // X bounds
    22, 38, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_7_Clipdata[] = {
    49, 54,
    _INCBIN_U8("data/rooms/Sector5_7_Clipdata.tt.rle")
};

const u8 sSector5_7_Bg2[] = {
    49, 54,
    _INCBIN_U8("data/rooms/Sector5_7_Bg2.tt.rle")
};

const u8 sSector5_7_Bg1[] = {
    49, 54,
    _INCBIN_U8("data/rooms/Sector5_7_Bg1.tt.rle")
};

const u8 sSector5_7_SpriteData0[ROOM_SPRITE_DATA_COUNT(16)] = {
    5, 15, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    6, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    7, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    16, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    17, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 19, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    28, 23, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    28, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    33, 36, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    34, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    36, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    36, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    38, 19, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    43, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    45, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    45, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_8_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_8_Clipdata.tt.rle")
};

const u8 sSector5_8_SpriteData2[ROOM_SPRITE_DATA_COUNT(6)] = {
    5, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    5, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    6, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    6, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 7, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    8, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_8_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_8_Bg2.tt.rle")
};

const u8 sSector5_8_SpriteData1[ROOM_SPRITE_DATA_COUNT(5)] = {
    5, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    5, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    6, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    8, 7, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    8, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_8_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_8_Bg1.tt.rle")
};

const u8 sSector5_8_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    5, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    5, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    7, 14, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    8, 7, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    8, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_9_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_9, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    9, 51, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_9_Clipdata[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_9_Clipdata.tt.rle")
};

const u8 sSector5_9_Bg2[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_9_Bg2.tt.rle")
};

const u8 sSector5_9_SpriteData1[ROOM_SPRITE_DATA_COUNT(19)] = {
    3, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 8, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    11, 9, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    13, 5, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    15, 15, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    16, 12, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 15, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    19, 6, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    19, 9, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    21, 0, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    21, 14, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    26, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    29, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    31, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    32, 15, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    35, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    38, 3, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    38, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    40, 3, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_9_Bg1[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_9_Bg1.tt.rle")
};

const u8 sSector5_9_SpriteData0[ROOM_SPRITE_DATA_COUNT(18)] = {
    4, 8, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    11, 9, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    13, 5, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    15, 15, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    16, 12, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 15, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    19, 6, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    19, 9, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    21, 0, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    21, 14, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    26, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    29, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    31, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    32, 15, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    35, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    38, 3, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    38, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    40, 3, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_10_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_5_10, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_10_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_10_Clipdata.tt.rle")
};

const u8 sSector5_10_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_10_Bg2.tt.rle")
};

const u8 sSector5_10_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_10_Bg1.tt.rle")
};

const u8 sSector5_10_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_11_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_11_Clipdata.tt.rle")
};

const u8 sSector5_11_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_11_Bg2.tt.rle")
};

const u8 sSector5_11_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_11_Bg1.tt.rle")
};

const u8 sSector5_11_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    3, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    4, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_12_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_12_Clipdata.tt.rle")
};

const u8 sSector5_12_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_12_Bg2.tt.rle")
};

const u8 sSector5_12_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_12_Bg1.tt.rle")
};

const u8 sSector5_12_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    5, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_13_Clipdata[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector5_13_Clipdata.tt.rle")
};

const u8 sSector5_13_Bg2[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector5_13_Bg2.tt.rle")
};

const u8 sSector5_13_Bg1[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector5_13_Bg1.tt.rle")
};

const u8 sSector5_13_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    5, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    26, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    34, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    41, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    48, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    52, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    56, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_14_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_14_Clipdata.tt.rle")
};

const u8 sSector5_14_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_14_Bg2.tt.rle")
};

const u8 sSector5_14_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_14_Bg1.tt.rle")
};

const u8 sSector5_14_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    4, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_15_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_15, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 51, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    31, 46, // X bounds
    22, 36, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_15_Clipdata[] = {
    49, 54,
    _INCBIN_U8("data/rooms/Sector5_15_Clipdata.tt.rle")
};

const u8 sSector5_15_Bg2[] = {
    49, 54,
    _INCBIN_U8("data/rooms/Sector5_15_Bg2.tt.rle")
};

const u8 sSector5_15_Bg1[] = {
    49, 54,
    _INCBIN_U8("data/rooms/Sector5_15_Bg1.tt.rle")
};

const u8 sSector5_15_SpriteData0[ROOM_SPRITE_DATA_COUNT(14)] = {
    3, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    3, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    4, 21, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    5, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    15, 14, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    15, 21, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    16, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    28, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    34, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    36, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    37, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    44, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    44, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    46, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_16_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_16_Clipdata.tt.rle")
};

const u8 sSector5_16_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_16_Bg2.tt.rle")
};

const u8 sSector5_16_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_16_Bg1.tt.rle")
};

const u8 sSector5_16_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    20, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_17_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_17_Clipdata.tt.rle")
};

const u8 sSector5_17_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_17_Bg2.tt.rle")
};

const u8 sSector5_17_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_17_Bg1.tt.rle")
};

const u8 sSector5_17_SpriteData0[ROOM_SPRITE_DATA_COUNT(13)] = {
    3, 6, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    3, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    7, 16, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    7, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    12, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    14, 35, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    14, 36, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 39, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    14, 42, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    18, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    18, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_18_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector5_18_Clipdata.tt.rle")
};

const u8 sSector5_18_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector5_18_Bg2.tt.rle")
};

const u8 sSector5_18_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector5_18_Bg1.tt.rle")
};

const u8 sSector5_18_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)] = {
    5, 23, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    5, 25, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    13, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    13, 15, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    14, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    15, 19, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    15, 26, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    17, 14, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    24, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    24, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    24, 20, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_19_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_19, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    2, 14, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_19_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_19_Clipdata.tt.rle")
};

const u8 sSector5_19_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_19_Bg2.tt.rle")
};

const u8 sSector5_19_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_19_Bg1.tt.rle")
};

const u8 sSector5_19_SpriteData0[ROOM_SPRITE_DATA_COUNT(17)] = {
    6, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    13, 22, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    13, 23, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 6, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    15, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    15, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 17, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    18, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    18, 18, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    20, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    20, 11, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    20, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    20, 23, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    20, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_20_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_5_20, // Room
    1, // Count

    // Scroll 0
    2, 17, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_20_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_20_Clipdata.tt.rle")
};

const u8 sSector5_20_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_20_Bg2.tt.rle")
};

const u8 sSector5_20_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_20_Bg1.tt.rle")
};

const u8 sSector5_20_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    15, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    15, 10, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    15, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_21_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_5_21, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    32, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    2, 34, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 16, // X bounds
    39, 51, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_21_Clipdata[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_21_Clipdata.tt.rle")
};

const u8 sSector5_21_Bg2[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_21_Bg2.tt.rle")
};

const u8 sSector5_21_Bg1[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_21_Bg1.tt.rle")
};

const u8 sSector5_21_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    14, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    19, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    24, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_22_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_5_22, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    32, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    2, 34, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 16, // X bounds
    39, 49, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_22_Clipdata[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_22_Clipdata.tt.rle")
};

const u8 sSector5_22_Bg2[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_22_Bg2.tt.rle")
};

const u8 sSector5_22_Bg1[] = {
    19, 54,
    _INCBIN_U8("data/rooms/Sector5_22_Bg1.tt.rle")
};

const u8 sSector5_22_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    14, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    19, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    24, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    41, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    42, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    44, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    45, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_23_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_23_Clipdata.tt.rle")
};

const u8 sSector5_23_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_23_Bg2.tt.rle")
};

const u8 sSector5_23_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_23_Bg1.tt.rle")
};

const u8 sSector5_23_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_24_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_5_24, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    19, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 16, // X bounds
    31, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_24_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_24_Clipdata.tt.rle")
};

const u8 sSector5_24_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)] = {
    40, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_24_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_24_Bg2.tt.rle")
};

const u8 sSector5_24_SpriteData1[ROOM_SPRITE_DATA_COUNT(3)] = {
    21, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    28, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    30, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_24_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_24_Bg1.tt.rle")
};

const u8 sSector5_24_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    17, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    30, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_25_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_5_25, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector5_25_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_25_Clipdata.tt.rle")
};

const u8 sSector5_25_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_25_Bg2.tt.rle")
};

const u8 sSector5_25_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_25_Bg1.tt.rle")
};

const u8 sSector5_25_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    15, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_26_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_26_Clipdata.tt.rle")
};

const u8 sSector5_26_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_26_Bg2.tt.rle")
};

const u8 sSector5_26_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_26_Bg1.tt.rle")
};

const u8 sSector5_26_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    4, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 32, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    9, 22, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_27_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_27_Clipdata.tt.rle")
};

const u8 sSector5_27_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_27_Bg2.tt.rle")
};

const u8 sSector5_27_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_27_Bg1.tt.rle")
};

const u8 sSector5_27_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    3, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    5, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    7, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_28_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_28_Clipdata.tt.rle")
};

const u8 sSector5_28_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_28_Bg2.tt.rle")
};

const u8 sSector5_28_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector5_28_Bg1.tt.rle")
};

const u8 sSector5_28_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    17, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    17, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_29_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_29_Clipdata.tt.rle")
};

const u8 sSector5_29_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_29_Bg2.tt.rle")
};

const u8 sSector5_29_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_29_Bg1.tt.rle")
};

const u8 sSector5_29_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_30_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_30, // Room
    2, // Count

    // Scroll 0
    2, 17, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_30_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_30_Clipdata.tt.rle")
};

const u8 sSector5_30_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_30_Bg2.tt.rle")
};

const u8 sSector5_30_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_30_Bg1.tt.rle")
};

const u8 sSector5_30_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    3, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    7, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    7, 27, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_31_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_31_Clipdata.tt.rle")
};

const u8 sSector5_31_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_31_Bg2.tt.rle")
};

const u8 sSector5_31_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_31_Bg1.tt.rle")
};

const u8 sSector5_31_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_32_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_32_Clipdata.tt.rle")
};

const u8 sSector5_32_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_32_Bg2.tt.rle")
};

const u8 sSector5_32_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_32_Bg1.tt.rle")
};

const u8 sSector5_32_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_33_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_33_Clipdata.tt.rle")
};

const u8 sSector5_33_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_33_Bg2.tt.rle")
};

const u8 sSector5_33_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_33_Bg1.tt.rle")
};

const u8 sSector5_33_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    4, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    7, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_34_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_34_Clipdata.tt.rle")
};

const u8 sSector5_34_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_34_Bg2.tt.rle")
};

const u8 sSector5_34_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_34_Bg1.tt.rle")
};

const u8 sSector5_34_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_35_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_35_Clipdata.tt.rle")
};

const u8 sSector5_35_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_35_Bg2.tt.rle")
};

const u8 sSector5_35_SpriteData1_Unused[ROOM_SPRITE_DATA_COUNT(3)] = {
    0, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_35_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_35_Bg1.tt.rle")
};

const u8 sSector5_35_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_36_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_5_36, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    22, 34, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    32, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 16, // X bounds
    2, 22, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_36_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_36_Clipdata.tt.rle")
};

const u8 sSector5_36_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_36_Bg2.tt.rle")
};

const u8 sSector5_36_SpriteData1_Unused[ROOM_SPRITE_DATA_COUNT(3)] = {
    30, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    36, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    38, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_36_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_36_Bg1.tt.rle")
};

const u8 sSector5_36_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    6, 7, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    6, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    12, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    15, 13, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    20, 4, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    20, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    20, 11, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_37_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_37_Clipdata.tt.rle")
};

const u8 sSector5_37_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_37_Bg2.tt.rle")
};

const u8 sSector5_37_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_37_Bg1.tt.rle")
};

const u8 sSector5_37_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_38_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_38_Clipdata.tt.rle")
};

const u8 sSector5_38_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_38_Bg2.tt.rle")
};

const u8 sSector5_38_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_38_Bg1.tt.rle")
};

const u8 sSector5_38_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_39_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_39_Clipdata.tt.rle")
};

const u8 sSector5_39_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_39_Bg2.tt.rle")
};

const u8 sSector5_39_SpriteData1[ROOM_SPRITE_DATA_COUNT(6)] = {
    3, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    3, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 21, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    13, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_39_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_39_Bg1.tt.rle")
};

const u8 sSector5_39_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    6, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    10, 21, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_40_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_40_Clipdata.tt.rle")
};

const u8 sSector5_40_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_40_Bg2.tt.rle")
};

const u8 sSector5_40_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector5_40_Bg1.tt.rle")
};

const u8 sSector5_40_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    3, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    3, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 38, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_41_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_41_Clipdata.tt.rle")
};

const u8 sSector5_41_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_41_Bg2.tt.rle")
};

const u8 sSector5_41_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector5_41_Bg1.tt.rle")
};

const u8 sSector5_41_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    3, 7, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    3, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 19, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    10, 19, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_42_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_42, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 13, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_42_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_42_Clipdata.tt.rle")
};

const u8 sSector5_42_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_42_Bg2.tt.rle")
};

const u8 sSector5_42_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector5_42_Bg1.tt.rle")
};

const u8 sSector5_42_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    4, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    5, 4, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    8, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    15, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    16, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    16, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    16, 23, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    17, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_43_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_5_43, // Room
    1, // Count

    // Scroll 0
    32, 61, // X bounds
    2, 11, // Y bounds
    32, 6, // Breakable block position
    0, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector5_43_Clipdata[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector5_43_Clipdata.tt.rle")
};

const u8 sSector5_43_Bg2[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector5_43_Bg2.tt.rle")
};

const u8 sSector5_43_SpriteData1[ROOM_SPRITE_DATA_COUNT(6)] = {
    3, 42, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 47, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector5_43_Bg1[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector5_43_Bg1.tt.rle")
};

const u8 sSector5_43_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 54, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_44_Clipdata[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector5_44_Clipdata.tt.rle")
};

const u8 sSector5_44_Bg2[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector5_44_Bg2.tt.rle")
};

const u8 sSector5_44_Bg1[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector5_44_Bg1.tt.rle")
};

const u8 sSector5_44_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    26, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    34, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    41, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    48, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    53, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    59, 12, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_45_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_45_Clipdata.tt.rle")
};

const u8 sSector5_45_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_45_Bg2.tt.rle")
};

const u8 sSector5_45_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector5_45_Bg1.tt.rle")
};

const u8 sSector5_45_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    3, 7, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    3, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    3, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(3),
    29, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    32, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    32, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    34, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    35, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_46_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_5_46, // Room
    2, // Count

    // Scroll 0
    17, 46, // X bounds
    2, 14, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 46, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_46_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_46_Clipdata.tt.rle")
};

const u8 sSector5_46_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_46_Bg2.tt.rle")
};

const u8 sSector5_46_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_46_Bg1.tt.rle")
};

const u8 sSector5_46_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    13, 37, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 33, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    16, 20, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    16, 30, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    16, 38, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    18, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_47_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_47_Clipdata.tt.rle")
};

const u8 sSector5_47_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_47_Bg2.tt.rle")
};

const u8 sSector5_47_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_47_Bg1.tt.rle")
};

const u8 sSector5_47_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 5, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    3, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    3, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    3, 9, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    3, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 13, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    6, 3, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    10, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    10, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_48_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_48_Clipdata.tt.rle")
};

const u8 sSector5_48_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_48_Bg2.tt.rle")
};

const u8 sSector5_48_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_48_Bg1.tt.rle")
};

const u8 sSector5_48_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 8, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_49_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_49_Clipdata.tt.rle")
};

const u8 sSector5_49_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_49_Bg2.tt.rle")
};

const u8 sSector5_49_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector5_49_Bg1.tt.rle")
};

const u8 sSector5_49_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_UNINFECTED_OR_BOSS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_50_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_5_50, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    16, 46, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    5, 24, // X bounds
    2, 14, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector5_50_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_50_Clipdata.tt.rle")
};

const u8 sSector5_50_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_50_Bg2.tt.rle")
};

const u8 sSector5_50_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector5_50_Bg1.tt.rle")
};

const u8 sSector5_50_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector5_51_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector5_51_Clipdata.tt.rle")
};

const u8 sSector5_51_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector5_51_Bg2.tt.rle")
};

const u8 sSector5_51_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector5_51_Bg1.tt.rle")
};

const u8 sSector5_51_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    5, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    9, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    13, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    23, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    23, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u32 sSector5_3_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector5_3_Bg3.tt.lz")
};

const u32 sSector5_7_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector5_7_Bg3.tt.lz")
};

const u32 sMainDeck_46_Bg0[] = {
    0, _INCBIN_U32("data/rooms/MainDeck_46_Bg0.tt.lz")
};

const u32 sSector5_20_Bg3[] = {
    2, _INCBIN_U32("data/rooms/Sector5_20_Bg3.tt.lz")
};

const u32 sSector5_20_Bg0[] = {
    0, _INCBIN_U32("data/rooms/Sector5_20_Bg0.tt.lz")
};

const u32 sSector5_3_Bg0[] = {
    1, _INCBIN_U32("data/rooms/Sector5_3_Bg0.tt.lz")
};
