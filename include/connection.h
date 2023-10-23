#ifndef CONNECTION_H
#define CONNECTION_H

#include "types.h"

u32 ConnectionCheckEnterDoor(u16 yPosition, u16 xPosition);
u32 ConnectionCheckAreaConnection(u16 yPosition, u16 xPosition);
void ConnectionProcessDoorType(u8 type);
u32 ConnectionFindEventBasedDoor(u8 srcDoor);

#endif /* CONNECTION_H */
