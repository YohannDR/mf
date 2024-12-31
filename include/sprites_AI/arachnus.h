#ifndef ARACHNUS_AI_H
#define ARACHNUS_AI_H

#include "constants/sprite.h"

#define SS_ARACHNUS_HIT_BY_NORMAL_BEAM SS_SAMUS_DETECTED
#define SS_ARACHNUS_HIT_BY_NORMAL_BEAM_ATTACK_TYPE SS_SAMUS_COLLIDING // 0 = shooting fire, 1 = rolling

#define ARACHNUS_POSE_WALKING_INIT 1
#define ARACHNUS_POSE_WALKING 2
#define ARACHNUS_POSE_IDLE_INIT 7
#define ARACHNUS_POSE_IDLE 8
#define ARACHNUS_POSE_TURNING_INIT 3
#define ARACHNUS_POSE_TURNING 4
#define ARACHNUS_POSE_SLASHING 0x38
#define ARACHNUS_POSE_ROLLING 0x3a
#define ARACHNUS_POSE_BONKING 0x3c
#define ARACHNUS_POSE_SCREAMING 0x3e
#define ARACHNUS_POSE_SHOOTING_FIRE 0x40
#define ARACHNUS_POSE_DYING 0x42

#define ARACHNUS_FIRE_POSE_FIREBALL 2
#define ARACHNUS_FIRE_POSE_FIRE_TRAIL_1 0x18
#define ARACHNUS_FIRE_POSE_FIRE_TRAIL_2 0x1a
#define ARACHNUS_FIRE_POSE_FIRE_TRAIL_3 0x1c
#define ARACHNUS_FIRE_POSE_FIRE_TRAIL_4 0x2a
#define ARACHNUS_FIRE_POSE_FIRE_TRAIL_DYING 0x2c

#define ARACHNUS_SLASH_POSE_MOVING 2

#define ARACHNUS_PROJECTILE_POSE_ARACHNUS_DYING 0x38

#define ARACHNUS_ATTACK_TIMER gCurrentSprite.work1
#define ARACHNUS_SHELL_SLOT gCurrentSprite.work2
#define ARACHNUS_ROLLING_SPEED_INDEX gCurrentSprite.work3
#define ARACHNUS_FALLING_SPEED_INDEX gCurrentSprite.work4

#define ARACHNUS_PROJECTILE_TIMER gCurrentSprite.work1
#define ARACHNUS_SLASH_TRAIL_SLOT gCurrentSprite.work2

void Arachnus(void);
void ArachnusShell(void);
void ArachnusHead(void);
void ArachnusArm1(void);
void ArachnusArm2(void);
void ArachnusFire(void);
void ArachnusSlash(void);
void ArachnusSlashTrail(void);

#endif /* ARACHNUS_AI_H */
