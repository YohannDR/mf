#ifndef CLIPDATA_STRUCT_H
#define CLIPDATA_STRUCT_H

#include "types.h"

#include "constants/clipdata.h"

struct CollisionData {
    u32 type;
    s32 subPixelX;
    s32 subPixelY;
    u32 unk_C;
    u16 unk_10;
    u16 unk_12;
    s32 actor;
    u16 tileX;
    u16 tileY;
};

struct BackgroundsData {
    struct {
        u16* pDecomp;
        u16 width;
        u16 height;
    } backgrounds[3];
    u16* pClipDecomp;
    u16 clipdataWidth;
    u16 clipdataHeight;
};

struct TilemapAndClipPointers {
    u16* pTilemap;
    const u8* pClipCollisions;
    const u16* pClipBehaviors;
};

struct ElevatorRoomPair {
    u8 area1;
    u8 room1;
    u8 area2;
    u8 room2;
};

struct ElevatorPairEvent {
    u8 eventStart;
    u8 eventEnd;
    u8 cantUseFlags[ELEVATOR_END];
};

struct CurrentAffectingClipdata {
    u16 movement;
    u16 hazard;
};


typedef u32 (*CollisionFunc_T)(struct CollisionData*);

extern CollisionFunc_T gClipdataCodePointer;
extern struct BackgroundsData gBackgroundsData;
extern struct CurrentAffectingClipdata gCurrentAffectingClipdata;
extern struct TilemapAndClipPointers gTilemapAndClipPointers;
extern u8 gLastElevatorUsed;
extern u8 gElevatorDirection;
extern u8 gCurrentClipdataAffectingAction;
extern u8 gUnk_03004e48[2];

#endif /* CLIPDATA_STRUCT_H */
