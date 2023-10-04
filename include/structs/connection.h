#ifndef CONNECTION_STRUCTS_H
#define CONNECTION_STRUCTS_H

#include "types.h"

struct Hatch {
    u8 unk_0_0:1;
    u8 unk_0_1:3;
    u8 unk_0_4:1;
    u8 unk_0_5:3;
    u8 unk_1_0:2;
    u8 unk_1_2:1;
    u8 unk_1_3:5;
    u8 xPosition;
    u8 yPosition;
};

struct Door {
    u8 type;
    u8 srcRoom;
    u8 xStart;
    u8 xEnd;
    u8 yStart;
    u8 yEnd;
    u8 dstDoor;
    s8 xExit;
    s8 yExit;
};

struct EventBasedConnection {
    u8 area;
    u8 sourceDoor;
    u8 event;
    u8 destinationDoor;
};

extern struct Hatch gHatchData[6];
extern u8 gCurrentArea;
extern u8 gPreviousArea;
extern u8 gDestinationDoor;
extern u8 gCurrentRoom;
extern u8 gLastDoorUsed;
extern u8 gCurrentNavigationRoom;

extern struct RawCoordsX gDoorPositionStart;

#endif /* CONNECTION_STRUCTS_H */
