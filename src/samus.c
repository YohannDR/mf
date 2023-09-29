#include "samus.h"
#include "macros.h"
#include "globals.h"
#include "gba.h"

#include "data/samus_data.h"

#include "constants/samus.h"

#include "structs/samus.h"

void SamusCopyData(void)
{

}

s16 SamusChangeVelocityOnSlope(void)
{

}

void SamusSetPalette(const u16* src, s32 offset, s32 length, u32 isSax)
{

}

void SamusUpdatePhysics(void)
{

}

void SamusUpdateCollisionData(void)
{

}

void SamusCallUpdateGraphics(void)
{

}

void SamusCallCheckPlayLowHealthSound(void)
{

}

void SamusCheckUpdateArmCannonOffset(void)
{

}

/**
 * @brief 5138 | 7c | Makes Samus bounce on a bomb
 * 
 * @param direction Bounce direction
 */
void SamusBombBounce(u8 direction)
{
    s32 canBounce;

    if (gSamusPhysics.slowed)
        return;

    canBounce = FALSE;

    // Check has a direction
    if (MOD_AND(direction, FORCED_MOVEMENT_BOMB_JUMP_ABOVE) >= FORCED_MOVEMENT_BOMB_JUMP_RIGHT)
    {
        // Check pose
        switch (gSamusData.pose)
        {
            case SPOSE_MORPHING:
            case SPOSE_MORPH_BALL:
            case SPOSE_ROLLING:
            case SPOSE_GRABBED_BY_ZAZABI:
                canBounce++;
                break;

            case SPOSE_MORPH_BALL_MID_AIR:
                // Check when falling
                if (gSamusData.yVelocity <= 0 && !(direction & FORCED_MOVEMENT_BOMB_JUMP_ABOVE))
                    canBounce++;
                break;
        }
    }

    if (canBounce)
    {
        // Make bounce
        gSamusData.forcedMovement = direction & ~FORCED_MOVEMENT_BOMB_JUMP_ABOVE;
        SAMUS_SET_POSE(SPOSE_MID_AIR_REQUEST);
    }
}

void SamusCheckSetNewEnvironmentEffect(u32 offset, u32 request)
{

}

void SamusUpdateEnvironmentEffect(void)
{

}

/**
 * @brief 5a74 | 6c | Aims the arm cannon when samus is standing
 * 
 */
void SamusAimCannonStanding(void)
{
    if (gButtonInput & gButtonAssignments.diagonalAim)
    {
        if (gButtonInput & KEY_DOWN)
        {
            // Aim diagonally down
            gSamusData.armCannonDirection = ACD_DIAGONAL_DOWN;
            gSamusData.diagonalAim = DIAG_AIM_DOWN;
        }
        else if (gSamusData.diagonalAim == DIAG_AIM_NONE || gButtonInput & KEY_UP)
        {
            // Aim diagonally up
            gSamusData.armCannonDirection = ACD_DIAGONAL_UP;
            gSamusData.diagonalAim = DIAG_AIM_UP;
        }

        return;
    }

    gSamusData.diagonalAim = DIAG_AIM_NONE;

    if (gButtonInput & KEY_UP)
    {
        // Aim up
        gSamusData.armCannonDirection = ACD_UP;
    }
    else
    {
        // Aim forward
        gSamusData.armCannonDirection = ACD_FORWARD;
    }
}

/**
 * @brief 5ae0 | b4 | Aims the arm cannon when samus is mid air
 * 
 */
void SamusAimCannonMidAir(void)
{
    if (gButtonInput & gButtonAssignments.diagonalAim)
    {
        if (gButtonInput & KEY_DOWN)
        {
            // Aim diagonally down
            gSamusData.armCannonDirection = ACD_DIAGONAL_DOWN;
            gSamusData.diagonalAim = DIAG_AIM_DOWN;
        }
        else if (gSamusData.diagonalAim == DIAG_AIM_NONE || gButtonInput & KEY_UP)
        {
            // Aim diagonally up
            gSamusData.armCannonDirection = ACD_DIAGONAL_UP;
            gSamusData.diagonalAim = DIAG_AIM_UP;
        }

        return;
    }

    if (gButtonInput & KEY_UP)
    {
        if (gButtonInput & gSamusData.direction)
        {
            // Aim diagonally up
            gSamusData.armCannonDirection = ACD_DIAGONAL_UP;
        }
        else
        {
            // Aim up
            gSamusData.armCannonDirection = ACD_UP;
        }

        gSamusData.diagonalAim = DIAG_AIM_NONE;
        return;
    }

    if (gButtonInput & KEY_DOWN)
    {
        if (gButtonInput & gSamusData.direction)
        {
            // Aim diagonally down
            gSamusData.armCannonDirection = ACD_DIAGONAL_DOWN;
        }
        else
        {
            // Aim down
            gSamusData.armCannonDirection = ACD_DOWN;
        }

        gSamusData.diagonalAim = DIAG_AIM_NONE;
        return;
    }

    if (gSamusData.diagonalAim != DIAG_AIM_NONE || gSamusData.direction & gButtonInput)
    {
        // Aim forward
        gSamusData.armCannonDirection = ACD_FORWARD;
    }

    gSamusData.diagonalAim = DIAG_AIM_NONE;
}

/**
 * @brief 5b94 | 94 | Aims the arm cannon when samus is running
 * 
 */
void SamusAimCannonRunning(void)
{
    if (gButtonInput & gButtonAssignments.diagonalAim)
    {
        if (gButtonInput & KEY_DOWN)
        {
            // Aim diagonally down
            gSamusData.armCannonDirection = ACD_DIAGONAL_DOWN;
            gSamusData.diagonalAim = DIAG_AIM_DOWN;
        }
        else if (gSamusData.diagonalAim == DIAG_AIM_NONE || gButtonInput & KEY_UP)
        {
            // Aim diagonally up
            gSamusData.armCannonDirection = ACD_DIAGONAL_UP;
            gSamusData.diagonalAim = DIAG_AIM_UP;
        }

        gSamusData.armRunningFlag = FALSE;
        return;
    }

    gSamusData.diagonalAim = DIAG_AIM_NONE;

    if (gButtonInput & KEY_UP)
    {
        // Aim diagonally up
        gSamusData.armCannonDirection = ACD_DIAGONAL_UP;
        gSamusData.armRunningFlag = FALSE;
        return;
    }

    if (gButtonInput & KEY_DOWN)
    {
        // Aim diagonally up
        gSamusData.armCannonDirection = ACD_DIAGONAL_DOWN;
        gSamusData.armRunningFlag = FALSE;
        return;
    }

    if (!gSamusData.armRunningFlag)
        gSamusData.armCannonDirection = ACD_FORWARD;
}

/**
 * @brief 5c28 | 5c | Aims the arm cannon when samus is hanging on an horizontal ladder
 * 
 */
void SamusAimCannonHorizontalLadder(void)
{
    if (gButtonInput & gButtonAssignments.diagonalAim)
    {
        // Can only aim diagonally down
        gSamusData.armCannonDirection = ACD_DIAGONAL_DOWN;
        gSamusData.diagonalAim = DIAG_AIM_DOWN;
        return;
    }

    if (gButtonInput & KEY_DOWN)
    {
        // Holding down
        if (gSamusData.direction & gButtonInput)
        {
            // Holding down and the facing direction, so diagonally down
            gSamusData.armCannonDirection = ACD_DIAGONAL_DOWN;
        }
        else
        {
            // Holding only down
            gSamusData.armCannonDirection = ACD_DOWN;
        }
    }
    else
    {
        // Aim forward by default
        gSamusData.armCannonDirection = ACD_FORWARD;
    }

    gSamusData.diagonalAim = DIAG_AIM_NONE;
}

u8 SamusCheckShooting(void)
{

}

/**
 * @brief 5d44 | 1a8 | Checks if samus should have a new projectile
 * 
 */
void SamusCheckNewProjectile(void)
{
    gSamusData.shooting = FALSE;

    switch (gSamusData.pose)
    {
        case SPOSE_STANDING:
        case SPOSE_TURNING_AROUND:
        case SPOSE_SHOOTING:
        case SPOSE_RUNNING:
        case SPOSE_MID_AIR:
        case SPOSE_TURNING_AROUND_MID_AIR:
        case SPOSE_LANDING:
        case SPOSE_CROUCHING:
        case SPOSE_TURNING_AROUND_AND_CROUCHING:
        case SPOSE_SHOOTING_AND_CROUCHING:
        case SPOSE_STARTING_SPIN_JUMP:
        case SPOSE_SPINNING:
        case SPOSE_WALL_JUMPING:
        case SPOSE_SPACE_JUMPING:
        case SPOSE_SCREW_ATTACKING:
        case SPOSE_HANGING_FROM_VERTICAL_LADDER:
        case SPOSE_HOLDING_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER:
        case SPOSE_SHOOTING_ON_VERTICAL_LADDER:
        case SPOSE_HANGING_ON_HORIZONTAL_LADDER:
        case SPOSE_MOVING_ON_HORIZONTAL_LADDER:
        case SPOSE_TURNING_AROUND_ON_HORIZONTAL_LADDER:
        case SPOSE_DELAY_AFTER_SHOOTING_ON_HORIZONTAL_LADDER:
        case SPOSE_SHOOTING_ON_HORIZONTAL_LADDER:
            gSamusData.shooting = SamusCheckShooting();
            break;

        case SPOSE_MORPHING:
        case SPOSE_GETTING_HURT:
        case SPOSE_GETTING_KNOCKED_BACK:
        case SPOSE_STARTING_WALL_JUMP:
        case SPOSE_HANGING_ON_LEDGE:
        case SPOSE_PULLING_YOURSELF_UP_FROM_HANGING:
        case SPOSE_PULLING_YOURSELF_FORWARD_FROM_HANGING:
        case SPOSE_PULLING_YOURSELF_DOWN_TO_START_HANGING:
        case SPOSE_SKIDDING:
        case SPOSE_STARTING_TO_HOLD_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER:
        case SPOSE_STARTING_TO_PUT_AWAY_YOUR_ARM_CANNON_OUT_ON_A_VERTICAL_LADDER:
            if (gButtonInput & KEY_B)
            {
                if (gEquipment.beamStatus & BF_CHARGE_BEAM)
                {
                    if (gSamusData.chargeBeamCounter < 0x4F)
                    {
                        gSamusData.chargeBeamCounter++;
                        break;
                    }
                    else
                    {
                        gSamusData.chargeBeamCounter = 0x40;
                        break;
                    }
                }
            }
            else
            {
                if (gSamusData.chargeBeamCounter >= 0x40)
                    gSamusData.newProjectile = 0x5;
            }

            gSamusData.chargeBeamCounter = 0;
            break;

        case SPOSE_MORPH_BALL:
        case SPOSE_ROLLING:
        case SPOSE_MORPH_BALL_MID_AIR:
        case SPOSE_GRABBED_BY_ZAZABI:
            if (gChangedInput & KEY_B)
            {
                if (gSamusData.cooldownTimer == 0 && gEquipment.weaponsStatus & MBF_BOMBS)
                {
                    if (gSamusData.weaponHighlighted & 0x10)
                        gSamusData.newProjectile = 0x6;
                    else
                        gSamusData.newProjectile = 0x4;
                }
            }

        default:
            gSamusData.chargeBeamCounter = 0;
    }
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

/**
 * @brief 6170 | d0 | Sets the spinnin pose for samus
 * 
 */
void SamusSetSpinningPose(void)
{
    switch (gSamusData.pose)
    {
        case SPOSE_SPINNING:
        case SPOSE_WALL_JUMPING:
            if (gSamusPhysics.slowed)
            {
                // No change needed if slowed
                break;
            }

            if (gEquipment.suitMiscStatus & SMF_SCREW_ATTACK)
            {
                // Set screw attacking
                gSamusData.pose = SPOSE_SCREW_ATTACKING;
                break;
            }

            if (gEquipment.suitMiscStatus & SMF_SPACE_JUMP)
            {
                // Set space jumping
                gSamusData.pose = SPOSE_SPACE_JUMPING;
                break;
            }
            break;

        case SPOSE_SPACE_JUMPING:
            if (gEquipment.suitMiscStatus & SMF_SCREW_ATTACK)
            {
                // Screw attacking takes priority
                gSamusData.pose = SPOSE_SCREW_ATTACKING;
                break;
            }

            if (!(gEquipment.suitMiscStatus & SMF_SPACE_JUMP) || gSamusPhysics.slowed)
            {
                // Set spinning if doesn't have space jump or is slowed
                gSamusData.pose = SPOSE_SPINNING;
                gSamusData.currentAnimationFrame = 0;
            }
            break;

        case SPOSE_SCREW_ATTACKING:
            if (gSamusPhysics.slowed)
            {
                // Set spinning if slowed
                gSamusData.pose = SPOSE_SPINNING;
                gSamusData.currentAnimationFrame = 0;
                break;
            }

            if (gEquipment.suitMiscStatus & SMF_SCREW_ATTACK)
                break;

            // Screw attack was disabled, set new spinning pose
            if (gEquipment.suitMiscStatus & SMF_SPACE_JUMP)
                gSamusData.pose = SPOSE_SPACE_JUMPING;
            else
                gSamusData.pose = SPOSE_SPINNING;

            gSamusData.currentAnimationFrame = 0;
            break;
    }
}

/**
 * @brief 6240 | 50 | Applies an X acceleration to Samus
 * 
 * @param acceleration Acceleration
 * @param maxVelocity Max velocity
 */
void SamusApplyXAcceleration(s16 acceleration, s16 maxVelocity)
{
    if (gSamusData.direction & KEY_RIGHT)
    {
        gSamusData.xVelocity += acceleration;

        if (gSamusData.xVelocity > maxVelocity)
            gSamusData.xVelocity = maxVelocity;
    }
    else
    {
        gSamusData.xVelocity -= acceleration;

        if (gSamusData.xVelocity < -maxVelocity)
            gSamusData.xVelocity = -maxVelocity;
    }
}

u32 SamusHazardDamage(void)
{

}

u32 SamusUpdate(void)
{

}

/**
 * @brief 658c | 4 | Samus inactivity subroutine
 * 
 * @return u8 New pose
 */
u8 SamusInactivity(void)
{
    return SPOSE_NONE;
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

/**
 * @brief 6880 | 108 | Samus running pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusRunning(void)
{
    s16 velocityCap;
    u16 velocity;

    // Check jumping
    if (gChangedInput & KEY_A)
    {
        if (gSamusPhysics.slowed && gSamusData.slopeType & gSamusData.direction)
            gSamusData.yPosition -= PIXEL_SIZE / 2;

        gSamusData.forcedMovement = FORCED_MOVEMENT_MID_AIR_JUMP;
        return SPOSE_MID_AIR_REQUEST;
    }

    velocityCap = gSamusPhysics.xVelocityCap;

    if (gEquipment.suitMiscStatus & SMF_SPEED_BOOSTER && !gSamusPhysics.slowed)
    {
        if (gSamusData.counter >= 140)
            velocityCap = SUB_PIXEL_TO_VELOCITY(QUARTER_BLOCK_SIZE + PIXEL_SIZE);
        else if (gSamusData.counter >= 120)
            velocityCap = 0x8C;

        velocity = gSamusData.xVelocity + 0x3F;

        if (velocity > 0x7E)
        {
            if (gSamusData.counter < 160 && gSamusData.counter++ == 144)
                SoundPlay(0x6A);
        }
        else
        {
            gSamusData.counter = 0;
        }
    }
    else
    {
        gSamusData.counter = 0;
    }

    // Check still running
    if (gButtonInput & gSamusData.direction)
    {
        // Apply acceleration
        SamusApplyXAcceleration(gSamusPhysics.xAcceleration, velocityCap);

        // Aim cannon
        SamusAimCannonRunning();

        return SPOSE_NONE;
    }

    // Not holding the running direction anymore

    // Check was speedboosting to start skidding
    if (gSamusData.speedboostingCounter != 0)
        return SPOSE_SKIDDING;

    // Check shooting
    if (gSamusData.shooting)
        return SPOSE_SHOOTING;

    // Check standing or turning around
    if (!(gButtonInput & OPPOSITE_DIRECTION(gSamusData.direction)))
        return SPOSE_STANDING;

    return SPOSE_TURNING_AROUND;
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

/**
 * @brief 6be4 | 90 | Samus turning around mid air pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusTurningAroundMidAir(void)
{
    if (gChangedInput & KEY_A)
    {
        if (gSamusAnimationInfo.shinesparkTimer != 0)
            return SPOSE_DELAY_BEFORE_SHINESPARKING;

        if (!(gButtonInput & (KEY_UP | KEY_DOWN)))
        {
            gSamusData.pose = SPOSE_SPINNING;
            gSamusData.direction ^= (KEY_RIGHT | KEY_LEFT);

            gSamusData.currentAnimationFrame = 0;
            gSamusData.animationDurationCounter = 0;

            gSamusData.turning = FALSE;
            return SPOSE_NONE;
        }
    }

    if (gSamusData.shooting)
    {
        gSamusData.forcedMovement = FORCED_MOVEMENT_MID_AIR_CARRY;
        return SPOSE_MID_AIR_REQUEST;
    }

    if (!(gButtonInput & KEY_A) && gSamusData.yVelocity > 0)
        gSamusData.yVelocity = 0;

    return SPOSE_NONE;
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

/**
 * @brief 73fc | 24 | Samus morphing pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusMorphing(void)
{
    if (gChangedInput & KEY_UP)
        gSamusData.pose = SPOSE_UNMORPHING;

    return SPOSE_NONE;
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

/**
 * @brief 7658 | 38 | Samus unmorphing pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusUnmorphing(void)
{
    if (gChangedInput & KEY_A)
    {
        gSamusData.forcedMovement = FORCED_MOVEMENT_MID_AIR_JUMP;
        return SPOSE_MID_AIR_REQUEST;
    }

    if (gChangedInput & KEY_DOWN)
        gSamusData.pose = SPOSE_MORPHING;

    return SPOSE_NONE;
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

/**
 * @brief 7888 | ec | Samus wall jumping pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusWallJumping(void)
{
    if (gSamusData.direction & KEY_RIGHT)
    {
        if (gSamusData.xVelocity < gSamusPhysics.midAirXVelocityCap)
        {
            SamusApplyXAcceleration(gSamusPhysics.midAirXAcceleration, gSamusPhysics.midAirXVelocityCap);
        }
    }
    else
    {
        if (gSamusData.xVelocity > -gSamusPhysics.midAirXVelocityCap)
        {
            SamusApplyXAcceleration(gSamusPhysics.midAirXAcceleration, gSamusPhysics.midAirXVelocityCap);
        }
    }

    if (gSamusData.shooting)
    {
        // Cancel if shooting
        gSamusData.forcedMovement = FORCED_MOVEMENT_MID_AIR_FALL;
        return SPOSE_MID_AIR_REQUEST;
    }

    // Check for spin break
    if (gSamusData.yVelocity <= 0 && !(gButtonInput & (KEY_RIGHT | KEY_LEFT)) && gButtonInput & (KEY_UP | KEY_DOWN))
    {
        gSamusData.forcedMovement = FORCED_MOVEMENT_MID_AIR_FALL;
        return SPOSE_MID_AIR_REQUEST;
    }

    // Aim cannon
    SamusAimCannonMidAir();

    // Cancel wall jump if slowed
    if (gSamusPhysics.slowed)
        gSamusData.pose = SPOSE_SPINNING;

    if (!(gButtonInput & KEY_A))
    {
        // Stop upwards Y velocity if released A
        if (gSamusData.yVelocity > 0)
            gSamusData.yVelocity = 0;

        // Set spinning
        gSamusData.pose = SPOSE_SPINNING;
    }
    else
    {
        if (gSamusData.yVelocity <= 0 && gButtonInput & OPPOSITE_DIRECTION(gSamusData.direction))
        {
            // Set spinning
            gSamusData.pose = SPOSE_SPINNING;
        }
    }

    return SPOSE_NONE;
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

/**
 * @brief 7c68 | 10 | Samus pulling yourself up from hanging pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusPullingYourselfUpFromHanging(void)
{
    gSamusData.yPosition -= (QUARTER_BLOCK_SIZE - PIXEL_SIZE);

    return SPOSE_NONE;
}

u8 SamusPullingYourselfUpFromHangingGfx(void)
{

}

/**
 * @brief 7d08 | 30 | Samus pulling yourself forward from hanging pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusPullingYourselfForwardFromHanging(void)
{
    u16 speed;

    if (gSamusData.slopeType != 0)
        speed = PIXEL_SIZE / 2;
    else
        speed = PIXEL_SIZE;

    if (gSamusData.direction & KEY_RIGHT)
        gSamusData.xPosition += speed;
    else
        gSamusData.xPosition -= speed;

    return SPOSE_NONE;
}

u8 SamusPullingYourselfForwardFromHangingGfx(void)
{

}

/**
 * @brief 7d94 | 24 | Samus pulling yourself into morph ball tunnel pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusPullingYourselfIntoMorphballTunnel(void)
{
    if (gSamusData.direction & KEY_RIGHT)
        gSamusData.xPosition += QUARTER_BLOCK_SIZE / 2;
    else
        gSamusData.xPosition -= QUARTER_BLOCK_SIZE / 2;

    return SPOSE_NONE;
}

u8 SamusPullingYourselfIntoMorphballTunnelGfx(void)
{

}

/**
 * @brief 7dfc | 30 | Samus pulling yourself down to start hanging pose subroutine
 * 
 * @return u8 New pose
 */
u8 SamusPullingYourselfDownToStartHanging_Unused(void)
{
    gDisableScrolling = TRUE;

    if (gSamusData.currentAnimationFrame == 0)
        gSamusData.yPosition -= (QUARTER_BLOCK_SIZE - PIXEL_SIZE);
    else
        gSamusData.yPosition += (QUARTER_BLOCK_SIZE - PIXEL_SIZE);

    return SPOSE_NONE;
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
