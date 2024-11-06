#include "data/rooms/sector_6.h"

const u8 sTileset_44_Gfx[] = INCBIN_U8("data/tilesets/44.gfx.lz"); ALIGN2();

const u8 sTileset_62_Gfx[] = INCBIN_U8("data/tilesets/62.gfx.lz"); ALIGN2();

const u8 sTileset_3_Gfx[] = INCBIN_U8("data/tilesets/3.gfx.lz"); ALIGN2();

const u8 sTileset_44_Bg_Gfx[] = INCBIN_U8("data/tilesets/44_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_3_Bg_Gfx[] = INCBIN_U8("data/tilesets/3_Bg.gfx.lz"); ALIGN2();

const u16 sTileset_44_Pal[14 * 16] = INCBIN_U16("data/tilesets/44.pal");

const u16 sAnimatedPal_18[7 * 16] = INCBIN_U16("data/tilesets/animated_palettes/18.pal");

const u16 sTileset_93_Pal[14 * 16] = INCBIN_U16("data/tilesets/93.pal");

const u16 sTileset_3_Pal[14 * 16] = INCBIN_U16("data/tilesets/3.pal");

const u16 sTileset_44_Tilemap[0x802] = INCBIN_U16("data/tilesets/44.tt");

const u16 sTileset_62_Tilemap[0x802] = INCBIN_U16("data/tilesets/62.tt");

const u16 sTileset_3_Tilemap[0x802] = INCBIN_U16("data/tilesets/3.tt");

const u8 sSector6_0_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_0, // Room
    2, // Count

    // Scroll 0
    17, 46, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 19, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_0_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector6_0_Clipdata.tt.rle")
};

const u8 sSector6_0_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector6_0_Bg2.tt.rle")
};

const u8 sSector6_0_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector6_0_Bg1.tt.rle")
};

const u8 sSector6_0_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    3, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    3, 43, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 31, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 31, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 33, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    10, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    10, 38, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    15, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_1_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_1_Clipdata.tt.rle")
};

const u8 sSector6_1_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_1_Bg2.tt.rle")
};

const u8 sSector6_1_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_1_Bg1.tt.rle")
};

const u8 sSector6_1_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_2_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_2_Clipdata.tt.rle")
};

const u8 sSector6_2_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_2_Bg2.tt.rle")
};

const u8 sSector6_2_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_2_Bg1.tt.rle")
};

const u8 sSector6_2_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_3_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_3_Clipdata.tt.rle")
};

const u8 sSector6_3_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_3_Bg2.tt.rle")
};

const u8 sSector6_3_SpriteData1[ROOM_SPRITE_DATA_COUNT(11)] = {
    4, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    4, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    13, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    13, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    15, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    16, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    16, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    18, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    20, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_3_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_3_Bg1.tt.rle")
};

const u8 sSector6_3_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    18, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    18, 19, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_4_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_4_Clipdata.tt.rle")
};

const u8 sSector6_4_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_4_Bg2.tt.rle")
};

const u8 sSector6_4_SpriteData1[ROOM_SPRITE_DATA_COUNT(6)] = {
    3, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    3, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    3, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    6, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_4_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_4_Bg1.tt.rle")
};

const u8 sSector6_4_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    4, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_5_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_6_5, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    15, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    16, 31, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_5_Clipdata[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector6_5_Clipdata.tt.rle")
};

const u8 sSector6_5_Bg2[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector6_5_Bg2.tt.rle")
};

const u8 sSector6_5_SpriteData1[ROOM_SPRITE_DATA_COUNT(9)] = {
    3, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    11, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    20, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    20, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    27, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    28, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    31, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    37, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_5_Bg1[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector6_5_Bg1.tt.rle")
};

const u8 sSector6_5_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    3, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    27, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    37, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_6_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_6_Clipdata.tt.rle")
};

const u8 sSector6_6_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_6_Bg2.tt.rle")
};

const u8 sSector6_6_SpriteData1[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    4, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    4, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    6, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    6, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_6_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_6_Bg1.tt.rle")
};

const u8 sSector6_6_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    4, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    4, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    6, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    6, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_7_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_6_7, // Room
    1, // Count

    // Scroll 0
    17, 46, // X bounds
    2, 11, // Y bounds
    17, 8, // Breakable block position
    0, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector6_7_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_7_Clipdata.tt.rle")
};

const u8 sSector6_7_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_7_Bg2.tt.rle")
};

const u8 sSector6_7_SpriteData1[ROOM_SPRITE_DATA_COUNT(10)] = {
    5, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 34, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    6, 36, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    7, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    7, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    7, 33, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    7, 37, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    9, 34, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    9, 36, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    10, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_7_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_7_Bg1.tt.rle")
};

const u8 sSector6_7_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    5, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 34, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    6, 36, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    7, 25, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    7, 33, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    7, 37, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    9, 34, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    9, 36, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    10, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_8_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_8, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    30, 46, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_8_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector6_8_Clipdata.tt.rle")
};

const u8 sSector6_8_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector6_8_Bg2.tt.rle")
};

const u8 sSector6_8_SpriteData1[ROOM_SPRITE_DATA_COUNT(14)] = {
    3, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    7, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    8, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    12, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    12, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    13, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    18, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    20, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    22, 17, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    23, 41, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    24, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_8_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector6_8_Bg1.tt.rle")
};

const u8 sSector6_8_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    7, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    13, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    13, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    23, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    23, 41, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    24, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_9_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_6_9, // Room
    3, // Count

    // Scroll 0
    2, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    9, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 61, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_9_Clipdata[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector6_9_Clipdata.tt.rle")
};

const u8 sSector6_9_Bg2[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector6_9_Bg2.tt.rle")
};

const u8 sSector6_9_Bg1[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector6_9_Bg1.tt.rle")
};

const u8 sSector6_9_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    3, 45, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    4, 42, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    4, 48, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    14, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    16, 24, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_10_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_10_Clipdata.tt.rle")
};

const u8 sSector6_10_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_10_Bg2.tt.rle")
};

const u8 sSector6_10_SpriteData1[ROOM_SPRITE_DATA_COUNT(9)] = {
    6, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    7, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    11, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    13, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    14, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    15, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    18, 3, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    19, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    19, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_10_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_10_Bg1.tt.rle")
};

const u8 sSector6_10_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    6, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    11, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    13, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    15, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    18, 3, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    19, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    19, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_11_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_11_Clipdata.tt.rle")
};

const u8 sSector6_11_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_11_Bg2.tt.rle")
};

const u8 sSector6_11_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_11_Bg1.tt.rle")
};

const u8 sSector6_11_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_12_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_12, // Room
    2, // Count

    // Scroll 0
    2, 19, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    16, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_12_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_12_Clipdata.tt.rle")
};

const u8 sSector6_12_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_12_Bg2.tt.rle")
};

const u8 sSector6_12_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_12_Bg1.tt.rle")
};

const u8 sSector6_12_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    4, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    5, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    7, 24, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    8, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    8, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    9, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_13_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_6_13, // Room
    1, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 25, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_13_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector6_13_Clipdata.tt.rle")
};

const u8 sSector6_13_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector6_13_Bg2.tt.rle")
};

const u8 sSector6_13_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector6_13_Bg1.tt.rle")
};

const u8 sSector6_13_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    15, 17, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    16, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    19, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_14_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_14, // Room
    2, // Count

    // Scroll 0
    17, 31, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 17, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_14_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_14_Clipdata.tt.rle")
};

const u8 sSector6_14_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_14_Bg2.tt.rle")
};

const u8 sSector6_14_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_14_Bg1.tt.rle")
};

const u8 sSector6_14_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    3, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    3, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    11, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    12, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    13, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    17, 27, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    18, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_15_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_15_Clipdata.tt.rle")
};

const u8 sSector6_15_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_15_Bg2.tt.rle")
};

const u8 sSector6_15_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_15_Bg1.tt.rle")
};

const u8 sSector6_15_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    3, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    3, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    3, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_16_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_16, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 11, // Y bounds
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

const u8 sSector6_16_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_16_Clipdata.tt.rle")
};

const u8 sSector6_16_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_16_Bg2.tt.rle")
};

const u8 sSector6_16_SpriteData1[ROOM_SPRITE_DATA_COUNT(3)] = {
    14, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    15, 18, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    20, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_16_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_16_Bg1.tt.rle")
};

const u8 sSector6_16_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    15, 18, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_17_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_6_17, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector6_17_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_17_Clipdata.tt.rle")
};

const u8 sSector6_17_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_17_Bg2.tt.rle")
};

const u8 sSector6_17_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_17_Bg1.tt.rle")
};

const u8 sSector6_17_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    15, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_18_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_18, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    2, 12, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_18_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_18_Clipdata.tt.rle")
};

const u8 sSector6_18_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_18_Bg2.tt.rle")
};

const u8 sSector6_18_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_18_Bg1.tt.rle")
};

const u8 sSector6_18_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    3, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    4, 5, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    8, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    9, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    20, 27, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_19_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_19, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_19_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_19_Clipdata.tt.rle")
};

const u8 sSector6_19_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_19_Bg2.tt.rle")
};

const u8 sSector6_19_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector6_19_Bg1.tt.rle")
};

const u8 sSector6_19_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    16, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    16, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    17, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    19, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_20_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector6_20_Clipdata.tt.rle")
};

const u8 sSector6_20_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector6_20_Bg2.tt.rle")
};

const u8 sSector6_20_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector6_20_Bg1.tt.rle")
};

const u8 sSector6_20_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    4, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    11, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    13, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    17, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    22, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    23, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_21_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_21_Clipdata.tt.rle")
};

const u8 sSector6_21_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_21_Bg2.tt.rle")
};

const u8 sSector6_21_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_21_Bg1.tt.rle")
};

const u8 sSector6_21_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_22_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_22_Clipdata.tt.rle")
};

const u8 sSector6_22_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_22_Bg2.tt.rle")
};

const u8 sSector6_22_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_22_Bg1.tt.rle")
};

const u8 sSector6_22_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_23_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_23_Clipdata.tt.rle")
};

const u8 sSector6_23_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_23_Bg2.tt.rle")
};

const u8 sSector6_23_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_23_Bg1.tt.rle")
};

const u8 sSector6_23_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_24_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_6_24, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    16, 10, // Breakable block position
    1, // Breakable block direction
    31, // Breakable block Y bound extension
};

const u8 sSector6_24_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_24_Clipdata.tt.rle")
};

const u8 sSector6_24_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_24_Bg2.tt.rle")
};

const u8 sSector6_24_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_24_Bg1.tt.rle")
};

const u8 sSector6_24_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    6, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_25_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_25_Clipdata.tt.rle")
};

const u8 sSector6_25_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_25_Bg2.tt.rle")
};

const u8 sSector6_25_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_25_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_25_Bg1.tt.rle")
};

const u8 sSector6_25_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_26_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_26, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    4, 7, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    12, 22, // Y bounds
    14, 12, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector6_26_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_26_Clipdata.tt.rle")
};

const u8 sSector6_26_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_26_Bg2.tt.rle")
};

const u8 sSector6_26_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_26_Bg1.tt.rle")
};

const u8 sSector6_26_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    20, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_27_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_27, // Room
    2, // Count

    // Scroll 0
    2, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    32, 46, // X bounds
    9, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_27_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector6_27_Clipdata.tt.rle")
};

const u8 sSector6_27_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector6_27_Bg2.tt.rle")
};

const u8 sSector6_27_SpriteData1_Unused[ROOM_SPRITE_DATA_COUNT(1)] = {
    6, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_27_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector6_27_Bg1.tt.rle")
};

const u8 sSector6_27_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    7, 17, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_28_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_6_28, // Room
    1, // Count

    // Scroll 0
    17, 31, // X bounds
    2, 11, // Y bounds
    17, 10, // Breakable block position
    0, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector6_28_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_28_Clipdata.tt.rle")
};

const u8 sSector6_28_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_28_Bg2.tt.rle")
};

const u8 sSector6_28_SpriteData1[ROOM_SPRITE_DATA_COUNT(8)] = {
    3, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    3, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    4, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 24, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    6, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    7, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector6_28_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_28_Bg1.tt.rle")
};

const u8 sSector6_28_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_29_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_29_Clipdata.tt.rle")
};

const u8 sSector6_29_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_29_Bg2.tt.rle")
};

const u8 sSector6_29_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_29_Bg1.tt.rle")
};

const u8 sSector6_29_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_30_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_6_30, // Room
    2, // Count

    // Scroll 0
    17, 31, // X bounds
    2, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 18, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_30_Clipdata[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector6_30_Clipdata.tt.rle")
};

const u8 sSector6_30_Bg2[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector6_30_Bg2.tt.rle")
};

const u8 sSector6_30_Bg1[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector6_30_Bg1.tt.rle")
};

const u8 sSector6_30_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    3, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    12, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    14, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    14, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    23, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    27, 24, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    33, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_31_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_6_31, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_31_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector6_31_Clipdata.tt.rle")
};

const u8 sSector6_31_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector6_31_Bg2.tt.rle")
};

const u8 sSector6_31_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector6_31_Bg1.tt.rle")
};

const u8 sSector6_31_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    3, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    3, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    5, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    15, 6, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    18, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    21, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    23, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    25, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    27, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    30, 6, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    33, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_32_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_32_Clipdata.tt.rle")
};

const u8 sSector6_32_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_32_Bg2.tt.rle")
};

const u8 sSector6_32_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector6_32_Bg1.tt.rle")
};

const u8 sSector6_32_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    3, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    11, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    12, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_33_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_6_33, // Room
    3, // Count

    // Scroll 0
    2, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    9, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 61, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector6_33_Clipdata[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector6_33_Clipdata.tt.rle")
};

const u8 sSector6_33_Bg2[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector6_33_Bg2.tt.rle")
};

const u8 sSector6_33_Bg1[] = {
    64, 24,
    _INCBIN_U8("data/rooms/Sector6_33_Bg1.tt.rle")
};

const u8 sSector6_33_SpriteData0[ROOM_SPRITE_DATA_COUNT(13)] = {
    3, 45, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    4, 42, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    4, 48, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    6, 34, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 40, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 45, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    8, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 33, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 47, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    13, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    14, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    16, 24, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_34_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_34_Clipdata.tt.rle")
};

const u8 sSector6_34_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_34_Bg2.tt.rle")
};

const u8 sSector6_34_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_34_Bg1.tt.rle")
};

const u8 sSector6_34_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_35_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_35_Clipdata.tt.rle")
};

const u8 sSector6_35_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_35_Bg2.tt.rle")
};

const u8 sSector6_35_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_35_Bg1.tt.rle")
};

const u8 sSector6_35_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_36_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_36_Clipdata.tt.rle")
};

const u8 sSector6_36_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_36_Bg2.tt.rle")
};

const u8 sSector6_36_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_36_Bg1.tt.rle")
};

const u8 sSector6_36_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_37_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_37_Clipdata.tt.rle")
};

const u8 sSector6_37_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_37_Bg2.tt.rle")
};

const u8 sSector6_37_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector6_37_Bg1.tt.rle")
};

const u8 sSector6_37_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_38_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_38_Clipdata.tt.rle")
};

const u8 sSector6_38_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_38_Bg2.tt.rle")
};

const u8 sSector6_38_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector6_38_Bg1.tt.rle")
};

const u8 sSector6_38_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    8, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    8, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    8, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    8, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    8, 20, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    8, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    8, 27, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    8, 28, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    8, 32, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    8, 34, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    8, 36, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_39_Clipdata[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector6_39_Clipdata.tt.rle")
};

const u8 sSector6_39_Bg2[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector6_39_Bg2.tt.rle")
};

const u8 sSector6_39_Bg1[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector6_39_Bg1.tt.rle")
};

const u8 sSector6_39_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_40_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_40_Clipdata.tt.rle")
};

const u8 sSector6_40_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_40_Bg2.tt.rle")
};

const u8 sSector6_40_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector6_40_Bg1.tt.rle")
};

const u8 sSector6_40_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    5, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    7, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    7, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    7, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    7, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    8, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector6_3_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector6_3_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector6_16_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector6_16_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector6_9_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector6_9_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector6_3_Bg0[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector6_3_Bg0.tt.lz")
};
ALIGN2();

const u8 sSector6_9_Bg0[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector6_9_Bg0.tt.lz")
};
ALIGN2();

static const u8 sBlob_5594a8_58b3cc[] = INCBIN_U8("data/Blob_5594a8_58b3cc.bin");
