#include "menus/title_screen.h"
#include "gba.h"
#include "macros.h"
#include "globals.h"
#include "callbacks.h"

#include "data/menus/title_screen.h"
#include "data/menus/internal_title_screen_data.h"

#include "constants/menus/title_screen.h"

/**
 * @brief 86854 | b8 | To document
 * 
 * @return s32 To document
 */
s32 unk_86854(void)
{
    s32 ended;

    ended = FALSE;

    switch (gSubGameMode1)
    {
        case 0:
            unk_8690c();
            gSubGameMode1++;
            break;

        case 1:
            if (gWrittenToBldy != 0)
            {
                if (gWrittenToBldy < 9)
                {
                    TITLE_SCREEN_DATA.unk_0++;

                    if (TITLE_SCREEN_DATA.unk_0 == 2)
                    {
                        TITLE_SCREEN_DATA.unk_0 = 0;
                        gWrittenToBldy--;
                    }
                }
                else
                {
                    gWrittenToBldy--;
                }
            }
            else
            {
                TITLE_SCREEN_DATA.unk_0 = 1995;
                gSubGameMode1++;
            }
            break;

        case 2:
            if (unk_86b58())
                gSubGameMode1++;
            break;

        case 3:
            TitleScreenCallObjectsSubroutine();
            TitleScreenDrawAllObject();

            if (gWrittenToBldy < BLDY_MAX_VALUE)
            {
                gWrittenToBldy++;
            }
            else
            {
                if (TITLE_SCREEN_DATA.unk_4 == 0x1)
                    ended = 0x64;
                else
                    ended = TRUE;

                gSubGameMode1 = 0;
            }
            break;
    }

    return ended;
}

void unk_8690c(void)
{

}

/**
 * @brief 86b00 | 4c | V-blank for the title screen
 * 
 */
void TitleScreenVblank(void)
{
    DMA_SET(3, gOamData, OAM_BASE, C_32_2_16(DMA_ENABLE | DMA_32BIT, OAM_SIZE / 4));

    write16(REG_BLDALPHA, C_16_2_8(gWrittenToBldalpha_L, gWrittenToBldalpha_R));
    write16(REG_BLDY, gWrittenToBldy);
}

/**
 * @brief 86b4c | c | Title screen, empty v-blank
 * 
 */
void TitleScreenVblank_Empty(void)
{
    UpdateAudio();
}

/**
 * @brief 86b58 | 94 | To document
 * 
 * @return s32 bool, ended
 */
s32 unk_86b58(void)
{
    s32 ended;

    ended = FALSE;

    TitleScreenCallObjectsSubroutine();
    TitleScreenDrawAllObjects();

    switch (TITLE_SCREEN_DATA.unk_5)
    {
        case 0:
            TITLE_SCREEN_DATA.unk_0++;
            TITLE_SCREEN_DATA.unk_2++;
            if (TITLE_SCREEN_DATA.unk_0 == 2000)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
            }

            if (gChangedInput & (KEY_A | KEY_START))
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
                TITLE_SCREEN_DATA.unk_2 = 0;
                TITLE_SCREEN_DATA.unk_5 = 1;

                SoundPlay(0x1FF);
            }
            else if (TITLE_SCREEN_DATA.unk_2 == 1200)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
                TITLE_SCREEN_DATA.unk_2 = 0;
                TITLE_SCREEN_DATA.unk_4 = 1;
                write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);
                ended = TRUE;
            }
            break;

        case 1:
            TITLE_SCREEN_DATA.unk_0++;
            if (TITLE_SCREEN_DATA.unk_0 > 34)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
                write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);
                ended = TRUE;
            }
            break;

        default:
            ended = TRUE;
    }

    return ended;
}

/**
 * @brief 86bec | 104 | Sets up a title screen object
 * 
 * @param section Section
 * @param xPosition X position
 * @param yPosition Y position
 * @return u8 Allocated slot (size of the array if not allocated)
 */
u8 TitleScreenSetupObject(u8 section, u16 xPosition, u16 yPosition)
{
    u8 i;
    u32 zero;

    for (i = 0; i < ARRAY_SIZE(TITLE_SCREEN_DATA.objects); i++)
    {
        if (TITLE_SCREEN_DATA.objects[i].section == TITLE_SCREEN_SECTION_NONE)
            break;
    }

    if (i >= ARRAY_SIZE(TITLE_SCREEN_DATA.objects))
        return ARRAY_SIZE(TITLE_SCREEN_DATA.objects);

    zero = 0;
    DMA_SET(3, &zero, &TITLE_SCREEN_DATA.objects[i], C_32_2_16(DMA_ENABLE | DMA_32BIT | DMA_SRC_FIXED, sizeof(struct TitleScreenObject) / sizeof(u32)));

    TITLE_SCREEN_DATA.objects[i].xPosition = xPosition;
    TITLE_SCREEN_DATA.objects[i].yPosition = yPosition;
    TITLE_SCREEN_DATA.objects[i].section = section;
    TITLE_SCREEN_DATA.objects[i].isDrawn = TRUE;

    if (section == TITLE_SCREEN_SECTION_COPYRIGHT)
    {
        TITLE_SCREEN_DATA.objects[i].pOam = sTitleScreenOam_Copyright;
        TITLE_SCREEN_DATA.objects[i].pSubroutine = TitleScreenProcessCopyright;
    }
    else if (section == TITLE_SCREEN_SECTION_PRESS_START)
    {
        TITLE_SCREEN_DATA.objects[i].pOam = sTitleScreenOam_PressStart;
        TITLE_SCREEN_DATA.objects[i].pSubroutine = TitleScreenProcessPressStart;
    }
    else if (section == TITLE_SCREEN_SECTION_LANGUAGE)
    {
        TITLE_SCREEN_DATA.objects[i].pOam = sTitleScreenOam_Language;
        TITLE_SCREEN_DATA.objects[i].pSubroutine = TitleScreenProcessLanguage;
    }
    else if (section == TITLE_SCREEN_SECTION_4)
    {
        TITLE_SCREEN_DATA.objects[i].pOam = sTitleScreenOam_597418;
        TITLE_SCREEN_DATA.objects[i].pSubroutine = unk_86e94;
    }

    return i;
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
        pObject->section = FALSE;
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
        pObject->section = FALSE;
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
        if (TITLE_SCREEN_DATA.objects[i].section != TITLE_SCREEN_SECTION_NONE)
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

/**
 * @brief 87010 | 1dc | Initializes the title screen
 * 
 */
void TitleScreenInit(void)
{
    u32 zero;

    write16(REG_IME, FALSE);
    write16(REG_DISPSTAT, read16(REG_DISPSTAT) & ~DSTAT_IF_HBLANK);
    write16(REG_IE, read16(REG_IE) & ~IF_HBLANK);
    write16(REG_IME, TRUE);

    CallbackSetVBlank(TitleScreenVblank_Empty);

    write16(REG_DISPCNT, 0);

    zero = 0;
    DMA_SET(3, &zero, &gNonGameplayRam, C_32_2_16(DMA_ENABLE | DMA_32BIT | DMA_SRC_FIXED, sizeof(gNonGameplayRam) / sizeof(u32)));

    unk_24ec(0x1000000);

    gWrittenToBldy = BLDY_MAX_VALUE;
    write16(REG_BLDY, BLDY_MAX_VALUE);

    gNextOamSlot = 0;
    ResetFreeOam();

    write16(REG_BG3CNT, 0);
    write16(REG_BG2CNT, 0);
    write16(REG_BG1CNT, 0);
    write16(REG_BG0CNT, 0);

    write16(REG_BG0HOFS, 0);
    write16(REG_BG0VOFS, 0);
    write16(REG_BG1HOFS, 0);
    write16(REG_BG1VOFS, 0);
    write16(REG_BG2HOFS, 0);
    write16(REG_BG2VOFS, 0);
    write16(REG_BG3HOFS, 0);
    write16(REG_BG3VOFS, 0);

    write16(REG_BG2X, 0);
    write16(REG_BG2X + 2, 0);
    write16(REG_BG2Y, 0);
    write16(REG_BG2Y + 2, 0);

    LZ77UncompVram(sTitleScreenSpaceBackgroundGfx, VRAM_BASE + BGCNT_VRAM_CHAR_SIZE * 0);
    LZ77UncompVram(sTitleScreenLogoGfx, VRAM_BASE + BGCNT_VRAM_CHAR_SIZE * 2);
    LZ77UncompVram(sTitleScreenLogoTileTable, VRAM_BASE + BGCNT_VRAM_TILE_SIZE * 30);
    LZ77UncompVram(sTitleScreenSpaceBackgroundTileTable, VRAM_BASE + BGCNT_VRAM_TILE_SIZE * 31);

    DMA_SET(3, sTitleScreenLogoPal, PALRAM_BASE, C_32_2_16(DMA_ENABLE | DMA_32BIT, sizeof(sTitleScreenLogoPal) / sizeof(u32)));
    DMA_SET(3, sTitleScreenSpaceBackgroundPal, PALRAM_BASE + 0x100, C_32_2_16(DMA_ENABLE | DMA_32BIT, sizeof(sTitleScreenSpaceBackgroundPal) / sizeof(u32)));

    SET_BACKDROP_COLOR(COLOR_BLACK);

    TitleScreenDrawDebugText(sTitleScreenDebugTextPointer, VRAM_BASE + 0xF000 + BGCNT_VRAM_TILE_SIZE * 1, 0);

    LZ77UncompVram(sTitleScreenObjectsGfx, VRAM_OBJ);
    DMA_SET(3, sTitleScreenObjectsPal, PALRAM_OBJ, C_32_2_16(DMA_ENABLE | DMA_32BIT, sizeof(sTitleScreenObjectsPal) / sizeof(u32)));

    gWrittenToBldalpha_R = 0;
    gWrittenToBldalpha_L = BLDALPHA_MAX_VALUE;

    write16(REG_BG1CNT, CREATE_BGCNT(2, 30, BGCNT_HIGH_MID_PRIORITY, BGCNT_SIZE_256x256));
    write16(REG_BG3CNT, CREATE_BGCNT(0, 31, BGCNT_LOW_PRIORITY, BGCNT_SIZE_256x256));

    write16(REG_DISPCNT, DCNT_BG3);

    CallbackSetVBlank(TitleScreenVblank);

    TitleScreenDrawAllObjects();
}

/**
 * @brief 871ec | 358 | Handles the title screen spawning in
 * 
 * @return s32 bool, ended
 */
s32 TitleScreenSpawningIn(void)
{
    s32 ended;
    u8 objSlot;

    ended = FALSE;

    switch (TITLE_SCREEN_DATA.unk_5)
    {
        case 0:
            if (gWrittenToBldy != 0)
            {
                TITLE_SCREEN_DATA.unk_0++;
                if (TITLE_SCREEN_DATA.unk_0 == 6)
                {
                    TITLE_SCREEN_DATA.unk_0 = 0;
                    gWrittenToBldy--;
                }
            }
            else
            {
                write16(REG_BLDCNT, BLDCNT_BG1_FIRST_TARGET_PIXEL | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BG3_SECOND_TARGET_PIXEL | BLDCNT_BACKDROP_SECOND_TARGET_PIXEL);
                write16(REG_DISPCNT, read16(REG_DISPCNT) | DCNT_BG1);
                TITLE_SCREEN_DATA.unk_0 = 0;
                MusicPlay(0x4A, 16);
                TITLE_SCREEN_DATA.unk_5 = 1;
            }
            break;

        case 1:
            TITLE_SCREEN_DATA.unk_0++;
            if (TITLE_SCREEN_DATA.unk_0 == 30)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
                TITLE_SCREEN_DATA.unk_5 = 2;
            }
            break;

        case 2:
            TITLE_SCREEN_DATA.unk_0++;
            if (TITLE_SCREEN_DATA.unk_0 == 5)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;

                gWrittenToBldalpha_R++;
                gWrittenToBldalpha_L--;

                if (gWrittenToBldalpha_R == BLDALPHA_MAX_VALUE)
                {
                    gWrittenToBldy = 0;
                    TITLE_SCREEN_DATA.unk_5 = 3;
                }
            }
            break;

        case 3:
            TITLE_SCREEN_DATA.unk_0++;
            if (TITLE_SCREEN_DATA.unk_0 == 1)
            {
                write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);
                gWrittenToBldalpha_R = 0;
                gWrittenToBldalpha_L = BLDALPHA_MAX_VALUE;
            }
            else if (TITLE_SCREEN_DATA.unk_0 == 30)
            {
                write16(REG_BLDCNT, BLDCNT_OBJ_FIRST_TARGET_PIXEL | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BG0_SECOND_TARGET_PIXEL |
                    BLDCNT_BG1_SECOND_TARGET_PIXEL | BLDCNT_BG2_SECOND_TARGET_PIXEL | BLDCNT_BG3_SECOND_TARGET_PIXEL | BLDCNT_BACKDROP_SECOND_TARGET_PIXEL);
                
                write16(REG_DISPCNT, read16(REG_DISPCNT) | DCNT_OBJ);

                objSlot = TitleScreenSetupObject(TITLE_SCREEN_SECTION_COPYRIGHT, SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 8), SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 9 + HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE));
                TITLE_SCREEN_DATA.objects[objSlot].objMode = OAM_OBJ_MODE_SEMI_TRANSPARENT;

                objSlot = TitleScreenSetupObject(TITLE_SCREEN_SECTION_PRESS_START, SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 7 + HALF_BLOCK_SIZE), SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 8 + HALF_BLOCK_SIZE));
                TITLE_SCREEN_DATA.objects[objSlot].objMode = OAM_OBJ_MODE_SEMI_TRANSPARENT;
                
                TITLE_SCREEN_DATA.unk_0 = 0;
                TITLE_SCREEN_DATA.unk_5 = 4;
            }

            TitleScreenDrawAllObjects();
            break;

        case 4:
            TITLE_SCREEN_DATA.unk_0++;
            if (TITLE_SCREEN_DATA.unk_0 == 2)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;

                gWrittenToBldalpha_R++;
                gWrittenToBldalpha_L--;

                if (gWrittenToBldalpha_R == BLDALPHA_MAX_VALUE)
                {
                    gWrittenToBldy = 0;
                    TITLE_SCREEN_DATA.unk_5 = 5;
                }
            }

            TitleScreenDrawAllObjects();
            break;

        case 5:
            TitleScreenCallObjectsSubroutine();
            TitleScreenDrawAllObjects();

            TITLE_SCREEN_DATA.unk_0++;
            TITLE_SCREEN_DATA.unk_2++;

            if (TITLE_SCREEN_DATA.unk_0 == 2000)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
            }

            if (gChangedInput & (KEY_A | KEY_START))
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
                TITLE_SCREEN_DATA.unk_2 = 0;
                TITLE_SCREEN_DATA.unk_5 = 6;

                SoundPlay(0x1FF);
            }
            else if (TITLE_SCREEN_DATA.unk_2 == 1200)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
                TITLE_SCREEN_DATA.unk_2 = 0;
                TITLE_SCREEN_DATA.unk_4 = 1;

                write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);
                ended = TRUE;
            }
            break;

        case 6:
            TitleScreenCallObjectsSubroutine();
            TitleScreenDrawAllObjects();

            TITLE_SCREEN_DATA.unk_0++;

            if (TITLE_SCREEN_DATA.unk_0 > 34)
            {
                TITLE_SCREEN_DATA.unk_0 = 0;
                write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);
                ended = TRUE;
            }
            break;
    }

    switch (TITLE_SCREEN_DATA.unk_5)
    {
        case 0:
        case 1:
        case 2:
        case 3:
            if (gChangedInput & (KEY_A | KEY_START))
            {
                gWrittenToBldy = 0;

                write16(REG_BLDY, 0);
                write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);
                write16(REG_DISPCNT, DCNT_BG1 | DCNT_BG3 | DCNT_OBJ);

                objSlot = TitleScreenSetupObject(TITLE_SCREEN_SECTION_COPYRIGHT, SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 8), SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 9 + HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE));
                TITLE_SCREEN_DATA.objects[objSlot].objMode = OAM_OBJ_MODE_SEMI_TRANSPARENT;

                objSlot = TitleScreenSetupObject(TITLE_SCREEN_SECTION_PRESS_START, SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 7 + HALF_BLOCK_SIZE), SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 8 + HALF_BLOCK_SIZE));
                TITLE_SCREEN_DATA.objects[objSlot].objMode = OAM_OBJ_MODE_SEMI_TRANSPARENT;

                TITLE_SCREEN_DATA.unk_0 = 0;
                TITLE_SCREEN_DATA.unk_2 = 0;

                if (TITLE_SCREEN_DATA.unk_5 == 0)
                {
                    MusicPlay(0x4A, 16);
                }

                TITLE_SCREEN_DATA.unk_5 = 5;
            }
            break;

        case 4:
            if (gChangedInput & (KEY_A | KEY_START))
            {
                gWrittenToBldy = 0;

                write16(REG_BLDY, 0);
                write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);
                write16(REG_DISPCNT, DCNT_BG1 | DCNT_BG3 | DCNT_OBJ);

                TITLE_SCREEN_DATA.unk_0 = 0;
                TITLE_SCREEN_DATA.unk_2 = 0;
                TITLE_SCREEN_DATA.unk_5 = 5;
            }
    }

    return ended;
}

/**
 * @brief 87544 | 70 | Title screen subroutine
 * 
 * @return s32 
 */
s32 TitleScreenSubroutine(void)
{
    s32 ended;

    ended = FALSE;

    switch (gSubGameMode1)
    {
        case 0:
            TitleScreenInit();
            gSubGameMode1 = 2;
            break;

        case 1:
            break;

        case 2:
            if (TitleScreenSpawningIn())
                gSubGameMode1 = 3;
            break;

        case 3:
            TitleScreenCallObjectsSubroutine();
            TitleScreenDrawAllObject();

            if (gWrittenToBldy < BLDY_MAX_VALUE)
            {
                gWrittenToBldy++;
            }
            else
            {
                if (TITLE_SCREEN_DATA.unk_4 == 0x1)
                    ended = 0x64;
                else
                    ended = TRUE;

                gSubGameMode1 = 0;
            }
            break;
    }

    return ended;
}

/**
 * @brief 875b4 | 5c | Draws a debug text
 * 
 * @param src Source
 * @param dst Destination
 * @param palette Palette
 */
void TitleScreenDrawDebugText(const u8* src, u16* dst, u8 palette)
{
    u16 nbrTile;

    DMA_SET(3, sTitleScreenDebugTextCharactersGfx, VRAM_BASE + 0x7C00, C_32_2_16(DMA_ENABLE | DMA_32BIT, sizeof(sTitleScreenDebugTextCharactersGfx) / sizeof(s32)));

    while (*src != '\0')
    {
        if (*src != ' ')
        {
            nbrTile = *src - 0x30;
            *dst = palette << 12 | (nbrTile + 0x3e0);
        }

        dst++;
        src++;
    }
}
