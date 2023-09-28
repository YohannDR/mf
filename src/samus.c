#include "samus.h"
#include "macros.h"
#include "globals.h"
#include "gba.h"

#include "constants/samus.h"

#include "data/samus_data.h"

#include "structs/samus.h"
#include "structs/sa_x.h"

/**
 * @brief 4d60 | 68 | Copies samus data
 * 
 */
void SamusCopyData(void)
{
    gSamusDataCopy = gSamusData;

    if (gSamusData.turning)
    {
        gSamusData.direction = gSamusData.direction ^ (KEY_RIGHT | KEY_LEFT);
        gSamusData.turning = 0;
    }

    gSamusData.forcedMovement = 0;
    gSamusData.walljumpTimer = 0;
    gSamusData.speedboostingCounter = 0;
    gSamusData.armCannonDirection = 0;
    gSamusData.armRunningFlag = 0;
    gSamusData.counter = 0;
    gSamusData.lastWallTouchedMidAir = 0;
    gSamusData.xVelocity = 0;
    gSamusData.yVelocity = 0;
    
    gSamusData.animationDurationCounter = 0;
    gSamusData.currentAnimationFrame = 0;

    gSamusAnimationInfo.loadingSave = FALSE;
    gSamusAnimationInfo.paletteAnimationCounter = 0;
    gSamusAnimationInfo.currentPaletteRow = 0;
    gSamusAnimationInfo.spaceJumpSpinCounter = 0;
}

/**
 * @brief 4dc8 | 5c | Checks if samus is on a slope and changes the velocity according to it
 * 
 * @return s16 New velocity
 */
s16 SamusChangeVelocityOnSlope(void)
{
    s16 xVelocity = gSamusData.xVelocity;
    
    if (gSamusData.direction & gSamusData.slopeType)
    {
        if (gSamusData.slopeType & SLOPE_STEEP)
            xVelocity = xVelocity * 3 / 5;
        else
            xVelocity = xVelocity * 4 / 5;
    }
    else
    {
        if (xVelocity > 0xA0)
            xVelocity = 0xA0;
        else if (xVelocity < -0xA0)
            xVelocity = -0xA0;
    }
    
    return xVelocity;
}

/**
 * @brief 4e24 | 44 | Sets the palette pointed by src as the new suit palette
 * 
 * @param src    The memory address where the new suit palette is stored
 * @param offset Offset of src where the palette begins
 * @param length Length of the palette
 * @param isSaX  Flag that indicates whether the destination address is for SA-X or Samus
 */
void SamusSetPalette(const u16* src, s32 offset, s32 length, u32 isSaX)
{
    const u16 *source = src;

    s32 i;
    for (i = offset; i < offset + length; i++)
    {
        if (!isSaX)
            gSamusPalette[i] = *source++;
        else
            gSaXPalette[i] = *source++;
    }
}

void SamusUpdatePhysics(void)
{

}

void SamusUpdateCollisionData(void)
{

}

/**
 * @brief 50a4 | 44 | Calls SamusUpdateEnvironmentsEffects and SamusUpdateGraphics
 * 
 */
void SamusCallUpdateGraphics(void)
{
    struct SamusData* pData;
    u8 direction;
        
    SamusUpdateEnvironmentEffects();
    
    pData = &gSamusData;

    // Get direction
    if (pData->direction & KEY_RIGHT)
        direction = FALSE;
    else
        direction = TRUE;
    
    // Update Samus graphics
    sSamusUpdateGraphicsPointer[gSamusData.unk_0](direction);

    if (pData->standingStatus == STANDING_MID_AIR)
        pData->slopeType = SLOPE_NONE;

}

void SamusCallCheckPlayLowHealthSound(void)
{

}

void SamusCheckUpdateArmCannonOffset(void)
{

}

void SamusBombBounce(u8 forcedMovement)
{

}

void SamusCheckSetNewEnvironmentEffect(u32 offset, u32 request)
{

}

void SamusUpdateEnvironmentEffect(void)
{

}

void SamusAimCannonStanding(void)
{

}

void SamusAimCannonMidAir(void)
{

}

void SamusAimCannonRunning(void)
{

}

void SamusAimCannonHorizontalLadder(void)
{

}

u8 SamusCheckShooting(void)
{

}

void SamusCheckNewProjectile(void)
{

}

u32 SamusCheckStandingOnDropThroughClipdata(void)
{

}

u32 SamusSetForcedMovementForJumpingOrDropping(void)
{

}

void SamusUpdateHighlightedWeaponsAndCharge(void)
{

}

void SamusSetSpinningPose(void)
{

}

void SamusApplyXAcceleration(s16 acceleration, s16 maxVelocity)
{

}

u32 SamusHazardDamage(void)
{

}

u32 SamusUpdate(void)
{

}

u8 SamusInactivity(void)
{

}

u8 SamusStanding(void)
{

}

u8 SamusStandingGfx(void)
{

}

u8 SamusTurningAround(void)
{

}

u8 SamusTurningAroundGfx(void)
{

}

u8 SamusShootingGfx(void)
{

}

u8 SamusRunning(void)
{

}

u8 SamusRunningGfx(void)
{

}

u8 SamusMidAir(void)
{

}

u8 SamusMidAirGfx(void)
{

}

u8 SamusTurningAroundMidAir(void)
{

}

u8 SamusTurningAroundMidAirGfx(void)
{

}

u8 SamusLandingGfx(void)
{

}

u8 SamusCrouching(void)
{

}

u8 SamusTurningAroundAndCrouching(void)
{

}

u8 SamusTurningAroundAndCrouchingGfx(void)
{

}

u8 SamusShootingAndCrouching(void)
{

}

u8 SamusShootingAndCrouchingGfx(void)
{

}

u8 SamusStartingASpinJumpGfx(void)
{

}

u8 SamusSpinning(void)
{

}

u8 SamusSpinningGfx(void)
{

}

u8 SamusMorphing(void)
{

}

u8 SamusMorphingGfx(void)
{

}

u8 SamusMorphBall(void)
{

}

u8 SamusMorphBallGfx(void)
{

}

u8 SamusRolling(void)
{

}

u8 SamusUnmorphing(void)
{

}

u8 SamusUnmorphingGfx(void)
{

}

u8 SamusMorphBallMidAir(void)
{

}

u8 SamusGettingHurtGfx(void)
{

}

u8 SamusGettingKnockedBackGfx(void)
{

}

u8 SamusStartingWallJumpGfx(void)
{

}

u8 SamusWallJumping(void)
{

}

u8 SamusUsingAnElevator(void)
{

}

u8 SamusUsingAnElevatorGfx(void)
{

}

u8 SamusHangingOnLedge(void)
{

}

u8 SamusHangingOnLedgeGfx(void)
{

}

u8 SamusPullingYourselfUpFromHanging(void)
{

}

u8 SamusPullingYourselfUpFromHangingGfx(void)
{

}

u8 SamusPullingYourselfForwardFromHanging(void)
{

}

u8 SamusPullingYourselfForwardFromHangingGfx(void)
{

}

u8 SamusPullingYourselfIntoMorphballTunnel(void)
{

}

u8 SamusPullingYourselfIntoMorphballTunnelGfx(void)
{

}

u8 SamusPullingYourselfDownToStartHanging_Unused(void)
{

}

u8 SamusPullingYourselfDownToStartHanging_UnusedGfx(void)
{

}

u8 SamusSpaceJumpingGfx(void)
{

}

u8 SamusScrewAttackingGfx(void)
{

}

/**
 * @brief 7fcc | 80 | Samus skidding pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusSkidding(void)
{
    // Check jump
    if (gChangedInput & KEY_A)
    {
        gSamusData.forcedMovement = FORCED_MOVEMENT_MID_AIR_JUMP;
        return SPOSE_MID_AIR_REQUEST;
    }

    // Check run
    if (gButtonInput & gSamusData.direction)
        return SPOSE_RUNNING;

    if ((gButtonInput & KEY_ALL_DIRECTIONS) == KEY_DOWN)
    {
        // Holding down, store speedbooster
        gSamusAnimationInfo.shinesparkTimer = 60 * 3;
        return SPOSE_CROUCHING;
    }

    // Slowly reduce velocity towards 0, set standing if reached 0
    if (gSamusData.direction & KEY_RIGHT)
    {
        gSamusData.xVelocity -= SKIDDING_VELOCITY_LOSS;

        if (gSamusData.xVelocity <= 0)
            return SPOSE_STANDING;
    }
    else
    {
        gSamusData.xVelocity += SKIDDING_VELOCITY_LOSS;

        if (gSamusData.xVelocity >= 0)
            return SPOSE_STANDING;
    }

    return SPOSE_NONE;
}

u8 SamusOnSavePadGfx(void)
{

}

u8 SamusTurningAroundToRechargeOrUnlockSecurityGfx(void)
{

}

u8 SamusDelayBeforeShinesparkingGfx(void)
{

}

/**
 * @brief 8148 | 50 | Samus shinesparking pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusShinesparking(void)
{
    if (gSamusData.forcedMovement == FORCED_MOVEMENT_UPWARDS_SHINESPARK)
    {
        // Check still moving upwards
        if (gSamusData.yVelocity == 0)
        {
            ScreenShakeStartVertical(30, 1);
            return SPOSE_DELAY_AFTER_SHINESPARKING;
        }
    }
    else if (gSamusData.forcedMovement == FORCED_MOVEMENT_SIDEWARDS_SHINESPARK)
    {
        // Check still moving sideways
        if (gSamusData.xVelocity == 0)
        {
            ScreenShakeStartHorizontal(30, 1);
            return SPOSE_DELAY_AFTER_SHINESPARKING;
        }
    }
    else
    {
        // Check still moving diagonally
        if (gSamusData.xVelocity == 0 || gSamusData.yVelocity == 0)
        {
            ScreenShakeStartHorizontal(30, 1);
            return SPOSE_DELAY_AFTER_SHINESPARKING;
        }
    }

    return SPOSE_NONE;
}

u8 SamusShinesparkingGfx(void)
{

}

u8 SamusDelayAfterShinesparkingGfx(void)
{

}

u8 SamusHangingFromVerticalLadder(void)
{

}

u8 SamusHangingFromVerticalLadderGfx(void)
{

}

/**
 * @brief 8478 | 38 | Samus starting to hold your arm cannon out on a vertical ladder pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusStartingToHoldYourArmCannonOutOnAVerticalLadder(void)
{
    if (gChangedInput & KEY_A)
    {
        if (gButtonInput & gSamusData.direction)
        {
            // Jumping off of ladder
            return SPOSE_STARTING_WALL_JUMP;
        }

        // Set dropping ladder
        return SPOSE_MID_AIR_REQUEST;
    }

    return SPOSE_NONE;
}

u8 SamusStartingToHoldYourArmCannonOutOnAVerticalLadderGfx(void)
{

}

/**
 * @brief 8504 | 88 | Samus holding your arm cannon out on a vertical ladder pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusHoldingYourArmCannonOutOnAVerticalLadder(void)
{
    // Aim cannon
    SamusAimCannonMidAir();

    // Check shooting
    if (gSamusData.shooting)
        return SPOSE_SHOOTING_ON_VERTICAL_LADDER;

    // Check release
    if (gChangedInput & KEY_A)
    {
        if (gButtonInput & gSamusData.direction)
        {
            // Jumping off of ladder
            return SPOSE_STARTING_WALL_JUMP;
        }

        // Set dropping ladder
        return SPOSE_MID_AIR_REQUEST;
    }

    if (!(gButtonInput & gButtonAssignments.diagonalAim))
    {
        // Check holding opposite direction
        if (OPPOSITE_DIRECTION(gSamusData.direction) & gButtonInput)
            return SPOSE_STARTING_TO_PUT_AWAY_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER;

        // Check start to move down/up
        if (gButtonInput & (KEY_UP | KEY_DOWN))
        {
            if (gSamusData.counter++ > 9)
                return SPOSE_STARTING_TO_PUT_AWAY_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER;
        }
    }

    return SPOSE_NONE;
}

u8 SamusShootingOnVerticalLadderGfx(void)
{

}

/**
 * @brief 85e0 | 38 | Samus starting to put away your arm cannon on vertical ladder pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusStartingToPutAwayYourArmCannonOnVerticalLadder(void)
{
    if (gChangedInput & KEY_A)
    {
        if (gButtonInput & gSamusData.direction)
        {
            // Jumping off of ladder
            return SPOSE_STARTING_WALL_JUMP;
        }

        // Set dropping ladder
        return SPOSE_MID_AIR_REQUEST;
    }

    return SPOSE_NONE;
}

u8 SamusStartingToPutAwayYourArmCannonOnVerticalLadderGfx(void)
{

}

u8 SamusHangingOnHorizontalLadder(void)
{

}

/**
 * @brief 8718 | 9c | Samus moving on horizontal ladder pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusMovingOnHorizontalLadder(void)
{
    s16 velocity;

    // Check release
    if (gChangedInput & KEY_A)
        return SPOSE_MID_AIR_REQUEST;

    // Check turning
    if (gButtonInput & OPPOSITE_DIRECTION(gSamusData.direction))
        return SPOSE_TURNING_AROUND_ON_HORIZONTAL_LADDER;

    if (gSamusData.shooting)
    {
        // Aim cannon only if shooting
        SamusAimCannonHorizontalLadder();
        return SPOSE_SHOOTING_ON_HORIZONTAL_LADDER;
    }

    // Compute velocity
    velocity = SUB_PIXEL_TO_VELOCITY(0);
    if (gButtonInput & gSamusData.direction)
    {
        if (gSamusData.direction & KEY_RIGHT)
            velocity = HORIZONTAL_LADDER_X_VELOCITY;
        else if (gSamusData.direction & KEY_LEFT)
            velocity = -HORIZONTAL_LADDER_X_VELOCITY;
    }
    else
    {
        gSamusData.animationDurationCounter *= 2;
    }

    // Half velocity if slowed
    if (gSamusPhysics.slowed)
        velocity = DIV_SHIFT(velocity, 2);

    gSamusData.xVelocity = velocity;

    return SPOSE_NONE;
}

u8 SamusMovingOnHorizontalLadderGfx(void)
{

}

/**
 * @brief 8830 | 34 | Samus turning around on horizontal ladder pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusTurningAroundOnHorizontalLadder(void)
{
    if (gSamusData.shooting)
    {
        // Aim cannon only if shooting
        SamusAimCannonHorizontalLadder();
        return SPOSE_SHOOTING_ON_HORIZONTAL_LADDER;
    }

    // Check release
    if (gChangedInput & KEY_A)
        return SPOSE_MID_AIR_REQUEST;

    return SPOSE_NONE;
}

u8 SamusTurningAroundOnHorizontalLadderGfx(void)
{

}

/**
 * @brief 88d4 | 78 | Samus delay after shooting on horizontal ladder pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusDelayAfterShootingOnHorizontalLadder(void)
{
    // Aim cannon
    SamusAimCannonHorizontalLadder();

    // Check shooting
    if (gSamusData.shooting)
        return SPOSE_SHOOTING_ON_HORIZONTAL_LADDER;

    // Check release
    if (gChangedInput & KEY_A)
        return SPOSE_MID_AIR_REQUEST;

    // Check turning
    if (gButtonInput & OPPOSITE_DIRECTION(gSamusData.direction))
        return SPOSE_TURNING_AROUND_ON_HORIZONTAL_LADDER;

    // Check go back to idle
    if (!(gButtonInput & gButtonAssignments.diagonalAim) && gButtonInput & (KEY_RIGHT | KEY_LEFT))
    {
        if (gSamusData.counter++ > 9)
            return SPOSE_HANGING_ON_HORIZONTAL_LADDER;
    }

    return SPOSE_NONE;
}

u8 SamusShootingOnHorizontalLadderGfx(void)
{

}

/**
 * @brief 89a0 | 20 | Samus frozen pose gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SamusFrozenGfx(void)
{
    if (gSamusData.counter >= 80)
    {
        // Unfreeze
        return SPOSE_STANDING;
    }

    // Increment counter
    gSamusData.counter++;
    return SPOSE_NONE;
}

/**
 * @brief 89c0 | 20 | Samus frozen in morph ball pose gfx subroutine
 * 
 * @return u8 New pose
 */
u8 SamusFrozenInMorphBallGfx(void)
{
    if (gSamusData.counter >= 80)
    {
        // Unfreeze
        return SPOSE_MORPH_BALL;
    }

    // Increment counter
    gSamusData.counter++;
    return SPOSE_NONE;
}

u8 SamusUnlockingSecurityGfx(void)
{

}

u8 SamusSavingGfx(void)
{

}

u8 SavingOnNavigationPadGfx(void)
{

}

u8 SamusDownloadingAbilityGfx(void)
{

}

u8 SamusBeingRechargedGfx(void)
{

}

/**
 * @brief 8b78 | 50 | Samus facing the foreground pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusFacingForeground(void)
{
    // Last wall touched mid air is used as a timer to temporarily prevent turning around
    if (gSamusData.lastWallTouchedMidAir != 0)
    {
        // Lock animation on first frame
        gSamusData.currentAnimationFrame = 0;
        gSamusData.animationDurationCounter = 0;

        // Decrement timer
        gSamusData.lastWallTouchedMidAir--;
    }
    else
    {
        if (gSamusData.currentAnimationFrame < 3 && gButtonInput & (KEY_RIGHT | KEY_LEFT))
        {
            // Set direction
            gSamusData.direction = gButtonInput & (KEY_RIGHT | KEY_LEFT);

            // Set end of facing foreground animation
            gSamusData.currentAnimationFrame = 3;
            gSamusData.animationDurationCounter = 0;
        }
    }

    return SPOSE_NONE;
}

u8 SamusFacingForegroundGfx(void)
{

}

u8 SamusUnlockingHabitationsDeckGfx(void)
{

}

/**
 * @brief 8c78 | 18 | Samus loading save pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusLoadingSave(void)
{
    if (!gSamusAnimationInfo.loadingSave)
        gSamusAnimationInfo.loadingSave++;

    return SPOSE_NONE;
}

u8 SamusLoadingSaveGfx(void)
{

}

u8 SamusDying(void)
{

}

u8 SamusDyingGfx(void)
{

}

/**
 * @brief 8eb0 | 68 | Samus hit by omega metroid pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusHitByOmagaMetroid(void)
{
    if (gEquipment.suitMiscStatus & SMF_SA_X_SUIT || gEquipment.currentEnergy >= 99)
    {
        // Second counter, doesn't decrement
        gSamusData.lastWallTouchedMidAir += gSamusData.counter;

        // Increment second counter
        if (gSamusData.lastWallTouchedMidAir++ >= 180)
        {
            // Release samus
            gPoseLock = FALSE;
            return SPOSE_STANDING;
        }

        // Check wiggling
        if (gChangedInput & KEY_UP)
        {
            gSamusData.counter += 10;
        }
        else
        {
            // Not doing anything, decrement counter
            if (gSamusData.counter != 0)
                gSamusData.counter--;
        }
    }

    return SPOSE_NONE;
}

u8 SamusHitByOmegaMetroidGfx(void)
{

}

/**
 * @brief 8f5c | 44 | Samus grabbed by yakuza pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusGrabbedByYakuza(void)
{
    if (gSamusData.counter > 128)
    {
        // Release samus
        gSamusData.invincibilityTimer = 48;
        return SPOSE_MID_AIR;
    }

    // Check wiggling
    if (gChangedInput & (KEY_RIGHT | KEY_LEFT))
    {
        // Increment counter
        gSamusData.counter += 11;

        // Set direction
        gSamusData.direction = gChangedInput & (KEY_RIGHT | KEY_LEFT);
    }
    else
    {
        // Not doing anything, decrement counter
        if (gSamusData.counter != 0)
            gSamusData.counter--;
    }

    return SPOSE_NONE;
}

/**
 * @brief 8fa0 | e0 | Sets the current samus pose
 * 
 * @param pose Pose
 */
void SamusSetPose(u8 pose)
{
    // Check cancel turn around
    if (pose == SPOSE_KNOCKBACK_REQUEST || pose == SPOSE_HURT_REQUEST)
        gSamusData.turning = FALSE;

    // Copy current samus data
    SamusCopyData();

    // Check stop speedbooster/shinespark sounds
    switch (gSamusDataCopy.pose)
    {
        case SPOSE_RUNNING:
            if (gSamusDataCopy.speedboostingCounter == 0 && gSamusDataCopy.counter > 80)
                SoundStop(0x6A);
            break;

        case SPOSE_DELAY_BEFORE_SHINESPARKING:
            if (pose != SPOSE_SHINESPARKING)
                SoundStop(0x99);
            break;

        case SPOSE_SHINESPARKING:
            SoundStop(0x99);
            break;

        case SPOSE_PULLING_YOURSELF_DOWN_TO_START_HANGING:
            gDisableScrolling = FALSE;
            break;
    }

    // Apply new pose, either a sub frame pose (request) or any other pose
    switch (pose)
    {
        case SPOSE_MID_AIR_REQUEST:
            SamusSetMidAirPose();
            break;

        case SPOSE_LANDING_REQUEST:
            SamusSetLandingPose();
            break;

        case SPOSE_FROZEN_REQUEST:
            SamusSetFreezedPose();
            break;

        case SPOSE_HURT_REQUEST:
            SamusSetHurtPose();
            break;

        case SPOSE_KNOCKBACK_REQUEST:
            SamusSetKnockbackPose();
            break;

        case SPOSE_F8:
            unk_99a0();
            break;

        case SPOSE_F7:
            unk_99d8();
            break;

        case SPOSE_FC:
        default:
            // Set pose and check carry
            gSamusData.pose = pose;
            SamusCheckCarryFromCopy();
    }
}

void SamusSetMidAirPose(void)
{

}

void SamusSetLandingPose(void)
{

}

/**
 * @brief 9714 | 7c | Sets the frozen pose for Samus
 * 
 */
void SamusSetFreezedPose(void)
{
    switch (gSamusDataCopy.pose)
    {
        case SPOSE_MORPHING:
        case SPOSE_MORPH_BALL:
        case SPOSE_ROLLING:
        case SPOSE_MORPH_BALL_MID_AIR:
        case SPOSE_GETTING_HURT_IN_MORPH_BALL:
        case SPOSE_GETTING_KNOCKED_BACK_IN_MORPH_BALL:
        case SPOSE_PULLING_YOURSELF_INTO_MORPH_BALL_TUNNEL:
            // Any morph ball pose
            gSamusData.pose = SPOSE_FROZEN_IN_MORPH_BALL;
            break;

        default:
            // Any other pose
            gSamusData.pose = SPOSE_FROZEN;
    }
}

void SamusSetHurtPose(void)
{

}

/**
 * @brief 98e0 | c0 | Sets the knockback pose for Samus
 * 
 */
void SamusSetKnockbackPose(void)
{
    // Set correct pose
    switch (gSamusDataCopy.pose)
    {
        case SPOSE_MORPHING:
        case SPOSE_MORPH_BALL:
        case SPOSE_ROLLING:
        case SPOSE_MORPH_BALL_MID_AIR:
        case SPOSE_GETTING_HURT_IN_MORPH_BALL:
        case SPOSE_PULLING_YOURSELF_INTO_MORPH_BALL_TUNNEL:
            // Any morph ball pose
            gSamusData.pose = SPOSE_GETTING_KNOCKED_BACK_IN_MORPH_BALL;
            break;

        case SPOSE_GETTING_KNOCKED_BACK_IN_MORPH_BALL:
            break;

        default:
            // Any other pose
            gSamusData.pose = SPOSE_GETTING_KNOCKED_BACK;
            gSamusData.currentAnimationFrame = 5;
    }

    // Set Y velocity
    gSamusData.yVelocity = KNOCKBACK_Y_VELOCITY;

    if (gSamusDataCopy.standingStatus == STANDING_MID_AIR)
    {
        // Half the velocity if the hit was taken mid air
        gSamusData.yVelocity = KNOCKBACK_Y_VELOCITY / 2;
    }

    gSamusData.armCannonDirection = gSamusDataCopy.armCannonDirection;

    // Set X velocity
    if (gSamusDataCopy.direction & KEY_RIGHT)
        gSamusData.xVelocity = -KNOCKBACK_X_VELOCITY;
    else
        gSamusData.xVelocity = KNOCKBACK_X_VELOCITY;

    // Cancel any new projectile
    gSamusData.newProjectile = 0;
}

void unk_99a0(void)
{

}

void unk_99d8(void)
{

}

void SamusCheckCarryFromCopy(void)
{

}

void SamusUpdateVelocityPosition(void)
{

}

void SamusCheckScrewSpeedboosterAffectingEnvironment(void)
{

}

void SamusCheckCollisions(void)
{

}

u8 SamusCheckCollisionAtPosition(u16 xPosition, u16 yPosition, u16* pNextY, u16* pNextX, u16* param_5)
{

}

u8 unk_a670(u8 collisionType, u16* pNextX, s16 hitbox)
{

}

u8 unk_a7b8(u8 param_1, s16 hitbox, u8 param_3)
{

}

u8 unk_a8fc(u8 collisionType, u16 yPosition, u16* param_3)
{

}

u8 SamusCheckWalkingSidesCollision(void)
{

}

u8 SamusCheckStandingOnGroundCollision(void)
{

}

u8 SamusCheckLandingCollision(void)
{

}

u8 SamusCheckJumpingCollision(void)
{

}

u8 unk_b3c8(void)
{

}

void SamusUpdateGraphics(u8 facingLeft)
{

}

/**
 * @brief c134 | 40 | Checks if the low health sound should play
 * 
 */
void SamusCheckPlayLowHealthSound(void)
{
    if (!gEquipment.lowHealth)
        return;

    // Don't play sound if dying
    if (gSamusData.pose == SPOSE_DYING)
        return;

    // Don't play sound if can't move
    if (gPreventMovementTimer != 0)
        return;

    // Play every 16 frames
    if (MOD_AND(gFrameCounter8Bit, 16) == 0)
        SoundPlay(0x8D);
}

void SamusUpdateDrawDistanceAndStandingStatus(void)
{

}

void SamusUpdateArmCannonOffset(u8 facingLeft)
{

}

void SamusInit(void)
{

}

void SamusDraw(void)
{

}
