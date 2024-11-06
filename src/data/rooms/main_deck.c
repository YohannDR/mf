#include "data/rooms/main_deck.h"

const u8 sTileset_89_Gfx[] = INCBIN_U8("data/tilesets/89.gfx.lz"); ALIGN2();

const u8 sTileset_16_Gfx[] = INCBIN_U8("data/tilesets/16.gfx.lz"); ALIGN2();

const u8 sTileset_96_Gfx[] = INCBIN_U8("data/tilesets/96.gfx.lz"); ALIGN2();

const u8 sTileset_97_Gfx[] = INCBIN_U8("data/tilesets/97.gfx.lz"); ALIGN2();

const u8 sTileset_55_Gfx[] = INCBIN_U8("data/tilesets/55.gfx.lz"); ALIGN2();

const u8 sTileset_54_Gfx[] = INCBIN_U8("data/tilesets/54.gfx.lz"); ALIGN2();

const u8 sTileset_17_Gfx[] = INCBIN_U8("data/tilesets/17.gfx.lz"); ALIGN2();

const u8 sTileset_29_Gfx[] = INCBIN_U8("data/tilesets/29.gfx.lz"); ALIGN2();

const u8 sTileset_6_Gfx[] = INCBIN_U8("data/tilesets/6.gfx.lz"); ALIGN2();

const u8 sTileset_28_Gfx[] = INCBIN_U8("data/tilesets/28.gfx.lz"); ALIGN2();

const u8 sTileset_7_Gfx[] = INCBIN_U8("data/tilesets/7.gfx.lz"); ALIGN2();

const u8 sTileset_66_Gfx[] = INCBIN_U8("data/tilesets/66.gfx.lz"); ALIGN2();

const u8 sTileset_85_Gfx[] = INCBIN_U8("data/tilesets/85.gfx.lz"); ALIGN2();

const u8 sTileset_19_Gfx[] = INCBIN_U8("data/tilesets/19.gfx.lz"); ALIGN2();

const u8 sTileset_50_Gfx[] = INCBIN_U8("data/tilesets/50.gfx.lz"); ALIGN2();

const u8 sTileset_69_Gfx[] = INCBIN_U8("data/tilesets/69.gfx.lz"); ALIGN2();

const u8 sTileset_27_Gfx[] = INCBIN_U8("data/tilesets/27.gfx.lz"); ALIGN2();

const u8 sTileset_56_Gfx[] = INCBIN_U8("data/tilesets/56.gfx.lz"); ALIGN2();

const u8 sTileset_18_Gfx[] = INCBIN_U8("data/tilesets/18.gfx.lz"); ALIGN2();

const u8 sTileset_60_Gfx[] = INCBIN_U8("data/tilesets/60.gfx.lz"); ALIGN2();

const u8 sTileset_26_Gfx[] = INCBIN_U8("data/tilesets/26.gfx.lz"); ALIGN2();

const u8 sTileset_84_Gfx[] = INCBIN_U8("data/tilesets/84.gfx.lz"); ALIGN2();

const u8 sTileset_8_Gfx[] = INCBIN_U8("data/tilesets/8.gfx.lz"); ALIGN2();

const u8 sTileset_89_Bg_Gfx[] = INCBIN_U8("data/tilesets/89_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_97_Bg_Gfx[] = INCBIN_U8("data/tilesets/97_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_16_Bg_Gfx[] = INCBIN_U8("data/tilesets/16_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_55_Bg_Gfx[] = INCBIN_U8("data/tilesets/55_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_54_Bg_Gfx[] = INCBIN_U8("data/tilesets/54_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_29_Bg_Gfx[] = INCBIN_U8("data/tilesets/29_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_28_Bg_Gfx[] = INCBIN_U8("data/tilesets/28_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_7_Bg_Gfx[] = INCBIN_U8("data/tilesets/7_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_85_Bg_Gfx[] = INCBIN_U8("data/tilesets/85_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_66_Bg_Gfx[] = INCBIN_U8("data/tilesets/66_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_80_Bg_Gfx[] = INCBIN_U8("data/tilesets/80_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_83_Bg_Gfx[] = INCBIN_U8("data/tilesets/83_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_50_Bg_Gfx[] = INCBIN_U8("data/tilesets/50_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_69_Bg_Gfx[] = INCBIN_U8("data/tilesets/69_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_70_Bg_Gfx[] = INCBIN_U8("data/tilesets/70_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_19_Bg_Gfx[] = INCBIN_U8("data/tilesets/19_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_56_Bg_Gfx[] = INCBIN_U8("data/tilesets/56_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_17_Bg_Gfx[] = INCBIN_U8("data/tilesets/17_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_18_Bg_Gfx[] = INCBIN_U8("data/tilesets/18_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_60_Bg_Gfx[] = INCBIN_U8("data/tilesets/60_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_61_Bg_Gfx[] = INCBIN_U8("data/tilesets/61_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_6_Bg_Gfx[] = INCBIN_U8("data/tilesets/6_Bg.gfx.lz"); ALIGN2();

const u8 sTileset_8_Bg_Gfx[] = INCBIN_U8("data/tilesets/8_Bg.gfx.lz"); ALIGN2();

const u16 sTileset_89_Tilemap[0x5c2] = INCBIN_U16("data/tilesets/89.tt");

const u16 sTileset_16_Tilemap[0x602] = INCBIN_U16("data/tilesets/16.tt");

const u16 sTileset_96_Tilemap[0x602] = INCBIN_U16("data/tilesets/96.tt");

const u16 sTileset_97_Tilemap[0x702] = INCBIN_U16("data/tilesets/97.tt");

const u16 sTileset_55_Tilemap[0xac2] = INCBIN_U16("data/tilesets/55.tt");

const u16 sTileset_54_Tilemap[0xac2] = INCBIN_U16("data/tilesets/54.tt");

const u16 sTileset_17_Tilemap[0xa02] = INCBIN_U16("data/tilesets/17.tt");

const u16 sTileset_29_Tilemap[0x602] = INCBIN_U16("data/tilesets/29.tt");

const u16 sTileset_6_Tilemap[0x602] = INCBIN_U16("data/tilesets/6.tt");

const u16 sTileset_28_Tilemap[0x602] = INCBIN_U16("data/tilesets/28.tt");

const u16 sTileset_7_Tilemap[0x482] = INCBIN_U16("data/tilesets/7.tt");

const u16 sTileset_66_Tilemap[0x702] = INCBIN_U16("data/tilesets/66.tt");

const u16 sTileset_85_Tilemap[0x702] = INCBIN_U16("data/tilesets/85.tt");

const u16 sTileset_19_Tilemap[0xac2] = INCBIN_U16("data/tilesets/19.tt");

const u16 sTileset_50_Tilemap[0x442] = INCBIN_U16("data/tilesets/50.tt");

const u16 sTileset_69_Tilemap[0x4c2] = INCBIN_U16("data/tilesets/69.tt");

const u16 sTileset_27_Tilemap[0x6c2] = INCBIN_U16("data/tilesets/27.tt");

const u16 sTileset_56_Tilemap[0x702] = INCBIN_U16("data/tilesets/56.tt");

const u16 sTileset_18_Tilemap[0x502] = INCBIN_U16("data/tilesets/18.tt");

const u16 sTileset_60_Tilemap[0x502] = INCBIN_U16("data/tilesets/60.tt");

const u16 sTileset_26_Tilemap[0x602] = INCBIN_U16("data/tilesets/26.tt");

const u16 sTileset_84_Tilemap[0x482] = INCBIN_U16("data/tilesets/84.tt");

const u16 sTileset_8_Tilemap[0x482] = INCBIN_U16("data/tilesets/8.tt");

const u16 sTileset_89_Pal[14 * 16] = INCBIN_U16("data/tilesets/89.pal");

const u16 sAnimatedPal_29[6 * 16] = INCBIN_U16("data/tilesets/animated_palettes/29.pal");

const u16 sTileset_16_Pal[14 * 16] = INCBIN_U16("data/tilesets/16.pal");

const u16 sAnimatedPal_5[10 * 16] = INCBIN_U16("data/tilesets/animated_palettes/5.pal");

const u16 sTileset_96_Pal[14 * 16] = INCBIN_U16("data/tilesets/96.pal");

const u16 sTileset_97_Pal[14 * 16] = INCBIN_U16("data/tilesets/97.pal");

const u16 sTileset_55_Pal[14 * 16] = INCBIN_U16("data/tilesets/55.pal");

const u16 sAnimatedPal_27[10 * 16] = INCBIN_U16("data/tilesets/animated_palettes/27.pal");

const u16 sTileset_54_Pal[14 * 16] = INCBIN_U16("data/tilesets/54.pal");

const u16 sTileset_17_Pal[14 * 16] = INCBIN_U16("data/tilesets/17.pal");

const u16 sAnimatedPal_6[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/6.pal");

const u16 sTileset_35_Pal[14 * 16] = INCBIN_U16("data/tilesets/35.pal");

const u16 sAnimatedPal_10[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/10.pal");

const u16 sTileset_36_Pal[14 * 16] = INCBIN_U16("data/tilesets/36.pal");

const u16 sAnimatedPal_11[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/11.pal");

const u16 sTileset_37_Pal[14 * 16] = INCBIN_U16("data/tilesets/37.pal");

const u16 sAnimatedPal_12[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/12.pal");

const u16 sTileset_38_Pal[14 * 16] = INCBIN_U16("data/tilesets/38.pal");

const u16 sAnimatedPal_13[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/13.pal");

const u16 sTileset_39_Pal[14 * 16] = INCBIN_U16("data/tilesets/39.pal");

const u16 sAnimatedPal_14[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/14.pal");

const u16 sTileset_29_Pal[14 * 16] = INCBIN_U16("data/tilesets/29.pal");

const u16 sAnimatedPal_8[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/8.pal");

const u16 sTileset_6_Pal[14 * 16] = INCBIN_U16("data/tilesets/6.pal");

const u16 sTileset_28_Pal[14 * 16] = INCBIN_U16("data/tilesets/28.pal");

const u16 sTileset_7_Pal[14 * 16] = INCBIN_U16("data/tilesets/7.pal");

const u16 sTileset_66_Pal[14 * 16] = INCBIN_U16("data/tilesets/66.pal");

const u16 sAnimatedPal_28[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/28.pal");

const u16 sAnimatedPal_32[9 * 16] = INCBIN_U16("data/tilesets/animated_palettes/32.pal");

const u16 sTileset_83_Pal[14 * 16] = INCBIN_U16("data/tilesets/83.pal");

const u16 sTileset_85_Pal[14 * 16] = INCBIN_U16("data/tilesets/85.pal");

const u16 sTileset_19_Pal[14 * 16] = INCBIN_U16("data/tilesets/19.pal");

const u16 sTileset_50_Pal[14 * 16] = INCBIN_U16("data/tilesets/50.pal");

const u16 sAnimatedPal_21[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/21.pal");

const u16 sTileset_69_Pal[14 * 16] = INCBIN_U16("data/tilesets/69.pal");

const u16 sTileset_27_Pal[14 * 16] = INCBIN_U16("data/tilesets/27.pal");

const u16 sTileset_56_Pal[14 * 16] = INCBIN_U16("data/tilesets/56.pal");

const u16 sAnimatedPal_26[4 * 16] = INCBIN_U16("data/tilesets/animated_palettes/26.pal");

const u16 sTileset_18_Pal[14 * 16] = INCBIN_U16("data/tilesets/18.pal");

const u16 sTileset_60_Pal[14 * 16] = INCBIN_U16("data/tilesets/60.pal");

const u16 sTileset_26_Pal[14 * 16] = INCBIN_U16("data/tilesets/26.pal");

const u16 sAnimatedPal_7[4 * 16] = INCBIN_U16("data/tilesets/animated_palettes/7.pal");

const u16 sTileset_63_Pal[14 * 16] = INCBIN_U16("data/tilesets/63.pal");

const u16 sAnimatedPal_24[8 * 16] = INCBIN_U16("data/tilesets/animated_palettes/24.pal");

const u16 sTileset_84_Pal[14 * 16] = INCBIN_U16("data/tilesets/84.pal");

const u16 sTileset_8_Pal[14 * 16] = INCBIN_U16("data/tilesets/8.pal");

const u8 sMainDeck_0_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_0_Clipdata.tt.rle")
};

const u8 sMainDeck_0_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_0_Bg2.tt.rle")
};

const u8 sMainDeck_0_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_0_Bg1.tt.rle")
};

const u8 sMainDeck_0_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 25, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_1_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_1_Clipdata.tt.rle")
};

const u8 sMainDeck_1_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_1_Bg2.tt.rle")
};

const u8 sMainDeck_1_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_1_Bg1.tt.rle")
};

const u8 sMainDeck_1_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    20, 16, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_2_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_2_Clipdata.tt.rle")
};

const u8 sMainDeck_2_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_2_Bg2.tt.rle")
};

const u8 sMainDeck_2_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_2_Bg1.tt.rle")
};

const u8 sMainDeck_2_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_3_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_3_Clipdata.tt.rle")
};

const u8 sMainDeck_3_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_3_Bg2.tt.rle")
};

const u8 sMainDeck_3_SpriteData1_Unused[ROOM_SPRITE_DATA_COUNT(2)] = {
    10, 30, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(8),
    10, 33, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(8),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_3_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_3_Bg1.tt.rle")
};

const u8 sMainDeck_3_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_3_Bg0[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_3_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_4_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_4_Clipdata.tt.rle")
};

const u8 sMainDeck_4_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_4_Bg2.tt.rle")
};

const u8 sMainDeck_4_SpriteData1_Unused[ROOM_SPRITE_DATA_COUNT(2)] = {
    10, 30, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(8),
    10, 33, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(8),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_4_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_4_Bg1.tt.rle")
};

const u8 sMainDeck_4_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_5_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_5_Clipdata.tt.rle")
};

const u8 sMainDeck_5_Bg2_Unused[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_5_Bg2_Unused.tt.rle")
};

const u8 sMainDeck_5_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_5_Bg1.tt.rle")
};

const u8 sMainDeck_5_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_6_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_6_Clipdata.tt.rle")
};

const u8 sMainDeck_6_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)] = {
    24, 10, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_6_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_6_Bg2.tt.rle")
};

const u8 sMainDeck_6_SpriteData1[ROOM_SPRITE_DATA_COUNT(2)] = {
    30, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    35, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_6_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_6_Bg1.tt.rle")
};

const u8 sMainDeck_6_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_6_Bg0[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_6_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_7_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_7, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 31, // X bounds
    10, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_7_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_7_Clipdata.tt.rle")
};

const u8 sMainDeck_7_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_7_Bg2.tt.rle")
};

const u8 sMainDeck_7_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    7, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_7_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_7_Bg1.tt.rle")
};

const u8 sMainDeck_7_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    7, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_7_Bg0[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_7_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_8_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_8_Clipdata.tt.rle")
};

const u8 sMainDeck_8_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_8_Bg2.tt.rle")
};

const u8 sMainDeck_8_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_8_Bg1.tt.rle")
};

const u8 sMainDeck_8_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_9_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_9_Clipdata.tt.rle")
};

const u8 sMainDeck_9_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_9_Bg2.tt.rle")
};

const u8 sMainDeck_9_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_9_Bg1.tt.rle")
};

const u8 sMainDeck_9_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_10_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_10, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 21, // Y bounds
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

const u8 sMainDeck_10_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_10_Clipdata.tt.rle")
};

const u8 sMainDeck_10_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_10_Bg2.tt.rle")
};

const u8 sMainDeck_10_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_10_Bg1.tt.rle")
};

const u8 sMainDeck_10_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    10, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    14, 15, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(6),
    16, 30, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    17, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    18, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_10_Bg0[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_10_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_11_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_11_Clipdata.tt.rle")
};

const u8 sMainDeck_11_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_11_Bg2.tt.rle")
};

const u8 sMainDeck_11_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_11_Bg1.tt.rle")
};

const u8 sMainDeck_11_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_12_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_12, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 15, // Y bounds
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

const u8 sMainDeck_12_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_12_Clipdata.tt.rle")
};

const u8 sMainDeck_12_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)] = {
    13, 6, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_12_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_12_Bg2.tt.rle")
};

const u8 sMainDeck_12_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)] = {
    6, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 6, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    19, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    19, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_12_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_12_Bg1.tt.rle")
};

const u8 sMainDeck_12_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    17, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    19, 19, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    19, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_13_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_13, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    28, 46, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_13_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_13_Clipdata.tt.rle")
};

const u8 sMainDeck_13_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_13_Bg2.tt.rle")
};

const u8 sMainDeck_13_SpriteData1[ROOM_SPRITE_DATA_COUNT(3)] = {
    13, 16, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    16, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    20, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_13_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_13_Bg1.tt.rle")
};

const u8 sMainDeck_13_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    16, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_14_Clipdata[] = {
    49, 14,
    _INCBIN_U8("data/rooms/MainDeck_14_Clipdata.tt.rle")
};

const u8 sMainDeck_14_Bg2[] = {
    49, 14,
    _INCBIN_U8("data/rooms/MainDeck_14_Bg2.tt.rle")
};

const u8 sMainDeck_14_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    4, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_14_Bg1[] = {
    49, 14,
    _INCBIN_U8("data/rooms/MainDeck_14_Bg1.tt.rle")
};

const u8 sMainDeck_14_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    4, 15, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    10, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    10, 15, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_15_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_15_Clipdata.tt.rle")
};

const u8 sMainDeck_15_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_15_Bg2.tt.rle")
};

const u8 sMainDeck_15_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_15_Bg1.tt.rle")
};

const u8 sMainDeck_15_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    16, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    17, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    23, 14, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    33, 8, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    33, 12, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_16_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_16_Clipdata.tt.rle")
};

const u8 sMainDeck_16_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_16_Bg2.tt.rle")
};

const u8 sMainDeck_16_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_16_Bg1.tt.rle")
};

const u8 sMainDeck_16_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_16_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_16_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_17_Scrolls[SCROLL_DATA_COUNT(3)] = {
    MAIN_DECK_17, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
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
    9, 35, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_17_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_17_Clipdata.tt.rle")
};

const u8 sMainDeck_17_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_17_Bg2.tt.rle")
};

const u8 sMainDeck_17_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_17_Bg1.tt.rle")
};

const u8 sMainDeck_17_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_17_Bg0[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_17_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_18_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_18_Clipdata.tt.rle")
};

const u8 sMainDeck_18_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_18_Bg2.tt.rle")
};

const u8 sMainDeck_18_SpriteData1[ROOM_SPRITE_DATA_COUNT(2)] = {
    5, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    6, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_18_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_18_Bg1.tt.rle")
};

const u8 sMainDeck_18_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_18_Bg0[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_18_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_19_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_19, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_19_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_19_Clipdata.tt.rle")
};

const u8 sMainDeck_19_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_19_Bg2.tt.rle")
};

const u8 sMainDeck_19_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_19_Bg1.tt.rle")
};

const u8 sMainDeck_19_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_19_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_19_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_20_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_20, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 31, // Y bounds
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

const u8 sMainDeck_20_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/MainDeck_20_Clipdata.tt.rle")
};

const u8 sMainDeck_20_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/MainDeck_20_Bg2.tt.rle")
};

const u8 sMainDeck_20_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/MainDeck_20_Bg1.tt.rle")
};

const u8 sMainDeck_20_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_21_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_21, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 31, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_21_Clipdata[] = {
    34, 34,
    _INCBIN_U8("data/rooms/MainDeck_21_Clipdata.tt.rle")
};

const u8 sMainDeck_21_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)] = {
    7, 5, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_21_Bg2[] = {
    34, 34,
    _INCBIN_U8("data/rooms/MainDeck_21_Bg2.tt.rle")
};

const u8 sMainDeck_21_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)] = {
    7, 5, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    15, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    29, 27, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    33, 16, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_21_Bg1[] = {
    34, 34,
    _INCBIN_U8("data/rooms/MainDeck_21_Bg1.tt.rle")
};

const u8 sMainDeck_21_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    7, 5, ROOM_SPRITESET_IDX(PSPRITE_TARGET_DIAGONAL),
    15, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    16, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(3),
    29, 27, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    33, 16, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_22_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_22_Clipdata.tt.rle")
};

const u8 sMainDeck_22_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_22_Bg2.tt.rle")
};

const u8 sMainDeck_22_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_22_Bg1.tt.rle")
};

const u8 sMainDeck_22_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    5, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    9, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    14, 5, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    20, 12, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    32, 12, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_23_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_23, // Room
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

const u8 sMainDeck_23_Clipdata[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_23_Clipdata.tt.rle")
};

const u8 sMainDeck_23_Bg2[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_23_Bg2.tt.rle")
};

const u8 sMainDeck_23_Bg1[] = {
    34, 24,
    _INCBIN_U8("data/rooms/MainDeck_23_Bg1.tt.rle")
};

const u8 sMainDeck_23_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_24_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_24, // Room
    2, // Count

    // Scroll 0
    17, 31, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension

    // Scroll 1
    2, 46, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_24_Clipdata[] = {
    49, 24,
    _INCBIN_U8("data/rooms/MainDeck_24_Clipdata.tt.rle")
};

const u8 sMainDeck_24_Bg2[] = {
    49, 24,
    _INCBIN_U8("data/rooms/MainDeck_24_Bg2.tt.rle")
};

const u8 sMainDeck_24_SpriteData1[ROOM_SPRITE_DATA_COUNT(13)] = {
    15, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    15, 29, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    16, 6, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    16, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    16, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    16, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    16, 29, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    16, 37, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    16, 39, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    16, 41, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    17, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    17, 29, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    18, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(12),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_24_Bg1[] = {
    49, 24,
    _INCBIN_U8("data/rooms/MainDeck_24_Bg1.tt.rle")
};

const u8 sMainDeck_24_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)] = {
    15, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    15, 29, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    16, 6, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    16, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    16, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    16, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    16, 29, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    16, 37, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    16, 39, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    16, 41, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    17, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    17, 29, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_24_Bg0[] = {
    49, 24,
    _INCBIN_U8("data/rooms/MainDeck_24_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_25_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_25, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_25_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_25_Clipdata.tt.rle")
};

const u8 sMainDeck_25_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_25_Bg2.tt.rle")
};

const u8 sMainDeck_25_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_25_Bg1.tt.rle")
};

const u8 sMainDeck_25_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    5, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    6, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    6, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    7, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    7, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(7),
    7, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(12),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_25_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_25_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_26_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_26, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_26_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_26_Clipdata.tt.rle")
};

const u8 sMainDeck_26_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_26_Bg2.tt.rle")
};

const u8 sMainDeck_26_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_26_Bg1.tt.rle")
};

const u8 sMainDeck_26_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    6, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    6, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    7, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    7, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(9),
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(12),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_26_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_26_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_27_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_27, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_27_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_27_Clipdata.tt.rle")
};

const u8 sMainDeck_27_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_27_Bg2.tt.rle")
};

const u8 sMainDeck_27_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_27_Bg1.tt.rle")
};

const u8 sMainDeck_27_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    6, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    7, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    7, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(11),
    8, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(12),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_27_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_27_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_28_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_28, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_28_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_28_Clipdata.tt.rle")
};

const u8 sMainDeck_28_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_28_Bg2.tt.rle")
};

const u8 sMainDeck_28_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_28_Bg1.tt.rle")
};

const u8 sMainDeck_28_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    5, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    6, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    6, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    7, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    7, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(6),
    7, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(12),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_28_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_28_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_29_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_29, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_29_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_29_Clipdata.tt.rle")
};

const u8 sMainDeck_29_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_29_Bg2.tt.rle")
};

const u8 sMainDeck_29_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_29_Bg1.tt.rle")
};

const u8 sMainDeck_29_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    6, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    6, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    7, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(8),
    7, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(12),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_29_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_29_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_30_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_30, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_30_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_30_Clipdata.tt.rle")
};

const u8 sMainDeck_30_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_30_Bg2.tt.rle")
};

const u8 sMainDeck_30_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_30_Bg1.tt.rle")
};

const u8 sMainDeck_30_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    4, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    5, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    6, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    7, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(10),
    7, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    8, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(12),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_30_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_30_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_31_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_31_Clipdata.tt.rle")
};

const u8 sMainDeck_31_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_31_Bg2.tt.rle")
};

const u8 sMainDeck_31_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_31_Bg1.tt.rle")
};

const u8 sMainDeck_31_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    3, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    3, 24, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    4, 16, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    5, 22, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_32_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_32_Clipdata.tt.rle")
};

const u8 sMainDeck_32_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_32_Bg2.tt.rle")
};

const u8 sMainDeck_32_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_32_Bg1.tt.rle")
};

const u8 sMainDeck_32_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_32_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_32_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_33_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_33_Clipdata.tt.rle")
};

const u8 sMainDeck_33_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_33_Bg2.tt.rle")
};

const u8 sMainDeck_33_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_33_Bg1.tt.rle")
};

const u8 sMainDeck_33_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_34_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_34_Clipdata.tt.rle")
};

const u8 sMainDeck_34_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_34_Bg2.tt.rle")
};

const u8 sMainDeck_34_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_34_Bg1.tt.rle")
};

const u8 sMainDeck_34_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_35_Clipdata[] = {
    19, 74,
    _INCBIN_U8("data/rooms/MainDeck_35_Clipdata.tt.rle")
};

const u8 sMainDeck_35_Bg2[] = {
    19, 74,
    _INCBIN_U8("data/rooms/MainDeck_35_Bg2.tt.rle")
};

const u8 sMainDeck_35_Bg1[] = {
    19, 74,
    _INCBIN_U8("data/rooms/MainDeck_35_Bg1.tt.rle")
};

const u8 sMainDeck_35_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)] = {
    5, 14, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    21, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    25, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    32, 7, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    70, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_36_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_36_Clipdata.tt.rle")
};

const u8 sMainDeck_36_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_36_Bg2.tt.rle")
};

const u8 sMainDeck_36_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_36_Bg1.tt.rle")
};

const u8 sMainDeck_36_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_37_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_37_Clipdata.tt.rle")
};

const u8 sMainDeck_37_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_37_Bg2.tt.rle")
};

const u8 sMainDeck_37_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_37_Bg1.tt.rle")
};

const u8 sMainDeck_37_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_37_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_37_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_38_Scrolls[SCROLL_DATA_COUNT(4)] = {
    MAIN_DECK_38, // Room
    4, // Count

    // Scroll 0
    32, 61, // X bounds
    2, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    46, 61, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    18, 46, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 3
    2, 18, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_38_Clipdata[] = {
    64, 34,
    _INCBIN_U8("data/rooms/MainDeck_38_Clipdata.tt.rle")
};

const u8 sMainDeck_38_Bg2[] = {
    64, 34,
    _INCBIN_U8("data/rooms/MainDeck_38_Bg2.tt.rle")
};

const u8 sMainDeck_38_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    25, 53, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_38_Bg1[] = {
    64, 34,
    _INCBIN_U8("data/rooms/MainDeck_38_Bg1.tt.rle")
};

const u8 sMainDeck_38_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    24, 53, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    25, 53, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    30, 50, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_39_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_39_Clipdata.tt.rle")
};

const u8 sMainDeck_39_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_39_Bg2.tt.rle")
};

const u8 sMainDeck_39_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_39_Bg1.tt.rle")
};

const u8 sMainDeck_39_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_39_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_39_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_40_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_40, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_40_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_40_Clipdata.tt.rle")
};

const u8 sMainDeck_40_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_40_Bg2.tt.rle")
};

const u8 sMainDeck_40_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_40_Bg1.tt.rle")
};

const u8 sMainDeck_40_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_40_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_40_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_41_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_41_Clipdata.tt.rle")
};

const u8 sMainDeck_41_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_41_Bg2.tt.rle")
};

const u8 sMainDeck_41_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_41_Bg1.tt.rle")
};

const u8 sMainDeck_41_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_42_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_42_Clipdata.tt.rle")
};

const u8 sMainDeck_42_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_42_Bg2.tt.rle")
};

const u8 sMainDeck_42_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_42_Bg1.tt.rle")
};

const u8 sMainDeck_42_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_43_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_43_Clipdata.tt.rle")
};

const u8 sMainDeck_43_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_43_Bg2.tt.rle")
};

const u8 sMainDeck_43_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_43_Bg1.tt.rle")
};

const u8 sMainDeck_43_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_44_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_44_Clipdata.tt.rle")
};

const u8 sMainDeck_44_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_44_Bg2.tt.rle")
};

const u8 sMainDeck_44_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_44_Bg1.tt.rle")
};

const u8 sMainDeck_44_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_44_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_44_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_45_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_45_Clipdata.tt.rle")
};

const u8 sMainDeck_45_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_45_Bg2.tt.rle")
};

const u8 sMainDeck_45_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_45_Bg1.tt.rle")
};

const u8 sMainDeck_45_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_46_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_46, // Room
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

const u8 sMainDeck_46_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_46_Clipdata.tt.rle")
};

const u8 sMainDeck_46_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_46_Bg2.tt.rle")
};

const u8 sMainDeck_46_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_46_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_46_Bg1.tt.rle")
};

const u8 sMainDeck_46_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 11, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_47_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_47, // Room
    2, // Count

    // Scroll 0
    2, 19, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    17, 91, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_47_Clipdata[] = {
    94, 14,
    _INCBIN_U8("data/rooms/MainDeck_47_Clipdata.tt.rle")
};

const u8 sMainDeck_47_Bg2[] = {
    94, 14,
    _INCBIN_U8("data/rooms/MainDeck_47_Bg2.tt.rle")
};

const u8 sMainDeck_47_Bg1[] = {
    94, 14,
    _INCBIN_U8("data/rooms/MainDeck_47_Bg1.tt.rle")
};

const u8 sMainDeck_47_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)] = {
    4, 40, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 47, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 55, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 64, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 72, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 80, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    4, 88, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    6, 57, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    8, 48, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 62, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 74, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    8, 83, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_48_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_48_Clipdata.tt.rle")
};

const u8 sMainDeck_48_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_48_Bg2.tt.rle")
};

const u8 sMainDeck_48_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    18, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_48_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_48_Bg1.tt.rle")
};

const u8 sMainDeck_48_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    18, 7, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_49_Clipdata[] = {
    34, 64,
    _INCBIN_U8("data/rooms/MainDeck_49_Clipdata.tt.rle")
};

const u8 sMainDeck_49_Bg2[] = {
    34, 64,
    _INCBIN_U8("data/rooms/MainDeck_49_Bg2.tt.rle")
};

const u8 sMainDeck_49_SpriteData1[ROOM_SPRITE_DATA_COUNT(14)] = {
    22, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    24, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    31, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    37, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    37, 28, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    38, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    39, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    41, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    43, 13, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(4),
    54, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    58, 11, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    58, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    58, 17, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    58, 20, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_49_Bg1[] = {
    34, 64,
    _INCBIN_U8("data/rooms/MainDeck_49_Bg1.tt.rle")
};

const u8 sMainDeck_49_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    24, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    37, 17, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    37, 28, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    38, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    41, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    54, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    58, 14, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_49_Bg0[] = {
    34, 64,
    _INCBIN_U8("data/rooms/MainDeck_49_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_50_Clipdata[] = {
    64, 14,
    _INCBIN_U8("data/rooms/MainDeck_50_Clipdata.tt.rle")
};

const u8 sMainDeck_50_Bg2[] = {
    64, 14,
    _INCBIN_U8("data/rooms/MainDeck_50_Bg2.tt.rle")
};

const u8 sMainDeck_50_Bg1[] = {
    64, 14,
    _INCBIN_U8("data/rooms/MainDeck_50_Bg1.tt.rle")
};

const u8 sMainDeck_50_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)] = {
    0, 31, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    0, 43, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    4, 21, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    10, 23, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    10, 47, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    13, 27, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    13, 41, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(2),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_51_Clipdata[] = {
    34, 54,
    _INCBIN_U8("data/rooms/MainDeck_51_Clipdata.tt.rle")
};

const u8 sMainDeck_51_Bg2[] = {
    34, 54,
    _INCBIN_U8("data/rooms/MainDeck_51_Bg2.tt.rle")
};

const u8 sMainDeck_51_Bg1[] = {
    34, 54,
    _INCBIN_U8("data/rooms/MainDeck_51_Bg1.tt.rle")
};

const u8 sMainDeck_51_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)] = {
    15, 9, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    22, 27, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    29, 21, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    34, 3, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    34, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    36, 27, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_52_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_52_Clipdata.tt.rle")
};

const u8 sMainDeck_52_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_52_Bg2.tt.rle")
};

const u8 sMainDeck_52_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_52_Bg1.tt.rle")
};

const u8 sMainDeck_52_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_53_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_53_Clipdata.tt.rle")
};

const u8 sMainDeck_53_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_53_Bg2.tt.rle")
};

const u8 sMainDeck_53_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_53_Bg1.tt.rle")
};

const u8 sMainDeck_53_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    14, 9, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    20, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_54_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_54_Clipdata.tt.rle")
};

const u8 sMainDeck_54_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_54_Bg2.tt.rle")
};

const u8 sMainDeck_54_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_54_Bg1.tt.rle")
};

const u8 sMainDeck_54_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_55_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_55_Clipdata.tt.rle")
};

const u8 sMainDeck_55_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_55_Bg2.tt.rle")
};

const u8 sMainDeck_55_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_55_Bg1.tt.rle")
};

const u8 sMainDeck_55_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_55_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_55_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_56_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_56_Clipdata.tt.rle")
};

const u8 sMainDeck_56_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_56_Bg2.tt.rle")
};

const u8 sMainDeck_56_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_56_Bg1.tt.rle")
};

const u8 sMainDeck_56_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_56_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_56_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_57_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_57_Clipdata.tt.rle")
};

const u8 sMainDeck_57_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_57_Bg2.tt.rle")
};

const u8 sMainDeck_57_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_57_Bg1.tt.rle")
};

const u8 sMainDeck_57_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_57_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_57_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_58_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_58_Clipdata.tt.rle")
};

const u8 sMainDeck_58_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_58_Bg2.tt.rle")
};

const u8 sMainDeck_58_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_58_Bg1.tt.rle")
};

const u8 sMainDeck_58_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_58_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_58_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_59_Clipdata[] = {
    34, 64,
    _INCBIN_U8("data/rooms/MainDeck_59_Clipdata.tt.rle")
};

const u8 sMainDeck_59_Bg2[] = {
    34, 64,
    _INCBIN_U8("data/rooms/MainDeck_59_Bg2.tt.rle")
};

const u8 sMainDeck_59_Bg1[] = {
    34, 64,
    _INCBIN_U8("data/rooms/MainDeck_59_Bg1.tt.rle")
};

const u8 sMainDeck_59_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_59_Bg0[] = {
    34, 64,
    _INCBIN_U8("data/rooms/MainDeck_59_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_60_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_60, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_60_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_60_Clipdata.tt.rle")
};

const u8 sMainDeck_60_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_60_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_60_Bg2.tt.rle")
};

const u8 sMainDeck_60_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_60_Bg1.tt.rle")
};

const u8 sMainDeck_60_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_60_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_60_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_61_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_61, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sMainDeck_61_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_61_Clipdata.tt.rle")
};

const u8 sMainDeck_61_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_61_Bg2.tt.rle")
};

const u8 sMainDeck_61_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_61_Bg1.tt.rle")
};

const u8 sMainDeck_61_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    18, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_62_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_62_Clipdata.tt.rle")
};

const u8 sMainDeck_62_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_62_Bg2.tt.rle")
};

const u8 sMainDeck_62_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_62_Bg1.tt.rle")
};

const u8 sMainDeck_62_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_63_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_63_Clipdata.tt.rle")
};

const u8 sMainDeck_63_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_63_Bg2.tt.rle")
};

const u8 sMainDeck_63_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_63_Bg1.tt.rle")
};

const u8 sMainDeck_63_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 30, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_64_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_64_Clipdata.tt.rle")
};

const u8 sMainDeck_64_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_64_Bg2.tt.rle")
};

const u8 sMainDeck_64_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_64_Bg1.tt.rle")
};

const u8 sMainDeck_64_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_65_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_65_Clipdata.tt.rle")
};

const u8 sMainDeck_65_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_65_Bg2.tt.rle")
};

const u8 sMainDeck_65_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_65_Bg1.tt.rle")
};

const u8 sMainDeck_65_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_66_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_66_Clipdata.tt.rle")
};

const u8 sMainDeck_66_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_66_Bg2.tt.rle")
};

const u8 sMainDeck_66_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_66_Bg1.tt.rle")
};

const u8 sMainDeck_66_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    9, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_67_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_67, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sMainDeck_67_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_67_Clipdata.tt.rle")
};

const u8 sMainDeck_67_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_67_Bg2.tt.rle")
};

const u8 sMainDeck_67_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_67_Bg1.tt.rle")
};

const u8 sMainDeck_67_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    17, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_68_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_68_Clipdata.tt.rle")
};

const u8 sMainDeck_68_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_68_Bg2.tt.rle")
};

const u8 sMainDeck_68_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_68_Bg1.tt.rle")
};

const u8 sMainDeck_68_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_68_Bg0_Unused[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_68_Bg0_Unused.tt.rle")
};
ALIGN2();

const u8 sMainDeck_69_Scrolls[SCROLL_DATA_COUNT(3)] = {
    MAIN_DECK_69, // Room
    3, // Count

    // Scroll 0
    2, 46, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 46, // X bounds
    11, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 2
    2, 46, // X bounds
    21, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_69_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_69_Clipdata.tt.rle")
};

const u8 sMainDeck_69_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_69_Bg2.tt.rle")
};

const u8 sMainDeck_69_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_69_Bg1.tt.rle")
};

const u8 sMainDeck_69_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)] = {
    9, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(9),
    9, 19, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(5),
    9, 20, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(8),
    9, 22, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(7),
    9, 23, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    9, 24, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(8),
    9, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(8),
    9, 31, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(9),
    9, 39, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(9),
    19, 33, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    28, 18, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    28, 33, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_70_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_70_Clipdata.tt.rle")
};

const u8 sMainDeck_70_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_70_Bg2.tt.rle")
};

const u8 sMainDeck_70_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)] = {
    6, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_70_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_70_Bg1.tt.rle")
};

const u8 sMainDeck_70_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    6, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    6, 10, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(7),
    8, 10, SSP_HIDDEN_ON_ROOM_LOAD | SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(5),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_71_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_71_Clipdata.tt.rle")
};

const u8 sMainDeck_71_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_71_Bg2.tt.rle")
};

const u8 sMainDeck_71_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_71_Bg1.tt.rle")
};

const u8 sMainDeck_71_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)] = {
    4, 8, ROOM_SPRITESET_IDX(PSPRITE_TARGET_CIRCLES),
    9, 7, SSP_X_UNABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_72_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_72_Clipdata.tt.rle")
};

const u8 sMainDeck_72_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_72_Bg2.tt.rle")
};

const u8 sMainDeck_72_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_72_Bg1.tt.rle")
};

const u8 sMainDeck_72_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 11, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_73_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_73_Clipdata.tt.rle")
};

const u8 sMainDeck_73_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_73_Bg2.tt.rle")
};

const u8 sMainDeck_73_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_73_Bg1.tt.rle")
};

const u8 sMainDeck_73_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_74_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_74, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    28, 46, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_74_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_74_Clipdata.tt.rle")
};

const u8 sMainDeck_74_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_74_Bg2.tt.rle")
};

const u8 sMainDeck_74_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_74_Bg1.tt.rle")
};

const u8 sMainDeck_74_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    16, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_74_Bg0[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_74_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_75_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_75, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sMainDeck_75_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_75_Clipdata.tt.rle")
};

const u8 sMainDeck_75_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_75_Bg2.tt.rle")
};

const u8 sMainDeck_75_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_75_Bg1.tt.rle")
};

const u8 sMainDeck_75_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    18, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_76_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_76, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    3, // Breakable block direction
    21, // Breakable block Y bound extension
};

const u8 sMainDeck_76_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_76_Clipdata.tt.rle")
};

const u8 sMainDeck_76_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_76_Bg2.tt.rle")
};

const u8 sMainDeck_76_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_76_Bg1.tt.rle")
};

const u8 sMainDeck_76_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    8, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_77_Scrolls[SCROLL_DATA_COUNT(3)] = {
    MAIN_DECK_77, // Room
    3, // Count

    // Scroll 0
    2, 16, // X bounds
    2, 11, // Y bounds
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
    9, 35, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_77_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_77_Clipdata.tt.rle")
};

const u8 sMainDeck_77_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_77_Bg2.tt.rle")
};

const u8 sMainDeck_77_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_77_Bg1.tt.rle")
};

const u8 sMainDeck_77_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_77_Bg0[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_77_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_78_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_78, // Room
    2, // Count

    // Scroll 0
    2, 16, // X bounds
    22, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    2, 16, // X bounds
    32, 41, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_78_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_78_Clipdata.tt.rle")
};

const u8 sMainDeck_78_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_78_Bg2.tt.rle")
};

const u8 sMainDeck_78_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_78_Bg1.tt.rle")
};

const u8 sMainDeck_78_SpriteData0[ROOM_SPRITE_DATA_COUNT(23)] = {
    23, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    24, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    25, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    25, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    25, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    26, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    26, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    26, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    27, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    27, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    27, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    30, 10, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(7),
    33, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    34, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    35, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    35, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    35, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    36, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    36, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    36, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    37, 5, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    37, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    37, 13, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(1),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_78_Bg0[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_78_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_79_Scrolls[SCROLL_DATA_COUNT(1)] = {
    MAIN_DECK_79, // Room
    1, // Count

    // Scroll 0
    2, 16, // X bounds
    32, 41, // Y bounds
    10, 32, // Breakable block position
    2, // Breakable block direction
    2, // Breakable block Y bound extension
};

const u8 sMainDeck_79_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_79_Clipdata.tt.rle")
};

const u8 sMainDeck_79_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_79_Bg2.tt.rle")
};

const u8 sMainDeck_79_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_79_Bg1.tt.rle")
};

const u8 sMainDeck_79_SpriteData0[ROOM_SPRITE_DATA_COUNT(14)] = {
    8, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    13, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    15, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    20, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    24, 6, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    26, 12, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    32, 4, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(2),
    32, 6, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    32, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(3),
    32, 12, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    33, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    34, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    35, 9, SSP_X_ABSORBABLE_BY_SAMUS | ROOM_SPRITESET_IDX(1),
    40, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_79_Bg0[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_79_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_80_Clipdata[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_80_Clipdata.tt.rle")
};

const u8 sMainDeck_80_Bg2[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_80_Bg2.tt.rle")
};

const u8 sMainDeck_80_Bg1[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_80_Bg1.tt.rle")
};

const u8 sMainDeck_80_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    3, 8, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(7),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_80_Bg0[] = {
    19, 24,
    _INCBIN_U8("data/rooms/MainDeck_80_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_81_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_81_Clipdata.tt.rle")
};

const u8 sMainDeck_81_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_81_Bg2.tt.rle")
};

const u8 sMainDeck_81_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_81_Bg1.tt.rle")
};

const u8 sMainDeck_81_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(4),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_81_Bg0[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_81_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_82_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_82, // Room
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

const u8 sMainDeck_82_Clipdata[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_82_Clipdata.tt.rle")
};

const u8 sMainDeck_82_Bg2[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_82_Bg2.tt.rle")
};

const u8 sMainDeck_82_Bg1[] = {
    34, 14,
    _INCBIN_U8("data/rooms/MainDeck_82_Bg1.tt.rle")
};

const u8 sMainDeck_82_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    10, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_83_Clipdata[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_83_Clipdata.tt.rle")
};

const u8 sMainDeck_83_Bg2[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_83_Bg2.tt.rle")
};

const u8 sMainDeck_83_Bg1[] = {
    19, 44,
    _INCBIN_U8("data/rooms/MainDeck_83_Bg1.tt.rle")
};

const u8 sMainDeck_83_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)] = {
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_84_Clipdata[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_84_Clipdata.tt.rle")
};

const u8 sMainDeck_84_Bg2[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_84_Bg2.tt.rle")
};

const u8 sMainDeck_84_Bg1[] = {
    19, 14,
    _INCBIN_U8("data/rooms/MainDeck_84_Bg1.tt.rle")
};

const u8 sMainDeck_84_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)] = {
    7, 14, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_85_Scrolls[SCROLL_DATA_COUNT(2)] = {
    MAIN_DECK_85, // Room
    2, // Count

    // Scroll 0
    2, 31, // X bounds
    2, 31, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension

    // Scroll 1
    28, 46, // X bounds
    12, 21, // Y bounds
    UCHAR_MAX, UCHAR_MAX, // Breakable block position
    UCHAR_MAX, // Breakable block direction
    UCHAR_MAX, // Breakable block Y bound extension
};

const u8 sMainDeck_85_Clipdata[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_85_Clipdata.tt.rle")
};

const u8 sMainDeck_85_Bg2[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_85_Bg2.tt.rle")
};

const u8 sMainDeck_85_Bg1[] = {
    49, 34,
    _INCBIN_U8("data/rooms/MainDeck_85_Bg1.tt.rle")
};

const u8 sMainDeck_85_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    13, 16, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    16, 26, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    20, 18, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};
ALIGN2();

const u8 sMainDeck_86_Clipdata[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_86_Clipdata.tt.rle")
};

const u8 sMainDeck_86_Bg2[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_86_Bg2.tt.rle")
};

const u8 sMainDeck_86_Bg1[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_86_Bg1.tt.rle")
};

const u8 sMainDeck_86_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)] = {
    23, 9, SSP_CAN_ABSORB_ADDITIONAL_X | ROOM_SPRITESET_IDX(0),
    24, 9, ROOM_SPRITESET_IDX(PSPRITE_CORE_X_TARGET),
    25, 9, ROOM_SPRITESET_IDX(PSPRITE_TARGET_SIDEWAYS),
    ROOM_SPRITE_DATA_TERMINATOR
};

const u8 sMainDeck_86_Bg0[] = {
    19, 34,
    _INCBIN_U8("data/rooms/MainDeck_86_Bg0.tt.rle")
};
ALIGN2();

const u8 sMainDeck_82_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_82_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_63_Bg3[] = {
    0, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_63_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_63_Bg0[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_63_Bg0.tt.lz")
};
ALIGN2();

const u8 sMainDeck_1_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_1_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_6_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_6_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_59_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_59_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_49_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_49_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_19_Bg3[] = {
    0, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_19_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_10_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_10_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_86_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_86_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_79_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_79_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_62_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_62_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_78_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_78_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_80_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_80_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_23_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_23_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_23_Bg0[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_23_Bg0.tt.lz")
};
ALIGN2();

const u8 sMainDeck_71_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_71_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_71_Bg0[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_71_Bg0.tt.lz")
};
ALIGN2();

const u8 sMainDeck_46_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_46_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_38_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_38_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_48_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_48_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_14_Bg0[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_14_Bg0.tt.lz")
};
ALIGN2();

const u8 sMainDeck_18_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_18_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_20_Bg0[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_20_Bg0.tt.lz")
};
ALIGN2();

const u8 sMainDeck_15_Bg3[] = {
    2, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_15_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_69_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_69_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_13_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_13_Bg3.tt.lz")
};
ALIGN2();

const u8 sMainDeck_7_Bg3[] = {
    1, 0, 0, 0,
    _INCBIN_U8("data/rooms/MainDeck_7_Bg3.tt.lz")
};
ALIGN2();
