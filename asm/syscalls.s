    .include "asm/macros.inc"

    .syntax unified

    thumb_func_start CpuFastSet
CpuFastSet:
    swi #0xC
    bx lr

    thumb_func_start CpuSet
CpuSet:
    swi #0xB
    bx lr

    thumb_func_start DivArmDiv
DivArmDiv:
    swi #0x7
    bx lr

    thumb_func_start DivArmMod
DivArmMod:
    swi #0x7
    adds r0, r1, 0
    bx lr

    thumb_func_start LZ77UncompVram
LZ77UncompVram:
    swi #0x12
    bx lr

    thumb_func_start LZ77UncompWram
LZ77UncompWram:
    swi #0x11
    bx lr

    thumb_func_start MidiKey2Freq
MidiKey2Freq:
    swi #0x1F
    bx lr

    thumb_func_start SoundBias0
SoundBias0:
    movs r0, #0x0
    swi #0x19
    bx lr

    thumb_func_start SoundBias1
SoundBias1:
    movs r0, #0x1
    swi #0x19
    bx lr

    .align 2, 0 @ don't insert nops
