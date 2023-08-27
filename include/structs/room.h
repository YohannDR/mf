#ifndef ROOM_STRUCTS_H
#define ROOM_STRUCTS_H

#include "types.h"
#include "oam.h"

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
    u16 musicTrakc;
    u8 bg0Size;
    u8 bg3Size;
    u8 animatedTileset;
    u8 animatedPalette;
};

extern struct RoomEntry gCurrentRoomEntry;

#endif /* ROOM_STRUCTS_H */
