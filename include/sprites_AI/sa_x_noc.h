#ifndef SA_X_NOC_AI_H
#define SA_X_NOC_AI_H

#include "types.h"

void SaXNocCheckCollisionWalking(void);
void SaXNocCheckCollisionRunning(void);
void SaXNocCheckCollisionWalkingToLayPowerBomb(void);
void SaXNocInit(void);
void SaXNocWaitingInDoorDuringChase(void);
void SaXNocOpeningDoorDuringChase(void);
void SaXNocWaitingInDoorToLayPowerBomb(void);
void SaXNocWalkingToLayPowerBomb(void);
void SaXNocIdleBeforeLayingPowerBombInit(void);
void SaXNocIdleBeforeLayingPowerBomb(void);
void SaXNocMorphingToLayPowerBombInit(void);
void SaXNocMorphingToLayPowerBomb(void);
void SaXNocLayingPowerBombInit(void);
void SaXNocLayingPowerBomb(void);
void SaXNocWalking(void);
void SaXNocRunning(void);
void SaXNocTurningAroundChase(void);
void SaXNoc(void);

#endif /* SA_X_NOC_AI_H */
