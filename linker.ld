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
        . = 0x0000001a; gSamusOnTopOfBackgrounds = .;
        . = 0x00000020; gRebootGame = .;
        . = 0x00000025; gDisableSoftReset = .;
        . = 0x0000002c; gCurrentArea = .;
        . = 0x0000002d; gCurrentRoom = .;
        . = 0x00000030; gDisplayLocationName = .;
        . = 0x00000052; gSpritesetNumber = .;
        . = 0x000000a4; gCurrentRoomEntry = .;
        . = 0x00000140; gSpriteData = .;
        . = 0x00000680; gSpritesetSpriteIds = .;
        . = 0x0000068f; gSpritesetSpriteGfxSlots = .;
        . = 0x000006a0; gXParasiteTargetYPosition = .;
        . = 0x000006a2; gXParasiteTargetXPosition = .;
        . = 0x000006a4; gAbilityRestingYPosition = .;
        . = 0x000006a6; gAbilityRestingXPosition = .;
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
        . = 0x000007f0; gSpriteRandomNumber = .;
        . = 0x000007f1; gBossWork0 = .;
        . = 0x000007f2; gBossWork1 = .;
        . = 0x000007f3; gBossWork2 = .;
        . = 0x000007f4; gBossWork3 = .;
        . = 0x000007f5; gBossWork4 = .;
        . = 0x000007f6; gBossWork5 = .;
        . = 0x00000b84; gPauseScreenFlag = .;
        . = 0x00000b8b; gIsLoadingFile = .;
        . = 0x00000b8f; gUnk_03000B8F = .;
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
        . = 0x00001228; gBg1XPosition = .;
        . = 0x0000122A; gBg1YPosition = .;
        . = 0x00001242; gDemoState = .;
        . = 0x00001243; gPoseLock = .;
        . = 0x00001244; gSamusData = .;
        . = 0x00001270; gSamusDataCopy = .;
        . = 0x00001310; gEquipment = .;
        . = 0x00001342; gPreviousXPosition = .;
        . = 0x00001348; gPreventMovementTimer = .;
        . = 0x000019c4; gVBlankCallback = .;
        . = 0x000019c8; gHBlankCallback = .;
        . = 0x000019cc; gVCountCallback = .;

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
        src/sprite.o(.text);
        asm/disasm_0x0800fd90.o(.text);
        src/sprite_debris.o(.text);
        src/location_text.o(.text);
        src/sprites_AI/target.o(.text);
        asm/disasm_0x08014B9C.o(.text);

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
        src/data/particle_data.o(.rodata);
        src/data/engine_pointers.o(.rodata);
    } >rom
}
