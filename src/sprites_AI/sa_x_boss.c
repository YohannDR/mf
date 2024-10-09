#include "sprites_AI/sa_x_boss.h"
#include "sprites_AI/sa_x.h"
#include "macros.h"
#include "gba.h"
#include "globals.h"

#include "data/sprites/sa_x.h"
#include "data/sprite_data.h"
#include "data/engine_pointers.h"

#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"
#include "constants/sa_x.h"

#include "structs/sprite.h"
#include "structs/samus.h"
#include "structs/sa_x.h"

/**
 * @brief 19e34 | 460 | Checks the running collisions for the SA-X (boss)
 * 
 */
void SaXBossCheckCollisionRunning(void)
{
    u8 var_0;
    u8 var_1;

    var_0 = FALSE;
    var_1 = FALSE;
    gCurrentSprite.work2 = DIAG_AIM_NONE;

    SpriteUtilAdjustYPosOnSlope();

    if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - QUARTER_BLOCK_SIZE);

            if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = 0x37;
                return;
            }

            if (gPreviousVerticalCollisionCheck == COLLISION_LEFT_STEEP_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            else if (gPreviousVerticalCollisionCheck == COLLISION_LEFT_SLIGHT_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        }
        else
        {
            SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + QUARTER_BLOCK_SIZE);

            if (gPreviousVerticalCollisionCheck == COLLISION_AIR)
            {
                gCurrentSprite.pose = 0x37;
                return;
            }

            if (gPreviousVerticalCollisionCheck == COLLISION_RIGHT_STEEP_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
            else if (gPreviousVerticalCollisionCheck == COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE)
                gCurrentSprite.yPosition = SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition);
        }

        return;
    }

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        if (!(gPreviousVerticalCollisionCheck & 0xF0))
            return;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition,
                gCurrentSprite.xPosition + (BLOCK_SIZE * 4 + HALF_BLOCK_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                var_0 = TRUE;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                    gCurrentSprite.xPosition + (BLOCK_SIZE * 4 + HALF_BLOCK_SIZE));

                if (gPreviousCollisionCheck == COLLISION_SOLID)
                    var_0 = TRUE;
            }

            if (var_0)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE * 4,
                    gCurrentSprite.xPosition + (BLOCK_SIZE * 2 + HALF_BLOCK_SIZE));
    
                if (gPreviousCollisionCheck == COLLISION_AIR)
                {
                    if (gSamusData.yPosition < gCurrentSprite.yPosition + (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2))
                    {
                        if (gCurrentSprite.work3 < 20)
                            gCurrentSprite.work3 = 20;
    
                        gCurrentSprite.work2 = 0x2;
                    }
                }
            }
    
            gCurrentSprite.pose = 0x37;
            return;
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE),
            gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = 0x39;
                return;
            }
        }

        if (gCurrentSprite.xParasiteTimer >= 60 * 3)
            return;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 3 - PIXEL_SIZE),
            gCurrentSprite.xPosition + (BLOCK_SIZE * 3));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 5 - QUARTER_BLOCK_SIZE / 2),
                gCurrentSprite.xPosition + BLOCK_SIZE * 3);

            if (gPreviousCollisionCheck != COLLISION_AIR)
                return;

            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE - PIXEL_SIZE),
                gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

            if (gPreviousCollisionCheck == COLLISION_AIR)
            {
                if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 4 - QUARTER_BLOCK_SIZE))
                {
                    if (gCurrentSprite.work3 < 8)
                        gCurrentSprite.work3 = 8;

                    gCurrentSprite.work2 = 0x2;
                    gCurrentSprite.pose = 0x37;
                }
            }
        }
    }
    else
    {
        if (!(gPreviousVerticalCollisionCheck & 0xF0))
            return;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition,
                gCurrentSprite.xPosition - (BLOCK_SIZE * 4 + HALF_BLOCK_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                var_0 = TRUE;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                    gCurrentSprite.xPosition - (BLOCK_SIZE * 4 + HALF_BLOCK_SIZE));

                if (gPreviousCollisionCheck == COLLISION_SOLID)
                    var_0 = TRUE;
            }

            if (var_0)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - BLOCK_SIZE * 4,
                    gCurrentSprite.xPosition - (BLOCK_SIZE * 2 + HALF_BLOCK_SIZE));

                if (gPreviousCollisionCheck == COLLISION_AIR)
                {
                    if (gSamusData.yPosition > gCurrentSprite.yPosition - (BLOCK_SIZE * 7 - QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2))
                    {
                        if (gSamusData.yPosition < gCurrentSprite.yPosition + (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2))
                        {
                            if (gCurrentSprite.work3 < 20)
                                gCurrentSprite.work3 = 20;
    
                            gCurrentSprite.work2 = 0x2;
                        }
                    }
                    else
                        var_1++;
                }
            }

            if (!var_1)
            {
                gCurrentSprite.pose = 0x37;
                return;
            }
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE),
            gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                gCurrentSprite.pose = 0x39;
                return;
            }
        }

        if (gCurrentSprite.xParasiteTimer >= 60 * 3)
            return;

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 3 - PIXEL_SIZE),
            gCurrentSprite.xPosition - (BLOCK_SIZE * 3));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 5 - QUARTER_BLOCK_SIZE / 2),
                gCurrentSprite.xPosition - BLOCK_SIZE * 3);

            if (gPreviousCollisionCheck == COLLISION_AIR)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + QUARTER_BLOCK_SIZE - PIXEL_SIZE),
                    gCurrentSprite.xPosition - HALF_BLOCK_SIZE);
    
                if (gPreviousCollisionCheck == COLLISION_AIR)
                {
                    if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 4 - QUARTER_BLOCK_SIZE))
                    {
                        if (gCurrentSprite.work3 < 8)
                            gCurrentSprite.work3 = 8;
    
                        gCurrentSprite.work2 = 0x2;
                        gCurrentSprite.pose = 0x37;
                        return;
                    }
                }
            }
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE), gCurrentSprite.xPosition - (BLOCK_SIZE * 4 - QUARTER_BLOCK_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 7 + PIXEL_SIZE), gCurrentSprite.xPosition - (BLOCK_SIZE * 3));
            if (gPreviousCollisionCheck == COLLISION_AIR)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE), gCurrentSprite.xPosition - (HALF_BLOCK_SIZE));

                if (gPreviousCollisionCheck == COLLISION_AIR)
                {
                    if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 4 - QUARTER_BLOCK_SIZE))
                    {
                        if (gCurrentSprite.work3 < 8)
                            gCurrentSprite.work3 = 8;
    
                        gCurrentSprite.work2 = 0x3;
                        gCurrentSprite.pose = 0x37;
                        return;
                    }
                }
            }
        }

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 3 + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition - (BLOCK_SIZE * 4 + QUARTER_BLOCK_SIZE));

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 7 - QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition - (BLOCK_SIZE * 4 + QUARTER_BLOCK_SIZE));
            if (gPreviousCollisionCheck == COLLISION_SOLID)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 8 + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition - (BLOCK_SIZE * 4 + QUARTER_BLOCK_SIZE));
                if (gPreviousCollisionCheck == COLLISION_AIR)
                {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + PIXEL_SIZE), gCurrentSprite.xPosition - (HALF_BLOCK_SIZE));
    
                    if (gPreviousCollisionCheck == COLLISION_AIR)
                    {
                        if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 6 + QUARTER_BLOCK_SIZE))
                        {
                            if (gCurrentSprite.work3 < 8)
                                gCurrentSprite.work3 = 8;
        
                            gCurrentSprite.work2 = 0x5;
                            gCurrentSprite.pose = 0x37;
                            return;
                        }
                    }
                }
            }
        }
    }
}

/**
 * @brief 1a294 | 2d0 | Handles the SA-X (boss) tracking samus
 * 
 * @return u8 bool, pose changed
 */
u8 SaXBossTrackSamus(void)
{
    u32 nslr;

    if (gSaXVision.inYRange == TRUE)
    {
        gCurrentSprite.xParasiteTimer = 0;

        if (SpriteUtilCheckHangingOnLedge())
        {
            nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 11 + HALF_BLOCK_SIZE,
                BLOCK_SIZE * 9 + QUARTER_BLOCK_SIZE + PIXEL_SIZE);
        }
        else
        {
            nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 7 + HALF_BLOCK_SIZE,
                BLOCK_SIZE * 5 + QUARTER_BLOCK_SIZE + PIXEL_SIZE);
        }

        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            if (nslr == NSLR_RIGHT)
            {
                gCurrentSprite.pose = 0x29;
                gCurrentSprite.work2 = gSaXVision.unk_0;
                return TRUE;
            }
        }
        else
        {
            if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x29;
                gCurrentSprite.work2 = gSaXVision.unk_0;
                return TRUE;
            }
        }

        nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 4, BLOCK_SIZE * 10);

        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            if (nslr == NSLR_LEFT)
            {
                gCurrentSprite.pose = 0x39;
                return TRUE;
            }
        }
        else
        {
            if (nslr == NSLR_RIGHT)
            {
                gCurrentSprite.pose = 0x39;
                return TRUE;
            }
        }

        return FALSE;
    }

    nslr = FALSE;

    if (gCurrentSprite.xParasiteTimer < 60 * 3)
    {
        gCurrentSprite.xParasiteTimer++;

        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            if (gSaXVision.samusOnRight == FALSE && gSaXVision.inXRange != FALSE)
            {
                gCurrentSprite.pose = 0x39;
                return TRUE;
            }
        }
        else
        {
            if (gSaXVision.samusOnRight == TRUE && gSaXVision.inXRange != FALSE)
            {
                gCurrentSprite.pose = 0x39;
                return TRUE;
            }
        }

        return FALSE;
    }

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 11))
        {
            if (gSamusData.xPosition < gCurrentSprite.xPosition + (BLOCK_SIZE * 12 + HALF_BLOCK_SIZE) &&
                gSamusData.xPosition > gCurrentSprite.xPosition + (BLOCK_SIZE * 9 + HALF_BLOCK_SIZE))
            {
                nslr = TRUE;
            }
        }

        if (nslr)
        {
            gSaXVision.unk_0 = TRUE;
            gSaXVision.unk_1 = TRUE;
            gCurrentSprite.pose = 0x29;
            gCurrentSprite.work2 = gSaXVision.unk_0;
            return TRUE;
        }
    }
    else
    {
        if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 18))
        {
            if (gSamusData.xPosition > gCurrentSprite.xPosition - (BLOCK_SIZE * 20) &&
                gSamusData.xPosition < gCurrentSprite.xPosition - (BLOCK_SIZE * 17))
            {
                nslr = TRUE;
            }
        }

        if (nslr)
        {
            gSaXVision.unk_0 = TRUE;
            gSaXVision.unk_1 = FALSE;
            gCurrentSprite.pose = 0x29;
            gCurrentSprite.work2 = gSaXVision.unk_0;
            return TRUE;
        }

        if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 11) &&
            gSamusData.yPosition > gCurrentSprite.yPosition - (BLOCK_SIZE * 13 + QUARTER_BLOCK_SIZE / 2))
        {
            if (gSamusData.xPosition > gCurrentSprite.xPosition - (BLOCK_SIZE * 12 + HALF_BLOCK_SIZE) &&
                gSamusData.xPosition < gCurrentSprite.xPosition - (BLOCK_SIZE * 9 + HALF_BLOCK_SIZE))
            {
                nslr = TRUE;
            }
        }

        if (nslr)
        {
            gSaXVision.unk_0 = TRUE;
            gSaXVision.unk_1 = FALSE;
            gCurrentSprite.pose = 0x29;
            gCurrentSprite.work2 = gSaXVision.unk_0;
            return TRUE;
        }

        if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 10) &&
            gSamusData.yPosition > gCurrentSprite.yPosition - (BLOCK_SIZE * 11 - PIXEL_SIZE))
        {
            if (gSamusData.xPosition > gCurrentSprite.xPosition - (BLOCK_SIZE * 11 + HALF_BLOCK_SIZE) &&
                gSamusData.xPosition < gCurrentSprite.xPosition - (BLOCK_SIZE * 8 + HALF_BLOCK_SIZE))
            {
                nslr = TRUE;
            }
        }

        if (nslr)
        {
            gSaXVision.unk_0 = TRUE;
            gSaXVision.unk_1 = FALSE;
            gCurrentSprite.pose = 0x29;
            gCurrentSprite.work2 = gSaXVision.unk_0;
            return TRUE;
        }

        if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 4 - PIXEL_SIZE) &&
            gSamusData.yPosition > gCurrentSprite.yPosition - (BLOCK_SIZE * 6 + QUARTER_BLOCK_SIZE))
        {
            if (gSamusData.xPosition > gCurrentSprite.xPosition - (BLOCK_SIZE * 6) &&
                gSamusData.xPosition < gCurrentSprite.xPosition - (BLOCK_SIZE * 4))
            {
                if (gCurrentSprite.work3 < 8)
                    gCurrentSprite.work3 = 8;

                gCurrentSprite.work2 = 0x3;
                gCurrentSprite.pose = 0x37;
                return TRUE;
            }
        }
    }

    if (SpriteUtilCheckHangingOnLedge())
    {
        if (gSamusData.yPosition < gCurrentSprite.yPosition)
            gSaXVision.unk_0 = 1;
        else
            gSaXVision.unk_0 = 2;

        if (gCurrentSprite.status & SS_FACING_RIGHT)
            gSaXVision.unk_1 = TRUE;
        else
            gSaXVision.unk_1 = FALSE;

        gCurrentSprite.xParasiteTimer -= 70;
        gCurrentSprite.pose = 0x2D;
        gCurrentSprite.work2 = gSaXVision.unk_0;

        SaXSetPose(SA_X_POSE_STANDING);
        return TRUE;
    }

    return FALSE;
}

/**
 * @brief 1a564 | 34 | Initializes the SA-X (boss) to be running
 * 
 */
void SaXBossRunningInit(void)
{
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    if (!unk_15dd4())
        SaXSetPose(SA_X_POSE_RUNNING);
}

/**
 * @brief 1a598 | 4c | Handles the SA-X (boss) running
 * 
 */
void SaXBossRunning(void)
{
    if (SaXBossTrackSamus())
        return;

    SaXBossCheckCollisionRunning();

    if (gCurrentSprite.pose != 0x18)
        return;

    unk_11604(sSaXRunningSpeed[gCurrentSprite.work3 / 8]);

    if (gCurrentSprite.work3 < ARRAY_SIZE(sSaXRunningSpeed) * 8 - 1)
        gCurrentSprite.work3++;
}

/**
 * @brief 1a5e4 | 3c | Initializes the SA-X (boss) to spin jump
 * 
 */
void SaXBossSpinJumpingInit(void)
{
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);
    gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;

    SaXSetPose(SA_X_POSE_MID_AIR);

    gCurrentSprite.work0 = 0;
}

/**
 * @brief 1a620 | 228 | Handles the SA-X (boss) spin jumping
 * 
 */
void SaXBossSpinJumping(void)
{
    u8 offset;
    s16 movement;
    s32 blockTop;

    // ?
    if (gSaXVision.unk_0)
        ;

    if (gCurrentSprite.xParasiteTimer < 60 * 3)
        gCurrentSprite.xParasiteTimer++;

    if (gCurrentSprite.work0 != 0)
    {
        if (gSaXData.pose != SA_X_POSE_STANDING)
            return;

        if (gCurrentSprite.status & SS_SAMUS_DETECTED)
        {
            gCurrentSprite.pose = 0x17;
            if (gCurrentSprite.status & SS_FACING_RIGHT)
            {
                if (gCurrentSprite.xParasiteTimer < 60 * 3 && gSaXVision.samusOnRight == FALSE)
                    gCurrentSprite.pose = 0x39;
            }
            else
            {
                if (gCurrentSprite.xParasiteTimer < 60 * 3 && gSaXVision.samusOnRight == TRUE)
                    gCurrentSprite.pose = 0x39;
            }
        }
        else
        {
            gCurrentSprite.pose = 0x1;
        }

        return;
    }

    if (gCurrentSprite.status & SS_SAMUS_DETECTED)
    {
        movement = sSaXRunningSpeed[gCurrentSprite.work3 / 8];
    }
    else
    {
        movement = PIXEL_SIZE;
    }

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition + HALF_BLOCK_SIZE);
        if (gPreviousCollisionCheck != COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

            if (gPreviousCollisionCheck != COLLISION_SOLID)
                gCurrentSprite.xPosition += movement;
        }
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition - HALF_BLOCK_SIZE);
        if (gPreviousCollisionCheck != COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

            if (gPreviousCollisionCheck != COLLISION_SOLID)
                gCurrentSprite.xPosition -= movement;
        }
    }

    if (gCurrentSprite.work2 == 1)
    {
        movement = sSaXJumpYVelocity_1[DIV_SHIFT(gCurrentSprite.work4, 4)];

        if (gCurrentSprite.work4 < ARRAY_SIZE(sSaXJumpYVelocity_1) * 4 - 1)
            gCurrentSprite.work4++;
    }
    else if (gCurrentSprite.work2 == 2)
    {
        movement = sSaXBossSpinJumpYVelocity_2[DIV_SHIFT(gCurrentSprite.work4, 4)];

        if (gCurrentSprite.work4 < ARRAY_SIZE(sSaXBossSpinJumpYVelocity_2) * 4 - 1)
            gCurrentSprite.work4++;
    }
    else if (gCurrentSprite.work2 == 3)
    {
        movement = sSaXJumpYVelocity_3[DIV_SHIFT(gCurrentSprite.work4, 4)];

        if (gCurrentSprite.work4 < ARRAY_SIZE(sSaXJumpYVelocity_3) * 4 - 1)
            gCurrentSprite.work4++;
    }
    else if (gCurrentSprite.work2 == 4)
    {
        movement = sSaXJumpYVelocity_4[DIV_SHIFT(gCurrentSprite.work4, 4)];

        if (gCurrentSprite.work4 < ARRAY_SIZE(sSaXJumpYVelocity_4) * 4 - 1)
            gCurrentSprite.work4++;
    }
    else if (gCurrentSprite.work2 == 5)
    {
        movement = sSaXBossSpinJumpYVelocity_5[DIV_SHIFT(gCurrentSprite.work4, 4)];

        if (gCurrentSprite.work4 < ARRAY_SIZE(sSaXBossSpinJumpYVelocity_5) * 4 - 1)
            gCurrentSprite.work4++;
    }
    else
    {
        movement = sSaXJumpYVelocity_0[DIV_SHIFT(gCurrentSprite.work4, 4)];

        if (gCurrentSprite.work4 < ARRAY_SIZE(sSaXJumpYVelocity_0) * 4 - 1)
            gCurrentSprite.work4++;
    }

    gCurrentSprite.yPosition += movement;

    if (movement > 0)
    {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.yPosition = blockTop;
            gCurrentSprite.work0 = 1;
            SaXSetPose(SA_X_POSE_LANDING);
        }
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), gCurrentSprite.xPosition);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            gCurrentSprite.yPosition -= movement;
        }
    }
}

/**
 * @brief 1a848 | 30 | Initializes the SA-X (boss) to be waiting to appear
 * 
 */
void SaXBossWaitingToAppearInit(void)
{
    gCurrentSprite.status |= SS_HIDDEN;
    gCurrentSprite.pose = 0x42;

    SaXSetPose(SA_X_POSE_FALLING);

    gCurrentSprite.work1 = 0;
}

/**
 * @brief 1a878 | 9c | Handles the SA-X (boss) waiting to appear
 * 
 */
void SaXBossWaitingToAppear(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (gCurrentSprite.work1 == 0)
    {
        if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 5 + HALF_BLOCK_SIZE))
        {
            if (gSamusData.xPosition > gCurrentSprite.xPosition - (BLOCK_SIZE * 23) && gSamusData.xPosition < gCurrentSprite.xPosition - (BLOCK_SIZE * 20))
            {
                ScreenShakeStartHorizontal(60, 0x80 | 1);
                gCurrentSprite.work1 = 80;
                FadeMusic(0);
                unk_3b1c(0x9B);
            }
        }
    }
    else
    {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
        {
            gCurrentSprite.pose = 0x45;
            gCurrentSprite.work3 = 8;
            gCurrentSprite.status &= ~SS_HIDDEN;
            MusicPlay(0x51, 7);
        }
    }
}

/**
 * @brief 1a914 | 70 | Initializes the SA-X (boss)
 * 
 */
void SaXBossInit(void)
{
    if (!EventCheckOn_EnteredOperationsDeck())
    {
        gCurrentSprite.status = 0;
        return;
    }

    SaXInit();

    gCurrentSprite.status |= SS_SAMUS_DETECTED;

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.xParasiteTimer = 0;
    
    gCurrentSprite.status &= ~SS_FACING_RIGHT;
    SaXSetDirection();

    gCurrentSprite.work3 = 8;

    SaXBossWaitingToAppearInit();

    gBossWork2 = 0;
    gBossWork3 = 0;
    gSaXData.mosaic = FALSE;
}

/**
 * @brief 1a984 | 34 | Initializes the SA-X (boss) to be falling
 * 
 */
void SaXBossFallingInit(void)
{
    gCurrentSprite.pose = 0x16;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_FALLING);

    gCurrentSprite.work0 = 0;
}

/**
 * @brief 1a9b8 | bc | Handles the SA-X (boss) falling
 * 
 */
void SaXBossFalling(void)
{
    u8 offset;
    s16 movement;
    s32 blockTop;

    if (gCurrentSprite.work0 != 0)
    {
        if (gSaXData.pose != SA_X_POSE_STANDING)
            return;

        gCurrentSprite.pose = 0x17;

        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            if (gSaXVision.samusOnRight == FALSE)
                gCurrentSprite.pose = 0x39;
        }
        else
        {
            if (gSaXVision.samusOnRight == TRUE)
                gCurrentSprite.pose = 0x39;
        }

        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.work0 = 1;
        SaXSetPose(SA_X_POSE_LANDING);
        return;
    }

    offset = gCurrentSprite.work4;
    movement = sSpritesFallingSpeed[offset];

    if (movement == SHORT_MAX)
    {
        movement = sSpritesFallingSpeed[offset - 1];
        gCurrentSprite.yPosition += movement;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }
}

/**
 * @brief 1aa74 | 24 | Initializes the SA-X (boss) to be turning around during a chase
 * 
 */
void SaXBossTurningAroundChaseInit(void)
{
    gCurrentSprite.pose = 0x3A;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_TURNING);
}

/**
 * @brief 1aa98 | 50 | Handles the SA-X (boss) turning around during a chase
 * 
 */
void SaXBossTurningAroundChase(void)
{
    if (gSaXData.pose != SA_X_POSE_STANDING)
        return;

    gCurrentSprite.status ^= SS_FACING_RIGHT;
    SaXSetDirection();

    if (gSamusData.pose == SPOSE_SCREW_ATTACKING)
    {
        gCurrentSprite.pose = 0x45;
        gCurrentSprite.work3 = 8;
    }
    else
    {
        gCurrentSprite.pose = 0x17;
    }
}

/**
 * @brief 1aae8 | 34 | Initializes the SA-X (boss) to be falling from a knockback
 * 
 */
void SaxBossFallingFromKnockbackInit(void)
{
    gCurrentSprite.pose = 0x44;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);

    SaXSetPose(SA_X_POSE_FALLING);

    gCurrentSprite.work0 = 0;
}

/**
 * @brief 1ab1c | e0 | Handles the SA-X (boss) falling from a knockback
 * 
 */
void SaxBossFallingFromKnockback(void)
{
    u8 offset;
    s16 movement;
    s32 blockTop;

    if (gCurrentSprite.work0 != 0)
    {
        if (gSaXData.pose != SA_X_POSE_STANDING)
            return;

        if (gCurrentSprite.health == 0)
        {
            gCurrentSprite.pose = 0x51;
            return;
        }

        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;

        if (MOD_AND(gSpriteRandomNumber, 2))
        {
            gCurrentSprite.pose = 0x47;
            gCurrentSprite.work3 = 40;
        }
        else
        {
            gCurrentSprite.pose = 0x49;
            gCurrentSprite.work3 = 62;
        }

        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.work0 = 1;
        SaXSetPose(SA_X_POSE_LANDING);
        return;
    }

    offset = gCurrentSprite.work4;
    movement = sSpritesFallingSpeed[offset];

    if (movement == SHORT_MAX)
    {
        movement = sSpritesFallingSpeed[offset - 1];
        gCurrentSprite.yPosition += movement;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }
}

/**
 * @brief 1abfc | 94 | Initializes the SA-X (boss) to do a variable jump height
 * 
 */
void SaXBossVariableJumpHeightInit(void)
{
    if (gCurrentSprite.pose == 0x49)
        gCurrentSprite.pose = 0x4A;
    else if (gCurrentSprite.pose == 0x47)
        gCurrentSprite.pose = 0x48;
    else
        gCurrentSprite.pose = 0x46;

    gCurrentSprite.work4 = 0;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + QUARTER_BLOCK_SIZE);
    gCurrentSprite.yPosition -= HALF_BLOCK_SIZE;

    SaXSetPose(SA_X_POSE_MID_AIR);

    if (gSamusData.xPosition < gCurrentSprite.xPosition)
    {
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
        gSaXData.direction = KEY_LEFT;
    }
    else
    {
        gCurrentSprite.status |= SS_FACING_RIGHT;
        gSaXData.direction = KEY_RIGHT;
    }

    gCurrentSprite.work0 = 0;
}

/**
 * @brief 1ac90 | 25c | Handles the SA-X (boss) doing a variable jump height
 * 
 */
void SaXBossVariableJumpHeight(void)
{
    s16 yMovement;
    s16 xMovement;
    s32 blockTop;

    if (gCurrentSprite.work0 != 0)
    {
        if (gSaXData.pose == SA_X_POSE_STANDING)
        {
            gCurrentSprite.pose = 0x17;
            if (gCurrentSprite.status & SS_FACING_RIGHT)
            {
                if (gCurrentSprite.xParasiteTimer < 60 * 3 && gSaXVision.samusOnRight == FALSE)
                    gCurrentSprite.pose = 0x39;
            }
            else
            {
                if (gCurrentSprite.xParasiteTimer < 60 * 3 && gSaXVision.samusOnRight == TRUE)
                    gCurrentSprite.pose = 0x39;
            }
        }

        return;
    }

    xMovement = sSaXRunningSpeed[gCurrentSprite.work3 / 8] + MOD_AND(gSpriteRandomNumber, 4);

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
            gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck != COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

            if (gPreviousCollisionCheck != COLLISION_SOLID)
                gCurrentSprite.xPosition += xMovement;
        }
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
            gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck != COLLISION_SOLID)
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - QUARTER_BLOCK_SIZE,
                gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

            if (gPreviousCollisionCheck != COLLISION_SOLID)
                gCurrentSprite.xPosition -= xMovement;
        }
    }

    if (gCurrentSprite.pose == 0x4A)
    {
        xMovement = sSaXBossJumpYVelocity_3[gCurrentSprite.work4 / 4];
    }
    else if (gCurrentSprite.pose == 0x48)
    {
        xMovement = sSaXBossJumpYVelocity_2[gCurrentSprite.work4 / 4];
    }
    else
    {
        xMovement = sSaXBossJumpYVelocity_1[gCurrentSprite.work4 / 4];
    }

    if (gCurrentSprite.work4 < ARRAY_SIZE(sSaXBossJumpYVelocity_1) * 4 - 1)
        gCurrentSprite.work4++;

    gCurrentSprite.yPosition += xMovement;

    if (xMovement > 0)
    {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

        if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.yPosition = blockTop;
            gCurrentSprite.work0 = 1;
            SaXSetPose(SA_X_POSE_LANDING);
            return;
        }

        if (gCurrentSprite.work4 > 32)
        {
            gCurrentSprite.work3 = 8;

            if (gSamusData.yPosition < gCurrentSprite.yPosition)
            {
                if (gCurrentSprite.pose == 0x48)
                    gCurrentSprite.pose = 0x46;

                gCurrentSprite.work4 = 0;
            }

            if (gCurrentSprite.status & SS_FACING_RIGHT)
            {
                if (gSamusData.xPosition + (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE) < gCurrentSprite.xPosition)
                {
                    gCurrentSprite.status &= ~SS_FACING_RIGHT;
                    gSaXData.direction = KEY_LEFT;
                }
            }
            else
            {
                if (gSamusData.xPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE + PIXEL_SIZE) > gCurrentSprite.xPosition)
                {
                    gCurrentSprite.status |= SS_FACING_RIGHT;
                    gSaXData.direction = KEY_RIGHT;
                }
            }
        }
    }
    else
    {
        SpritUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
            gCurrentSprite.xPosition);

        if (gPreviousCollisionCheck == COLLISION_SOLID)
        {
            gCurrentSprite.yPosition -= xMovement;

            if (gCurrentSprite.status & SS_FACING_RIGHT)
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + QUARTER_BLOCK_SIZE,
                    gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

                if (gPreviousCollisionCheck == COLLISION_SOLID)
                    gCurrentSprite.pose = 0x15;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + QUARTER_BLOCK_SIZE,
                    gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

                if (gPreviousCollisionCheck == COLLISION_SOLID)
                    gCurrentSprite.pose = 0x15;
            }
        }
    }
}

/**
 * @brief 1aeec | 70 | Updates the mosaic for the SA-X boss
 * 
 */
void SaXBossUpdateMosaic(void)
{
    if (!gSaXData.mosaic)
        return;

    if (gSaXData.pose == SA_X_POSE_MID_AIR)
    {
        gWrittenToMosaic_H = 0;
        return;
    }

    gBossWork2++;
    if (gBossWork2 >= ARRAY_SIZE(sSaXMosaicValues))
    {
        gBossWork3--;
        if (gBossWork3 == 0)
        {
            gSaXData.mosaic = FALSE;
            return;
        }

        gBossWork2 = 0;
    }

    gWrittenToMosaic_H = sSaXMosaicValues[gBossWork2];
}

/**
 * @brief 1af5c | e8 | Initializes the SA-X (boss) to be knockbacked
 * 
 */
void SaXBossKnockbackInit(void)
{
    u16 spawnHealth;
    u16 currentHealth;
    
    gCurrentSprite.pose = 0x50;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);
    gCurrentSprite.work4 = 0;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;

    SaXSetPose(SA_X_POSE_GETTING_HURT);

    if (gSamusData.xPosition > gCurrentSprite.xPosition)
    {
        gCurrentSprite.status |= SS_FACING_RIGHT;
        gSaXData.direction = KEY_RIGHT;
    }
    else
    {
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
        gSaXData.direction = KEY_LEFT;
    }

    spawnHealth = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    currentHealth = gCurrentSprite.health;
    if (currentHealth > spawnHealth / 2)
        return;

    if (currentHealth < spawnHealth / 6)
    {
        gBossWork3 = 3;
    }
    else if (currentHealth < spawnHealth * 2 / 3)
    {
        gBossWork3 = 2;
    }
    else
    {
        gBossWork3 = 1;
    }

    gBossWork2 = 0;
    gSaXData.mosaic = TRUE;
}

/**
 * @brief 1b044 | 98 | Handles the SA-X (boss) getting knocked back
 * 
 */
void SaXBossKnockback(void)
{
    u8 offset;
    s16 movement;

    offset = gCurrentSprite.work4;
    movement = sSaXBossKnockbackYMovement[offset];

    if (movement == SHORT_MAX)
    {
        gCurrentSprite.pose = 0x43;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }

    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), 
            gCurrentSprite.xPosition - HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
            gCurrentSprite.xPosition -= QUARTER_BLOCK_SIZE / 2;
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), 
            gCurrentSprite.xPosition + HALF_BLOCK_SIZE);

        if (gPreviousCollisionCheck == COLLISION_AIR)
            gCurrentSprite.xPosition += QUARTER_BLOCK_SIZE / 2;
    }
}

/**
 * @brief 1b0dc | 54 | Initializes the SA-X (boss) to be kneeling
 * 
 */
void SaXBossKneelingInit(void)
{
    gSaXData.mosaic = FALSE;

    gCurrentSprite.pose = 0x52;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE / 2);
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;

    SaXSetPose(SA_X_POSE_KNEELING);

    gCurrentSprite.work1 = 60 * 2;
    gCurrentSprite.work2 = 60 * 2;
    gCurrentSprite.yPosition -= PIXEL_SIZE;
}

/**
 * @brief 1b130 | 40 | Handles the SA-X (boss) kneeling
 * 
 */
void SaXBossKneeling(void)
{
    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
            SaXSetPose(SA_X_POSE_TRANSFORMING_INTO_MONSTER);

        return;
    }

    gCurrentSprite.work2--;
    if (gCurrentSprite.work2 == 0)
        gCurrentSprite.pose = 0x53;
}

/**
 * @brief 1b170 | 18 | Initializes the SA-X (boss) 
 * 
 */
void SaXBossTransformingIntoMonsterInit(void)
{
    gCurrentSprite.pose = 0x54;
    gCurrentSprite.work1 = 29;
}

/**
 * @brief 1b188 | bc | Handles the SA-X (boss) transforming into the monster
 * 
 */
void SaXBossTransformingIntoMonster(void)
{
    u8 offset;
    
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 < 28)
    {
        offset = gCurrentSprite.work1;
        DMA_SET(3, &sSpritesGraphicsPointers[PSPRITE_SA_X_MONSTER - 0x10][0x200 + offset * 0x80],
            VRAM_OBJ + 0x4800 + offset * 0x200, C_32_2_16(DMA_ENABLE, 0x200 / 2));

        if (gCurrentSprite.work1 == 0)
        {
            SpriteSpawnPrimary(PSPRITE_SA_X_MONSTER, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, 0x10,
                gCurrentSprite.yPosition + PIXEL_SIZE, gCurrentSprite.xPosition, gCurrentSprite.status & SS_FACING_RIGHT);

            gCurrentSprite.pose = 0x55;
        }

        return;
    }

    if (gCurrentSprite.work1 == 28)
    {
        DMA_SET(3, sSpritesPalettePointers[PSPRITE_SA_X_MONSTER - 0x10] + 16 * 2, PALRAM_OBJ + 0x120, C_32_2_16(DMA_ENABLE, 0x70));
    }
}

/**
 * @brief 1b244 | c | Handles the SA-X (boss) after the transformation
 * 
 */
void SaXBossAfterTransformation(void)
{
    gCurrentSprite.status = 0;
}

/**
 * @brief 1b250 | 2c8 | SA-X (boss) AI
 * 
 */
void SaXBoss(void)
{
    if (gCurrentSprite.pose < 0x51)
    {
        if (SaXUpdateFreezeTimer())
            return;

        SaXSeeAndLocateSamus();

        if (SPRITE_HAS_ISFT(gCurrentSprite) == 0x10)
        {
            gCurrentSprite.pose = 0x4F;
            SoundPlay(0x9C);
        }
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SaXBossInit();
            break;

        case SPRITE_POSE_FALLING_INIT:
            SaXFallingInit();

        case SPRITE_POSE_FALLING:
            SaXFalling();
            break;

        case 0x17:
            SaXBossRunningInit();

        case 0x18:
            SaXBossRunning();
            break;

        case 0x37:
            SaXBossSpinJumpingInit();

        case 0x38:
            SaXBossSpinJumping();
            break;

        case 0x39:
            SaXBossTurningAroundChaseInit();

        case 0x3A:
            SaXBossTurningAroundChase();
            break;

        case 0x7:
            SaXStandingInit();

        case 0x8:
            SaXStanding();
            break;

        case 0x1:
            SaXWalkingInit();
            break;

        case 0x2:
            SaXWalking();
            break;

        case 0x3:
            SaXTurningAroundInit();

        case 0x4:
            SaXTurningAround();
            break;

        case 0x29:
            SaXDelayBeforeShootingBeamInit();

        case 0x2A:
            SaXDelayBeforeShootingBeam();
            break;

        case 0x2B:
            SaXShootingBeamInit();

        case 0x2C:
            SaXShootingBeam();
            break;

        case 0x2D:
            SaXDelayBeforeShootingMissileInit();

        case 0x2E:
            SaXDelayBeforeShootingMissile();
            break;

        case 0x2F:
            SaXShootingMissileInit();

        case 0x30:
            SaXShootingMissile();
            break;

        case 0x31:
            SaXDelayAfterShootingMissileInit();

        case 0x32:
            SaXDelayAfterShootingMissile();
            break;

        case 0x3B:
            SaXMorphingInit();

        case 0x3C:
            SaXMorphing();
            break;

        case 0x3D:
            SaXRollingInit();

        case 0x3E:
            SaXRolling();
            break;

        case 0x3F:
            SaXUnmorphingInit();

        case 0x40:
            SaXUnmorphing();
            break;

        case 0x41:
            SaXBossWaitingToAppearInit();

        case 0x42:
            SaXBossWaitingToAppear();
            break;

        case 0x43:
            SaxBossFallingFromKnockbackInit();

        case 0x44:
            SaxBossFallingFromKnockback();
            break;

        case 0x45:
        case 0x47:
        case 0x49:
            SaXBossVariableJumpHeightInit();

        case 0x46:
        case 0x48:
        case 0x4A:
            SaXBossVariableJumpHeight();
            break;

        case 0x4F:
            SaXBossKnockbackInit();

        case 0x50:
            SaXBossKnockback();
            break;

        case 0x51:
            SaXBossKneelingInit();

        case 0x52:
            SaXBossKneeling();
            break;

        case 0x53:
            SaXBossTransformingIntoMonsterInit();

        case 0x54:
            SaXBossTransformingIntoMonster();
            break;

        case 0x55:
            SaXBossAfterTransformation();
    }

    if (gSaXData.pose == SA_X_POSE_MID_AIR)
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
    else
        gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;

    SaXBossUpdateMosaic();
    SaXUpdateGraphics();
}
