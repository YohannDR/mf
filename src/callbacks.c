#include "callbacks.h"

#include "gba.h"
#include "globals.h"
#include "io.h"

/**
 * @brief b5c | 18 | Calls the v-blank callback
 * 
 */
void CallbackCallVblank(void)
{
    if (gVBlankCallback)
        gVBlankCallback();

    write16(REG_IF, read16(REG_IF) | IF_VBLANK);
    gVBlankRequestFlag = TRUE;
}

/**
 * @brief b88 | 1c | Sets the v-blank callback
 * 
 * @param callback Callback pointer
 */
void CallbackSetVBlank(Func_T callback)
{
    gVBlankCallback = callback;

    if (callback == NULL)
    {
        // Prevent null pointer
        gVBlankCallback = Callback_Empty;
    }
}

/**
 * @brief ba4 | 24 | Calls the h-blank callback
 * 
 */
void CallbackCallHBlank(void)
{
    if (gHBlankCallback)
        gHBlankCallback();

    write16(REG_IF, read16(REG_IF) | IF_HBLANK);
}

/**
 * @brief bc8 | 1c | Sets the h-blank callback
 * 
 * @param callback Callback pointer
 */
void CallbackSetHBlank(Func_T callback)
{
    gHBlankCallback = callback;

    if (callback == NULL)
    {
        // Prevent null pointer
        gHBlankCallback = Callback_Empty;
    }
}

/**
 * @brief be4 | 24 | Calls the v-count callback
 * 
 */
void CallbackCallVCount(void)
{
    if (gVCountCallback)
        gVCountCallback();

    write16(REG_IF, read16(REG_IF) | IF_VCOUNT);
}

/**
 * @brief c08 | 1c | Sets the v-count callback
 * 
 * @param callback Callback pointer
 */
void CallbackSetVCount(Func_T callback)
{
    gVCountCallback = callback;

    if (callback == NULL)
    {
        // Prevent null pointer
        gVCountCallback = Callback_Empty;
    }
}

/**
 * @brief c24 | 4 | Empty callback
 * 
 */
void Callback_Empty(void)
{
    return;
}
