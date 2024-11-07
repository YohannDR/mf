#include "data/rooms/sector_2.h"

const u32 sTileset_1_Gfx[] = INCBIN_U32("data/tilesets/1.gfx.lz");

const u32 sTileset_32_Gfx[] = INCBIN_U32("data/tilesets/32.gfx.lz");

const u32 sTileset_59_Gfx[] = INCBIN_U32("data/tilesets/59.gfx.lz");

const u32 sTileset_9_Gfx[] = INCBIN_U32("data/tilesets/9.gfx.lz");

const u32 sTileset_58_Gfx[] = INCBIN_U32("data/tilesets/58.gfx.lz");

const u32 sTileset_95_Gfx[] = INCBIN_U32("data/tilesets/95.gfx.lz");

const u32 sTileset_31_Bg_Gfx[] = INCBIN_U32("data/tilesets/31_Bg.gfx.lz");

const u32 sTileset_32_Bg_Gfx[] = INCBIN_U32("data/tilesets/32_Bg.gfx.lz");

const u32 sTileset_59_Bg_Gfx[] = INCBIN_U32("data/tilesets/59_Bg.gfx.lz");

const u32 sTileset_65_Bg_Gfx[] = INCBIN_U32("data/tilesets/65_Bg.gfx.lz");

const u32 sTileset_9_Bg_Gfx[] = INCBIN_U32("data/tilesets/9_Bg.gfx.lz");

const u32 sTileset_64_Bg_Gfx[] = INCBIN_U32("data/tilesets/64_Bg.gfx.lz");

const u32 sTileset_58_Bg_Gfx[] = INCBIN_U32("data/tilesets/58_Bg.gfx.lz");

const u16 sTileset_1_Tilemap[0x6c2] = INCBIN_U16("data/tilesets/1.tt");

const u16 sTileset_32_Tilemap[0x602] = INCBIN_U16("data/tilesets/32.tt");

const u16 sTileset_59_Tilemap[0x702] = INCBIN_U16("data/tilesets/59.tt");

const u16 sTileset_9_Tilemap[0x702] = INCBIN_U16("data/tilesets/9.tt");

const u16 sTileset_58_Tilemap[0x7c2] = INCBIN_U16("data/tilesets/58.tt");

const u16 sTileset_95_Tilemap[0x7c2] = INCBIN_U16("data/tilesets/95.tt");

const u16 sTileset_1_Pal[14 * 16] = INCBIN_U16("data/tilesets/1.pal");

const u16 sTileset_32_Pal[14 * 16] = INCBIN_U16("data/tilesets/32.pal");

const u16 sTileset_59_Pal[14 * 16] = INCBIN_U16("data/tilesets/59.pal");

const u16 sTileset_92_Pal[14 * 16] = INCBIN_U16("data/tilesets/92.pal");

const u16 sTileset_9_Pal[14 * 16] = INCBIN_U16("data/tilesets/9.pal");

const u16 sTileset_58_Pal[14 * 16] = INCBIN_U16("data/tilesets/58.pal");

const u16 sTileset_95_Pal[14 * 16] = INCBIN_U16("data/tilesets/95.pal");

const u8 sSector2_0_Clipdata[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_0_Clipdata.tt.rle")
};

const u8 sSector2_0_SpriteData2[ROOM_SPRITE_DATA_COUNT(12)] = {
    5, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    9, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    19, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    21, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    22, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    23, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    26, 17, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    27, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    29, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    30, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    35, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    37, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_0_Bg2[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_0_Bg2.tt.rle")
};

const u8 sSector2_0_SpriteData1[ROOM_SPRITE_DATA_COUNT(7)] = {
    9, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    21, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    24, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    25, 17, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    28, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    30, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    37, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_0_Bg1[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_0_Bg1.tt.rle")
};

const u8 sSector2_0_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    9, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    21, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    22, 26, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    23, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    27, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    27, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    30, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    37, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_1_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_1_Clipdata.tt.rle")
};

const u8 sSector2_1_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_1_Bg2.tt.rle")
};

const u8 sSector2_1_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_1_Bg1.tt.rle")
};

const u8 sSector2_1_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_2_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_2_Clipdata.tt.rle")
};

const u8 sSector2_2_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_2_Bg2.tt.rle")
};

const u8 sSector2_2_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_2_Bg1.tt.rle")
};

const u8 sSector2_2_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_3_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_3_Clipdata.tt.rle")
};

const u8 sSector2_3_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_3_Bg2.tt.rle")
};

const u8 sSector2_3_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_3_Bg1.tt.rle")
};

const u8 sSector2_3_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    3, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    5, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    7, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_4_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_4_Clipdata.tt.rle")
};

const u8 sSector2_4_SpriteData2[ROOM_SPRITE_DATA_COUNT(5)] = {
    5, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    10, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_4_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_4_Bg2.tt.rle")
};

const u8 sSector2_4_SpriteData1[ROOM_SPRITE_DATA_COUNT(3)] = {
    7, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    10, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    10, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_4_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_4_Bg1.tt.rle")
};

const u8 sSector2_4_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    6, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    10, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_5_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_5, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    16, 31, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_5_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector2_5_Clipdata.tt.rle")
};

const u8 sSector2_5_SpriteData2[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    17, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    17, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    19, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    27, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    29, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_5_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector2_5_Bg2.tt.rle")
};

const u8 sSector2_5_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    17, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    19, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    29, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_5_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector2_5_Bg1.tt.rle")
};

const u8 sSector2_5_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    8, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    17, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    19, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    29, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_6_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_2_6, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    16, 6, // Breakable block position
    1, // Breakable block direction
    31, // Breakable block Y bound extension
};

const u8 sSector2_6_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_6_Clipdata.tt.rle")
};

const u8 sSector2_6_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_6_Bg2.tt.rle")
};

const u8 sSector2_6_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_6_Bg1.tt.rle")
};

const u8 sSector2_6_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    3, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    3, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    5, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_7_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_7_Clipdata.tt.rle")
};

const u8 sSector2_7_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_7_Bg2.tt.rle")
};

const u8 sSector2_7_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_7_Bg1.tt.rle")
};

const u8 sSector2_7_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    8, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    15, 13, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    18, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_8_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_8_Clipdata.tt.rle")
};

const u8 sSector2_8_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_8_Bg2.tt.rle")
};

const u8 sSector2_8_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_8_Bg1.tt.rle")
};

const u8 sSector2_8_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_9_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_9, // Room
    2, // Count

    // Scroll 0
    2, 17, // X bounds
    2, 14, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    2, 61, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_9_Clipdata[] = {
    34, 64,
    _INCBIN_U8("data/rooms/Sector2_9_Clipdata.tt.rle")
};

const u8 sSector2_9_SpriteData2[ROOM_SPRITE_DATA_COUNT(16)] = {
    3, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    16, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    27, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    28, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    29, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    33, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    33, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    33, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    38, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    38, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    46, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    55, 28, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    56, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_9_Bg2[] = {
    34, 64,
    _INCBIN_U8("data/rooms/Sector2_9_Bg2.tt.rle")
};

const u8 sSector2_9_SpriteData1[ROOM_SPRITE_DATA_COUNT(11)] = {
    3, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    16, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    30, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    33, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    33, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    38, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    38, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    46, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    56, 28, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_9_Bg1[] = {
    34, 64,
    _INCBIN_U8("data/rooms/Sector2_9_Bg1.tt.rle")
};

const u8 sSector2_9_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    3, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    16, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    29, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    33, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    33, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    38, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    38, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    46, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    56, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_10_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_10, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 31, // X bounds
    29, 39, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_10_Clipdata[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_10_Clipdata.tt.rle")
};

const u8 sSector2_10_SpriteData2[ROOM_SPRITE_DATA_COUNT(13)] = {
    3, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    4, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    11, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    11, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    14, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    14, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    19, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    20, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    20, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    26, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    27, 3, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    27, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    30, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_10_Bg2[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_10_Bg2.tt.rle")
};

const u8 sSector2_10_SpriteData1[ROOM_SPRITE_DATA_COUNT(8)] = {
    3, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    4, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    11, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    16, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    19, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    20, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    26, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    27, 3, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_10_Bg1[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_10_Bg1.tt.rle")
};

const u8 sSector2_10_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    11, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    16, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    19, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    22, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    28, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    30, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    30, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    35, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_11_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector2_11_Clipdata.tt.rle")
};

const u8 sSector2_11_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector2_11_Bg2.tt.rle")
};

const u8 sSector2_11_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector2_11_Bg1.tt.rle")
};

const u8 sSector2_11_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    6, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    10, 37, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    11, 28, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_12_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_12_Clipdata.tt.rle")
};

const u8 sSector2_12_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_12_Bg2.tt.rle")
};

const u8 sSector2_12_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_12_Bg1.tt.rle")
};

const u8 sSector2_12_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    4, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    11, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    12, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    12, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    18, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    19, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_13_Clipdata[] = {
    19, 84,
    _INCBIN_U8("data/rooms/Sector2_13_Clipdata.tt.rle")
};

const u8 sSector2_13_Bg2[] = {
    19, 84,
    _INCBIN_U8("data/rooms/Sector2_13_Bg2.tt.rle")
};

const u8 sSector2_13_Bg1[] = {
    19, 84,
    _INCBIN_U8("data/rooms/Sector2_13_Bg1.tt.rle")
};

const u8 sSector2_13_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    18, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    29, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    40, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    44, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    58, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    64, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    67, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    80, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_14_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_14_Clipdata.tt.rle")
};

const u8 sSector2_14_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_14_Bg2.tt.rle")
};

const u8 sSector2_14_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_14_Bg1.tt.rle")
};

const u8 sSector2_14_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    9, 11, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    9, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    9, 18, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    9, 22, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_15_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_15_Clipdata.tt.rle")
};

const u8 sSector2_15_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_15_Bg2.tt.rle")
};

const u8 sSector2_15_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_15_Bg1.tt.rle")
};

const u8 sSector2_15_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    7, 26, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    8, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_16_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_16_Clipdata.tt.rle")
};

const u8 sSector2_16_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_16_Bg2.tt.rle")
};

const u8 sSector2_16_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_16_Bg1.tt.rle")
};

const u8 sSector2_16_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_17_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_2_17, // Room
    3, // Count

    // Scroll 0
    2, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    32, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    31, 46, // X bounds
    11, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_17_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_17_Clipdata.tt.rle")
};

const u8 sSector2_17_SpriteData2[ROOM_SPRITE_DATA_COUNT(14)] = {
    3, 40, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    4, 42, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    5, 43, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    5, 45, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    14, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    14, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    15, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    17, 20, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    17, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    17, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    20, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_17_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_17_Bg2.tt.rle")
};

const u8 sSector2_17_SpriteData1[ROOM_SPRITE_DATA_COUNT(8)] = {
    3, 39, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    5, 45, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    14, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    14, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    17, 20, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_17_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_17_Bg1.tt.rle")
};

const u8 sSector2_17_SpriteData0[ROOM_SPRITE_DATA_COUNT(13)] = {
    3, 39, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    5, 45, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    15, 24, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    16, 45, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    20, 13, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    20, 16, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    20, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    20, 20, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_18_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_18, // Room
    2, // Count

    // Scroll 0
    2, 25, // X bounds
    2, 14, // Y bounds
    25, 4, // Breakable block position
    1, // Breakable block direction
    46, // Breakable block Y bound extension

    // Scroll 1
    7, 25, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_18_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_18_Clipdata.tt.rle")
};

const u8 sSector2_18_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_18_Bg2.tt.rle")
};

const u8 sSector2_18_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_18_Bg1.tt.rle")
};

const u8 sSector2_18_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    15, 17, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    16, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    20, 20, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_19_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_19, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    20, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_19_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector2_19_Clipdata.tt.rle")
};

const u8 sSector2_19_SpriteData2[ROOM_SPRITE_DATA_COUNT(5)] = {
    9, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    11, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    15, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    15, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    15, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_19_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector2_19_Bg2.tt.rle")
};

const u8 sSector2_19_SpriteData1[ROOM_SPRITE_DATA_COUNT(3)] = {
    9, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    15, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    15, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_19_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector2_19_Bg1.tt.rle")
};

const u8 sSector2_19_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    9, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    14, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    15, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_20_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_2_20, // Room
    3, // Count

    // Scroll 0
    2, 61, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 31, // X bounds
    12, 22, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 31, // X bounds
    2, 13, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_20_Clipdata[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector2_20_Clipdata.tt.rle")
};

const u8 sSector2_20_Bg2[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector2_20_Bg2.tt.rle")
};

const u8 sSector2_20_Bg1[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector2_20_Bg1.tt.rle")
};

const u8 sSector2_20_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    4, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    5, 20, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    14, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    17, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    23, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    24, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    25, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    28, 31, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_20_Bg0[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector2_20_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector2_21_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_21, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
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

const u8 sSector2_21_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_21_Clipdata.tt.rle")
};

const u8 sSector2_21_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_21_Bg2.tt.rle")
};

const u8 sSector2_21_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_21_Bg1.tt.rle")
};

const u8 sSector2_21_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    4, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    9, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    9, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_22_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_22, // Room
    2, // Count

    // Scroll 0
    3, 17, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    11, 20, // Y bounds
    17, 19, // Breakable block position
    1, // Breakable block direction
    31, // Breakable block Y bound extension
};

const u8 sSector2_22_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_22_Clipdata.tt.rle")
};

const u8 sSector2_22_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_22_Bg2.tt.rle")
};

const u8 sSector2_22_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_22_Bg1.tt.rle")
};

const u8 sSector2_22_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    13, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    13, 25, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    14, 3, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    16, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    19, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    20, 3, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    20, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    20, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_22_Bg0[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_22_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector2_23_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_23_Clipdata.tt.rle")
};

const u8 sSector2_23_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_23_Bg2.tt.rle")
};

const u8 sSector2_23_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_23_Bg1.tt.rle")
};

const u8 sSector2_23_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    3, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    3, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    6, 19, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    8, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    8, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    8, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    8, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    8, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_24_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_24, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    15, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_24_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_24_Clipdata.tt.rle")
};

const u8 sSector2_24_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_24_Bg2.tt.rle")
};

const u8 sSector2_24_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_24_Bg1.tt.rle")
};

const u8 sSector2_24_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    18, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_24_Bg0[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_24_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector2_25_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_25_Clipdata.tt.rle")
};

const u8 sSector2_25_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_25_Bg2.tt.rle")
};

const u8 sSector2_25_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_25_Bg1.tt.rle")
};

const u8 sSector2_25_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    11, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_26_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_26, // Room
    2, // Count

    // Scroll 0
    2, 17, // X bounds
    2, 11, // Y bounds
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

const u8 sSector2_26_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_26_Clipdata.tt.rle")
};

const u8 sSector2_26_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_26_Bg2.tt.rle")
};

const u8 sSector2_26_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_26_Bg1.tt.rle")
};

const u8 sSector2_26_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    20, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_27_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_27, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 21, // Y bounds
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

const u8 sSector2_27_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_27_Clipdata.tt.rle")
};

const u8 sSector2_27_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_27_Bg2.tt.rle")
};

const u8 sSector2_27_SpriteData1[ROOM_SPRITE_DATA_COUNT(6)] = {
    3, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    4, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    12, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    15, 12, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    15, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    18, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_27_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_27_Bg1.tt.rle")
};

const u8 sSector2_27_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    3, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    15, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    16, 13, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    18, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_28_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_28_Clipdata.tt.rle")
};

const u8 sSector2_28_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_28_Bg2.tt.rle")
};

const u8 sSector2_28_SpriteData1[ROOM_SPRITE_DATA_COUNT(5)] = {
    5, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    5, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    6, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_28_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_28_Bg1.tt.rle")
};

const u8 sSector2_28_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    4, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    5, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    5, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    7, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_29_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_2_29, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector2_29_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_29_Clipdata.tt.rle")
};

const u8 sSector2_29_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_29_Bg2.tt.rle")
};

const u8 sSector2_29_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_29_Bg1.tt.rle")
};

const u8 sSector2_29_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    15, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_30_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_30_Clipdata.tt.rle")
};

const u8 sSector2_30_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_30_Bg2.tt.rle")
};

const u8 sSector2_30_SpriteData1[ROOM_SPRITE_DATA_COUNT(5)] = {
    4, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    4, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    5, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    7, 20, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_30_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_30_Bg1.tt.rle")
};

const u8 sSector2_30_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    4, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    7, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    7, 20, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_31_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_2_31, // Room
    3, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    31, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 31, // X bounds
    21, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_31_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector2_31_Clipdata.tt.rle")
};

const u8 sSector2_31_SpriteData2[ROOM_SPRITE_DATA_COUNT(12)] = {
    5, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    14, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    15, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    16, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    16, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    26, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    26, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    28, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    29, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_31_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector2_31_Bg2.tt.rle")
};

const u8 sSector2_31_SpriteData1[ROOM_SPRITE_DATA_COUNT(8)] = {
    6, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    13, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    15, 14, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    18, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    26, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    26, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    29, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_31_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector2_31_Bg1.tt.rle")
};

const u8 sSector2_31_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    4, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    5, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    15, 13, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    18, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    26, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    26, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    29, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_32_Clipdata[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector2_32_Clipdata.tt.rle")
};

const u8 sSector2_32_Bg2[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector2_32_Bg2.tt.rle")
};

const u8 sSector2_32_Bg1[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector2_32_Bg1.tt.rle")
};

const u8 sSector2_32_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)] = {
    4, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    19, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    32, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    32, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    35, 7, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    41, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    42, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    46, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    48, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    49, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    57, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_32_Bg0[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector2_32_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector2_33_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_33, // Room
    2, // Count

    // Scroll 0
    17, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 18, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_33_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector2_33_Clipdata.tt.rle")
};

const u8 sSector2_33_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector2_33_Bg2.tt.rle")
};

const u8 sSector2_33_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector2_33_Bg1.tt.rle")
};

const u8 sSector2_33_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    4, 30, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 37, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    5, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 26, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 38, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_34_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_2_34, // Room
    3, // Count

    // Scroll 0
    2, 61, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 31, // X bounds
    12, 22, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 31, // X bounds
    2, 13, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_34_Clipdata[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector2_34_Clipdata.tt.rle")
};

const u8 sSector2_34_Bg2[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector2_34_Bg2.tt.rle")
};

const u8 sSector2_34_Bg1[] = {
    64, 34,
    _INCBIN_U8("data/rooms/Sector2_34_Bg1.tt.rle")
};

const u8 sSector2_34_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    5, 20, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    14, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    17, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    23, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    24, 16, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    25, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    28, 31, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_35_Clipdata[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector2_35_Clipdata.tt.rle")
};

const u8 sSector2_35_Bg2[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector2_35_Bg2.tt.rle")
};

const u8 sSector2_35_Bg1[] = {
    19, 74,
    _INCBIN_U8("data/rooms/Sector2_35_Bg1.tt.rle")
};

const u8 sSector2_35_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)] = {
    4, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    19, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    32, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    32, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    35, 7, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    41, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    42, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    46, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    48, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    49, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    57, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_36_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_36, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    15, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_36_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_36_Clipdata.tt.rle")
};

const u8 sSector2_36_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_36_Bg2.tt.rle")
};

const u8 sSector2_36_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_36_Bg1.tt.rle")
};

const u8 sSector2_36_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    12, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    14, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    18, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_37_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_37_Clipdata.tt.rle")
};

const u8 sSector2_37_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_37_Bg2.tt.rle")
};

const u8 sSector2_37_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_37_Bg1.tt.rle")
};

const u8 sSector2_37_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_38_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_38_Clipdata.tt.rle")
};

const u8 sSector2_38_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_38_Bg2.tt.rle")
};

const u8 sSector2_38_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_38_Bg1.tt.rle")
};

const u8 sSector2_38_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_39_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_39_Clipdata.tt.rle")
};

const u8 sSector2_39_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_39_Bg2.tt.rle")
};

const u8 sSector2_39_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_39_Bg1.tt.rle")
};

const u8 sSector2_39_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    3, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    4, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    9, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_40_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_40_Clipdata.tt.rle")
};

const u8 sSector2_40_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_40_Bg2.tt.rle")
};

const u8 sSector2_40_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_40_Bg1.tt.rle")
};

const u8 sSector2_40_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_41_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_41_Clipdata.tt.rle")
};

const u8 sSector2_41_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_41_Bg2.tt.rle")
};

const u8 sSector2_41_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_41_Bg1.tt.rle")
};

const u8 sSector2_41_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_42_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_42_Clipdata.tt.rle")
};

const u8 sSector2_42_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_42_Bg2.tt.rle")
};

const u8 sSector2_42_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_42_Bg1.tt.rle")
};

const u8 sSector2_42_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    16, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    18, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    20, 6, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    21, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_43_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_43_Clipdata.tt.rle")
};

const u8 sSector2_43_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_43_Bg2.tt.rle")
};

const u8 sSector2_43_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector2_43_Bg1.tt.rle")
};

const u8 sSector2_43_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    11, 6, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_44_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_2_44, // Room
    1, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_44_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_44_Clipdata.tt.rle")
};

const u8 sSector2_44_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_44_Bg2.tt.rle")
};

const u8 sSector2_44_SpriteData1[ROOM_SPRITE_DATA_COUNT(10)] = {
    3, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    3, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    3, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    3, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    4, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    5, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    6, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    9, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_44_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_44_Bg1.tt.rle")
};

const u8 sSector2_44_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    3, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    3, 15, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    3, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    3, 21, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    6, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    9, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_45_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_45_Clipdata.tt.rle")
};

const u8 sSector2_45_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_45_Bg2.tt.rle")
};

const u8 sSector2_45_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_45_Bg1.tt.rle")
};

const u8 sSector2_45_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_46_Clipdata[] = {
    19, 84,
    _INCBIN_U8("data/rooms/Sector2_46_Clipdata.tt.rle")
};

const u8 sSector2_46_Bg2[] = {
    19, 84,
    _INCBIN_U8("data/rooms/Sector2_46_Bg2.tt.rle")
};

const u8 sSector2_46_SpriteData1[ROOM_SPRITE_DATA_COUNT(14)] = {
    14, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    29, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    35, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    41, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    43, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    44, 3, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    58, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    63, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    65, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    67, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    67, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    80, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    80, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_46_Bg1[] = {
    19, 84,
    _INCBIN_U8("data/rooms/Sector2_46_Bg1.tt.rle")
};

const u8 sSector2_46_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    18, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    29, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    40, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    44, 3, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    58, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    64, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    67, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    80, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_47_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_47, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 23, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 31, // X bounds
    22, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_47_Clipdata[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_47_Clipdata.tt.rle")
};

const u8 sSector2_47_Bg2[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_47_Bg2.tt.rle")
};

const u8 sSector2_47_Bg1[] = {
    34, 44,
    _INCBIN_U8("data/rooms/Sector2_47_Bg1.tt.rle")
};

const u8 sSector2_47_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    16, 13, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    18, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    18, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_48_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_48_Clipdata.tt.rle")
};

const u8 sSector2_48_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_48_Bg2.tt.rle")
};

const u8 sSector2_48_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_48_Bg1.tt.rle")
};

const u8 sSector2_48_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_49_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_49_Clipdata.tt.rle")
};

const u8 sSector2_49_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_49_Bg2.tt.rle")
};

const u8 sSector2_49_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_49_Bg1.tt.rle")
};

const u8 sSector2_49_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_50_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector2_50_Clipdata.tt.rle")
};

const u8 sSector2_50_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector2_50_Bg2.tt.rle")
};

const u8 sSector2_50_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector2_50_Bg1.tt.rle")
};

const u8 sSector2_50_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    10, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    12, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    14, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    16, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    18, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    21, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    23, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    27, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_51_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_2_51, // Room
    2, // Count

    // Scroll 0
    3, 17, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 31, // X bounds
    11, 20, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_51_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_51_Clipdata.tt.rle")
};

const u8 sSector2_51_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_51_Bg2.tt.rle")
};

const u8 sSector2_51_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_51_Bg1.tt.rle")
};

const u8 sSector2_51_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_51_Bg0[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector2_51_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector2_52_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_52_Clipdata.tt.rle")
};

const u8 sSector2_52_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_52_Bg2.tt.rle")
};

const u8 sSector2_52_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_52_Bg1.tt.rle")
};

const u8 sSector2_52_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_53_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_53_Clipdata.tt.rle")
};

const u8 sSector2_53_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_53_Bg2.tt.rle")
};

const u8 sSector2_53_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_53_Bg1.tt.rle")
};

const u8 sSector2_53_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_54_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_54_Clipdata.tt.rle")
};

const u8 sSector2_54_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_54_Bg2.tt.rle")
};

const u8 sSector2_54_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_54_Bg1.tt.rle")
};

const u8 sSector2_54_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_55_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector2_55_Clipdata.tt.rle")
};

const u8 sSector2_55_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector2_55_Bg2.tt.rle")
};

const u8 sSector2_55_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/Sector2_55_Bg1.tt.rle")
};

const u8 sSector2_55_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_56_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_56_Clipdata.tt.rle")
};

const u8 sSector2_56_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_56_Bg2.tt.rle")
};

const u8 sSector2_56_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_56_Bg1.tt.rle")
};

const u8 sSector2_56_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_56_Bg0[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_56_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector2_57_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_2_57, // Room
    3, // Count

    // Scroll 0
    2, 18, // X bounds
    11, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 31, // X bounds
    11, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_57_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_57_Clipdata.tt.rle")
};

const u8 sSector2_57_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_57_Bg2.tt.rle")
};

const u8 sSector2_57_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_57_Bg1.tt.rle")
};

const u8 sSector2_57_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    6, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    7, 30, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    8, 36, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    8, 41, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_57_Bg0[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_57_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector2_58_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_2_58, // Room
    3, // Count

    // Scroll 0
    2, 18, // X bounds
    11, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    17, 31, // X bounds
    11, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector2_58_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_58_Clipdata.tt.rle")
};

const u8 sSector2_58_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_58_Bg2.tt.rle")
};

const u8 sSector2_58_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector2_58_Bg1.tt.rle")
};

const u8 sSector2_58_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    6, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    6, 33, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 27, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    7, 30, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    7, 34, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 36, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    15, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    15, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    18, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_59_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_59_Clipdata.tt.rle")
};

const u8 sSector2_59_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_59_Bg2.tt.rle")
};

const u8 sSector2_59_SpriteData1[ROOM_SPRITE_DATA_COUNT(9)] = {
    0, 1, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    0, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    2, 0, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    6, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    7, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    8, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    11, 0, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    13, 1, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    13, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector2_59_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector2_59_Bg1.tt.rle")
};

const u8 sSector2_59_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector2_60_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_60_Clipdata.tt.rle")
};

const u8 sSector2_60_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_60_Bg2.tt.rle")
};

const u8 sSector2_60_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector2_60_Bg1.tt.rle")
};

const u8 sSector2_60_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    5, 13, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    5, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    5, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u32 sSector2_3_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector2_3_Bg3.tt.lz")
};

const u32 sSector2_5_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector2_5_Bg3.tt.lz")
};

const u32 sSector2_22_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector2_22_Bg3.tt.lz")
};

const u32 sSector2_18_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector2_18_Bg3.tt.lz")
};

const u32 sSector2_55_Bg3[] = {
    2, _INCBIN_U32("data/rooms/Sector2_55_Bg3.tt.lz")
};

const u32 sSector2_17_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector2_17_Bg3.tt.lz")
};

const u32 sSector2_20_Bg3[] = {
    1, _INCBIN_U32("data/rooms/Sector2_20_Bg3.tt.lz")
};
