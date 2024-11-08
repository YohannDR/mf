#include "escape.h"
#include "globals.h"
#include "gba.h"

#include "data/hud_data.h"

#include "constants/event.h"

#include "structs/escape.h"
#include "structs/samus.h"

/**
 * @brief 72788 | 344 | Plays the escape sounds (at specific timings)
 * 
 */
void EscapePlaySound(void)
{
    u8 escape;

    escape = EventCheckOn_Escape();

    switch (gEscapeTimerDigits.secondsOnes)
    {
        case 0:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes) == 0)
            {
                if (gEscapeTimerDigits.secondsTens == 0)
                    SoundPlay(0x2C6);
                else if (gEscapeTimerDigits.secondsTens == 1)
                    SoundPlay(0x2BC);
            }
            break;

        case 1:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes | gEscapeTimerDigits.secondsTens) == 0)
                SoundPlay(0x2C5);
            break;

        case 2:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes | gEscapeTimerDigits.secondsTens) == 0)
                SoundPlay(0x2C4);
            break;

        case 3:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes | gEscapeTimerDigits.secondsTens) == 0)
                SoundPlay(0x2C3);
            break;

        case 4:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes | gEscapeTimerDigits.secondsTens) == 0)
                SoundPlay(0x2C2);
            break;

        case 5:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes | gEscapeTimerDigits.secondsTens) == 0)
                SoundPlay(0x2C1);
            break;

        case 6:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes | gEscapeTimerDigits.secondsTens) == 0)
                SoundPlay(0x2C0);
            break;

        case 7:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes | gEscapeTimerDigits.secondsTens) == 0)
                SoundPlay(0x2BF);
            break;

        case 8:
            if ((gEscapeTimerDigits.minutesTens | gEscapeTimerDigits.minutesOnes | gEscapeTimerDigits.secondsTens) == 0)
                SoundPlay(0x2BE);
            break;

        case 9:
            if (gEscapeTimerDigits.minutesTens != 0)
                break;

            if (gEscapeTimerDigits.secondsTens == 5)
            {
                if (gEscapeTimerDigits.minutesOnes == 5)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D0);
                }
                else if (gEscapeTimerDigits.minutesOnes == 4)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D1);
                }
                else if (gEscapeTimerDigits.minutesOnes == 3)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D2);
                }
                else if (gEscapeTimerDigits.minutesOnes == 2)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D3);
                }
                else if (gEscapeTimerDigits.minutesOnes == 1)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D4);
                    else if (escape == ESCAPE_ORBIT_CHANGE)
                        SoundPlay(0x2E3);
                }
                else if (gEscapeTimerDigits.minutesOnes == 0)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D5);
                    else if (escape == ESCAPE_ORBIT_CHANGE)
                        SoundPlay(0x2E4);
                }
            }
            else if (gEscapeTimerDigits.minutesOnes == 0)
            {
                if (gEscapeTimerDigits.secondsTens == 4)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D6);
                    else if (escape == ESCAPE_RESTRICTED_LAB)
                        SoundPlay(0x2CB);
                    else if (escape == ESCAPE_ORBIT_CHANGE)
                        SoundPlay(0x2E5);
                }
                else if (gEscapeTimerDigits.secondsTens == 3)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D7);
                    else if (escape == ESCAPE_RESTRICTED_LAB)
                        SoundPlay(0x2CC);
                    else if (escape == ESCAPE_ORBIT_CHANGE)
                        SoundPlay(0x2E6);
                }
                else if (gEscapeTimerDigits.secondsTens == 2)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D8);
                    else if (escape == ESCAPE_RESTRICTED_LAB)
                        SoundPlay(0x2CD);
                    else if (escape == ESCAPE_ORBIT_CHANGE)
                        SoundPlay(0x2E7);
                }
                else if (gEscapeTimerDigits.secondsTens == 1)
                {
                    if (escape == ESCAPE_MELTDOWN)
                        SoundPlay(0x2D9);
                    else if (escape == ESCAPE_RESTRICTED_LAB)
                        SoundPlay(0x2CE);
                    else if (escape == ESCAPE_ORBIT_CHANGE)
                        SoundPlay(0x2E8);
                }
                else if (gEscapeTimerDigits.secondsTens == 0)
                {
                    SoundPlay(0x2BD);
                }
            }
            break;
    }
}

/**
 * @brief 72acc | 38 | Updates the OAM of the escape digits
 * 
 */
void EscapeUpdateOam(void)
{
    s32 baseTile;

    // Palette row 15, start tile of 0x3C0
    baseTile = (15 << 12) + 0x3C0;

    // Update the attribute 2 of each digit, ignore slots 2 and 5 as those are the ":" symbol and don't need to be updated
    gEscapeDigitsOam[1 + OAM_PART_SIZE * 7 + 2] = gEscapeTimerDigits.hundredths + baseTile;
    gEscapeDigitsOam[1 + OAM_PART_SIZE * 6 + 2] = gEscapeTimerDigits.tenths + baseTile;

    gEscapeDigitsOam[1 + OAM_PART_SIZE * 4 + 2] = gEscapeTimerDigits.secondsOnes + baseTile;
    gEscapeDigitsOam[1 + OAM_PART_SIZE * 3 + 2] = gEscapeTimerDigits.secondsTens + baseTile;

    gEscapeDigitsOam[1 + OAM_PART_SIZE * 1 + 2] = gEscapeTimerDigits.minutesOnes + baseTile;
    gEscapeDigitsOam[1 + OAM_PART_SIZE * 0 + 2] = gEscapeTimerDigits.minutesTens + baseTile;
}

/**
 * @brief 72b04 | 48 | Checks if the escape digits graphics should reload
 * 
 */
void EscapeCheckReloadGraphics(void)
{
    if (EventCheckOn_Escape() != ESCAPE_NONE)
    {
        DMA_SET(3, sEscapeDigitsGfx, VRAM_OBJ + 0x7800, C_32_2_16(DMA_ENABLE, sizeof(sEscapeDigitsGfx) / sizeof(u16)));
        DMA_SET(3, sEscapeDigitsPal, PALRAM_OBJ + 0x1E0, C_32_2_16(DMA_ENABLE, 16));
    }
}

/**
 * @brief 72b4c | 64 | Starts an escape
 * 
 */
void EscapeStart(void)
{
    // FIXME Load graphics
    DMA_SET(3, sEscapeDigitsGfx, VRAM_OBJ + 0x7800, C_32_2_16(DMA_ENABLE, sizeof(sEscapeDigitsGfx) / sizeof(u16)));
    DMA_SET(3, sEscapeDigitsPal, PALRAM_OBJ + 0x1E0, C_32_2_16(DMA_ENABLE, 16));

    // Load oam
    DMA_SET(3, sEscapeDigitsOam, gEscapeDigitsOam, C_32_2_16(DMA_ENABLE, ARRAY_SIZE(gEscapeDigitsOam)));

    // Escape timer uses absolute position, which isn't converted to pixel coordinates when drawing,
    // hence pixel coordinates are used when creating it
    ParticleSet(SUB_PIXEL_TO_PIXEL(PIXEL_SIZE * 2),
        SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 9 - QUARTER_BLOCK_SIZE), 0x46);
}

/**
 * @brief 72bb0 | 98 | Sets the escape timer digits
 * 
 */
void EscapeSetDigits(void)
{
    u8 escape;

    escape = EventCheckOn_Escape();

    gEscapeTimerCounter = UCHAR_MAX;

    if (escape == ESCAPE_MELTDOWN)
    {
        CREATE_ESCAPE_TIMER(6, 0, 0);
    }
    else if (escape == ESCAPE_RESTRICTED_LAB)
    {
        CREATE_ESCAPE_TIMER(1, 0, 0);
        SoundPlay(0x2CA);
    }
    else if (escape == ESCAPE_ORBIT_CHANGE)
    {
        CREATE_ESCAPE_TIMER(3, 0, 0);
        SoundPlay(0x2DA);
    }
    else
    {
        CREATE_ESCAPE_TIMER(99, 99, 99);
    }
}

/**
 * @brief 72c48 | 108 | Updates the escape timer
 * 
 */
void EscapeUpdate(void)
{
    u32 counter;

    if (EventCheckOn_Escape() == ESCAPE_NONE || gEscapeStatus != ESCAPE_STATUS_HAPPENNING)
    {
        gEscapeStatus = ESCAPE_STATUS_NONE;
        return;
    }

    if (gSubGameMode1 != SUB_GAME_MODE_PLAYING)
        return;

    if (gPreventMovementTimer != 0)
        return;

    counter = ++gEscapeTimerCounter;

    if (counter % 2)
    {
        if (gEscapeTimerDigits.hundredths > 1)
        {
            gEscapeTimerDigits.hundredths -= 2;
        }
        else
        {
            gEscapeTimerDigits.hundredths += 8;

            if (gEscapeTimerDigits.tenths != 0)
                gEscapeTimerDigits.tenths--;
            else
                gEscapeTimerDigits.tenths = 9;
        }
    }
    else
    {
        if (gEscapeTimerDigits.hundredths != 0)
        {
            gEscapeTimerDigits.hundredths--;
        }
        else
        {
            gEscapeTimerDigits.hundredths = 9;

            if (gEscapeTimerDigits.tenths != 0)
                gEscapeTimerDigits.tenths--;
            else
                gEscapeTimerDigits.tenths = 9;
        }
    }

    if (counter % 64 == 0)
    {
        gEscapeTimerDigits.hundredths = 99 / 10;
        gEscapeTimerDigits.tenths = 99 % 10;

        if (gEscapeTimerDigits.secondsOnes != 0)
        {
            gEscapeTimerDigits.secondsOnes--;
            EscapePlaySound();
            return;
        }

        gEscapeTimerDigits.secondsOnes = 9;

        if (gEscapeTimerDigits.secondsTens != 0)
        {
            gEscapeTimerDigits.secondsTens--;
        }
        else
        {
            gEscapeTimerDigits.secondsTens = 5;
            if (gEscapeTimerDigits.minutesOnes != 0)
            {
                gEscapeTimerDigits.minutesOnes--;
            }
            else
            {
                gEscapeTimerDigits.minutesOnes = 9;
                if (gEscapeTimerDigits.minutesTens == 0)
                {
                    CREATE_ESCAPE_TIMER(0, 0, 0);
                    gEscapeStatus = ESCAPE_STATUS_FAILED;
                    return;
                }
                else
                {
                    gEscapeTimerDigits.minutesTens--;
                }
            }
        }

        EscapePlaySound();
    }
}
