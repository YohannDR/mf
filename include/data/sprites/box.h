#ifndef BOX_DATA_H
#define BOX_DATA_H

#include "types.h"
#include "oam.h"

#include "structs/sprite.h"

enum BoxOam {
    BOX_OAM_PART_FRONT_LEFT_LEG_COVER_UNDAMAGED,
    FRAMEDATA_3479B8,
    BOX_OAM_PART_FRONT_LEFT_LEG_COVER_DAMAGED,
    FRAMEDATA_347A00,
    FRAMEDATA_347A10,
    BOX_OAM_PART_FRONT_LEFT_LEG_0,
    BOX_OAM_PART_FRONT_LEFT_LEG_1,
    BOX_OAM_PART_FRONT_LEFT_LEG_2,
    FRAMEDATA_347A50,
    FRAMEDATA_347A60,
    FRAMEDATA_347A70,
    FRAMEDATA_347A80,
    FRAMEDATA_347A90,
    BOX_OAM_PART_FRONT_RIGHT_LEG_COVER_UNDAMAGED,
    FRAMEDATA_347AB0,
    FRAMEDATA_347AE8,
    FRAMEDATA_347AF8,
    FRAMEDATA_347B08,
    FRAMEDATA_347B18,
    FRAMEDATA_347B28,
    FRAMEDATA_347B38,
    FRAMEDATA_347B48,
    FRAMEDATA_347B58,
    FRAMEDATA_347B68,
    FRAMEDATA_347B78,
    FRAMEDATA_347B88,
    BOX_OAM_PART_CENTER_UNDAMAGED,
    FRAMEDATA_347BA8,
    FRAMEDATA_347BB8,
    FRAMEDATA_347BC8,
    BOX_OAM_PART_BRAIN,
    FRAMEDATA_347C38,
    FRAMEDATA_347C70,
    FRAMEDATA_347C98,
    FRAMEDATA_347CA8,
    FRAMEDATA_347CD8,
    FRAMEDATA_347CF8,
    FRAMEDATA_347D18,
    FRAMEDATA_347D28,
    FRAMEDATA_347D38,
    FRAMEDATA_347D48,
    FRAMEDATA_347D58,
    FRAMEDATA_347D68,
    FRAMEDATA_347D88,
    FRAMEDATA_347E58,
    FRAMEDATA_347E80,
    FRAMEDATA_347FA8,
    FRAMEDATA_347FB8,
    FRAMEDATA_347FC8,
    FRAMEDATA_347FD8,
    FRAMEDATA_347FE8,
    FRAMEDATA_347FF8,
    FRAMEDATA_348008,
    FRAMEDATA_348018,
    FRAMEDATA_348028,
    FRAMEDATA_348038,
    FRAMEDATA_348048,
    FRAMEDATA_3480A8,

    BOX_OAM_END
};

enum BoxPart {
    BOX_PART_FRONT_LEFT_LEG_COVER,
    BOX_PART_FRONT_LEFT_LEG,
    BOX_PART_FRONT_RIGHT_LEG_COVER,
    BOX_PART_FRONT_RIGHT_LEG,
    BOX_PART_MIDDLE_LEFT_LEG,
    BOX_PART_MIDDLE_RIGHT_LEG,
    BOX_PART_CENTER,
    BOX_PART_BRAIN,
    BOX_PART_CENTER_BOTTOM,
    BOX_PART_LAUNCHER,
    BOX_PART_BACK_LEFT_LEG,
    BOX_PART_BACK_RIGHT_LEG,

    BOX_PART_END
};

extern const s16 sBoxFirstJumpSpeed[24];
extern const s16 sBoxJumpingSpeed[20];
extern const s16 sBoxBonkingSpeed[20];
extern const s16 sBoxBombSecondBounceSpeed[5];
extern const s16 sBoxBombFirstBounceSpeed[6];
extern const s16 sBoxBombLaunchingSpeed[11];
extern const s16 sBoxBombFallingSpeed[16];

extern const struct MultiSpriteData sBoxMultiSpriteData_Jumping[2];
extern const struct MultiSpriteData sBoxMultiSpriteData_Landing[4];
extern const struct MultiSpriteData sBoxMultiSpriteData_JumpWarning[5];
extern const struct MultiSpriteData sBoxMultiSpriteData_Defeated[5];
extern const struct MultiSpriteData sBoxMultiSpriteData_Crawling_Left[6];
extern const struct MultiSpriteData sBoxMultiSpriteData_SlowRun_Left[6];
extern const struct MultiSpriteData sBoxMultiSpriteData_FastRun_Left[6];
extern const struct MultiSpriteData sBoxMultiSpriteData_Crawling_Right[6];
extern const struct MultiSpriteData sBoxMultiSpriteData_SlowRun_Right[6];
extern const struct MultiSpriteData sBoxMultiSpriteData_FastRun_Right[6];
extern const struct MultiSpriteData sBoxMultiSpriteData_FinishedCrawling[5];
extern const struct MultiSpriteData sBoxMultiSpriteData_WaitingToRun[9];
extern const struct MultiSpriteData sBoxMultiSpriteData_Skidding_Left[2];
extern const struct MultiSpriteData sBoxMultiSpriteData_StopSkidding_Left[2];
extern const struct MultiSpriteData sBoxMultiSpriteData_Skidding_Right[2];
extern const struct MultiSpriteData sBoxMultiSpriteData_StopSkidding_Right[2];
extern const struct MultiSpriteData sBoxMultiSpriteData_LoweringToFireBomb[8];
extern const struct MultiSpriteData sBoxMultiSpriteData_FiringBomb[4];
extern const struct MultiSpriteData sBoxMultiSpriteData_DoneFiringBomb[9];

extern const u32 sBoxGfx[512 * 8];
extern const u16 sBoxPal[16 * 8];

extern const struct FrameData sBoxPartOam_FrontLeftLegCoverUndamaged[2];
extern const struct FrameData sBoxPartOam_FrontLeftLegCoverShaking[7];
extern const struct FrameData sBoxPartOam_FrontLeftLegCoverSlightlyDamaged[2];
extern const struct FrameData sBoxPartOam_FrontLeftLegCoverModeratelyDamaged[2];
extern const struct FrameData sBoxPartOam_FrontLeftLegCoverHeavilyDamaged[2];
extern const struct FrameData sBoxPartOam_FrontLeftLeg_0[2];
extern const struct FrameData sBoxPartOam_FrontLeftLeg_1[2];
extern const struct FrameData sBoxPartOam_FrontLeftLeg_2[2];
extern const struct FrameData sBoxPartOam_MiddleLeftLeg_0[2];
extern const struct FrameData sBoxPartOam_MiddleLeftLeg_1[2];
extern const struct FrameData sBoxPartOam_MiddleLeftLeg_2[2];
extern const struct FrameData sBoxPartOam_BackLeftLeg_0[2];
extern const struct FrameData sBoxPartOam_BackLeftLeg_1[2];
extern const struct FrameData sBoxPartOam_FrontRightLegCoverUndamaged[2];
extern const struct FrameData sBoxPartOam_FrontRightLegCoverShaking[7];
extern const struct FrameData sBoxPartOam_FrontRightLegCoverSlightlyDamaged[2];
extern const struct FrameData sBoxPartOam_FrontRightLegCoverModeratelyDamaged[2];
extern const struct FrameData sBoxPartOam_FrontRightLegCoverHeavilyDamaged[2];
extern const struct FrameData sBoxPartOam_FrontRightLeg_0[2];
extern const struct FrameData sBoxPartOam_FrontRightLeg_1[2];
extern const struct FrameData sBoxPartOam_FrontRightLeg_2[2];
extern const struct FrameData sBoxPartOam_MiddleRightLeg_0[2];
extern const struct FrameData sBoxPartOam_MiddleRightLeg_1[2];
extern const struct FrameData sBoxPartOam_MiddleRightLeg_2[2];
extern const struct FrameData sBoxPartOam_BackRightLeg_0[2];
extern const struct FrameData sBoxPartOam_BackRightLeg_1[2];
extern const struct FrameData sBoxPartOam_CenterUndamaged[2];
extern const struct FrameData sBoxPartOam_CenterSlightlyDamaged[2];
extern const struct FrameData sBoxPartOam_CenterModeratelyDamaged[2];
extern const struct FrameData sBoxPartOam_CenterHeavilyDamaged[2];
extern const struct FrameData sBoxPartOam_BrainIdle[12];
extern const struct FrameData sBoxPartOam_BrainShaking[7];
extern const struct FrameData sBoxPartOam_BrainFlashingFaster[5];
extern const struct FrameData sBoxPartOam_CenterBottomIdle[2];
extern const struct FrameData sBoxPartOam_CenterBottomOpeningAndClosingRapidly[6];
extern const struct FrameData sBoxJetsOam_Small[4];
extern const struct FrameData sBoxJetsOam_Big[4];
extern const struct FrameData sBoxPartOam_LauncherIdle[2];
extern const struct FrameData sBoxPartOam_LauncherOpening_0[2];
extern const struct FrameData sBoxPartOam_LauncherOpening_1[2];
extern const struct FrameData sBoxPartOam_LauncherOpening_2[2];
extern const struct FrameData sBoxPartOam_LauncherOpening_3[2];
extern const struct FrameData sBoxMissileOam[4];
extern const struct FrameData sBoxBombOam_MovingUnused[26];
extern const struct FrameData sBoxBombOam_Detonating[5];
extern const struct FrameData sBoxFireOam_MovingHigh[37];
extern const struct FrameData sBoxDebrisOam[2];
extern const struct FrameData sBoxFallingDebrisOam_0[2];
extern const struct FrameData sBoxFallingDebrisOam_1[2];
extern const struct FrameData sBoxFallingDebrisOam_2[2];
extern const struct FrameData sBoxFallingDebrisOam_3[2];
extern const struct FrameData sBoxFallingDebrisOam_4[2];
extern const struct FrameData sBoxFallingDebrisOam_5[2];
extern const struct FrameData sBoxFallingDebrisOam_6[2];
extern const struct FrameData sBoxFallingDebrisOam_7[2];
extern const struct FrameData sBoxFallingDebrisOam_8[2];
extern const struct FrameData sBoxPartOam_BrainAndCenterBottom_Idle[12];
extern const struct FrameData sBoxFireOam_MovingLow[4];

#endif /* BOX_DATA_H */
