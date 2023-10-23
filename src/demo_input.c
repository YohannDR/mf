#include "demo_input.h"
#include "gba.h"
#include "globals.h"

#include "constants/demo.h"

#include "structs/demo.h"

/**
 * @brief c9e0 | 20 | Main loop for a demo
 * 
 */
void DemoMainLoop(void)
{
    if (gDemoState == DEMO_STATE_RECORDING)
        RecordDemo();
    else if (gDemoState == DEMO_STATE_PLAYING)
        UpdateDemoInput();
}

/**
 * @brief ca00 | 88 | Records a demo
 * 
 */
void RecordDemo(void)
{
    // Max duration - 2 to leave space for the KEY_START at the end
    if (gDemoInputCounter >= DEMO_MAX_DURATION - 2)
    {
        // Reached max demo duration, force the end
        gChangedInput = KEY_START;
        return;
    }

    if (gButtonInput == gDemoInputs[gDemoInputCounter])
    {
        // Same input as before
        if (gDemoInputDurations[gDemoInputCounter] == USHORT_MAX)
        {
            // Held input for more than USHORT_MAX frames, delegate to next slot
            gDemoInputCounter++;
            gDemoInputs[gDemoInputCounter] = gButtonInput;
        }

        // Increase timer
        gDemoInputDurations[gDemoInputCounter]++;
        return;
    }

    // New input detected, setup next slot
    gDemoInputCounter++;
    gDemoInputs[gDemoInputCounter] = gButtonInput;
    gDemoInputDurations[gDemoInputCounter] = 1;
}

/**
 * @brief ca88 | 90 | Updates the demo input
 * 
 */
void UpdateDemoInput(void)
{
    // Max duration - 2 to leave space for the KEY_START at the end
    if (gDemoInputCounter >= DEMO_MAX_DURATION - 2 || gDemoInputTimer == USHORT_MAX || gButtonInput != KEY_NONE)
    {
        gChangedInput = KEY_START;
        if (gButtonInput != KEY_NONE)
            gButtonInput = KEY_NONE;
        return;
    }

    if (gDemoInputTimer == 0)
    {
        // Input timer ended
        gDemoInputCounter++;
        gDemoInputTimer = gDemoInputDurations[gDemoInputCounter];
    }

    // Inlined call to CopyDemoInput ?
    // Copy to button input
    gButtonInput = gDemoInputs[gDemoInputCounter];
    // Set changed input
    gChangedInput = (gDemoInput ^ gButtonInput) & gButtonInput;
    // Set demo input
    gDemoInput = gButtonInput;
    // Update input timer
    gDemoInputTimer--;
}

/**
 * @brief cb18 | 34 | Copies the demo input
 * 
 */
void CopyDemoInput(void)
{
    // Copy to button input
    gButtonInput = gDemoInputs[gDemoInputCounter];
    // Set changed input
    gChangedInput = (gDemoInput ^ gButtonInput) & gButtonInput;
    // Set demo input
    gDemoInput = gButtonInput;
}

/**
 * @brief cb4c | 6c | Resets a demo (input and duration)
 * 
 */
void ResetDemoInputAndDuration(void)
{
    s32 i;
    if (gDemoState == DEMO_STATE_RECORDING)
    {
        // Clear both input and duration to leave space to record 
        for (i = 0; i < DEMO_MAX_DURATION; i++)
        {
            gDemoInputs[i] = KEY_NONE;
            gDemoInputDurations[i] = 0;
        }

        gDemoInputTimer = 0;
    }
    else
    {
        // Set first timer
        gDemoInputTimer = gDemoInputDurations[0];
    }

    gDemoInputCounter = 0;
    gDemoInput = KEY_NONE;
}
