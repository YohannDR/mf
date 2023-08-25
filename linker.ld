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
        . = 0x00000020; gRebootGame = .;
        . = 0x00000025; gDisableSoftReset = .;
        . = 0x00000140; gSpriteData = .;
        . = 0x000006bc; gCurrentSprite = .;
        . = 0x000007a4; gPreviousVerticalCollisionCheck = .;
        . = 0x000007a5; gPreviousCollisionCheck = .;
        . = 0x000007a6; gIgnoreSamusAndSpriteCollision = .;
        . = 0x00000b84; gPauseScreenFlag = .;
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
        . = 0x00001242; gDemoState = .;
        . = 0x00001243; gPoseLock = .;
        . = 0x00001244; gSamusData = .;
        . = 0x00001310; gEquipment = .;
        . = 0x00001342; gPreviousXPosition = .;
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

        asm/libgcc.o(.text);
        asm/disasm_0x080a374c.o(.text);
        src/libgcc/fp-bit-base.o(.text);
        src/libgcc/float.o(.text);
        src/libgcc/libgcc.o(.text);
    } >rom

    .rodata : ALIGN(2) {
        src/data/blob.o(.rodata);
    } >rom
}
