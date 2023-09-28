#ifndef GADORA_AI_H
#define GADORA_AI_H

#include "types.h"

#define GADORA_POSE_OPENING_EYE_INIT 23
#define GADORA_POSE_OPENING_EYE 24
#define GADORA_POSE_VULNERABLE 26
#define GADORA_POSE_SHOOTING 28
#define GADORA_POSE_CLOSING_EYE 32

void GadoraSetCollision(u8 caa);
void GadoraSetDirectionAndPosition(u8 caa);
void GadoraDeath(void);
void GadoraInit(void);
void GadoraIdleInit(void);
void GadoraIdle(void);
void GadoraOpeningEyeInit(void);
void GadoraOpeningEye(void);
void GadoraVulnerable(void);
void GadoraShooting(void);
void GadoraClosingEye(void);
void Gadora(void);
void GadoraEye(void);
void GadoraRoots(void);
void GadoraBeam(void);
void Gadora_UnusedSprite(void);

#endif /* GADORA_AI_H */
