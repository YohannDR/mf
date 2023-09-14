#include "sa_x.h"
#include "globals.h"
#include "macros.h"

#include "data/particle_data.h"
#include "data/sprites/sa_x.h"

#include "constants/samus.h"

#include "structs/samus.h"

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

/**
 * @brief d170 | 50 | Updates the position of the SA-X (applies the velocity)
 * 
 */
void SaXUpdatePosition(void)
{
    s16 yVelocity;
    s16 xVelocity;

    if (gSaXData.pose == SA_X_POSE_MID_AIR)
    {
        if (gSaXData.yVelocity < -SUB_PIXEL_TO_VELOCITY(QUARTER_BLOCK_SIZE))
            yVelocity = SUB_PIXEL_TO_VELOCITY(-PIXEL_SIZE / 2);
        else
            yVelocity = VELOCITY_TO_SUB_PIXEL(gSaXData.yVelocity);

        gSaXData.yVelocity -= SUB_PIXEL_TO_VELOCITY(ONE_SUB_PIXEL - ONE_SUB_PIXEL / 4.f);
        gSaXData.yPosition -= yVelocity;
    }

    xVelocity = VELOCITY_TO_SUB_PIXEL(gSaXData.xVelocity);;
    gSaXData.xPosition += xVelocity;
}

/**
 * @brief d1c0 | 234 | Updates the graphics of the SA-X and draws it
 * 
 */
void SaXUpdateGraphicsAndDraw(void)
{
    s32 direction;
    const struct SaXAnimationData* pAnim;
    const u8* pGfx;
    const u16* pPalette;
    s32 priority;
    s32 yPosition;
    s32 xPosition;
    s32 currSlot;
    s32 prevSlot;
    const u16* src;
    u16* dst;
    u16 part1;
    u16 part2;

    gSaXData.animationDurationCounter++;

    if (gSaXData.screenFlag == SA_X_SCREEN_FLAG_NOT_PRESENT || gSaXData.screenFlag == SA_X_SCREEN_FLAG_OFF_SCREEN)
        return;

    if (gSaXData.direction & KEY_RIGHT)
        direction = FALSE;
    else
        direction = TRUE;

    switch (gSaXData.pose)
    {
        case SA_X_POSE_STANDING:
            if (gSaXData.missilesArmed)
            {
                pAnim = sSaXOamDataPointers_Standing_Armed[gSaXData.diagonalAim][direction];
            }
            else
            {
                pAnim = sSaXOamDataPointers_Standing[gSaXData.diagonalAim][direction];
            }
            break;

        case SA_X_POSE_SHOOTING:
            if (gSaXData.missilesArmed)
            {
                pAnim = sSaXOamDataPointers_Shooting_Armed[gSaXData.diagonalAim][direction];
            }
            else
            {
                pAnim = sSaXOamDataPointers_Shooting[gSaXData.diagonalAim][direction];
            }
            break;

        case SA_X_POSE_TURNING:
            pAnim = sSaXOamDataPointers_Turning[gSaXData.diagonalAim][direction];
            break;

        default:
            pAnim = sSaXOamDataPointers[gSaXData.pose][direction];
    }

    pAnim = &pAnim[gSaXData.currentAnimationFrame];

    gSaXData.pOamFrame = pAnim->pOamFrame;

    pGfx = pAnim->pGraphics;

    gSaXData.topGfxLength = *pGfx++ * 32;
    gSaXData.bottomGfxLength = *pGfx++ * 32;
    gSaXData.pTopGfx = pGfx;
    gSaXData.pBottomGfx = gSaXData.pTopGfx + gSaXData.topGfxLength;

    if (gSaXData.pose == SA_X_POSE_MID_AIR)
    {
        pPalette = &sSaXPalette_MidAir[MOD_AND(gSaXData.currentAnimationFrame, 4) * 16];
    }
    else if (gSaXData.pose == SA_X_POSE_TRANSFORMING_INTO_MONSTER)
    {
        switch (gSaXData.currentAnimationFrame)
        {
            case 24:
            case 26:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
                pPalette = sSaXPalette_TransformingIntoMonster;
                break;

            default:
                pPalette = sSaXPalette_Default;
        }
    }
    else
    {
        pPalette = sSaXPalette_Default;
    }

    SetSuitPalette(pPalette, 0, 16, TRUE);

    priority = 2;
    if (gSamusOnTopOfBackgrounds)
        priority = 1;

    if (gSaXData.pose == SA_X_POSE_TRANSFORMING_INTO_MONSTER)
        priority = gIoRegisters.bg1Cnt & 3;

    dst = (u16*)gOamData;
    dst = (u16*)&gOamData[gNextOamSlot];

    currSlot = gNextOamSlot;
    prevSlot = gNextOamSlot;

    xPosition = SUB_PIXEL_TO_PIXEL(gSaXData.xPosition) - SUB_PIXEL_TO_PIXEL(gBg1XPosition);
    yPosition = SUB_PIXEL_TO_PIXEL(gSaXData.yPosition) - SUB_PIXEL_TO_PIXEL(gBg1YPosition) + SUB_PIXEL_TO_PIXEL(QUARTER_BLOCK_SIZE / 2);

    src = gSaXData.pOamFrame;
    currSlot += *src++;

    for (; prevSlot < currSlot; prevSlot++)
    {
        part1 = *src++;
        *dst++ = part1;
        gOamData[prevSlot].split.y = part1 + yPosition;
        gOamData[prevSlot].split.mosaic = gSaXData.mosaic;

        part2 = *src++;
        *dst++ = part2;
        gOamData[prevSlot].split.x = MOD_AND(part2 + xPosition, 512);

        *dst++ = *src++;

        gOamData[prevSlot].split.paletteNum += gSaXData.paletteRow;
        gOamData[prevSlot].split.priority = priority;

        dst++;
    }

    gNextOamSlot = currSlot;
}

/**
 * @brief d3f4 | 170 | Updates an SA-X elevator sprite
 * 
 * @param spriteSlot Sprite slot
 */
void SaXUpdateElevatorSprite(s32 spriteSlot)
{
    const struct FrameData* pOam;

    if (gSaXElevatorSprites[spriteSlot].unk_0 != 0 && gSaXElevatorSprites[spriteSlot].unk_2 != 0)
    {
        gSaXElevatorSprites[spriteSlot].unk_2--;
        if (gSaXElevatorSprites[spriteSlot].unk_2 == 0)
            gSaXElevatorSprites[spriteSlot].unk_0++;
    }

    if (gSaXElevatorSprites[spriteSlot].unk_0 == 0 || gSaXElevatorSprites[spriteSlot].unk_0 == 1)
        return;

    switch (gSaXElevatorSprites[spriteSlot].type)
    {
        case 0:
        case 1:
            gSaXElevatorSprites[spriteSlot].animationDurationCounter++;

            if (gSaXElevatorSprites[spriteSlot].animationDurationCounter < sParticleOam_Explosion7[gSaXElevatorSprites[spriteSlot].currentAnimationFrame].timer)
                break;

            gSaXElevatorSprites[spriteSlot].animationDurationCounter = 0;
            gSaXElevatorSprites[spriteSlot].currentAnimationFrame++;

            if (sParticleOam_Explosion7[gSaXElevatorSprites[spriteSlot].currentAnimationFrame].timer == 0)
                gSaXElevatorSprites[spriteSlot].unk_0 = 0;
            break;

        case 2:
            gSaXElevatorSprites[spriteSlot].animationDurationCounter++;

            if (gSaXElevatorSprites[spriteSlot].animationDurationCounter < sParticleOam_Explosion8[gSaXElevatorSprites[spriteSlot].currentAnimationFrame].timer)
                break;

            gSaXElevatorSprites[spriteSlot].animationDurationCounter = 0;
            gSaXElevatorSprites[spriteSlot].currentAnimationFrame++;

            if (sParticleOam_Explosion8[gSaXElevatorSprites[spriteSlot].currentAnimationFrame].timer == 0)
                gSaXElevatorSprites[spriteSlot].unk_0 = 0;
            break;

        case 3:
        case 4:
        case 5:
        case 6:
            gSaXElevatorSprites[spriteSlot].yPosition -= VELOCITY_TO_SUB_PIXEL(gSaXElevatorSprites[spriteSlot].yVelocity);
            gSaXElevatorSprites[spriteSlot].yVelocity -= SUB_PIXEL_TO_VELOCITY(ONE_SUB_PIXEL - ONE_SUB_PIXEL / 4.f);

            if (gSaXElevatorSprites[spriteSlot].yPosition > BLOCK_SIZE * 7 + ONE_SUB_PIXEL)
                gSaXElevatorSprites[spriteSlot].unk_0 = 0;

        case 7:
        case 8:
            gSaXElevatorSprites[spriteSlot].xPosition += VELOCITY_TO_SUB_PIXEL(gSaXElevatorSprites[spriteSlot].xVelocity);
            break;

        case 9:
            gSaXElevatorSprites[spriteSlot].animationDurationCounter++;

            if (gSaXElevatorSprites[spriteSlot].animationDurationCounter >= sSaxElevatorOam_2e8038[gSaXElevatorSprites[spriteSlot].currentAnimationFrame].timer)
            {
                gSaXElevatorSprites[spriteSlot].animationDurationCounter = 0;
                gSaXElevatorSprites[spriteSlot].currentAnimationFrame++;
    
                if (sSaxElevatorOam_2e8038[gSaXElevatorSprites[spriteSlot].currentAnimationFrame].timer == 0)
                    gSaXElevatorSprites[spriteSlot].currentAnimationFrame = 0;
            }

            gSaXElevatorSprites[spriteSlot].xPosition += VELOCITY_TO_SUB_PIXEL(gSaXElevatorSprites[spriteSlot].xVelocity);
            break;
    }

    pOam = sSaXElevatorSpritesOamPointers[gSaXElevatorSprites[spriteSlot].type];
    pOam = &pOam[gSaXElevatorSprites[spriteSlot].currentAnimationFrame];
    
    gSaXElevatorSprites[spriteSlot].pOamFrame = pOam->pFrame;
}

/**
 * @brief d564 | d4 | Draws the elevator sprites
 * 
 */
void SaXDrawElevatorSprites(void)
{
    s32 i;
    s32 j;
    u16 yPosition;
    u16 xPosition;
    s32 currSlot;
    s32 prevSlot;
    const u16* src;
    u16* dst;
    u16 part1;
    u16 part2;

    dst = (u16*)gOamData;
    dst = (u16*)&gOamData[gNextOamSlot];

    currSlot = gNextOamSlot;
    prevSlot = gNextOamSlot;

    for (i = 0; i < MAX_AMOUNT_OF_SA_X_ELEVATOR_SPRITES; i++)
    {
        if (gSaXElevatorSprites[i].unk_0 <= 1)
            continue;

        src = gSaXElevatorSprites[i].pOamFrame;
        currSlot += *src++;

        xPosition = SUB_PIXEL_TO_PIXEL(gSaXElevatorSprites[i].xPosition);
        yPosition = SUB_PIXEL_TO_PIXEL(gSaXElevatorSprites[i].yPosition);

        for (; prevSlot < currSlot; prevSlot++)
        {
            part1 = *src++;
            *dst++ = part1;
            gOamData[prevSlot].split.y = part1 + yPosition;

            part2 = *src++;
            *dst++ = part2;
            gOamData[prevSlot].split.x = MOD_AND(part2 + xPosition, 512);

            *dst++ = *src++;

            gOamData[prevSlot].split.priority = 0;

            dst++;
        }
    }

    gNextOamSlot = currSlot;
}

/**
 * @brief d638 | 5c | To document
 * 
 */
void unk_d638(void)
{
    gSaXElevatorData.unk_0 = 1;
    gNextOamSlot = 0;

    if (sSaXElevatorFunctionPointers[gSaXElevatorData.unk_1]())
    {
        gSaXElevatorData.stage = 0;
        gSaXElevatorData.unk_3 = 0;
        gSaXElevatorData.unk_4 = 0;
        gSaXElevatorData.unk_5 = 0;
        gSaXElevatorData.timer = 0;

        gDisableDrawingSamusAndScrollingFlag = FALSE;

        gSaXData.screenFlag = SA_X_SCREEN_FLAG_NOT_PRESENT;
        gSubGameMode1 = 0x3;
    }
}

/**
 * @brief d694 | 15c | To document
 * 
 * @return u8 bool, ended
 */
u8 unk_d694(void)
{
    s32 i;
    u32 ended;
    u8 newPose;
    u8 bldalpha;
    u32 tmp;

    ended = FALSE;

    if (sSaXElevatorSubroutinesPointers[gSaXElevatorData.stage]())
    {
        gSaXElevatorData.stage++;
        gSaXElevatorData.timer = 0;
    }

    for (i = 0; i < MAX_AMOUNT_OF_SA_X_ELEVATOR_SPRITES - 1; i++)
        SaXUpdateElevatorSprite(i);

    switch (gSaXElevatorData.unk_4)
    {
        case 1:
            if (gWrittenToBldy < 16)
            {
                gWrittenToBldy++;
                write16(REG_BLDY, gWrittenToBldy);
            }
            break;

        case 2:
            if (gWrittenToBldy != 0)
            {
                gWrittenToBldy--;
                write16(REG_BLDY, gWrittenToBldy);
            }

            gSaXElevatorData.unk_5++;
            if (MOD_AND(gSaXElevatorData.unk_5, 8) == 0)
                gBackgroundPositions.bg[3].x--;
            break;

        case 3:
            bldalpha = gSaXElevatorData.unk_5++ / 4;
            tmp = 16 - bldalpha;
            write16(REG_BLDALPHA, C_16_2_8(16 - tmp, tmp));

            if (MOD_AND(gSaXElevatorData.unk_5, 4) == 0)
                gBackgroundPositions.bg[3].x--;

            if (tmp == 0)
            {
                gSaXElevatorData.unk_4 = 0;
                gSaXElevatorData.unk_5 = 0;

                write16(REG_DISPCNT, read16(REG_DISPCNT) & ~(DCNT_BG0 | DCNT_BG3));;
                write16(REG_BLDCNT, 0);
            }
            else if (tmp == 1)
            {
                gSaXElevatorSprites[4].unk_0 = 0;
                gSaXElevatorSprites[5].unk_0 = 0;
            }
            break;
    }

    if (gSaXElevatorData.stage >= ARRAY_SIZE(sSaXElevatorSubroutinesPointers))
        ended++;

    newPose = sSaXPoseGfxFunctionPointers[gSaXData.pose]();
    if (newPose != SA_X_POSE_NONE)
        SaXSetPose(newPose);

    SaXUpdatePosition();

    if (gSubGameMode1 != 0x3)
    {
        SaXDrawElevatorSprites();
        SaXUpdateGraphicsAndDraw();
    }

    return ended;
}

/**
 * @brief d7f0 | cc | Handles the before blowing up the wall part of the SA-X elevator cutscene
 * 
 * @return u8 bool, ended
 */
u8 SaXElevatorBeforeBlowingUpWall(void)
{
    u8 ended;
    s32 i;

    ended = FALSE;

    switch (gSaXElevatorData.timer++)
    {
        case 0:
            DMA_SET(3, sSaXElevatorRocksAndCloudPal, PALRAM_OBJ + 0x120, C_32_2_16(DMA_ENABLE, ARRAY_SIZE(sSaXElevatorRocksAndCloudPal)));
            gDisableDrawingSamusAndScrollingFlag++;
            break;

        case 1:
            DMA_SET(3, sSaXElevatorGraphics_RocksTop, VRAM_OBJ + 0x4A60, C_32_2_16(DMA_ENABLE, ARRAY_SIZE(sSaXElevatorGraphics_RocksTop) / 2));
            break;

        case 2:
            DMA_SET(3, sSaXElevatorGraphics_RocksBottom, VRAM_OBJ + 0x4E60, C_32_2_16(DMA_ENABLE, ARRAY_SIZE(sSaXElevatorGraphics_RocksBottom) / 2));
            break;

        case 3:
            for (i = 0; i < MAX_AMOUNT_OF_SA_X_ELEVATOR_SPRITES - 1; i++)
            {
                gSaXElevatorSprites[i] = sSaXElevatorSpritesBlowingUpWall[i];
            }

            gSaXElevatorData.timer = 0;
            ended = TRUE;
            break;
    }

    return ended;
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
