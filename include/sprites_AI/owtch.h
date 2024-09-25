#ifndef OWTCH_H
#define OWTCH_H

#include "types.h"

#define OWTCH_POSE_TURNING_AROUND_INIT 3
#define OWTCH_POSE_TURNING_AROUND 4
#define OWTCH_POSE_LANDING_INIT 7
#define OWTCH_POSE_LANDING 8

u8 OwtchCheckCollidingWithAir(void);
void OwtchUpdateHitbox(void);
void OwtchSetCrawlingOam(void);
void OwtchSetFallingOam(void);
void OwtchTurningIntoX(void);
void OwtchInit(void);
void OwtchIdleInit(void);
void OwtchIdle(void);
void OwtchTurningAroundInit(void);
void OwtchTurningAround(void);
void OwtchLandingInit(void);
void OwtchLanding(void);
void OwtchFallingInit(void);
void OwtchFalling(void);
void Owtch(void);

#endif /* OWTCH_H */
