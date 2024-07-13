#ifndef MISSILE_HATCH_H
#define MISSILE_HATCH_H

#include "types.h"

void MissileHatchSetCollision(u8 caa);
void MissileHatchInit(void);
void MissileHatchIdle(void);
void MissileHatchExploding(void);
void MissileHatchDebrisInit(void);
void MissileHatchDebrisFalling(void);
void MissileHatch(void);
void MissileHatchDebris(void);

#endif /* MISSILE_HATCH_H */
