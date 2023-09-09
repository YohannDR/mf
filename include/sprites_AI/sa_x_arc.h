#ifndef SA_X_ARC_AI_H
#define SA_X_ARC_AI_H

#include "types.h"

void SaXArcCheckCollisionWalking(void);
void SaXArcCheckCollisionRunning(void);
void SaXArcInit(void);
void SaXArcWaitingInDoorDuringChase(void);
void SaXArcOpeningDoorDuringChase(void);
void SaXArcWaitingInDoor(void);
void SaXArcOpeningDoor(void);
void SaXArcWalking(void);
void SaXArcStoppedAtPillarInit(void);
void SaXArcStoppedAtPillar(void);
void SaXArcIdleAfterHearingWeaponInit(void);
void SaXArcIdleAfterHearingWeapon(void);
void SaXArcTurningAroundAfterHearingWeaponInit(void);
void SaXArcTurningAroundAfterHearingWeapon(void);
void SaXArcRunning(void);
void SaXArcTurningAroundChase(void);
void SaXArcDelayBeforeShootingBeamInit(void);
void SaXArcDelayBeforeShootingBeam(void);
void SaXArcShootingBeamInit(void);
void SaXArcShootingBeam(void);
void SaXArc(void);

#endif /* SA_X_ARC_AI_H */
