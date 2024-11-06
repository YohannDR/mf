#ifndef MAIN_DECK_ROOMS_DATA_H
#define MAIN_DECK_ROOMS_DATA_H

#include "macros.h"
#include "constants/room.h"
#include "constants/sprite.h"
#include "structs/room.h"
#include "structs/scroll.h"

extern const u8 sTileset_89_Gfx[];
extern const u8 sTileset_16_Gfx[];
extern const u8 sTileset_96_Gfx[];
extern const u8 sTileset_97_Gfx[];
extern const u8 sTileset_55_Gfx[];
extern const u8 sTileset_54_Gfx[];
extern const u8 sTileset_17_Gfx[];
extern const u8 sTileset_29_Gfx[];
extern const u8 sTileset_6_Gfx[];
extern const u8 sTileset_28_Gfx[];
extern const u8 sTileset_7_Gfx[];
extern const u8 sTileset_66_Gfx[];
extern const u8 sTileset_85_Gfx[];
extern const u8 sTileset_19_Gfx[];
extern const u8 sTileset_50_Gfx[];
extern const u8 sTileset_69_Gfx[];
extern const u8 sTileset_27_Gfx[];
extern const u8 sTileset_56_Gfx[];
extern const u8 sTileset_18_Gfx[];
extern const u8 sTileset_60_Gfx[];
extern const u8 sTileset_26_Gfx[];
extern const u8 sTileset_84_Gfx[];
extern const u8 sTileset_8_Gfx[];
extern const u8 sTileset_89_Bg_Gfx[];
extern const u8 sTileset_97_Bg_Gfx[];
extern const u8 sTileset_16_Bg_Gfx[];
extern const u8 sTileset_55_Bg_Gfx[];
extern const u8 sTileset_54_Bg_Gfx[];
extern const u8 sTileset_29_Bg_Gfx[];
extern const u8 sTileset_28_Bg_Gfx[];
extern const u8 sTileset_7_Bg_Gfx[];
extern const u8 sTileset_85_Bg_Gfx[];
extern const u8 sTileset_66_Bg_Gfx[];
extern const u8 sTileset_80_Bg_Gfx[];
extern const u8 sTileset_83_Bg_Gfx[];
extern const u8 sTileset_50_Bg_Gfx[];
extern const u8 sTileset_69_Bg_Gfx[];
extern const u8 sTileset_70_Bg_Gfx[];
extern const u8 sTileset_19_Bg_Gfx[];
extern const u8 sTileset_56_Bg_Gfx[];
extern const u8 sTileset_17_Bg_Gfx[];
extern const u8 sTileset_18_Bg_Gfx[];
extern const u8 sTileset_60_Bg_Gfx[];
extern const u8 sTileset_61_Bg_Gfx[];
extern const u8 sTileset_6_Bg_Gfx[];
extern const u8 sTileset_8_Bg_Gfx[];
extern const u16 sTileset_89_Tilemap[0x5c2];
extern const u16 sTileset_16_Tilemap[0x602];
extern const u16 sTileset_96_Tilemap[0x602];
extern const u16 sTileset_97_Tilemap[0x702];
extern const u16 sTileset_55_Tilemap[0xac2];
extern const u16 sTileset_54_Tilemap[0xac2];
extern const u16 sTileset_17_Tilemap[0xa02];
extern const u16 sTileset_29_Tilemap[0x602];
extern const u16 sTileset_6_Tilemap[0x602];
extern const u16 sTileset_28_Tilemap[0x602];
extern const u16 sTileset_7_Tilemap[0x482];
extern const u16 sTileset_66_Tilemap[0x702];
extern const u16 sTileset_85_Tilemap[0x702];
extern const u16 sTileset_19_Tilemap[0xac2];
extern const u16 sTileset_50_Tilemap[0x442];
extern const u16 sTileset_69_Tilemap[0x4c2];
extern const u16 sTileset_27_Tilemap[0x6c2];
extern const u16 sTileset_56_Tilemap[0x702];
extern const u16 sTileset_18_Tilemap[0x502];
extern const u16 sTileset_60_Tilemap[0x502];
extern const u16 sTileset_26_Tilemap[0x602];
extern const u16 sTileset_84_Tilemap[0x482];
extern const u16 sTileset_8_Tilemap[0x482];
extern const u16 sTileset_89_Pal[14 * 16];
extern const u16 sAnimatedPal_29[6 * 16];
extern const u16 sTileset_16_Pal[14 * 16];
extern const u16 sAnimatedPal_5[10 * 16];
extern const u16 sTileset_96_Pal[14 * 16];
extern const u16 sTileset_97_Pal[14 * 16];
extern const u16 sTileset_55_Pal[14 * 16];
extern const u16 sAnimatedPal_27[10 * 16];
extern const u16 sTileset_54_Pal[14 * 16];
extern const u16 sTileset_17_Pal[14 * 16];
extern const u16 sAnimatedPal_6[8 * 16];
extern const u16 sTileset_35_Pal[14 * 16];
extern const u16 sAnimatedPal_10[8 * 16];
extern const u16 sTileset_36_Pal[14 * 16];
extern const u16 sAnimatedPal_11[8 * 16];
extern const u16 sTileset_37_Pal[14 * 16];
extern const u16 sAnimatedPal_12[8 * 16];
extern const u16 sTileset_38_Pal[14 * 16];
extern const u16 sAnimatedPal_13[8 * 16];
extern const u16 sTileset_39_Pal[14 * 16];
extern const u16 sAnimatedPal_14[8 * 16];
extern const u16 sTileset_29_Pal[14 * 16];
extern const u16 sAnimatedPal_8[8 * 16];
extern const u16 sTileset_6_Pal[14 * 16];
extern const u16 sTileset_28_Pal[14 * 16];
extern const u16 sTileset_7_Pal[14 * 16];
extern const u16 sTileset_66_Pal[14 * 16];
extern const u16 sAnimatedPal_28[8 * 16];
extern const u16 sAnimatedPal_32[9 * 16];
extern const u16 sTileset_83_Pal[14 * 16];
extern const u16 sTileset_85_Pal[14 * 16];
extern const u16 sTileset_19_Pal[14 * 16];
extern const u16 sTileset_50_Pal[14 * 16];
extern const u16 sAnimatedPal_21[8 * 16];
extern const u16 sTileset_69_Pal[14 * 16];
extern const u16 sTileset_27_Pal[14 * 16];
extern const u16 sTileset_56_Pal[14 * 16];
extern const u16 sAnimatedPal_26[4 * 16];
extern const u16 sTileset_18_Pal[14 * 16];
extern const u16 sTileset_60_Pal[14 * 16];
extern const u16 sTileset_26_Pal[14 * 16];
extern const u16 sAnimatedPal_7[4 * 16];
extern const u16 sTileset_63_Pal[14 * 16];
extern const u16 sAnimatedPal_24[8 * 16];
extern const u16 sTileset_84_Pal[14 * 16];
extern const u16 sTileset_8_Pal[14 * 16];
extern const u8 sMainDeck_0_Clipdata[];
extern const u8 sMainDeck_0_Bg2[];
extern const u8 sMainDeck_0_Bg1[];
extern const u8 sMainDeck_0_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_1_Clipdata[];
extern const u8 sMainDeck_1_Bg2[];
extern const u8 sMainDeck_1_Bg1[];
extern const u8 sMainDeck_1_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_2_Clipdata[];
extern const u8 sMainDeck_2_Bg2[];
extern const u8 sMainDeck_2_Bg1[];
extern const u8 sMainDeck_2_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_3_Clipdata[];
extern const u8 sMainDeck_3_Bg2[];
extern const u8 sMainDeck_3_SpriteData1_Unused[ROOM_SPRITE_DATA_COUNT(2)];
extern const u8 sMainDeck_3_Bg1[];
extern const u8 sMainDeck_3_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_3_Bg0[];
extern const u8 sMainDeck_4_Clipdata[];
extern const u8 sMainDeck_4_Bg2[];
extern const u8 sMainDeck_4_SpriteData1_Unused[ROOM_SPRITE_DATA_COUNT(2)];
extern const u8 sMainDeck_4_Bg1[];
extern const u8 sMainDeck_4_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_5_Clipdata[];
extern const u8 sMainDeck_5_Bg2_Unused[];
extern const u8 sMainDeck_5_Bg1[];
extern const u8 sMainDeck_5_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_6_Clipdata[];
extern const u8 sMainDeck_6_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_6_Bg2[];
extern const u8 sMainDeck_6_SpriteData1[ROOM_SPRITE_DATA_COUNT(2)];
extern const u8 sMainDeck_6_Bg1[];
extern const u8 sMainDeck_6_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_6_Bg0[];
extern const u8 sMainDeck_7_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_7_Clipdata[];
extern const u8 sMainDeck_7_Bg2[];
extern const u8 sMainDeck_7_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_7_Bg1[];
extern const u8 sMainDeck_7_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_7_Bg0[];
extern const u8 sMainDeck_8_Clipdata[];
extern const u8 sMainDeck_8_Bg2[];
extern const u8 sMainDeck_8_Bg1[];
extern const u8 sMainDeck_8_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_9_Clipdata[];
extern const u8 sMainDeck_9_Bg2[];
extern const u8 sMainDeck_9_Bg1[];
extern const u8 sMainDeck_9_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_10_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_10_Clipdata[];
extern const u8 sMainDeck_10_Bg2[];
extern const u8 sMainDeck_10_Bg1[];
extern const u8 sMainDeck_10_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)];
extern const u8 sMainDeck_10_Bg0[];
extern const u8 sMainDeck_11_Clipdata[];
extern const u8 sMainDeck_11_Bg2[];
extern const u8 sMainDeck_11_Bg1[];
extern const u8 sMainDeck_11_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_12_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_12_Clipdata[];
extern const u8 sMainDeck_12_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_12_Bg2[];
extern const u8 sMainDeck_12_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)];
extern const u8 sMainDeck_12_Bg1[];
extern const u8 sMainDeck_12_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)];
extern const u8 sMainDeck_13_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_13_Clipdata[];
extern const u8 sMainDeck_13_Bg2[];
extern const u8 sMainDeck_13_SpriteData1[ROOM_SPRITE_DATA_COUNT(3)];
extern const u8 sMainDeck_13_Bg1[];
extern const u8 sMainDeck_13_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_14_Clipdata[];
extern const u8 sMainDeck_14_Bg2[];
extern const u8 sMainDeck_14_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_14_Bg1[];
extern const u8 sMainDeck_14_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)];
extern const u8 sMainDeck_15_Clipdata[];
extern const u8 sMainDeck_15_Bg2[];
extern const u8 sMainDeck_15_Bg1[];
extern const u8 sMainDeck_15_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)];
extern const u8 sMainDeck_16_Clipdata[];
extern const u8 sMainDeck_16_Bg2[];
extern const u8 sMainDeck_16_Bg1[];
extern const u8 sMainDeck_16_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_16_Bg0[];
extern const u8 sMainDeck_17_Scrolls[SCROLL_DATA_COUNT(3)];
extern const u8 sMainDeck_17_Clipdata[];
extern const u8 sMainDeck_17_Bg2[];
extern const u8 sMainDeck_17_Bg1[];
extern const u8 sMainDeck_17_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_17_Bg0[];
extern const u8 sMainDeck_18_Clipdata[];
extern const u8 sMainDeck_18_Bg2[];
extern const u8 sMainDeck_18_SpriteData1[ROOM_SPRITE_DATA_COUNT(2)];
extern const u8 sMainDeck_18_Bg1[];
extern const u8 sMainDeck_18_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_18_Bg0[];
extern const u8 sMainDeck_19_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_19_Clipdata[];
extern const u8 sMainDeck_19_Bg2[];
extern const u8 sMainDeck_19_Bg1[];
extern const u8 sMainDeck_19_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_19_Bg0[];
extern const u8 sMainDeck_20_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_20_Clipdata[];
extern const u8 sMainDeck_20_Bg2[];
extern const u8 sMainDeck_20_Bg1[];
extern const u8 sMainDeck_20_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_21_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_21_Clipdata[];
extern const u8 sMainDeck_21_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_21_Bg2[];
extern const u8 sMainDeck_21_SpriteData1[ROOM_SPRITE_DATA_COUNT(4)];
extern const u8 sMainDeck_21_Bg1[];
extern const u8 sMainDeck_21_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)];
extern const u8 sMainDeck_22_Clipdata[];
extern const u8 sMainDeck_22_Bg2[];
extern const u8 sMainDeck_22_Bg1[];
extern const u8 sMainDeck_22_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)];
extern const u8 sMainDeck_23_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_23_Clipdata[];
extern const u8 sMainDeck_23_Bg2[];
extern const u8 sMainDeck_23_Bg1[];
extern const u8 sMainDeck_23_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_24_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_24_Clipdata[];
extern const u8 sMainDeck_24_Bg2[];
extern const u8 sMainDeck_24_SpriteData1[ROOM_SPRITE_DATA_COUNT(13)];
extern const u8 sMainDeck_24_Bg1[];
extern const u8 sMainDeck_24_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)];
extern const u8 sMainDeck_24_Bg0[];
extern const u8 sMainDeck_25_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_25_Clipdata[];
extern const u8 sMainDeck_25_Bg2[];
extern const u8 sMainDeck_25_Bg1[];
extern const u8 sMainDeck_25_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)];
extern const u8 sMainDeck_25_Bg0[];
extern const u8 sMainDeck_26_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_26_Clipdata[];
extern const u8 sMainDeck_26_Bg2[];
extern const u8 sMainDeck_26_Bg1[];
extern const u8 sMainDeck_26_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)];
extern const u8 sMainDeck_26_Bg0[];
extern const u8 sMainDeck_27_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_27_Clipdata[];
extern const u8 sMainDeck_27_Bg2[];
extern const u8 sMainDeck_27_Bg1[];
extern const u8 sMainDeck_27_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)];
extern const u8 sMainDeck_27_Bg0[];
extern const u8 sMainDeck_28_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_28_Clipdata[];
extern const u8 sMainDeck_28_Bg2[];
extern const u8 sMainDeck_28_Bg1[];
extern const u8 sMainDeck_28_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)];
extern const u8 sMainDeck_28_Bg0[];
extern const u8 sMainDeck_29_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_29_Clipdata[];
extern const u8 sMainDeck_29_Bg2[];
extern const u8 sMainDeck_29_Bg1[];
extern const u8 sMainDeck_29_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)];
extern const u8 sMainDeck_29_Bg0[];
extern const u8 sMainDeck_30_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_30_Clipdata[];
extern const u8 sMainDeck_30_Bg2[];
extern const u8 sMainDeck_30_Bg1[];
extern const u8 sMainDeck_30_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)];
extern const u8 sMainDeck_30_Bg0[];
extern const u8 sMainDeck_31_Clipdata[];
extern const u8 sMainDeck_31_Bg2[];
extern const u8 sMainDeck_31_Bg1[];
extern const u8 sMainDeck_31_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)];
extern const u8 sMainDeck_32_Clipdata[];
extern const u8 sMainDeck_32_Bg2[];
extern const u8 sMainDeck_32_Bg1[];
extern const u8 sMainDeck_32_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_32_Bg0[];
extern const u8 sMainDeck_33_Clipdata[];
extern const u8 sMainDeck_33_Bg2[];
extern const u8 sMainDeck_33_Bg1[];
extern const u8 sMainDeck_33_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_34_Clipdata[];
extern const u8 sMainDeck_34_Bg2[];
extern const u8 sMainDeck_34_Bg1[];
extern const u8 sMainDeck_34_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_35_Clipdata[];
extern const u8 sMainDeck_35_Bg2[];
extern const u8 sMainDeck_35_Bg1[];
extern const u8 sMainDeck_35_SpriteData0[ROOM_SPRITE_DATA_COUNT(5)];
extern const u8 sMainDeck_36_Clipdata[];
extern const u8 sMainDeck_36_Bg2[];
extern const u8 sMainDeck_36_Bg1[];
extern const u8 sMainDeck_36_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_37_Clipdata[];
extern const u8 sMainDeck_37_Bg2[];
extern const u8 sMainDeck_37_Bg1[];
extern const u8 sMainDeck_37_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_37_Bg0[];
extern const u8 sMainDeck_38_Scrolls[SCROLL_DATA_COUNT(4)];
extern const u8 sMainDeck_38_Clipdata[];
extern const u8 sMainDeck_38_Bg2[];
extern const u8 sMainDeck_38_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_38_Bg1[];
extern const u8 sMainDeck_38_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)];
extern const u8 sMainDeck_39_Clipdata[];
extern const u8 sMainDeck_39_Bg2[];
extern const u8 sMainDeck_39_Bg1[];
extern const u8 sMainDeck_39_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_39_Bg0[];
extern const u8 sMainDeck_40_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_40_Clipdata[];
extern const u8 sMainDeck_40_Bg2[];
extern const u8 sMainDeck_40_Bg1[];
extern const u8 sMainDeck_40_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_40_Bg0[];
extern const u8 sMainDeck_41_Clipdata[];
extern const u8 sMainDeck_41_Bg2[];
extern const u8 sMainDeck_41_Bg1[];
extern const u8 sMainDeck_41_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_42_Clipdata[];
extern const u8 sMainDeck_42_Bg2[];
extern const u8 sMainDeck_42_Bg1[];
extern const u8 sMainDeck_42_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_43_Clipdata[];
extern const u8 sMainDeck_43_Bg2[];
extern const u8 sMainDeck_43_Bg1[];
extern const u8 sMainDeck_43_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_44_Clipdata[];
extern const u8 sMainDeck_44_Bg2[];
extern const u8 sMainDeck_44_Bg1[];
extern const u8 sMainDeck_44_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_44_Bg0[];
extern const u8 sMainDeck_45_Clipdata[];
extern const u8 sMainDeck_45_Bg2[];
extern const u8 sMainDeck_45_Bg1[];
extern const u8 sMainDeck_45_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_46_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_46_Clipdata[];
extern const u8 sMainDeck_46_Bg2[];
extern const u8 sMainDeck_46_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_46_Bg1[];
extern const u8 sMainDeck_46_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_47_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_47_Clipdata[];
extern const u8 sMainDeck_47_Bg2[];
extern const u8 sMainDeck_47_Bg1[];
extern const u8 sMainDeck_47_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)];
extern const u8 sMainDeck_48_Clipdata[];
extern const u8 sMainDeck_48_Bg2[];
extern const u8 sMainDeck_48_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_48_Bg1[];
extern const u8 sMainDeck_48_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_49_Clipdata[];
extern const u8 sMainDeck_49_Bg2[];
extern const u8 sMainDeck_49_SpriteData1[ROOM_SPRITE_DATA_COUNT(14)];
extern const u8 sMainDeck_49_Bg1[];
extern const u8 sMainDeck_49_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)];
extern const u8 sMainDeck_49_Bg0[];
extern const u8 sMainDeck_50_Clipdata[];
extern const u8 sMainDeck_50_Bg2[];
extern const u8 sMainDeck_50_Bg1[];
extern const u8 sMainDeck_50_SpriteData0[ROOM_SPRITE_DATA_COUNT(7)];
extern const u8 sMainDeck_51_Clipdata[];
extern const u8 sMainDeck_51_Bg2[];
extern const u8 sMainDeck_51_Bg1[];
extern const u8 sMainDeck_51_SpriteData0[ROOM_SPRITE_DATA_COUNT(6)];
extern const u8 sMainDeck_52_Clipdata[];
extern const u8 sMainDeck_52_Bg2[];
extern const u8 sMainDeck_52_Bg1[];
extern const u8 sMainDeck_52_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_53_Clipdata[];
extern const u8 sMainDeck_53_Bg2[];
extern const u8 sMainDeck_53_Bg1[];
extern const u8 sMainDeck_53_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)];
extern const u8 sMainDeck_54_Clipdata[];
extern const u8 sMainDeck_54_Bg2[];
extern const u8 sMainDeck_54_Bg1[];
extern const u8 sMainDeck_54_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_55_Clipdata[];
extern const u8 sMainDeck_55_Bg2[];
extern const u8 sMainDeck_55_Bg1[];
extern const u8 sMainDeck_55_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_55_Bg0[];
extern const u8 sMainDeck_56_Clipdata[];
extern const u8 sMainDeck_56_Bg2[];
extern const u8 sMainDeck_56_Bg1[];
extern const u8 sMainDeck_56_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_56_Bg0[];
extern const u8 sMainDeck_57_Clipdata[];
extern const u8 sMainDeck_57_Bg2[];
extern const u8 sMainDeck_57_Bg1[];
extern const u8 sMainDeck_57_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_57_Bg0[];
extern const u8 sMainDeck_58_Clipdata[];
extern const u8 sMainDeck_58_Bg2[];
extern const u8 sMainDeck_58_Bg1[];
extern const u8 sMainDeck_58_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_58_Bg0[];
extern const u8 sMainDeck_59_Clipdata[];
extern const u8 sMainDeck_59_Bg2[];
extern const u8 sMainDeck_59_Bg1[];
extern const u8 sMainDeck_59_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_59_Bg0[];
extern const u8 sMainDeck_60_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_60_Clipdata[];
extern const u8 sMainDeck_60_SpriteData2[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_60_Bg2[];
extern const u8 sMainDeck_60_Bg1[];
extern const u8 sMainDeck_60_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_60_Bg0[];
extern const u8 sMainDeck_61_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_61_Clipdata[];
extern const u8 sMainDeck_61_Bg2[];
extern const u8 sMainDeck_61_Bg1[];
extern const u8 sMainDeck_61_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_62_Clipdata[];
extern const u8 sMainDeck_62_Bg2[];
extern const u8 sMainDeck_62_Bg1[];
extern const u8 sMainDeck_62_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_63_Clipdata[];
extern const u8 sMainDeck_63_Bg2[];
extern const u8 sMainDeck_63_Bg1[];
extern const u8 sMainDeck_63_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_64_Clipdata[];
extern const u8 sMainDeck_64_Bg2[];
extern const u8 sMainDeck_64_Bg1[];
extern const u8 sMainDeck_64_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_65_Clipdata[];
extern const u8 sMainDeck_65_Bg2[];
extern const u8 sMainDeck_65_Bg1[];
extern const u8 sMainDeck_65_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_66_Clipdata[];
extern const u8 sMainDeck_66_Bg2[];
extern const u8 sMainDeck_66_Bg1[];
extern const u8 sMainDeck_66_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_67_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_67_Clipdata[];
extern const u8 sMainDeck_67_Bg2[];
extern const u8 sMainDeck_67_Bg1[];
extern const u8 sMainDeck_67_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_68_Clipdata[];
extern const u8 sMainDeck_68_Bg2[];
extern const u8 sMainDeck_68_Bg1[];
extern const u8 sMainDeck_68_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_68_Bg0_Unused[];
extern const u8 sMainDeck_69_Scrolls[SCROLL_DATA_COUNT(3)];
extern const u8 sMainDeck_69_Clipdata[];
extern const u8 sMainDeck_69_Bg2[];
extern const u8 sMainDeck_69_Bg1[];
extern const u8 sMainDeck_69_SpriteData0[ROOM_SPRITE_DATA_COUNT(12)];
extern const u8 sMainDeck_70_Clipdata[];
extern const u8 sMainDeck_70_Bg2[];
extern const u8 sMainDeck_70_SpriteData1[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_70_Bg1[];
extern const u8 sMainDeck_70_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)];
extern const u8 sMainDeck_71_Clipdata[];
extern const u8 sMainDeck_71_Bg2[];
extern const u8 sMainDeck_71_Bg1[];
extern const u8 sMainDeck_71_SpriteData0[ROOM_SPRITE_DATA_COUNT(2)];
extern const u8 sMainDeck_72_Clipdata[];
extern const u8 sMainDeck_72_Bg2[];
extern const u8 sMainDeck_72_Bg1[];
extern const u8 sMainDeck_72_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_73_Clipdata[];
extern const u8 sMainDeck_73_Bg2[];
extern const u8 sMainDeck_73_Bg1[];
extern const u8 sMainDeck_73_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_74_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_74_Clipdata[];
extern const u8 sMainDeck_74_Bg2[];
extern const u8 sMainDeck_74_Bg1[];
extern const u8 sMainDeck_74_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_74_Bg0[];
extern const u8 sMainDeck_75_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_75_Clipdata[];
extern const u8 sMainDeck_75_Bg2[];
extern const u8 sMainDeck_75_Bg1[];
extern const u8 sMainDeck_75_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_76_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_76_Clipdata[];
extern const u8 sMainDeck_76_Bg2[];
extern const u8 sMainDeck_76_Bg1[];
extern const u8 sMainDeck_76_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_77_Scrolls[SCROLL_DATA_COUNT(3)];
extern const u8 sMainDeck_77_Clipdata[];
extern const u8 sMainDeck_77_Bg2[];
extern const u8 sMainDeck_77_Bg1[];
extern const u8 sMainDeck_77_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_77_Bg0[];
extern const u8 sMainDeck_78_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_78_Clipdata[];
extern const u8 sMainDeck_78_Bg2[];
extern const u8 sMainDeck_78_Bg1[];
extern const u8 sMainDeck_78_SpriteData0[ROOM_SPRITE_DATA_COUNT(23)];
extern const u8 sMainDeck_78_Bg0[];
extern const u8 sMainDeck_79_Scrolls[SCROLL_DATA_COUNT(1)];
extern const u8 sMainDeck_79_Clipdata[];
extern const u8 sMainDeck_79_Bg2[];
extern const u8 sMainDeck_79_Bg1[];
extern const u8 sMainDeck_79_SpriteData0[ROOM_SPRITE_DATA_COUNT(14)];
extern const u8 sMainDeck_79_Bg0[];
extern const u8 sMainDeck_80_Clipdata[];
extern const u8 sMainDeck_80_Bg2[];
extern const u8 sMainDeck_80_Bg1[];
extern const u8 sMainDeck_80_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_80_Bg0[];
extern const u8 sMainDeck_81_Clipdata[];
extern const u8 sMainDeck_81_Bg2[];
extern const u8 sMainDeck_81_Bg1[];
extern const u8 sMainDeck_81_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_81_Bg0[];
extern const u8 sMainDeck_82_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_82_Clipdata[];
extern const u8 sMainDeck_82_Bg2[];
extern const u8 sMainDeck_82_Bg1[];
extern const u8 sMainDeck_82_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_83_Clipdata[];
extern const u8 sMainDeck_83_Bg2[];
extern const u8 sMainDeck_83_Bg1[];
extern const u8 sMainDeck_83_SpriteData0[ROOM_SPRITE_DATA_COUNT(0)];
extern const u8 sMainDeck_84_Clipdata[];
extern const u8 sMainDeck_84_Bg2[];
extern const u8 sMainDeck_84_Bg1[];
extern const u8 sMainDeck_84_SpriteData0[ROOM_SPRITE_DATA_COUNT(1)];
extern const u8 sMainDeck_85_Scrolls[SCROLL_DATA_COUNT(2)];
extern const u8 sMainDeck_85_Clipdata[];
extern const u8 sMainDeck_85_Bg2[];
extern const u8 sMainDeck_85_Bg1[];
extern const u8 sMainDeck_85_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)];
extern const u8 sMainDeck_86_Clipdata[];
extern const u8 sMainDeck_86_Bg2[];
extern const u8 sMainDeck_86_Bg1[];
extern const u8 sMainDeck_86_SpriteData0[ROOM_SPRITE_DATA_COUNT(3)];
extern const u8 sMainDeck_86_Bg0[];
extern const u8 sMainDeck_82_Bg3[];
extern const u8 sMainDeck_63_Bg3[];
extern const u8 sMainDeck_63_Bg0[];
extern const u8 sMainDeck_1_Bg3[];
extern const u8 sMainDeck_6_Bg3[];
extern const u8 sMainDeck_59_Bg3[];
extern const u8 sMainDeck_49_Bg3[];
extern const u8 sMainDeck_19_Bg3[];
extern const u8 sMainDeck_10_Bg3[];
extern const u8 sMainDeck_86_Bg3[];
extern const u8 sMainDeck_79_Bg3[];
extern const u8 sMainDeck_62_Bg3[];
extern const u8 sMainDeck_78_Bg3[];
extern const u8 sMainDeck_80_Bg3[];
extern const u8 sMainDeck_23_Bg3[];
extern const u8 sMainDeck_23_Bg0[];
extern const u8 sMainDeck_71_Bg3[];
extern const u8 sMainDeck_71_Bg0[];
extern const u8 sMainDeck_46_Bg3[];
extern const u8 sMainDeck_38_Bg3[];
extern const u8 sMainDeck_48_Bg3[];
extern const u8 sMainDeck_14_Bg0[];
extern const u8 sMainDeck_18_Bg3[];
extern const u8 sMainDeck_20_Bg0[];
extern const u8 sMainDeck_15_Bg3[];
extern const u8 sMainDeck_69_Bg3[];
extern const u8 sMainDeck_13_Bg3[];
extern const u8 sMainDeck_7_Bg3[];

#endif /* MAIN_DECK_ROOMS_DATA_H */
