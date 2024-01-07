#include "menus/title_screen.h"
#include "constants/menus/title_screen.h"
#include "macros.h"
#include "globals.h"

s32 unk_86854(void)
{

}

void unk_8690c(void)
{

}

void TitleScreenVblank(void)
{

}

/**
 * @brief 86b4c | c | Title screen, empty v-blank
 * 
 */
void TitleScreenVblank_Empty(void)
{
    UpdateAudio();
}

s32 unk_86b58(void)
{

}

u8 TitleScreenSetupObject(u8 section, u16 xPosition, u16 yPosition)
{

}

void unk_86cf0(struct TitleScreenObject* pObject)
{

}

void TitleScreenProcessPressStart(struct TitleScreenObject* pObject)
{

}

/**
 * @brief 86e50 | 44 | Process the language object
 * 
 * @param pObject Title screen object pointer
 */
void TitleScreenProcessLanguage(struct TitleScreenObject* pObject)
{
    const struct FrameData* pOam;

    pOam = &pObject->pOam[pObject->currentAnimationFrame];

    if (pOam->timer == pObject->animationDurationCounter)
        pOam++;

    if (pOam->timer == 0)
    {
        pObject->callSubroutine = FALSE;
        pObject->isDrawn = FALSE;
    }

    if (pObject->unk_9 < 14)
    {
        pObject->unk_9++;
        return;
    }

    if (pObject->unk_9 == 14)
    {
        TitleScreenSetupObject(TITLE_SCREEN_SECTION_4, SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 7), SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 5));
        pObject->unk_9++;
    }
}

/**
 * @brief 86e94 | 24 | To document
 * 
 * @param pObject Title screen object pointer
 */
void unk_86e94(struct TitleScreenObject* pObject)
{
    const struct FrameData* pOam;

    pOam = &pObject->pOam[pObject->currentAnimationFrame];

    if (pOam->timer == pObject->animationDurationCounter)
        pOam++;

    if (pOam->timer == 0)
    {
        pObject->callSubroutine = FALSE;
        pObject->isDrawn = FALSE;
    }
}

/**
 * @brief 86eb8 | 40 | Draws all the title screen objects
 * 
 */
void TitleScreenDrawAllObjects(void)
{
    u8 i;

    for (i = 0; i < ARRAY_SIZE(TITLE_SCREEN_DATA.objects); i++)
    {
        if (TITLE_SCREEN_DATA.objects[i].isDrawn)
            TitleScreenDrawObject(&TITLE_SCREEN_DATA.objects[i]);
    }

    ResetFreeOam();
    gNextOamSlot = 0;
}

/**
 * @brief 86ef8 | d8 | Draws a title screen object
 * 
 * @param pObject Title screen object pointer
 */
void TitleScreenDrawObject(struct TitleScreenObject* pObject)
{
    u16* dst;
    const u16* src;
    const struct FrameData* pOam;
    s32 i;
    s32 partCount;
    s32 offset;
    u16 part1;
    u16 part2;

    dst = (u16*)&gOamData[gNextOamSlot];
    pOam = &pObject->pOam[pObject->currentAnimationFrame];

    if (pOam->timer == pObject->animationDurationCounter)
    {
        pObject->currentAnimationFrame++;
        pObject->animationDurationCounter = 0;

        pOam++;
    }

    if (pOam->timer == 0)
    {
        pOam -= pObject->currentAnimationFrame;

        pObject->currentAnimationFrame = 0;
    }

    src = pOam->pFrame;
    partCount = *src++;

    for (i = 0; i < partCount; i++)
    {
        part1 = *src++;
        part2 = *src++;

        *dst++ = part1;
        *dst++ = part2;

        *dst++ = *src++;

        offset = gNextOamSlot + i;
        gOamData[offset].split.y = part1 + pObject->yPosition;
        gOamData[offset].split.x = MOD_AND(part2 + pObject->xPosition, 512);
        gOamData[offset].split.objMode = pObject->objMode;

        dst++;
    }

    gNextOamSlot += partCount;
    pObject->animationDurationCounter++;
}

/**
 * @brief 86fd0 | 3c | Calls the subroutine of all the title screen objects
 * 
 */
void TitleScreenCallObjectsSubroutine(void)
{
    u8 i;

    for (i = 0; i < ARRAY_SIZE(TITLE_SCREEN_DATA.objects); i++)
    {
        if (TITLE_SCREEN_DATA.objects[i].callSubroutine)
            TITLE_SCREEN_DATA.objects[i].pSubroutine(&TITLE_SCREEN_DATA.objects[i]);
    }
}

/**
 * @brief 8700c | 4 | Processes the copyright object
 * 
 * @param pObject Title screen object pointer
 */
void TitleScreenProcessCopyright(struct TitleScreenObject* pObject)
{
    return;
}

void TitleScreenInit(void)
{

}

s32 TitleScreenSpawningIn(void)
{

}

s32 TitleScreenSubroutine(void)
{

}

void TitleScreenLoadDebugText(const u8* src, u16* dst, u8 palette)
{

}
