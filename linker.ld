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
        . = 0x00000b84; gPauseScreenFlag = .;
        . = 0x00000bdc; gCurrentCutscene = .;
        . = 0x00000bde; gMainGameMode = .;
        . = 0x00000be0; gSubGameMode1 = .;
        . = 0x00000be2; gSubGameMode2 = .;
        . = 0x00000be3; gUnk_03000be3 = .;
        . = 0x00000be4; gClearedEveryFrame = .;
        . = 0x00000be5; gFrameCounter8Bit = .;
        . = 0x00000be6; gVBlankRequestFlag = .;
        . = 0x000011e8; gButtonInput = .;
        . = 0x000011ea; gButtonInputCopy = .;
        . = 0x000011ec; gChangedInput = .;
        . = 0x00001242; gUnk_03001242 = .;
    } >iwram

    rom : ALIGN(2) {
        asm/romheader.o(.text);
        asm/crt0.o(.text);
        asm/intr_main.o(.text);
        src/agbmain.o(.text);
        src/init_game.o(.text);
        asm/disasm_0x08000230.o(.text);
    } >rom

    .rodata : ALIGN(2) {
        src/data/blob.o(.rodata);
    } >rom
}
