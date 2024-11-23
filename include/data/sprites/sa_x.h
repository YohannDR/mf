#ifndef SA_X_DATA
#define SA_X_DATA

#include "types.h"
#include "oam.h"

#include "constants/sa_x.h"
#include "constants/samus.h"

#include "structs/sa_x.h"


extern const struct SaXAnimationData sSaXAnim_Running_Left[11];
extern const struct SaXAnimationData sSaXAnim_Running_Right[11];

extern const struct SaXAnimationData sSaXAnim_SwagWalk_Left[11];
extern const struct SaXAnimationData sSaXAnim_SwagWalk_Right[11];

extern const struct SaXAnimationData sSaXAnim_29ae70[11];
extern const struct SaXAnimationData sSaXAnim_29aef4[11];

extern const struct SaXAnimationData sSaXAnim_Standing_Left[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Left[3];
extern const struct SaXAnimationData sSaXAnim_Standing_Right[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Right[3];

extern const struct SaXAnimationData sSaXAnim_29b020[3];
extern const struct SaXAnimationData sSaXAnim_29b044[3];

extern const struct SaXAnimationData sSaXAnim_Turning_Left[3];
extern const struct SaXAnimationData sSaXAnim_Turning_Right[3];

extern const struct SaXAnimationData sSaXAnim_29b0b0[3];
extern const struct SaXAnimationData sSaXAnim_29b0d4[3];

extern const struct SaXAnimationData sSaXAnim_TurningTowardsCamera[12];

extern const struct SaXAnimationData sSaXAnim_Morphing_Left[3];
extern const struct SaXAnimationData sSaXAnim_Unmorphing_Left[3];
extern const struct SaXAnimationData sSaXAnim_MorphBall_Left[9];

extern const struct SaXAnimationData sSaXAnim_Morphing_Right[3];
extern const struct SaXAnimationData sSaXAnim_Unmorphing_Right[3];
extern const struct SaXAnimationData sSaXAnim_MorphBall_Right[9];

extern const struct SaXAnimationData sSaXAnim_TurningAwayFromCamera[3];

extern const struct SaXAnimationData sSaXAnim_Standing_Left_Armed[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Left_Armed[3];
extern const struct SaXAnimationData sSaXAnim_Standing_Right_Armed[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Right_Armed[3];

extern const struct SaXAnimationData sSaXAnim_Standing_Left_DiagonalUp[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Left_DiagonalUp[3];
extern const struct SaXAnimationData sSaXAnim_Standing_Left_DiagonalDown[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Left_DiagonalDown[3];

extern const struct SaXAnimationData sSaXAnim_Standing_Right_DiagonalUp[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Right_DiagonalUp[3];
extern const struct SaXAnimationData sSaXAnim_Standing_Right_DiagonalDown[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Right_DiagonalDown[3];

extern const struct SaXAnimationData sSaXAnim_Turning_Left_DiagonalUp[3];
extern const struct SaXAnimationData sSaXAnim_Turning_Right_DiagonalUp[3];
extern const struct SaXAnimationData sSaXAnim_Turning_Left_DiagonalDown[3];
extern const struct SaXAnimationData sSaXAnim_Turning_Right_DiagonalDown[3];

extern const struct SaXAnimationData sSaXAnim_Landing_Left[4];
extern const struct SaXAnimationData sSaXAnim_Landing_Right[4];

extern const struct SaXAnimationData sSaXAnim_Falling_Left[2];
extern const struct SaXAnimationData sSaXAnim_GettingHurt_Left[2];
extern const struct SaXAnimationData sSaXAnim_Falling_Right[2];
extern const struct SaXAnimationData sSaXAnim_GettingHurt_Right[2];

extern const struct SaXAnimationData sSaXAnim_Standing_Left_DiagonalUp_Armed[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Left_DiagonalUp_Armed[3];
extern const struct SaXAnimationData sSaXAnim_Standing_Left_DiagonalDown_Armed[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Left_DiagonalDown_Armed[3];

extern const struct SaXAnimationData sSaXAnim_Standing_Right_DiagonalUp_Armed[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Right_DiagonalUp_Armed[3];
extern const struct SaXAnimationData sSaXAnim_Standing_Right_DiagonalDown_Armed[4];
extern const struct SaXAnimationData sSaXAnim_Shooting_Right_DiagonalDown_Armed[3];

extern const struct SaXAnimationData sSaXAnim_MidAir_Left[9];
extern const struct SaXAnimationData sSaXAnim_MidAir_Right[9];

extern const struct SaXAnimationData sSaXAnim_Kneeling_Left[5];
extern const struct SaXAnimationData sSaXAnim_Kneeling_Right[5];

extern const struct SaXAnimationData sSaXAnim_TransformingIntoMonster_Left[35];
extern const struct SaXAnimationData sSaXAnim_TransformingIntoMonster_Right[35];

extern const struct SaXAnimationData sSaXAnim_ShootingRestrictedLaboratory[51];
extern const struct SaXAnimationData sSaXAnim_CoveredByMetroids[23];

extern const struct SaXAnimationData sSaXAnim_Walking_Left[11];
extern const struct SaXAnimationData sSaXAnim_Walking_Right[11];

extern const struct SaXData sSaXData_Empty;

extern const struct SaXAnimationData* const sSaXOamDataPointers[SA_X_POSE_END][2];

extern const struct SaXAnimationData* const sSaXOamDataPointers_Standing_Armed[DIAG_AIM_END][2];
extern const struct SaXAnimationData* const sSaXOamDataPointers_Standing[DIAG_AIM_END][2];

extern const struct SaXAnimationData* const sSaXOamDataPointers_Shooting_Armed[DIAG_AIM_END][2];
extern const struct SaXAnimationData* const sSaXOamDataPointers_Shooting[DIAG_AIM_END][2];

extern const struct SaXAnimationData* const sSaXOamDataPointers_Turning[DIAG_AIM_END][2];

extern const u8 sSaX_2b4154[20];

extern const u16 sSaXPalette_Fading[16 * 16];
extern const u16 sSaXPalette_MidAir[4 * 16];
extern const u16 sSaXPalette_TransformingIntoMonster[1 * 16];

extern const SaXGfxFunc_T sSaXPoseGfxFunctionPointers[SA_X_POSE_END];

extern const u8 sSaXElevatorGraphics_RocksTop[416];
extern const u8 sSaXElevatorGraphics_RocksBottom[416];

extern const struct FrameData sOam_2b47d0[2];
extern const struct FrameData sOam_2b47e0[2];
extern const struct FrameData sOam_2b47f0[2];
extern const struct FrameData sOam_2b4800[2];
extern const struct FrameData sOam_2b4810[2];
extern const struct FrameData sOam_2b4820[2];

extern const u8 sSaXElevatorGraphics_CloudsTop[704];
extern const u8 sSaXElevatorGraphics_CloudsBottom[704];

extern const struct FrameData sOam_2b4e44[2];
extern const struct FrameData sOam_2b4e54[2];

extern const u16 sSaXElevatorRocksAndCloudPal[1 * 16];

extern const struct FrameData* const sSaXElevatorSpritesOamPointers[10];

extern const SaXElevatorFunc_T sSaXElevatorFunctionPointers[1];
extern const SaXElevatorFunc_T sSaXElevatorSubroutinesPointers[6];

extern const struct SaXElevatorSprite sSaXElevatorSpritesBlowingUpWall[MAX_AMOUNT_OF_SA_X_ELEVATOR_SPRITES + 2];
extern const struct SaXElevatorSprite sSaXElevatorSpritesShootingDoor[7];

// ...

extern const s16 sSaXBeamForwardYMovement[4];
extern const s16 sSaXBeamDiagonalYMovement[4];
extern const s16 sSaXBeamDiagonalXMovement[4];

extern const s16 sSaXWalkingSpeed[8];
extern const s16 sSaXRunningSpeed[8];

extern const s16 sSaXJumpYVelocity_0[10];
extern const s16 sSaXJumpYVelocity_1[10];
extern const s16 sSaXJumpYVelocity_2[10];
extern const s16 sSaXJumpYVelocity_3[18];
extern const s16 sSaXJumpYVelocity_4[10];

extern const s16 sSaXBossSpinJumpYVelocity_2[11];
extern const s16 sSaXBossSpinJumpYVelocity_5[18];

extern const s16 sSaXBossJumpYVelocity_1[10];
extern const s16 sSaXBossJumpYVelocity_2[10];
extern const s16 sSaXBossJumpYVelocity_3[10];

extern const s16 sSaX_2e6cc6[6];

extern const s16 sSaXBossKnockbackYMovement[12];

extern const s16 sSaX_2e6cea[28];

extern const u16 sSaXMosaicValues[30];

extern const u32 sSaXWeaponsGfx[2 * 512];
extern const u16 sSaXPalette_Default[2 * 16];

extern const struct FrameData sSaXOam_Placeholder[2];
extern const struct FrameData sSaXBeamOam_Forward[2];
extern const struct FrameData sSaXBeamOam_Diagonal[2];
extern const struct FrameData sSaXBeamOam_Vertical[2];
extern const struct FrameData sSaXMissileOam_Diagonal[3];
extern const struct FrameData sSaXMissileOam_Forward[3];
extern const struct FrameData sSaXPowerBombOam_SpinningSlow[4];
extern const struct FrameData sSaXPowerBombOam_SpinningFast[4];
extern const struct FrameData sSaXMissileOam_Diagonal_XFlipped[3];
extern const struct FrameData sSaXElevatorOam_2e8038[3];
extern const struct FrameData sLabExplosionOam_Idle[49];

extern const u32 sSaXLabExplosionsGfx[2 * 512];
extern const u16 sSaXLabExplosionsPal[2 * 16];

#endif /* SA_X_DATA */
