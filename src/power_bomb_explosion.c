#include "power_bomb_explosion.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "constants/clipdata.h"

#include "structs/clipdata.h"
#include "structs/power_bomb.h"

/**
 * @brief 680e0 | 38 | Subroutine for the power bomb explosion
 * 
 */
void PowerBombExplosionProcess(void)
{
    if (gCurrentPowerBomb.animationState == 0 || gCurrentPowerBomb.animationState == 1)
        return;

    PowerBombExplosionSet0x12To0();
    if (!gCurrentPowerBomb.unk_12) // Most likely a cancelled feature
    {
        if (gCurrentPowerBomb.animationState == 2)
            PowerBombExplosionBegin();
        else if (gCurrentPowerBomb.animationState == 5)
            PowerBombExplosionEnd();
        else
            PowerBombExplosion();
    }
}

/**
 * @brief 68118 | 29c | Updates the power bomb explosion, handles interacting with blocks
 * 
 */
void PowerBombExplosion(void)
{
    s16 hitboxLeft;
    s16 hitboxRight;
    s16 hitboxTop;
    s16 hitboxBottom;
    s32 verticalAxis;
    s32 horizontalAxis;
    s32 i;
    s32 j;
    s32 clipdata;
    s16 yPositionTop;
    s16 yPositionBottom;

    verticalAxis = gCurrentPowerBomb.semiMinorAxis * 4;
    horizontalAxis = gCurrentPowerBomb.semiMinorAxis * 8;

    verticalAxis *= .95;
    horizontalAxis *= .95;

    hitboxLeft = -horizontalAxis;
    hitboxRight = horizontalAxis;
    hitboxTop = -verticalAxis;
    hitboxBottom = verticalAxis;

    if (gCurrentPowerBomb.xPosition + hitboxLeft < 0)
        hitboxLeft = -gCurrentPowerBomb.xPosition;

    if (gCurrentPowerBomb.yPosition + hitboxTop < 0)
        hitboxTop = -gCurrentPowerBomb.yPosition;

    if (BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataWidth) < gCurrentPowerBomb.xPosition + hitboxRight)
        hitboxRight = BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataWidth) - gCurrentPowerBomb.xPosition;

    if (BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataHeight) < gCurrentPowerBomb.yPosition + hitboxBottom)
        hitboxBottom = BLOCK_TO_SUB_PIXEL(gBackgroundsData.clipdataHeight) - gCurrentPowerBomb.yPosition;

    gCurrentPowerBomb.hitboxLeft = hitboxLeft;
    gCurrentPowerBomb.hitboxRight = hitboxRight;
    gCurrentPowerBomb.hitboxTop = hitboxTop;
    gCurrentPowerBomb.hitboxBottom = hitboxBottom;

    if (gCurrentPowerBomb.animationState >= 4)
        return;

    hitboxLeft = DIV_SHIFT(hitboxLeft + gCurrentPowerBomb.xPosition, BLOCK_SIZE);
    hitboxRight = DIV_SHIFT(hitboxRight + gCurrentPowerBomb.xPosition, BLOCK_SIZE);
    hitboxTop = DIV_SHIFT(hitboxTop + gCurrentPowerBomb.yPosition, BLOCK_SIZE);
    hitboxBottom = DIV_SHIFT(hitboxBottom + gCurrentPowerBomb.yPosition, BLOCK_SIZE);

    if (MOD_AND(gFrameCounter8Bit, 2) == 0)
    {
        gCurrentClipdataAffectingAction = CAA_POWER_BOMB;

        for (i = 0; i < 2; i++)
        {
            if (i == 0)
                horizontalAxis = hitboxLeft;
            else
                horizontalAxis = hitboxRight;

            yPositionBottom = (hitboxBottom + hitboxTop) >> 1;
            yPositionTop = yPositionBottom;

            j = 0;
            while (j != 2)
            {
                j = 0;
                if (yPositionTop >= hitboxTop)
                {
                    clipdata = gBackgroundsData.pClipDecomp[yPositionTop * gBackgroundsData.clipdataWidth + horizontalAxis];
                    if (clipdata != 0)
                        BlockApplyCCAA(yPositionTop, horizontalAxis, clipdata);

                    yPositionTop--;
                }
                else
                    j = 0x1;
                
                if ((s32)yPositionBottom <= hitboxBottom)
                {
                    clipdata = gBackgroundsData.pClipDecomp[yPositionBottom * gBackgroundsData.clipdataWidth + horizontalAxis];
                    if (clipdata != 0)
                        BlockApplyCCAA(yPositionBottom, horizontalAxis, clipdata);

                    yPositionBottom++;
                }
                else
                    j++;
            }
        }
    }
    else
    {
        gCurrentClipdataAffectingAction = CAA_POWER_BOMB;

        if (gFrameCounter8Bit & 2)
            verticalAxis = hitboxBottom;
        else
            verticalAxis = hitboxTop;

        yPositionBottom = (hitboxRight + hitboxLeft) >> 1;
        yPositionTop = yPositionBottom;

        j = 0;
        while (j != 2)
        {
            j = 0;
            if (yPositionTop >= hitboxLeft)
            {
                clipdata = gBackgroundsData.pClipDecomp[verticalAxis * gBackgroundsData.clipdataWidth + yPositionTop];
                if (clipdata != 0)
                    BlockApplyCCAA(verticalAxis, yPositionTop, clipdata);

                yPositionTop--;
            }
            else
                j = 0x1;
            
            if ((s32)yPositionBottom <= hitboxRight)
            {
                clipdata = gBackgroundsData.pClipDecomp[verticalAxis * gBackgroundsData.clipdataWidth + yPositionBottom];
                if (clipdata != 0)
                    BlockApplyCCAA(verticalAxis, yPositionBottom, clipdata);

                yPositionBottom++;
            }
            else
                j++;
        }
    }

    gCurrentClipdataAffectingAction = CAA_NONE;
}

/**
 * @brief 683b4 | 48 | Starts a power bomb explosion at the given parameters
 * 
 * @param xPosition The X Position of the epicenter
 * @param yPosition The Y Position of the epicenter
 * @param owner Owner of the power bomb
 */
void PowerBombExplosionStart(u16 xPosition, u16 yPosition, u8 owner)
{
    if (gSubGameMode1 != SUB_GAME_MODE_PLAYING)
        return;

    PowerBombExplosionSet0x12To0();

    // Check if there isn't already an explosion
    if (gCurrentPowerBomb.animationState == 0)
    {
        gCurrentPowerBomb.xPosition = xPosition;
        gCurrentPowerBomb.yPosition = yPosition;
        gCurrentPowerBomb.ownedBySaX = owner;

        if (gCurrentPowerBomb.unk_12)
            gCurrentPowerBomb.animationState = 2;
        else
            PowerBombExplosionBegin();
    }
}

/**
 * @brief 683fc | c | Sets the field at offset 0x12 of the current power bomb to 0x0, purpose is unknown
 * 
 */
void PowerBombExplosionSet0x12To0(void)
{
    gCurrentPowerBomb.unk_12 = FALSE;
}

/**
 * @brief 68408 | 60 | Begins a power bomb explosion
 * 
 */
void PowerBombExplosionBegin(void)
{
    gCurrentPowerBomb.animationState = 3;
    gCurrentPowerBomb.powerBombPlaced = FALSE;

    DMA_SET(3, PALRAM_BASE, EWRAM_BASE + 0x35400, C_32_2_16(DMA_ENABLE, PALRAM_SIZE / 4));
    write16(EWRAM_BASE + 0x35400, COLOR_WHITE);

    HazeSetupCode(0x8);

    gCurrentPowerBomb.unk_1 = 0;
    gCurrentPowerBomb.semiMinorAxis = 0x4;

    gCurrentPowerBomb.hitboxLeft = 0;
    gCurrentPowerBomb.hitboxRight = 0;
    gCurrentPowerBomb.hitboxTop = 0;
    gCurrentPowerBomb.hitboxBottom = 0;

    gCurrentPowerBomb.unk_12 = 0;
    gCurrentPowerBomb.unk_3 = 0;

    ScreenShakeStartHorizontal(120, 0x80);

    SoundPlay(0xE0); // Power bomb explosion
}

void PowerBombExplosionEnd(void)
{

}
