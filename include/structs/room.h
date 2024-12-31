#ifndef ROOM_STRUCTS_H
#define ROOM_STRUCTS_H

#include "types.h"
#include "oam.h"

#define ROOM_SPRITE_DATA_COUNT(count) (count * 3 + 3)

#define ROOM_SPRITE_DATA_COUNT(count) (count * 3 + 3)
#define ROOM_SPRITESET_IDX(idx) (idx + 1)
#define ROOM_SPRITE_DATA_TERMINATOR UCHAR_MAX, UCHAR_MAX, UCHAR_MAX

struct RoomEntry {
    u8 tilesetNumber;
    u8 bg0Prop;
    u8 bg1Prop;
    u8 bg2Prop;
    u8 bg3Prop;
    u8 scrollsFlag;
    u8 bg3Scroll;
    u8 transparency;
    const u8* pEnemyRoomData;
    u8 firstSpritesetEvent;
    u8 secondSpritesetEvent;
    u8 mapX;
    u8 mapY;
    u8 visualEffect;
    u16 effectY;
    u8 damagingEffect;
    u16 musicTrack;
    u8 bg0Size;
    u8 bg3Size;
    u8 animatedTileset;
    u8 animatedPalette;
};

struct RoomEntryROM {
    u8 tileset;
    u8 Bg0Prop;
    u8 Bg1Prop;
    u8 Bg2Prop;
    u8 Bg3Prop;
    const u8* pBg0Data;
    const u8* pBg1Data;
    const u8* pBg2Data;
    const u8* pClipData;
    const u8* pBg3Data;
    u8 Bg3Scrolling;
    u8 transparency;
    const u8* pDefaultSpriteData;
    u8 defaultSpriteset;
    u8 firstSpritesetEvent;
    const u8* pFirstSpriteData;
    u8 firstSpriteset;
    u8 secondSpritesetEvent;
    const u8* pSecondSpriteData;
    u8 secondSpriteset;
    u8 mapX;
    u8 mapY;
    u8 effect;
    u8 effectY;
    u16 musicTrack;
};

struct TilesetEntry {
    const u32* pTileGraphics;
    const u16* pPalette;
    const u32* pBackgroundGraphics;
    const u8* pTilemap;
    u8 animatedTileset;
    u8 animatedPalette;
};

extern struct RoomEntry gCurrentRoomEntry;

#endif /* ROOM_STRUCTS_H */
