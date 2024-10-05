#ifndef ZOMBIE_RESEARCHER_AI_H
#define ZOMBIE_RESEARCHER_AI_H

#include "types.h"

void ZombieCheckSamusInRange(void);
void ZombieSetWaitingToForm(void);
void ZombieSetStandingHitbox(void);
void ZombieDyingInit(void);
void ZombieDying(void);
void ZombieInit(void);
void ZombieWaitingToForm(void);
void ZombieForming(void);
void ZombieIdleInit(void);
void ZombieIdle(void);
void ZombieMovingInit(void);
void ZombieMoving(void);
void ZombieTurningInit(void);
void ZombieTurning(void);
void ZombieTurningEnd(void);
void ZombieLungingInit(void);
void ZombieLunging(void);
void ZombieCheckLungingAnimEnded(void);
void ZombieFallingInit(void);
void ZombieFalling(void);
void Zombie(void);

#endif /* ZOMBIE_RESEARCHER_AI_H */
