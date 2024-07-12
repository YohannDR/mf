MEMORY {
    ewram : ORIGIN = 0x02000000 LENGTH = 256K
    iwram : ORIGIN = 0x03000000 LENGTH = 32K
    rom : ORIGIN = 0x08000000 LENGTH = 32M
}


SECTIONS {
    ewram (NOLOAD) : ALIGN(4) {
    } >ewram

    iwram (NOLOAD) : ALIGN(4) {
        . = 0x00000000; gDebugFlag = .;
        . = 0x00000002; gFrameCounter16Bit = .;
        . = 0x00000004; gWrittenToBldalpha = .;
        . = 0x00000006; gWrittenToBldcnt = .;
        . = 0x00000008; gWrittenToDispcnt = .;
        . = 0x0000000c; gWrittenToWinin_L = .;
        . = 0x0000000d; gWrittenToWinout_R = .;
        . = 0x0000000e; gBackdropColor = .;
        . = 0x00000019; gWhichBgPositionIsWrittenToBg3Ofs = .;
        . = 0x0000001a; gSamusOnTopOfBackgrounds = .;
        . = 0x0000001b; gAbilityCount = .;
        . = 0x0000001c; gSecurityHatchLevel = .;
        . = 0x0000001d; gSecurityHatchLevelBackup = .;
        . = 0x0000001e; gCurrentDemo = .;
        . = 0x0000001f; gDemoPlaying = .;
        . = 0x00000020; gRebootGame = .;
        . = 0x00000021; gDisableScrolling = .;
        . = 0x00000024; gSkipDoorTransition = .;
        . = 0x00000025; gDisableSoftReset = .;
        . = 0x0000002a; gDisableDoorsAndTanks = .;
        . = 0x0000002c; gCurrentArea = .;
        . = 0x0000002d; gCurrentRoom = .;
        . = 0x0000002e; gLastDoorUsed = .;
        . = 0x00000030; gDisplayLocationName = .;
        . = 0x00000044; gEffectYPosition = .;
        . = 0x00000046; gDoorUnlockTimer = .;
        . = 0x00000048; gCurrentNavigationRoom = .;
        . = 0x00000049; gLastElevatorUsed = .;
        . = 0x0000004a; gCurrentEventBasedEffect = .;
        . = 0x0000004b; gCurrentEventBasedEffectCopy = .;
        . = 0x00000052; gSpritesetNumber = .;
        . = 0x00000053; gCurrentClipdataAffectingAction = .;
        . = 0x00000060; gSubEventCounter = .;
        . = 0x00000062; gPreviousSubEvent = .;
        . = 0x00000064; gUnk_03000064 = .;
        . = 0x00000068; gHazeInfo = .;
        . = 0x00000070; gIoRegisters = .;
        . = 0x00000084; gBackgroundsData = .;
        . = 0x000000a4; gCurrentRoomEntry = .;
        . = 0x000000c0; gCurrentAffectingClipdata = .;
        . = 0x000000c8; gBackgroundPositions = .;
        . = 0x000000dc; gSaXSpawnPosition = .;
        . = 0x000000e8; gWindow1Border = .;
        . = 0x00000110; gCurrentPowerBomb = .;
        . = 0x00000138; gInGameTimer = .;
        . = 0x0000013c; gMaxInGameTimeFlag = .;
        . = 0x00000140; gSpriteData = .;
        . = 0x00000680; gSpritesetSpriteIds = .;
        . = 0x0000068f; gSpritesetSpriteGfxSlots = .;
        . = 0x000006a0; gXParasiteTargetYPosition = .;
        . = 0x000006a2; gXParasiteTargetXPosition = .;
        . = 0x000006a4; gAbilityRestingYPosition = .;
        . = 0x000006a6; gAbilityRestingXPosition = .;
        . = 0x000006a8; gSerrisSpawnYPosition = .;
        . = 0x000006aa; gSerrisSpawnXPosition = .;
        . = 0x000006ac; gBossFormationSpriteId = .;
        . = 0x000006ad; gCoreXFormationSpriteId = .;
        . = 0x000006ae; gAtmosphericStabilizersOnline = .;
        . = 0x000006b0; gNormalXBarrierCoresDestroyed = .;
        . = 0x000006b2; gSuperXBarrierCoresDestroyed = .;
        . = 0x000006b4; gPowerBombXBarrierCoresDestroyed = .;
        . = 0x000006b6; gGadorasDestroyed = .;
        . = 0x000006b8; gMissilesHatchDestroyed = .;
        . = 0x000006b9; gWaterLowered = .;
        . = 0x000006bc; gCurrentSprite = .;
        . = 0x000006f4; gSpriteDebris = .;
        . = 0x00000774; gCurrentSpriteDebris = .;
        . = 0x00000784; gSubSpriteData1 = .;
        . = 0x00000794; gSubSpriteData2 = .;
        . = 0x000007a4; gPreviousVerticalCollisionCheck = .;
        . = 0x000007a5; gPreviousCollisionCheck = .;
        . = 0x000007a6; gIgnoreSamusAndSpriteCollision = .;
        . = 0x000007a7; gSpriteDrawOrder = .;
        . = 0x000007a7; gSaXVision = .;
        . = 0x000007c0; gUnk_030007c0 = .;
        . = 0x000007f0; gSpriteRandomNumber = .;
        . = 0x000007f1; gBossWork0 = .;
        . = 0x000007f2; gBossWork1 = .;
        . = 0x000007f3; gBossWork2 = .;
        . = 0x000007f4; gBossWork3 = .;
        . = 0x000007f5; gBossWork4 = .;
        . = 0x000007f6; gBossWork5 = .;
        . = 0x000008c4; gMissileHighlightStatus = .;
        . = 0x000008c5; gPowerBombHighlightStatus = .;
        . = 0x000008c6; gMinimapUpdateFlag = .;
        . = 0x000008c7; gEnergyDigits = .;
        . = 0x000008cb; gMaxEnergyDigits = .;
        . = 0x000008cf; gMissileDigits = .;
        . = 0x000008d3; gPowerBombDigits = .;
        . = 0x000008d7; gEscapeStatus = .;
        . = 0x000008d8; gEscapeTimerCounter = .;
        . = 0x000008d9; gEscapeTimerDigits = .;
        . = 0x000008e0; gEscapeDigitsOam = .;
        . = 0x00000912; gAmmoDigitsGfx = .;
        . = 0x00000960; gProjectileData = .;
        . = 0x00000b60; gCurrentProjectile = .;
        . = 0x00000b80; gArmCannonY = .;
        . = 0x00000b82; gArmCannonX = .;
        . = 0x00000b84; gPauseScreenFlag = .;
        . = 0x00000b86; gPreviousArea = .;
        . = 0x00000b87; gEventCounter = .;
        . = 0x00000b88; gPreviousNavigationConversation = .;
        . = 0x00000b89; gPreviousCutscene = .;
        . = 0x00000b8a; gRoomEventTrigger = .;
        . = 0x00000b8b; gIsLoadingFile = .;
        . = 0x00000b8f; gUnk_03000B8F = .;
        . = 0x00000bd0; gDebugMenuOptions = .;
        . = 0x00000bdc; gCurrentCutscene = .;
        . = 0x00000bde; gMainGameMode = .;
        . = 0x00000be0; gSubGameMode1 = .;
        . = 0x00000be2; gSubGameMode2 = .;
        . = 0x00000be3; gUnk_03000be3 = .;
        . = 0x00000be4; gClearedEveryFrame = .;
        . = 0x00000be5; gFrameCounter8Bit = .;
        . = 0x00000be6; gVBlankRequestFlag = .;
        . = 0x00000be8; gInterruptCode = .;
        . = 0x00000de8; gOamData = .;
        . = 0x000011e8; gButtonInput = .;
        . = 0x000011ea; gButtonInputCopy = .;
        . = 0x000011ec; gChangedInput = .;
        . = 0x000011ee; gNextOamSlot = .;
        . = 0x000011f6; gSaXElevatorBgCnt = .;
        . = 0x0000120c; gWrittenToMosaic_H = .;
        . = 0x0000120e; gWrittenToMosaic_L = .;
        . = 0x0000121e; gWrittenToBldy = .;
        . = 0x00001220; gWrittenToBldalpha_R = .;
        . = 0x00001222; gWrittenToBldalpha_L = .;
        . = 0x00001228; gBg1XPosition = .;
        . = 0x0000122A; gBg1YPosition = .;
        . = 0x00001242; gDemoState = .;
        . = 0x00001243; gPoseLock = .;
        . = 0x00001244; gSamusData = .;
        . = 0x00001270; gSamusDataCopy = .;
        . = 0x0000129c; gSamusGraphicsInfo = .;
        . = 0x000012d8; gSamusAnimationInfo = .;
        . = 0x00001310; gEquipment = .;
        . = 0x00001330; gSamusPhysics = .;
        . = 0x00001342; gPreviousXPosition = .;
        . = 0x00001344; gPreviousYPosition = .;
        . = 0x00001348; gPreventMovementTimer = .;
        . = 0x0000134a; gDisableDrawingSamusAndScrollingFlag = .;
        . = 0x00001450; gButtonAssignments = .;
        . = 0x00001458; gSaXData = .;
        . = 0x0000147c; gSaXElevatorData = .;
        . = 0x00001484; gNonGameplayRam = .;
        . = 0x000019c4; gVBlankCallback = .;
        . = 0x000019c8; gHBlankCallback = .;
        . = 0x000019cc; gVCountCallback = .;
        . = 0x000019d0; gMusicInfo = .;
        . = 0x00004812; gDemoInputs = .;
        . = 0x00004a12; gDemoInputDurations = .;
        . = 0x00004c12; gDemoInputCounter = .;
        . = 0x00004c14; gDemoInputTimer = .;
        . = 0x00004c16; gDemoInput = .;
        . = 0x00004c18; gSaXElevatorSprites = .;
        . = 0x00004d1c; gNotPressingUp = .;
        . = 0x00004d28; gSamusPalette = .;
        . = 0x00004d88; gSamusPaletteLength = .;
        . = 0x00004d90; gSaXPalette = .;
        . = 0x00004dd4; gWrittenToWin1H = .;
        . = 0x00004dd6; gWrittenToWin1V = .;
        . = 0x00004dd8; gWrittenToBldcnt_Special = .;
        . = 0x00004dda; gElevatorDirection = .;
        . = 0x00004ddc; gTilemapAndClipPointers = .;
        . = 0x00004dec; gHatchData = .;
        . = 0x00004e0c; gDoorPositionStart = .;
        . = 0x00004e38; gSamusDoorPositionOffset = .;
        . = 0x00004e3c; gDestinationDoor = .;
        . = 0x00004e48; gUnk_03004e48 = .;
        . = 0x00004e58; gColorFading = .;
        . = 0x00005318; gClipdataCodePointer = .;

        . = 0x00005408; src/libgcc/fp-bit-base.o(.bss);
        . = 0x00005420; src/libgcc/float.o(.bss);

        . = 0x00007ffc; gInterruptCodePointer = .;
        
    } >iwram

    rom : ALIGN(2) {
        asm/romheader.o(.text);
        asm/crt0.o(.text);
        asm/intr_main.o(.text);
        src/agbmain.o(.text);
        src/init_game.o(.text);
        src/softreset.o(.text);
        src/syscall_wrappers.o(.text);
        src/update_input.o(.text);
        src/init_helpers.o(.text);
        src/fixed_point.o(.text);
        src/callbacks.o(.text);

        asm/disasm_0x08000c28.o(.text);
        asm/syscalls.o(.text);
        asm/disasm_0x08004bcc.o(.text);

        src/demo_input.o(.text);

        asm/disasm_0x0800cbb8.o(.text);

        src/in_game.o(.text);
        src/sprite.o(.text);

        asm/disasm_0x0800fd90.o(.text);

        src/sprite_debris.o(.text);
        src/location_text.o(.text);
        src/sprites_AI/target.o(.text);
        src/sprites_AI/unused_sprites.o(.text);
        src/sprites_AI/bubbles.o(.text);

        asm/disasm_0x0801503C.o(.text);

        src/sprites_AI/movable_platform.o(.text);

        asm/disasm_0x0801e794.o(.text);

        src/sprites_AI/super_missile_barrier.o(.text);
        src/sprites_AI/power_bomb_barrier.o(.text);
        src/sprites_AI/ripper.o(.text);
        src/sprites_AI/zoro_cocoon.o(.text);
        src/sprites_AI/gadora.o(.text);
        src/sprites_AI/destroyed_data_pad.o(.text);
        src/sprites_AI/nettori.o(.text);
        src/sprites_AI/zazabi.o(.text);
        src/sprites_AI/elevator_pad.o(.text);
        src/sprites_AI/serris.o(.text);

        asm/disasm_0x08049888.o(.text);

        src/event_checks.o(.text);

        asm/disasm_0x08061004.o(.text);

        src/power_bomb_explosion.o(.text);

        asm/disasm_0x080685b4.o(.text);

        src/demo.o(.text);
        src/hud.o(.text);
        src/escape.o(.text);

        asm/disasm_0x08072d50.o(.text);

        src/menus/title_screen.o(.text);

        asm/disasm_0x08087610.o(.text);

        asm/libgcc.o(.text);
        asm/disasm_0x080a374c.o(.text);
        src/libgcc/fp-bit-base.o(.text);
        src/libgcc/float.o(.text);
        src/libgcc/libgcc.o(.text);
    } >rom

    .rodata : ALIGN(2) {
        src/data/generic_data.o(.rodata);
        src/data/sprite_data.o(.rodata);
        src/data/sprite_debris_data.o(.rodata);
        src/data/sprites/target.o(.rodata);
        src/data/sprites/movable_platform.o(.rodata);
        src/data/sprites/super_missile_barrier.o(.rodata);
        src/data/sprites/power_bomb_barrier.o(.rodata);
        src/data/sprites/ripper.o(.rodata);
        src/data/sprites/zoro_cocoon.o(.rodata);
        src/data/sprites/gadora.o(.rodata);
        src/data/sprites/destroyed_data_pad.o(.rodata);
        src/data/sprites/nettori.o(.rodata);
        src/data/sprites/zazabi.o(.rodata);
        src/data/sprites/elevator_pad.o(.rodata);
        src/data/sprites/serris.o(.rodata);
        src/data/sprites/x_parasite.o(.rodata);
        src/data/demo_data.o(.rodata);
        src/data/hud_data.o(.rodata);
        src/data/escape_data.o(.rodata);
        src/data/particle_data.o(.rodata);
        src/data/menus/title_screen.o(.rodata);
        src/data/engine_pointers.o(.rodata);
    } >rom
}
