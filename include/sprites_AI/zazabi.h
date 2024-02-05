#ifndef ZAZABI_AI_H
#define ZAZABI_AI_H

#include "types.h"

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
void ZazabiPartEye(void);
void Zazabi(void);
void ZazabiPart(void);

#endif /* ZAZABI_AI_H */
