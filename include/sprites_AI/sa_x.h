#ifndef SA_X_AI_H
#define SA_X_AI_H

#include "types.h"

#define SA_X_MISSILE_SPEED (HALF_BLOCK_SIZE - PIXEL_SIZE)
#define SA_X_MISSILE_DIAGONAL_SPEED ((u16)(SA_X_MISSILE_SPEED * .75f))

void SaXSetDirection(void);
void SaXSeeAndLocateSamus(void);
u8 unk_15dd4(void);
u8 unk_15e88(void);
u8 unk_15f54(void);
void unk_1605c(void);
void SaXInit(void);
void SaXElevatorInit(void);
void SaXFallingInit(void);
void SaXFalling(void);
void SaXStandingInit(void);
void SaXStanding(void);
void SaXWalkingInit(void);
void SaXWalking(void);
void SaXTurningAroundInit(void);
void SaXTurningAround(void);
void SaXTurningAroundChaseInit(void);
void SaXTurningAroundChase(void);
void SaXRunningInit(void);
void SaXRunning(void);
void SaXMidAirInit(void);
void SaXMidAir(void);
void SaXDelayBeforeShootingBeamInit(void);
void SaXDelayBeforeShootingBeam(void);
void SaXShootingBeamInit(void);
void SaXShootingBeam(void);
void SaXDelayBeforeShootingMissileInit(void);
void SaXDelayBeforeShootingMissile(void);
void SaXShootingMissileInit(void);
void SaXShootingMissile(void);
void SaXIdleAfterShootingMissileInit(void);
void SaXIdleAfterShootingMissile(void);
void SaXMorphingInit(void);
void SaXMorphing(void);
void SaXRollingInit(void);
void SaXRolling(void);
void SaXUnmorphingInit(void);
void SaXUnmorphing(void);
void SaXIdleBeforeShootingDoorInit(void);
void SaXIdleBeforeShootingDoor(void);
void SaXShootingDoorInit(void);
void SaXShootingDoor(void);
void SaXIdleAfterShootingDoorInit(void);
void SaXIdleAfterShootingDoor(void);
void SaXWalkingToDoorInit(void);
void SaXWalkingToDoor(void);
void SaXBeamInit(void);
void SaXBeamMove(void);
void SaXMissileInit(void);
void SaXMissileExploding(void);
void SaXMissileMoving(void);
void SaXPowerBombInit(void);
void SaXPowerBombSpinningSlowly(void);
void SaXPowerBombSpinningQuickly(void);
void SaXPowerBombExploding(void);
void LabExplosionInit(void);
void LabExplosionExploding(void);
void SaXUpdateGraphics(void);
u8 SaXUpdateFreezeTimer(void);
void SaXElevator(void);
void SaXBeam(void);
void SaXMissile(void);
void SaXPowerBomb(void);
void LabExplosion(void);

#endif /* SA_X_AI_H */
