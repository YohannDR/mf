#ifndef HORNHOAD_AI_H
#define HORNHOAD_AI_H

#include "types.h"

u8 HornoadCheckSamusInSpittingRange(void);
u8 HornoadCheckSamusInJumpingRange(void);
void HornoadSetSideHitboxes(void);
void HornoadInit(void);
void HornoadIdleInit(void);
void HornoadJumpingInit(void);
void HornoadLandingInit(void);
void HornoadIdleAnimationInit(void);
void HornoadFallingInit(void);
void unk_1ccec(void);
void HornoadTurningAroundInit(void);
void HornoadSpittingInit(void);
void HornoadIdle(void);
void HornoadJumping(void);
void HornoadLanding(void);
void HornoadFalling(void);
void HornoadIdleAnimation(void);
void HornoadWaitingForX(void);
void HornoadTurningAround(void);
void HornoadTurningAroundSecondPart(void);
void HornoadSpitting(void);

void HornoadSpitInit(void);
void HornoadSpitMoving(void);
void HornoadSpitExplodingInit(void);
void HornoadSpitExploding(void);

void HornoadSpwanerInit(void);
void HornoadSpwanerIdleInit(void);
void HornoadSpwanerIdle(void);
void HornoadSpwanerDelayBeforeSpawning(void);
void HornoadSpwanerSpawnHornoad(void);

void Hornoad(void);
void HornoadSpit(void);
void HornoadSpawner(void);

#endif /* HORNHOAD_AI_H */
