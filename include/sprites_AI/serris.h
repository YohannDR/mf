#ifndef SERRIS_AI_H
#define SERRIS_AI_H

#include "types.h"

void SerrisUpdatePalette(void);
u8 SerrisGetCurrentSamusPlatform(void);
void SerrisRotateAroundPoint(s16 centerY, s16 centerX, s16 radius, s16 rotation);
void SerrisHandleRotationMovement(void);
void SerrisStartRotationXAligned(u16 centerY, u16 centerX, u16 radius);
void SerrisStartRotationYAligned(u16 centerY, u16 centerX, u16 radius);
void SerrisSetFacingOam(void);
void SerrisInit(void);
void SerrisWaitingToAppearInit(void);
void SerrisWaitingToAppear(void);
void SerrisStartFight(void);
void SerrisFirstArcInit(void);
void SerrisFirstArc(void);
void SerrisFirstArcEnd(void);
void SerrisDyingInit(void);
void SerrisDying(void);
void SerrisTurningIntoXInit(void);
void SerrisTurningIntoX(void);
void SerrisPartInit(void);
void SerrisPartWaitingToAppear(void);
void SerrisPartStartFight(void);
void SerrisZigZagPattern(void);
void SerrisLoopAroundPattern(void);
void SerrisMiddleArcPattern(void);
void SerrisEdgeArcPattern(void);
void SerrisZigZagPatternInit(void);
void SerrisLoopAroundPatternInit(void);
void SerrisMiddleArcPatternInit(void);
void SerrisEdgeArcPatternInit(void);
void SerrisDeterminePattern(void);
void SerrisDetermineSpeedboostingPattern(void);
void SerrisEndPattern(void);
void SerrisWaitingToEmerge(void);
void SerrisPartDyingInit(void);
void SerrisPartDying(void);
void SerrisPartFalling(void);
void SerrisBlockSetCollision(u8 caa);
void SerrisBlockInit(void);
void SerrisBlockIdle(void);
void SerrisBlockCrumbling(void);
void SerrisBlockFalling(void);
void SerrisCheckInWater(void);
void Serris(void);
void SerrisPart(void);
void SerrisBlock(void);

#endif SERRIS_AI_H
