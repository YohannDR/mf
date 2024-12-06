    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start FileSelectSubroutine
FileSelectSubroutine: @ 0x0809E598
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _0809E5B4 @ =gSubGameMode1
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #5
	bls _0809E5AA
	b _0809E738
_0809E5AA:
	lsls r0, r1, #2
	ldr r1, _0809E5B8 @ =_0809E5BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809E5B4: .4byte gSubGameMode1
_0809E5B8: .4byte _0809E5BC
_0809E5BC: @ jump table
	.4byte _0809E5D4 @ case 0
	.4byte _0809E644 @ case 1
	.4byte _0809E69C @ case 2
	.4byte _0809E6BC @ case 3
	.4byte _0809E6E4 @ case 4
	.4byte _0809E704 @ case 5
_0809E5D4:
	bl FileSelectInit
	ldr r1, _0809E614 @ =0x03000B94
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0809E624
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	bne _0809E624
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809E624
	ldr r0, _0809E618 @ =0x03000B8D
	ldrb r2, [r0]
	lsls r2, r2, #0x14
	movs r0, #0xc4
	lsls r0, r0, #0xe
	adds r2, r2, r0
	asrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xf
	movs r3, #0
	bl FileSelectSetupOam
	ldr r1, _0809E61C @ =0x04000014
	movs r0, #2
	strh r0, [r1]
	ldr r1, _0809E620 @ =gSubGameMode1
	movs r0, #1
	b _0809E736
	.align 2, 0
_0809E614: .4byte 0x03000B94
_0809E618: .4byte 0x03000B8D
_0809E61C: .4byte 0x04000014
_0809E620: .4byte gSubGameMode1
_0809E624:
	ldr r1, _0809E638 @ =0x04000014
	ldr r2, _0809E63C @ =0x0000FFD0
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x30
	strh r0, [r1]
	ldr r1, _0809E640 @ =gSubGameMode1
	movs r0, #5
	b _0809E736
	.align 2, 0
_0809E638: .4byte 0x04000014
_0809E63C: .4byte 0x0000FFD0
_0809E640: .4byte gSubGameMode1
_0809E644:
	ldr r4, _0809E65C @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809E660
	movs r0, #1
	bl FileSelectDrawText
	b _0809E738
	.align 2, 0
_0809E65C: .4byte gNonGameplayRam
_0809E660:
	cmp r0, #2
	bne _0809E66C
	movs r0, #0
	bl FileSelectDrawFileInfo
	b _0809E738
_0809E66C:
	cmp r0, #3
	bne _0809E678
	movs r0, #1
	bl FileSelectDrawFileInfo
	b _0809E738
_0809E678:
	cmp r0, #4
	bne _0809E738
	movs r0, #2
	bl FileSelectDrawFileInfo
	movs r0, #0
	strb r0, [r4, #0xc]
	ldr r1, _0809E694 @ =gWrittenToBldy
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _0809E698 @ =gSubGameMode1
	movs r0, #2
	b _0809E736
	.align 2, 0
_0809E694: .4byte gWrittenToBldy
_0809E698: .4byte gSubGameMode1
_0809E69C:
	bl FileSelectDrawAllOam
	ldr r1, _0809E6AC @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0809E6B0
	subs r0, #1
	b _0809E736
	.align 2, 0
_0809E6AC: .4byte gWrittenToBldy
_0809E6B0:
	ldr r1, _0809E6B8 @ =gSubGameMode1
	ldrh r0, [r1]
	adds r0, #1
	b _0809E736
	.align 2, 0
_0809E6B8: .4byte gSubGameMode1
_0809E6BC:
	bl FileSelectInput
	ldr r1, _0809E6DC @ =gNonGameplayRam
	strb r0, [r1, #0x12]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E738
	ldr r1, _0809E6E0 @ =gSubGameMode1
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0x14
	bl MusicFade
	b _0809E738
	.align 2, 0
_0809E6DC: .4byte gNonGameplayRam
_0809E6E0: .4byte gSubGameMode1
_0809E6E4:
	ldr r1, _0809E6F0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0809E6F4
	adds r0, #1
	b _0809E736
	.align 2, 0
_0809E6F0: .4byte gWrittenToBldy
_0809E6F4:
	ldr r0, _0809E700 @ =gNonGameplayRam
	movs r5, #0x12
	ldrsb r5, [r0, r5]
	movs r0, #0
	strh r0, [r2]
	b _0809E738
	.align 2, 0
_0809E700: .4byte gNonGameplayRam
_0809E704:
	bl FileSelectProcessCorruptedFile
	cmp r0, #0
	beq _0809E738
	ldr r1, _0809E740 @ =0x04000014
	movs r0, #2
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0809E744 @ =0x0000FFFA
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0809E748 @ =0x03000B8D
	ldrb r2, [r0]
	lsls r2, r2, #0x14
	movs r0, #0xc4
	lsls r0, r0, #0xe
	adds r2, r2, r0
	asrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xf
	movs r3, #0
	bl FileSelectSetupOam
	ldr r1, _0809E74C @ =gSubGameMode1
	movs r0, #3
_0809E736:
	strh r0, [r1]
_0809E738:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809E740: .4byte 0x04000014
_0809E744: .4byte 0x0000FFFA
_0809E748: .4byte 0x03000B8D
_0809E74C: .4byte gSubGameMode1

	thumb_func_start FileSelectInit
FileSelectInit: @ 0x0809E750
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r3, _0809E920 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _0809E924 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0809E928 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0809E92C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809E930 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809E934 @ =unk_9eaa4
	bl CallbackSetVBlank
	movs r0, #0x80
	lsls r0, r0, #0x13
	strh r4, [r0]
	ldr r1, _0809E938 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _0809E93C @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0809E940 @ =0x04000054
	strh r1, [r0]
	bl ClearGfxRam
	ldr r0, _0809E944 @ =gNextOamSlot
	strb r4, [r0]
	bl ResetFreeOam
	movs r6, #0
	str r6, [sp]
	ldr r4, _0809E948 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r0, _0809E94C @ =gNonGameplayRam
	str r0, [r4, #4]
	ldr r0, _0809E950 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809E954 @ =0x0400000E
	strh r6, [r0]
	subs r0, #2
	strh r6, [r0]
	subs r0, #2
	strh r6, [r0]
	subs r0, #2
	strh r6, [r0]
	adds r0, #8
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r1, _0809E958 @ =0x04000016
	ldr r2, _0809E95C @ =0x0000FFFA
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0809E960 @ =0x04000018
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, _0809E964 @ =0x08742FB4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0809E968 @ =0x087470E0
	ldr r1, _0809E96C @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0809E970 @ =0x087476A0
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	mov r8, r0
	str r0, [r4, #4]
	ldr r0, _0809E974 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809E978 @ =0x0873CFAC
	ldr r1, _0809E97C @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0809E980 @ =0x0873D380
	movs r5, #0x80
	lsls r5, r5, #0x12
	adds r1, r5, #0
	bl LZ77UncompVram
	str r5, [r4]
	ldr r0, _0809E984 @ =0x0600E800
	str r0, [r4, #4]
	ldr r0, _0809E988 @ =0x84000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809E98C @ =0x0873D5EC
	ldr r1, _0809E990 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0809E994 @ =0x0873DB84
	str r0, [r4]
	mov r2, r8
	str r2, [r4, #4]
	ldr r0, _0809E998 @ =0x84000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _0809E99C @ =0x0873DAC4
	str r1, [r4]
	str r2, [r4, #4]
	ldr r0, _0809E9A0 @ =0x84000002
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r1, #8
	str r1, [r4]
	ldr r0, _0809E9A4 @ =0x0500001C
	str r0, [r4, #4]
	ldr r0, _0809E9A8 @ =0x84000001
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	strh r6, [r2]
	movs r3, #0
	ldr r7, _0809E9AC @ =0x02000800
	ldr r5, _0809E9B0 @ =0x02000340
	ldr r6, _0809E9B4 @ =0x00000FFF
	movs r0, #0x80
	lsls r0, r0, #5
	adds r4, r0, #0
_0809E86A:
	adds r2, r3, r7
	adds r0, r3, r5
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r3, #2
	cmp r3, #0xff
	bls _0809E86A
	ldr r0, _0809E9B8 @ =0x0873DC20
	ldr r1, _0809E9BC @ =0x06010000
	bl LZ77UncompVram
	ldr r1, _0809E948 @ =0x040000D4
	ldr r0, _0809E9C0 @ =0x08740D08
	str r0, [r1]
	ldr r0, _0809E9C4 @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _0809E974 @ =0x84000080
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, _0809E94C @ =gNonGameplayRam
	movs r0, #0
	strh r0, [r4, #8]
	ldr r1, _0809E9C8 @ =0x0879EC68
	ldr r0, _0809E9CC @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	str r0, [r4, #4]
	bl Sram_WriteFileInfo
	ldr r0, _0809E9D0 @ =0x03000B8D
	ldrb r0, [r0]
	strb r0, [r4, #0xd]
	movs r0, #9
	movs r1, #0x66
	movs r2, #0x74
	movs r3, #1
	bl FileSelectSetupOam
	movs r0, #6
	movs r1, #0x8e
	movs r2, #0x74
	movs r3, #1
	bl FileSelectSetupOam
	movs r0, #7
	movs r1, #0x84
	movs r2, #0x30
	movs r3, #1
	bl FileSelectSetupOam
	bl FileSelectDrawAllOam
	ldr r1, _0809E954 @ =0x0400000E
	ldr r2, _0809E9D4 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #2
	ldr r2, _0809E9D8 @ =0x00001C0A
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #2
	adds r2, #0xff
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #2
	adds r2, #0xff
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #8
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0809E9DC @ =FileSelectVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E920: .4byte 0x04000208
_0809E924: .4byte 0x04000004
_0809E928: .4byte 0x0000FFEF
_0809E92C: .4byte 0x04000200
_0809E930: .4byte 0x0000FFFD
_0809E934: .4byte unk_9eaa4
_0809E938: .4byte 0x04000050
_0809E93C: .4byte gWrittenToBldy
_0809E940: .4byte 0x04000054
_0809E944: .4byte gNextOamSlot
_0809E948: .4byte 0x040000D4
_0809E94C: .4byte gNonGameplayRam
_0809E950: .4byte 0x85000150
_0809E954: .4byte 0x0400000E
_0809E958: .4byte 0x04000016
_0809E95C: .4byte 0x0000FFFA
_0809E960: .4byte 0x04000018
_0809E964: .4byte 0x08742FB4
_0809E968: .4byte 0x087470E0
_0809E96C: .4byte 0x0600F800
_0809E970: .4byte 0x087476A0
_0809E974: .4byte 0x84000080
_0809E978: .4byte 0x0873CFAC
_0809E97C: .4byte 0x0600E000
_0809E980: .4byte 0x0873D380
_0809E984: .4byte 0x0600E800
_0809E988: .4byte 0x84000200
_0809E98C: .4byte 0x0873D5EC
_0809E990: .4byte 0x0600F000
_0809E994: .4byte 0x0873DB84
_0809E998: .4byte 0x84000008
_0809E99C: .4byte 0x0873DAC4
_0809E9A0: .4byte 0x84000002
_0809E9A4: .4byte 0x0500001C
_0809E9A8: .4byte 0x84000001
_0809E9AC: .4byte 0x02000800
_0809E9B0: .4byte 0x02000340
_0809E9B4: .4byte 0x00000FFF
_0809E9B8: .4byte 0x0873DC20
_0809E9BC: .4byte 0x06010000
_0809E9C0: .4byte 0x08740D08
_0809E9C4: .4byte 0x05000200
_0809E9C8: .4byte 0x0879EC68
_0809E9CC: .4byte 0x03000011
_0809E9D0: .4byte 0x03000B8D
_0809E9D4: .4byte 0x00001F03
_0809E9D8: .4byte 0x00001C0A
_0809E9DC: .4byte FileSelectVblank

	thumb_func_start FileSelectVblank
FileSelectVblank: @ 0x0809E9E0
	push {r4, lr}
	ldr r1, _0809EA10 @ =0x040000D4
	ldr r0, _0809EA14 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0809EA18 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0x80
	ldr r0, _0809EA1C @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0809EA20 @ =gNonGameplayRam
	ldrb r0, [r1, #0x11]
	adds r3, r1, #0
	cmp r0, #5
	bhi _0809EA98
	lsls r0, r0, #2
	ldr r1, _0809EA24 @ =_0809EA28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809EA10: .4byte 0x040000D4
_0809EA14: .4byte gOamData
_0809EA18: .4byte 0x84000100
_0809EA1C: .4byte gWrittenToBldy
_0809EA20: .4byte gNonGameplayRam
_0809EA24: .4byte _0809EA28
_0809EA28: @ jump table
	.4byte _0809EA9C @ case 0
	.4byte _0809EA40 @ case 1
	.4byte _0809EA60 @ case 2
	.4byte _0809EA50 @ case 3
	.4byte _0809EA70 @ case 4
	.4byte _0809EA80 @ case 5
_0809EA40:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	orrs r0, r1
	b _0809EA8A
_0809EA50:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	orrs r0, r1
	b _0809EA8A
_0809EA60:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0809EA6C @ =0x0000FEFF
	b _0809EA88
	.align 2, 0
_0809EA6C: .4byte 0x0000FEFF
_0809EA70:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0809EA7C @ =0x0000FDFF
	b _0809EA88
	.align 2, 0
_0809EA7C: .4byte 0x0000FDFF
_0809EA80:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0809EA94 @ =0x0000FCFF
_0809EA88:
	ands r0, r1
_0809EA8A:
	strh r0, [r2]
	movs r0, #0
	strb r0, [r3, #0x11]
	b _0809EA9C
	.align 2, 0
_0809EA94: .4byte 0x0000FCFF
_0809EA98:
	movs r0, #0
	strb r0, [r1, #0x11]
_0809EA9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_9eaa4
unk_9eaa4: @ 0x0809EAA4
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FileSelectInput
FileSelectInput: @ 0x0809EAB0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	bl FileSelectProcessOam
	ldr r0, _0809EAD4 @ =gNonGameplayRam
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0x22
	bls _0809EAC8
	bl _0809F50A
_0809EAC8:
	lsls r0, r0, #2
	ldr r1, _0809EAD8 @ =_0809EADC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809EAD4: .4byte gNonGameplayRam
_0809EAD8: .4byte _0809EADC
_0809EADC: @ jump table
	.4byte _0809EB68 @ case 0
	.4byte _0809EBB0 @ case 1
	.4byte _0809EC88 @ case 2
	.4byte _0809ECF8 @ case 3
	.4byte _0809ECC8 @ case 4
	.4byte _0809ED9A @ case 5
	.4byte _0809EF3C @ case 6
	.4byte _0809EDB8 @ case 7
	.4byte _0809EF24 @ case 8
	.4byte _0809EDD4 @ case 9
	.4byte _0809EE42 @ case 10
	.4byte _0809EE82 @ case 11
	.4byte _0809EEA0 @ case 12
	.4byte _0809EEDE @ case 13
	.4byte _0809EF24 @ case 14
	.4byte _0809EF3C @ case 15
	.4byte _0809EF54 @ case 16
	.4byte _0809EFE0 @ case 17
	.4byte _0809F042 @ case 18
	.4byte _0809F068 @ case 19
	.4byte _0809F0E4 @ case 20
	.4byte _0809F124 @ case 21
	.4byte _0809F162 @ case 22
	.4byte _0809F1A2 @ case 23
	.4byte _0809F1EC @ case 24
	.4byte _0809F24A @ case 25
	.4byte _0809F2B6 @ case 26
	.4byte _0809F2E4 @ case 27
	.4byte _0809F374 @ case 28
	.4byte _0809F3B2 @ case 29
	.4byte _0809F3EA @ case 30
	.4byte _0809F418 @ case 31
	.4byte _0809F446 @ case 32
	.4byte _0809F4AA @ case 33
	.4byte _0809F508 @ case 34
_0809EB68:
	ldr r0, _0809EB8C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0809EB94
	ldr r1, _0809EB90 @ =gNonGameplayRam
	ldrb r0, [r1, #0xd]
	cmp r0, #3
	bne _0809EB80
	bl _0809F50A
_0809EB80:
	cmp r0, #4
	beq _0809EBA2
	movs r0, #1
	strh r0, [r1, #0xa]
	bl _0809F50A
	.align 2, 0
_0809EB8C: .4byte gChangedInput
_0809EB90: .4byte gNonGameplayRam
_0809EB94:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0809EBA0
	bl _0809F50A
_0809EBA0:
	ldr r1, _0809EBAC @ =gNonGameplayRam
_0809EBA2:
	movs r0, #0x22
	strh r0, [r1, #0xa]
	bl _0809F50A
	.align 2, 0
_0809EBAC: .4byte gNonGameplayRam
_0809EBB0:
	ldr r1, _0809EBE8 @ =gNonGameplayRam
	ldrb r0, [r1, #0xc]
	adds r0, #1
	strb r0, [r1, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #1
	bne _0809EBF4
	strh r0, [r4, #8]
	ldr r1, _0809EBEC @ =0x0879EC68
	ldr r0, _0809EBF0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #4]
	str r0, [r4, #4]
	movs r0, #2
	bl FileSelectDrawText
	movs r0, #0xb
	movs r1, #0x52
	movs r2, #0x76
	b _0809F2FC
	.align 2, 0
_0809EBE8: .4byte gNonGameplayRam
_0809EBEC: .4byte 0x0879EC68
_0809EBF0: .4byte 0x03000011
_0809EBF4:
	cmp r0, #0xc
	beq _0809EBFC
	bl _0809F50A
_0809EBFC:
	ldr r2, _0809EC34 @ =0x03000B94
	ldrb r1, [r4, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _0809EC1E
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _0809EC1E
	ldrb r0, [r1]
	cmp r0, #1
	bne _0809EC48
_0809EC1E:
	ldr r1, _0809EC38 @ =0x040000D4
	ldr r0, _0809EC3C @ =0x02000340
	str r0, [r1]
	ldr r0, _0809EC40 @ =0x0600EB40
	str r0, [r1, #4]
	ldr r0, _0809EC44 @ =0x84000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #3
	b _0809EC5A
	.align 2, 0
_0809EC34: .4byte 0x03000B94
_0809EC38: .4byte 0x040000D4
_0809EC3C: .4byte 0x02000340
_0809EC40: .4byte 0x0600EB40
_0809EC44: .4byte 0x84000040
_0809EC48:
	ldr r1, _0809EC78 @ =0x040000D4
	ldr r0, _0809EC7C @ =0x02000800
	str r0, [r1]
	ldr r0, _0809EC80 @ =0x0600EB40
	str r0, [r1, #4]
	ldr r0, _0809EC84 @ =0x84000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #2
_0809EC5A:
	strh r0, [r4, #0xa]
	movs r0, #0
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xe]
	movs r0, #2
	movs r1, #0x16
	movs r2, #0x67
	movs r3, #1
	bl FileSelectSetupOam
	movs r0, #3
	strb r0, [r4, #0x11]
	bl _0809F50A
	.align 2, 0
_0809EC78: .4byte 0x040000D4
_0809EC7C: .4byte 0x02000800
_0809EC80: .4byte 0x0600EB40
_0809EC84: .4byte 0x84000040
_0809EC88:
	ldr r0, _0809ECBC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0809ED04
	movs r4, #9
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0809ECA2
	bl _0809F50A
_0809ECA2:
	ldr r2, _0809ECC0 @ =0x03000B94
	ldr r3, _0809ECC4 @ =gNonGameplayRam
	ldrb r1, [r3, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0809ED74
	b _0809ED54
	.align 2, 0
_0809ECBC: .4byte gChangedInput
_0809ECC0: .4byte 0x03000B94
_0809ECC4: .4byte gNonGameplayRam
_0809ECC8:
	ldr r4, _0809ECE8 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809ECEC
	movs r0, #2
	bl FileSelectDestroyOamOfType
	movs r0, #4
	strb r0, [r4, #0x11]
	bl _0809F50A
	.align 2, 0
_0809ECE8: .4byte gNonGameplayRam
_0809ECEC:
	cmp r0, #0xc
	beq _0809ECF4
	bl _0809F50A
_0809ECF4:
	bl sub_0809F502
_0809ECF8:
	ldr r0, _0809ED10 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809ED18
_0809ED04:
	ldr r1, _0809ED14 @ =gNonGameplayRam
	movs r0, #4
	strh r0, [r1, #0xa]
	bl _0809F50A
	.align 2, 0
_0809ED10: .4byte gChangedInput
_0809ED14: .4byte gNonGameplayRam
_0809ED18:
	movs r4, #9
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0809ED26
	bl _0809F50A
_0809ED26:
	ldr r3, _0809ED5C @ =gNonGameplayRam
	ldrb r0, [r3, #0xe]
	cmp r0, #0
	bne _0809ED82
	ldr r2, _0809ED60 @ =0x03000B94
	ldrb r1, [r3, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809ED64
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _0809ED74
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _0809ED54
	bl _0809F50A
_0809ED54:
	movs r0, #5
	strh r0, [r3, #0xa]
	bl _0809F50A
	.align 2, 0
_0809ED5C: .4byte gNonGameplayRam
_0809ED60: .4byte 0x03000B94
_0809ED64:
	cmp r0, #1
	beq _0809ED6C
	bl _0809F50A
_0809ED6C:
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0809ED7A
_0809ED74:
	strh r4, [r3, #0xa]
	bl _0809F50A
_0809ED7A:
	movs r0, #7
	strh r0, [r3, #0xa]
	bl _0809F50A
_0809ED82:
	cmp r0, #1
	bne _0809ED8C
	movs r1, #0
	movs r0, #0x10
	b _0809EF1E
_0809ED8C:
	cmp r0, #2
	beq _0809ED94
	bl _0809F50A
_0809ED94:
	movs r0, #0x1b
	strh r0, [r3, #0xa]
	b _0809F50A
_0809ED9A:
	ldr r2, _0809EDB4 @ =gNonGameplayRam
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2a
	beq _0809EDAC
	b _0809F50A
_0809EDAC:
	movs r1, #0
	movs r0, #6
	b _0809F4A4
	.align 2, 0
_0809EDB4: .4byte gNonGameplayRam
_0809EDB8:
	ldr r2, _0809EDD0 @ =gNonGameplayRam
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2a
	beq _0809EDCA
	b _0809F50A
_0809EDCA:
	movs r1, #0
	movs r0, #8
	b _0809F4A4
	.align 2, 0
_0809EDD0: .4byte gNonGameplayRam
_0809EDD4:
	ldr r4, _0809EDF4 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EDF8
	movs r0, #0x17
	movs r1, #0x9c
	movs r2, #0x78
	movs r3, #1
	bl FileSelectSetupOam
	b _0809F3CA
	.align 2, 0
_0809EDF4: .4byte gNonGameplayRam
_0809EDF8:
	cmp r0, #2
	bne _0809EDFE
	b _0809F4D8
_0809EDFE:
	cmp r0, #3
	bne _0809EE24
	movs r0, #0x18
	strh r0, [r4, #8]
	ldr r1, _0809EE1C @ =0x0879EC68
	ldr r0, _0809EE20 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x60]
	str r0, [r4, #4]
	b _0809F32C
	.align 2, 0
_0809EE1C: .4byte 0x0879EC68
_0809EE20: .4byte 0x03000011
_0809EE24:
	cmp r0, #0xc
	beq _0809EE2A
	b _0809F50A
_0809EE2A:
	strb r1, [r4, #0xc]
	movs r0, #0xa
	strh r0, [r4, #0xa]
	movs r0, #0x18
	movs r1, #0x66
	movs r2, #0x69
	movs r3, #1
	bl FileSelectSetupOam
	movs r0, #1
	strb r0, [r4, #0x11]
	b _0809F50A
_0809EE42:
	ldr r0, _0809EE58 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809EE60
	ldr r1, _0809EE5C @ =gNonGameplayRam
	movs r0, #0xb
	strh r0, [r1, #0xa]
	b _0809F50A
	.align 2, 0
_0809EE58: .4byte gChangedInput
_0809EE5C: .4byte gNonGameplayRam
_0809EE60:
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809EE6A
	b _0809F50A
_0809EE6A:
	ldr r1, _0809EE78 @ =gNonGameplayRam
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _0809EE7C
	movs r0, #0xc
	strh r0, [r1, #0xa]
	b _0809F50A
	.align 2, 0
_0809EE78: .4byte gNonGameplayRam
_0809EE7C:
	movs r0, #0xd
	strh r0, [r1, #0xa]
	b _0809F50A
_0809EE82:
	ldr r4, _0809EE9C @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0809EE96
	b _0809F3DA
_0809EE96:
	movs r0, #0x18
	b _0809F3C6
	.align 2, 0
_0809EE9C: .4byte gNonGameplayRam
_0809EEA0:
	ldr r3, _0809EED0 @ =gNonGameplayRam
	ldrb r0, [r3, #0xc]
	adds r0, #1
	strb r0, [r3, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2a
	beq _0809EEB2
	b _0809F50A
_0809EEB2:
	movs r0, #0
	strb r0, [r3, #0xc]
	ldr r2, _0809EED4 @ =0x03000B94
	ldrb r1, [r3, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _0809EED8
	movs r0, #0xe
	strh r0, [r3, #0xa]
	b _0809F50A
	.align 2, 0
_0809EED0: .4byte gNonGameplayRam
_0809EED4: .4byte 0x03000B94
_0809EED8:
	movs r0, #0xf
	strh r0, [r3, #0xa]
	b _0809F50A
_0809EEDE:
	ldr r3, _0809EF0C @ =gNonGameplayRam
	ldrb r0, [r3, #0xc]
	adds r0, #1
	movs r4, #0
	strb r0, [r3, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EF14
	ldr r2, _0809EF10 @ =0x03000B94
	ldrb r1, [r3, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r4, [r0]
	ldrb r1, [r3, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r4, [r0, #0x11]
	b _0809F50A
	.align 2, 0
_0809EF0C: .4byte gNonGameplayRam
_0809EF10: .4byte 0x03000B94
_0809EF14:
	cmp r0, #0x2a
	beq _0809EF1A
	b _0809F50A
_0809EF1A:
	movs r1, #0
	movs r0, #0xf
_0809EF1E:
	strh r0, [r3, #0xa]
	strb r1, [r3, #0xc]
	b _0809F50A
_0809EF24:
	ldr r0, _0809EF34 @ =0x03000B8D
	ldr r1, _0809EF38 @ =gNonGameplayRam
	ldrb r1, [r1, #0xd]
	strb r1, [r0]
	bl Sram_CheckLoadSaveFile
	movs r7, #2
	b _0809F50A
	.align 2, 0
_0809EF34: .4byte 0x03000B8D
_0809EF38: .4byte gNonGameplayRam
_0809EF3C:
	ldr r0, _0809EF4C @ =0x03000B8D
	ldr r1, _0809EF50 @ =gNonGameplayRam
	ldrb r1, [r1, #0xd]
	strb r1, [r0]
	bl Sram_CheckLoadSaveFile
	movs r7, #1
	b _0809F50A
	.align 2, 0
_0809EF4C: .4byte 0x03000B8D
_0809EF50: .4byte gNonGameplayRam
_0809EF54:
	ldr r2, _0809EF6C @ =gNonGameplayRam
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809EF70
	movs r0, #2
	strb r0, [r2, #0x11]
	movs r0, #0xc
	b _0809F2F8
	.align 2, 0
_0809EF6C: .4byte gNonGameplayRam
_0809EF70:
	cmp r0, #2
	bne _0809EF7A
	movs r0, #0
	str r0, [sp]
	b _0809F4DA
_0809EF7A:
	cmp r0, #3
	bne _0809EFA0
	movs r0, #2
	strh r0, [r2, #8]
	ldr r1, _0809EF98 @ =0x0879EC68
	ldr r0, _0809EF9C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #8]
	str r0, [r2, #4]
	b _0809F32C
	.align 2, 0
_0809EF98: .4byte 0x0879EC68
_0809EF9C: .4byte 0x03000011
_0809EFA0:
	cmp r0, #0xc
	beq _0809EFA6
	b _0809F50A
_0809EFA6:
	movs r0, #0
	movs r1, #0x11
	strh r1, [r2, #0xa]
	strb r0, [r2, #0xc]
	strb r0, [r2, #0xf]
	ldrb r0, [r2, #0xd]
	cmp r0, #0
	bne _0809EFC8
	movs r0, #1
	strb r0, [r2, #0xf]
	movs r0, #3
	movs r1, #0x84
	movs r2, #0x30
	movs r3, #1
	bl FileSelectSetupOam
	b _0809EFD4
_0809EFC8:
	movs r0, #3
	movs r1, #0x84
	movs r2, #0x30
	movs r3, #1
	bl FileSelectSetupOam
_0809EFD4:
	ldr r1, _0809EFDC @ =gNonGameplayRam
	movs r0, #1
	strb r0, [r1, #0x11]
	b _0809F50A
	.align 2, 0
_0809EFDC: .4byte gNonGameplayRam
_0809EFE0:
	ldr r0, _0809EFF4 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809EFFC
	ldr r1, _0809EFF8 @ =gNonGameplayRam
	movs r0, #0x12
	strh r0, [r1, #0xa]
	b _0809F50A
	.align 2, 0
_0809EFF4: .4byte gChangedInput
_0809EFF8: .4byte gNonGameplayRam
_0809EFFC:
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809F006
	b _0809F50A
_0809F006:
	ldr r2, _0809F034 @ =0x03000B94
	ldr r3, _0809F038 @ =gNonGameplayRam
	ldrb r1, [r3, #0xf]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r4, r3, #0
	cmp r0, #1
	beq _0809F02C
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _0809F02C
	ldrb r0, [r1]
	cmp r0, #1
	bne _0809F03C
_0809F02C:
	movs r0, #0x13
	strh r0, [r4, #0xa]
	b _0809F50A
	.align 2, 0
_0809F034: .4byte 0x03000B94
_0809F038: .4byte gNonGameplayRam
_0809F03C:
	movs r0, #0x14
	strh r0, [r3, #0xa]
	b _0809F50A
_0809F042:
	ldr r4, _0809F058 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F05C
	movs r0, #3
	b _0809F3C6
	.align 2, 0
_0809F058: .4byte gNonGameplayRam
_0809F05C:
	cmp r0, #0xc
	beq _0809F062
	b _0809F50A
_0809F062:
	movs r0, #0
	strb r0, [r4, #0xc]
	b _0809F3E4
_0809F068:
	ldr r2, _0809F084 @ =gNonGameplayRam
	ldrb r0, [r2, #0xc]
	adds r0, #1
	movs r3, #0
	strb r0, [r2, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F088
	movs r0, #2
	strb r0, [r2, #0x11]
	str r3, [sp]
	b _0809F4DA
	.align 2, 0
_0809F084: .4byte gNonGameplayRam
_0809F088:
	cmp r0, #2
	bne _0809F0B0
	movs r0, #3
	strh r0, [r2, #8]
	ldr r1, _0809F0A8 @ =0x0879EC68
	ldr r0, _0809F0AC @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	str r0, [r2, #4]
	b _0809F32C
	.align 2, 0
_0809F0A8: .4byte 0x0879EC68
_0809F0AC: .4byte 0x03000011
_0809F0B0:
	cmp r0, #4
	beq _0809F0B6
	b _0809F50A
_0809F0B6:
	movs r1, #1
	strb r1, [r2, #0x11]
	strb r3, [r2, #0xc]
	movs r0, #0x16
	strh r0, [r2, #0xa]
	strb r1, [r2, #0x10]
	ldr r1, _0809F0DC @ =0x0873DBB0
	ldr r0, _0809F0E0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #4
	movs r2, #0x91
	b _0809F2FC
	.align 2, 0
_0809F0DC: .4byte 0x0873DBB0
_0809F0E0: .4byte 0x03000011
_0809F0E4:
	ldr r2, _0809F120 @ =gNonGameplayRam
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F0F6
	b _0809F25A
_0809F0F6:
	cmp r0, #2
	bne _0809F0FC
	b _0809F278
_0809F0FC:
	cmp r0, #3
	bne _0809F102
	b _0809F286
_0809F102:
	cmp r0, #4
	bne _0809F108
	b _0809F294
_0809F108:
	cmp r0, #6
	bne _0809F10E
	b _0809F2A2
_0809F10E:
	cmp r0, #0xc
	beq _0809F114
	b _0809F50A
_0809F114:
	movs r0, #0
	strb r0, [r2, #0xc]
	movs r0, #0x15
	strh r0, [r2, #0xa]
	b _0809F50A
	.align 2, 0
_0809F120: .4byte gNonGameplayRam
_0809F124:
	ldr r1, _0809F148 @ =gNonGameplayRam
	ldrb r0, [r1, #0xc]
	adds r0, #1
	movs r2, #0
	strb r0, [r1, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F14C
	movs r0, #5
	strb r0, [r1, #0x11]
	movs r0, #2
	bl FileSelectDestroyOamOfType
	movs r0, #3
	bl FileSelectDestroyOamOfType
	b _0809F50A
	.align 2, 0
_0809F148: .4byte gNonGameplayRam
_0809F14C:
	cmp r0, #4
	bne _0809F152
	b _0809F50A
_0809F152:
	cmp r0, #0xc
	beq _0809F158
	b _0809F50A
_0809F158:
	strb r2, [r1, #0xf]
	strb r2, [r1, #0xe]
	strb r2, [r1, #0xc]
	strh r2, [r1, #0xa]
	b _0809F50A
_0809F162:
	ldr r0, _0809F178 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809F180
	ldr r1, _0809F17C @ =gNonGameplayRam
	movs r0, #0x17
	strh r0, [r1, #0xa]
	b _0809F50A
	.align 2, 0
_0809F178: .4byte gChangedInput
_0809F17C: .4byte gNonGameplayRam
_0809F180:
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809F18A
	b _0809F50A
_0809F18A:
	ldr r1, _0809F198 @ =gNonGameplayRam
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _0809F19C
	movs r0, #0x19
	strh r0, [r1, #0xa]
	b _0809F50A
	.align 2, 0
_0809F198: .4byte gNonGameplayRam
_0809F19C:
	movs r0, #0x18
	strh r0, [r1, #0xa]
	b _0809F50A
_0809F1A2:
	ldr r4, _0809F1B8 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F1BC
	movs r0, #4
	b _0809F3C6
	.align 2, 0
_0809F1B8: .4byte gNonGameplayRam
_0809F1BC:
	cmp r0, #2
	bne _0809F1C6
	movs r0, #0
	str r0, [sp]
	b _0809F4DA
_0809F1C6:
	cmp r0, #3
	bne _0809F234
	movs r0, #2
	strh r0, [r4, #8]
	ldr r1, _0809F1E4 @ =0x0879EC68
	ldr r0, _0809F1E8 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	b _0809F32C
	.align 2, 0
_0809F1E4: .4byte 0x0879EC68
_0809F1E8: .4byte 0x03000011
_0809F1EC:
	ldr r4, _0809F200 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bne _0809F204
	movs r0, #4
	b _0809F3C6
	.align 2, 0
_0809F200: .4byte gNonGameplayRam
_0809F204:
	cmp r0, #0xa
	bne _0809F20E
	movs r0, #0
	str r0, [sp]
	b _0809F4DA
_0809F20E:
	cmp r0, #0xb
	bne _0809F234
	movs r0, #2
	strh r0, [r4, #8]
	ldr r1, _0809F22C @ =0x0879EC68
	ldr r0, _0809F230 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	b _0809F32C
	.align 2, 0
_0809F22C: .4byte 0x0879EC68
_0809F230: .4byte 0x03000011
_0809F234:
	cmp r0, #0xc
	beq _0809F23A
	b _0809F50A
_0809F23A:
	movs r0, #1
	strb r0, [r4, #0x11]
	movs r1, #0
	movs r0, #0x11
	strh r0, [r4, #0xa]
	strb r1, [r4, #0xc]
	strb r1, [r4, #0x10]
	b _0809F50A
_0809F24A:
	ldr r2, _0809F26C @ =gNonGameplayRam
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F274
_0809F25A:
	ldr r0, _0809F270 @ =0x03000B8D
	ldrb r1, [r2, #0xd]
	strb r1, [r0]
	ldrb r0, [r2, #0xf]
	movs r1, #0
	bl Sram_CopyFile
	b _0809F50A
	.align 2, 0
_0809F26C: .4byte gNonGameplayRam
_0809F270: .4byte 0x03000B8D
_0809F274:
	cmp r0, #2
	bne _0809F282
_0809F278:
	ldrb r0, [r2, #0xf]
	movs r1, #1
	bl Sram_CopyFile
	b _0809F50A
_0809F282:
	cmp r0, #3
	bne _0809F290
_0809F286:
	ldrb r0, [r2, #0xf]
	movs r1, #2
	bl Sram_CopyFile
	b _0809F50A
_0809F290:
	cmp r0, #4
	bne _0809F29E
_0809F294:
	ldrb r0, [r2, #0xf]
	movs r1, #3
	bl Sram_CopyFile
	b _0809F50A
_0809F29E:
	cmp r0, #0xb
	bne _0809F2AA
_0809F2A2:
	ldrb r0, [r2, #0xf]
	bl FileSelectDrawFileInfo
	b _0809F50A
_0809F2AA:
	cmp r0, #0xc
	beq _0809F2B0
	b _0809F50A
_0809F2B0:
	movs r1, #0
	movs r0, #0x1a
	b _0809F4A4
_0809F2B6:
	ldr r4, _0809F2D8 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F2DC
	movs r0, #2
	bl FileSelectDestroyOamOfType
	movs r0, #3
	bl FileSelectDestroyOamOfType
	movs r0, #4
	b _0809F4C4
	.align 2, 0
_0809F2D8: .4byte gNonGameplayRam
_0809F2DC:
	cmp r0, #2
	bne _0809F2E2
	b _0809F4D8
_0809F2E2:
	b _0809F4F8
_0809F2E4:
	ldr r5, _0809F304 @ =gNonGameplayRam
	ldrb r0, [r5, #0xc]
	adds r0, #1
	movs r6, #0
	strb r0, [r5, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F308
	movs r0, #0xd
_0809F2F8:
	movs r1, #0x9c
	movs r2, #0x78
_0809F2FC:
	movs r3, #1
	bl FileSelectSetupOam
	b _0809F50A
	.align 2, 0
_0809F304: .4byte gNonGameplayRam
_0809F308:
	cmp r0, #2
	bne _0809F310
	str r6, [sp]
	b _0809F4DA
_0809F310:
	cmp r0, #3
	bne _0809F33C
	movs r0, #4
	strh r0, [r5, #8]
	ldr r1, _0809F334 @ =0x0879EC68
	ldr r0, _0809F338 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	str r0, [r5, #4]
_0809F32C:
	movs r0, #3
	bl FileSelectDrawText
	b _0809F50A
	.align 2, 0
_0809F334: .4byte 0x0879EC68
_0809F338: .4byte 0x03000011
_0809F33C:
	cmp r0, #0xc
	beq _0809F342
	b _0809F50A
_0809F342:
	movs r4, #1
	strb r4, [r5, #0x10]
	ldr r1, _0809F36C @ =0x0873DBBE
	ldr r0, _0809F370 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #5
	movs r2, #0x91
	movs r3, #1
	bl FileSelectSetupOam
	strb r4, [r5, #0x11]
	strb r6, [r5, #0xc]
	movs r0, #0x1c
	strh r0, [r5, #0xa]
	b _0809F50A
	.align 2, 0
_0809F36C: .4byte 0x0873DBBE
_0809F370: .4byte 0x03000011
_0809F374:
	ldr r0, _0809F388 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809F390
	ldr r1, _0809F38C @ =gNonGameplayRam
	movs r0, #0x1d
	strh r0, [r1, #0xa]
	b _0809F50A
	.align 2, 0
_0809F388: .4byte gChangedInput
_0809F38C: .4byte gNonGameplayRam
_0809F390:
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0809F39A
	b _0809F50A
_0809F39A:
	ldr r1, _0809F3A8 @ =gNonGameplayRam
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _0809F3AC
	movs r0, #0x20
	strh r0, [r1, #0xa]
	b _0809F50A
	.align 2, 0
_0809F3A8: .4byte gNonGameplayRam
_0809F3AC:
	movs r0, #0x1e
	strh r0, [r1, #0xa]
	b _0809F50A
_0809F3B2:
	ldr r4, _0809F3D0 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F3D4
	movs r0, #5
_0809F3C6:
	bl FileSelectDestroyOamOfType
_0809F3CA:
	movs r0, #2
	strb r0, [r4, #0x11]
	b _0809F50A
	.align 2, 0
_0809F3D0: .4byte gNonGameplayRam
_0809F3D4:
	cmp r0, #2
	bne _0809F3DA
	b _0809F4D8
_0809F3DA:
	cmp r0, #0xc
	beq _0809F3E0
	b _0809F50A
_0809F3E0:
	strb r1, [r4, #0xc]
	strb r1, [r4, #0x10]
_0809F3E4:
	movs r0, #3
	strh r0, [r4, #0xa]
	b _0809F50A
_0809F3EA:
	ldr r4, _0809F414 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	movs r5, #0
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	beq _0809F3FE
	b _0809F50A
_0809F3FE:
	movs r0, #5
	bl FileSelectDestroyOamOfType
	movs r0, #2
	strb r0, [r4, #0x11]
	strb r5, [r4, #0xc]
	strb r5, [r4, #0x10]
	movs r0, #0x1f
	strh r0, [r4, #0xa]
	b _0809F50A
	.align 2, 0
_0809F414: .4byte gNonGameplayRam
_0809F418:
	ldr r1, _0809F434 @ =gNonGameplayRam
	ldrb r0, [r1, #0xc]
	adds r0, #1
	movs r2, #0
	strb r0, [r1, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	beq _0809F50A
	cmp r0, #0xb
	bne _0809F438
	str r2, [sp]
	b _0809F4DA
	.align 2, 0
_0809F434: .4byte gNonGameplayRam
_0809F438:
	cmp r0, #0xc
	bne _0809F50A
	strb r2, [r1, #0xc]
	strb r2, [r1, #0x10]
	movs r0, #3
	strh r0, [r1, #0xa]
	b _0809F50A
_0809F446:
	ldr r2, _0809F464 @ =gNonGameplayRam
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F46C
	ldr r1, _0809F468 @ =0x03000B8D
	ldrb r0, [r2, #0xd]
	strb r0, [r1]
	movs r0, #0
	bl Sram_EraseFile
	b _0809F50A
	.align 2, 0
_0809F464: .4byte gNonGameplayRam
_0809F468: .4byte 0x03000B8D
_0809F46C:
	cmp r0, #2
	bne _0809F478
	movs r0, #1
	bl Sram_EraseFile
	b _0809F50A
_0809F478:
	cmp r0, #3
	bne _0809F484
	movs r0, #2
	bl Sram_EraseFile
	b _0809F50A
_0809F484:
	cmp r0, #4
	bne _0809F490
	movs r0, #3
	bl Sram_EraseFile
	b _0809F50A
_0809F490:
	cmp r0, #0xb
	bne _0809F49C
	ldrb r0, [r2, #0xd]
	bl FileSelectDrawFileInfo
	b _0809F50A
_0809F49C:
	cmp r0, #0xc
	bne _0809F50A
	movs r1, #0
	movs r0, #0x21
_0809F4A4:
	strh r0, [r2, #0xa]
	strb r1, [r2, #0xc]
	b _0809F50A
_0809F4AA:
	ldr r4, _0809F4D0 @ =gNonGameplayRam
	ldrb r0, [r4, #0xc]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809F4D4
	movs r0, #2
	bl FileSelectDestroyOamOfType
	movs r0, #5
_0809F4C4:
	bl FileSelectDestroyOamOfType
	movs r0, #5
	strb r0, [r4, #0x11]
	b _0809F50A
	.align 2, 0
_0809F4D0: .4byte gNonGameplayRam
_0809F4D4:
	cmp r0, #2
	bne _0809F4F8
_0809F4D8:
	str r1, [sp]
_0809F4DA:
	ldr r1, _0809F4EC @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0809F4F0 @ =0x0600C800
	str r0, [r1, #4]
	ldr r0, _0809F4F4 @ =0x85000600
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0809F50A
	.align 2, 0
_0809F4EC: .4byte 0x040000D4
_0809F4F0: .4byte 0x0600C800
_0809F4F4: .4byte 0x85000600
_0809F4F8:
	cmp r0, #0xc
	bne _0809F50A
	strb r1, [r4, #0x10]
	strb r1, [r4, #0xf]
	strb r1, [r4, #0xe]

	non_word_aligned_thumb_func_start sub_0809F502
sub_0809F502: @ 0x0809F502
	strb r1, [r4, #0xc]
	strh r1, [r4, #0xa]
	b _0809F50A
_0809F508:
	movs r7, #3
_0809F50A:
	bl FileSelectDrawAllOam
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start FileSelectSetupOam
FileSelectSetupOam: @ 0x0809F518
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r4, #0x16
	ldr r1, _0809F574 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0, #0x1c]
	adds r5, r1, #0
	cmp r0, #0
	beq _0809F564
	adds r6, r5, #0
_0809F546:
	lsls r0, r4, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r4, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _0809F56E
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	bne _0809F546
_0809F564:
	lsls r0, r4, #0x18
	asrs r2, r0, #0x18
	adds r6, r0, #0
	cmp r2, #0
	bge _0809F578
_0809F56E:
	movs r0, #0x17
	b _0809F91A
	.align 2, 0
_0809F574: .4byte gNonGameplayRam
_0809F578:
	movs r0, #0
	str r0, [sp]
	ldr r1, _0809F5C4 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r4, r0, #2
	ldr r2, _0809F5C8 @ =0x0300149C
	mov ip, r2
	adds r0, r4, r2
	str r0, [r1, #4]
	ldr r0, _0809F5CC @ =0x85000007
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, ip
	subs r0, #0x18
	adds r1, r4, r0
	movs r7, #0
	mov r0, sb
	strh r0, [r1, #0x18]
	mov r2, r8
	strh r2, [r1, #0x1a]
	strb r3, [r1, #0x1c]
	movs r2, #1
	strb r2, [r1, #0x1d]
	cmp r3, #1
	bne _0809F5D8
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F5D0 @ =0x08740A48
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F5D4 @ =FileSelectProcessSamusHead
	b _0809F916
	.align 2, 0
_0809F5C4: .4byte 0x040000D4
_0809F5C8: .4byte 0x0300149C
_0809F5CC: .4byte 0x85000007
_0809F5D0: .4byte 0x08740A48
_0809F5D4: .4byte FileSelectProcessSamusHead
_0809F5D8:
	cmp r3, #2
	bne _0809F5F8
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F5F0 @ =0x08740B48
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F5F4 @ =FileSelectProcessCursor
	b _0809F916
	.align 2, 0
_0809F5F0: .4byte 0x08740B48
_0809F5F4: .4byte FileSelectProcessCursor
_0809F5F8:
	cmp r3, #3
	bne _0809F620
	adds r0, r1, #0
	adds r0, #0x23
	strb r2, [r0]
	strb r7, [r1, #0x1d]
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F618 @ =0x08740AB8
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F61C @ =FileSelectProcessDeleteArrow
	b _0809F916
	.align 2, 0
_0809F618: .4byte 0x08740AB8
_0809F61C: .4byte FileSelectProcessDeleteArrow
_0809F620:
	cmp r3, #4
	bne _0809F640
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F638 @ =0x08740B48
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F63C @ =unk_9fddc
	b _0809F916
	.align 2, 0
_0809F638: .4byte 0x08740B48
_0809F63C: .4byte unk_9fddc
_0809F640:
	cmp r3, #5
	bne _0809F660
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F658 @ =0x08740B48
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F65C @ =unk_9ff00
	b _0809F916
	.align 2, 0
_0809F658: .4byte 0x08740B48
_0809F65C: .4byte unk_9ff00
_0809F660:
	cmp r3, #6
	bne _0809F688
	adds r1, #0x23
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F680 @ =0x087407E0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F684 @ =FileSelectProcessAudioLogos
	b _0809F916
	.align 2, 0
_0809F680: .4byte 0x087407E0
_0809F684: .4byte FileSelectProcessAudioLogos
_0809F688:
	cmp r3, #7
	bne _0809F6BC
	adds r1, #0x23
	movs r0, #2
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x14
	adds r1, r4, r1
	ldr r2, _0809F6B0 @ =0x0879E890
	ldr r0, _0809F6B4 @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F6B8 @ =FileSelectProcessFileOverlay
	b _0809F916
	.align 2, 0
_0809F6B0: .4byte 0x0879E890
_0809F6B4: .4byte 0x03000B8D
_0809F6B8: .4byte FileSelectProcessFileOverlay
_0809F6BC:
	cmp r3, #8
	bne _0809F6E4
	adds r1, #0x23
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F6DC @ =0x087408E0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F6E0 @ =unk_a016c
	b _0809F916
	.align 2, 0
_0809F6DC: .4byte 0x087408E0
_0809F6E0: .4byte unk_a016c
_0809F6E4:
	cmp r3, #9
	bne _0809F70C
	strb r7, [r1, #0x1d]
	adds r1, #0x23
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F704 @ =0x087408F0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F708 @ =FileSelectProcessAudioSelect
	b _0809F916
	.align 2, 0
_0809F704: .4byte 0x087408F0
_0809F708: .4byte FileSelectProcessAudioSelect
_0809F70C:
	cmp r3, #0xa
	bne _0809F72C
	mov r0, ip
	adds r0, #0x14
	adds r0, r4, r0
	ldr r1, _0809F724 @ =0x08740880
	str r1, [r0]
	mov r0, ip
	adds r0, #0x18
	adds r0, r4, r0
	ldr r1, _0809F728 @ =unk_a01cc
	b _0809F916
	.align 2, 0
_0809F724: .4byte 0x08740880
_0809F728: .4byte unk_a01cc
_0809F72C:
	cmp r3, #0xb
	bne _0809F76C
	movs r0, #0xfe
	lsls r0, r0, #1
	bl SoundPlay
	ldr r3, _0809F760 @ =gNonGameplayRam
	asrs r0, r6, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r3
	adds r0, #0x23
	movs r2, #2
	strb r2, [r0]
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r1, r0
	ldr r2, _0809F764 @ =0x08740918
	str r2, [r0]
	adds r3, #0x30
	adds r1, r1, r3
	ldr r0, _0809F768 @ =FileSelectProcessFileActionPanel
	str r0, [r1]
	b _0809F918
	.align 2, 0
_0809F760: .4byte gNonGameplayRam
_0809F764: .4byte 0x08740918
_0809F768: .4byte FileSelectProcessFileActionPanel
_0809F76C:
	cmp r3, #0xc
	bne _0809F7AC
	movs r0, #0xfe
	lsls r0, r0, #1
	bl SoundPlay
	ldr r3, _0809F7A0 @ =gNonGameplayRam
	asrs r0, r6, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r3
	adds r0, #0x23
	movs r2, #1
	strb r2, [r0]
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r1, r0
	ldr r2, _0809F7A4 @ =0x08740978
	str r2, [r0]
	adds r3, #0x30
	adds r1, r1, r3
	ldr r0, _0809F7A8 @ =FileSelectProcessCopyFilePanel
	str r0, [r1]
	b _0809F918
	.align 2, 0
_0809F7A0: .4byte gNonGameplayRam
_0809F7A4: .4byte 0x08740978
_0809F7A8: .4byte FileSelectProcessCopyFilePanel
_0809F7AC:
	cmp r3, #0xd
	bne _0809F7EC
	movs r0, #0xfe
	lsls r0, r0, #1
	bl SoundPlay
	ldr r3, _0809F7E0 @ =gNonGameplayRam
	asrs r0, r6, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r3
	adds r0, #0x23
	movs r2, #1
	strb r2, [r0]
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r1, r0
	ldr r2, _0809F7E4 @ =0x08740978
	str r2, [r0]
	adds r3, #0x30
	adds r1, r1, r3
	ldr r0, _0809F7E8 @ =FileSelectProcessEraseFilePanel
	str r0, [r1]
	b _0809F918
	.align 2, 0
_0809F7E0: .4byte gNonGameplayRam
_0809F7E4: .4byte 0x08740978
_0809F7E8: .4byte FileSelectProcessEraseFilePanel
_0809F7EC:
	cmp r3, #0xe
	bne _0809F810
	asrs r1, r6, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r5
	adds r1, #0x23
	movs r2, #3
	strb r2, [r1]
	adds r1, r5, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r1, _0809F80C @ =unk_a0518
	b _0809F916
	.align 2, 0
_0809F80C: .4byte unk_a0518
_0809F810:
	cmp r3, #0xf
	bne _0809F834
	asrs r1, r6, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r5
	adds r1, #0x23
	movs r2, #3
	strb r2, [r1]
	adds r1, r5, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r1, _0809F830 @ =unk_a0518
	b _0809F916
	.align 2, 0
_0809F830: .4byte unk_a0518
_0809F834:
	cmp r3, #0x10
	bne _0809F858
	asrs r1, r6, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r5
	adds r1, #0x23
	movs r2, #3
	strb r2, [r1]
	adds r1, r5, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r1, _0809F854 @ =unk_a0518
	b _0809F916
	.align 2, 0
_0809F854: .4byte unk_a0518
_0809F858:
	cmp r3, #0x11
	bne _0809F87C
	asrs r0, r6, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r5
	adds r0, #0x23
	movs r2, #2
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r1, r0
	ldr r2, _0809F878 @ =0x087409A0
	b _0809F8A0
	.align 2, 0
_0809F878: .4byte 0x087409A0
_0809F87C:
	cmp r3, #0x14
	beq _0809F888
	cmp r3, #0x15
	beq _0809F888
	cmp r3, #0x16
	bne _0809F8B8
_0809F888:
	asrs r0, r6, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r5
	adds r0, #0x23
	movs r2, #3
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r1, r0
	ldr r2, _0809F8B0 @ =0x08740B98
_0809F8A0:
	str r2, [r0]
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r1, r0
	ldr r0, _0809F8B4 @ =unk_a0518
	str r0, [r1]
	b _0809F918
	.align 2, 0
_0809F8B0: .4byte 0x08740B98
_0809F8B4: .4byte unk_a0518
_0809F8B8:
	cmp r3, #0x17
	bne _0809F8F8
	movs r0, #0xfe
	lsls r0, r0, #1
	bl SoundPlay
	ldr r3, _0809F8EC @ =gNonGameplayRam
	asrs r0, r6, #0x18
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r3
	adds r0, #0x23
	movs r2, #1
	strb r2, [r0]
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r1, r0
	ldr r2, _0809F8F0 @ =0x08740978
	str r2, [r0]
	adds r3, #0x30
	adds r1, r1, r3
	ldr r0, _0809F8F4 @ =unk_a039c
	str r0, [r1]
	b _0809F918
	.align 2, 0
_0809F8EC: .4byte gNonGameplayRam
_0809F8F0: .4byte 0x08740978
_0809F8F4: .4byte unk_a039c
_0809F8F8:
	cmp r3, #0x18
	bne _0809F918
	asrs r1, r6, #0x18
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x2c
	adds r1, r0, r1
	ldr r2, _0809F928 @ =0x08740B48
	str r2, [r1]
	adds r1, r5, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r1, _0809F92C @ =unk_a0424
_0809F916:
	str r1, [r0]
_0809F918:
	lsrs r0, r6, #0x18
_0809F91A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809F928: .4byte 0x08740B48
_0809F92C: .4byte unk_a0424

	thumb_func_start FileSelectProcessSamusHead
FileSelectProcessSamusHead: @ 0x0809F930
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _0809FA2C
	ldr r0, _0809F958 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809F994
	ldr r1, _0809F95C @ =gNonGameplayRam
	ldrb r0, [r1, #0xd]
	cmp r0, #3
	beq _0809F974
	cmp r0, #3
	ble _0809F960
	cmp r0, #4
	beq _0809F984
	b _0809F9F6
	.align 2, 0
_0809F958: .4byte gChangedInput
_0809F95C: .4byte gNonGameplayRam
_0809F960:
	cmp r0, #1
	blt _0809F9F6
	movs r0, #0xf
	strh r0, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x10
	strh r0, [r4, #2]
	ldrb r0, [r1, #0xd]
	subs r0, #1
	b _0809F9D0
_0809F974:
	movs r0, #0xf
	strh r0, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x25
	strh r0, [r4, #2]
	ldrb r0, [r1, #0xd]
	subs r0, #1
	b _0809F9D0
_0809F984:
	movs r0, #0xf
	strh r0, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x28
	strh r0, [r4, #2]
	ldrb r0, [r1, #0xd]
	subs r0, #1
	b _0809F9D0
_0809F994:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809F9F6
	ldr r1, _0809F9B0 @ =gNonGameplayRam
	ldrb r0, [r1, #0xd]
	cmp r0, #2
	beq _0809F9C2
	cmp r0, #2
	ble _0809F9B4
	cmp r0, #3
	beq _0809F9E0
	b _0809F9F6
	.align 2, 0
_0809F9B0: .4byte gNonGameplayRam
_0809F9B4:
	cmp r0, #0
	blt _0809F9F6
	movs r0, #0xf
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b _0809F9CA
_0809F9C2:
	movs r0, #0xf
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #0x25
_0809F9CA:
	strh r0, [r4, #2]
	ldrb r0, [r1, #0xd]
	adds r0, #1
_0809F9D0:
	strb r0, [r1, #0xd]
	ldr r0, _0809F9DC @ =0x000001F9
	bl SoundPlay
	b _0809F9F6
	.align 2, 0
_0809F9DC: .4byte 0x000001F9
_0809F9E0:
	movs r0, #0xf
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #0x28
	strh r0, [r4, #2]
	ldrb r0, [r1, #0xd]
	adds r0, #1
	strb r0, [r1, #0xd]
	ldr r0, _0809FA1C @ =0x000001F9
	bl SoundPlay
_0809F9F6:
	ldr r0, _0809FA20 @ =gNonGameplayRam
	ldrb r0, [r0, #0xd]
	cmp r0, #3
	beq _0809FACC
	ldr r0, _0809FA24 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0809FACC
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
	movs r0, #0x64
	strb r0, [r4, #9]
	ldr r0, _0809FA28 @ =0x000001FB
	bl SoundPlay
	b _0809FACC
	.align 2, 0
_0809FA1C: .4byte 0x000001F9
_0809FA20: .4byte gNonGameplayRam
_0809FA24: .4byte gChangedInput
_0809FA28: .4byte 0x000001FB
_0809FA2C:
	cmp r0, #1
	bne _0809FA60
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0809FA4C
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809FA4C
	strb r1, [r4, #7]
	movs r0, #0x64
	strb r0, [r4, #9]
_0809FA4C:
	ldr r0, _0809FA5C @ =gNonGameplayRam
	ldrb r0, [r0, #0xc]
	cmp r0, #0xb
	bne _0809FACC
	movs r0, #0x64
	strb r0, [r4, #9]
	b _0809FACC
	.align 2, 0
_0809FA5C: .4byte gNonGameplayRam
_0809FA60:
	cmp r0, #0x64
	bne _0809FAB4
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r1, [r4, #7]
	ldr r0, _0809FA88 @ =gNonGameplayRam
	movs r2, #0xa
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bne _0809FA90
	strb r1, [r4, #7]
	strb r1, [r4, #6]
	ldr r0, _0809FA8C @ =0x08740A48
	str r0, [r4, #0x14]
	strb r1, [r4, #9]
	b _0809FACC
	.align 2, 0
_0809FA88: .4byte gNonGameplayRam
_0809FA8C: .4byte 0x08740A48
_0809FA90:
	cmp r1, #5
	beq _0809FAA0
	cmp r1, #7
	beq _0809FAA0
	cmp r1, #0xc
	beq _0809FAA0
	cmp r1, #0xd
	bne _0809FACC
_0809FAA0:
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
	ldr r0, _0809FAB0 @ =0x08740A70
	str r0, [r4, #0x14]
	movs r0, #0xc8
	strb r0, [r4, #9]
	b _0809FACC
	.align 2, 0
_0809FAB0: .4byte 0x08740A70
_0809FAB4:
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0809FACC
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809FACC
	strb r1, [r4, #7]
_0809FACC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FileSelectProcessCursor
FileSelectProcessCursor: @ 0x0809FAD4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0809FAE0
	b _0809FC20
_0809FAE0:
	ldr r3, _0809FB20 @ =gNonGameplayRam
	movs r0, #0xa
	ldrsh r1, [r3, r0]
	cmp r1, #2
	bne _0809FB50
	ldr r0, _0809FB24 @ =gChangedInput
	ldrh r2, [r0]
	ands r1, r2
	cmp r1, #0
	beq _0809FAF6
	b _0809FC48
_0809FAF6:
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	bne _0809FB00
	b _0809FC82
_0809FB00:
	ldr r2, _0809FB28 @ =0x03000B94
	ldrb r1, [r3, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0809FB30
	ldr r0, _0809FB2C @ =0x000001FB
	bl SoundPlay
	b _0809FB38
	.align 2, 0
_0809FB20: .4byte gNonGameplayRam
_0809FB24: .4byte gChangedInput
_0809FB28: .4byte 0x03000B94
_0809FB2C: .4byte 0x000001FB
_0809FB30:
	movs r0, #0xff
	lsls r0, r0, #1
	bl SoundPlay
_0809FB38:
	ldr r1, _0809FB48 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0xe]
	strb r0, [r4, #7]
	strb r0, [r4, #6]
	ldr r0, _0809FB4C @ =0x08740B70
	str r0, [r4, #0x14]
	b _0809FC48
	.align 2, 0
_0809FB48: .4byte gNonGameplayRam
_0809FB4C: .4byte 0x08740B70
_0809FB50:
	cmp r1, #3
	beq _0809FB56
	b _0809FC82
_0809FB56:
	ldr r0, _0809FB7C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809FB84
	ldrb r0, [r3, #0xe]
	cmp r0, #0
	beq _0809FBA2
	subs r0, #1
	strb r0, [r3, #0xe]
	ldrh r0, [r4, #2]
	subs r0, #0x10
	strh r0, [r4, #2]
	ldr r0, _0809FB80 @ =0x000001F9
	bl SoundPlay
	b _0809FBA2
	.align 2, 0
_0809FB7C: .4byte gChangedInput
_0809FB80: .4byte 0x000001F9
_0809FB84:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809FBA2
	ldrb r0, [r3, #0xe]
	cmp r0, #1
	bhi _0809FBA2
	adds r0, #1
	strb r0, [r3, #0xe]
	ldrh r0, [r4, #2]
	adds r0, #0x10
	strh r0, [r4, #2]
	ldr r0, _0809FBEC @ =0x000001F9
	bl SoundPlay
_0809FBA2:
	ldr r0, _0809FBF0 @ =gChangedInput
	ldrh r2, [r0]
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0809FC48
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0809FC82
	strb r1, [r4, #7]
	strb r1, [r4, #6]
	ldr r0, _0809FBF4 @ =0x08740B70
	str r0, [r4, #0x14]
	ldr r1, _0809FBF8 @ =gNonGameplayRam
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	bne _0809FC0E
	movs r0, #0x64
	strb r0, [r4, #9]
	ldr r2, _0809FBFC @ =0x03000B94
	ldrb r1, [r1, #0xd]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0809FC04
	ldr r0, _0809FC00 @ =0x000001FB
	bl SoundPlay
	b _0809FC82
	.align 2, 0
_0809FBEC: .4byte 0x000001F9
_0809FBF0: .4byte gChangedInput
_0809FBF4: .4byte 0x08740B70
_0809FBF8: .4byte gNonGameplayRam
_0809FBFC: .4byte 0x03000B94
_0809FC00: .4byte 0x000001FB
_0809FC04:
	movs r0, #0xff
	lsls r0, r0, #1
	bl SoundPlay
	b _0809FC82
_0809FC0E:
	ldr r0, _0809FC1C @ =0x000001FB
	bl SoundPlay
	movs r0, #1
	strb r0, [r4, #9]
	b _0809FC82
	.align 2, 0
_0809FC1C: .4byte 0x000001FB
_0809FC20:
	cmp r0, #1
	bne _0809FC54
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0809FC40
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809FC40
	strb r1, [r4, #7]
	movs r0, #0x64
	strb r0, [r4, #9]
_0809FC40:
	ldr r0, _0809FC50 @ =gNonGameplayRam
	ldrb r0, [r0, #0xc]
	cmp r0, #0xb
	bne _0809FC82
_0809FC48:
	movs r0, #0x64
	strb r0, [r4, #9]
	b _0809FC82
	.align 2, 0
_0809FC50: .4byte gNonGameplayRam
_0809FC54:
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0809FC6C
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809FC6C
	strb r1, [r4, #7]
_0809FC6C:
	ldr r0, _0809FC88 @ =gNonGameplayRam
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bne _0809FC82
	movs r1, #0
	strb r1, [r4, #7]
	strb r1, [r4, #6]
	ldr r0, _0809FC8C @ =0x08740B48
	str r0, [r4, #0x14]
	strb r1, [r4, #9]
_0809FC82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC88: .4byte gNonGameplayRam
_0809FC8C: .4byte 0x08740B48

	thumb_func_start FileSelectProcessDeleteArrow
FileSelectProcessDeleteArrow: @ 0x0809FC90
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r7, #0
	movs r6, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _0809FD7C
	movs r0, #1
	strb r0, [r4, #5]
	ldr r1, _0809FCD0 @ =gChangedInput
	ldrh r2, [r1]
	movs r0, #0x40
	ands r0, r2
	mov ip, r1
	cmp r0, #0
	beq _0809FCDC
	ldr r0, _0809FCD4 @ =gNonGameplayRam
	ldrb r1, [r0, #0xf]
	adds r5, r0, #0
	cmp r1, #0
	beq _0809FCC0
	subs r0, r1, #1
	strb r0, [r5, #0xf]
	movs r6, #1
_0809FCC0:
	ldrb r0, [r5, #0xf]
	ldrb r1, [r5, #0xd]
	cmp r1, r0
	bne _0809FD12
	cmp r1, #0
	bne _0809FCD8
	adds r0, #1
	b _0809FD00
	.align 2, 0
_0809FCD0: .4byte gChangedInput
_0809FCD4: .4byte gNonGameplayRam
_0809FCD8:
	subs r0, #1
	b _0809FD0E
_0809FCDC:
	movs r0, #0x80
	ands r0, r2
	ldr r5, _0809FD08 @ =gNonGameplayRam
	cmp r0, #0
	beq _0809FD12
	ldrb r0, [r5, #0xf]
	cmp r0, #1
	bhi _0809FCF2
	adds r0, #1
	strb r0, [r5, #0xf]
	movs r6, #1
_0809FCF2:
	ldrb r0, [r5, #0xf]
	ldrb r1, [r5, #0xd]
	cmp r1, r0
	bne _0809FD12
	cmp r1, #2
	bne _0809FD0C
	subs r0, #1
_0809FD00:
	strb r0, [r5, #0xf]
	movs r6, #0
	b _0809FD12
	.align 2, 0
_0809FD08: .4byte gNonGameplayRam
_0809FD0C:
	adds r0, #1
_0809FD0E:
	strb r0, [r5, #0xf]
	movs r6, #1
_0809FD12:
	ldr r3, _0809FD70 @ =0x0879E8A4
	adds r2, r5, #0
	ldrb r1, [r2, #0xd]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldrb r2, [r2, #0xf]
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r4, #0x14]
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _0809FD88
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0809FDA4
	strb r2, [r4, #7]
	strb r2, [r4, #6]
	movs r0, #1
	strb r0, [r4, #9]
	ldr r2, _0809FD74 @ =0x03000B94
	ldrb r1, [r5, #0xf]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _0809FD6A
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _0809FD6A
	ldrb r0, [r2]
	cmp r0, #1
	bne _0809FD78
_0809FD6A:
	movs r7, #1
	b _0809FDA4
	.align 2, 0
_0809FD70: .4byte 0x0879E8A4
_0809FD74: .4byte 0x03000B94
_0809FD78:
	movs r7, #2
	b _0809FDA4
_0809FD7C:
	cmp r0, #1
	bne _0809FD94
	ldr r0, _0809FD90 @ =gNonGameplayRam
	ldrb r0, [r0, #0xc]
	cmp r0, #0xb
	bne _0809FDA4
_0809FD88:
	movs r0, #0x64
	strb r0, [r4, #9]
	b _0809FDA4
	.align 2, 0
_0809FD90: .4byte gNonGameplayRam
_0809FD94:
	ldr r0, _0809FDBC @ =gNonGameplayRam
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0x11
	bne _0809FDA4
	strb r7, [r4, #7]
	strb r7, [r4, #6]
	strb r7, [r4, #9]
_0809FDA4:
	cmp r6, #0
	beq _0809FDAE
	ldr r0, _0809FDC0 @ =0x000001F9
	bl SoundPlay
_0809FDAE:
	cmp r7, #1
	bne _0809FDC8
	ldr r0, _0809FDC4 @ =0x000001FB
	bl SoundPlay
	b _0809FDD2
	.align 2, 0
_0809FDBC: .4byte gNonGameplayRam
_0809FDC0: .4byte 0x000001F9
_0809FDC4: .4byte 0x000001FB
_0809FDC8:
	cmp r7, #2
	bne _0809FDD2
	ldr r0, _0809FDD8 @ =0x00000207
	bl SoundPlay
_0809FDD2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FDD8: .4byte 0x00000207

	thumb_func_start unk_9fddc
unk_9fddc: @ 0x0809FDDC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0
	bne _0809FEAC
	ldr r3, _0809FE1C @ =gNonGameplayRam
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	bne _0809FE2C
	ldr r0, _0809FE20 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809FE58
	movs r0, #1
	strb r0, [r3, #0x10]
	ldr r1, _0809FE24 @ =0x0873DBB0
	ldr r0, _0809FE28 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
	b _0809FE58
	.align 2, 0
_0809FE1C: .4byte gNonGameplayRam
_0809FE20: .4byte gChangedInput
_0809FE24: .4byte 0x0873DBB0
_0809FE28: .4byte 0x03000011
_0809FE2C:
	cmp r0, #1
	bne _0809FE58
	ldr r0, _0809FE80 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809FE58
	strb r2, [r3, #0x10]
	ldr r1, _0809FE84 @ =0x0873DBB0
	ldr r0, _0809FE88 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
_0809FE58:
	ldr r0, _0809FE80 @ =gChangedInput
	ldrh r2, [r0]
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0809FED6
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0809FEF8
	strb r1, [r4, #7]
	strb r1, [r4, #6]
	ldr r0, _0809FE8C @ =gNonGameplayRam
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _0809FE94
	ldr r0, _0809FE90 @ =0x00000207
	b _0809FE96
	.align 2, 0
_0809FE80: .4byte gChangedInput
_0809FE84: .4byte 0x0873DBB0
_0809FE88: .4byte 0x03000011
_0809FE8C: .4byte gNonGameplayRam
_0809FE90: .4byte 0x00000207
_0809FE94:
	ldr r0, _0809FEA4 @ =0x000001FB
_0809FE96:
	bl SoundPlay
	ldr r0, _0809FEA8 @ =0x08740B70
	str r0, [r4, #0x14]
	movs r0, #1
	strb r0, [r4, #9]
	b _0809FEF8
	.align 2, 0
_0809FEA4: .4byte 0x000001FB
_0809FEA8: .4byte 0x08740B70
_0809FEAC:
	cmp r2, #1
	bne _0809FEE0
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0809FEC8
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809FEC8
	strb r1, [r4, #7]
_0809FEC8:
	ldr r0, _0809FEDC @ =gNonGameplayRam
	ldrb r0, [r0, #0xc]
	cmp r0, #0xb
	bne _0809FEF8
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_0809FED6:
	movs r0, #0x64
	strb r0, [r4, #9]
	b _0809FEF8
	.align 2, 0
_0809FEDC: .4byte gNonGameplayRam
_0809FEE0:
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0809FEF8
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809FEF8
	strb r1, [r4, #7]
_0809FEF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_9ff00
unk_9ff00: @ 0x0809FF00
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0
	bne _0809FFD0
	ldr r3, _0809FF40 @ =gNonGameplayRam
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	bne _0809FF50
	ldr r0, _0809FF44 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809FF7C
	movs r0, #1
	strb r0, [r3, #0x10]
	ldr r1, _0809FF48 @ =0x0873DBBE
	ldr r0, _0809FF4C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
	b _0809FF7C
	.align 2, 0
_0809FF40: .4byte gNonGameplayRam
_0809FF44: .4byte gChangedInput
_0809FF48: .4byte 0x0873DBBE
_0809FF4C: .4byte 0x03000011
_0809FF50:
	cmp r0, #1
	bne _0809FF7C
	ldr r0, _0809FFA8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809FF7C
	strb r2, [r3, #0x10]
	ldr r1, _0809FFAC @ =0x0873DBBE
	ldr r0, _0809FFB0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
_0809FF7C:
	ldr r0, _0809FFA8 @ =gChangedInput
	ldrh r2, [r0]
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0809FFFA
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _080A001C
	strb r1, [r4, #7]
	strb r1, [r4, #6]
	ldr r0, _0809FFB4 @ =gNonGameplayRam
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _0809FFB8
	movs r0, #0x82
	lsls r0, r0, #2
	b _0809FFBA
	.align 2, 0
_0809FFA8: .4byte gChangedInput
_0809FFAC: .4byte 0x0873DBBE
_0809FFB0: .4byte 0x03000011
_0809FFB4: .4byte gNonGameplayRam
_0809FFB8:
	ldr r0, _0809FFC8 @ =0x000001FB
_0809FFBA:
	bl SoundPlay
	ldr r0, _0809FFCC @ =0x08740B70
	str r0, [r4, #0x14]
	movs r0, #1
	strb r0, [r4, #9]
	b _080A001C
	.align 2, 0
_0809FFC8: .4byte 0x000001FB
_0809FFCC: .4byte 0x08740B70
_0809FFD0:
	cmp r2, #1
	bne _080A0004
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _0809FFEC
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809FFEC
	strb r1, [r4, #7]
_0809FFEC:
	ldr r0, _080A0000 @ =gNonGameplayRam
	ldrb r0, [r0, #0xc]
	cmp r0, #0xb
	bne _080A001C
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_0809FFFA:
	movs r0, #0x64
	strb r0, [r4, #9]
	b _080A001C
	.align 2, 0
_080A0000: .4byte gNonGameplayRam
_080A0004:
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _080A001C
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080A001C
	strb r1, [r4, #7]
_080A001C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FileSelectProcessAudioLogos
FileSelectProcessAudioLogos: @ 0x080A0024
	push {lr}
	adds r2, r0, #0
	ldr r0, _080A0064 @ =gNonGameplayRam
	ldrb r0, [r0, #0xd]
	cmp r0, #3
	bne _080A00B8
	ldrb r3, [r2, #9]
	cmp r3, #0
	bne _080A0078
	ldr r0, _080A0068 @ =0x087407C0
	str r0, [r2, #0x14]
	ldr r0, _080A006C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A00DA
	movs r0, #1
	strb r0, [r2, #9]
	ldr r0, _080A0070 @ =0x087407D0
	str r0, [r2, #0x14]
	strb r3, [r2, #7]
	strb r3, [r2, #6]
	movs r0, #0x80
	lsls r0, r0, #0x12
	bl DoSoundAction
	ldr r0, _080A0074 @ =0x00000206
	bl SoundPlay
	b _080A00DA
	.align 2, 0
_080A0064: .4byte gNonGameplayRam
_080A0068: .4byte 0x087407C0
_080A006C: .4byte gChangedInput
_080A0070: .4byte 0x087407D0
_080A0074: .4byte 0x00000206
_080A0078:
	cmp r3, #1
	bne _080A00DA
	ldr r0, _080A00AC @ =0x087407D0
	str r0, [r2, #0x14]
	ldr r0, _080A00B0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A00DA
	movs r1, #0
	strb r1, [r2, #9]
	ldr r0, _080A00B4 @ =0x087407C0
	str r0, [r2, #0x14]
	strb r1, [r2, #7]
	strb r1, [r2, #6]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl DoSoundAction
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
	b _080A00DA
	.align 2, 0
_080A00AC: .4byte 0x087407D0
_080A00B0: .4byte gChangedInput
_080A00B4: .4byte 0x087407C0
_080A00B8:
	ldrb r1, [r2, #9]
	cmp r1, #0
	bne _080A00CC
	ldr r0, _080A00C8 @ =0x087407E0
	str r0, [r2, #0x14]
	strb r1, [r2, #7]
	strb r1, [r2, #6]
	b _080A00DA
	.align 2, 0
_080A00C8: .4byte 0x087407E0
_080A00CC:
	cmp r1, #1
	bne _080A00DA
	ldr r0, _080A00E0 @ =0x087407F0
	str r0, [r2, #0x14]
	movs r0, #0
	strb r0, [r2, #7]
	strb r0, [r2, #6]
_080A00DA:
	pop {r0}
	bx r0
	.align 2, 0
_080A00E0: .4byte 0x087407F0

	thumb_func_start FileSelectProcessAudioSelect
FileSelectProcessAudioSelect: @ 0x080A00E4
	push {lr}
	adds r2, r0, #0
	ldr r0, _080A0110 @ =gNonGameplayRam
	ldrb r0, [r0, #0xd]
	cmp r0, #3
	bne _080A0138
	movs r3, #1
	strb r3, [r2, #5]
	ldrb r0, [r2, #9]
	cmp r0, #0
	bne _080A0118
	ldr r0, _080A0114 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A0140
	strb r3, [r2, #9]
	movs r0, #0xaa
	strh r0, [r2]
	b _080A0140
	.align 2, 0
_080A0110: .4byte gNonGameplayRam
_080A0114: .4byte gChangedInput
_080A0118:
	cmp r0, #1
	bne _080A0140
	ldr r0, _080A0134 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A0140
	movs r0, #0
	strb r0, [r2, #9]
	movs r0, #0x66
	strh r0, [r2]
	b _080A0140
	.align 2, 0
_080A0134: .4byte gChangedInput
_080A0138:
	movs r0, #0
	strb r0, [r2, #7]
	strb r0, [r2, #6]
	strb r0, [r2, #5]
_080A0140:
	pop {r0}
	bx r0

	thumb_func_start FileSelectProcessFileOverlay
FileSelectProcessFileOverlay: @ 0x080A0144
	push {lr}
	adds r2, r0, #0
	ldr r1, _080A0164 @ =gNonGameplayRam
	movs r3, #0xa
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _080A015E
	ldr r0, _080A0168 @ =0x0879E890
	ldrb r1, [r1, #0xd]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2, #0x14]
_080A015E:
	pop {r0}
	bx r0
	.align 2, 0
_080A0164: .4byte gNonGameplayRam
_080A0168: .4byte 0x0879E890

	thumb_func_start unk_a016c
unk_a016c: @ 0x080A016C
	push {lr}
	adds r2, r0, #0
	ldr r1, _080A0190 @ =gNonGameplayRam
	movs r0, #0xa
	ldrsh r3, [r1, r0]
	cmp r3, #0
	bne _080A01C6
	ldr r0, _080A0194 @ =0x087408E0
	str r0, [r2, #0x14]
	ldrb r1, [r1, #0xd]
	cmp r1, #2
	bhi _080A01C4
	movs r0, #1
	strb r0, [r2, #5]
	cmp r1, #0
	bne _080A0198
	movs r0, #0x31
	b _080A01A6
	.align 2, 0
_080A0190: .4byte gNonGameplayRam
_080A0194: .4byte 0x087408E0
_080A0198:
	cmp r1, #1
	bne _080A01A0
	movs r0, #0x41
	b _080A01A6
_080A01A0:
	cmp r1, #2
	bne _080A01A8
	movs r0, #0x51
_080A01A6:
	strh r0, [r2, #2]
_080A01A8:
	ldr r0, _080A01BC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080A01C6
	ldr r0, _080A01C0 @ =0x087408D0
	str r0, [r2, #0x14]
	b _080A01C6
	.align 2, 0
_080A01BC: .4byte gChangedInput
_080A01C0: .4byte 0x087408D0
_080A01C4:
	strb r3, [r2, #5]
_080A01C6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_a01cc
unk_a01cc: @ 0x080A01CC
	bx lr
	.align 2, 0

	thumb_func_start FileSelectProcessFileActionPanel
FileSelectProcessFileActionPanel: @ 0x080A01D0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0
	bne _080A0204
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #7]
	cmp r0, r3
	bne _080A0266
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080A0266
	strb r2, [r4, #7]
	strb r2, [r4, #6]
	ldr r0, _080A0200 @ =0x08740940
	str r0, [r4, #0x14]
	movs r0, #1
	strb r0, [r4, #9]
	b _080A0266
	.align 2, 0
_080A0200: .4byte 0x08740940
_080A0204:
	cmp r2, #1
	bne _080A0248
	ldr r0, _080A021C @ =gNonGameplayRam
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0x15
	beq _080A0228
	cmp r0, #0x15
	bgt _080A0220
	cmp r0, #4
	beq _080A0228
	b _080A0266
	.align 2, 0
_080A021C: .4byte gNonGameplayRam
_080A0220:
	cmp r0, #0x1a
	beq _080A0228
	cmp r0, #0x21
	bne _080A0266
_080A0228:
	ldr r0, _080A0240 @ =0x000001FD
	bl SoundPlay
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
	ldr r0, _080A0244 @ =0x08740950
	str r0, [r4, #0x14]
	movs r0, #2
	strb r0, [r4, #9]
	b _080A0266
	.align 2, 0
_080A0240: .4byte 0x000001FD
_080A0244: .4byte 0x08740950
_080A0248:
	cmp r2, #2
	bne _080A0266
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _080A0266
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080A0266
	strb r1, [r4, #4]
	strb r1, [r4, #5]
_080A0266:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FileSelectProcessCopyFilePanel
FileSelectProcessCopyFilePanel: @ 0x080A026C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0
	bne _080A02A0
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #7]
	cmp r0, r3
	bne _080A02FE
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080A02FE
	strb r2, [r4, #7]
	strb r2, [r4, #6]
	ldr r0, _080A029C @ =0x087409A0
	str r0, [r4, #0x14]
	movs r0, #1
	strb r0, [r4, #9]
	b _080A02FE
	.align 2, 0
_080A029C: .4byte 0x087409A0
_080A02A0:
	cmp r2, #1
	bne _080A02E0
	ldr r0, _080A02B8 @ =gNonGameplayRam
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0x15
	beq _080A02C0
	cmp r0, #0x15
	bgt _080A02BC
	cmp r0, #0x12
	beq _080A02C0
	b _080A02FE
	.align 2, 0
_080A02B8: .4byte gNonGameplayRam
_080A02BC:
	cmp r0, #0x1a
	bne _080A02FE
_080A02C0:
	ldr r0, _080A02D8 @ =0x000001FD
	bl SoundPlay
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
	ldr r0, _080A02DC @ =0x087409B0
	str r0, [r4, #0x14]
	movs r0, #2
	strb r0, [r4, #9]
	b _080A02FE
	.align 2, 0
_080A02D8: .4byte 0x000001FD
_080A02DC: .4byte 0x087409B0
_080A02E0:
	cmp r2, #2
	bne _080A02FE
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _080A02FE
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080A02FE
	strb r1, [r4, #4]
	strb r1, [r4, #5]
_080A02FE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FileSelectProcessEraseFilePanel
FileSelectProcessEraseFilePanel: @ 0x080A0304
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0
	bne _080A0338
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #7]
	cmp r0, r3
	bne _080A0396
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080A0396
	strb r2, [r4, #7]
	strb r2, [r4, #6]
	ldr r0, _080A0334 @ =0x087409A0
	str r0, [r4, #0x14]
	movs r0, #1
	strb r0, [r4, #9]
	b _080A0396
	.align 2, 0
_080A0334: .4byte 0x087409A0
_080A0338:
	cmp r2, #1
	bne _080A0378
	ldr r0, _080A0350 @ =gNonGameplayRam
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0x1f
	beq _080A0358
	cmp r0, #0x1f
	bgt _080A0354
	cmp r0, #0x1d
	beq _080A0358
	b _080A0396
	.align 2, 0
_080A0350: .4byte gNonGameplayRam
_080A0354:
	cmp r0, #0x21
	bne _080A0396
_080A0358:
	ldr r0, _080A0370 @ =0x000001FD
	bl SoundPlay
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
	ldr r0, _080A0374 @ =0x087409B0
	str r0, [r4, #0x14]
	movs r0, #2
	strb r0, [r4, #9]
	b _080A0396
	.align 2, 0
_080A0370: .4byte 0x000001FD
_080A0374: .4byte 0x087409B0
_080A0378:
	cmp r2, #2
	bne _080A0396
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _080A0396
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080A0396
	strb r1, [r4, #4]
	strb r1, [r4, #5]
_080A0396:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_a039c
unk_a039c: @ 0x080A039C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0
	bne _080A03D0
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #7]
	cmp r0, r3
	bne _080A041E
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080A041E
	strb r2, [r4, #7]
	strb r2, [r4, #6]
	ldr r0, _080A03CC @ =0x087409A0
	str r0, [r4, #0x14]
	movs r0, #1
	strb r0, [r4, #9]
	b _080A041E
	.align 2, 0
_080A03CC: .4byte 0x087409A0
_080A03D0:
	cmp r2, #1
	bne _080A0400
	ldr r0, _080A03F4 @ =gNonGameplayRam
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0xb
	bne _080A041E
	ldr r0, _080A03F8 @ =0x000001FD
	bl SoundPlay
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
	ldr r0, _080A03FC @ =0x087409B0
	str r0, [r4, #0x14]
	movs r0, #2
	strb r0, [r4, #9]
	b _080A041E
	.align 2, 0
_080A03F4: .4byte gNonGameplayRam
_080A03F8: .4byte 0x000001FD
_080A03FC: .4byte 0x087409B0
_080A0400:
	cmp r2, #2
	bne _080A041E
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _080A041E
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080A041E
	strb r1, [r4, #4]
	strb r1, [r4, #5]
_080A041E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_a0424
unk_a0424: @ 0x080A0424
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0
	bne _080A04C4
	ldr r3, _080A0454 @ =gNonGameplayRam
	ldrb r0, [r3, #0x10]
	cmp r0, #0
	bne _080A045C
	ldr r0, _080A0458 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A047A
	movs r0, #1
	strb r0, [r3, #0x10]
	movs r0, #0x79
	strh r0, [r4, #2]
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
	b _080A047A
	.align 2, 0
_080A0454: .4byte gNonGameplayRam
_080A0458: .4byte gChangedInput
_080A045C:
	cmp r0, #1
	bne _080A047A
	ldr r0, _080A04AC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A047A
	strb r2, [r3, #0x10]
	movs r0, #0x69
	strh r0, [r4, #2]
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
_080A047A:
	ldr r0, _080A04AC @ =gChangedInput
	ldrh r2, [r0]
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080A04EE
	movs r0, #9
	ands r0, r2
	cmp r0, #0
	beq _080A0510
	strb r1, [r4, #7]
	strb r1, [r4, #6]
	movs r0, #0xff
	lsls r0, r0, #1
	bl SoundPlay
	ldr r0, _080A04B0 @ =gNonGameplayRam
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _080A04B8
	ldr r0, _080A04B4 @ =0x08740B70
	str r0, [r4, #0x14]
	b _080A04EE
	.align 2, 0
_080A04AC: .4byte gChangedInput
_080A04B0: .4byte gNonGameplayRam
_080A04B4: .4byte 0x08740B70
_080A04B8:
	ldr r0, _080A04C0 @ =0x08740B70
	str r0, [r4, #0x14]
	b _080A04EE
	.align 2, 0
_080A04C0: .4byte 0x08740B70
_080A04C4:
	cmp r2, #1
	bne _080A04F8
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _080A04E0
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080A04E0
	strb r1, [r4, #7]
_080A04E0:
	ldr r0, _080A04F4 @ =gNonGameplayRam
	ldrb r0, [r0, #0xc]
	cmp r0, #0xb
	bne _080A0510
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_080A04EE:
	movs r0, #0x64
	strb r0, [r4, #9]
	b _080A0510
	.align 2, 0
_080A04F4: .4byte gNonGameplayRam
_080A04F8:
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	ldr r1, [r4, #0x14]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #7]
	cmp r0, r2
	bne _080A0510
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080A0510
	strb r1, [r4, #7]
_080A0510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_a0518
unk_a0518: @ 0x080A0518
	bx lr
	.align 2, 0

	thumb_func_start FileSelectDrawFileInfo
FileSelectDrawFileInfo: @ 0x080A051C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r0, r0, #2
	add r0, sl
	lsls r0, r0, #2
	ldr r1, _080A0548 @ =0x03000B94
	adds r0, r0, r1
	mov sb, r0
	adds r2, r1, #0
	mov r0, sl
	cmp r0, #0
	bne _080A0550
	ldr r7, _080A054C @ =0x060088C0
	b _080A0562
	.align 2, 0
_080A0548: .4byte 0x03000B94
_080A054C: .4byte 0x060088C0
_080A0550:
	mov r1, sl
	cmp r1, #1
	bne _080A0560
	ldr r7, _080A055C @ =0x060090C0
	b _080A0562
	.align 2, 0
_080A055C: .4byte 0x060090C0
_080A0560:
	ldr r7, _080A05A8 @ =0x060098C0
_080A0562:
	str r7, [sp, #0x38]
	ldr r5, _080A05AC @ =gNonGameplayRam
	movs r1, #0
	movs r0, #0
	strh r0, [r5]
	strb r1, [r5, #0x13]
	mov r3, sb
	ldrb r4, [r3]
	mov r0, sl
	lsls r0, r0, #2
	str r0, [sp, #0x40]
	cmp r4, #0
	beq _080A057E
	b _080A0694
_080A057E:
	add r0, sl
	lsls r0, r0, #2
	adds r1, r0, r2
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _080A0594
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _080A05B0
_080A0594:
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0x63
	strh r0, [r1]
	movs r3, #0xa7
	lsls r3, r3, #2
	adds r3, r3, r5
	mov sb, r3
	b _080A0694
	.align 2, 0
_080A05A8: .4byte 0x060098C0
_080A05AC: .4byte gNonGameplayRam
_080A05B0:
	mov r0, sl
	adds r0, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FileSelectDestroyOamOfType
	mov r0, sl
	adds r0, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FileSelectDestroyOamOfType
	str r4, [sp, #0x34]
	ldr r0, _080A061C @ =0x040000D4
	add r1, sp, #0x34
	str r1, [r0]
	str r7, [r0, #4]
	ldr r2, _080A0620 @ =0x850000C0
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	str r4, [sp, #0x34]
	str r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r7, r3
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _080A0624 @ =0x0879EC84
	ldr r0, _080A0628 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, [r0]
	movs r0, #8
	strh r0, [r5]
	ldrh r0, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	cmp r0, r1
	bne _080A060A
	b _080A0A08
_080A060A:
	mov r8, r5
	mov sb, r1
_080A060E:
	cmp r0, #0x5a
	bne _080A062C
	ldrh r0, [r4]
	bl GetCharacterWidth
	adds r5, r0, #2
	b _080A063C
	.align 2, 0
_080A061C: .4byte 0x040000D4
_080A0620: .4byte 0x850000C0
_080A0624: .4byte 0x0879EC84
_080A0628: .4byte 0x03000011
_080A062C:
	cmp r0, #0x40
	bne _080A063A
	mov r0, r8
	ldrb r1, [r0, #0x13]
	movs r0, #8
	subs r5, r0, r1
	b _080A063C
_080A063A:
	movs r5, #8
_080A063C:
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #5
	ldr r2, [sp, #0x38]
	adds r7, r0, r2
	ldrh r0, [r4]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r1, #0x13]
	movs r1, #0
	str r1, [sp]
	adds r1, r7, #0
	bl DrawCharacter
	mov r3, r8
	ldrb r0, [r3, #0x13]
	adds r0, r0, r5
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r4, #2
	cmp r0, #7
	bls _080A0686
	ldr r5, _080A0690 @ =gNonGameplayRam
	ldrb r4, [r5, #0x13]
	ldrh r3, [r5]
_080A0670:
	adds r2, r4, #0
	subs r2, #8
	adds r4, r2, #0
	adds r1, r3, #1
	adds r3, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080A0670
	strh r1, [r5]
	strb r2, [r5, #0x13]
_080A0686:
	adds r4, r6, #0
	ldrh r0, [r4]
	cmp r0, sb
	bne _080A060E
	b _080A0A08
	.align 2, 0
_080A0690: .4byte gNonGameplayRam
_080A0694:
	ldr r0, _080A07F4 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r0, #0xfa
	lsls r0, r0, #2
	mov r2, sb
	ldrh r1, [r2, #4]
	bl DivArmDiv
	add r4, sp, #0x14
	str r0, [sp, #0x14]
	mov r3, sb
	ldrh r1, [r3, #4]
	movs r0, #0x64
	bl DivArmDiv
	add r5, sp, #0x24
	str r0, [r4, #4]
	str r0, [sp, #0x24]
	ldr r1, [r4, #4]
	movs r0, #0xa
	bl DivArmMod
	str r0, [r4, #4]
	str r0, [r5, #4]
	mov r0, sb
	ldrh r1, [r0, #4]
	movs r0, #0xa
	bl DivArmDiv
	adds r1, r0, #0
	str r1, [r4, #8]
	movs r0, #0xa
	bl DivArmMod
	str r0, [r4, #8]
	mov r2, sb
	ldrh r1, [r2, #4]
	str r1, [r4, #0xc]
	movs r0, #0xa
	bl DivArmMod
	str r0, [r4, #0xc]
	movs r6, #2
	mov r3, sl
	adds r3, #0xe
	str r3, [sp, #0x44]
	mov r0, sl
	adds r0, #0x14
	str r0, [sp, #0x4c]
	add r1, sp, #0x34
	mov ip, r1
	mov r8, r5
	mov r2, sl
	lsls r2, r2, #4
	str r2, [sp, #0x48]
	ldr r1, _080A07F8 @ =0x040000D4
	ldr r4, _080A07FC @ =0x84000008
	movs r2, #0x80
	lsls r2, r2, #3
	ldr r5, _080A0800 @ =0x08682FAC
_080A0710:
	lsls r0, r6, #2
	add r0, sp
	adds r0, #0x14
	ldr r0, [r0]
	adds r0, #0x50
	lsls r0, r0, #5
	adds r3, r0, r5
	str r3, [r1]
	str r7, [r1, #4]
	str r4, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, r2
	str r0, [r1]
	adds r0, r7, r2
	str r0, [r1, #4]
	str r4, [r1, #8]
	ldr r0, [r1, #8]
	adds r7, #0x20
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _080A0710
	movs r1, #0
	str r1, [sp, #0x34]
	ldr r5, _080A07F8 @ =0x040000D4
	mov r3, ip
	str r3, [r5]
	str r7, [r5, #4]
	ldr r0, _080A0804 @ =0x85000080
	str r0, [r5, #8]
	ldr r2, [r5, #8]
	str r1, [sp, #0x34]
	str r3, [r5]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r4, r7, r1
	str r4, [r5, #4]
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	mov r2, r8
	ldr r1, [r2, #4]
	movs r0, #2
	bl DivArmMod
	mov r3, r8
	str r0, [r3, #4]
	mov r0, sb
	ldrh r1, [r0, #6]
	movs r0, #0x64
	bl DivArmDiv
	adds r1, r0, #0
	mov r2, r8
	str r1, [r2, #8]
	movs r0, #0xa
	bl DivArmMod
	adds r1, r0, #0
	mov r3, r8
	str r1, [r3, #0xc]
	movs r0, #2
	bl DivArmMod
	mov r1, r8
	str r0, [r1, #0xc]
	adds r3, r7, #0
	adds r7, r4, #0
	movs r6, #0
	ldr r0, [sp, #0x24]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	cmp r6, r0
	bge _080A07D2
	adds r2, r5, #0
	mov r4, r8
	ldr r0, _080A0808 @ =0x0873DB64
	mov ip, r0
	ldr r5, _080A07FC @ =0x84000008
_080A07AE:
	cmp r6, #0xa
	bne _080A07B6
	ldr r1, _080A080C @ =0xFFFFFB60
	adds r7, r7, r1
_080A07B6:
	mov r0, ip
	str r0, [r2]
	str r7, [r2, #4]
	str r5, [r2, #8]
	ldr r0, [r2, #8]
	adds r7, #0x20
	adds r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [sp, #0x24]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	cmp r6, r0
	blt _080A07AE
_080A07D2:
	mov r1, r8
	ldr r0, [r1, #4]
	cmp r0, #1
	bne _080A082A
	cmp r6, #0xa
	bne _080A07E2
	ldr r2, _080A080C @ =0xFFFFFB60
	adds r7, r7, r2
_080A07E2:
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, [sp, #0x24]
	cmp r1, r0
	bne _080A0814
	ldr r1, _080A07F8 @ =0x040000D4
	ldr r0, _080A0810 @ =0x0873DB04
	b _080A0818
	.align 2, 0
_080A07F4: .4byte 0x03000011
_080A07F8: .4byte 0x040000D4
_080A07FC: .4byte 0x84000008
_080A0800: .4byte 0x08682FAC
_080A0804: .4byte 0x85000080
_080A0808: .4byte 0x0873DB64
_080A080C: .4byte 0xFFFFFB60
_080A0810: .4byte 0x0873DB04
_080A0814:
	ldr r1, _080A0A18 @ =0x040000D4
	ldr r0, _080A0A1C @ =0x0873DB44
_080A0818:
	str r0, [r1]
	str r7, [r1, #4]
	ldr r0, _080A0A20 @ =0x84000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r7, #0x20
_080A082A:
	mov r1, r8
	ldr r0, [r1, #8]
	ldr r1, [r1, #0xc]
	subs r0, r0, r1
	adds r3, #0xc0
	str r3, [sp, #0x3c]
	cmp r6, r0
	bge _080A0866
	ldr r2, _080A0A24 @ =0xFFFFFB60
	mov ip, r2
	ldr r2, _080A0A18 @ =0x040000D4
	mov r3, r8
	ldr r5, _080A0A28 @ =0x0873DB24
	ldr r4, _080A0A20 @ =0x84000008
_080A0846:
	cmp r6, #0xa
	bne _080A084C
	add r7, ip
_080A084C:
	str r5, [r2]
	str r7, [r2, #4]
	str r4, [r2, #8]
	ldr r0, [r2, #8]
	adds r7, #0x20
	adds r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r3, #8]
	ldr r1, [r3, #0xc]
	subs r0, r0, r1
	cmp r6, r0
	blt _080A0846
_080A0866:
	mov r3, r8
	ldr r0, [r3, #0xc]
	cmp r0, #1
	bne _080A088A
	ldr r0, [r3, #8]
	cmp r6, r0
	bge _080A088A
	cmp r6, #0xa
	bne _080A087C
	ldr r0, _080A0A24 @ =0xFFFFFB60
	adds r7, r7, r0
_080A087C:
	ldr r1, _080A0A18 @ =0x040000D4
	ldr r0, _080A0A2C @ =0x0873DAE4
	str r0, [r1]
	str r7, [r1, #4]
	ldr r0, _080A0A20 @ =0x84000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080A088A:
	ldr r7, [sp, #0x3c]
	mov r2, sb
	ldrb r1, [r2, #0xd]
	movs r0, #0xa
	bl DivArmDiv
	adds r1, r0, #0
	str r1, [sp, #4]
	movs r0, #0xa
	bl DivArmMod
	str r0, [sp, #4]
	mov r3, sb
	ldrb r1, [r3, #0xd]
	str r1, [sp, #8]
	movs r0, #0xa
	bl DivArmMod
	str r0, [sp, #8]
	movs r6, #0
	ldr r5, _080A0A30 @ =0x08682FAC
	ldr r1, _080A0A18 @ =0x040000D4
	ldr r4, _080A0A20 @ =0x84000008
	movs r2, #0x80
	lsls r2, r2, #3
_080A08BC:
	lsls r0, r6, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	adds r0, #0x50
	lsls r0, r0, #5
	adds r3, r0, r5
	str r3, [r1]
	str r7, [r1, #4]
	str r4, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, r2
	str r0, [r1]
	adds r0, r7, r2
	str r0, [r1, #4]
	str r4, [r1, #8]
	ldr r0, [r1, #8]
	adds r7, #0x20
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _080A08BC
	ldr r6, _080A0A34 @ =gNonGameplayRam
	movs r4, #0
	movs r0, #0xa
	strh r0, [r6]
	lsls r0, r0, #5
	ldr r1, [sp, #0x38]
	adds r7, r1, r0
	movs r0, #0x5a
	bl GetCharacterWidth
	adds r5, r0, #3
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r6, #0x13]
	str r4, [sp]
	movs r0, #0x5a
	adds r1, r7, #0
	bl DrawCharacter
	ldrb r0, [r6, #0x13]
	adds r2, r0, r5
	strb r2, [r6, #0x13]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _080A0938
	adds r5, r6, #0
	ldrh r4, [r5]
_080A0922:
	adds r3, r2, #0
	subs r3, #8
	adds r2, r3, #0
	adds r1, r4, #1
	adds r4, r1, #0
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080A0922
	strh r1, [r5]
	strb r3, [r5, #0x13]
_080A0938:
	mov r2, sb
	ldrb r1, [r2, #0xe]
	movs r0, #0xa
	bl DivArmDiv
	adds r1, r0, #0
	str r1, [sp, #4]
	movs r0, #0xa
	bl DivArmMod
	str r0, [sp, #4]
	mov r3, sb
	ldrb r1, [r3, #0xe]
	str r1, [sp, #8]
	movs r0, #0xa
	bl DivArmMod
	str r0, [sp, #8]
	movs r6, #0
	ldr r0, _080A0A34 @ =gNonGameplayRam
	mov r8, r0
_080A0962:
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #5
	ldr r2, [sp, #0x38]
	adds r7, r0, r2
	lsls r0, r6, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r3, [r1, #0x13]
	movs r1, #0
	str r1, [sp]
	adds r1, r7, #0
	movs r2, #8
	bl DrawCharacter
	mov r3, r8
	ldrb r0, [r3, #0x13]
	adds r0, #8
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, #1
	cmp r0, #7
	bls _080A09B6
	ldr r5, _080A0A34 @ =gNonGameplayRam
	ldrb r4, [r5, #0x13]
	ldrh r3, [r5]
_080A09A0:
	adds r2, r4, #0
	subs r2, #8
	adds r4, r2, #0
	adds r1, r3, #1
	adds r3, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080A09A0
	strh r1, [r5]
	strb r2, [r5, #0x13]
_080A09B6:
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _080A0962
	ldr r0, [sp, #0x44]
	lsls r4, r0, #0x18
	lsrs r4, r4, #0x18
	adds r0, r4, #0
	bl FileSelectDestroyOamOfType
	ldr r2, [sp, #0x48]
	adds r2, #0x20
	mov r1, sb
	ldrb r3, [r1, #2]
	adds r0, r4, #0
	movs r1, #0x9d
	bl FileSelectSetUpAreaNameOam
	ldr r2, [sp, #0x4c]
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl FileSelectDestroyOamOfType
	ldr r1, _080A0A38 @ =0x03000B94
	ldr r0, [sp, #0x40]
	add r0, sl
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080A0A08
	ldr r2, [sp, #0x48]
	adds r2, #0x28
	adds r0, r4, #0
	movs r1, #0xdc
	movs r3, #1
	bl FileSelectSetupOam
_080A0A08:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A18: .4byte 0x040000D4
_080A0A1C: .4byte 0x0873DB44
_080A0A20: .4byte 0x84000008
_080A0A24: .4byte 0xFFFFFB60
_080A0A28: .4byte 0x0873DB24
_080A0A2C: .4byte 0x0873DAE4
_080A0A30: .4byte 0x08682FAC
_080A0A34: .4byte gNonGameplayRam
_080A0A38: .4byte 0x03000B94

	thumb_func_start FileSelectDrawText
FileSelectDrawText: @ 0x080A0A3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080A0A74 @ =gNonGameplayRam
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #2]
	strh r1, [r0]
	strb r2, [r0, #0x13]
	ldrh r1, [r0, #8]
	adds r2, r0, #0
	cmp r1, #0x18
	bne _080A0A80
	ldr r1, _080A0A78 @ =0x0879E928
	ldr r0, _080A0A7C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r7, [r0, #0x14]
	b _080A0A98
	.align 2, 0
_080A0A74: .4byte gNonGameplayRam
_080A0A78: .4byte 0x0879E928
_080A0A7C: .4byte 0x03000011
_080A0A80:
	ldr r1, _080A0AA4 @ =0x0879E928
	ldr r0, _080A0AA8 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r2, #8]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r7, [r1]
_080A0A98:
	cmp r3, #1
	bne _080A0AB0
	ldr r0, _080A0AAC @ =0x06008000
	mov sb, r0
	movs r4, #6
	b _080A0AC6
	.align 2, 0
_080A0AA4: .4byte 0x0879E928
_080A0AA8: .4byte 0x03000011
_080A0AAC: .4byte 0x06008000
_080A0AB0:
	cmp r3, #2
	bne _080A0ABC
	ldr r0, _080A0AB8 @ =0x0600B000
	b _080A0AC2
	.align 2, 0
_080A0AB8: .4byte 0x0600B000
_080A0ABC:
	cmp r3, #3
	bne _080A0AC8
	ldr r0, _080A0AFC @ =0x0600C800
_080A0AC2:
	mov sb, r0
	movs r4, #0
_080A0AC6:
	mov r8, r4
_080A0AC8:
	adds r6, r2, #0
	ldr r0, [r6, #4]
	ldrh r0, [r0]
	movs r1, #0xff
	lsls r1, r1, #8
	cmp r0, r1
	beq _080A0B6E
	mov sl, r1
_080A0AD8:
	ldr r1, [r6, #4]
	ldrh r0, [r1]
	movs r2, #0xfe
	lsls r2, r2, #8
	cmp r0, r2
	bne _080A0B00
	movs r1, #0
	movs r0, #0
	strh r0, [r6]
	ldrh r0, [r6, #2]
	adds r0, #2
	strh r0, [r6, #2]
	strb r1, [r6, #0x13]
	adds r7, #2
	movs r4, #0
	mov r8, r4
	b _080A0B5E
	.align 2, 0
_080A0AFC: .4byte 0x0600C800
_080A0B00:
	ldrh r4, [r6]
	lsls r4, r4, #5
	ldrh r0, [r6, #2]
	lsls r0, r0, #0xa
	adds r4, r4, r0
	add r4, sb
	ldrh r0, [r7]
	lsls r0, r0, #5
	adds r4, r4, r0
	str r4, [sp, #4]
	ldrh r0, [r1]
	bl GetCharacterWidth
	adds r5, r0, #0
	ldr r0, [r6, #4]
	ldrh r0, [r0]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r6, #0x13]
	mov r4, r8
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	ldr r1, [sp, #4]
	bl DrawCharacter
	ldrb r0, [r6, #0x13]
	adds r0, r0, r5
	strb r0, [r6, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _080A0B5E
	ldr r5, _080A0B80 @ =gNonGameplayRam
	ldrb r4, [r5, #0x13]
	ldrh r3, [r5]
_080A0B48:
	adds r2, r4, #0
	subs r2, #8
	adds r4, r2, #0
	adds r1, r3, #1
	adds r3, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080A0B48
	strh r1, [r5]
	strb r2, [r5, #0x13]
_080A0B5E:
	ldr r1, _080A0B80 @ =gNonGameplayRam
	ldr r2, [r1, #4]
	adds r0, r2, #2
	str r0, [r1, #4]
	adds r6, r1, #0
	ldrh r0, [r2, #2]
	cmp r0, sl
	bne _080A0AD8
_080A0B6E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0B80: .4byte gNonGameplayRam

	thumb_func_start FileSelectProcessCorruptedFile
FileSelectProcessCorruptedFile: @ 0x080A0B84
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	bl FileSelectProcessOam
	ldr r0, _080A0BA4 @ =gNonGameplayRam
	ldrb r0, [r0, #0x14]
	cmp r0, #7
	bls _080A0B98
	b _080A0DF0
_080A0B98:
	lsls r0, r0, #2
	ldr r1, _080A0BA8 @ =_080A0BAC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A0BA4: .4byte gNonGameplayRam
_080A0BA8: .4byte _080A0BAC
_080A0BAC: @ jump table
	.4byte _080A0BCC @ case 0
	.4byte _080A0C64 @ case 1
	.4byte _080A0C8A @ case 2
	.4byte _080A0CCC @ case 3
	.4byte _080A0CF8 @ case 4
	.4byte _080A0D60 @ case 5
	.4byte _080A0DA4 @ case 6
	.4byte _080A0DE8 @ case 7
_080A0BCC:
	ldr r1, _080A0BE4 @ =gNonGameplayRam
	ldrb r0, [r1, #0xc]
	adds r0, #1
	strb r0, [r1, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080A0BE8
	movs r0, #1
	bl FileSelectDrawText
	b _080A0DF0
	.align 2, 0
_080A0BE4: .4byte gNonGameplayRam
_080A0BE8:
	cmp r0, #2
	bne _080A0C08
	ldr r0, _080A0BFC @ =0x03000B94
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _080A0C00
	movs r0, #0
	bl FileSelectDrawFileInfo
	b _080A0DF0
	.align 2, 0
_080A0BFC: .4byte 0x03000B94
_080A0C00:
	movs r0, #0
	bl FileSelectDrawFileCorruptedText
	b _080A0DF0
_080A0C08:
	cmp r0, #3
	bne _080A0C28
	ldr r0, _080A0C1C @ =0x03000B94
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	bne _080A0C20
	movs r0, #1
	bl FileSelectDrawFileInfo
	b _080A0DF0
	.align 2, 0
_080A0C1C: .4byte 0x03000B94
_080A0C20:
	movs r0, #1
	bl FileSelectDrawFileCorruptedText
	b _080A0DF0
_080A0C28:
	cmp r0, #4
	beq _080A0C2E
	b _080A0DF0
_080A0C2E:
	ldr r0, _080A0C40 @ =0x03000B94
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A0C44
	movs r0, #2
	bl FileSelectDrawFileInfo
	b _080A0C4A
	.align 2, 0
_080A0C40: .4byte 0x03000B94
_080A0C44:
	movs r0, #2
	bl FileSelectDrawFileCorruptedText
_080A0C4A:
	ldr r2, _080A0C5C @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r2, #0xc]
	ldr r1, _080A0C60 @ =gWrittenToBldy
	movs r0, #0xe
	strh r0, [r1]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _080A0DF0
	.align 2, 0
_080A0C5C: .4byte gNonGameplayRam
_080A0C60: .4byte gWrittenToBldy
_080A0C64:
	ldr r1, _080A0C74 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _080A0C78
	subs r0, #1
	strh r0, [r1]
	b _080A0DF0
	.align 2, 0
_080A0C74: .4byte gWrittenToBldy
_080A0C78:
	ldr r1, _080A0C80 @ =gNonGameplayRam
	movs r0, #2
	strb r0, [r1, #0x14]
	b _080A0DF0
	.align 2, 0
_080A0C80: .4byte gNonGameplayRam
_080A0C84:
	movs r0, #3
	strb r0, [r4, #0x14]
	b _080A0CB4
_080A0C8A:
	ldr r0, _080A0CC4 @ =gNonGameplayRam
	ldrb r1, [r0, #0x15]
	adds r4, r0, #0
	cmp r1, #2
	bhi _080A0CB4
	ldr r3, _080A0CC8 @ =0x03000B94
	adds r2, r4, #0
_080A0C98:
	ldrb r1, [r2, #0x15]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _080A0C84
	adds r0, r1, #1
	strb r0, [r4, #0x15]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080A0C98
_080A0CB4:
	ldrb r0, [r4, #0x15]
	cmp r0, #3
	beq _080A0CBC
	b _080A0DF0
_080A0CBC:
	movs r0, #7
	strb r0, [r4, #0x14]
	b _080A0DF0
	.align 2, 0
_080A0CC4: .4byte gNonGameplayRam
_080A0CC8: .4byte 0x03000B94
_080A0CCC:
	ldr r1, _080A0CF4 @ =gNonGameplayRam
	ldrb r0, [r1, #0xc]
	adds r0, #1
	strb r0, [r1, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	beq _080A0CDE
	b _080A0DF0
_080A0CDE:
	movs r0, #4
	strb r0, [r1, #0x14]
	movs r0, #0
	strb r0, [r1, #0xc]
	movs r0, #0x11
	movs r1, #0x7a
	movs r2, #0x44
	movs r3, #0
	bl FileSelectSetupOam
	b _080A0DF0
	.align 2, 0
_080A0CF4: .4byte gNonGameplayRam
_080A0CF8:
	ldr r2, _080A0D14 @ =0x03000B94
	ldr r1, _080A0D18 @ =gNonGameplayRam
	ldrb r3, [r1, #0x15]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	adds r4, r1, #0
	cmp r0, #1
	bne _080A0D1C
	adds r0, r3, #5
	b _080A0D20
	.align 2, 0
_080A0D14: .4byte 0x03000B94
_080A0D18: .4byte gNonGameplayRam
_080A0D1C:
	adds r0, r3, #0
	adds r0, #8
_080A0D20:
	strh r0, [r4, #8]
	ldr r1, _080A0D58 @ =0x0879EC68
	ldr r0, _080A0D5C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r4, #8]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r4, #4]
	movs r0, #2
	bl FileSelectDrawCorruptionText
	movs r0, #0xa
	movs r1, #0x78
	movs r2, #0x64
	movs r3, #0
	bl FileSelectSetupOam
	movs r0, #3
	strb r0, [r4, #0x11]
	movs r0, #5
	strb r0, [r4, #0x14]
	b _080A0DF0
	.align 2, 0
_080A0D58: .4byte 0x0879EC68
_080A0D5C: .4byte 0x03000011
_080A0D60:
	ldr r0, _080A0D98 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080A0DF0
	movs r0, #0xa
	bl FileSelectDestroyOamOfType
	movs r0, #0x11
	bl FileSelectDestroyOamOfType
	ldr r0, _080A0D9C @ =0x000001FB
	bl SoundPlay
	ldr r4, _080A0DA0 @ =gNonGameplayRam
	movs r0, #4
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #0x15]
	bl Sram_SetCurrentFile
	ldrb r0, [r4, #0x15]
	bl FileSelectDrawFileInfo
	movs r0, #6
	strb r0, [r4, #0x14]
	b _080A0DF0
	.align 2, 0
_080A0D98: .4byte gChangedInput
_080A0D9C: .4byte 0x000001FB
_080A0DA0: .4byte gNonGameplayRam
_080A0DA4:
	ldr r1, _080A0DCC @ =gNonGameplayRam
	ldrb r0, [r1, #0xc]
	adds r0, #1
	movs r2, #0
	strb r0, [r1, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080A0DDC
	str r2, [sp]
	ldr r1, _080A0DD0 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080A0DD4 @ =0x0600B000
	str r0, [r1, #4]
	ldr r0, _080A0DD8 @ =0x85000600
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _080A0DF0
	.align 2, 0
_080A0DCC: .4byte gNonGameplayRam
_080A0DD0: .4byte 0x040000D4
_080A0DD4: .4byte 0x0600B000
_080A0DD8: .4byte 0x85000600
_080A0DDC:
	cmp r0, #0xa
	bne _080A0DF0
	movs r0, #2
	strb r0, [r1, #0x14]
	strb r2, [r1, #0xc]
	b _080A0DF0
_080A0DE8:
	ldr r1, _080A0E00 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0xc]
	movs r5, #1
_080A0DF0:
	bl FileSelectDrawAllOam
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0E00: .4byte gNonGameplayRam

	thumb_func_start FileSelectDrawFileCorruptedText
FileSelectDrawFileCorruptedText: @ 0x080A0E04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080A0E20
	ldr r6, _080A0E1C @ =0x060088C0
	b _080A0E2E
	.align 2, 0
_080A0E1C: .4byte 0x060088C0
_080A0E20:
	cmp r0, #1
	bne _080A0E2C
	ldr r6, _080A0E28 @ =0x060090C0
	b _080A0E2E
	.align 2, 0
_080A0E28: .4byte 0x060090C0
_080A0E2C:
	ldr r6, _080A0E90 @ =0x060098C0
_080A0E2E:
	mov r8, r6
	ldr r4, _080A0E94 @ =gNonGameplayRam
	movs r0, #0
	movs r1, #0
	strh r1, [r4]
	strb r0, [r4, #0x13]
	str r1, [sp, #4]
	ldr r0, _080A0E98 @ =0x040000D4
	add r2, sp, #4
	str r2, [r0]
	str r6, [r0, #4]
	ldr r2, _080A0E9C @ =0x850000C0
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	str r1, [sp, #4]
	add r3, sp, #4
	str r3, [r0]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r6, r3
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _080A0EA0 @ =0x0879EC84
	ldr r0, _080A0EA4 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r5, [r0]
	movs r0, #8
	strh r0, [r4]
	ldrh r0, [r5]
	movs r1, #0xff
	lsls r1, r1, #8
	cmp r0, r1
	beq _080A0F04
	adds r7, r4, #0
	mov sb, r1
_080A0E80:
	cmp r0, #0x5a
	bne _080A0EA8
	ldrh r0, [r5]
	bl GetCharacterWidth
	adds r4, r0, #3
	b _080A0EB6
	.align 2, 0
_080A0E90: .4byte 0x060098C0
_080A0E94: .4byte gNonGameplayRam
_080A0E98: .4byte 0x040000D4
_080A0E9C: .4byte 0x850000C0
_080A0EA0: .4byte 0x0879EC84
_080A0EA4: .4byte 0x03000011
_080A0EA8:
	cmp r0, #0x40
	bne _080A0EB4
	ldrb r1, [r7, #0x13]
	movs r0, #8
	subs r4, r0, r1
	b _080A0EB6
_080A0EB4:
	movs r4, #8
_080A0EB6:
	ldrh r0, [r7]
	lsls r0, r0, #5
	mov r1, r8
	adds r6, r0, r1
	ldrh r0, [r5]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r7, #0x13]
	movs r1, #0
	str r1, [sp]
	adds r1, r6, #0
	bl DrawCharacter
	ldrb r0, [r7, #0x13]
	adds r0, r0, r4
	strb r0, [r7, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r5, #2
	cmp r0, #7
	bls _080A0EFC
	ldr r5, _080A0F14 @ =gNonGameplayRam
	ldrb r4, [r5, #0x13]
	ldrh r3, [r5]
_080A0EE6:
	adds r2, r4, #0
	subs r2, #8
	adds r4, r2, #0
	adds r1, r3, #1
	adds r3, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080A0EE6
	strh r1, [r5]
	strb r2, [r5, #0x13]
_080A0EFC:
	adds r5, r6, #0
	ldrh r0, [r5]
	cmp r0, sb
	bne _080A0E80
_080A0F04:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0F14: .4byte gNonGameplayRam

	thumb_func_start FileSelectDrawCorruptionText
FileSelectDrawCorruptionText: @ 0x080A0F18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, r3, #0
	ldr r0, _080A0F40 @ =gNonGameplayRam
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #2]
	strh r1, [r0]
	strb r2, [r0, #0x13]
	cmp r3, #1
	bne _080A0F48
	ldr r7, _080A0F44 @ =0x06008000
	b _080A0F5A
	.align 2, 0
_080A0F40: .4byte gNonGameplayRam
_080A0F44: .4byte 0x06008000
_080A0F48:
	cmp r3, #2
	bne _080A0F54
	ldr r7, _080A0F50 @ =0x0600B000
	b _080A0F5A
	.align 2, 0
_080A0F50: .4byte 0x0600B000
_080A0F54:
	cmp r4, #3
	bne _080A0F5A
	ldr r7, _080A0F8C @ =0x0600C800
_080A0F5A:
	adds r6, r0, #0
	ldr r0, [r6, #4]
	ldrh r0, [r0]
	movs r1, #0xff
	lsls r1, r1, #8
	cmp r0, r1
	beq _080A0FF2
	movs r0, #0xfe
	lsls r0, r0, #8
	mov sl, r0
	movs r0, #0
	mov sb, r0
	mov r8, r1
_080A0F74:
	ldr r1, [r6, #4]
	ldrh r0, [r1]
	cmp r0, sl
	bne _080A0F90
	movs r0, #0
	strh r0, [r6]
	ldrh r0, [r6, #2]
	adds r0, #2
	strh r0, [r6, #2]
	mov r0, sb
	strb r0, [r6, #0x13]
	b _080A0FE2
	.align 2, 0
_080A0F8C: .4byte 0x0600C800
_080A0F90:
	ldrh r4, [r6]
	lsls r4, r4, #5
	ldrh r0, [r6, #2]
	lsls r0, r0, #0xa
	adds r4, r4, r0
	adds r4, r4, r7
	ldrh r0, [r1]
	bl GetCharacterWidth
	adds r5, r0, #0
	ldr r0, [r6, #4]
	ldrh r0, [r0]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r6, #0x13]
	movs r1, #0
	str r1, [sp]
	adds r1, r4, #0
	bl DrawCharacter
	ldrb r0, [r6, #0x13]
	adds r0, r0, r5
	strb r0, [r6, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _080A0FE2
	ldr r5, _080A1004 @ =gNonGameplayRam
	ldrb r4, [r5, #0x13]
	ldrh r3, [r5]
_080A0FCC:
	adds r2, r4, #0
	subs r2, #8
	adds r4, r2, #0
	adds r1, r3, #1
	adds r3, r1, #0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080A0FCC
	strh r1, [r5]
	strb r2, [r5, #0x13]
_080A0FE2:
	ldr r1, _080A1004 @ =gNonGameplayRam
	ldr r2, [r1, #4]
	adds r0, r2, #2
	str r0, [r1, #4]
	adds r6, r1, #0
	ldrh r0, [r2, #2]
	cmp r0, r8
	bne _080A0F74
_080A0FF2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1004: .4byte gNonGameplayRam

	thumb_func_start FileSelectDestroyOamOfType
FileSelectDestroyOamOfType: @ 0x080A1008
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r2, #0
	ldr r5, _080A1028 @ =gNonGameplayRam
	movs r3, #0
_080A1014:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r5
	ldrb r0, [r1, #0x1c]
	cmp r0, r4
	bne _080A102C
	strb r3, [r1, #0x1c]
	strb r3, [r1, #0x1d]
	b _080A1036
	.align 2, 0
_080A1028: .4byte gNonGameplayRam
_080A102C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x16
	bls _080A1014
_080A1036:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start FileSelectSetUpAreaNameOam
FileSelectSetUpAreaNameOam: @ 0x080A103C
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #1
	bl FileSelectSetupOam
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	cmp r0, #6
	bls _080A1064
	b _080A1198
_080A1064:
	lsls r0, r0, #2
	ldr r1, _080A1070 @ =_080A1074
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A1070: .4byte _080A1074
_080A1074: @ jump table
	.4byte _080A1198 @ case 0
	.4byte _080A1090 @ case 1
	.4byte _080A10BC @ case 2
	.4byte _080A10E8 @ case 3
	.4byte _080A1114 @ case 4
	.4byte _080A1140 @ case 5
	.4byte _080A116C @ case 6
_080A1090:
	ldr r0, _080A10B0 @ =gNonGameplayRam
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r1, r0
	ldr r3, _080A10B4 @ =0x0879E944
	ldr r0, _080A10B8 @ =0x03000011
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r3, #4
	b _080A11B2
	.align 2, 0
_080A10B0: .4byte gNonGameplayRam
_080A10B4: .4byte 0x0879E944
_080A10B8: .4byte 0x03000011
_080A10BC:
	ldr r0, _080A10DC @ =gNonGameplayRam
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r1, r0
	ldr r3, _080A10E0 @ =0x0879E944
	ldr r0, _080A10E4 @ =0x03000011
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r3, #8
	b _080A11B2
	.align 2, 0
_080A10DC: .4byte gNonGameplayRam
_080A10E0: .4byte 0x0879E944
_080A10E4: .4byte 0x03000011
_080A10E8:
	ldr r0, _080A1108 @ =gNonGameplayRam
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r1, r0
	ldr r3, _080A110C @ =0x0879E944
	ldr r0, _080A1110 @ =0x03000011
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0xc
	b _080A11B2
	.align 2, 0
_080A1108: .4byte gNonGameplayRam
_080A110C: .4byte 0x0879E944
_080A1110: .4byte 0x03000011
_080A1114:
	ldr r0, _080A1134 @ =gNonGameplayRam
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r1, r0
	ldr r3, _080A1138 @ =0x0879E944
	ldr r0, _080A113C @ =0x03000011
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x10
	b _080A11B2
	.align 2, 0
_080A1134: .4byte gNonGameplayRam
_080A1138: .4byte 0x0879E944
_080A113C: .4byte 0x03000011
_080A1140:
	ldr r0, _080A1160 @ =gNonGameplayRam
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r1, r0
	ldr r3, _080A1164 @ =0x0879E944
	ldr r0, _080A1168 @ =0x03000011
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x14
	b _080A11B2
	.align 2, 0
_080A1160: .4byte gNonGameplayRam
_080A1164: .4byte 0x0879E944
_080A1168: .4byte 0x03000011
_080A116C:
	ldr r0, _080A118C @ =gNonGameplayRam
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r1, r0
	ldr r3, _080A1190 @ =0x0879E944
	ldr r0, _080A1194 @ =0x03000011
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r3, #0x18
	b _080A11B2
	.align 2, 0
_080A118C: .4byte gNonGameplayRam
_080A1190: .4byte 0x0879E944
_080A1194: .4byte 0x03000011
_080A1198:
	ldr r0, _080A11C0 @ =gNonGameplayRam
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r1, r0
	ldr r3, _080A11C4 @ =0x0879E944
	ldr r0, _080A11C8 @ =0x03000011
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
_080A11B2:
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A11C0: .4byte gNonGameplayRam
_080A11C4: .4byte 0x0879E944
_080A11C8: .4byte 0x03000011

	thumb_func_start FileSelectProcessOam
FileSelectProcessOam: @ 0x080A11CC
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _080A1204 @ =gNonGameplayRam
	adds r6, r5, #0
	adds r6, #0x18
_080A11D6:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r2, r0, #2
	adds r0, r2, r5
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	beq _080A11F2
	adds r1, r5, #0
	adds r1, #0x30
	adds r1, r2, r1
	adds r0, r2, r6
	ldr r1, [r1]
	bl _call_via_r1
_080A11F2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x16
	bls _080A11D6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1204: .4byte gNonGameplayRam

	thumb_func_start FileSelectDrawAllOam
FileSelectDrawAllOam: @ 0x080A1208
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _080A1240 @ =gNonGameplayRam
	adds r6, r5, #0
	adds r6, #0x18
_080A1212:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r1, r0, #2
	adds r0, r1, r5
	ldrb r0, [r0, #0x1d]
	cmp r0, #0
	beq _080A1226
	adds r0, r1, r6
	bl FileSelectDrawOam
_080A1226:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x16
	bls _080A1212
	bl ResetFreeOam
	ldr r1, _080A1244 @ =gNextOamSlot
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1240: .4byte gNonGameplayRam
_080A1244: .4byte gNextOamSlot

	thumb_func_start FileSelectDrawOam
FileSelectDrawOam: @ 0x080A1248
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r2, _080A1308 @ =gNextOamSlot
	ldrb r0, [r2]
	lsls r0, r0, #3
	ldr r1, _080A130C @ =gOamData
	adds r7, r0, r1
	ldrb r4, [r5, #6]
	lsls r1, r4, #3
	ldr r0, [r5, #0x14]
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	ldrb r2, [r5, #7]
	cmp r0, r2
	bne _080A1278
	adds r0, r4, #1
	movs r1, #0
	strb r0, [r5, #6]
	strb r1, [r5, #7]
	adds r3, #8
_080A1278:
	ldrb r1, [r3, #4]
	cmp r1, #0
	bne _080A1286
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	subs r3, r3, r0
	strb r1, [r5, #6]
_080A1286:
	ldr r6, [r3]
	ldrh r3, [r6]
	mov sl, r3
	adds r6, #2
	movs r4, #0
	mov sb, r4
	cmp sb, sl
	blt _080A1298
	b _080A139C
_080A1298:
	ldrh r0, [r6]
	mov r8, r0
	adds r6, #2
	ldrh r1, [r6]
	mov ip, r1
	adds r6, #2
	strh r0, [r7]
	adds r7, #2
	strh r1, [r7]
	adds r7, #2
	ldrh r0, [r6]
	strh r0, [r7]
	adds r6, #2
	adds r7, #2
	ldr r2, _080A1308 @ =gNextOamSlot
	ldrb r0, [r2]
	mov r4, sb
	adds r3, r0, r4
	ldrb r1, [r5, #0xc]
	cmp r1, #1
	bne _080A1318
	lsls r4, r3, #3
	ldr r0, _080A130C @ =gOamData
	adds r2, r4, r0
	ldrb r3, [r2, #3]
	lsls r0, r3, #0x1b
	lsrs r0, r0, #0x1f
	eors r0, r1
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #3]
	lsrs r1, r1, #6
	ldrb r0, [r2, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r2, _080A1310 @ =0x0873DBA4
	adds r1, r1, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r5]
	subs r2, r1, r0
	ldr r3, _080A1314 @ =0x000001FF
	ands r2, r3
	ldrh r0, [r5, #2]
	mov r3, r8
	adds r1, r3, r0
	movs r0, #0xff
	ands r1, r0
	b _080A132E
	.align 2, 0
_080A1308: .4byte gNextOamSlot
_080A130C: .4byte gOamData
_080A1310: .4byte 0x0873DBA4
_080A1314: .4byte 0x000001FF
_080A1318:
	ldrh r0, [r5, #2]
	mov r4, r8
	adds r1, r4, r0
	movs r0, #0xff
	ands r1, r0
	ldrh r0, [r5]
	mov r4, ip
	adds r2, r4, r0
	ldr r0, _080A13B8 @ =0x000001FF
	ands r2, r0
	lsls r4, r3, #3
_080A132E:
	ldr r0, _080A13BC @ =gOamData
	adds r3, r4, r0
	strb r1, [r3]
	ldr r1, _080A13B8 @ =0x000001FF
	ands r2, r1
	ldrh r1, [r3, #2]
	ldr r0, _080A13C0 @ =0xFFFFFE00
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #2]
	ldrb r1, [r5, #0xb]
	movs r2, #3
	ands r1, r2
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	lsrs r2, r0, #4
	ldrb r4, [r5, #0xd]
	adds r2, r2, r4
	lsls r2, r2, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #5]
	ldrh r2, [r3, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldrh r0, [r5, #0xe]
	adds r1, r1, r0
	ldr r4, _080A13C4 @ =0x000003FF
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _080A13C8 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldrb r1, [r5, #0xa]
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #1]
	subs r0, #0x10
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	adds r7, #2
	movs r1, #1
	add sb, r1
	cmp sb, sl
	bge _080A139C
	b _080A1298
_080A139C:
	ldr r2, _080A13CC @ =gNextOamSlot
	ldrb r0, [r2]
	add r0, sl
	strb r0, [r2]
	ldrb r0, [r5, #7]
	adds r0, #1
	strb r0, [r5, #7]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A13B8: .4byte 0x000001FF
_080A13BC: .4byte gOamData
_080A13C0: .4byte 0xFFFFFE00
_080A13C4: .4byte 0x000003FF
_080A13C8: .4byte 0xFFFFFC00
_080A13CC: .4byte gNextOamSlot

	thumb_func_start SetLanguage
SetLanguage: @ 0x080A13D0
	ldr r1, _080A13DC @ =0x03000011
	movs r0, #2
	strb r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_080A13DC: .4byte 0x03000011

	thumb_func_start unk_a13e0
unk_a13e0: @ 0x080A13E0
	push {r4, lr}
	ldr r4, _080A1454 @ =0x04000208
	movs r1, #0
	strh r1, [r4]
	ldr r3, _080A1458 @ =0x04000004
	ldrh r2, [r3]
	ldr r0, _080A145C @ =0x0000FFEF
	ands r0, r2
	strh r0, [r3]
	ldr r3, _080A1460 @ =0x04000200
	ldrh r2, [r3]
	ldr r0, _080A1464 @ =0x0000FFFD
	ands r0, r2
	strh r0, [r3]
	movs r0, #1
	strh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #0x13
	strh r1, [r3]
	ldr r2, _080A1468 @ =0x04000050
	movs r0, #0xff
	strh r0, [r2]
	ldr r0, _080A146C @ =gWrittenToBldy
	movs r2, #0x10
	strh r2, [r0]
	ldr r0, _080A1470 @ =0x04000054
	strh r2, [r0]
	subs r0, #0x46
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	strh r1, [r3]
	ldr r0, _080A1474 @ =unk_a1478
	bl CallbackSetVBlank
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1454: .4byte 0x04000208
_080A1458: .4byte 0x04000004
_080A145C: .4byte 0x0000FFEF
_080A1460: .4byte 0x04000200
_080A1464: .4byte 0x0000FFFD
_080A1468: .4byte 0x04000050
_080A146C: .4byte gWrittenToBldy
_080A1470: .4byte 0x04000054
_080A1474: .4byte unk_a1478

	thumb_func_start unk_a1478
unk_a1478: @ 0x080A1478
	bx lr
	.align 2, 0

	thumb_func_start unk_a147c
unk_a147c: @ 0x080A147C
	movs r0, #1
	bx lr
