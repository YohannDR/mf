#ifndef OWTCH_H
#define OWTCH_H

#include "types.h"

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
