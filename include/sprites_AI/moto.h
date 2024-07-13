#ifndef MOTO_H
#define MOTO_H

#include "types.h"

void MotoSpawningFromX(void);
void MotoInit(void);
void MotoFallingInit(void);
void MotoIdleInit(void);
void MotoIdle(void);
void MotoHittingWallInit(void);
void MotoHittingWall(void);
void MotoWalkingInit(void);
void MotoWalking(void);
void MotoChargingInit(void);
void MotoCharging(void);
void MotoTurningInit(void);
void MotoTurning(void);
void MotoTurningEnd(void);
void MotoFrontInit(void);
void MotoFrontIdle(void);
void Moto(void);
void MotoFront(void);

#endif /* MOTO_H */
