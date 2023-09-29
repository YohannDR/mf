#ifndef CLIPDATA_H
#define CLIPDATA_H

#include "types.h"

#include "structs/clipdata.h"

u16 unk_689f0(void);
void ClipdataSetupCode(void);
u32 ClipdataProcessForSamus(u16 yPosition, u16 xPosition);
u32 ClipdataProcess(u16 yPosition, u16 xPosition);
u32 ClipdataConvertToCollision(struct CollisionData* pCollision);
u32 ClipdataCheckCurrentAffectingAtPosition(u16 yPosition, u16 xPosition);
u32 ClipdataCheckCantUseElevator(u16 movementClip);
u32 ClipdataGetGroundEffect(u16 yPosition, u16 xPosition);

#endif /* CLIPDATA_H */
