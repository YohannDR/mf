#include "in_game.h"
#include "globals.h"
#include "gba.h"
#include "macros.h"
#include "callbacks.h"

#include "constants/demo.h"
#include "constants/sa_x.h"

#include "structs/clipdata.h"
#include "structs/demo.h"
#include "structs/samus.h"
#include "structs/sa_x.h"

/**
 * @brief dd24 | 234 | In game mode subroutine
 * 
 * @return u32 bool, leaving
 */
u32 InGameSubroutine(void)
{
    u32 leaving;

    InGameSetVblank();

    leaving = FALSE;

    switch (gSubGameMode1)
    {
        case 0:
            if (gUnk_03000be3 == 0)
                ResetDemoInputAndDuration();

            if (gDemoState == DEMO_STATE_PLAYING)
                CopyDemoInput();

            InitAndLoadGenerics();

            if (gSaXElevatorData.stage == 0)
                gSaXElevatorData.unk_0 = 0;

            gSubGameMode1++;
            break;

        case SUB_GAME_MODE_DOOR_TRANSITION:
            IoWriteRegisters();

            if (!unk_6e3c0())
                break;

            if (gSaXElevatorData.stage != 0)
            {
                gSubGameMode1 = SUB_GAME_MODE_SA_X_ELEVATOR;
                break;
            }

            gSubGameMode1++;
            break;

        case SUB_GAME_MODE_PLAYING:
            DemoMainLoop();
            IoWriteRegisters();

            if (gChangedInput & gButtonAssignments.pause && ProcessPauseButtonPress())
            {
                gSubGameMode1++;
                gPauseScreenFlag = 0x2;
            }

            if (gSubGameMode1 == SUB_GAME_MODE_PLAYING)
            {
                if (!(gButtonInput & KEY_UP))
                    gNotPressingUp = TRUE;

                if (gPreventMovementTimer != 0)
                {
                    gPreventMovementTimer--;
                }
                else
                {
                    SamusUpdatePhysics();
                    SamusUpdateCollisionData();
                }
            }

            UpdateInGameTimer();
            unk_659a0();
            break;

        case SUB_GAME_MODE_LOADING_ROOM:
            IoWriteRegistersDuringTransition();

            if (unk_6e4bc())
            {
                gSubGameMode1 = 0;
                if (gPauseScreenFlag != 0 || gCurrentCutscene != 0)
                    leaving = TRUE;
            }
            break;

        case SUB_GAME_MODE_SA_X_ELEVATOR:
            unk_d638();
            break;

        case SUB_GAME_MODE_DYING:
            IoWriteRegisters();
            SamusUpdatePhysics();
            SamusDraw();
            SamusCallUpdateGraphics();
            unk_659a0();
            break;

        case SUB_GAME_MODE_FREE_MOVEMENT:
            UpdateFreeMovement_Debug();
            unk_659a0();
            break;
    }

    if (gSubGameMode1 == SUB_GAME_MODE_SA_X_ELEVATOR || gSubGameMode1 == SUB_GAME_MODE_DYING || gSaXElevatorData.unk_0 != 0)
    {
        ResetFreeOam();
        UpdateRoom();
    }
    else if (gSubGameMode1 != 0)
    {
        UpdateAnimatedGraphicsAndPalette();
        SpriteUpdate();

        if (!gDisableDrawingSamusAndScrollingFlag)
        {
            ProcessGeneralScrolling();
            SamusCallUpdateGraphics();
        }
        else if (gDisableScrolling == 0x2)
        {
            ProcessGeneralScrolling();
        }

        ProjectileUpdate();
        HudDraw();
        SpriteDrawAll_Upper();
        ParticleUpdate();
        ProjectileDrawAll_False();

        SpriteDrawAll_Middle();

        if (!gDisableDrawingSamusAndScrollingFlag)
            SamusDraw();

        SpriteDrawAll_Lower();
        ProjectileDrawAll_True();
        
        ResetFreeOam();
        UpdateRoom();
        CallCheckPlayLowHealthSound();
    }

    return leaving;
}

/**
 * @brief df58 | 3c | Sets the correct in game v-blank code
 * 
 */
void InGameSetVblank(void)
{
    switch (gSubGameMode1)
    {
        case 0:
        case SUB_GAME_MODE_DOOR_TRANSITION:
        case SUB_GAME_MODE_LOADING_ROOM:
            CallbackSetVBlank(VBlankCodeInGameLoad);
            break;

        case SUB_GAME_MODE_PLAYING:
        default:
            CallbackSetVBlank(VBlankCodeInGame);
    }
}

/**
 * @brief df94 | 188 | Transfers the samus and SA-X graphics/palette to VRAM
 * 
 * @param updatePalette bool, update palette
 */
void TransferSamusGraphics(s32 updatePalette)
{
    if (!gDisableDrawingSamusAndScrollingFlag)
    {
        if (gSamusGraphicsInfo.bodyTopHalfGfxLength != 0)
        {
            DMA_SET(3, gSamusGraphicsInfo.pBodyTopHalfGfx, VRAM_OBJ_ADDR(0),
                C_32_2_16(DMA_ENABLE, gSamusGraphicsInfo.bodyTopHalfGfxLength / 2));
        }

        if (gSamusGraphicsInfo.bodyBottomHalfGfxLength != 0)
        {
            DMA_SET(3, gSamusGraphicsInfo.pBodyBottomHalfGfx, VRAM_OBJ_ADDR(32),
                C_32_2_16(DMA_ENABLE, gSamusGraphicsInfo.bodyBottomHalfGfxLength / 2));
        }

        if (gSamusGraphicsInfo.legsTopHalfGfxLength != 0)
        {
            DMA_SET(3, gSamusGraphicsInfo.pLegsTopHalfGfx, VRAM_OBJ_ADDR(20),
                C_32_2_16(DMA_ENABLE, gSamusGraphicsInfo.legsTopHalfGfxLength / 2));
        }

        if (gSamusGraphicsInfo.legsBottomHalfGfxLength != 0)
        {
            DMA_SET(3, gSamusGraphicsInfo.pLegsBottomHalfGfx, VRAM_OBJ_ADDR(32 + 20),
                C_32_2_16(DMA_ENABLE, gSamusGraphicsInfo.legsBottomHalfGfxLength / 2));
        }

        if (gSamusGraphicsInfo.armCannonTopHalfGfxLength != 0)
        {
            DMA_SET(3, gSamusGraphicsInfo.pArmCannonTopHalfGfx, VRAM_OBJ_ADDR(32 * 2),
                C_32_2_16(DMA_ENABLE, gSamusGraphicsInfo.armCannonTopHalfGfxLength / 2));
        }

        if (gSamusGraphicsInfo.armCannonBottomHalfGfxLength != 0)
        {
            DMA_SET(3, gSamusGraphicsInfo.pArmCannonBottomHalfGfx, VRAM_OBJ_ADDR(32 * 3),
                C_32_2_16(DMA_ENABLE, gSamusGraphicsInfo.armCannonBottomHalfGfxLength / 2));
        }

        if (updatePalette)
        {
            DMA_SET(3, gSamusPalette, PALRAM_OBJ + 0x00, C_32_2_16(DMA_ENABLE, gSamusPaletteLength / 2));
        }
    }

    if (gSaXData.screenFlag == SA_X_SCREEN_FLAG_NOT_PRESENT || gSaXData.screenFlag == SA_X_SCREEN_FLAG_OFF_SCREEN)
        return;

    if (gSaXData.topGfxLength != 0)
    {
        DMA_SET(3, gSaXData.pTopGfx, VRAM_OBJ_ADDR(32 * 16), C_32_2_16(DMA_ENABLE, gSaXData.topGfxLength / 2));
    }

    if (gSaXData.bottomGfxLength != 0)
    {
        DMA_SET(3, gSaXData.pBottomGfx, VRAM_OBJ_ADDR(32 * 17), C_32_2_16(DMA_ENABLE, gSaXData.bottomGfxLength / 2));
    }

    if (updatePalette)
    {
        DMA_SET(3, gSaXPalette, PALRAM_OBJ + 0x100, C_32_2_16(DMA_ENABLE, 16));
    }
}

/**
 * @brief e11c | 150 | V-blank code during in game loads
 * 
 */
void VBlankCodeInGameLoad(void)
{
    vu8 buffer;

    DMA_SET(3, gOamData, OAM_BASE, C_32_2_16(DMA_ENABLE | DMA_32BIT, OAM_SIZE / 4));

    if (gHazeInfo.active)
    {
        DMA_SET(0, EWRAM_BASE + 0x24000, gHazeInfo.pAffected, C_32_2_16(DMA_ENABLE | DMA_DEST_RELOAD, gHazeInfo.size / 2));
        
        buffer = 0;
        buffer = 0;
        buffer = 0;
        buffer = 0;
        
        DMA_SET(0, EWRAM_BASE + 0x24000, gHazeInfo.pAffected, C_32_2_16(DMA_DEST_RELOAD, gHazeInfo.size / 2));

        buffer = 0;
        
        if (!(gVBlankRequestFlag & 1))
        {
            buffer = 0;
            DMA_SET(3, EWRAM_BASE + 0x24A00, EWRAM_BASE + 0x24000, C_32_2_16(DMA_ENABLE, gHazeInfo.unk_4 / 2));
            SET_BACKDROP_COLOR(gBackdropColor);
        }

        buffer = 0;
        DMA_SET(0, EWRAM_BASE + 0x24000, gHazeInfo.pAffected,
            C_32_2_16(DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD, gHazeInfo.size / 2));
    }

    TransferSamusGraphics(FALSE);

    if (gWrittenToBldcnt != 0)
    {
        write16(REG_BLDCNT, gWrittenToBldcnt);
        gWrittenToBldcnt = 0;
    }

    write16(REG_BLDY, gWrittenToBldy);

    write16(REG_BG0HOFS, gBackgroundPositions.bg[0].x);
    write16(REG_BG0VOFS, gBackgroundPositions.bg[0].y);

    write16(REG_BG1HOFS, gBackgroundPositions.bg[1].x);
    write16(REG_BG1VOFS, gBackgroundPositions.bg[1].y);

    write16(REG_BG2HOFS, gBackgroundPositions.bg[2].x);
    write16(REG_BG2VOFS, gBackgroundPositions.bg[2].y);

    write16(REG_BG3HOFS, gBackgroundPositions.bg[gWhichBgPositionIsWrittenToBg3Ofs].x);
    write16(REG_BG3VOFS, gBackgroundPositions.bg[gWhichBgPositionIsWrittenToBg3Ofs].y);
}

/**
 * @brief e26c | 7c | To document
 * 
 */
void unk_e26c(void)
{
    DMA_SET(3, gOamData, OAM_BASE, C_32_2_16(DMA_ENABLE | DMA_32BIT, OAM_SIZE / 4));

    TransferSamusGraphics(FALSE);

    write16(REG_BG0HOFS, gBackgroundPositions.bg[0].x);
    write16(REG_BG0VOFS, gBackgroundPositions.bg[0].y);

    write16(REG_BG1HOFS, gBackgroundPositions.bg[1].x);
    write16(REG_BG1VOFS, gBackgroundPositions.bg[1].y);

    write16(REG_BG2HOFS, gBackgroundPositions.bg[2].x);
    write16(REG_BG2VOFS, gBackgroundPositions.bg[2].y);

    write16(REG_BG3HOFS, gBackgroundPositions.bg[gWhichBgPositionIsWrittenToBg3Ofs].x);
    write16(REG_BG3VOFS, gBackgroundPositions.bg[gWhichBgPositionIsWrittenToBg3Ofs].y);
}

/**
 * @brief e2e8 | 12c | V-blank code during in game
 * 
 */
void VBlankCodeInGame(void)
{
    vu8 buffer;

    DMA_SET(3, gOamData, OAM_BASE, (DMA_ENABLE | DMA_32BIT) << 16 | OAM_SIZE / sizeof(u32));

    if (gHazeInfo.active)
    {
        DMA_SET(0, EWRAM_BASE + 0x24000, gHazeInfo.pAffected, C_32_2_16(DMA_ENABLE | DMA_DEST_RELOAD, gHazeInfo.size / 2));
        
        buffer = 0;
        buffer = 0;
        buffer = 0;
        buffer = 0;
        
        DMA_SET(0, EWRAM_BASE + 0x24000, gHazeInfo.pAffected, C_32_2_16(DMA_DEST_RELOAD, gHazeInfo.size / 2));

        buffer = 0;
        
        if (!(gVBlankRequestFlag & 1))
        {
            buffer = 0;
            DMA_SET(3, EWRAM_BASE + 0x24A00, EWRAM_BASE + 0x24000, C_32_2_16(DMA_ENABLE, gHazeInfo.unk_4 / 2));
            SET_BACKDROP_COLOR(gBackdropColor);
        }

        buffer = 0;
        DMA_SET(0, EWRAM_BASE + 0x24000, gHazeInfo.pAffected,
            C_32_2_16(DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD, gHazeInfo.size / 2));
    }

    TransferSamusGraphics(TRUE);

    write16(REG_MOSAIC, gWrittenToMosaic_H << 4 | gWrittenToMosaic_L);

    write16(REG_BG0HOFS, gBackgroundPositions.bg[0].x);
    write16(REG_BG0VOFS, gBackgroundPositions.bg[0].y);

    write16(REG_BG1HOFS, gBackgroundPositions.bg[1].x);
    write16(REG_BG1VOFS, gBackgroundPositions.bg[1].y);

    write16(REG_BG2HOFS, gBackgroundPositions.bg[2].x);
    write16(REG_BG2VOFS, gBackgroundPositions.bg[2].y);

    write16(REG_BG3HOFS, gBackgroundPositions.bg[3].x);
    write16(REG_BG3VOFS, gBackgroundPositions.bg[3].y);
}

/**
 * @brief e414 | c | Empty v-blank when in game
 * 
 */
void VBlankInGame_Empty(void)
{
    UpdateAudio();
}

/**
 * @brief e420 | 264 | Initializes and loads the generic data
 * 
 */
void InitAndLoadGenerics(void)
{
    u16 vcount;

    write16(REG_IME, FALSE);

    write16(REG_DISPSTAT, read16(REG_DISPSTAT) & ~DSTAT_IF_HBLANK);
    write16(REG_IE, read16(REG_IE) & ~IF_HBLANK);

    write16(REG_IME, TRUE);

    CallbackSetVBlank(VBlankInGame_Empty);

    if (gUnk_03000be3 == 0)
    {
        ClearGfxRam();
        LoadCommonGraphics();
    }

    gWrittenToBldy = BLDY_MAX_VALUE;

    if (gPauseScreenFlag != 0 || gUnk_03000be3 == 0 || gCurrentCutscene != 0)
    {
        write16(REG_BLDCNT, BLDCNT_SCREEN_FIRST_TARGET | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);

        write16(REG_BLDY, gWrittenToBldy);

        write16(REG_DISPCNT, 0);
    }
    else
    {
        write16(REG_BLDCNT, BLDCNT_BG0_FIRST_TARGET_PIXEL | BLDCNT_BG1_FIRST_TARGET_PIXEL | BLDCNT_BG2_FIRST_TARGET_PIXEL |
            BLDCNT_BACKDROP_FIRST_TARGET_PIXEL | BLDCNT_ALPHA_BLENDING_EFFECT | BLDCNT_BRIGHTNESS_INCREASE_EFFECT);

        write16(REG_BLDY, BLDY_MAX_VALUE);
        write16(REG_BG3CNT, CREATE_BGCNT(1, 6, BGCNT_HIGH_PRIORITY, BGCNT_SIZE_512x256));

        write16(REG_DISPCNT, DCNT_BG3 | DCNT_OBJ);
    }

    if (gPauseScreenFlag != 0 || gCurrentCutscene != 0)
        DmaTransfer(3, EWRAM_BASE + 0x1C000, VRAM_OBJ, 0x4000, 16);

    gDebugFlag = FALSE;

    DMA_SET(3, 0x83e40dc, PALRAM_OBJ + 0x40, C_32_2_16(DMA_ENABLE, 16 * 6));

    SamusInit();

    for (;;)
    {
        vcount = read16(REG_VCOUNT) - 21;

        if (vcount >= 140)
            break;
    }

    LoadRoom();

    for (;;)
    {
        vcount = read16(REG_VCOUNT) - 21;

        if (vcount >= 140)
            break;
    }

    if (gPauseScreenFlag == 0 && gUnk_03000be3 != 0)
    {
        SamusUpdatePhysics();
        SamusUpdateCollisionData();
    }

    SamusCallUpdateGraphics();

    DMA_SET(3, gSamusPalette, PALRAM_OBJ, C_32_2_16(DMA_ENABLE, gSamusPaletteLength / 2));

    unk_e26c();

    for (;;)
    {
        vcount = read16(REG_VCOUNT) - 21;

        if (vcount >= 140)
            break;
    }

    CheckResetHudAndParticles();
    SpriteLoadAllData();
    ProjectileCallLoadGraphicsAndClearProjectiles();

    if (gPauseScreenFlag != 0)
    {
        DmaTransfer(3, EWRAM_BASE + 0x20000, VRAM_OBJ + 0x4000, 0x4000, 16);

        DMA_SET(3, EWRAM_BASE + 0x35700, PALRAM_OBJ + 0x100, C_32_2_16(DMA_ENABLE, 16 * 8));
    }

    SetupCurrentEventBasedEffect();
    unk_6dd30();
    CheckUpdateMusicDuringRoomLoad();

    if (gUnk_03000be3 == 0)
    {
        SpriteUpdate();
        gUnk_03000be3 = 1;
        gPreventMovementTimer = 0;
    }

    gWrittenToBldy = BLDY_MAX_VALUE - 1;

    for (;;)
    {
        vcount = read16(REG_VCOUNT) - 21;

        if (vcount >= 140)
            break;
    }

    gIsLoadingFile = FALSE;
    gPauseScreenFlag = 0;
    gCurrentCutscene = 0;

    CallbackSetVBlank(VBlankCodeInGameLoad);
}

/**
 * @brief e684 | 124 | Updates the free debug movement
 * 
 */
void UpdateFreeMovement_Debug(void)
{
    s16 xMovement;
    s16 yMovement;
    s32 bgSize;

    xMovement = 0;
    yMovement = 0;

    gPreviousXPosition = gSamusData.xPosition;
    gPreviousYPosition = gSamusData.yPosition;

    if (gChangedInput & KEY_SELECT)
    {
        gSubGameMode1 = SUB_GAME_MODE_PLAYING;
        gUnk_03000064 = FALSE;
    }

    if (gChangedInput & KEY_START)
        gUnk_03000064 ^= TRUE;

    if (gButtonInput & KEY_RIGHT)
        xMovement = QUARTER_BLOCK_SIZE - PIXEL_SIZE;

    if (gButtonInput & KEY_LEFT)
        xMovement = -(QUARTER_BLOCK_SIZE - PIXEL_SIZE);

    if (gButtonInput & KEY_UP)
        yMovement = -(QUARTER_BLOCK_SIZE - PIXEL_SIZE);

    if (gButtonInput & KEY_DOWN)
        yMovement = QUARTER_BLOCK_SIZE - PIXEL_SIZE;

    if (gButtonInput & KEY_R)
    {
        xMovement *= 2;
        yMovement *= 2;
    }

    if (gSamusData.xPosition & 0x8000)
        gSamusData.xPosition = 0;

    if (gSamusData.yPosition & 0x8000)
        gSamusData.yPosition = 0;

    bgSize = BLOCK_TO_SUB_PIXEL(gBackgroundsData.backgrounds[1].width);

    if (xMovement < 0)
    {
        if (gSamusData.xPosition < -xMovement)
            gSamusData.xPosition = 0;
        else
            gSamusData.xPosition += xMovement;
    }
    else
    {
        if (gSamusData.xPosition > bgSize - xMovement)
            gSamusData.xPosition = bgSize;
        else
            gSamusData.xPosition += xMovement;
    }

    bgSize = BLOCK_TO_SUB_PIXEL(gBackgroundsData.backgrounds[1].height);

    if (yMovement < 0)
    {
        if (gSamusData.yPosition < -yMovement)
            gSamusData.yPosition = 0;
        else
            gSamusData.yPosition += yMovement;
    }
    else
    {
        if (gSamusData.yPosition > bgSize - yMovement)
            gSamusData.yPosition = bgSize;
        else
            gSamusData.yPosition += yMovement;
    }
}
