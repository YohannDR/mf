#ifndef ZAZABI_AI_H
#define ZAZABI_AI_H

#include "types.h"

#define ZAZABI_POSE_CRAWLING_INIT 0x1
#define ZAZABI_POSE_CRAWLING 0x2
#define ZAZABI_POSE_IDLE_INIT 0x7
#define ZAZABI_POSE_IDLE 0x8
#define ZAZABI_POSE_JUMP_WARNING_INIT 0x17
#define ZAZABI_POSE_JUMP_WARNING 0x18
#define ZAZABI_POSE_JUMPING_INIT 0x19
#define ZAZABI_POSE_JUMPING 0x1A
#define ZAZABI_POSE_FALLING_INIT 0x1B
#define ZAZABI_POSE_FALLING 0x1C
#define ZAZABI_POSE_LANDING_MOUTH_OPEN_INIT 0x1D
#define ZAZABI_POSE_LANDING_MOUTH_OPEN 0x1E
#define ZAZABI_POSE_LANDING_INIT 0x1F
#define ZAZABI_POSE_LANDING 0x20
#define ZAZABI_POSE_EATING_SAMUS_1_INIT 0x37
#define ZAZABI_POSE_EATING_SAMUS_1 0x38
#define ZAZABI_POSE_EATING_SAMUS_2_INIT 0x39
#define ZAZABI_POSE_EATING_SAMUS_2 0x3A
#define ZAZABI_POSE_EATING_SAMUS_3_INIT 0x3B
#define ZAZABI_POSE_EATING_SAMUS_3 0x3C
#define ZAZABI_POSE_EATING_SAMUS_4_INIT 0x3D
#define ZAZABI_POSE_EATING_SAMUS_4 0x3E
#define ZAZABI_POSE_EATING_SAMUS_5_INIT 0x3F
#define ZAZABI_POSE_EATING_SAMUS_5 0x40
#define ZAZABI_POSE_SPITTING_SAMUS_INIT 0x41
#define ZAZABI_POSE_SPITTING_SAMUS 0x42
#define ZAZABI_POSE_LANDING_AFTER_SPITTING_INIT 0x43
#define ZAZABI_POSE_LANDING_AFTER_SPITTING 0x44
#define ZAZABI_POSE_DYING_INIT 0x45
#define ZAZABI_POSE_DYING 0x46

enum ZazabiPart {
    ZAZABI_PART_0,
    ZAZABI_PART_MOUTH,
    ZAZABI_PART_HAIR,
    ZAZABI_PART_EYE_SHELL,
    ZAZABI_PART_PUPIL,
    ZAZABI_PART_EYE,
    ZAZABI_PART_UPPER_SHELL,
    ZAZABI_PART_MIDDLE_SHELL,
    ZAZABI_PART_LOWER_SHELL,

    ZAZABI_PART_END,
};

void ZazabiSyncSubSprites(void);
void ZazabiProjectilesCollision(void);
void ZazabiEnableProjectilesToPassThrough(void);
void Zazabi_Empty(void);
u8 ZazabiXMovement(u16 movement);
void ZazabiSpawningFromX(void);
void ZazabiInit(void);
void ZazabiIdleInit(void);
void ZazabiIdle(void);
void ZazabiCrawlingInit(void);
void ZazabiCrawling(void);
void ZazabiJumpWarningInit(void);
void ZazabiJumpWarning(void);
void ZazabiJumpingInit(void);
void ZazabiJumping(void);
void ZazabiFallingInit(void);
void ZazabiFalling(void);
void ZazabiLandingMouthOpenInit(void);
void ZazabiLandingMouthOpen(void);
void ZazabiLandingInit(void);
void ZazabiLanding(void);
void ZazabiEatingSamus1Init(void);
void ZazabiEatingSamus1(void);
void ZazabiEatingSamus2Init(void);
void ZazabiEatingSamus2(void);
void ZazabiEatingSamus3Init(void);
void ZazabiEatingSamus3(void);
void ZazabiEatingSamus4Init(void);
void ZazabiEatingSamus4(void);
void ZazabiEatingSamus5Init(void);
void ZazabiEatingSamus5(void);
void ZazabiSpittingSamusInit(void);
void ZazabiSpittingSamus(void);
void ZazabiLandingAfterSpittingInit(void);
void ZazabiLandingAfterSpitting(void);
void ZazabiDyingInit(void);
void ZazabiDying(void);
void ZazabiPartInit(void);
void ZazabiPartDefault(void);
void ZazabiPartMouth(void);
void ZazabiPartPupil(void);
void Zazabi(void);
void ZazabiPart(void);

#endif /* ZAZABI_AI_H */
