#include "data/rooms/sector_3.h"

const u8 sTileset_53_Gfx[] = INCBIN_U8("data/tilesets/53.gfx.lz"); ALIGN2();

const u8 sTileset_33_Gfx[] = INCBIN_U8("data/tilesets/33.gfx.lz"); ALIGN2();

const u8 sTileset_34_Gfx[] = INCBIN_U8("data/tilesets/34.gfx.lz"); ALIGN2();

const u8 sTileset_51_Gfx[] = INCBIN_U8("data/tilesets/51.gfx.lz"); ALIGN2();

const u8 sTileset_40_Gfx[] = INCBIN_U8("data/tilesets/40.gfx.lz"); ALIGN2();

const u8 sTileset_42_Gfx[] = INCBIN_U8("data/tilesets/42.gfx.lz"); ALIGN2();

const u8 sTileset_53_Bg_Gfx[] = INCBIN_U8("data/tilesets/53_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_33_Bg_Gfx[] = INCBIN_U8("data/tilesets/33_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_34_Bg_Gfx[] = INCBIN_U8("data/tilesets/34_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_40_Bg_Gfx[] = INCBIN_U8("data/tilesets/40_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_42_Bg_Gfx[] = INCBIN_U8("data/tilesets/42_Bg.gfx.lz"); ALIGN2();

const u16 sTileset_53_Pal[14 * 16] = INCBIN_U16("data/tilesets/53.pal");

const u16 sAnimatedPal_23[5 * 16] = INCBIN_U16("data/tilesets/animated_palettes/23.pal");

const u16 sTileset_71_Pal[14 * 16] = INCBIN_U16("data/tilesets/71.pal");

const u16 sAnimatedPal_25[5 * 16] = INCBIN_U16("data/tilesets/animated_palettes/25.pal");

const u16 sTileset_33_Pal[14 * 16] = INCBIN_U16("data/tilesets/33.pal");

const u16 sTileset_34_Pal[14 * 16] = INCBIN_U16("data/tilesets/34.pal");

const u16 sTileset_51_Pal[14 * 16] = INCBIN_U16("data/tilesets/51.pal");

const u16 sAnimatedPal_22[4 * 16] = INCBIN_U16("data/tilesets/animated_palettes/22.pal");

const u16 sTileset_40_Pal[14 * 16] = INCBIN_U16("data/tilesets/40.pal");

const u16 sAnimatedPal_15[7 * 16] = INCBIN_U16("data/tilesets/animated_palettes/15.pal");

const u16 sTileset_42_Pal[14 * 16] = INCBIN_U16("data/tilesets/42.pal");

const u16 sAnimatedPal_16[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/16.pal");

const u16 sTileset_53_Tilemap[0x802] = INCBIN_U16("data/tilesets/53.tt");

const u16 sTileset_33_Tilemap[0x802] = INCBIN_U16("data/tilesets/33.tt");

const u16 sTileset_34_Tilemap[0x802] = INCBIN_U16("data/tilesets/34.tt");

const u16 sTileset_51_Tilemap[0x702] = INCBIN_U16("data/tilesets/51.tt");

const u16 sTileset_40_Tilemap[0x802] = INCBIN_U16("data/tilesets/40.tt");

const u16 sTileset_42_Tilemap[0x902] = INCBIN_U16("data/tilesets/42.tt");

const u8 sSector3_0_Clipdata[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector3_0_Clipdata.tt.rle")
};

const u8 sSector3_0_Bg2[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector3_0_Bg2.tt.rle")
};

const u8 sSector3_0_SpriteData1[ROOM_SPRITE_DATA_COUNT(8)] = {
    12, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    13, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    18, 17, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    22, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    28, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    28, 19, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    32, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    32, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_0_Bg1[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector3_0_Bg1.tt.rle")
};

const u8 sSector3_0_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    25, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_1_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_1_Clipdata.tt.rle")
};

const u8 sSector3_1_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_1_Bg2.tt.rle")
};

const u8 sSector3_1_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_1_Bg1.tt.rle")
};

const u8 sSector3_1_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_2_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_2_Clipdata.tt.rle")
};

const u8 sSector3_2_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_2_Bg2.tt.rle")
};

const u8 sSector3_2_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_2_Bg1.tt.rle")
};

const u8 sSector3_2_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_3_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_3_3, // Room
    3, // Count

    // Scroll 0
    2, 48, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    47, 61, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    32, 46, // X bounds
    11, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_3_Clipdata[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector3_3_Clipdata.tt.rle")
};

const u8 sSector3_3_Bg2[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector3_3_Bg2.tt.rle")
};

const u8 sSector3_3_SpriteData1[ROOM_SPRITE_DATA_COUNT(12)] = {
    0, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    0, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    0, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 36, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    5, 31, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    5, 41, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 29, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 25, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    10, 30, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    10, 44, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    20, 43, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    20, 45, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_3_Bg1[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector3_3_Bg1.tt.rle")
};

const u8 sSector3_3_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 30, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_4_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_4_Clipdata.tt.rle")
};

const u8 sSector3_4_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_4_Bg2.tt.rle")
};

const u8 sSector3_4_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_4_Bg1.tt.rle")
};

const u8 sSector3_4_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_5_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector3_5_Clipdata.tt.rle")
};

const u8 sSector3_5_SpriteData2[ROOM_SPRITE_DATA_COUNT(4)] = {
    12, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    15, 6, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    18, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    28, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_5_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector3_5_Bg2.tt.rle")
};

const u8 sSector3_5_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)] = {
    12, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    15, 6, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    18, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    28, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_5_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector3_5_Bg1.tt.rle")
};

const u8 sSector3_5_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    28, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_6_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_3_6, // Room
    3, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 13, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 17, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_6_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_6_Clipdata.tt.rle")
};

const u8 sSector3_6_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_6_Bg2.tt.rle")
};

const u8 sSector3_6_SpriteData1[ROOM_SPRITE_DATA_COUNT(7)] = {
    5, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    9, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    11, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    11, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    11, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_6_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_6_Bg1.tt.rle")
};

const u8 sSector3_6_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_7_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector3_7_Clipdata.tt.rle")
};

const u8 sSector3_7_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector3_7_Bg2.tt.rle")
};

const u8 sSector3_7_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector3_7_Bg1.tt.rle")
};

const u8 sSector3_7_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 32, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 17, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 21, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    4, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    9, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 15, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 21, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 29, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_7_Bg0[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector3_7_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_8_Scrolls[SCROLL_DATA_COUNT(4)] = {
    SECTOR_3_8, // Room
    4, // Count

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
    19, 36, // X bounds
    2, 12, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 3
    2, 21, // X bounds
    2, 12, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_8_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector3_8_Clipdata.tt.rle")
};

const u8 sSector3_8_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector3_8_Bg2.tt.rle")
};

const u8 sSector3_8_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector3_8_Bg1.tt.rle")
};

const u8 sSector3_8_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    15, 26, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    20, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    20, 20, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    20, 24, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    20, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    20, 44, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    21, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_9_Clipdata[] = {
    79, 24,
    _INCBIN_U8("data/rooms/Sector3_9_Clipdata.tt.rle")
};

const u8 sSector3_9_Bg2[] = {
    79, 24,
    _INCBIN_U8("data/rooms/Sector3_9_Bg2.tt.rle")
};

const u8 sSector3_9_Bg1[] = {
    79, 24,
    _INCBIN_U8("data/rooms/Sector3_9_Bg1.tt.rle")
};

const u8 sSector3_9_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    14, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 49, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 51, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    15, 30, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    16, 34, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    18, 36, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 53, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 55, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    19, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_9_Bg0[] = {
    79, 24,
    _INCBIN_U8("data/rooms/Sector3_9_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_10_Clipdata[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector3_10_Clipdata.tt.rle")
};

const u8 sSector3_10_SpriteData2[ROOM_SPRITE_DATA_COUNT(7)] = {
    14, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    26, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    33, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    43, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    45, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    53, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    60, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_10_Bg2[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector3_10_Bg2.tt.rle")
};

const u8 sSector3_10_SpriteData1[ROOM_SPRITE_DATA_COUNT(7)] = {
    14, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    26, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    33, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    43, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    45, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    53, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    60, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_10_Bg1[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector3_10_Bg1.tt.rle")
};

const u8 sSector3_10_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_11_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_3_11, // Room
    1, // Count

    // Scroll 0
    2, 61, // X bounds
    3, 15, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_11_Clipdata[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector3_11_Clipdata.tt.rle")
};

const u8 sSector3_11_Bg2[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector3_11_Bg2.tt.rle")
};

const u8 sSector3_11_Bg1[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector3_11_Bg1.tt.rle")
};

const u8 sSector3_11_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    4, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 39, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    5, 33, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 33, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 38, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 51, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_11_Bg0[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector3_11_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_12_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_3_12, // Room
    2, // Count

    // Scroll 0
    17, 31, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 31, // X bounds
    21, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_12_Clipdata[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector3_12_Clipdata.tt.rle")
};

const u8 sSector3_12_Bg2[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector3_12_Bg2.tt.rle")
};

const u8 sSector3_12_Bg1[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector3_12_Bg1.tt.rle")
};

const u8 sSector3_12_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    8, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    11, 22, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    13, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    27, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    32, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    37, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    39, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_12_Bg0[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector3_12_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_13_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_13_Clipdata.tt.rle")
};

const u8 sSector3_13_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_13_Bg2.tt.rle")
};

const u8 sSector3_13_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_13_Bg1.tt.rle")
};

const u8 sSector3_13_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    3, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    3, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    3, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    3, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 7, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_13_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_13_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_14_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector3_14_Clipdata.tt.rle")
};

const u8 sSector3_14_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector3_14_Bg2.tt.rle")
};

const u8 sSector3_14_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector3_14_Bg1.tt.rle")
};

const u8 sSector3_14_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    10, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    12, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    15, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_15_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector3_15_Clipdata.tt.rle")
};

const u8 sSector3_15_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector3_15_Bg2.tt.rle")
};

const u8 sSector3_15_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector3_15_Bg1.tt.rle")
};

const u8 sSector3_15_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)] = {
    5, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    6, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    7, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    12, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    16, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    16, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    19, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    20, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    29, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    29, 20, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_15_Bg0[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector3_15_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_16_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_16_Clipdata.tt.rle")
};

const u8 sSector3_16_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_16_Bg2.tt.rle")
};

const u8 sSector3_16_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_16_Bg1.tt.rle")
};

const u8 sSector3_16_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    2, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    5, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    8, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_16_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_16_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_17_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_17_Clipdata.tt.rle")
};

const u8 sSector3_17_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_17_Bg2.tt.rle")
};

const u8 sSector3_17_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_17_Bg1.tt.rle")
};

const u8 sSector3_17_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    5, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    6, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 7, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_18_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_3_18, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    16, 31, // X bounds
    2, 13, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_18_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_18_Clipdata.tt.rle")
};

const u8 sSector3_18_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_18_Bg2.tt.rle")
};

const u8 sSector3_18_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_18_Bg1.tt.rle")
};

const u8 sSector3_18_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_19_Scrolls[SCROLL_DATA_COUNT(4)] = {
    SECTOR_3_19, // Room
    4, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 12, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 46, // X bounds
    12, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 46, // X bounds
    7, 27, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 3
    46, 61, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_19_Clipdata[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector3_19_Clipdata.tt.rle")
};

const u8 sSector3_19_Bg2[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector3_19_Bg2.tt.rle")
};

const u8 sSector3_19_Bg1[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector3_19_Bg1.tt.rle")
};

const u8 sSector3_19_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    16, 37, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    17, 34, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 26, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    18, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    20, 6, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    20, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_19_Bg0[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector3_19_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_20_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_3_20, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector3_20_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector3_20_Clipdata.tt.rle")
};

const u8 sSector3_20_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector3_20_Bg2.tt.rle")
};

const u8 sSector3_20_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector3_20_Bg1.tt.rle")
};

const u8 sSector3_20_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    15, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_21_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_21_Clipdata.tt.rle")
};

const u8 sSector3_21_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_21_Bg2.tt.rle")
};

const u8 sSector3_21_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_21_Bg1.tt.rle")
};

const u8 sSector3_21_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    6, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    10, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_22_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_3_22, // Room
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

const u8 sSector3_22_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector3_22_Clipdata.tt.rle")
};

const u8 sSector3_22_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector3_22_Bg2.tt.rle")
};

const u8 sSector3_22_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector3_22_Bg1.tt.rle")
};

const u8 sSector3_22_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    4, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_22_Bg0[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector3_22_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_23_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_3_23, // Room
    2, // Count

    // Scroll 0
    16, 31, // X bounds
    2, 12, // Y bounds
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

const u8 sSector3_23_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_23_Clipdata.tt.rle")
};

const u8 sSector3_23_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_23_Bg2.tt.rle")
};

const u8 sSector3_23_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_23_Bg1.tt.rle")
};

const u8 sSector3_23_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    5, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    20, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    20, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_24_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_3_24, // Room
    3, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 13, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 17, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_24_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_24_Clipdata.tt.rle")
};

const u8 sSector3_24_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_24_Bg2.tt.rle")
};

const u8 sSector3_24_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_24_Bg1.tt.rle")
};

const u8 sSector3_24_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    5, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    9, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    11, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    11, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    11, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_25_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_25_Clipdata.tt.rle")
};

const u8 sSector3_25_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_25_Bg2.tt.rle")
};

const u8 sSector3_25_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_25_Bg1.tt.rle")
};

const u8 sSector3_25_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    14, 8, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    15, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    20, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_26_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_26_Clipdata.tt.rle")
};

const u8 sSector3_26_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_26_Bg2.tt.rle")
};

const u8 sSector3_26_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_26_Bg1.tt.rle")
};

const u8 sSector3_26_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_27_Clipdata[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector3_27_Clipdata.tt.rle")
};

const u8 sSector3_27_Bg2[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector3_27_Bg2.tt.rle")
};

const u8 sSector3_27_SpriteData1[ROOM_SPRITE_DATA_COUNT(13)] = {
    4, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 36, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 30, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 27, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 33, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 40, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 44, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 49, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 53, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_27_Bg1[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector3_27_Bg1.tt.rle")
};

const u8 sSector3_27_SpriteData0[ROOM_SPRITE_DATA_COUNT(16)] = {
    6, 29, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 20, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 29, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 32, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 34, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 38, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 42, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 46, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 49, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 53, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_27_Bg0[] = {
    64, 14,
    _INCBIN_U8("data/rooms/Sector3_27_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_28_Scrolls[SCROLL_DATA_COUNT(4)] = {
    SECTOR_3_28, // Room
    4, // Count

    // Scroll 0
    2, 32, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    32, 46, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 25, // X bounds
    2, 22, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 3
    2, 16, // X bounds
    31, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_28_Clipdata[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector3_28_Clipdata.tt.rle")
};

const u8 sSector3_28_Bg2[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector3_28_Bg2.tt.rle")
};

const u8 sSector3_28_Bg1[] = {
    49, 44,
    _INCBIN_U8("data/rooms/Sector3_28_Bg1.tt.rle")
};

const u8 sSector3_28_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    21, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_29_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_29_Clipdata.tt.rle")
};

const u8 sSector3_29_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_29_Bg2.tt.rle")
};

const u8 sSector3_29_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_29_Bg1.tt.rle")
};

const u8 sSector3_29_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    5, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 13, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_30_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_3_30, // Room
    3, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 12, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 17, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_30_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_30_Clipdata.tt.rle")
};

const u8 sSector3_30_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_30_Bg2.tt.rle")
};

const u8 sSector3_30_SpriteData1[ROOM_SPRITE_DATA_COUNT(9)] = {
    5, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    5, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 21, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 17, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 21, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 24, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 28, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    16, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_30_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_30_Bg1.tt.rle")
};

const u8 sSector3_30_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_31_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_31_Clipdata.tt.rle")
};

const u8 sSector3_31_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_31_Bg2.tt.rle")
};

const u8 sSector3_31_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_31_Bg1.tt.rle")
};

const u8 sSector3_31_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_32_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_32_Clipdata.tt.rle")
};

const u8 sSector3_32_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_32_Bg2.tt.rle")
};

const u8 sSector3_32_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_32_Bg1.tt.rle")
};

const u8 sSector3_32_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_33_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_33_Clipdata.tt.rle")
};

const u8 sSector3_33_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_33_Bg2.tt.rle")
};

const u8 sSector3_33_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_33_Bg1.tt.rle")
};

const u8 sSector3_33_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    3, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    6, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    10, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_34_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_3_34, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    16, 31, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector3_34_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_34_Clipdata.tt.rle")
};

const u8 sSector3_34_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_34_Bg2.tt.rle")
};

const u8 sSector3_34_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector3_34_Bg1.tt.rle")
};

const u8 sSector3_34_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    13, 22, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    14, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    16, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    16, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    17, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    19, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    19, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_35_Clipdata[] = {
    19, 114,
    _INCBIN_U8("data/rooms/Sector3_35_Clipdata.tt.rle")
};

const u8 sSector3_35_Bg2[] = {
    19, 114,
    _INCBIN_U8("data/rooms/Sector3_35_Bg2.tt.rle")
};

const u8 sSector3_35_Bg1[] = {
    19, 114,
    _INCBIN_U8("data/rooms/Sector3_35_Bg1.tt.rle")
};

const u8 sSector3_35_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_35_Bg0[] = {
    19, 114,
    _INCBIN_U8("data/rooms/Sector3_35_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_36_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector3_36_Clipdata.tt.rle")
};

const u8 sSector3_36_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector3_36_Bg2.tt.rle")
};

const u8 sSector3_36_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector3_36_Bg1.tt.rle")
};

const u8 sSector3_36_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    3, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    5, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 6, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 13, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 23, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector3_36_Bg0[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector3_36_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector3_37_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_37_Clipdata.tt.rle")
};

const u8 sSector3_37_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_37_Bg2.tt.rle")
};

const u8 sSector3_37_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_37_Bg1.tt.rle")
};

const u8 sSector3_37_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_38_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_38_Clipdata.tt.rle")
};

const u8 sSector3_38_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_38_Bg2.tt.rle")
};

const u8 sSector3_38_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector3_38_Bg1.tt.rle")
};

const u8 sSector3_38_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector3_17_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector3_17_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector3_3_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector3_3_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector3_6_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector3_6_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector3_10_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector3_10_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector3_11_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector3_11_Bg3.tt.lz")
};
ALIGN2();
