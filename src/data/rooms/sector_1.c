#include "data/rooms/sector_1.h"

const u8 sTileset_2_Gfx[] = INCBIN_U8("data/tilesets/2.gfx.lz"); ALIGN2();

const u8 sTileset_88_Gfx[] = INCBIN_U8("data/tilesets/88.gfx.lz"); ALIGN2();

const u8 sTileset_14_Gfx[] = INCBIN_U8("data/tilesets/14.gfx.lz"); ALIGN2();

const u8 sTileset_41_Gfx[] = INCBIN_U8("data/tilesets/41.gfx.lz"); ALIGN2();

const u8 sTileset_4_Gfx[] = INCBIN_U8("data/tilesets/4.gfx.lz"); ALIGN2();

const u8 sTileset_88_Bg_Gfx[] = INCBIN_U8("data/tilesets/88_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_14_Bg_Gfx[] = INCBIN_U8("data/tilesets/14_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_4_Bg_Gfx[] = INCBIN_U8("data/tilesets/4_Bg.gfx.lz"); ALIGN2();

const u16 sTileset_2_Tilemap[0x342] = INCBIN_U16("data/tilesets/2.tt");

const u16 sTileset_88_Tilemap[0x702] = INCBIN_U16("data/tilesets/88.tt");

const u16 sTileset_14_Tilemap[0x702] = INCBIN_U16("data/tilesets/14.tt");

const u16 sTileset_41_Tilemap[0x842] = INCBIN_U16("data/tilesets/41.tt");

const u16 sTileset_4_Tilemap[0x3c2] = INCBIN_U16("data/tilesets/4.tt");

const u16 sTileset_2_Pal[14 * 16] = INCBIN_U16("data/tilesets/2.pal");

const u16 sTileset_88_Pal[14 * 16] = INCBIN_U16("data/tilesets/88.pal");

const u16 sTileset_14_Pal[14 * 16] = INCBIN_U16("data/tilesets/14.pal");

const u16 sAnimatedPal_17[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/17.pal");

const u16 sTileset_41_Pal[14 * 16] = INCBIN_U16("data/tilesets/41.pal");

const u16 sTileset_4_Pal[14 * 16] = INCBIN_U16("data/tilesets/4.pal");

const u8 sSector1_0_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_1_0, // Room
    1, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector1_0_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_0_Clipdata.tt.rle")
};

const u8 sSector1_0_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_0_Bg2.tt.rle")
};

const u8 sSector1_0_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_0_Bg1.tt.rle")
};

const u8 sSector1_0_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    0, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    0, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    10, 14, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    13, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    16, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    20, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    23, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_1_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_1_Clipdata.tt.rle")
};

const u8 sSector1_1_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_1_Bg2.tt.rle")
};

const u8 sSector1_1_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_1_Bg1.tt.rle")
};

const u8 sSector1_1_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_2_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_2_Clipdata.tt.rle")
};

const u8 sSector1_2_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_2_Bg2.tt.rle")
};

const u8 sSector1_2_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_2_Bg1.tt.rle")
};

const u8 sSector1_2_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_3_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_3_Clipdata.tt.rle")
};

const u8 sSector1_3_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_3_Bg2.tt.rle")
};

const u8 sSector1_3_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_3_Bg1.tt.rle")
};

const u8 sSector1_3_SpriteData0[ROOM_SPRITE_DATA_COUNT(9)] = {
    0, 13, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    5, 33, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 27, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    6, 41, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    8, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    8, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 35, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 27, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_4_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_4_Clipdata.tt.rle")
};

const u8 sSector1_4_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_4_Bg2.tt.rle")
};

const u8 sSector1_4_SpriteData1[ROOM_SPRITE_DATA_COUNT(2)] = {
    16, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    16, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_4_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_4_Bg1.tt.rle")
};

const u8 sSector1_4_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    11, 24, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    16, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_5_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_5_Clipdata.tt.rle")
};

const u8 sSector1_5_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_5_Bg2.tt.rle")
};

const u8 sSector1_5_SpriteData1[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 9, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    4, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    8, 19, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 22, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 13, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_5_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_5_Bg1.tt.rle")
};

const u8 sSector1_5_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    4, 15, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    4, 22, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    8, 19, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 23, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 13, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 15, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 18, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_6_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_6_Clipdata.tt.rle")
};

const u8 sSector1_6_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_6_Bg2.tt.rle")
};

const u8 sSector1_6_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_6_Bg1.tt.rle")
};

const u8 sSector1_6_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_7_Clipdata[] = {
    79, 14,
    _INCBIN_U8("data/rooms/Sector1_7_Clipdata.tt.rle")
};

const u8 sSector1_7_Bg2[] = {
    79, 14,
    _INCBIN_U8("data/rooms/Sector1_7_Bg2.tt.rle")
};

const u8 sSector1_7_SpriteData1[ROOM_SPRITE_DATA_COUNT(7)] = {
    3, 36, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 58, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 46, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 43, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 56, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_7_Bg1[] = {
    79, 14,
    _INCBIN_U8("data/rooms/Sector1_7_Bg1.tt.rle")
};

const u8 sSector1_7_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    6, 46, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 12, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 37, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 46, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 51, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 58, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_8_Clipdata[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector1_8_Clipdata.tt.rle")
};

const u8 sSector1_8_Bg2[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector1_8_Bg2.tt.rle")
};

const u8 sSector1_8_Bg1[] = {
    19, 64,
    _INCBIN_U8("data/rooms/Sector1_8_Bg1.tt.rle")
};

const u8 sSector1_8_SpriteData0[ROOM_SPRITE_DATA_COUNT(11)] = {
    0, 10, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    0, 12, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    14, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    19, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    24, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    29, 4, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    31, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    34, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    39, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    44, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    49, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_9_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_9_Clipdata.tt.rle")
};

const u8 sSector1_9_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_9_Bg2.tt.rle")
};

const u8 sSector1_9_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_9_Bg1.tt.rle")
};

const u8 sSector1_9_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    5, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    5, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    12, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    14, 20, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    20, 17, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_10_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_1_10, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    10, 11, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector1_10_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_10_Clipdata.tt.rle")
};

const u8 sSector1_10_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_10_Bg2.tt.rle")
};

const u8 sSector1_10_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_10_Bg1.tt.rle")
};

const u8 sSector1_10_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_11_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_11_Clipdata.tt.rle")
};

const u8 sSector1_11_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_11_Bg2.tt.rle")
};

const u8 sSector1_11_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_11_Bg1.tt.rle")
};

const u8 sSector1_11_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_12_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_12_Clipdata.tt.rle")
};

const u8 sSector1_12_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_12_Bg2.tt.rle")
};

const u8 sSector1_12_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_12_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_12_Bg1.tt.rle")
};

const u8 sSector1_12_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    4, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    8, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_13_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_13_Clipdata.tt.rle")
};

const u8 sSector1_13_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_13_Bg2.tt.rle")
};

const u8 sSector1_13_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_13_Bg1.tt.rle")
};

const u8 sSector1_13_SpriteData0[ROOM_SPRITE_DATA_COUNT(4)] = {
    5, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    9, 26, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    18, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    18, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_13_Bg0_Unused[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_13_Bg0_Unused.tt.rle")
};
ALIGN2();

const u8 sSector1_14_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_14_Clipdata.tt.rle")
};

const u8 sSector1_14_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_14_Bg2.tt.rle")
};

const u8 sSector1_14_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_14_Bg1.tt.rle")
};

const u8 sSector1_14_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_15_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_15_Clipdata.tt.rle")
};

const u8 sSector1_15_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_15_Bg2.tt.rle")
};

const u8 sSector1_15_SpriteData1[ROOM_SPRITE_DATA_COUNT(3)] = {
    5, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    20, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_15_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_15_Bg1.tt.rle")
};

const u8 sSector1_15_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    5, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    10, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    14, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    14, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    14, 25, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    20, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_16_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_16_Clipdata.tt.rle")
};

const u8 sSector1_16_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_16_Bg2.tt.rle")
};

const u8 sSector1_16_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_16_Bg1.tt.rle")
};

const u8 sSector1_16_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    16, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    21, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    23, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    26, 4, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    31, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_17_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector1_17_Clipdata.tt.rle")
};

const u8 sSector1_17_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector1_17_Bg2.tt.rle")
};

const u8 sSector1_17_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector1_17_Bg1.tt.rle")
};

const u8 sSector1_17_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_17_Bg0[] = {
    49, 24,
    _INCBIN_U8("data/rooms/Sector1_17_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector1_18_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_18_Clipdata.tt.rle")
};

const u8 sSector1_18_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_18_Bg2.tt.rle")
};

const u8 sSector1_18_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_18_Bg1.tt.rle")
};

const u8 sSector1_18_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    24, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    32, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_19_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_19_Clipdata.tt.rle")
};

const u8 sSector1_19_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_19_Bg2.tt.rle")
};

const u8 sSector1_19_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_19_Bg1.tt.rle")
};

const u8 sSector1_19_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_20_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_1_20, // Room
    2, // Count

    // Scroll 0
    17, 31, // X bounds
    2, 31, // Y bounds
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

const u8 sSector1_20_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector1_20_Clipdata.tt.rle")
};

const u8 sSector1_20_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector1_20_Bg2.tt.rle")
};

const u8 sSector1_20_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    18, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_20_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector1_20_Bg1.tt.rle")
};

const u8 sSector1_20_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_20_Bg0[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector1_20_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector1_21_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_1_21, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 12, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    12, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector1_21_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_21_Clipdata.tt.rle")
};

const u8 sSector1_21_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_21_Bg2.tt.rle")
};

const u8 sSector1_21_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_21_Bg1.tt.rle")
};

const u8 sSector1_21_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    4, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    8, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_22_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_1_22, // Room
    1, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector1_22_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_22_Clipdata.tt.rle")
};

const u8 sSector1_22_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_22_Bg2.tt.rle")
};

const u8 sSector1_22_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_22_Bg1.tt.rle")
};

const u8 sSector1_22_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    4, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    8, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    8, 23, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 6, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 10, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 23, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_23_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_23_Clipdata.tt.rle")
};

const u8 sSector1_23_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_23_Bg2.tt.rle")
};

const u8 sSector1_23_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_23_Bg1.tt.rle")
};

const u8 sSector1_23_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_24_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_24_Clipdata.tt.rle")
};

const u8 sSector1_24_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_24_Bg2.tt.rle")
};

const u8 sSector1_24_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_24_Bg1.tt.rle")
};

const u8 sSector1_24_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_25_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_25_Clipdata.tt.rle")
};

const u8 sSector1_25_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_25_Bg2.tt.rle")
};

const u8 sSector1_25_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_25_Bg1.tt.rle")
};

const u8 sSector1_25_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    2, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    2, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    2, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    2, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    2, 29, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 14, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    10, 27, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_26_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_26_Clipdata.tt.rle")
};

const u8 sSector1_26_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_26_Bg2.tt.rle")
};

const u8 sSector1_26_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_26_Bg1.tt.rle")
};

const u8 sSector1_26_SpriteData0[ROOM_SPRITE_DATA_COUNT(8)] = {
    4, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    4, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 18, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    7, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 21, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_26_Bg0[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_26_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector1_27_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_27_Clipdata.tt.rle")
};

const u8 sSector1_27_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_27_Bg2.tt.rle")
};

const u8 sSector1_27_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_27_Bg1.tt.rle")
};

const u8 sSector1_27_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    12, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    14, 9, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    20, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_27_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_27_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector1_28_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_28_Clipdata.tt.rle")
};

const u8 sSector1_28_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_28_Bg2.tt.rle")
};

const u8 sSector1_28_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_28_Bg1.tt.rle")
};

const u8 sSector1_28_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_29_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_29_Clipdata.tt.rle")
};

const u8 sSector1_29_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_29_Bg2.tt.rle")
};

const u8 sSector1_29_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_29_Bg1.tt.rle")
};

const u8 sSector1_29_SpriteData0[ROOM_SPRITE_DATA_COUNT(14)] = {
    0, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    0, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    0, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    0, 28, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 8, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 21, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 26, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    5, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    7, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    7, 24, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    13, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_29_Bg0[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_29_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector1_30_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_30_Clipdata.tt.rle")
};

const u8 sSector1_30_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_30_Bg2.tt.rle")
};

const u8 sSector1_30_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_30_Bg1.tt.rle")
};

const u8 sSector1_30_SpriteData0[ROOM_SPRITE_DATA_COUNT(10)] = {
    8, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    12, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    12, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    15, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    18, 19, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    18, 25, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    19, 21, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    23, 17, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    23, 23, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_31_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_1_31, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sSector1_31_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_31_Clipdata.tt.rle")
};

const u8 sSector1_31_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_31_Bg2.tt.rle")
};

const u8 sSector1_31_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_31_Bg1.tt.rle")
};

const u8 sSector1_31_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_32_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_32_Clipdata.tt.rle")
};

const u8 sSector1_32_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_32_Bg2.tt.rle")
};

const u8 sSector1_32_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_32_Bg1.tt.rle")
};

const u8 sSector1_32_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    7, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    9, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    12, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    13, 23, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    20, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    20, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_33_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_33_Clipdata.tt.rle")
};

const u8 sSector1_33_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_33_Bg2.tt.rle")
};

const u8 sSector1_33_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_33_Bg1.tt.rle")
};

const u8 sSector1_33_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    28, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_34_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_34_Clipdata.tt.rle")
};

const u8 sSector1_34_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_34_Bg2.tt.rle")
};

const u8 sSector1_34_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_34_Bg1.tt.rle")
};

const u8 sSector1_34_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_35_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_35_Clipdata.tt.rle")
};

const u8 sSector1_35_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_35_Bg2.tt.rle")
};

const u8 sSector1_35_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/Sector1_35_Bg1.tt.rle")
};

const u8 sSector1_35_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    13, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    18, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    18, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    23, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    28, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    33, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_36_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_1_36, // Room
    2, // Count

    // Scroll 0
    2, 18, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    16, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector1_36_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_36_Clipdata.tt.rle")
};

const u8 sSector1_36_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_36_Bg2.tt.rle")
};

const u8 sSector1_36_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_36_Bg1.tt.rle")
};

const u8 sSector1_36_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    5, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    6, 28, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    7, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    7, 37, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    8, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    8, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    9, 32, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sSector1_36_Bg0[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_36_Bg0.tt.rle")
};
ALIGN2();

const u8 sSector1_37_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_37_Clipdata.tt.rle")
};

const u8 sSector1_37_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_37_Bg2.tt.rle")
};

const u8 sSector1_37_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_37_Bg1.tt.rle")
};

const u8 sSector1_37_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    5, 7, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    6, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_38_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_1_38, // Room
    1, // Count

    // Scroll 0
    9, 46, // X bounds
    2, 11, // Y bounds
    9, 4, // Breakable block position
    0, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector1_38_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_38_Clipdata.tt.rle")
};

const u8 sSector1_38_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_38_Bg2.tt.rle")
};

const u8 sSector1_38_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/Sector1_38_Bg1.tt.rle")
};

const u8 sSector1_38_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    3, 25, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 30, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    6, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    7, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    9, 20, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    10, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_39_Scrolls[SCROLL_DATA_COUNT(3)] = {
    SECTOR_1_39, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 12, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    16, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sSector1_39_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_39_Clipdata.tt.rle")
};

const u8 sSector1_39_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_39_Bg2.tt.rle")
};

const u8 sSector1_39_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/Sector1_39_Bg1.tt.rle")
};

const u8 sSector1_39_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    14, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_40_Scrolls[SCROLL_DATA_COUNT(2)] = {
    SECTOR_1_40, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    12, 31, // Y bounds
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

const u8 sSector1_40_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector1_40_Clipdata.tt.rle")
};

const u8 sSector1_40_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector1_40_Bg2.tt.rle")
};

const u8 sSector1_40_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/Sector1_40_Bg1.tt.rle")
};

const u8 sSector1_40_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    21, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    22, 18, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    29, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_41_Scrolls[SCROLL_DATA_COUNT(1)] = {
    SECTOR_1_41, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sSector1_41_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_41_Clipdata.tt.rle")
};

const u8 sSector1_41_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_41_Bg2.tt.rle")
};

const u8 sSector1_41_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_41_Bg1.tt.rle")
};

const u8 sSector1_41_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    15, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_42_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_42_Clipdata.tt.rle")
};

const u8 sSector1_42_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_42_Bg2.tt.rle")
};

const u8 sSector1_42_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_42_Bg1.tt.rle")
};

const u8 sSector1_42_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_43_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_43_Clipdata.tt.rle")
};

const u8 sSector1_43_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_43_Bg2.tt.rle")
};

const u8 sSector1_43_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_43_Bg1.tt.rle")
};

const u8 sSector1_43_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    2, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    3, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    4, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    6, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    8, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    9, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_44_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_44_Clipdata.tt.rle")
};

const u8 sSector1_44_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_44_Bg2.tt.rle")
};

const u8 sSector1_44_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_44_Bg1.tt.rle")
};

const u8 sSector1_44_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    5, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    5, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_45_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_45_Clipdata.tt.rle")
};

const u8 sSector1_45_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_45_Bg2.tt.rle")
};

const u8 sSector1_45_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_45_Bg1.tt.rle")
};

const u8 sSector1_45_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    4, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    10, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_46_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_46_Clipdata.tt.rle")
};

const u8 sSector1_46_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_46_Bg2.tt.rle")
};

const u8 sSector1_46_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_46_Bg1.tt.rle")
};

const u8 sSector1_46_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    1, 7, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(9),
    3, 7, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    7, 8, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    7, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    7, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_47_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_47_Clipdata.tt.rle")
};

const u8 sSector1_47_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_47_Bg2.tt.rle")
};

const u8 sSector1_47_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_47_Bg1.tt.rle")
};

const u8 sSector1_47_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    7, 14, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    14, 10, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_48_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_48_Clipdata.tt.rle")
};

const u8 sSector1_48_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_48_Bg2.tt.rle")
};

const u8 sSector1_48_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_48_Bg1.tt.rle")
};

const u8 sSector1_48_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_49_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_49_Clipdata.tt.rle")
};

const u8 sSector1_49_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_49_Bg2.tt.rle")
};

const u8 sSector1_49_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_49_Bg1.tt.rle")
};

const u8 sSector1_49_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_50_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_50_Clipdata.tt.rle")
};

const u8 sSector1_50_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_50_Bg2.tt.rle")
};

const u8 sSector1_50_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/Sector1_50_Bg1.tt.rle")
};

const u8 sSector1_50_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_51_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_51_Clipdata.tt.rle")
};

const u8 sSector1_51_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_51_Bg2.tt.rle")
};

const u8 sSector1_51_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/Sector1_51_Bg1.tt.rle")
};

const u8 sSector1_51_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    4, 17, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    4, 18, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    5, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    6, 7, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 27, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_52_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_52_Clipdata.tt.rle")
};

const u8 sSector1_52_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_52_Bg2.tt.rle")
};

const u8 sSector1_52_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/Sector1_52_Bg1.tt.rle")
};

const u8 sSector1_52_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_53_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_53_Clipdata.tt.rle")
};

const u8 sSector1_53_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_53_Bg2.tt.rle")
};

const u8 sSector1_53_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/Sector1_53_Bg1.tt.rle")
};

const u8 sSector1_53_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    12, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    13, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    14, 9, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sSector1_18_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector1_18_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector1_4_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector1_4_Bg3.tt.lz")
};
ALIGN2();

const u8 sSector1_4_Bg0[] = {
    0, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector1_4_Bg0.tt.lz")
};
ALIGN2();

const u8 sSector1_27_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/Sector1_27_Bg3.tt.lz")
};
ALIGN2();
