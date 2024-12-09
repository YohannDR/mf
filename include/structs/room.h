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
