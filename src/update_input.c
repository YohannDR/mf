#include "globals.h"
#include "gba.h"

/**
 * @brief a2c | 38 | Updates the input
 * 
 */
void UpdateInput(void)
{
    u16 keys;

    keys = KEY_MASK & ~read16(REG_KEY_INPUT);
    gChangedInput = keys & ~gButtonInputCopy;
    gButtonInput = keys;
    gButtonInputCopy = keys;
}
