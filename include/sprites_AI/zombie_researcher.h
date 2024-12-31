#ifndef ZOMBIE_RESEARCHER_AI_H
#define ZOMBIE_RESEARCHER_AI_H

#include "types.h"

#define ZOMBIE_POSE_MOVING_INIT 1
#define ZOMBIE_POSE_MOVING 2
#define ZOMBIE_POSE_IDLE_INIT 7
#define ZOMBIE_POSE_IDLE 8
#define ZOMBIE_POSE_TURNING_INIT 3
#define ZOMBIE_POSE_TURNING 4
#define ZOMBIE_POSE_TURNING_END 5
#define ZOMBIE_POSE_WAITING_TO_FORM 0x18
#define ZOMBIE_POSE_FORMING 0x1a
#define ZOMBIE_POSE_LUNGING_INIT 0x2a
#define ZOMBIE_POSE_LUNGING 0x2c
#define ZOMBIE_POSE_CHECK_LUNGING_ANIM_ENDED 0x2e

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
