#ifndef SERRIS_AI_H
#define SERRIS_AI_H

#include "types.h"

#define SERRIS_POSE_ZIG_ZAG_PATTERN_INIT 0x2
#define SERRIS_POSE_WAITING_TO_EMERGE 0x8
#define SERRIS_POSE_END_PATTERN 0x16
#define SERRIS_POSE_LOOP_AROUND_PATTERN_INIT 0x18
#define SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT 0x1A
#define SERRIS_POSE_EDGE_ARC_PATTERN_INIT 0x1C
#define SERRIS_POSE_ZIG_ZAG_PATTERN 0x38
#define SERRIS_POSE_LOOP_AROUND_PATTERN 0x3A
#define SERRIS_POSE_MIDDLE_ARC_PATTERN 0x3C
#define SERRIS_POSE_EDGE_ARC_PATTERN 0x3E
#define SERRIS_POSE_DYING_INIT 0x47
#define SERRIS_POSE_DYING 0x48
#define SERRIS_POSE_TURNING_INTO_X_INIT 0x49
#define SERRIS_POSE_TURNING_INTO_X 0x4A
#define SERRIS_POSE_FIRST_ARC_ENDED 0x51
#define SERRIS_POSE_FIRST_ARC_DONE 0x52
#define SERRIS_POSE_FIRST_ARC_INIT 0x53
#define SERRIS_POSE_FIRST_ARC 0x54
#define SERRIS_POSE_WAITING_TO_APPEAR_INIT 0x55
#define SERRIS_POSE_WAITING_TO_APPEAR 0x56

#define SERRIS_PART_POSE_FALLING 0x4A

#define SERRIS_BLOCK_POSE_CRUMBLING 24
#define SERRIS_BLOCK_POSE_FALLING 26

enum SerrisPart {
    SERRIS_PART_HEAD_JOINT,
    SERRIS_PART_SECTION_1,
    SERRIS_PART_SECTION_2,
    SERRIS_PART_SECTION_3,
    SERRIS_PART_SECTION_4,
    SERRIS_PART_SECTION_5,
    SERRIS_PART_SECTION_6,
    SERRIS_PART_MIDDLE_END,
    SERRIS_PART_TAIL_JOINT,
    SERRIS_PART_TAIL,

    SERRIS_PART_END
};


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

#endif /* SERRIS_AI_H */
