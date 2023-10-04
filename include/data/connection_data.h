#ifndef CONNECTION_DATA_H
#define CONNECTION_DATA_H

#include "types.h"

#include "constants/clipdata.h"
#include "constants/connection.h"

#include "structs/connection.h"
#include "structs/clipdata.h"

extern const u8 sAreaConnections[36][3];
extern const struct ElevatorRoomPair sElevatorRoomPairs[ELEVATOR_END];
extern const struct ElevatorPairEvent sElevatorRideEvents[4];
extern const u8 sEventBasedConnections[60][4];

extern const struct Door* sAreaDoorPointers[AREA_END];

#endif /* CONNECTION_DATA_H */
