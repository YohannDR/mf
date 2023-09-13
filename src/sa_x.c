#include "sa_x.h"
#include "globals.h"

#include "data/sprites/sa_x.h"

#include "constants/samus.h"

/**
 * @brief cbb8 | 64 | SA-X running gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXRunningGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_Running_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (gSaXData.screenFlag != SA_X_SCREEN_FLAG_NOT_PRESENT && (gSaXData.currentAnimationFrame == 4 || gSaXData.currentAnimationFrame == 9))
        SoundPlay(0x259);

    if (sSaXAnim_Running_Left[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame = 0;

    return SA_X_POSE_NONE;
}

/**
 * @brief cc1c | 60 | SA-X walking gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXWalkingGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_Walking_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (gSaXData.screenFlag != SA_X_SCREEN_FLAG_NOT_PRESENT && (gSaXData.currentAnimationFrame == 1 || gSaXData.currentAnimationFrame == 6))
        SoundPlay(0x258);

    if (sSaXAnim_Walking_Left[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame = 0;

    return SA_X_POSE_NONE;
}

/**
 * @brief cc7c | 44 | SA-X standing gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXStandingGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_Standing_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_Standing_Left[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame = 0;

    return SA_X_POSE_NONE;
}

/**
 * @brief ccc0 | 48 | SA-X shooting gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXShootingGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_Shooting_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_Shooting_Left[gSaXData.currentAnimationFrame].timer != 0)
        return SA_X_POSE_NONE;

    return SA_X_POSE_STANDING;
}

/**
 * @brief cd08 | 48 | SA-X turning gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXTurningGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_Turning_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_Turning_Left[gSaXData.currentAnimationFrame].timer != 0)
        return SA_X_POSE_NONE;

    return SA_X_POSE_STANDING;
}

/**
 * @brief cd50 | 4c | SA-X mid air gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXMidAirGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_MidAir_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_MidAir_Left[gSaXData.currentAnimationFrame].timer == 0)
    {
        gSaXData.currentAnimationFrame = 0;
        SoundPlay(0x25B);
    }

    return SA_X_POSE_NONE;
}

/**
 * @brief cd9c | 48 | SA-X landing gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXLandingGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_Landing_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_Landing_Left[gSaXData.currentAnimationFrame].timer != 0)
        return SA_X_POSE_NONE;

    return SA_X_POSE_STANDING;
}

/**
 * @brief cde4 | 44 | SA-X shooting restricted laboratory gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXShootingRestrictedLaboratoryGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_ShootingRestrictedLaboratory[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_ShootingRestrictedLaboratory[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame = 0;

    return SA_X_POSE_NONE;
}

/**
 * @brief ce28 | 44 | SA-X covered by metroids gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXCoveredByMetroidsGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_CoveredByMetroids[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_CoveredByMetroids[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame = 0;

    return SA_X_POSE_NONE;
}

/**
 * @brief ce6c | 50 | SA-X kneeling gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXKneelingGfx(void)
{
    if (gSaXData.animationDurationCounter == 1 && gSaXData.currentAnimationFrame == 0)
        SooundPlay(0x9D);

    if (gSaXData.animationDurationCounter < sSaXAnim_Kneeling_Right[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_Kneeling_Right[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame = 0;

    return SA_X_POSE_NONE;
}

/**
 * @brief cebc | 44 | SA-X transforming into monster gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXTransformingIntoMonsterGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_TransformingIntoMonster_Right[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_TransformingIntoMonster_Right[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame--;

    return SA_X_POSE_NONE;
}

/**
 * @brief cf00 | 50 | SA-X morphing gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXMorphingGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_Morphing_Right[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_Morphing_Right[gSaXData.currentAnimationFrame].timer != 0)
        return SA_X_POSE_NONE;

    SoundPlay(0x25F);
    return SA_X_POSE_MORPH_BALL;
}

/**
 * @brief cf50 | 50 | SA-X unmorphing gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXUnmorphingGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_Unmorphing_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_Unmorphing_Left[gSaXData.currentAnimationFrame].timer != 0)
        return SA_X_POSE_NONE;

    return SA_X_POSE_STANDING;
}

/**
 * @brief cf98 | 44 | SA-X morph ball gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXMorphBallGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_MorphBall_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_MorphBall_Left[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame = 0;

    return SA_X_POSE_NONE;
}

/**
 * @brief cfdc | 44 | SA-X swag walk gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXSwagWalkGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_SwagWalk_Left[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_SwagWalk_Left[gSaXData.currentAnimationFrame].timer == 0)
        gSaXData.currentAnimationFrame = 0;

    return SA_X_POSE_NONE;
}

/**
 * @brief d020 | 5d | SA-X turning towards camera gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXTurningTowardsCameraGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_TurningTowardsCamera[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_TurningTowardsCamera[gSaXData.currentAnimationFrame].timer != 0)
        return SA_X_POSE_NONE;

    gPauseScreenFlag = 0x6;
    gSubGameMode1 = 0x3;
    return SA_X_POSE_TURNING_AWAY_FROM_CAMERA;
}

/**
 * @brief d07c | 48 | SA-X turning away from camera gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SaXTurningAwayFromCameraGfx(void)
{
    if (gSaXData.animationDurationCounter < sSaXAnim_TurningAwayFromCamera[gSaXData.currentAnimationFrame].timer)
        return SA_X_POSE_NONE;

    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame++;

    if (sSaXAnim_TurningAwayFromCamera[gSaXData.currentAnimationFrame].timer != 0)
        return SA_X_POSE_NONE;

    return SA_X_POSE_STANDING;
}

/**
 * @brief d0c4 | ac | Sets the SA-X pose
 * 
 * @param pose Pose
 */
void SaXSetPose(u8 pose)
{
    if (gSaXData.turning)
    {
        gSaXData.direction ^= (KEY_RIGHT | KEY_LEFT);
        gSaXData.turning = FALSE;
    }

    gSaXData.xVelocity = 0;
    gSaXData.yVelocity = 0;
    gSaXData.animationDurationCounter = 0;
    gSaXData.currentAnimationFrame = 0;

    switch (pose)
    {
        case SA_X_POSE_TURNING:
            gSaXData.turning = TRUE;
            break;

        case SA_X_POSE_MID_AIR:
            SoundPlay(0x25B);
            gSaXData.diagonalAim = DIAG_AIM_NONE;
            break;

        case SA_X_POSE_LANDING:
            SoundPlay(0x25A);
            gSaXData.diagonalAim = DIAG_AIM_NONE;
            break;

        case SA_X_POSE_TRANSFORMING_INTO_MONSTER:
            unk_3b1c(0x9E);
            gSaXData.diagonalAim = DIAG_AIM_NONE;
            break;

        case SA_X_POSE_STANDING:
        case SA_X_POSE_SHOOTING:
            break;

        default:
            gSaXData.diagonalAim = DIAG_AIM_NONE;
    }

    gSaXData.pose = pose;
}

void SaXSetPosition(void)
{

}

void SaXUpdateGraphicsAndDraw(void)
{

}

void SaXUpdateElevatorSprites(u8 spriteSlot)
{

}

u8 unk_d638(void)
{

}

u8 unk_d694(void)
{

}

u8 SaXElevatorBeforeBlowingUpWall(void)
{

}

u8 SaXElevatorBlowingUpWall(void)
{

}

u8 SaXElevatorWalkingBeforeTurningToCamera(void)
{

}

u8 SaXElevatorBeforeJumping(void)
{

}

u8 SaXElevatorBeforeShootingDoor(void)
{

}

u8 SaXElevatorWalkingOut(void)
{

}
