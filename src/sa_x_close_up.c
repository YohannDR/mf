#include "sa_x_close_up.h"
#include "callbacks.h"
#include "globals.h"
#include "macros.h"
#include "gba.h"

#include "data/sa_x_close_up.h"

#include "constants/event.h"

#include "structs/event.h"

u32 SaXCloseUpSubroutine(void) {
    u32 ended;

    gNextOamSlot = 0;
    ended = FALSE;
    switch (gUnk_03000b85) {
        case 0:
            SaXCloseUpInit();
            gUnk_03000b85++;
            break;
        case 1:
            gWrittenToBldy = 0;
            gUnk_03000b85++;
            break;
        case 2:
            if (SaXCloseUp())
                gUnk_03000b85++;
            break;
        case 3:
            if (gWrittenToBldy < BLDY_MAX_VALUE) {
                gWrittenToBldy = BLDY_MAX_VALUE;
            } else {
                ended = TRUE;
                gUnk_03000b85 = 0;
            }
            break;
    }
    ResetFreeOam();
    return ended;
}

void SaXCloseUpInit(void) {
    write16(REG_IME, FALSE);
    write16(REG_DISPSTAT, read16(REG_DISPSTAT) & ~DSTAT_IF_HBLANK);
    write16(REG_IE, read16(REG_IE) & ~IF_HBLANK);
    write16(REG_IME, TRUE);
    CallbackSetVBlank(SaXCloseUpLoadingVblank);

    write16(REG_BLDCNT, BLDCNT_BRIGHTNESS_DECREASE_EFFECT | BLDCNT_BACKDROP_FIRST_TARGET_PIXEL
        | BLDCNT_OBJ_FIRST_TARGET_PIXEL | BLDCNT_BG3_FIRST_TARGET_PIXEL | BLDCNT_BG2_FIRST_TARGET_PIXEL
        | BLDCNT_BG1_FIRST_TARGET_PIXEL | BLDCNT_BG0_FIRST_TARGET_PIXEL);
    write16(REG_BLDY, gWrittenToBldy = BLDY_MAX_VALUE);
    write16(REG_DISPCNT, 0);

    DMA_FILL_32(3, 0, &gNonGameplayRam, sizeof(gNonGameplayRam));
    DMA_SET(3, gOamData, OAM_BASE, C_32_2_16(DMA_ENABLE | DMA_32BIT, OAM_SIZE / 4));
    DMA_SET(3, VRAM_OBJ, gSpriteTilesBackup, C_32_2_16(DMA_ENABLE, sizeof(gSpriteTilesBackup) / 2));
    CallLZ77UncompVram(sSaXCloseupGfx, BGCNT_TO_VRAM_CHAR_BASE(0));
    DMA_SET(3, sSaXCloseupPal, PALRAM_BASE, C_32_2_16(DMA_ENABLE, sizeof(sSaXCloseupPal) / 2));
    write16(PALRAM_BASE, COLOR_BLACK);
    CallLZ77UncompVram(sSaXCloseupFirstTileTable, BGCNT_TO_VRAM_TILE_BASE(0x18));
    CallLZ77UncompVram(sSaXCloseupSecondTileTable, BGCNT_TO_VRAM_TILE_BASE(0x1a));

    write16(REG_BG0HOFS, 0);
    write16(REG_BG0VOFS, 0);
    write16(REG_BG1HOFS, 0);
    write16(REG_BG1VOFS, 0);
    write16(REG_BG2HOFS, 0);
    write16(REG_BG2VOFS, 0);
    write16(REG_BG3HOFS, 0);
    write16(REG_BG3VOFS, 0);

    gWrittenToBldy = BLDY_MAX_VALUE;
    if (gEventCounter == EVENT_ENTERED_ELEVATOR_ROOM)
        gWrittenToBldy = 0;
    gWrittenToBldalpha_R = BLDALPHA_MAX_VALUE;
    gWrittenToBldalpha_L = 0;

    write16(REG_BG0CNT, CREATE_BGCNT(0, 0x18, BGCNT_HIGH_PRIORITY, BGCNT_SIZE_256x256));
    write16(REG_BG1CNT, CREATE_BGCNT(0, 0x1a, BGCNT_HIGH_MID_PRIORITY, BGCNT_SIZE_256x256));

    CallbackSetVBlank(SaXCloseUpVblank);
    SaXCloseUpVblank();

    gWrittenToDispcnt = DCNT_BG1 | DCNT_BG0;
}

void SaXCloseUpVblank(void) {
    write16(REG_BLDY, gWrittenToBldy);
    write16(REG_BLDALPHA, gWrittenToBldalpha_L << 8 | gWrittenToBldalpha_R);
    if (gWrittenToDispcnt != 0) {
        write16(REG_DISPCNT, gWrittenToDispcnt);
        gWrittenToDispcnt = 0;
    }
}

void SaXCloseUpLoadingVblank(void) {
    UpdateAudio();
}

u32 SaXCloseUp(void) {
    u32 ended = FALSE;
    SA_X_CLOSE_UP_DATA.timer++;
    if (SA_X_CLOSE_UP_DATA.unk_0 == 0)
        if (SaXCloseUpProcess())
            ended = TRUE;
    return ended;
}

u32 SaXCloseUpProcess(void) {
    u32 ended = FALSE;
    switch (SA_X_CLOSE_UP_DATA.stage) {
        case 0:
            write16(REG_BLDCNT, BLDCNT_BACKDROP_SECOND_TARGET_PIXEL | BLDCNT_OBJ_SECOND_TARGET_PIXEL
                | BLDCNT_BG3_SECOND_TARGET_PIXEL | BLDCNT_BG2_SECOND_TARGET_PIXEL | BLDCNT_BG1_SECOND_TARGET_PIXEL
                | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BG0_FIRST_TARGET_PIXEL);
            SA_X_CLOSE_UP_DATA.stage++;
            SA_X_CLOSE_UP_DATA.timer = 0;
            break;
        case 1:
            if (SA_X_CLOSE_UP_DATA.timer > sSaXCloseupDurations[0]) {
                SA_X_CLOSE_UP_DATA.stage++;
                SA_X_CLOSE_UP_DATA.timer = 0;
            }
            break;
        case 2:
            if (gWrittenToBldalpha_R == 0) {
                write16(REG_DISPCNT, read16(REG_DISPCNT) ^ DCNT_BG0);
                SA_X_CLOSE_UP_DATA.stage++;
                SA_X_CLOSE_UP_DATA.timer = 0;
            } else {
                gWrittenToBldalpha_R--;
                gWrittenToBldalpha_L = BLDALPHA_MAX_VALUE - gWrittenToBldalpha_R;
            }
            break;
        case 3:
            if (SA_X_CLOSE_UP_DATA.timer > sSaXCloseupDurations[1]) {
                SA_X_CLOSE_UP_DATA.stage++;
                SA_X_CLOSE_UP_DATA.timer = 0;
            }
            break;
        case 4:
        default:
            write16(REG_BLDCNT, BLDCNT_BRIGHTNESS_DECREASE_EFFECT | BLDCNT_BACKDROP_FIRST_TARGET_PIXEL
                | BLDCNT_OBJ_FIRST_TARGET_PIXEL | BLDCNT_BG3_FIRST_TARGET_PIXEL | BLDCNT_BG2_FIRST_TARGET_PIXEL
                | BLDCNT_BG1_FIRST_TARGET_PIXEL | BLDCNT_BG0_FIRST_TARGET_PIXEL);
            gWrittenToBldy = BLDY_MAX_VALUE;
            SA_X_CLOSE_UP_DATA.stage = 0;
            SA_X_CLOSE_UP_DATA.timer = 0;
            ended = TRUE;
    }
    return ended;
}
