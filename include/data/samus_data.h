#ifndef SAMUS_DATA_H
#define SAMUS_DATA_H

#include "types.h"
#include "constants/samus.h"
#include "structs/samus.h"

#define SAMUS_SET_POSE(pose) (sSamusSetPoseFunctionPointer[gSamusData.unk_0](pose))

extern const u8 sSamusCollisionData[SPOSE_END][6];

typedef void (*SamusSetPose_T)(u8);

extern const SamusSetPose_T sSamusSetPoseFunctionPointer[1];

#endif /* SAMUS_DATA_H */
