    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start UpdateGadoraHatch
UpdateGadoraHatch: @ 0x080685B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	rsbs r3, r2, #0
	orrs r3, r2
	lsrs r3, r3, #0x1f
	str r3, [sp]
	movs r6, #0
	movs r7, #0
	movs r4, #0
	lsrs r0, r0, #0x16
	lsls r0, r0, #0x10
	mov r8, r0
	lsrs r1, r1, #0x16
	lsls r1, r1, #0x10
	mov ip, r1
	mov sb, r3
	ldr r3, _08068638 @ =gHatchData
	movs r0, #2
	rsbs r0, r0, #0
	mov sl, r0
_080685EC:
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bne _0806863C
	ldrb r1, [r3, #2]
	adds r0, r1, r6
	mov r5, r8
	lsrs r2, r5, #0x10
	cmp r0, r2
	blt _0806861C
	subs r0, r1, r6
	cmp r0, r2
	bgt _0806861C
	ldrb r1, [r3, #3]
	adds r0, r1, #3
	mov r5, ip
	lsrs r2, r5, #0x10
	cmp r0, r2
	blt _0806861C
	movs r5, #0
	subs r0, r1, r5
	cmp r0, r2
	bgt _0806861C
	movs r7, #1
_0806861C:
	cmp r7, #0
	beq _0806863C
	ldrb r1, [r3]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	ldr r2, [sp]
	cmp r0, r2
	beq _0806864A
	mov r0, sl
	ands r0, r1
	mov r5, sb
	orrs r0, r5
	strb r0, [r3]
	b _08068644
	.align 2, 0
_08068638: .4byte gHatchData
_0806863C:
	adds r3, #4
	adds r4, #1
	cmp r4, #5
	ble _080685EC
_08068644:
	adds r4, #1
	cmp r7, #0
	bne _0806864C
_0806864A:
	movs r4, #0
_0806864C:
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UpdateInGameTimer
UpdateInGameTimer: @ 0x08068660
	push {r4, lr}
	ldr r0, _080686D8 @ =gMaxInGameTimeFlag
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080686D0
	ldr r1, _080686DC @ =gInGameTimer
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bls _080686BA
	adds r2, r1, #0
	movs r3, #0
_08068680:
	strb r3, [r2, #3]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _080686BA
	strb r3, [r1, #2]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _080686BA
	strb r3, [r2, #1]
	ldrb r0, [r2]
	cmp r0, #0x63
	bhi _080686AC
	adds r0, #1
	strb r0, [r2]
_080686AC:
	ldrb r0, [r2, #3]
	adds r0, #1
	strb r0, [r2, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _08068680
_080686BA:
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _080686D0
	movs r0, #1
	strb r0, [r4]
	movs r0, #0x63
	strb r0, [r1]
	movs r0, #0x3b
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
_080686D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080686D8: .4byte gMaxInGameTimeFlag
_080686DC: .4byte gInGameTimer

	thumb_func_start IoWriteRegisters
IoWriteRegisters: @ 0x080686E0
	push {r4, lr}
	ldr r2, _08068760 @ =gWrittenToDispcnt
	ldrh r1, [r2]
	cmp r1, #0
	beq _080686F4
	movs r0, #0x80
	lsls r0, r0, #0x13
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_080686F4:
	ldr r2, _08068764 @ =gWrittenToBldalpha
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068704
	ldr r0, _08068768 @ =0x04000052
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068704:
	ldr r2, _0806876C @ =gWrittenToWinin_L
	ldrb r1, [r2]
	cmp r1, #0
	beq _08068714
	ldr r0, _08068770 @ =0x04000049
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_08068714:
	ldr r2, _08068774 @ =gWrittenToWinout_R
	ldrb r1, [r2]
	cmp r1, #0
	beq _08068724
	ldr r0, _08068778 @ =0x0400004A
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_08068724:
	ldr r3, _0806877C @ =gWrittenToWin1H
	ldr r4, _08068780 @ =gWrittenToWin1V
	ldrh r1, [r3]
	ldrh r2, [r4]
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _08068742
	ldr r0, _08068784 @ =0x04000042
	strh r1, [r0]
	adds r0, #4
	strh r2, [r0]
	movs r0, #0
	strh r0, [r3]
	strh r0, [r4]
_08068742:
	ldr r2, _08068788 @ =gWrittenToBldcnt_Special
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068752
	ldr r0, _0806878C @ =0x04000050
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068752:
	bl CheckTransferFadedPalette
	bl TransferAnimatedGraphics
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068760: .4byte gWrittenToDispcnt
_08068764: .4byte gWrittenToBldalpha
_08068768: .4byte 0x04000052
_0806876C: .4byte gWrittenToWinin_L
_08068770: .4byte 0x04000049
_08068774: .4byte gWrittenToWinout_R
_08068778: .4byte 0x0400004A
_0806877C: .4byte gWrittenToWin1H
_08068780: .4byte gWrittenToWin1V
_08068784: .4byte 0x04000042
_08068788: .4byte gWrittenToBldcnt_Special
_0806878C: .4byte 0x04000050

	thumb_func_start IoWriteRegistersDuringTransition
IoWriteRegistersDuringTransition: @ 0x08068790
	push {r4, lr}
	ldr r2, _08068830 @ =gWrittenToDispcnt
	ldrh r1, [r2]
	cmp r1, #0
	beq _080687A4
	movs r0, #0x80
	lsls r0, r0, #0x13
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_080687A4:
	ldr r2, _08068834 @ =gWrittenToBldalpha
	ldrh r1, [r2]
	cmp r1, #0
	beq _080687B4
	ldr r0, _08068838 @ =0x04000052
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_080687B4:
	ldr r2, _0806883C @ =gWrittenToWinin_L
	ldrb r1, [r2]
	cmp r1, #0
	beq _080687C4
	ldr r0, _08068840 @ =0x04000049
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_080687C4:
	ldr r2, _08068844 @ =gWrittenToWinout_R
	ldrb r1, [r2]
	cmp r1, #0
	beq _080687D4
	ldr r0, _08068848 @ =0x0400004A
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_080687D4:
	ldr r3, _0806884C @ =gWrittenToWin1H
	ldr r4, _08068850 @ =gWrittenToWin1V
	ldrh r1, [r3]
	ldrh r2, [r4]
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _080687F2
	ldr r0, _08068854 @ =0x04000042
	strh r1, [r0]
	adds r0, #4
	strh r2, [r0]
	movs r0, #0
	strh r0, [r3]
	strh r0, [r4]
_080687F2:
	ldr r2, _08068858 @ =gWrittenToBldcnt_Special
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068802
	ldr r0, _0806885C @ =0x04000050
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068802:
	ldr r2, _08068860 @ =0x03004E40
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068812
	ldr r0, _08068864 @ =0x0400000A
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068812:
	ldr r2, _08068868 @ =0x03004E3E
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068822
	ldr r0, _0806886C @ =0x0400000E
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068822:
	bl CheckTransferFadedPalette
	bl TransferAnimatedGraphics
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068830: .4byte gWrittenToDispcnt
_08068834: .4byte gWrittenToBldalpha
_08068838: .4byte 0x04000052
_0806883C: .4byte gWrittenToWinin_L
_08068840: .4byte 0x04000049
_08068844: .4byte gWrittenToWinout_R
_08068848: .4byte 0x0400004A
_0806884C: .4byte gWrittenToWin1H
_08068850: .4byte gWrittenToWin1V
_08068854: .4byte 0x04000042
_08068858: .4byte gWrittenToBldcnt_Special
_0806885C: .4byte 0x04000050
_08068860: .4byte 0x03004E40
_08068864: .4byte 0x0400000A
_08068868: .4byte 0x03004E3E
_0806886C: .4byte 0x0400000E

	thumb_func_start ProcessPauseButtonPress
ProcessPauseButtonPress: @ 0x08068870
	push {r4, lr}
	movs r4, #1
	ldr r0, _080688AC @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _08068894
	ldr r0, _080688B0 @ =gCurrentPowerBomb
	ldrb r1, [r0]
	ldrb r0, [r0, #0x10]
	orrs r0, r1
	cmp r0, #0
	bne _08068894
	ldr r0, _080688B4 @ =0x0300002B
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08068896
_08068894:
	movs r4, #0
_08068896:
	ldr r0, _080688B8 @ =gSamusData
	ldrb r0, [r0, #1]
	subs r0, #0x20
	cmp r0, #0x1e
	bhi _0806893E
	lsls r0, r0, #2
	ldr r1, _080688BC @ =_080688C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080688AC: .4byte gPreventMovementTimer
_080688B0: .4byte gCurrentPowerBomb
_080688B4: .4byte 0x0300002B
_080688B8: .4byte gSamusData
_080688BC: .4byte _080688C0
_080688C0: @ jump table
	.4byte _0806893C @ case 0
	.4byte _0806893C @ case 1
	.4byte _0806893C @ case 2
	.4byte _0806893E @ case 3
	.4byte _0806893E @ case 4
	.4byte _0806893E @ case 5
	.4byte _0806893E @ case 6
	.4byte _0806893E @ case 7
	.4byte _0806893E @ case 8
	.4byte _0806893E @ case 9
	.4byte _0806893E @ case 10
	.4byte _0806893E @ case 11
	.4byte _0806893E @ case 12
	.4byte _0806893E @ case 13
	.4byte _0806893E @ case 14
	.4byte _0806893E @ case 15
	.4byte _0806893E @ case 16
	.4byte _0806893E @ case 17
	.4byte _0806893E @ case 18
	.4byte _0806893E @ case 19
	.4byte _0806893C @ case 20
	.4byte _0806893C @ case 21
	.4byte _0806893C @ case 22
	.4byte _0806893C @ case 23
	.4byte _0806893E @ case 24
	.4byte _0806893E @ case 25
	.4byte _0806893E @ case 26
	.4byte _0806893C @ case 27
	.4byte _0806893E @ case 28
	.4byte _0806893C @ case 29
	.4byte _0806893C @ case 30
_0806893C:
	movs r4, #0
_0806893E:
	cmp r4, #1
	bne _0806896C
	ldr r0, _08068958 @ =gDemoState
	ldrb r0, [r0]
	cmp r0, #0
	beq _08068960
	ldr r0, _0806895C @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #0x10
	cmp r0, #0
	beq _08068966
	movs r1, #0xe
	b _08068966
	.align 2, 0
_08068958: .4byte gDemoState
_0806895C: .4byte gButtonInput
_08068960:
	bl LowerMusicVolume
	movs r1, #2
_08068966:
	adds r0, r1, #0
	bl StartColorFading
_0806896C:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start unk_68974
unk_68974: @ 0x08068974
	push {r4, lr}
	sub sp, #4
	ldr r4, _0806898C @ =gUnk_03004e48
	ldrb r0, [r4]
	cmp r0, #0
	beq _080689DC
	cmp r0, #1
	beq _08068990
	cmp r0, #2
	beq _080689AC
	b _080689BC
	.align 2, 0
_0806898C: .4byte gUnk_03004e48
_08068990:
	ldr r1, _080689E4 @ =0x06001000
	ldr r2, _080689E8 @ =0x02020000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #0
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_080689AC:
	bl unk_689f0
	cmp r0, #0
	beq _080689BC
	ldr r1, _080689EC @ =gUnk_03004e48
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080689BC:
	ldr r4, _080689EC @ =gUnk_03004e48
	ldrb r0, [r4]
	cmp r0, #0x80
	bne _080689DC
	ldr r1, _080689E8 @ =0x02020000
	ldr r2, _080689E4 @ =0x06001000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
_080689DC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080689E4: .4byte 0x06001000
_080689E8: .4byte 0x02020000
_080689EC: .4byte gUnk_03004e48

	thumb_func_start unk_689f0
unk_689f0: @ 0x080689F0
	push {r4, r5, r6, r7, lr}
	ldr r1, _08068A00 @ =gUnk_03004e48
	ldrb r0, [r1, #1]
	cmp r0, #0xc
	bne _08068A04
	movs r0, #1
	b _08068AE0
	.align 2, 0
_08068A00: .4byte gUnk_03004e48
_08068A04:
	ldr r0, _08068A48 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r5, r0, #6
	ldr r0, _08068A4C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r5, #1
	ldrb r1, [r1, #1]
	adds r5, r0, r1
	subs r4, #1
	movs r7, #0x80
	lsls r7, r7, #8
	movs r6, #0x10
_08068A1E:
	ldr r1, _08068A50 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	muls r0, r5, r0
	adds r2, r0, r4
	ldr r1, [r1, #0x18]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	adds r0, r2, #0
	ands r0, r7
	cmp r0, #0
	bne _08068ACE
	ldr r0, _08068A54 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0x16
	bne _08068A5C
	ldr r2, _08068A58 @ =0x00008006
	b _08068ABE
	.align 2, 0
_08068A48: .4byte gBg1YPosition
_08068A4C: .4byte gBg1XPosition
_08068A50: .4byte gBackgroundsData
_08068A54: .4byte gTilemapAndClipPointers
_08068A58: .4byte 0x00008006
_08068A5C:
	cmp r2, #0x1a
	bne _08068A68
	ldr r2, _08068A64 @ =0x0000800D
	b _08068ABE
	.align 2, 0
_08068A64: .4byte 0x0000800D
_08068A68:
	cmp r2, #0x19
	bne _08068A74
	ldr r2, _08068A70 @ =0x00008007
	b _08068ABE
	.align 2, 0
_08068A70: .4byte 0x00008007
_08068A74:
	cmp r2, #0x21
	bne _08068A80
	ldr r2, _08068A7C @ =0x00008009
	b _08068ABE
	.align 2, 0
_08068A7C: .4byte 0x00008009
_08068A80:
	cmp r2, #0x22
	bne _08068A8C
	ldr r2, _08068A88 @ =0x0000800A
	b _08068ABE
	.align 2, 0
_08068A88: .4byte 0x0000800A
_08068A8C:
	cmp r2, #0x23
	bne _08068A94
	adds r2, r7, #0
	b _08068ABE
_08068A94:
	cmp r2, #0x10
	beq _08068AAC
	cmp r2, #0x11
	beq _08068AAC
	cmp r2, #0x12
	beq _08068AAC
	cmp r2, #0x13
	beq _08068AAC
	cmp r2, #0x14
	beq _08068AAC
	cmp r2, #0x15
	bne _08068AB4
_08068AAC:
	ldr r2, _08068AB0 @ =0x0000800C
	b _08068ABE
	.align 2, 0
_08068AB0: .4byte 0x0000800C
_08068AB4:
	cmp r2, #0x17
	beq _08068ABC
	cmp r2, #0x18
	bne _08068ACE
_08068ABC:
	ldr r2, _08068AE8 @ =0x00008005
_08068ABE:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r5, #0x10
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	lsrs r1, r1, #0x10
	bl SetVramBg1BlockTilemapValue
_08068ACE:
	subs r6, #1
	adds r4, #1
	cmp r6, #0
	bge _08068A1E
	ldr r1, _08068AEC @ =gUnk_03004e48
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	movs r0, #0
_08068AE0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08068AE8: .4byte 0x00008005
_08068AEC: .4byte gUnk_03004e48

	thumb_func_start SetupClipdataCode
SetupClipdataCode: @ 0x08068AF0
	ldr r1, _08068B08 @ =0x040000D4
	ldr r0, _08068B0C @ =ClipdataConvertToCollision
	str r0, [r1]
	ldr r2, _08068B10 @ =gNonGameplayRam
	str r2, [r1, #4]
	ldr r0, _08068B14 @ =0x80000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08068B18 @ =gClipdataCodePointer
	adds r2, #1
	str r2, [r0]
	bx lr
	.align 2, 0
_08068B08: .4byte 0x040000D4
_08068B0C: .4byte ClipdataConvertToCollision
_08068B10: .4byte gNonGameplayRam
_08068B14: .4byte 0x80000140
_08068B18: .4byte gClipdataCodePointer

	thumb_func_start ClipdataProcessForSamus
ClipdataProcessForSamus: @ 0x08068B1C
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	lsls r2, r0, #0x10
	lsrs r5, r2, #0x10
	lsls r4, r1, #0x10
	lsrs r6, r4, #0x10
	ldr r3, _08068B38 @ =gBackgroundsData
	ldrh r0, [r3, #0x1c]
	lsls r0, r0, #6
	cmp r6, r0
	blt _08068B40
	ldr r0, _08068B3C @ =0x01000001
	b _08068BB0
	.align 2, 0
_08068B38: .4byte gBackgroundsData
_08068B3C: .4byte 0x01000001
_08068B40:
	ldrh r0, [r3, #0x1e]
	lsls r0, r0, #6
	cmp r5, r0
	blt _08068B4C
	movs r0, #0
	b _08068BB0
_08068B4C:
	mov r1, sp
	lsrs r0, r2, #0x16
	strh r0, [r1, #0x1a]
	lsrs r0, r4, #0x16
	strh r0, [r1, #0x18]
	mov r0, sp
	ldrh r2, [r0, #0x1a]
	ldrh r0, [r3, #0x1c]
	muls r0, r2, r0
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08068B88
	ldr r0, _08068B80 @ =0x083BF5C0
	ldr r1, _08068B84 @ =0x00007FFF
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _08068B90
	.align 2, 0
_08068B80: .4byte 0x083BF5C0
_08068B84: .4byte 0x00007FFF
_08068B88:
	ldr r0, _08068BB8 @ =gTilemapAndClipPointers
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
_08068B90:
	str r0, [sp]
	movs r1, #0x3f
	adds r0, r5, #0
	ands r0, r1
	str r0, [sp, #8]
	adds r0, r6, #0
	ands r0, r1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _08068BBC @ =gClipdataCodePointer
	ldr r1, [r0]
	mov r0, sp
	bl _call_via_r1
	adds r2, r0, #0
_08068BB0:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068BB8: .4byte gTilemapAndClipPointers
_08068BBC: .4byte gClipdataCodePointer

	thumb_func_start ClipdataProcess
ClipdataProcess: @ 0x08068BC0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x1c
	lsls r4, r0, #0x10
	lsrs r0, r4, #0x10
	mov r8, r0
	lsls r6, r1, #0x10
	lsrs r0, r6, #0x10
	mov sb, r0
	ldr r5, _08068BFC @ =gBackgroundsData
	ldrh r0, [r5, #0x1c]
	lsls r0, r0, #6
	cmp sb, r0
	bge _08068BE8
	ldrh r0, [r5, #0x1e]
	lsls r0, r0, #6
	cmp r8, r0
	blt _08068C08
_08068BE8:
	ldr r1, _08068C00 @ =gCurrentAffectingClipdata
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r0, _08068C04 @ =gCurrentClipdataAffectingAction
	strb r2, [r0]
	movs r0, #0
	b _08068CB2
	.align 2, 0
_08068BFC: .4byte gBackgroundsData
_08068C00: .4byte gCurrentAffectingClipdata
_08068C04: .4byte gCurrentClipdataAffectingAction
_08068C08:
	ldr r7, _08068C4C @ =gCurrentClipdataAffectingAction
	ldrb r0, [r7]
	cmp r0, #0
	bne _08068C18
	mov r0, r8
	mov r1, sb
	bl ClipdataUpdateCurrentAffecting
_08068C18:
	mov r1, sp
	lsrs r0, r4, #0x16
	strh r0, [r1, #0x1a]
	lsrs r0, r6, #0x16
	strh r0, [r1, #0x18]
	mov r0, sp
	ldrh r2, [r0, #0x1a]
	ldrh r0, [r5, #0x1c]
	muls r0, r2, r0
	ldrh r1, [r1, #0x18]
	adds r4, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	ldrb r1, [r7]
	cmp r1, #4
	bls _08068C50
	movs r0, #1
	str r0, [sp, #0x14]
	cmp r1, #5
	bne _08068C54
	movs r0, #0
	strb r0, [r7]
	b _08068C54
	.align 2, 0
_08068C4C: .4byte gCurrentClipdataAffectingAction
_08068C50:
	movs r0, #2
	str r0, [sp, #0x14]
_08068C54:
	ldr r5, _08068C84 @ =gCurrentClipdataAffectingAction
	ldrb r0, [r5]
	cmp r0, #0
	beq _08068C70
	mov r0, sp
	ldrh r0, [r0, #0x1a]
	mov r1, sp
	ldrh r1, [r1, #0x18]
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	bl BlockApplyCCAA
	movs r0, #0
	strb r0, [r5]
_08068C70:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08068C90
	ldr r0, _08068C88 @ =0x083BF5C0
	ldr r1, _08068C8C @ =0x00007FFF
	ands r4, r1
	adds r0, r4, r0
	b _08068C96
	.align 2, 0
_08068C84: .4byte gCurrentClipdataAffectingAction
_08068C88: .4byte 0x083BF5C0
_08068C8C: .4byte 0x00007FFF
_08068C90:
	ldr r0, _08068CC0 @ =gTilemapAndClipPointers
	ldr r0, [r0, #4]
	adds r0, r0, r4
_08068C96:
	ldrb r0, [r0]
	str r0, [sp]
	movs r1, #0x3f
	mov r0, r8
	ands r0, r1
	str r0, [sp, #8]
	mov r0, sb
	ands r0, r1
	str r0, [sp, #4]
	ldr r0, _08068CC4 @ =gClipdataCodePointer
	ldr r1, [r0]
	mov r0, sp
	bl _call_via_r1
_08068CB2:
	add sp, #0x1c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08068CC0: .4byte gTilemapAndClipPointers
_08068CC4: .4byte gClipdataCodePointer

	thumb_func_start ClipdataConvertToCollision
ClipdataConvertToCollision: @ 0x08068CC8
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, [r4]
	cmp r0, #0xc
	bls _08068CD6
	b _08068E66
_08068CD6:
	lsls r0, r0, #2
	ldr r1, _08068CE0 @ =_08068CE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068CE0: .4byte _08068CE4
_08068CE4: @ jump table
	.4byte _08068D96 @ case 0
	.4byte _08068D18 @ case 1
	.4byte _08068D20 @ case 2
	.4byte _08068D30 @ case 3
	.4byte _08068D44 @ case 4
	.4byte _08068D56 @ case 5
	.4byte _08068D6A @ case 6
	.4byte _08068D80 @ case 7
	.4byte _08068D9A @ case 8
	.4byte _08068DA4 @ case 9
	.4byte _08068DAE @ case 10
	.4byte _08068DBA @ case 11
	.4byte _08068D96 @ case 12
_08068D18:
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D20:
	ldr r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r1, r0
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D30:
	ldr r0, [r4, #4]
	movs r1, #0x3f
	subs r1, r1, r0
	ldr r0, [r4, #8]
	cmp r0, r1
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D44:
	ldr r0, [r4, #4]
	asrs r0, r0, #1
	ldr r1, [r4, #8]
	cmp r1, r0
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D56:
	ldr r0, [r4, #4]
	adds r0, #0x3f
	asrs r0, r0, #1
	ldr r1, [r4, #8]
	cmp r1, r0
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D6A:
	ldr r0, [r4, #4]
	asrs r0, r0, #1
	movs r1, #0x3f
	subs r1, r1, r0
	ldr r0, [r4, #8]
	cmp r0, r1
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D80:
	ldr r0, [r4, #4]
	movs r1, #0x3f
	subs r1, r1, r0
	asrs r1, r1, #1
	ldr r0, [r4, #8]
	cmp r0, r1
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D96:
	ldr r2, [r4]
	b _08068E66
_08068D9A:
	ldr r0, [r4, #0x14]
	cmp r0, #1
	ble _08068E5C
	movs r0, #0
	b _08068DB4
_08068DA4:
	ldr r0, [r4, #0x14]
	cmp r0, #1
	bgt _08068E5C
	movs r0, #0
	b _08068DB4
_08068DAE:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _08068E5C
_08068DB4:
	str r0, [r4]
	movs r2, #0
	b _08068E66
_08068DBA:
	ldr r2, _08068DE4 @ =gBackgroundsData
	ldrh r1, [r4, #0x1a]
	ldrh r0, [r2, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4, #0x18]
	ldr r2, [r2, #0x18]
	lsls r1, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r1, r1, r0
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08068DF0
	ldr r1, _08068DE8 @ =0x083BE3A0
	ldr r0, _08068DEC @ =0x00007FFF
	ands r3, r0
	b _08068DF4
	.align 2, 0
_08068DE4: .4byte gBackgroundsData
_08068DE8: .4byte 0x083BE3A0
_08068DEC: .4byte 0x00007FFF
_08068DF0:
	ldr r0, _08068E48 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
_08068DF4:
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r2, #7
	cmp r3, #0x7f
	ble _08068E20
	movs r2, #0
	cmp r3, #0x85
	ble _08068E20
	movs r2, #1
	cmp r3, #0x8b
	ble _08068E20
	movs r2, #2
	cmp r3, #0x91
	ble _08068E20
	movs r2, #3
	cmp r3, #0x97
	ble _08068E20
	movs r2, #7
	cmp r3, #0x9d
	bgt _08068E20
	movs r2, #4
_08068E20:
	cmp r2, #4
	bgt _08068E50
	adds r1, r3, #0
	subs r1, #0x80
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	subs r2, r1, r0
	movs r3, #0
	ldr r1, _08068E4C @ =gHatchData
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _08068E52
	movs r3, #1
	b _08068E52
	.align 2, 0
_08068E48: .4byte gTilemapAndClipPointers
_08068E4C: .4byte gHatchData
_08068E50:
	movs r3, #0
_08068E52:
	movs r2, #0
	cmp r3, #0
	beq _08068E5C
	str r2, [r4]
	b _08068E66
_08068E5C:
	movs r0, #1
	str r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #0x11
_08068E64:
	orrs r2, r0
_08068E66:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ClipdataUpdateCurrentAffecting
ClipdataUpdateCurrentAffecting: @ 0x08068E70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r4, r0, #0x10
	lsrs r0, r4, #0x10
	mov r8, r0
	lsls r5, r1, #0x10
	lsrs r6, r5, #0x10
	ldr r1, _08068EA4 @ =gCurrentAffectingClipdata
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r3, _08068EA8 @ =gBackgroundsData
	ldrh r0, [r3, #0x1e]
	lsls r0, r0, #6
	adds r7, r1, #0
	cmp r8, r0
	bge _08068E9E
	ldrh r2, [r3, #0x1c]
	lsls r0, r2, #6
	cmp r6, r0
	blt _08068EAC
_08068E9E:
	movs r0, #0
	b _08068FB8
	.align 2, 0
_08068EA4: .4byte gCurrentAffectingClipdata
_08068EA8: .4byte gBackgroundsData
_08068EAC:
	lsrs r0, r4, #0x16
	lsrs r1, r5, #0x16
	muls r0, r2, r0
	adds r4, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08068ED8
	ldr r1, _08068ED0 @ =0x083BE3A0
	ldr r0, _08068ED4 @ =0x00007FFF
	ands r4, r0
	b _08068EDC
	.align 2, 0
_08068ED0: .4byte 0x083BE3A0
_08068ED4: .4byte 0x00007FFF
_08068ED8:
	ldr r0, _08068EEC @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
_08068EDC:
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #0
	cmp r5, #8
	bne _08068EF0
	movs r4, #3
	b _08068F26
	.align 2, 0
_08068EEC: .4byte gTilemapAndClipPointers
_08068EF0:
	cmp r5, #7
	bne _08068EF8
	movs r4, #4
	b _08068F26
_08068EF8:
	cmp r5, #9
	bne _08068F00
	movs r4, #5
	b _08068F26
_08068F00:
	cmp r5, #1
	bne _08068F08
	movs r4, #1
	b _08068F26
_08068F08:
	cmp r5, #2
	bne _08068F10
	movs r4, #2
	b _08068F26
_08068F10:
	cmp r5, #0xa
	bne _08068F18
	movs r4, #6
	b _08068F26
_08068F18:
	cmp r5, #0xb
	bne _08068F20
	movs r4, #7
	b _08068F26
_08068F20:
	cmp r5, #0x60
	bne _08068F26
	movs r4, #8
_08068F26:
	subs r0, r4, #1
	cmp r0, #1
	bhi _08068F4A
	ldr r0, _08068F68 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _08068F42
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl CheckCantUseElevator
	cmp r0, #0
	beq _08068F42
	movs r4, #0
_08068F42:
	ldr r1, _08068F6C @ =gDisableDoorsAndTanks
	movs r0, #0
	strb r0, [r1]
	ldr r7, _08068F70 @ =gCurrentAffectingClipdata
_08068F4A:
	strh r4, [r7]
	movs r4, #0
	cmp r5, #0x40
	beq _08068F92
	ldr r1, _08068F74 @ =gCurrentRoomEntry
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _08068FAE
	ldrb r1, [r1, #0x14]
	cmp r1, #0
	beq _08068FAE
	cmp r1, #5
	bne _08068F78
	movs r4, #5
	b _08068FAE
	.align 2, 0
_08068F68: .4byte gSamusData
_08068F6C: .4byte gDisableDoorsAndTanks
_08068F70: .4byte gCurrentAffectingClipdata
_08068F74: .4byte gCurrentRoomEntry
_08068F78:
	cmp r1, #6
	bne _08068F80
	movs r4, #6
	b _08068FAE
_08068F80:
	cmp r1, #3
	bne _08068F86
	movs r4, #4
_08068F86:
	ldr r0, _08068F98 @ =gEffectYPosition
	ldrh r0, [r0]
	cmp r0, r8
	bhi _08068FAE
	cmp r1, #1
	bne _08068F9C
_08068F92:
	movs r4, #1
	b _08068FAE
	.align 2, 0
_08068F98: .4byte gEffectYPosition
_08068F9C:
	cmp r1, #2
	beq _08068FAC
	cmp r1, #4
	bne _08068FA8
	movs r4, #3
	b _08068FAE
_08068FA8:
	cmp r1, #3
	bne _08068FAE
_08068FAC:
	movs r4, #2
_08068FAE:
	strh r4, [r7, #2]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	ldrh r1, [r7, #2]
	orrs r0, r1
_08068FB8:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CheckCantUseElevator
CheckCantUseElevator: @ 0x08068FC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r0, sp
	movs r1, #0
	movs r2, #0xb
	bl memset
	ldr r1, _08069004 @ =gLastElevatorUsed
	movs r0, #0xff
	strb r0, [r1]
	movs r4, #0
	movs r3, #0
	ldr r6, _08069008 @ =gCurrentArea
	ldrb r0, [r6]
	mov ip, r0
	ldr r2, _0806900C @ =0x083C8BFC
	ldr r5, _08069010 @ =gCurrentRoom
_08068FF0:
	ldrb r7, [r2]
	cmp ip, r7
	bne _08069014
	ldrb r0, [r5]
	ldrb r7, [r2, #1]
	cmp r0, r7
	bne _08069014
	movs r4, #1
	b _0806902A
	.align 2, 0
_08069004: .4byte gLastElevatorUsed
_08069008: .4byte gCurrentArea
_0806900C: .4byte 0x083C8BFC
_08069010: .4byte gCurrentRoom
_08069014:
	ldrb r0, [r6]
	ldrb r7, [r2, #2]
	cmp r0, r7
	bne _08069026
	ldrb r0, [r5]
	ldrb r7, [r2, #3]
	cmp r0, r7
	bne _08069026
	movs r4, #1
_08069026:
	cmp r4, #0
	beq _0806902E
_0806902A:
	strb r3, [r1]
	b _08069036
_0806902E:
	adds r2, #4
	adds r3, #1
	cmp r3, #0xa
	ble _08068FF0
_08069036:
	cmp r4, #0
	beq _080690BE
	movs r4, #4
	ldr r7, _080690CC @ =gLastElevatorUsed
	ldr r6, _080690D0 @ =0x083C8C28
	ldr r0, _080690D4 @ =gEventCounter
	ldrb r5, [r0]
	mov r2, sp
_08069046:
	subs r4, #1
	lsls r0, r4, #4
	adds r3, r0, r6
	ldrb r0, [r3]
	cmp r0, r5
	bhi _080690B0
	ldrb r0, [r3, #1]
	cmp r5, r0
	bhs _080690B0
	ldrb r0, [r2]
	ldrb r1, [r3, #2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	ldrb r1, [r3, #3]
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r2, #2]
	ldrb r1, [r3, #4]
	orrs r0, r1
	strb r0, [r2, #2]
	ldrb r0, [r2, #3]
	ldrb r1, [r3, #5]
	orrs r0, r1
	strb r0, [r2, #3]
	ldrb r0, [r2, #4]
	ldrb r1, [r3, #6]
	orrs r0, r1
	strb r0, [r2, #4]
	ldrb r0, [r2, #5]
	ldrb r1, [r3, #7]
	orrs r0, r1
	strb r0, [r2, #5]
	ldrb r0, [r2, #6]
	ldrb r1, [r3, #8]
	orrs r0, r1
	strb r0, [r2, #6]
	ldrb r0, [r2, #7]
	ldrb r1, [r3, #9]
	orrs r0, r1
	strb r0, [r2, #7]
	ldrb r0, [r2, #8]
	ldrb r1, [r3, #0xa]
	orrs r0, r1
	strb r0, [r2, #8]
	ldrb r0, [r2, #9]
	ldrb r1, [r3, #0xb]
	orrs r0, r1
	strb r0, [r2, #9]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r3, #0xc]
	orrs r0, r1
	strb r0, [r2, #0xa]
_080690B0:
	cmp r4, #0
	bgt _08069046
	ldrb r0, [r7]
	add r0, sp
	ldrb r4, [r0]
	cmp r4, #0
	bne _080690EC
_080690BE:
	mov r7, r8
	cmp r7, #1
	bne _080690DC
	movs r3, #0x41
	ldr r1, _080690D8 @ =gElevatorDirection
	movs r0, #2
	b _080690E2
	.align 2, 0
_080690CC: .4byte gLastElevatorUsed
_080690D0: .4byte 0x083C8C28
_080690D4: .4byte gEventCounter
_080690D8: .4byte gElevatorDirection
_080690DC:
	movs r3, #0x40
	ldr r1, _080690FC @ =gElevatorDirection
	movs r0, #1
_080690E2:
	strb r0, [r1]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	bl CheckUpdateSubEventAndMusic
_080690EC:
	adds r0, r4, #0
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080690FC: .4byte gElevatorDirection

	thumb_func_start GetGroundEffectAtPosition
GetGroundEffectAtPosition: @ 0x08069100
	push {r4, r5, lr}
	lsls r5, r0, #0x10
	lsrs r2, r5, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r4, _08069120 @ =gBackgroundsData
	ldrh r0, [r4, #0x1e]
	lsls r0, r0, #6
	cmp r2, r0
	bge _0806911C
	ldrh r2, [r4, #0x1c]
	lsls r0, r2, #6
	cmp r3, r0
	blt _08069124
_0806911C:
	movs r0, #0
	b _0806917C
	.align 2, 0
_08069120: .4byte gBackgroundsData
_08069124:
	lsrs r0, r5, #0x16
	lsrs r1, r1, #0x16
	muls r0, r2, r0
	adds r2, r0, r1
	ldr r1, [r4, #0x18]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _08069178
	ldr r0, _08069154 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0806917A
	cmp r2, #0x50
	bne _08069158
	movs r2, #1
	b _0806917A
	.align 2, 0
_08069154: .4byte gTilemapAndClipPointers
_08069158:
	cmp r2, #0x51
	bne _08069160
	movs r2, #2
	b _0806917A
_08069160:
	cmp r2, #0x54
	bne _08069168
	movs r2, #3
	b _0806917A
_08069168:
	cmp r2, #0x52
	bne _08069170
	movs r2, #4
	b _0806917A
_08069170:
	cmp r2, #0x53
	bne _08069178
	movs r2, #5
	b _0806917A
_08069178:
	movs r2, #0
_0806917A:
	adds r0, r2, #0
_0806917C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckEnterDoor
CheckEnterDoor: @ 0x08069184
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	movs r6, #0
	ldr r1, _08069224 @ =gSubGameMode1
	movs r4, #0
	ldrsh r2, [r1, r4]
	mov ip, r1
	cmp r2, #2
	beq _080691A6
	b _0806936E
_080691A6:
	ldr r1, _08069228 @ =0x0879B894
	ldr r0, _0806922C @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	movs r5, #0
	ldrb r2, [r4]
	cmp r2, #0
	bne _080691BC
	b _0806936C
_080691BC:
	ldr r0, _08069230 @ =gLastDoorUsed
	mov r8, r0
	ldr r1, _08069234 @ =gSamusDoorPositionOffset
	mov sb, r1
_080691C4:
	ldr r1, _08069238 @ =gCurrentRoom
	ldrb r0, [r4, #1]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080691D0
	b _08069360
_080691D0:
	movs r0, #0xf
	ands r0, r2
	cmp r0, #1
	bhi _080691DA
	b _08069360
_080691DA:
	ldrb r0, [r4, #2]
	cmp r0, r3
	bls _080691E2
	b _08069360
_080691E2:
	ldrb r0, [r4, #3]
	cmp r3, r0
	bls _080691EA
	b _08069360
_080691EA:
	ldrb r0, [r4, #4]
	cmp r0, r7
	bls _080691F2
	b _08069360
_080691F2:
	ldrb r1, [r4, #5]
	cmp r7, r1
	bls _080691FA
	b _08069360
_080691FA:
	ldr r1, _0806923C @ =gDoorPositionStart
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08069250
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl FindEventBasedDoor
	adds r5, r0, #0
	cmp r5, #0xff
	beq _08069240
	mov r0, r8
	strb r5, [r0]
	ldr r1, _08069224 @ =gSubGameMode1
	mov ip, r1
	b _08069256
	.align 2, 0
_08069224: .4byte gSubGameMode1
_08069228: .4byte 0x0879B894
_0806922C: .4byte gCurrentArea
_08069230: .4byte gLastDoorUsed
_08069234: .4byte gSamusDoorPositionOffset
_08069238: .4byte gCurrentRoom
_0806923C: .4byte gDoorPositionStart
_08069240:
	ldrb r0, [r4, #6]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0806924C @ =gSubGameMode1
	mov ip, r0
	b _08069256
	.align 2, 0
_0806924C: .4byte gSubGameMode1
_08069250:
	ldrb r0, [r4, #6]
	mov r1, r8
	strb r0, [r1]
_08069256:
	movs r0, #3
	mov r1, ip
	strh r0, [r1]
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #2
	bls _0806929C
	ldrb r1, [r4, #2]
	ldr r0, _08069290 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #6
	adds r0, #8
	ldr r2, _08069294 @ =gDoorPositionStart
	cmp r1, r0
	ble _0806927A
	movs r0, #1
	strh r0, [r2]
_0806927A:
	ldrb r0, [r4, #4]
	strh r0, [r2, #2]
	ldrb r0, [r4, #5]
	adds r0, #1
	lsls r0, r0, #6
	ldr r1, _08069298 @ =gSamusData
	ldrh r1, [r1, #0x18]
	subs r0, r0, r1
	subs r0, #1
	b _0806929E
	.align 2, 0
_08069290: .4byte gBg1XPosition
_08069294: .4byte gDoorPositionStart
_08069298: .4byte gSamusData
_0806929C:
	movs r0, #0
_0806929E:
	mov r1, sb
	strh r0, [r1]
	ldrb r0, [r4]
	bl ProcessDoorType
	ldr r2, _0806932C @ =gHatchData
	movs r5, #5
_080692AC:
	ldrb r0, [r2, #1]
	movs r1, #7
	ands r1, r0
	strb r1, [r2, #1]
	ldrb r3, [r2]
	lsls r0, r3, #0x1f
	cmp r0, #0
	beq _080692E8
	lsls r0, r3, #0x1b
	movs r6, #1
	cmp r0, #0
	bge _080692C6
	subs r6, #2
_080692C6:
	ldrb r0, [r2, #2]
	adds r6, r6, r0
	ldrb r0, [r4, #2]
	cmp r6, r0
	bne _080692E8
	ldrb r0, [r4, #4]
	ldrb r1, [r2, #3]
	cmp r0, r1
	blo _080692E8
	adds r1, r0, #0
	ldrb r0, [r2, #3]
	adds r0, #3
	cmp r1, r0
	bgt _080692E8
	movs r0, #0xe
	orrs r0, r3
	strb r0, [r2]
_080692E8:
	adds r2, #4
	subs r5, #1
	cmp r5, #0
	bge _080692AC
	movs r6, #1
	ldr r1, _08069330 @ =0x0879B894
	ldr r0, _08069334 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	ldrb r0, [r4, #1]
	bl EventCheckPlayCutsceneDuringTransition
	adds r5, r0, #0
	cmp r5, #0
	beq _08069348
	ldr r1, _08069338 @ =gColorFading
	movs r0, #2
	strb r0, [r1]
	cmp r5, #2
	bne _08069340
	ldr r1, _0806933C @ =gSubGameMode1
	movs r0, #4
	strh r0, [r1]
	movs r6, #0
	b _08069348
	.align 2, 0
_0806932C: .4byte gHatchData
_08069330: .4byte 0x0879B894
_08069334: .4byte gCurrentArea
_08069338: .4byte gColorFading
_0806933C: .4byte gSubGameMode1
_08069340:
	cmp r5, #3
	bne _08069348
	movs r0, #0xa
	strb r0, [r1]
_08069348:
	ldrb r0, [r4, #1]
	bl SetCurrentNavigationRoom
	ldr r0, _0806935C @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r4, #1]
	bl PlayRoomMusicTrack
	b _0806936C
	.align 2, 0
_0806935C: .4byte gCurrentArea
_08069360:
	adds r4, #0xc
	adds r5, #1
	ldrb r2, [r4]
	cmp r2, #0
	beq _0806936C
	b _080691C4
_0806936C:
	adds r0, r6, #0
_0806936E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckEnterAreaConnection
CheckEnterAreaConnection: @ 0x0806937C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r0, _080693EC @ =gSubGameMode1
	movs r4, #0
	ldrsh r1, [r0, r4]
	mov sb, r0
	cmp r1, #2
	bne _08069452
	ldr r1, _080693F0 @ =0x0879B894
	ldr r0, _080693F4 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	movs r7, #0
	movs r5, #0
	ldrb r1, [r4]
	cmp r1, #0
	beq _080693E4
	ldr r0, _080693F8 @ =gCurrentRoom
	ldrb r6, [r0]
_080693B4:
	ldrb r0, [r4, #1]
	cmp r0, r6
	bne _080693DA
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _080693DA
	ldrb r0, [r4, #2]
	cmp r0, r2
	bhi _080693DA
	ldrb r0, [r4, #3]
	cmp r2, r0
	bhi _080693DA
	ldrb r0, [r4, #4]
	cmp r0, r3
	bhi _080693DA
	ldrb r1, [r4, #5]
	cmp r3, r1
	bls _0806940A
_080693DA:
	adds r4, #0xc
	adds r5, #1
	ldrb r1, [r4]
	cmp r1, #0
	bne _080693B4
_080693E4:
	cmp r7, #0
	bne _08069414
	b _08069452
	.align 2, 0
_080693EC: .4byte gSubGameMode1
_080693F0: .4byte 0x0879B894
_080693F4: .4byte gCurrentArea
_080693F8: .4byte gCurrentRoom
_080693FC:
	adds r0, r3, #2
	adds r0, r1, r0
	ldrb r0, [r0]
	mov r4, sl
	strb r0, [r4]
	movs r7, #2
	b _08069448
_0806940A:
	mov r8, r5
	ldr r1, _08069458 @ =gLastDoorUsed
	ldrb r0, [r4, #6]
	strb r0, [r1]
	movs r7, #1
_08069414:
	ldr r1, _0806945C @ =0x083C8B90
	ldrb r0, [r1]
	mov ip, r1
	cmp r0, #0xff
	beq _08069448
	adds r3, r1, #0
	ldr r6, _08069460 @ =gCurrentArea
	mov sl, r6
	ldrb r4, [r6]
	movs r1, #0
	adds r2, r3, #0
	adds r5, r3, #1
_0806942C:
	ldrb r0, [r2]
	cmp r0, r4
	bne _0806943A
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r8
	beq _080693FC
_0806943A:
	adds r1, #3
	adds r2, #3
	mov r6, ip
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0806942C
_08069448:
	cmp r7, #2
	beq _08069464
	ldr r1, _08069458 @ =gLastDoorUsed
	movs r0, #0
	strb r0, [r1]
_08069452:
	movs r0, #0
	b _080694AA
	.align 2, 0
_08069458: .4byte gLastDoorUsed
_0806945C: .4byte 0x083C8B90
_08069460: .4byte gCurrentArea
_08069464:
	movs r0, #3
	mov r1, sb
	strh r0, [r1]
	movs r0, #6
	bl StartColorFading
	bl unk_6cf0c
	ldr r1, _080694B8 @ =0x0879B894
	ldr r5, _080694BC @ =gCurrentArea
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _080694C0 @ =gLastDoorUsed
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	ldrb r0, [r4, #1]
	bl EventCheckPlayCutsceneDuringTransition
	cmp r0, #0
	beq _0806949A
	ldr r0, _080694C4 @ =gColorFading
	strb r7, [r0]
_0806949A:
	ldrb r0, [r4, #1]
	bl SetCurrentNavigationRoom
	ldrb r0, [r5]
	ldrb r1, [r4, #1]
	bl PlayRoomMusicTrack
	movs r0, #1
_080694AA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080694B8: .4byte 0x0879B894
_080694BC: .4byte gCurrentArea
_080694C0: .4byte gLastDoorUsed
_080694C4: .4byte gColorFading

	thumb_func_start ProcessDoorType
ProcessDoorType: @ 0x080694C8
	push {r4, lr}
	lsls r0, r0, #0x18
	movs r1, #0xf0
	lsls r1, r1, #0x14
	ands r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #2
	bne _080694DC
	movs r4, #6
	b _080694EE
_080694DC:
	ldr r0, _08069500 @ =gSkipDoorTransition
	ldrb r0, [r0]
	movs r4, #6
	cmp r0, #0
	bne _080694E8
	movs r4, #4
_080694E8:
	ldr r1, _08069504 @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #4
	strb r0, [r1]
_080694EE:
	bl unk_6cf0c
	adds r0, r4, #0
	bl StartColorFading
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069500: .4byte gSkipDoorTransition
_08069504: .4byte gWhichBgPositionIsWrittenToBg3Ofs

	thumb_func_start FindEventBasedDoor
FindEventBasedDoor: @ 0x08069508
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r3, #0x3b
	ldr r5, _0806954C @ =0x083C8C68
	ldr r0, _08069550 @ =gCurrentArea
	adds r4, r5, #0
	ldrb r6, [r0]
	adds r2, r4, #0
	adds r2, #0xec
	ldr r0, _08069554 @ =gEventCounter
	mov ip, r0
_08069526:
	lsls r1, r3, #2
	ldrb r7, [r2]
	cmp r6, r7
	bne _08069558
	adds r0, r5, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r8, r0
	bne _08069558
	adds r0, r4, #2
	adds r0, r1, r0
	mov r7, ip
	ldrb r1, [r7]
	ldrb r0, [r0]
	cmp r1, r0
	blo _08069558
	ldrb r0, [r2, #3]
	b _08069562
	.align 2, 0
_0806954C: .4byte 0x083C8C68
_08069550: .4byte gCurrentArea
_08069554: .4byte gEventCounter
_08069558:
	subs r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08069526
	movs r0, #0xff
_08069562:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start unk_6956c
unk_6956c: @ 0x0806956C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080695AC @ =0x02035D20
	mov ip, r0
	movs r4, #0x40
	ldr r5, _080695B0 @ =gBackgroundsData
	movs r7, #0xff
_0806957C:
	subs r4, #1
	lsls r0, r4, #1
	add r0, ip
	ldrh r2, [r0]
	lsls r3, r2, #0x10
	cmp r3, #0
	beq _0806959E
	ldrh r1, [r5, #0x1c]
	adds r0, r7, #0
	ands r0, r2
	muls r0, r1, r0
	lsrs r1, r3, #0x18
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r6, [r0]
_0806959E:
	subs r4, #1
	cmp r4, #0
	bgt _0806957C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080695AC: .4byte 0x02035D20
_080695B0: .4byte gBackgroundsData

	thumb_func_start TransferAnimatedGraphics
TransferAnimatedGraphics: @ 0x080695B4
	push {r4, r5, lr}
	ldr r5, _08069788 @ =0x03000028
	ldrh r1, [r5]
	cmp r1, #0
	bne _080695C0
	b _08069780
_080695C0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080695D8
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _08069790 @ =0x0201B000
	str r0, [r1]
	ldr r0, _08069794 @ =0x06004000
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080695D8:
	ldrh r1, [r5]
	movs r0, #2
	ands r0, r1
	adds r4, r1, #0
	cmp r0, #0
	beq _080695F4
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _0806979C @ =0x0201B080
	str r0, [r1]
	ldr r0, _080697A0 @ =0x06004080
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080695F4:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0806960C
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697A4 @ =0x0201B100
	str r0, [r1]
	ldr r0, _080697A8 @ =0x06004100
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0806960C:
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08069624
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697AC @ =0x0201B180
	str r0, [r1]
	ldr r0, _080697B0 @ =0x06004180
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08069624:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0806963C
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697B4 @ =0x0201B200
	str r0, [r1]
	ldr r0, _080697B8 @ =0x06004200
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0806963C:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _08069654
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697BC @ =0x0201B280
	str r0, [r1]
	ldr r0, _080697C0 @ =0x06004280
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08069654:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0806966C
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697C4 @ =0x0201B300
	str r0, [r1]
	ldr r0, _080697C8 @ =0x06004300
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0806966C:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _08069684
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697CC @ =0x0201B380
	str r0, [r1]
	ldr r0, _080697D0 @ =0x06004380
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08069684:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0806969E
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697D4 @ =0x0201B400
	str r0, [r1]
	ldr r0, _080697D8 @ =0x06004400
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0806969E:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080696B8
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697DC @ =0x0201B480
	str r0, [r1]
	ldr r0, _080697E0 @ =0x06004480
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080696B8:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _080696D2
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697E4 @ =0x0201B500
	str r0, [r1]
	ldr r0, _080697E8 @ =0x06004500
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080696D2:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _080696EC
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697EC @ =0x0201B580
	str r0, [r1]
	ldr r0, _080697F0 @ =0x06004580
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080696EC:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r4
	cmp r0, #0
	beq _08069710
	ldr r0, _0806978C @ =0x040000D4
	ldr r3, _080697F4 @ =0x0201B600
	str r3, [r0]
	ldr r1, _080697F8 @ =0x06004600
	str r1, [r0, #4]
	ldr r2, _08069798 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _080697FC @ =0x0600FDE0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08069710:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r4
	cmp r0, #0
	beq _08069734
	ldr r0, _0806978C @ =0x040000D4
	ldr r3, _08069800 @ =0x0201B680
	str r3, [r0]
	ldr r1, _08069804 @ =0x06004680
	str r1, [r0, #4]
	ldr r2, _08069798 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _08069808 @ =0x0600FE60
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08069734:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r4
	cmp r0, #0
	beq _08069758
	ldr r0, _0806978C @ =0x040000D4
	ldr r3, _0806980C @ =0x0201B700
	str r3, [r0]
	ldr r1, _08069810 @ =0x06004700
	str r1, [r0, #4]
	ldr r2, _08069798 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _08069814 @ =0x0600FEE0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08069758:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0806977C
	ldr r0, _0806978C @ =0x040000D4
	ldr r3, _08069818 @ =0x0201B780
	str r3, [r0]
	ldr r1, _0806981C @ =0x06004780
	str r1, [r0, #4]
	ldr r2, _08069798 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _08069820 @ =0x0600FF60
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_0806977C:
	movs r0, #0
	strh r0, [r5]
_08069780:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069788: .4byte 0x03000028
_0806978C: .4byte 0x040000D4
_08069790: .4byte 0x0201B000
_08069794: .4byte 0x06004000
_08069798: .4byte 0x80000040
_0806979C: .4byte 0x0201B080
_080697A0: .4byte 0x06004080
_080697A4: .4byte 0x0201B100
_080697A8: .4byte 0x06004100
_080697AC: .4byte 0x0201B180
_080697B0: .4byte 0x06004180
_080697B4: .4byte 0x0201B200
_080697B8: .4byte 0x06004200
_080697BC: .4byte 0x0201B280
_080697C0: .4byte 0x06004280
_080697C4: .4byte 0x0201B300
_080697C8: .4byte 0x06004300
_080697CC: .4byte 0x0201B380
_080697D0: .4byte 0x06004380
_080697D4: .4byte 0x0201B400
_080697D8: .4byte 0x06004400
_080697DC: .4byte 0x0201B480
_080697E0: .4byte 0x06004480
_080697E4: .4byte 0x0201B500
_080697E8: .4byte 0x06004500
_080697EC: .4byte 0x0201B580
_080697F0: .4byte 0x06004580
_080697F4: .4byte 0x0201B600
_080697F8: .4byte 0x06004600
_080697FC: .4byte 0x0600FDE0
_08069800: .4byte 0x0201B680
_08069804: .4byte 0x06004680
_08069808: .4byte 0x0600FE60
_0806980C: .4byte 0x0201B700
_08069810: .4byte 0x06004700
_08069814: .4byte 0x0600FEE0
_08069818: .4byte 0x0201B780
_0806981C: .4byte 0x06004780
_08069820: .4byte 0x0600FF60

	thumb_func_start UpdateAnimatedGraphics
UpdateAnimatedGraphics: @ 0x08069824
	push {r4, r5, r6, lr}
	ldr r3, _08069840 @ =0x0300531C
	movs r5, #0
_0806982A:
	movs r4, #0
	ldrb r0, [r3]
	cmp r0, #6
	bls _08069834
	b _0806992E
_08069834:
	lsls r0, r0, #2
	ldr r1, _08069844 @ =_08069848
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069840: .4byte 0x0300531C
_08069844: .4byte _08069848
_08069848: @ jump table
	.4byte _0806992E @ case 0
	.4byte _08069864 @ case 1
	.4byte _0806992E @ case 2
	.4byte _0806988E @ case 3
	.4byte _080698B6 @ case 4
	.4byte _080698E2 @ case 5
	.4byte _08069906 @ case 6
_08069864:
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0806992E
	movs r4, #1
	strb r1, [r3, #2]
	ldrb r0, [r3, #4]
	adds r0, #1
	strb r0, [r3, #4]
	movs r0, #4
	ldrsb r0, [r3, r0]
	ldrb r6, [r3, #3]
	cmp r0, r6
	bne _0806992E
	strb r1, [r3, #4]
	b _0806992E
_0806988E:
	movs r1, #4
	ldrsb r1, [r3, r1]
	ldrb r0, [r3, #3]
	subs r0, #1
	cmp r1, r0
	beq _0806992E
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0806992E
	movs r4, #1
	strb r1, [r3, #2]
	ldrb r0, [r3, #4]
	adds r0, #1
	b _0806992C
_080698B6:
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r6, [r3, #1]
	cmp r0, r6
	bne _0806992E
	movs r4, #1
	strb r1, [r3, #2]
	ldrb r0, [r3, #4]
	adds r0, #1
	strb r0, [r3, #4]
	movs r1, #4
	ldrsb r1, [r3, r1]
	ldrb r0, [r3, #3]
	cmp r1, r0
	bne _0806992E
	movs r0, #2
	subs r0, r0, r1
	b _0806992C
_080698E2:
	ldrb r1, [r3, #4]
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _0806992E
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r2, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r6, [r3, #1]
	cmp r0, r6
	bne _0806992E
	movs r4, #1
	strb r2, [r3, #2]
	subs r0, r1, #1
	b _0806992C
_08069906:
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0806992E
	movs r4, #1
	strb r1, [r3, #2]
	ldrb r0, [r3, #4]
	subs r0, #1
	strb r0, [r3, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0806992E
	ldrb r0, [r3, #3]
	subs r0, #1
_0806992C:
	strb r0, [r3, #4]
_0806992E:
	cmp r4, #0
	beq _0806996A
	ldrb r1, [r3, #4]
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bge _08069944
	mvns r0, r0
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08069944:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x11
	ldr r1, [r3, #8]
	adds r1, r1, r0
	ldr r2, _0806997C @ =0x040000D4
	str r1, [r2]
	lsls r0, r5, #7
	ldr r6, _08069980 @ =0x0201B000
	adds r0, r0, r6
	str r0, [r2, #4]
	ldr r0, _08069984 @ =0x80000040
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r2, _08069988 @ =0x03000028
	movs r0, #1
	lsls r0, r5
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0806996A:
	adds r5, #1
	adds r3, #0xc
	cmp r5, #0xf
	bgt _08069974
	b _0806982A
_08069974:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806997C: .4byte 0x040000D4
_08069980: .4byte 0x0201B000
_08069984: .4byte 0x80000040
_08069988: .4byte 0x03000028

	thumb_func_start LoadAnimatedGraphics
LoadAnimatedGraphics: @ 0x0806998C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080699D8 @ =0x03000028
	movs r0, #0
	strh r0, [r1]
	ldr r3, _080699DC @ =0x0300531C
	movs r6, #0
	movs r4, #0
	ldr r7, _080699E0 @ =0x083C8F90
	ldr r0, _080699E4 @ =0x083C8D58
	mov sl, r0
	ldr r2, _080699E8 @ =0x03000058
	mov sb, r2
	mov r8, r7
	mov ip, r4
	ldr r5, _080699EC @ =0x040000D4
_080699B2:
	ldr r0, _080699F0 @ =0x03004FC8
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r2, r0, #4
	adds r0, r2, #1
	adds r0, r4, r0
	add r0, r8
	ldrb r0, [r0]
	add r0, sb
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080699F4
	adds r0, r2, #2
	adds r0, r4, r0
	b _080699F6
	.align 2, 0
_080699D8: .4byte 0x03000028
_080699DC: .4byte 0x0300531C
_080699E0: .4byte 0x083C8F90
_080699E4: .4byte 0x083C8D58
_080699E8: .4byte 0x03000058
_080699EC: .4byte 0x040000D4
_080699F0: .4byte 0x03004FC8
_080699F4:
	adds r0, r4, r2
_080699F6:
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r1, r0, #3
	add r1, sl
	ldrb r0, [r1]
	strb r0, [r3]
	ldrb r0, [r1, #1]
	strb r0, [r3, #1]
	ldrb r2, [r1, #2]
	strb r2, [r3, #3]
	mov r0, ip
	strb r0, [r3, #2]
	strb r0, [r3, #4]
	ldr r0, [r1, #4]
	str r0, [r3, #8]
	ldrb r0, [r3]
	cmp r0, #3
	beq _08069A1E
	cmp r0, #6
	bne _08069A22
_08069A1E:
	subs r0, r2, #1
	strb r0, [r3, #4]
_08069A22:
	movs r0, #4
	ldrsb r0, [r3, r0]
	lsls r0, r0, #7
	ldr r1, [r3, #8]
	adds r1, r1, r0
	lsls r0, r6, #7
	ldr r2, _08069A64 @ =0x06004000
	adds r0, r0, r2
	str r1, [r5]
	str r0, [r5, #4]
	ldr r0, _08069A68 @ =0x80000040
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	adds r6, #1
	adds r3, #0xc
	adds r4, #3
	cmp r6, #0xf
	ble _080699B2
	ldr r1, _08069A6C @ =0x040000D4
	ldr r0, _08069A70 @ =0x06004600
	str r0, [r1]
	ldr r0, _08069A74 @ =0x0600FDE0
	str r0, [r1, #4]
	ldr r0, _08069A78 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069A64: .4byte 0x06004000
_08069A68: .4byte 0x80000040
_08069A6C: .4byte 0x040000D4
_08069A70: .4byte 0x06004600
_08069A74: .4byte 0x0600FDE0
_08069A78: .4byte 0x80000100

	thumb_func_start ResetTankAnimations
ResetTankAnimations: @ 0x08069A7C
	ldr r1, _08069A94 @ =0x030053DC
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	strb r2, [r1, #1]
	movs r0, #2
	strb r0, [r1, #4]
	strb r2, [r1, #5]
	movs r0, #3
	strb r0, [r1, #8]
	strb r2, [r1, #9]
	bx lr
	.align 2, 0
_08069A94: .4byte 0x030053DC

	thumb_func_start UpdateTankAnimations
UpdateTankAnimations: @ 0x08069A98
	push {r4, r5, lr}
	movs r3, #2
	ldr r0, _08069AF0 @ =0x030053DC
	movs r5, #0
	ldr r4, _08069AF4 @ =0x040000D4
	adds r2, r0, #0
	adds r2, #8
_08069AA6:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08069AE2
	strb r5, [r2]
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08069AC6
	strb r5, [r2, #1]
_08069AC6:
	lsls r1, r3, #9
	ldrb r0, [r2, #1]
	lsls r0, r0, #7
	adds r1, r1, r0
	ldr r0, _08069AF8 @ =0x085609A8
	adds r1, r1, r0
	str r1, [r4]
	lsls r0, r3, #7
	ldr r1, _08069AFC @ =0x06004A00
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, _08069B00 @ =0x80000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
_08069AE2:
	subs r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08069AA6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069AF0: .4byte 0x030053DC
_08069AF4: .4byte 0x040000D4
_08069AF8: .4byte 0x085609A8
_08069AFC: .4byte 0x06004A00
_08069B00: .4byte 0x80000040

	thumb_func_start ProcessScrolls
ProcessScrolls: @ 0x08069B04
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl UpdateCurrentScrolls
	ldr r0, _08069B60 @ =0x03000124
	ldrh r6, [r0]
	ldrh r5, [r0, #4]
	ldr r4, _08069B64 @ =0x030000F8
	ldrb r0, [r4]
	cmp r0, #0
	beq _08069B2E
	adds r0, r4, #0
	adds r1, r7, #0
	bl ProcessScrollX
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ProcessScrollY
	adds r5, r0, #0
_08069B2E:
	adds r4, #0xc
	ldrb r0, [r4]
	cmp r0, #0
	beq _08069B4E
	adds r0, r4, #0
	adds r1, r7, #0
	bl ProcessScrollX
	adds r0, r6, r0
	asrs r6, r0, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl ProcessScrollY
	adds r0, r5, r0
	asrs r5, r0, #1
_08069B4E:
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	bl ScrollScreen
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069B60: .4byte 0x03000124
_08069B64: .4byte 0x030000F8

	thumb_func_start ScrollScreen
ScrollScreen: @ 0x08069B68
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r1, _08069BB4 @ =0x03000124
	strh r5, [r1]
	strh r3, [r1, #4]
	ldr r0, _08069BB8 @ =gSubGameMode1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r6, r1, #0
	cmp r0, #0
	beq _08069C54
	ldr r0, _08069BBC @ =gBg1YPosition
	adds r4, r0, #0
	ldrh r0, [r4]
	cmp r3, r0
	beq _08069BEC
	ldr r0, _08069BC0 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _08069BC4 @ =gPreviousYPosition
	ldrh r0, [r0]
	subs r2, r1, r0
	ldrh r0, [r4]
	subs r1, r3, r0
	cmp r1, #0
	ble _08069BC8
	cmp r1, #0x30
	ble _08069BA6
	movs r1, #0x30
_08069BA6:
	cmp r2, #0
	blt _08069BE0
	adds r2, #4
	cmp r1, r2
	bge _08069BE2
	adds r2, r1, #0
	b _08069BE2
	.align 2, 0
_08069BB4: .4byte 0x03000124
_08069BB8: .4byte gSubGameMode1
_08069BBC: .4byte gBg1YPosition
_08069BC0: .4byte gSamusData
_08069BC4: .4byte gPreviousYPosition
_08069BC8:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08069BD2
	adds r1, r0, #0
_08069BD2:
	cmp r2, #0
	bgt _08069BE0
	subs r2, #4
	cmp r1, r2
	ble _08069BE2
	adds r2, r1, #0
	b _08069BE2
_08069BE0:
	movs r2, #0
_08069BE2:
	strb r2, [r6, #7]
	ldrh r0, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	b _08069BF0
_08069BEC:
	movs r0, #0
	strb r0, [r6, #7]
_08069BF0:
	ldr r0, _08069C20 @ =gBg1XPosition
	adds r3, r0, #0
	ldrh r2, [r3]
	cmp r5, r2
	beq _08069C50
	ldr r0, _08069C24 @ =gSamusData
	ldrh r1, [r0, #0x16]
	ldr r0, _08069C28 @ =gPreviousXPosition
	ldrh r0, [r0]
	subs r2, r1, r0
	ldrh r0, [r3]
	subs r1, r5, r0
	cmp r1, #0
	ble _08069C2C
	cmp r1, #0x30
	ble _08069C12
	movs r1, #0x30
_08069C12:
	cmp r2, #0
	blt _08069C44
	adds r2, #4
	cmp r1, r2
	bge _08069C46
	adds r2, r1, #0
	b _08069C46
	.align 2, 0
_08069C20: .4byte gBg1XPosition
_08069C24: .4byte gSamusData
_08069C28: .4byte gPreviousXPosition
_08069C2C:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08069C36
	adds r1, r0, #0
_08069C36:
	cmp r2, #0
	bgt _08069C44
	subs r2, #4
	cmp r1, r2
	ble _08069C46
	adds r2, r1, #0
	b _08069C46
_08069C44:
	movs r2, #0
_08069C46:
	strb r2, [r6, #6]
	ldrh r0, [r3]
	adds r0, r0, r2
	strh r0, [r3]
	b _08069C54
_08069C50:
	movs r0, #0
	strb r0, [r6, #6]
_08069C54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProcessScrollX
ProcessScrollX: @ 0x08069C5C
	push {r4, lr}
	adds r3, r0, #0
	ldrh r1, [r1]
	ldrh r2, [r3, #4]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r0, r2, r4
	cmp r1, r0
	bge _08069C72
	adds r0, r2, #0
	b _08069C90
_08069C72:
	ldrh r2, [r3, #2]
	ldr r3, _08069C84 @ =0xFFFFFE20
	adds r0, r2, r3
	cmp r1, r0
	ble _08069C8C
	ldr r4, _08069C88 @ =0xFFFFFC40
	adds r0, r2, r4
	b _08069C90
	.align 2, 0
_08069C84: .4byte 0xFFFFFE20
_08069C88: .4byte 0xFFFFFC40
_08069C8C:
	ldr r2, _08069C98 @ =0xFFFFFE20
	adds r0, r1, r2
_08069C90:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08069C98: .4byte 0xFFFFFE20

	thumb_func_start ProcessScrollY
ProcessScrollY: @ 0x08069C9C
	push {r4, lr}
	adds r2, r0, #0
	ldrb r0, [r2]
	cmp r0, #2
	bne _08069CE0
	ldrh r1, [r1, #2]
	ldrh r3, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r3, r4
	cmp r1, r0
	blt _08069CC6
	ldrh r2, [r2, #8]
	ldr r4, _08069CCC @ =0xFFFFFF00
	adds r0, r2, r4
	cmp r1, r0
	ble _08069CD4
	ldr r1, _08069CD0 @ =0xFFFFFD80
	adds r0, r2, r1
	cmp r0, r3
	bge _08069CE6
_08069CC6:
	adds r0, r3, #0
	b _08069CE6
	.align 2, 0
_08069CCC: .4byte 0xFFFFFF00
_08069CD0: .4byte 0xFFFFFD80
_08069CD4:
	ldr r2, _08069CDC @ =0xFFFFFE80
	adds r0, r1, r2
	b _08069CE6
	.align 2, 0
_08069CDC: .4byte 0xFFFFFE80
_08069CE0:
	ldrh r0, [r2, #8]
	ldr r4, _08069CEC @ =0xFFFFFD80
	adds r0, r0, r4
_08069CE6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08069CEC: .4byte 0xFFFFFD80

	thumb_func_start LoadScrolls
LoadScrolls: @ 0x08069CF0
	push {r4, r5, lr}
	ldr r1, _08069D14 @ =0x0879BB08
	ldr r0, _08069D18 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _08069D1C @ =gCurrentRoom
	ldrb r1, [r3]
	adds r5, r0, #0
	ldr r4, _08069D20 @ =0x030053E8
	ldrb r0, [r5]
	cmp r1, r0
	bne _08069D28
	str r3, [r4]
	b _08069D3E
	.align 2, 0
_08069D14: .4byte 0x0879BB08
_08069D18: .4byte gCurrentArea
_08069D1C: .4byte gCurrentRoom
_08069D20: .4byte 0x030053E8
_08069D24:
	str r1, [r4]
	b _08069D44
_08069D28:
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08069D24
	adds r2, #4
	ldr r1, [r2]
	ldrb r0, [r1]
	ldrb r3, [r5]
	cmp r0, r3
	bne _08069D28
	str r1, [r4]
_08069D3E:
	ldr r1, _08069D4C @ =gCurrentRoomEntry
	movs r0, #3
	strb r0, [r1, #5]
_08069D44:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069D4C: .4byte gCurrentRoomEntry

	thumb_func_start UpdateCurrentScrolls
UpdateCurrentScrolls: @ 0x08069D50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r2, _08069DD0 @ =0x030000F8
	movs r0, #0
	strb r0, [r2]
	strb r0, [r2, #0xc]
	ldr r1, _08069DD4 @ =gSamusData
	ldrh r0, [r1, #0x16]
	lsrs r0, r0, #6
	mov sb, r0
	ldrh r0, [r1, #0x18]
	lsrs r0, r0, #6
	mov r8, r0
	ldr r0, _08069DD8 @ =0x030053E8
	ldr r0, [r0]
	adds r0, #1
	ldrb r6, [r0]
	adds r4, r0, #1
	mov ip, r2
	cmp r6, #0
	bne _08069D84
	b _08069E9E
_08069D84:
	ldr r7, _08069DDC @ =gBackgroundsData
	mov sl, ip
	mov r5, ip
_08069D8A:
	mov r0, sl
	adds r0, #0x18
	cmp r5, r0
	bne _08069D94
	b _08069EB6
_08069D94:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldrb r0, [r4, #4]
	cmp r0, #0xff
	beq _08069DE0
	ldrb r0, [r4, #7]
	cmp r0, #0xff
	beq _08069DE0
	ldrb r1, [r4, #5]
	ldrh r0, [r7, #0x1c]
	muls r0, r1, r0
	ldrb r1, [r4, #4]
	adds r3, r0, r1
	ldr r1, [r7, #0x18]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _08069E06
	ldrb r0, [r4, #6]
	cmp r0, #0xff
	beq _08069E06
	b _08069DFC
	.align 2, 0
_08069DD0: .4byte 0x030000F8
_08069DD4: .4byte gSamusData
_08069DD8: .4byte 0x030053E8
_08069DDC: .4byte gBackgroundsData
_08069DE0:
	ldr r1, _08069EC8 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x17
	bne _08069E06
	ldrb r0, [r4, #7]
	cmp r0, #0xff
	beq _08069E06
	ldrb r0, [r4, #6]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08069E06
	ldrb r0, [r4, #6]
_08069DFC:
	lsls r0, r0, #2
	mov r2, sp
	adds r1, r2, r0
	movs r0, #7
	str r0, [r1]
_08069E06:
	ldr r0, [sp]
	adds r0, r4, r0
	ldrb r1, [r0]
	cmp r1, sb
	bhi _08069E94
	ldr r0, [sp, #4]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp sb, r0
	bhi _08069E94
	ldr r0, [sp, #8]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, r8
	bhi _08069E94
	ldr r0, [sp, #0xc]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r8, r0
	bhi _08069E94
	ldrb r0, [r5]
	cmp r0, #0
	bne _08069E94
	lsls r1, r1, #6
	ldr r2, _08069ECC @ =0x03004E10
	ldrh r0, [r2, #2]
	adds r3, r2, #0
	cmp r0, r1
	bge _08069E42
	adds r0, r1, #0
_08069E42:
	strh r0, [r5, #4]
	ldrh r0, [r7, #0x1c]
	lsls r0, r0, #6
	ldrh r1, [r3]
	subs r3, r0, r1
	ldr r0, [sp, #4]
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #6
	adds r1, r3, #0
	cmp r0, r3
	bge _08069E5E
	adds r1, r0, #0
_08069E5E:
	strh r1, [r5, #2]
	ldr r0, [sp, #8]
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #6
	ldrh r1, [r2, #4]
	cmp r1, r0
	bge _08069E70
	adds r1, r0, #0
_08069E70:
	strh r1, [r5, #6]
	ldrh r0, [r7, #0x1e]
	lsls r0, r0, #6
	ldrh r1, [r2, #6]
	subs r3, r0, r1
	ldr r0, [sp, #0xc]
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #6
	adds r1, r3, #0
	cmp r0, r3
	bge _08069E8C
	adds r1, r0, #0
_08069E8C:
	strh r1, [r5, #8]
	movs r0, #2
	strb r0, [r5]
	adds r5, #0xc
_08069E94:
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	beq _08069E9E
	b _08069D8A
_08069E9E:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _08069EB6
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _08069EB6
	strb r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	strh r0, [r1, #8]
_08069EB6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069EC8: .4byte gSamusData
_08069ECC: .4byte 0x03004E10

	thumb_func_start ProcessGeneralScrolling
ProcessGeneralScrolling: @ 0x08069ED0
	push {lr}
	sub sp, #4
	ldr r0, _08069F20 @ =gColorFading
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08069FB2
	ldr r1, _08069F24 @ =gSamusData
	ldrh r0, [r1, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	ldr r3, _08069F28 @ =0x0000FFFF
	ldrh r2, [r1, #0x16]
	orrs r2, r0
	str r2, [sp]
	lsrs r1, r2, #0x10
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08069EFC
	ands r2, r3
	str r2, [sp]
_08069EFC:
	ldr r0, _08069F2C @ =gDisableScrolling
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069F94
	ldr r0, _08069F30 @ =gUnk_03000064
	ldrb r0, [r0]
	cmp r0, #0
	beq _08069F38
	ldr r0, _08069F34 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #6
	bne _08069F38
	mov r0, sp
	bl unk_6a8d0
	b _08069F52
	.align 2, 0
_08069F20: .4byte gColorFading
_08069F24: .4byte gSamusData
_08069F28: .4byte 0x0000FFFF
_08069F2C: .4byte gDisableScrolling
_08069F30: .4byte gUnk_03000064
_08069F34: .4byte gSubGameMode1
_08069F38:
	ldr r0, _08069F48 @ =gCurrentRoomEntry
	ldrb r0, [r0, #5]
	cmp r0, #3
	bne _08069F4C
	mov r0, sp
	bl ProcessScrolls
	b _08069F52
	.align 2, 0
_08069F48: .4byte gCurrentRoomEntry
_08069F4C:
	mov r0, sp
	bl ScrollWithNoScrolls
_08069F52:
	ldr r1, _08069F80 @ =0x0300122C
	ldr r0, _08069F84 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08069F88 @ =0x0300122E
	ldr r0, _08069F8C @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _08069F90 @ =0x03004E20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08069F6E
	bl AutoScrollBg0
_08069F6E:
	mov r0, sp
	bl UpdateEffectAndHazePosition
	bl ScrollBg3
	bl AutoScrollBg3
	b _08069FB2
	.align 2, 0
_08069F80: .4byte 0x0300122C
_08069F84: .4byte gBg1XPosition
_08069F88: .4byte 0x0300122E
_08069F8C: .4byte gBg1YPosition
_08069F90: .4byte 0x03004E20
_08069F94:
	cmp r0, #2
	bne _08069FB2
	ldr r0, _08069FB8 @ =0x03004E20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08069FA4
	bl AutoScrollBg0
_08069FA4:
	mov r0, sp
	bl UpdateEffectAndHazePosition
	bl ScrollBg3
	bl AutoScrollBg3
_08069FB2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08069FB8: .4byte 0x03004E20

	thumb_func_start ScrollWithNoScrolls
ScrollWithNoScrolls: @ 0x08069FBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069FD0 @ =gDebugMenuOptions
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _08069FD4
	adds r0, r4, #0
	bl ScrollWithNoScrollsX
	b _08069FE4
	.align 2, 0
_08069FD0: .4byte gDebugMenuOptions
_08069FD4:
	adds r0, r4, #0
	bl FrontWideCameraScrollX
	adds r0, r4, #0
	bl FrontWideCameraComputeAcceleration
	bl FrontWideCameraComputeVelocity
_08069FE4:
	ldrh r2, [r4, #2]
	ldr r3, _08069FF8 @ =0x03004E10
	ldrh r1, [r3, #4]
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bge _08069FFC
	adds r3, r1, #0
	b _0806A014
	.align 2, 0
_08069FF8: .4byte 0x03004E10
_08069FFC:
	ldr r0, _0806A02C @ =gBackgroundsData
	ldrh r0, [r0, #0xe]
	lsls r0, r0, #6
	ldr r1, _0806A030 @ =0xFFFFFF00
	adds r0, r0, r1
	ldrh r1, [r3, #6]
	subs r0, r0, r1
	ldr r4, _0806A034 @ =0xFFFFFE80
	adds r3, r2, r4
	cmp r2, r0
	ble _0806A014
	adds r3, r0, r4
_0806A014:
	ldr r2, _0806A038 @ =0x03000124
	strh r3, [r2, #4]
	ldr r1, _0806A03C @ =gBg1YPosition
	ldrh r0, [r1]
	subs r3, r3, r0
	cmp r3, #0
	ble _0806A040
	cmp r3, #0x30
	ble _0806A04A
	movs r3, #0x30
	b _0806A04A
	.align 2, 0
_0806A02C: .4byte gBackgroundsData
_0806A030: .4byte 0xFFFFFF00
_0806A034: .4byte 0xFFFFFE80
_0806A038: .4byte 0x03000124
_0806A03C: .4byte gBg1YPosition
_0806A040:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r3, r0
	bge _0806A04A
	adds r3, r0, #0
_0806A04A:
	strb r3, [r2, #7]
	ldrh r0, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ScrollWithNoScrollsX
ScrollWithNoScrollsX: @ 0x0806A058
	push {r4, lr}
	ldrh r2, [r0]
	ldr r3, _0806A070 @ =0x03004E10
	ldrh r1, [r3, #2]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bge _0806A074
	adds r3, r1, #0
	b _0806A098
	.align 2, 0
_0806A070: .4byte 0x03004E10
_0806A074:
	ldr r0, _0806A08C @ =gBackgroundsData
	ldrh r0, [r0, #0xc]
	lsls r0, r0, #6
	ldr r1, _0806A090 @ =0xFFFFFE20
	adds r0, r0, r1
	ldrh r1, [r3]
	subs r0, r0, r1
	cmp r2, r0
	ble _0806A094
	ldr r4, _0806A090 @ =0xFFFFFE20
	adds r3, r0, r4
	b _0806A098
	.align 2, 0
_0806A08C: .4byte gBackgroundsData
_0806A090: .4byte 0xFFFFFE20
_0806A094:
	ldr r0, _0806A0B4 @ =0xFFFFFE20
	adds r3, r2, r0
_0806A098:
	ldr r2, _0806A0B8 @ =0x03000124
	strh r3, [r2]
	ldr r1, _0806A0BC @ =gBg1XPosition
	ldrh r0, [r1]
	subs r3, r3, r0
	adds r4, r2, #0
	adds r2, r1, #0
	cmp r3, #0
	ble _0806A0C0
	cmp r3, #0x30
	ble _0806A0CA
	movs r3, #0x30
	b _0806A0CA
	.align 2, 0
_0806A0B4: .4byte 0xFFFFFE20
_0806A0B8: .4byte 0x03000124
_0806A0BC: .4byte gBg1XPosition
_0806A0C0:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r3, r0
	bge _0806A0CA
	adds r3, r0, #0
_0806A0CA:
	movs r1, #0
	strb r3, [r4, #6]
	ldrh r0, [r2]
	adds r0, r0, r3
	strh r0, [r2]
	strb r1, [r4, #0xa]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FrontWideCameraScrollX
FrontWideCameraScrollX: @ 0x0806A0DC
	push {r4, lr}
	ldrh r2, [r0]
	ldr r3, _0806A0F4 @ =0x03004E10
	ldrh r1, [r3, #2]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bge _0806A0F8
	adds r2, r1, #0
	b _0806A11C
	.align 2, 0
_0806A0F4: .4byte 0x03004E10
_0806A0F8:
	ldr r0, _0806A110 @ =gBackgroundsData
	ldrh r0, [r0, #0xc]
	lsls r0, r0, #6
	ldr r1, _0806A114 @ =0xFFFFFE20
	adds r0, r0, r1
	ldrh r1, [r3]
	subs r0, r0, r1
	cmp r2, r0
	ble _0806A118
	ldr r4, _0806A114 @ =0xFFFFFE20
	adds r2, r0, r4
	b _0806A11C
	.align 2, 0
_0806A110: .4byte gBackgroundsData
_0806A114: .4byte 0xFFFFFE20
_0806A118:
	ldr r0, _0806A134 @ =0xFFFFFE20
	adds r2, r2, r0
_0806A11C:
	ldr r0, _0806A138 @ =0x03000124
	strh r2, [r0]
	ldrh r1, [r0, #2]
	subs r2, r2, r1
	adds r1, r0, #0
	cmp r2, #0
	ble _0806A13C
	cmp r2, #0x30
	ble _0806A146
	movs r2, #0x30
	b _0806A146
	.align 2, 0
_0806A134: .4byte 0xFFFFFE20
_0806A138: .4byte 0x03000124
_0806A13C:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r2, r0
	bge _0806A146
	adds r2, r0, #0
_0806A146:
	strb r2, [r1, #6]
	ldrh r0, [r1]
	strh r0, [r1, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FrontWideCameraComputeAcceleration
FrontWideCameraComputeAcceleration: @ 0x0806A154
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0806A170 @ =0x03000124
	movs r0, #0
	strb r0, [r2, #8]
	ldr r1, _0806A174 @ =gSamusData
	ldrh r3, [r1, #0x12]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0806A178
	movs r0, #1
	b _0806A182
	.align 2, 0
_0806A170: .4byte 0x03000124
_0806A174: .4byte gSamusData
_0806A178:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0806A184
	movs r0, #2
_0806A182:
	strb r0, [r2, #8]
_0806A184:
	ldrb r0, [r1, #1]
	cmp r0, #0x26
	bne _0806A19E
	ldrb r1, [r2, #8]
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0806A19A
	movs r0, #3
	eors r0, r1
	strb r0, [r2, #8]
_0806A19A:
	ldrb r0, [r2, #8]
	strb r0, [r2, #9]
_0806A19E:
	ldrh r0, [r2]
	strh r0, [r2, #0xc]
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r0, #1
	bne _0806A1E4
	ldrh r1, [r4]
	ldr r0, _0806A1D8 @ =gBackgroundsData
	ldrh r4, [r0, #0xc]
	lsls r0, r4, #6
	ldr r3, _0806A1DC @ =0x03004E10
	ldrh r5, [r3]
	subs r0, r0, r5
	ldr r6, _0806A1E0 @ =0xFFFFFE20
	adds r0, r0, r6
	cmp r1, r0
	bge _0806A238
	ldrh r3, [r3, #2]
	movs r6, #0xf0
	lsls r6, r6, #1
	adds r0, r3, r6
	cmp r0, r1
	bge _0806A238
	ldrh r0, [r2]
	adds r1, r0, #0
	adds r1, #0x80
	cmp r1, r3
	blt _0806A214
	b _0806A224
	.align 2, 0
_0806A1D8: .4byte gBackgroundsData
_0806A1DC: .4byte 0x03004E10
_0806A1E0: .4byte 0xFFFFFE20
_0806A1E4:
	cmp r0, #2
	bne _0806A238
	ldrh r1, [r4]
	ldr r0, _0806A218 @ =gBackgroundsData
	ldrh r4, [r0, #0xc]
	lsls r0, r4, #6
	ldr r3, _0806A21C @ =0x03004E10
	ldrh r5, [r3]
	subs r0, r0, r5
	ldr r6, _0806A220 @ =0xFFFFFE20
	adds r0, r0, r6
	cmp r1, r0
	bge _0806A238
	ldrh r3, [r3, #2]
	movs r6, #0xf0
	lsls r6, r6, #1
	adds r0, r3, r6
	cmp r0, r1
	bge _0806A238
	ldrh r0, [r2]
	adds r1, r0, #0
	subs r1, #0x80
	cmp r1, r3
	bge _0806A224
_0806A214:
	adds r1, r3, #0
	b _0806A23A
	.align 2, 0
_0806A218: .4byte gBackgroundsData
_0806A21C: .4byte 0x03004E10
_0806A220: .4byte 0xFFFFFE20
_0806A224:
	lsls r0, r4, #6
	ldr r3, _0806A234 @ =0xFFFFFC40
	adds r0, r0, r3
	subs r0, r0, r5
	cmp r1, r0
	ble _0806A23A
	adds r1, r0, #0
	b _0806A23A
	.align 2, 0
_0806A234: .4byte 0xFFFFFC40
_0806A238:
	ldrh r1, [r2]
_0806A23A:
	strh r1, [r2, #0xc]
	ldr r3, _0806A254 @ =gBg1XPosition
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r3]
	cmp r0, r6
	beq _0806A258
	ldrh r1, [r2, #0xc]
	movs r0, #6
	ldrsb r0, [r2, r0]
	adds r0, r0, r6
	subs r1, r1, r0
	b _0806A25A
	.align 2, 0
_0806A254: .4byte gBg1XPosition
_0806A258:
	movs r1, #0
_0806A25A:
	cmp r1, #0
	ble _0806A266
	cmp r1, #4
	ble _0806A274
	movs r1, #4
	b _0806A274
_0806A266:
	cmp r1, #0
	bge _0806A274
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0806A274
	adds r1, r0, #0
_0806A274:
	strb r1, [r2, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start FrontWideCameraComputeVelocity
FrontWideCameraComputeVelocity: @ 0x0806A27C
	push {r4, r5, r6, r7, lr}
	ldr r4, _0806A2DC @ =0x03000124
	ldr r6, _0806A2E0 @ =0x03004E10
	ldrh r0, [r4, #0xc]
	ldrh r1, [r6, #2]
	cmp r0, r1
	bhs _0806A28E
	movs r0, #0
	strb r0, [r4, #6]
_0806A28E:
	ldrh r1, [r4, #0xc]
	ldr r7, _0806A2E4 @ =gBackgroundsData
	ldrh r0, [r7, #0xc]
	lsls r0, r0, #6
	ldr r2, _0806A2E8 @ =0xFFFFFC40
	adds r0, r0, r2
	ldrh r5, [r6]
	subs r0, r0, r5
	cmp r1, r0
	ble _0806A2A6
	movs r0, #0
	strb r0, [r4, #6]
_0806A2A6:
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r1, #0xa
	ldrsb r1, [r4, r1]
	ldr r2, _0806A2EC @ =gBg1XPosition
	adds r0, r0, r1
	ldrh r1, [r2]
	adds r3, r0, r1
	ldrh r0, [r6, #2]
	cmp r3, r0
	blt _0806A2CC
	ldrh r0, [r7, #0xc]
	lsls r0, r0, #6
	ldr r1, _0806A2F0 @ =0xFFFFFE20
	adds r0, r0, r1
	subs r0, r0, r5
	adds r0, r0, r1
	cmp r3, r0
	ble _0806A2D4
_0806A2CC:
	adds r3, r0, #0
	movs r0, #0
	strb r0, [r4, #6]
	strb r0, [r4, #0xa]
_0806A2D4:
	strh r3, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A2DC: .4byte 0x03000124
_0806A2E0: .4byte 0x03004E10
_0806A2E4: .4byte gBackgroundsData
_0806A2E8: .4byte 0xFFFFFC40
_0806A2EC: .4byte gBg1XPosition
_0806A2F0: .4byte 0xFFFFFE20

	thumb_func_start UpdateEffectAndHazePosition
UpdateEffectAndHazePosition: @ 0x0806A2F4
	push {r4, r5, r6, r7, lr}
	ldr r1, _0806A328 @ =0x03004E4C
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	movs r7, #0
	ldr r2, _0806A32C @ =gCurrentRoomEntry
	ldrb r3, [r2, #1]
	movs r0, #0x10
	ands r0, r3
	adds r4, r1, #0
	mov ip, r2
	cmp r0, #0
	beq _0806A340
	cmp r3, #0x11
	beq _0806A316
	b _0806A572
_0806A316:
	ldr r1, _0806A330 @ =0x03001224
	ldr r0, _0806A334 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #1
	strh r0, [r1]
	ldr r1, _0806A338 @ =0x03001226
	ldr r0, _0806A33C @ =gBg1YPosition
	b _0806A586
	.align 2, 0
_0806A328: .4byte 0x03004E4C
_0806A32C: .4byte gCurrentRoomEntry
_0806A330: .4byte 0x03001224
_0806A334: .4byte gBg1XPosition
_0806A338: .4byte 0x03001226
_0806A33C: .4byte gBg1YPosition
_0806A340:
	mov r0, ip
	ldrh r1, [r0, #0x12]
	ldr r0, _0806A3DC @ =0x0000FFFF
	cmp r1, r0
	bne _0806A34C
	b _0806A444
_0806A34C:
	ldr r1, _0806A3E0 @ =0x03001224
	ldr r0, _0806A3E4 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	movs r1, #8
	ldrsh r0, [r4, r1]
	mov r2, ip
	ldrh r2, [r2, #0x12]
	adds r5, r0, r2
	asrs r1, r5, #2
	ldr r0, _0806A3E8 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r5, r1, r0
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #1
	bne _0806A3A8
	ldrb r3, [r4, #1]
	ldr r2, _0806A3EC @ =0x0879BB30
	ldrb r6, [r4, #2]
	lsls r0, r6, #1
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r3, r0
	blt _0806A39E
	ldr r0, _0806A3F0 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _0806A39E
	adds r0, r6, #1
	strb r0, [r4, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0806A39C
	strb r7, [r4, #2]
_0806A39C:
	strb r7, [r4, #1]
_0806A39E:
	ldrb r0, [r4, #2]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsb r2, [r0, r2]
_0806A3A8:
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #2
	strh r0, [r4, #4]
	adds r5, r5, r2
	cmp r5, #0
	bge _0806A400
	ldr r2, _0806A3F4 @ =gIoRegisters
	ldrh r3, [r2, #0x10]
	movs r4, #0xc0
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r0, r3
	cmp r0, #0
	beq _0806A426
	ldrh r1, [r2, #8]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0806A426
	ldr r0, _0806A3F8 @ =0x00003FFF
	ands r0, r3
	strh r0, [r2, #0x10]
	ldr r1, _0806A3FC @ =0x04000008
	strh r0, [r1]
	b _0806A426
	.align 2, 0
_0806A3DC: .4byte 0x0000FFFF
_0806A3E0: .4byte 0x03001224
_0806A3E4: .4byte gBg1XPosition
_0806A3E8: .4byte gBg1YPosition
_0806A3EC: .4byte 0x0879BB30
_0806A3F0: .4byte gPreventMovementTimer
_0806A3F4: .4byte gIoRegisters
_0806A3F8: .4byte 0x00003FFF
_0806A3FC: .4byte 0x04000008
_0806A400:
	ldr r2, _0806A438 @ =gIoRegisters
	ldrh r3, [r2, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0806A426
	ldrh r0, [r2, #8]
	ands r1, r0
	cmp r1, #0
	beq _0806A426
	adds r0, r1, #0
	orrs r0, r3
	strh r0, [r2, #0x10]
	ldr r2, _0806A43C @ =0x04000008
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0806A426:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r5, r0
	ble _0806A430
	adds r5, r0, #0
_0806A430:
	ldr r1, _0806A440 @ =0x03001226
	rsbs r0, r5, #0
	lsls r0, r0, #2
	b _0806A588
	.align 2, 0
_0806A438: .4byte gIoRegisters
_0806A43C: .4byte 0x04000008
_0806A440: .4byte 0x03001226
_0806A444:
	movs r7, #1
	mov r3, ip
	ldrb r0, [r3, #1]
	subs r0, #0x41
	cmp r0, #9
	bls _0806A452
	b _0806A570
_0806A452:
	lsls r0, r0, #2
	ldr r1, _0806A45C @ =_0806A460
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A45C: .4byte _0806A460
_0806A460: @ jump table
	.4byte _0806A488 @ case 0
	.4byte _0806A570 @ case 1
	.4byte _0806A49C @ case 2
	.4byte _0806A4D0 @ case 3
	.4byte _0806A49C @ case 4
	.4byte _0806A570 @ case 5
	.4byte _0806A540 @ case 6
	.4byte _0806A570 @ case 7
	.4byte _0806A56A @ case 8
	.4byte _0806A564 @ case 9
_0806A488:
	ldr r0, _0806A494 @ =0x03001224
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0806A498 @ =0x03001226
	strh r1, [r0]
	b _0806A572
	.align 2, 0
_0806A494: .4byte 0x03001224
_0806A498: .4byte 0x03001226
_0806A49C:
	ldr r3, _0806A4BC @ =0x03001224
	ldr r0, _0806A4C0 @ =gBg1XPosition
	ldr r2, _0806A4C4 @ =gSamusData
	ldrh r0, [r0]
	ldrh r1, [r2, #0x16]
	subs r0, r0, r1
	strh r0, [r3]
	ldr r3, _0806A4C8 @ =0x03001226
	ldr r0, _0806A4CC @ =gBg1YPosition
	ldrh r0, [r0]
	ldrh r1, [r2, #0x18]
	subs r0, r0, r1
	adds r0, #0x40
	strh r0, [r3]
	b _0806A572
	.align 2, 0
_0806A4BC: .4byte 0x03001224
_0806A4C0: .4byte gBg1XPosition
_0806A4C4: .4byte gSamusData
_0806A4C8: .4byte 0x03001226
_0806A4CC: .4byte gBg1YPosition
_0806A4D0:
	movs r5, #0
	ldr r6, _0806A52C @ =0x03001224
	ldr r0, _0806A530 @ =gBg1XPosition
	ldr r3, _0806A534 @ =gSaXSpawnPosition
	ldrh r1, [r0]
	ldrh r0, [r3]
	subs r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, r2
	strh r0, [r6]
	ldr r4, _0806A538 @ =0x03001226
	ldr r0, _0806A53C @ =gBg1YPosition
	ldrh r2, [r0]
	ldrh r0, [r3, #2]
	subs r2, r2, r0
	movs r3, #0x88
	lsls r3, r3, #3
	adds r0, r2, r3
	strh r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x13
	cmp r1, r0
	bls _0806A50A
	movs r5, #1
_0806A50A:
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r2, r1
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0806A51C
	movs r5, #1
_0806A51C:
	cmp r5, #0
	beq _0806A572
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r6]
	b _0806A572
	.align 2, 0
_0806A52C: .4byte 0x03001224
_0806A530: .4byte gBg1XPosition
_0806A534: .4byte gSaXSpawnPosition
_0806A538: .4byte 0x03001226
_0806A53C: .4byte gBg1YPosition
_0806A540:
	ldr r1, _0806A554 @ =0x03001226
	ldr r0, _0806A558 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0806A55C @ =0x03001224
	ldr r0, _0806A560 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	b _0806A572
	.align 2, 0
_0806A554: .4byte 0x03001226
_0806A558: .4byte gBg1YPosition
_0806A55C: .4byte 0x03001224
_0806A560: .4byte gBg1XPosition
_0806A564:
	bl OmegaMetroidRoomUpdatePlanetBg0
	b _0806A572
_0806A56A:
	bl UpdateNightmareShadow
	b _0806A572
_0806A570:
	movs r7, #0
_0806A572:
	ldr r3, _0806A59C @ =gCurrentRoomEntry
	mov ip, r3
	cmp r7, #0
	bne _0806A58A
	ldr r1, _0806A5A0 @ =0x03001226
	ldr r0, _0806A5A4 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0806A5A8 @ =0x03001224
	ldr r0, _0806A5AC @ =gBg1XPosition
_0806A586:
	ldrh r0, [r0]
_0806A588:
	strh r0, [r1]
_0806A58A:
	mov r0, ip
	ldrh r1, [r0, #0x12]
	ldr r0, _0806A5B0 @ =0x0000FFFF
	cmp r1, r0
	bne _0806A5B8
	ldr r1, _0806A5B4 @ =gEffectYPosition
	movs r0, #0
	strh r0, [r1]
	b _0806A5D4
	.align 2, 0
_0806A59C: .4byte gCurrentRoomEntry
_0806A5A0: .4byte 0x03001226
_0806A5A4: .4byte gBg1YPosition
_0806A5A8: .4byte 0x03001224
_0806A5AC: .4byte gBg1XPosition
_0806A5B0: .4byte 0x0000FFFF
_0806A5B4: .4byte gEffectYPosition
_0806A5B8:
	ldr r0, _0806A5DC @ =0x03004E4C
	movs r2, #4
	ldrsh r1, [r0, r2]
	mov r3, ip
	ldrh r3, [r3, #0x12]
	adds r1, r1, r3
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r5, r1, r0
	cmp r5, #0
	bge _0806A5D0
	movs r5, #0
_0806A5D0:
	ldr r0, _0806A5E0 @ =gEffectYPosition
	strh r5, [r0]
_0806A5D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A5DC: .4byte 0x03004E4C
_0806A5E0: .4byte gEffectYPosition

	thumb_func_start AutoScrollBg0
AutoScrollBg0: @ 0x0806A5E4
	push {lr}
	ldr r0, _0806A5F8 @ =0x03004E20
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #1
	bne _0806A5FC
	ldrb r1, [r2, #1]
	movs r0, #7
	b _0806A604
	.align 2, 0
_0806A5F8: .4byte 0x03004E20
_0806A5FC:
	cmp r1, #2
	bne _0806A612
	ldrb r1, [r2, #1]
	movs r0, #3
_0806A604:
	ands r0, r1
	cmp r0, #0
	bne _0806A63A
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	b _0806A63A
_0806A612:
	cmp r1, #3
	bne _0806A626
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A63A
	ldrh r0, [r2, #6]
	adds r0, #1
	b _0806A638
_0806A626:
	cmp r1, #4
	bne _0806A63A
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A63A
	ldrh r0, [r2, #6]
	subs r0, #1
_0806A638:
	strh r0, [r2, #6]
_0806A63A:
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	pop {r0}
	bx r0

	thumb_func_start GetBg3ScrollingValues
GetBg3ScrollingValues: @ 0x0806A644
	push {lr}
	movs r2, #0
	movs r3, #0
	ldr r0, _0806A65C @ =gCurrentRoomEntry
	ldrb r0, [r0, #6]
	cmp r0, #0xa
	bhi _0806A6BA
	lsls r0, r0, #2
	ldr r1, _0806A660 @ =_0806A664
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A65C: .4byte gCurrentRoomEntry
_0806A660: .4byte _0806A664
_0806A664: @ jump table
	.4byte _0806A6BA @ case 0
	.4byte _0806A690 @ case 1
	.4byte _0806A694 @ case 2
	.4byte _0806A69A @ case 3
	.4byte _0806A6A0 @ case 4
	.4byte _0806A6A6 @ case 5
	.4byte _0806A6AC @ case 6
	.4byte _0806A6B6 @ case 7
	.4byte _0806A6B6 @ case 8
	.4byte _0806A6B2 @ case 9
	.4byte _0806A6AC @ case 10
_0806A690:
	movs r2, #2
	b _0806A6B8
_0806A694:
	movs r2, #0
	movs r3, #2
	b _0806A6BA
_0806A69A:
	movs r2, #2
	movs r3, #2
	b _0806A6BA
_0806A6A0:
	movs r2, #1
	movs r3, #2
	b _0806A6BA
_0806A6A6:
	movs r2, #2
	movs r3, #1
	b _0806A6BA
_0806A6AC:
	movs r2, #1
	movs r3, #1
	b _0806A6BA
_0806A6B2:
	movs r2, #3
	b _0806A6B8
_0806A6B6:
	movs r2, #1
_0806A6B8:
	movs r3, #0
_0806A6BA:
	lsls r0, r3, #0x10
	orrs r0, r2
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ScrollBg3
ScrollBg3: @ 0x0806A6C4
	push {r4, lr}
	bl GetBg3ScrollingValues
	adds r4, r0, #0
	movs r0, #0xff
	ands r0, r4
	asrs r4, r4, #0x10
	cmp r0, #0
	bne _0806A6F0
	ldr r1, _0806A6E8 @ =0x03001230
	ldr r0, _0806A6EC @ =0x03000124
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	b _0806A752
	.align 2, 0
_0806A6E8: .4byte 0x03001230
_0806A6EC: .4byte 0x03000124
_0806A6F0:
	cmp r0, #1
	bne _0806A708
	ldr r0, _0806A700 @ =0x03001230
	ldr r1, _0806A704 @ =gBg1XPosition
	ldrh r1, [r1]
	strh r1, [r0]
	b _0806A752
	.align 2, 0
_0806A700: .4byte 0x03001230
_0806A704: .4byte gBg1XPosition
_0806A708:
	cmp r0, #2
	bne _0806A730
	ldr r3, _0806A728 @ =0x03001230
	ldr r2, _0806A72C @ =0x03000124
	movs r0, #6
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0xa
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	b _0806A752
	.align 2, 0
_0806A728: .4byte 0x03001230
_0806A72C: .4byte 0x03000124
_0806A730:
	cmp r0, #3
	bne _0806A752
	ldr r2, _0806A764 @ =0x03001230
	ldr r1, _0806A768 @ =0x03000124
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0806A742
	adds r0, #3
_0806A742:
	asrs r0, r0, #2
	ldrb r1, [r1, #0xa]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
_0806A752:
	cmp r4, #0
	bne _0806A784
	ldr r0, _0806A76C @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bls _0806A774
	ldr r0, _0806A770 @ =0x03001232
	strh r4, [r0]
	b _0806A7A4
	.align 2, 0
_0806A764: .4byte 0x03001230
_0806A768: .4byte 0x03000124
_0806A76C: .4byte gCurrentArea
_0806A770: .4byte 0x03001232
_0806A774:
	ldr r1, _0806A77C @ =0x03001232
	ldr r2, _0806A780 @ =0x0000FF80
	adds r0, r2, #0
	b _0806A7A2
	.align 2, 0
_0806A77C: .4byte 0x03001232
_0806A780: .4byte 0x0000FF80
_0806A784:
	cmp r4, #1
	bne _0806A798
	ldr r1, _0806A790 @ =0x03001232
	ldr r0, _0806A794 @ =gBg1YPosition
	ldrh r0, [r0]
	b _0806A7A0
	.align 2, 0
_0806A790: .4byte 0x03001232
_0806A794: .4byte gBg1YPosition
_0806A798:
	ldr r1, _0806A7AC @ =0x03001232
	ldr r0, _0806A7B0 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #1
_0806A7A0:
	subs r0, #0x80
_0806A7A2:
	strh r0, [r1]
_0806A7A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A7AC: .4byte 0x03001232
_0806A7B0: .4byte gBg1YPosition

	thumb_func_start unk_6a7b4
unk_6a7b4: @ 0x0806A7B4
	push {lr}
	bl GetBg3ScrollingValues
	adds r1, r0, #0
	movs r0, #0xff
	ands r1, r0
	cmp r1, #0
	bne _0806A7EC
	ldr r0, _0806A7D4 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bls _0806A7DC
	ldr r0, _0806A7D8 @ =0x03001230
	strh r1, [r0]
	b _0806A812
	.align 2, 0
_0806A7D4: .4byte gCurrentArea
_0806A7D8: .4byte 0x03001230
_0806A7DC:
	ldr r1, _0806A7E4 @ =0x03001230
	ldr r2, _0806A7E8 @ =0x0000FF80
	adds r0, r2, #0
	b _0806A810
	.align 2, 0
_0806A7E4: .4byte 0x03001230
_0806A7E8: .4byte 0x0000FF80
_0806A7EC:
	cmp r1, #2
	bne _0806A804
	ldr r1, _0806A7FC @ =0x03001230
	ldr r0, _0806A800 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #1
	b _0806A810
	.align 2, 0
_0806A7FC: .4byte 0x03001230
_0806A800: .4byte gBg1XPosition
_0806A804:
	cmp r1, #3
	bne _0806A812
	ldr r1, _0806A818 @ =0x03001230
	ldr r0, _0806A81C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
_0806A810:
	strh r0, [r1]
_0806A812:
	pop {r0}
	bx r0
	.align 2, 0
_0806A818: .4byte 0x03001230
_0806A81C: .4byte gBg1XPosition

	thumb_func_start AutoScrollBg3
AutoScrollBg3: @ 0x0806A820
	push {r4, lr}
	ldr r0, _0806A83C @ =0x03004E18
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0806A8CA
	ldrb r0, [r2]
	cmp r0, #2
	beq _0806A8B4
	cmp r0, #2
	bgt _0806A840
	cmp r0, #1
	beq _0806A846
	b _0806A8C4
	.align 2, 0
_0806A83C: .4byte 0x03004E18
_0806A840:
	cmp r0, #3
	beq _0806A856
	b _0806A8C4
_0806A846:
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A8C4
	ldrh r0, [r2, #4]
	adds r0, #1
	b _0806A8C2
_0806A856:
	ldrb r4, [r2, #2]
	adds r0, r4, #0
	adds r1, r4, #0
	cmp r0, #0
	bne _0806A870
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A8C4
	ldrh r0, [r2, #4]
	adds r0, #1
	b _0806A8C2
_0806A870:
	cmp r0, #1
	bne _0806A87E
	movs r0, #0
	strb r0, [r2, #1]
	adds r0, r1, #1
	strb r0, [r2, #2]
	b _0806A8C4
_0806A87E:
	cmp r0, #2
	bne _0806A8B4
	ldrb r3, [r2, #1]
	movs r0, #1
	ands r0, r3
	adds r1, r3, #0
	cmp r0, #0
	beq _0806A89E
	ldr r0, _0806A8B0 @ =0x083C923B
	lsrs r1, r1, #1
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
_0806A89E:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0806A8C4
	movs r0, #0
	strb r0, [r2, #1]
	adds r0, r4, #1
	strb r0, [r2, #2]
	b _0806A8C4
	.align 2, 0
_0806A8B0: .4byte 0x083C923B
_0806A8B4:
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A8C4
	ldrh r0, [r2, #4]
	subs r0, #1
_0806A8C2:
	strh r0, [r2, #4]
_0806A8C4:
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
_0806A8CA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_6a8d0
unk_6a8d0: @ 0x0806A8D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _0806A8E4 @ =0x000001DF
	cmp r1, r0
	bhi _0806A8EC
	ldr r1, _0806A8E8 @ =gBg1XPosition
	movs r0, #0
	b _0806A91A
	.align 2, 0
_0806A8E4: .4byte 0x000001DF
_0806A8E8: .4byte gBg1XPosition
_0806A8EC:
	ldrh r3, [r4]
	ldr r0, _0806A904 @ =gBackgroundsData
	ldrh r0, [r0, #0xc]
	lsls r2, r0, #6
	ldr r1, _0806A908 @ =0xFFFFFE20
	adds r0, r2, r1
	cmp r3, r0
	ble _0806A914
	ldr r1, _0806A90C @ =gBg1XPosition
	ldr r3, _0806A910 @ =0xFFFFFC40
	adds r0, r2, r3
	b _0806A91A
	.align 2, 0
_0806A904: .4byte gBackgroundsData
_0806A908: .4byte 0xFFFFFE20
_0806A90C: .4byte gBg1XPosition
_0806A910: .4byte 0xFFFFFC40
_0806A914:
	ldr r1, _0806A92C @ =gBg1XPosition
	ldr r2, _0806A930 @ =0xFFFFFE20
	adds r0, r3, r2
_0806A91A:
	strh r0, [r1]
	ldrh r1, [r4, #2]
	ldr r0, _0806A934 @ =0x0000017F
	cmp r1, r0
	bhi _0806A93C
	ldr r1, _0806A938 @ =gBg1YPosition
	movs r0, #0
	b _0806A966
	.align 2, 0
_0806A92C: .4byte gBg1XPosition
_0806A930: .4byte 0xFFFFFE20
_0806A934: .4byte 0x0000017F
_0806A938: .4byte gBg1YPosition
_0806A93C:
	ldrh r3, [r4, #2]
	ldr r0, _0806A954 @ =gBackgroundsData
	ldrh r0, [r0, #0xe]
	lsls r2, r0, #6
	adds r0, r2, #0
	subs r0, #0xc0
	cmp r3, r0
	ble _0806A960
	ldr r1, _0806A958 @ =gBg1YPosition
	ldr r3, _0806A95C @ =0xFFFFFDC0
	adds r0, r2, r3
	b _0806A966
	.align 2, 0
_0806A954: .4byte gBackgroundsData
_0806A958: .4byte gBg1YPosition
_0806A95C: .4byte 0xFFFFFDC0
_0806A960:
	ldr r1, _0806A970 @ =gBg1YPosition
	ldr r2, _0806A974 @ =0xFFFFFE80
	adds r0, r3, r2
_0806A966:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A970: .4byte gBg1YPosition
_0806A974: .4byte 0xFFFFFE80

	thumb_func_start UpdateNightmareShadow
UpdateNightmareShadow: @ 0x0806A978
	push {r4, lr}
	ldr r0, _0806A9B0 @ =0x03004E30
	ldrb r0, [r0]
	cmp r0, #4
	bls _0806A992
	ldr r0, _0806A9B4 @ =gScreenShakeX
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0806A992
	movs r0, #0x1e
	movs r1, #0
	bl ScreenShakeStartHorizontal
_0806A992:
	ldr r1, _0806A9B0 @ =0x03004E30
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
	ldrb r0, [r1]
	adds r4, r1, #0
	cmp r0, #7
	bls _0806A9A4
	b _0806AC0A
_0806A9A4:
	lsls r0, r0, #2
	ldr r1, _0806A9B8 @ =_0806A9BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A9B0: .4byte 0x03004E30
_0806A9B4: .4byte gScreenShakeX
_0806A9B8: .4byte _0806A9BC
_0806A9BC: @ jump table
	.4byte _0806A9DC @ case 0
	.4byte _0806AA34 @ case 1
	.4byte _0806AA7A @ case 2
	.4byte _0806AA9A @ case 3
	.4byte _0806AC0A @ case 4
	.4byte _0806AB30 @ case 5
	.4byte _0806AB92 @ case 6
	.4byte _0806ABF2 @ case 7
_0806A9DC:
	ldr r1, _0806AA0C @ =0x03001224
	ldr r2, _0806AA10 @ =0x083C92BC
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _0806AA14 @ =0x03001226
	ldrh r0, [r2, #6]
	strh r0, [r1]
	movs r0, #0
	strb r0, [r4, #4]
	strb r0, [r4, #3]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strh r0, [r4, #6]
	ldr r0, _0806AA18 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _0806AA1C
	movs r0, #1
	strb r0, [r4]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r4, #6]
	b _0806AC0A
	.align 2, 0
_0806AA0C: .4byte 0x03001224
_0806AA10: .4byte 0x083C92BC
_0806AA14: .4byte 0x03001226
_0806AA18: .4byte gEventCounter
_0806AA1C:
	cmp r0, #0x3a
	bls _0806AA2E
	movs r0, #1
	strb r0, [r4, #2]
	movs r0, #2
	strb r0, [r4]
	movs r0, #0xf0
	strh r0, [r4, #6]
	b _0806AC0A
_0806AA2E:
	movs r0, #4
	strb r0, [r4]
	b _0806AC0A
_0806AA34:
	ldrb r2, [r4, #3]
	cmp r2, #1
	bls _0806AA5C
	movs r0, #4
	strb r0, [r4]
	ldr r1, _0806AA50 @ =0x03001224
	ldr r2, _0806AA54 @ =0x083C92BC
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _0806AA58 @ =0x03001226
	ldrh r0, [r2, #6]
	strh r0, [r1]
	b _0806AC0A
	.align 2, 0
_0806AA50: .4byte 0x03001224
_0806AA54: .4byte 0x083C92BC
_0806AA58: .4byte 0x03001226
_0806AA5C:
	ldrh r1, [r4, #6]
	movs r0, #0xb4
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0806AA68
	b _0806AC0A
_0806AA68:
	movs r1, #0
	movs r0, #3
	strb r0, [r4]
	movs r0, #0
	strh r1, [r4, #6]
	strb r0, [r4, #5]
	adds r0, r2, #1
	strb r0, [r4, #3]
	b _0806AC0A
_0806AA7A:
	ldrh r1, [r4, #6]
	movs r0, #0xb4
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0806AA86
	b _0806AC0A
_0806AA86:
	movs r1, #0
	movs r0, #3
	strb r0, [r4]
	movs r0, #0
	strh r1, [r4, #6]
	strb r0, [r4, #5]
	ldrb r0, [r4, #3]
	adds r0, #1
	strb r0, [r4, #3]
	b _0806AC0A
_0806AA9A:
	ldrb r0, [r4, #1]
	cmp r0, #5
	beq _0806AAB8
	cmp r0, #6
	bne _0806AAA8
	movs r0, #5
	b _0806AABA
_0806AAA8:
	ldr r0, _0806AAB4 @ =gSamusData
	ldrh r0, [r0, #0x12]
	cmp r0, #0x10
	bne _0806AAB8
	movs r0, #5
	b _0806AABA
	.align 2, 0
_0806AAB4: .4byte gSamusData
_0806AAB8:
	movs r0, #6
_0806AABA:
	strb r0, [r4]
	ldr r1, _0806AAE0 @ =gFrameCounter8Bit
	ldr r0, _0806AAE4 @ =gFrameCounter16Bit
	ldrh r0, [r0]
	lsrs r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	movs r1, #0xf
	ands r0, r1
	ldr r1, _0806AAE8 @ =0x0879BB40
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #5]
	ldrb r0, [r4]
	cmp r0, #5
	bne _0806AAEC
	movs r0, #1
	b _0806AAF6
	.align 2, 0
_0806AAE0: .4byte gFrameCounter8Bit
_0806AAE4: .4byte gFrameCounter16Bit
_0806AAE8: .4byte 0x0879BB40
_0806AAEC:
	cmp r0, #6
	bne _0806AAF4
	movs r0, #2
	b _0806AAF6
_0806AAF4:
	movs r0, #0
_0806AAF6:
	strb r0, [r4, #4]
	ldr r2, _0806AB20 @ =0x03001224
	ldr r1, _0806AB24 @ =0x083C92BC
	ldrb r0, [r4, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r2, _0806AB28 @ =0x03001226
	ldrb r0, [r4, #4]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, _0806AB2C @ =0x000002A3
	bl SoundPlay
	movs r0, #0
	strh r0, [r4, #6]
	b _0806AC0A
	.align 2, 0
_0806AB20: .4byte 0x03001224
_0806AB24: .4byte 0x083C92BC
_0806AB28: .4byte 0x03001226
_0806AB2C: .4byte 0x000002A3
_0806AB30:
	ldrh r3, [r4, #6]
	cmp r3, #0x28
	ble _0806AB38
	movs r3, #0x28
_0806AB38:
	ldr r1, _0806AB78 @ =0x03001224
	ldrh r2, [r1]
	subs r2, r2, r3
	strh r2, [r1]
	ldr r3, _0806AB7C @ =0x083C92BC
	ldrb r0, [r4, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	asrs r0, r0, #8
	adds r0, #2
	lsls r1, r0, #1
	adds r3, r1, r0
	ldr r1, _0806AB80 @ =0x03001226
	movs r0, #5
	ldrsb r0, [r4, r0]
	adds r0, r0, r3
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	lsls r2, r2, #0x10
	ldr r0, _0806AB84 @ =0x03FF0000
	cmp r2, r0
	bhi _0806AC0A
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0806AB88
	movs r0, #0
	b _0806AB8A
	.align 2, 0
_0806AB78: .4byte 0x03001224
_0806AB7C: .4byte 0x083C92BC
_0806AB80: .4byte 0x03001226
_0806AB84: .4byte 0x03FF0000
_0806AB88:
	ldrb r0, [r4]
_0806AB8A:
	strb r0, [r4, #1]
	movs r0, #0
	strh r0, [r4, #6]
	b _0806ABFE
_0806AB92:
	ldrh r3, [r4, #6]
	cmp r3, #0x28
	ble _0806AB9A
	movs r3, #0x28
_0806AB9A:
	ldr r0, _0806ABDC @ =0x03001224
	ldrh r2, [r0]
	adds r2, r2, r3
	strh r2, [r0]
	ldrh r1, [r0]
	ldr r3, _0806ABE0 @ =0x083C92BC
	ldrb r0, [r4, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	subs r1, r1, r0
	asrs r1, r1, #8
	adds r1, #2
	lsls r0, r1, #1
	adds r3, r0, r1
	ldr r1, _0806ABE4 @ =0x03001226
	movs r0, #5
	ldrsb r0, [r4, r0]
	adds r0, r0, r3
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	lsls r2, r2, #0x10
	movs r0, #0xa4
	lsls r0, r0, #0x14
	cmp r2, r0
	bls _0806AC0A
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0806ABE8
	movs r0, #0
	b _0806ABEA
	.align 2, 0
_0806ABDC: .4byte 0x03001224
_0806ABE0: .4byte 0x083C92BC
_0806ABE4: .4byte 0x03001226
_0806ABE8:
	ldrb r0, [r4]
_0806ABEA:
	strb r0, [r4, #1]
	movs r0, #0
	strh r0, [r4, #6]
	b _0806ABFE
_0806ABF2:
	ldr r0, _0806AC10 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0806AC0A
_0806ABFE:
	ldrb r0, [r4, #2]
	movs r1, #1
	cmp r0, #0
	beq _0806AC08
	movs r1, #2
_0806AC08:
	strb r1, [r4]
_0806AC0A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AC10: .4byte gChangedInput

	thumb_func_start OmegaMetroidRoomUpdatePlanetBg0
OmegaMetroidRoomUpdatePlanetBg0: @ 0x0806AC14
	push {r4, lr}
	ldr r1, _0806AC34 @ =0x03004E30
	ldrh r0, [r1, #6]
	adds r0, #1
	movs r2, #0
	movs r4, #0
	strh r0, [r1, #6]
	ldrb r0, [r1]
	adds r3, r1, #0
	cmp r0, #1
	beq _0806AC6C
	cmp r0, #1
	bgt _0806AC38
	cmp r0, #0
	beq _0806AC3E
	b _0806ACB6
	.align 2, 0
_0806AC34: .4byte 0x03004E30
_0806AC38:
	cmp r0, #2
	beq _0806AC80
	b _0806ACB6
_0806AC3E:
	ldr r0, _0806AC60 @ =gEffectYPosition
	strh r4, [r0]
	strb r2, [r3, #4]
	strb r2, [r3, #2]
	strh r4, [r3, #6]
	strb r2, [r3, #1]
	movs r0, #1
	strb r0, [r3]
	ldr r1, _0806AC64 @ =0x03001226
	movs r0, #0x80
	strh r0, [r1]
	ldr r1, _0806AC68 @ =0x03001224
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	b _0806ACB6
	.align 2, 0
_0806AC60: .4byte gEffectYPosition
_0806AC64: .4byte 0x03001226
_0806AC68: .4byte 0x03001224
_0806AC6C:
	ldr r0, _0806AC7C @ =gDisableDrawingSamusAndScrollingFlag
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806ACB6
	movs r0, #2
	strb r0, [r3]
	strh r4, [r3, #6]
	b _0806ACB6
	.align 2, 0
_0806AC7C: .4byte gDisableDrawingSamusAndScrollingFlag
_0806AC80:
	ldr r1, _0806AC94 @ =0x03001224
	ldrh r0, [r1]
	ldr r2, _0806AC98 @ =0xFFFFFB00
	adds r0, r0, r2
	asrs r2, r0, #7
	cmp r2, #5
	ble _0806AC9C
	movs r2, #5
	b _0806ACA2
	.align 2, 0
_0806AC94: .4byte 0x03001224
_0806AC98: .4byte 0xFFFFFB00
_0806AC9C:
	cmp r2, #0
	bgt _0806ACA2
	movs r2, #1
_0806ACA2:
	ldrh r0, [r1]
	subs r0, r0, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bhi _0806ACB6
	movs r0, #3
	strb r0, [r3]
_0806ACB6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CheckCCAAOnBlock
CheckCCAAOnBlock: @ 0x0806ACBC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	ldrh r1, [r4, #4]
	adds r0, r1, #0
	subs r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x24
	bls _0806ACD2
	b _0806AE24
_0806ACD2:
	adds r0, r1, #0
	subs r0, #0x10
	strb r0, [r4, #8]
	ldr r0, _0806ACFC @ =gCurrentClipdataAffectingAction
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0xb
	bne _0806AD04
	ldr r1, _0806AD00 @ =0x083C92E0
	ldrb r2, [r4, #8]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bne _0806ACF4
	b _0806AE24
_0806ACF4:
	movs r0, #0xa
	strb r0, [r3]
	b _0806AD1A
	.align 2, 0
_0806ACFC: .4byte gCurrentClipdataAffectingAction
_0806AD00: .4byte 0x083C92E0
_0806AD04:
	ldrb r2, [r4, #8]
	cmp r1, #0xd
	bne _0806AD1A
	ldr r0, _0806AD30 @ =0x083C92E0
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1, #3]
	lsrs r0, r0, #4
	cmp r0, #0
	bne _0806AD1A
	b _0806AE24
_0806AD1A:
	movs r7, #1
	movs r5, #0
	subs r0, r2, #2
	cmp r0, #0x22
	bls _0806AD26
	b _0806AE20
_0806AD26:
	lsls r0, r0, #2
	ldr r1, _0806AD34 @ =_0806AD38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806AD30: .4byte 0x083C92E0
_0806AD34: .4byte _0806AD38
_0806AD38: @ jump table
	.4byte _0806ADC4 @ case 0
	.4byte _0806ADD2 @ case 1
	.4byte _0806ADCC @ case 2
	.4byte _0806AE20 @ case 3
	.4byte _0806ADF0 @ case 4
	.4byte _0806ADDA @ case 5
	.4byte _0806ADDA @ case 6
	.4byte _0806ADF0 @ case 7
	.4byte _0806ADF0 @ case 8
	.4byte _0806AE20 @ case 9
	.4byte _0806AE20 @ case 10
	.4byte _0806ADC4 @ case 11
	.4byte _0806ADD2 @ case 12
	.4byte _0806ADCC @ case 13
	.4byte _0806ADF0 @ case 14
	.4byte _0806ADF0 @ case 15
	.4byte _0806ADF0 @ case 16
	.4byte _0806ADFA @ case 17
	.4byte _0806AE20 @ case 18
	.4byte _0806AE20 @ case 19
	.4byte _0806AE20 @ case 20
	.4byte _0806AE20 @ case 21
	.4byte _0806AE20 @ case 22
	.4byte _0806AE20 @ case 23
	.4byte _0806AE20 @ case 24
	.4byte _0806AE20 @ case 25
	.4byte _0806AE20 @ case 26
	.4byte _0806AE02 @ case 27
	.4byte _0806AE06 @ case 28
	.4byte _0806AE0A @ case 29
	.4byte _0806AE0E @ case 30
	.4byte _0806AE12 @ case 31
	.4byte _0806AE16 @ case 32
	.4byte _0806AE1A @ case 33
	.4byte _0806AE1E @ case 34
_0806ADC4:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	b _0806AE20
_0806ADCC:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
_0806ADD2:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	b _0806AE20
_0806ADDA:
	ldr r1, _0806ADEC @ =0x083C92D0
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x5a
	ands r0, r1
	cmp r0, #0
	bne _0806AE20
	b _0806AE24
	.align 2, 0
_0806ADEC: .4byte 0x083C92D0
_0806ADF0:
	adds r0, r4, #0
	bl CheckRevealOrDestroyNonBombBlock
	adds r7, r0, #0
	b _0806AE20
_0806ADFA:
	adds r0, r4, #0
	bl CheckRevealOrDestroyNonBombBlock
	b _0806AE24
_0806AE02:
	movs r5, #0
	b _0806AE20
_0806AE06:
	movs r5, #1
	b _0806AE20
_0806AE0A:
	movs r5, #2
	b _0806AE20
_0806AE0E:
	movs r5, #3
	b _0806AE20
_0806AE12:
	movs r5, #4
	b _0806AE20
_0806AE16:
	movs r5, #5
	b _0806AE20
_0806AE1A:
	movs r5, #6
	b _0806AE20
_0806AE1E:
	movs r5, #7
_0806AE20:
	cmp r7, #0
	bne _0806AE28
_0806AE24:
	movs r0, #0
	b _0806AED0
_0806AE28:
	ldr r1, _0806AE40 @ =0x083C92E0
	ldrb r0, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #2
	beq _0806AE56
	cmp r1, #2
	bgt _0806AE44
	cmp r1, #1
	beq _0806AE4E
	b _0806AECE
	.align 2, 0
_0806AE40: .4byte 0x083C92E0
_0806AE44:
	cmp r1, #3
	beq _0806AE64
	cmp r1, #4
	beq _0806AEB0
	b _0806AECE
_0806AE4E:
	adds r0, r4, #0
	bl DestroyNonReformBlocks
	b _0806AEC8
_0806AE56:
	ldrb r0, [r0, #2]
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r3, #0
	bl StoreBrokenReformBlock
	b _0806AEC8
_0806AE64:
	ldr r1, _0806AEA0 @ =0x083C92D0
	ldr r0, _0806AEA4 @ =gCurrentClipdataAffectingAction
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x8a
	ands r0, r1
	cmp r0, #0
	beq _0806AECE
	ldr r2, _0806AEA8 @ =0x03004FB8
	ldr r1, _0806AEAC @ =0x083C93D0
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _0806AECE
	adds r0, r5, #0
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	bl StartBombChain
	cmp r0, #0
	beq _0806AECE
	adds r0, r4, #0
	bl DestroyNonReformBlocks
	b _0806AEC8
	.align 2, 0
_0806AEA0: .4byte 0x083C92D0
_0806AEA4: .4byte gCurrentClipdataAffectingAction
_0806AEA8: .4byte 0x03004FB8
_0806AEAC: .4byte 0x083C93D0
_0806AEB0:
	ldr r1, _0806AED8 @ =0x083C92D0
	ldr r0, _0806AEDC @ =gCurrentClipdataAffectingAction
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0806AECE
	adds r0, r4, #0
	bl RevealHiddenTank
_0806AEC8:
	cmp r0, #0
	beq _0806AECE
	movs r6, #1
_0806AECE:
	adds r0, r6, #0
_0806AED0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806AED8: .4byte 0x083C92D0
_0806AEDC: .4byte gCurrentClipdataAffectingAction

	thumb_func_start DestroyNonReformBlocks
DestroyNonReformBlocks: @ 0x0806AEE0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	ldr r1, _0806AF00 @ =0x083C92E0
	ldrb r0, [r5, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0, #1]
	cmp r4, #4
	bhi _0806AF28
	lsls r0, r4, #2
	ldr r1, _0806AF04 @ =_0806AF08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806AF00: .4byte 0x083C92E0
_0806AF04: .4byte _0806AF08
_0806AF08: @ jump table
	.4byte _0806AF2A @ case 0
	.4byte _0806AF2A @ case 1
	.4byte _0806AF1C @ case 2
	.4byte _0806AF1C @ case 3
	.4byte _0806AF2A @ case 4
_0806AF1C:
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	bl StoreSingleNeverReformBlock
	adds r2, r0, #0
	b _0806AF2A
_0806AF28:
	movs r2, #1
_0806AF2A:
	cmp r2, #0
	bne _0806AF44
	ldr r0, _0806AF40 @ =0x0879BB50
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl _call_via_r1
	movs r0, #1
	b _0806AF46
	.align 2, 0
_0806AF40: .4byte 0x0879BB50
_0806AF44:
	movs r0, #0
_0806AF46:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start DestroyBombChainBlock
DestroyBombChainBlock: @ 0x0806AF4C
	push {r4, r5, r6, lr}
	ldr r3, _0806AFA8 @ =gBackgroundsData
	ldrh r5, [r0, #2]
	ldrh r1, [r3, #0xc]
	muls r1, r5, r1
	ldrh r4, [r0]
	adds r1, r1, r4
	ldr r2, [r3, #8]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r6, [r1]
	ldrh r1, [r3, #0x1c]
	muls r1, r5, r1
	adds r1, r1, r4
	ldr r2, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1]
	ldrh r3, [r0]
	ldrh r1, [r0, #2]
	ldr r2, _0806AFAC @ =0x083C92E0
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #2]
	adds r0, r3, #0
	bl StoreBrokenNonReformBlock
	ldr r2, _0806AFB0 @ =0x03004F60
	lsls r1, r0, #1
	adds r1, r1, r2
	strh r6, [r1]
	ldr r1, _0806AFB4 @ =0x03004EE0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x90
	orrs r1, r2
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AFA8: .4byte gBackgroundsData
_0806AFAC: .4byte 0x083C92E0
_0806AFB0: .4byte 0x03004F60
_0806AFB4: .4byte 0x03004EE0

	thumb_func_start DestroySingleBreakableBlock
DestroySingleBreakableBlock: @ 0x0806AFB8
	push {lr}
	ldr r3, _0806AFE8 @ =gBackgroundsData
	ldrh r2, [r0, #2]
	ldrh r1, [r3, #0x1c]
	muls r1, r2, r1
	ldrh r2, [r0]
	adds r1, r1, r2
	ldr r2, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1]
	ldrh r3, [r0]
	ldrh r1, [r0, #2]
	ldr r2, _0806AFEC @ =0x083C92E0
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #2]
	adds r0, r3, #0
	bl StoreBrokenNonReformBlock
	pop {r0}
	bx r0
	.align 2, 0
_0806AFE8: .4byte gBackgroundsData
_0806AFEC: .4byte 0x083C92E0

	thumb_func_start DestroySquareBlock
DestroySquareBlock: @ 0x0806AFF0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldr r1, _0806B0A4 @ =0x083C92E0
	ldrb r0, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	mov r8, r0
	ldr r5, _0806B0A8 @ =gBackgroundsData
	ldrh r1, [r4, #2]
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r2, r8
	bl StoreBrokenNonReformBlock
	ldrh r0, [r4]
	adds r0, #1
	movs r6, #0
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r6, [r0]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r2, r8
	bl StoreBrokenNonReformBlock
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r6, [r0]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r2, r8
	bl StoreBrokenNonReformBlock
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r6, [r0]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r2, r8
	bl StoreBrokenNonReformBlock
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B0A4: .4byte 0x083C92E0
_0806B0A8: .4byte gBackgroundsData

	thumb_func_start StoreSingleNeverReformBlock
StoreSingleNeverReformBlock: @ 0x0806B0AC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _0806B0C4 @ =gCurrentArea
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #7
	bls _0806B0C8
	movs r0, #0
	b _0806B122
	.align 2, 0
_0806B0C4: .4byte gCurrentArea
_0806B0C8:
	ldrb r1, [r7]
	movs r3, #0xaa
	cmp r1, #0
	beq _0806B0D4
	adds r1, #1
	b _0806B0D6
_0806B0D4:
	lsls r3, r3, #1
_0806B0D6:
	movs r4, #1
	lsls r0, r1, #9
	ldr r1, _0806B0F0 @ =0x02036000
	adds r2, r0, r1
	movs r1, #0
	cmp r1, r3
	bge _0806B104
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0806B0F4
	movs r4, #0
	b _0806B108
	.align 2, 0
_0806B0F0: .4byte 0x02036000
_0806B0F4:
	adds r1, #1
	adds r2, #3
	cmp r1, r3
	bge _0806B104
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0806B0F4
	movs r4, #0
_0806B104:
	cmp r4, #0
	bne _0806B120
_0806B108:
	ldr r0, _0806B128 @ =gCurrentRoom
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	strb r5, [r2]
	strb r6, [r2, #1]
	ldr r0, _0806B12C @ =0x03000033
	ldrb r1, [r7]
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0806B120:
	adds r0, r4, #0
_0806B122:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806B128: .4byte gCurrentRoom
_0806B12C: .4byte 0x03000033

	thumb_func_start RemoveNeverReformBlocks
RemoveNeverReformBlocks: @ 0x0806B130
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0806B160 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806B1EE
	ldr r1, _0806B164 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0806B1EE
	adds r1, r0, #0
	mov ip, r1
	movs r0, #0xaa
	mov sl, r0
	cmp r1, #0
	beq _0806B168
	movs r1, #1
	add ip, r1
	b _0806B16E
	.align 2, 0
_0806B160: .4byte gPauseScreenFlag
_0806B164: .4byte gCurrentArea
_0806B168:
	mov r2, sl
	lsls r2, r2, #1
	mov sl, r2
_0806B16E:
	mov r5, ip
	lsls r0, r5, #9
	ldr r1, _0806B1FC @ =0x02036000
	adds r1, r1, r0
	mov r8, r1
	movs r2, #0
	mov ip, r2
	cmp ip, sl
	bge _0806B1EE
	ldr r5, _0806B200 @ =gBackgroundsData
	mov sb, r5
_0806B184:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0806B1EE
	ldr r2, _0806B204 @ =gCurrentRoom
	ldrb r2, [r2]
	cmp r0, r2
	bne _0806B1E2
	ldrb r1, [r1, #2]
	mov r5, sb
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	mov r1, r8
	ldrb r1, [r1, #1]
	adds r3, r0, r1
	ldr r7, [r5, #0x18]
	lsls r2, r3, #1
	adds r4, r2, r7
	ldrh r0, [r4]
	ldr r5, _0806B208 @ =gTilemapAndClipPointers
	ldr r1, [r5, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r5, #0
	strh r5, [r4]
	mov r1, sb
	ldr r6, [r1, #8]
	adds r2, r2, r6
	strh r5, [r2]
	cmp r0, #0x11
	bne _0806B1E2
	strh r5, [r4, #2]
	strh r5, [r2, #2]
	ldrh r0, [r1, #0x1c]
	adds r3, r3, r0
	lsls r1, r3, #1
	adds r0, r1, r7
	strh r5, [r0]
	adds r1, r1, r6
	strh r5, [r1]
	adds r3, #1
	lsls r1, r3, #1
	adds r0, r1, r7
	strh r5, [r0]
	adds r1, r1, r6
	strh r5, [r1]
_0806B1E2:
	movs r2, #1
	add ip, r2
	movs r5, #3
	add r8, r5
	cmp ip, sl
	blt _0806B184
_0806B1EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B1FC: .4byte 0x02036000
_0806B200: .4byte gBackgroundsData
_0806B204: .4byte gCurrentRoom
_0806B208: .4byte gTilemapAndClipPointers

	thumb_func_start StoreBrokenNonReformBlock
StoreBrokenNonReformBlock: @ 0x0806B20C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r7, #1
	movs r6, #0
	ldr r3, _0806B27C @ =0x03004EE0
	movs r0, #0
	mov sl, r0
	adds r4, r3, #0
	lsls r5, r2, #4
_0806B238:
	ldrb r0, [r3]
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x1c
	cmp r2, #0
	bne _0806B284
	ldr r1, _0806B280 @ =0x03004F60
	lsls r0, r6, #1
	adds r0, r0, r1
	strh r2, [r0]
	mov r1, sb
	strb r1, [r3, #2]
	mov r2, r8
	strb r2, [r3, #3]
	ldrb r0, [r3]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	mov r1, sl
	strb r1, [r3, #1]
	movs r1, #0xf
	ands r0, r1
	orrs r0, r5
	strb r0, [r3]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateBlockAnimation
	movs r7, #0
	b _0806B28E
	.align 2, 0
_0806B27C: .4byte 0x03004EE0
_0806B280: .4byte 0x03004F60
_0806B284:
	adds r3, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #0x1f
	ble _0806B238
_0806B28E:
	movs r2, #4
	cmp r7, #0
	beq _0806B388
	ldr r3, _0806B2F4 @ =0x03004EE0
_0806B296:
	movs r6, #0
	asrs r0, r2, #1
	mov sl, r0
	adds r4, r3, #0
	adds r5, r3, #0
_0806B2A0:
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, r2
	blt _0806B2F8
	lsrs r0, r1, #4
	cmp r0, #9
	beq _0806B2F8
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	movs r0, #0
	str r3, [sp, #4]
	bl SetBg1BlockValue
	mov r1, sb
	strb r1, [r4, #2]
	mov r2, r8
	strb r2, [r4, #3]
	ldrb r0, [r4]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0
	strb r1, [r4, #1]
	ldr r1, [sp]
	lsls r2, r1, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl UpdateBlockAnimation
	movs r7, #0
	ldr r3, [sp, #4]
	b _0806B302
	.align 2, 0
_0806B2F4: .4byte 0x03004EE0
_0806B2F8:
	adds r4, #4
	adds r5, #4
	adds r6, #1
	cmp r6, #0x1f
	ble _0806B2A0
_0806B302:
	mov r2, sl
	cmp r7, #0
	beq _0806B30C
	cmp r2, #0
	bne _0806B296
_0806B30C:
	movs r2, #4
	cmp r7, #0
	beq _0806B388
	ldr r3, _0806B370 @ =0x03004EE0
	movs r0, #0
	mov sl, r0
_0806B318:
	movs r6, #0
	adds r5, r3, #0
	adds r4, r5, #0
_0806B31E:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, r2
	blt _0806B378
	ldr r1, _0806B374 @ =0x03004F60
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	bl SetBg1BlockValue
	mov r1, sb
	strb r1, [r4, #2]
	mov r2, r8
	strb r2, [r4, #3]
	ldrb r0, [r4]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	mov r1, sl
	strb r1, [r4, #1]
	ldr r1, [sp]
	lsls r2, r1, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl UpdateBlockAnimation
	b _0806B388
	.align 2, 0
_0806B370: .4byte 0x03004EE0
_0806B374: .4byte 0x03004F60
_0806B378:
	asrs r2, r2, #1
	adds r4, #4
	adds r5, #4
	adds r6, #1
	cmp r6, #0x1f
	ble _0806B31E
	cmp r7, #0
	bne _0806B318
_0806B388:
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckRevealOrDestroyNonBombBlock
CheckRevealOrDestroyNonBombBlock: @ 0x0806B39C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0806B3C4 @ =0x083C92E0
	ldrb r0, [r5, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #2]
	ldr r1, _0806B3C8 @ =0x083C9374
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _0806B412
	ldr r0, _0806B3CC @ =gCurrentClipdataAffectingAction
	ldrb r0, [r0]
	cmp r0, r1
	bne _0806B3D0
	movs r0, #1
	b _0806B414
	.align 2, 0
_0806B3C4: .4byte 0x083C92E0
_0806B3C8: .4byte 0x083C9374
_0806B3CC: .4byte gCurrentClipdataAffectingAction
_0806B3D0:
	cmp r0, #7
	beq _0806B3E0
	cmp r0, #9
	bne _0806B412
	ldr r0, _0806B41C @ =gCurrentPowerBomb
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	bne _0806B412
_0806B3E0:
	ldr r0, _0806B420 @ =0x083C9388
	lsls r1, r2, #1
	adds r4, r1, r0
	ldrh r0, [r5, #6]
	ldrh r1, [r4]
	cmp r0, r1
	beq _0806B412
	adds r0, r2, #0
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	bl StoreRevealedBlock
	cmp r0, #0
	beq _0806B412
	ldrh r4, [r4]
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetBg1BlockTilemapValue
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetClipdataBlockValue
_0806B412:
	movs r0, #0
_0806B414:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B41C: .4byte gCurrentPowerBomb
_0806B420: .4byte 0x083C9388

	thumb_func_start BlockApplyCCAA
BlockApplyCCAA: @ 0x0806B424
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	mov r0, sp
	strh r5, [r0]
	strh r4, [r0, #2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0806B460
	mov r0, sp
	strh r3, [r0, #6]
	mov r2, sp
	ldr r1, _0806B458 @ =0x083BE3A0
	ldr r0, _0806B45C @ =0x00007FFF
	ands r0, r3
	lsls r0, r0, #1
	b _0806B46C
	.align 2, 0
_0806B458: .4byte 0x083BE3A0
_0806B45C: .4byte 0x00007FFF
_0806B460:
	mov r0, sp
	strh r1, [r0, #6]
	mov r2, sp
	ldr r0, _0806B48C @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r3, #1
_0806B46C:
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r6, #0
	ldr r0, _0806B490 @ =gCurrentClipdataAffectingAction
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xc
	bls _0806B480
	b _0806B57A
_0806B480:
	lsls r0, r0, #2
	ldr r1, _0806B494 @ =_0806B498
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B48C: .4byte gTilemapAndClipPointers
_0806B490: .4byte gCurrentClipdataAffectingAction
_0806B494: .4byte _0806B498
_0806B498: @ jump table
	.4byte _0806B522 @ case 0
	.4byte _0806B53E @ case 1
	.4byte _0806B560 @ case 2
	.4byte _0806B4DC @ case 3
	.4byte _0806B57A @ case 4
	.4byte _0806B4CC @ case 5
	.4byte _0806B4CC @ case 6
	.4byte _0806B4CC @ case 7
	.4byte _0806B4CC @ case 8
	.4byte _0806B4E8 @ case 9
	.4byte _0806B4E8 @ case 10
	.4byte _0806B4FC @ case 11
	.4byte _0806B50C @ case 12
_0806B4CC:
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	bl CheckProjectileHitHatch
	cmp r0, #0
	bne _0806B51E
_0806B4DC:
	mov r0, sp
	bl CheckCCAAOnBlock
	cmp r0, #0
	beq _0806B57A
	b _0806B51E
_0806B4E8:
	mov r0, sp
	bl CheckCCAAOnBlock
	cmp r0, #0
	beq _0806B57A
	ldr r0, _0806B4F8 @ =0x00000129
	b _0806B51A
	.align 2, 0
_0806B4F8: .4byte 0x00000129
_0806B4FC:
	mov r0, sp
	bl CheckCCAAOnBlock
	cmp r0, #0
	beq _0806B57A
	movs r0, #0x95
	lsls r0, r0, #1
	b _0806B51A
_0806B50C:
	mov r0, sp
	bl CheckCCAAOnBlock
	cmp r0, #0
	beq _0806B57A
	movs r0, #0x94
	lsls r0, r0, #1
_0806B51A:
	bl SoundPlayNotAlreadyPlaying
_0806B51E:
	movs r6, #1
	b _0806B57A
_0806B522:
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl UpdateMakeSolidBlocks
	cmp r0, #0
	bne _0806B53A
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetBg1BlockValue
_0806B53A:
	movs r0, #0
	b _0806B550
_0806B53E:
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl UpdateMakeSolidBlocks
	adds r6, r0, #0
	cmp r6, #0
	beq _0806B57A
	ldr r0, _0806B55C @ =0x0000800F
_0806B550:
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetClipdataBlockValue
	b _0806B57A
	.align 2, 0
_0806B55C: .4byte 0x0000800F
_0806B560:
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl UpdateMakeSolidBlocks
	adds r6, r0, #0
	cmp r6, #0
	beq _0806B57A
	ldr r0, _0806B584 @ =0x0000800E
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetClipdataBlockValue
_0806B57A:
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806B584: .4byte 0x0000800E

	thumb_func_start UpdateMakeSolidBlocks
UpdateMakeSolidBlocks: @ 0x0806B588
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r6, #0
	cmp r0, #0
	bne _0806B5E6
	ldr r0, _0806B5C0 @ =0x02035D20
	mov r8, r0
	movs r3, #0x3f
	movs r1, #0x7e
	add r1, r8
	mov ip, r1
	ldrh r2, [r1]
	lsls r1, r7, #8
	adds r0, r1, #0
	orrs r0, r5
	adds r4, r1, #0
	cmp r2, r0
	bne _0806B5C4
	mov r0, ip
	strh r6, [r0]
	b _0806B630
	.align 2, 0
_0806B5C0: .4byte 0x02035D20
_0806B5C4:
	subs r3, #1
	cmp r3, #0
	ble _0806B632
	subs r3, #1
	lsls r0, r3, #1
	mov r1, r8
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r0, r4, #0
	orrs r0, r5
	cmp r1, r0
	bne _0806B5C4
	movs r0, #0
	strh r0, [r2]
	b _0806B630
_0806B5E2:
	movs r3, #0xff
	b _0806B60E
_0806B5E6:
	ldr r0, _0806B5F0 @ =0x02035D20
	mov r8, r0
	movs r3, #0x40
	lsls r4, r7, #8
	b _0806B5FA
	.align 2, 0
_0806B5F0: .4byte 0x02035D20
_0806B5F4:
	subs r3, #1
	cmp r3, #0
	ble _0806B60E
_0806B5FA:
	subs r3, #1
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r0]
	adds r0, r4, #0
	orrs r0, r5
	cmp r1, r0
	beq _0806B5E2
	cmp r1, #0
	bne _0806B5F4
_0806B60E:
	movs r6, #0
	cmp r3, #0xff
	beq _0806B632
	ldr r1, _0806B640 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	muls r0, r5, r0
	adds r0, r0, r7
	ldr r1, [r1, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _0806B632
	lsls r0, r3, #1
	add r0, r8
	orrs r4, r5
	strh r4, [r0]
_0806B630:
	movs r6, #1
_0806B632:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806B640: .4byte gBackgroundsData

	thumb_func_start SamusApplyScrewSpeedboosterDamageToEnvironment
SamusApplyScrewSpeedboosterDamageToEnvironment: @ 0x0806B644
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsrs r7, r0, #0x16
	lsrs r6, r1, #0x16
	ldr r0, _0806B670 @ =gBackgroundsData
	adds r2, r0, #0
	ldrh r0, [r2, #0x1c]
	cmp r7, r0
	bhs _0806B69C
	ldrh r1, [r2, #0x1e]
	cmp r6, r1
	bhs _0806B69C
	cmp r5, #1
	bne _0806B678
	ldr r1, _0806B674 @ =gCurrentClipdataAffectingAction
	movs r0, #0xa
	b _0806B6A4
	.align 2, 0
_0806B670: .4byte gBackgroundsData
_0806B674: .4byte gCurrentClipdataAffectingAction
_0806B678:
	cmp r5, #2
	bne _0806B688
	ldr r1, _0806B684 @ =gCurrentClipdataAffectingAction
	movs r0, #0xc
	b _0806B6A4
	.align 2, 0
_0806B684: .4byte gCurrentClipdataAffectingAction
_0806B688:
	cmp r5, #3
	bne _0806B698
	ldr r1, _0806B694 @ =gCurrentClipdataAffectingAction
	movs r0, #0xc
	b _0806B6A4
	.align 2, 0
_0806B694: .4byte gCurrentClipdataAffectingAction
_0806B698:
	cmp r5, #4
	beq _0806B6A0
_0806B69C:
	movs r0, #0
	b _0806B6EE
_0806B6A0:
	ldr r1, _0806B6F8 @ =gCurrentClipdataAffectingAction
	movs r0, #0xb
_0806B6A4:
	strb r0, [r1]
	ldrh r0, [r2, #0x1c]
	adds r1, r6, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	lsls r0, r0, #0x10
	ldr r1, [r2, #0x18]
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq _0806B6E6
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl BlockApplyCCAA
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0
	bne _0806B6E6
	cmp r5, #3
	bne _0806B6E6
	ldr r1, _0806B6F8 @ =gCurrentClipdataAffectingAction
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl BlockApplyCCAA
_0806B6E6:
	ldr r1, _0806B6F8 @ =gCurrentClipdataAffectingAction
	movs r0, #0
	strb r0, [r1]
	mov r0, r8
_0806B6EE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806B6F8: .4byte gCurrentClipdataAffectingAction

	thumb_func_start UpdateBrokenBlocks
UpdateBrokenBlocks: @ 0x0806B6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0806B76C @ =0x03004E60
	movs r7, #0
	movs r0, #0xf
	mov sb, r0
_0806B70C:
	ldrb r0, [r4]
	movs r3, #0xf
	ands r3, r0
	cmp r3, #0
	beq _0806B7FA
	cmp r3, #0xf
	beq _0806B7FA
	ldrb r2, [r4, #1]
	adds r2, #1
	strb r2, [r4, #1]
	ldr r1, _0806B770 @ =0x083C939C
	mov r8, r1
	ldr r0, [r4]
	lsls r1, r0, #0x1c
	lsrs r1, r1, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	movs r6, #0xd
	muls r0, r6, r0
	adds r1, r1, r0
	add r1, r8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r1, [r1]
	cmp r2, r1
	blo _0806B7FA
	movs r5, #0
	strb r5, [r4, #1]
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xc
	bls _0806B798
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	bl CheckSamusInReformingBlock
	cmp r0, #0
	beq _0806B774
	ldrb r0, [r4]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	b _0806B7CE
	.align 2, 0
_0806B76C: .4byte 0x03004E60
_0806B770: .4byte 0x083C939C
_0806B774:
	ldrb r0, [r4]
	mov r3, sb
	orrs r0, r3
	strb r0, [r4]
	ldr r1, _0806B794 @ =0x083C9388
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	bl SetClipdataBlockValue
	b _0806B7CE
	.align 2, 0
_0806B794: .4byte 0x083C9388
_0806B798:
	cmp r3, #7
	bne _0806B7C0
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	bl CheckSamusInReformingBlock
	cmp r0, #0
	beq _0806B7D2
	ldr r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	muls r1, r6, r1
	adds r0, r0, r1
	add r0, r8
	ldrb r0, [r0]
	lsrs r0, r0, #1
	strb r0, [r4, #1]
	b _0806B7CE
_0806B7C0:
	cmp r3, #1
	bne _0806B7CC
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	bl ClearBg1BlockValue
_0806B7CC:
	movs r5, #1
_0806B7CE:
	cmp r5, #0
	beq _0806B7FA
_0806B7D2:
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, #1
	mov r1, sb
	ands r0, r1
	ldrb r1, [r4]
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	lsls r0, r7, #2
	ldr r1, _0806B810 @ =0x03004E60
	adds r0, r0, r1
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	bl UpdateBlockAnimation
_0806B7FA:
	adds r7, #1
	adds r4, #4
	cmp r7, #0x1f
	ble _0806B70C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B810: .4byte 0x03004E60

	thumb_func_start UpdateNonReformBlocksAnimation
UpdateNonReformBlocksAnimation: @ 0x0806B814
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0806B88C @ =0x03004EE0
	movs r7, #0
	movs r0, #0xf
	mov r8, r0
_0806B822:
	ldrb r2, [r4]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _0806B87A
	cmp r0, #0xf
	beq _0806B87A
	ldrb r0, [r4, #1]
	adds r0, #1
	movs r5, #0
	strb r0, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0806B87A
	strb r5, [r4, #1]
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r1, #1
	mov r0, r8
	ands r1, r0
	movs r6, #0x10
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateBlockAnimation
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	bls _0806B87A
	ldrb r1, [r4]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r4]
	strb r5, [r4, #2]
	strb r5, [r4, #3]
_0806B87A:
	adds r7, #1
	adds r4, #4
	cmp r7, #0x1f
	ble _0806B822
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B88C: .4byte 0x03004EE0

	thumb_func_start unk_6b890
unk_6b890: @ 0x0806B890
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806B8BC @ =0x03004E60
_0806B896:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _0806B8AE
	lsrs r0, r0, #0x1c
	cmp r0, #0xf
	beq _0806B8AE
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateBlockAnimation
_0806B8AE:
	adds r4, #4
	adds r5, #1
	cmp r5, #0x1f
	ble _0806B896
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B8BC: .4byte 0x03004E60

	thumb_func_start UpdateBlockAnimation
UpdateBlockAnimation: @ 0x0806B8C0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r5, #0
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xd
	bhi _0806B974
	lsls r0, r0, #2
	ldr r1, _0806B8E0 @ =_0806B8E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B8E0: .4byte _0806B8E4
_0806B8E4: @ jump table
	.4byte _0806B974 @ case 0
	.4byte _0806B974 @ case 1
	.4byte _0806B91C @ case 2
	.4byte _0806B930 @ case 3
	.4byte _0806B938 @ case 4
	.4byte _0806B940 @ case 5
	.4byte _0806B948 @ case 6
	.4byte _0806B950 @ case 7
	.4byte _0806B948 @ case 8
	.4byte _0806B940 @ case 9
	.4byte _0806B938 @ case 10
	.4byte _0806B930 @ case 11
	.4byte _0806B91C @ case 12
	.4byte _0806B974 @ case 13
_0806B91C:
	ldr r1, _0806B92C @ =0x083C9388
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	b _0806B974
	.align 2, 0
_0806B92C: .4byte 0x083C9388
_0806B930:
	ldr r5, _0806B934 @ =0x00008001
	b _0806B978
	.align 2, 0
_0806B934: .4byte 0x00008001
_0806B938:
	ldr r5, _0806B93C @ =0x00008002
	b _0806B978
	.align 2, 0
_0806B93C: .4byte 0x00008002
_0806B940:
	ldr r5, _0806B944 @ =0x00008003
	b _0806B978
	.align 2, 0
_0806B944: .4byte 0x00008003
_0806B948:
	ldr r5, _0806B94C @ =0x00008004
	b _0806B978
	.align 2, 0
_0806B94C: .4byte 0x00008004
_0806B950:
	ldrb r1, [r4]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x90
	bne _0806B970
	ldr r0, _0806B96C @ =0x03004F60
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _0806B974
	.align 2, 0
_0806B96C: .4byte 0x03004F60
_0806B970:
	movs r5, #0x80
	lsls r5, r5, #8
_0806B974:
	cmp r5, #0
	beq _0806BA36
_0806B978:
	ldr r2, _0806B9E8 @ =gBackgroundsData
	ldrb r1, [r4, #3]
	ldrh r0, [r2, #0xc]
	muls r0, r1, r0
	ldrb r1, [r4, #2]
	adds r0, r0, r1
	ldr r1, [r2, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	ldr r0, _0806B9EC @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r3, r0, #6
	subs r0, r3, #4
	ldrb r2, [r4, #3]
	cmp r0, r2
	bgt _0806BA36
	adds r0, #0x11
	cmp r2, r0
	bgt _0806BA36
	ldr r0, _0806B9F0 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r3, r0, #6
	subs r0, r3, #4
	ldrb r1, [r4, #2]
	cmp r0, r1
	bgt _0806BA36
	adds r0, #0x16
	cmp r1, r0
	bgt _0806BA36
	ldr r4, _0806B9F4 @ =0x06001000
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0806B9C0
	ldr r4, _0806B9F8 @ =0x06001800
_0806B9C0:
	movs r0, #0xf
	ands r1, r0
	lsls r3, r1, #1
	ands r2, r0
	lsls r0, r2, #6
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0806BA04
	ldr r0, _0806B9FC @ =0x00007FFF
	ands r0, r5
	lsls r3, r0, #2
	ldr r1, _0806BA00 @ =0x083BE740
	lsls r0, r0, #3
	b _0806BA0C
	.align 2, 0
_0806B9E8: .4byte gBackgroundsData
_0806B9EC: .4byte gBg1YPosition
_0806B9F0: .4byte gBg1XPosition
_0806B9F4: .4byte 0x06001000
_0806B9F8: .4byte 0x06001800
_0806B9FC: .4byte 0x00007FFF
_0806BA00: .4byte 0x083BE740
_0806BA04:
	lsls r3, r5, #2
	ldr r0, _0806BA3C @ =gTilemapAndClipPointers
	ldr r1, [r0]
	lsls r0, r5, #3
_0806BA0C:
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r3, #1
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #2]
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x40
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r3, #1
	adds r2, #2
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_0806BA36:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA3C: .4byte gTilemapAndClipPointers

	thumb_func_start StoreBrokenReformBlock
StoreBrokenReformBlock: @ 0x0806BA40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r5, #0
	movs r6, #0
	ldr r4, _0806BA7C @ =0x03004E60
	adds r2, r4, #0
_0806BA62:
	ldrb r0, [r2, #2]
	cmp r0, ip
	bne _0806BA88
	ldrb r0, [r2, #3]
	cmp r0, r7
	bne _0806BA88
	ldrb r0, [r2]
	lsls r1, r0, #0x1c
	lsrs r0, r1, #0x1c
	cmp r0, #0xf
	bne _0806BA80
	movs r5, #1
	b _0806BAA2
	.align 2, 0
_0806BA7C: .4byte 0x03004E60
_0806BA80:
	cmp r1, #0
	beq _0806BA9A
	movs r5, #0
	b _0806BAA2
_0806BA88:
	ldrb r0, [r2]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _0806BA96
	lsrs r0, r0, #0x1c
	cmp r0, #0xf
	bne _0806BA9A
_0806BA96:
	movs r5, #0x80
	orrs r5, r6
_0806BA9A:
	adds r2, #4
	adds r6, #1
	cmp r6, #0x1f
	ble _0806BA62
_0806BAA2:
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	beq _0806BABA
	movs r6, #0x7f
	ands r6, r5
	lsls r0, r6, #2
	adds r0, r0, r4
	mov r1, ip
	strb r1, [r0, #2]
	strb r7, [r0, #3]
	movs r5, #1
_0806BABA:
	cmp r5, #0
	beq _0806BAF2
	lsls r0, r6, #2
	adds r4, r0, r4
	movs r0, #0
	strb r0, [r4, #1]
	mov r1, r8
	lsls r0, r1, #4
	movs r1, #1
	orrs r1, r0
	strb r1, [r4]
	cmp r3, #0
	bne _0806BAF2
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4]
	adds r0, r7, #0
	mov r1, ip
	bl ClearBg1BlockValue
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateBlockAnimation
_0806BAF2:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StoreRevealedBlock
StoreRevealedBlock: @ 0x0806BB00
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r4, #0
	movs r2, #0
	ldr r7, _0806BB34 @ =0x03004E60
	adds r1, r7, #0
_0806BB18:
	ldrb r0, [r1, #2]
	cmp r0, r6
	bne _0806BB40
	ldrb r0, [r1, #3]
	cmp r0, r5
	bne _0806BB40
	ldrb r0, [r1]
	lsls r3, r0, #0x1c
	lsrs r0, r3, #0x1c
	cmp r0, #0xf
	bne _0806BB38
	movs r4, #1
	b _0806BB5A
	.align 2, 0
_0806BB34: .4byte 0x03004E60
_0806BB38:
	cmp r3, #0
	beq _0806BB52
	movs r4, #0
	b _0806BB5A
_0806BB40:
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _0806BB4E
	lsrs r0, r0, #0x1c
	cmp r0, #0xf
	bne _0806BB52
_0806BB4E:
	movs r4, #0x80
	orrs r4, r2
_0806BB52:
	adds r1, #4
	adds r2, #1
	cmp r2, #0x1f
	ble _0806BB18
_0806BB5A:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0806BB70
	movs r2, #0x7f
	ands r2, r4
	lsls r0, r2, #2
	adds r0, r0, r7
	strb r6, [r0, #2]
	strb r5, [r0, #3]
	movs r4, #1
_0806BB70:
	cmp r4, #0
	beq _0806BB86
	lsls r1, r2, #2
	adds r1, r1, r7
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, ip
	lsls r2, r0, #4
	movs r0, #0xf
	orrs r0, r2
	strb r0, [r1]
_0806BB86:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckSamusInReformingBlock
CheckSamusInReformingBlock: @ 0x0806BB90
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0806BBE8 @ =gSamusData
	ldrh r3, [r2, #0x16]
	lsrs r3, r3, #6
	mov r4, sp
	movs r6, #0x26
	ldrsh r0, [r2, r6]
	ldrh r6, [r2, #0x18]
	adds r0, r0, r6
	asrs r0, r0, #6
	strh r0, [r4]
	movs r6, #0x2a
	ldrsh r0, [r2, r6]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	asrs r2, r0, #6
	strh r2, [r4, #2]
	movs r4, #0
	cmp r3, r1
	bne _0806BBC4
	movs r4, #1
_0806BBC4:
	movs r1, #0
	mov r0, sp
	ldrh r0, [r0]
	cmp r5, r0
	blo _0806BBD8
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _0806BBD8
	movs r1, #1
_0806BBD8:
	movs r0, #0
	cmp r4, #0
	beq _0806BBE0
	adds r0, r1, #0
_0806BBE0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806BBE8: .4byte gSamusData

	thumb_func_start StartBombChain
StartBombChain: @ 0x0806BBEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov ip, r2
	movs r5, #0
	movs r3, #4
	ldr r2, _0806BC54 @ =0x03004FA8
	movs r4, #7
	ands r4, r0
	movs r1, #8
	rsbs r1, r1, #0
	mov sb, r1
	ldr r6, _0806BC58 @ =0x03004FB8
	ldr r1, _0806BC5C @ =0x083C93D0
	adds r2, #0x10
	lsls r0, r0, #2
	adds r7, r0, r1
_0806BC1E:
	subs r2, #4
	subs r3, #1
	ldrb r0, [r2]
	cmp r0, #0
	bne _0806BC60
	movs r0, #1
	strb r0, [r2]
	mov r0, r8
	strb r0, [r2, #1]
	mov r1, ip
	strb r1, [r2, #2]
	ldrb r0, [r2, #3]
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r1, sb
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #3]
	ldrb r0, [r6]
	ldrb r1, [r7]
	orrs r0, r1
	strb r0, [r6]
	movs r5, #1
	b _0806BC64
	.align 2, 0
_0806BC54: .4byte 0x03004FA8
_0806BC58: .4byte 0x03004FB8
_0806BC5C: .4byte 0x083C93D0
_0806BC60:
	cmp r3, #0
	bgt _0806BC1E
_0806BC64:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UpdateBombChains
UpdateBombChains: @ 0x0806BC74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0806BCE8 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r6, #3
	ands r6, r0
	ldr r1, _0806BCEC @ =0x03004FA8
	lsls r0, r6, #2
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806BC8E
	b _0806BF04
_0806BC8E:
	movs r5, #0
	ldrb r0, [r4, #3]
	lsls r3, r0, #0x1d
	lsrs r0, r3, #0x1d
	cmp r0, #3
	bls _0806BC9C
	movs r5, #1
_0806BC9C:
	mov r2, sp
	ldr r1, _0806BCF0 @ =0x083C93D0
	lsrs r0, r3, #0x1b
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	movs r1, #0
	strh r0, [r2, #4]
	mov r0, sp
	strh r1, [r0, #6]
	mov r1, sp
	ldrb r0, [r0, #4]
	subs r0, #0x10
	strb r0, [r1, #8]
	movs r7, #0
	cmp r5, #0
	beq _0806BCBE
	b _0806BDC0
_0806BCBE:
	ldrb r0, [r4, #1]
	strh r0, [r1]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _0806BD4A
	mov r0, sp
	ldrb r1, [r4, #2]
	ldrb r2, [r4]
	subs r1, r1, r2
	strh r1, [r0, #2]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _0806BCF4
	ldrb r1, [r4, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	b _0806BD4A
	.align 2, 0
_0806BCE8: .4byte gFrameCounter8Bit
_0806BCEC: .4byte 0x03004FA8
_0806BCF0: .4byte 0x083C93D0
_0806BCF4:
	ldr r3, _0806BD28 @ =gBackgroundsData
	mov r0, sp
	ldrh r2, [r0, #2]
	ldrh r0, [r3, #0x1c]
	mov r1, sp
	muls r0, r2, r0
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, sp
	ldr r0, _0806BD2C @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0806BD30
	mov r0, sp
	bl DestroyNonReformBlocks
	movs r7, #1
	b _0806BD4A
	.align 2, 0
_0806BD28: .4byte gBackgroundsData
_0806BD2C: .4byte gTilemapAndClipPointers
_0806BD30:
	ldrb r1, [r4, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	bl CheckStartNewSubBombChain
_0806BD4A:
	ldr r0, _0806BDB4 @ =0x03004FA8
	lsls r1, r6, #2
	adds r4, r1, r0
	ldrb r0, [r4, #3]
	lsrs r0, r0, #7
	adds r5, r1, #0
	cmp r0, #0
	bne _0806BD5C
	b _0806BEC4
_0806BD5C:
	mov r2, sp
	ldrb r0, [r4, #2]
	ldrb r1, [r4]
	adds r0, r0, r1
	strh r0, [r2, #2]
	mov r0, sp
	ldrh r2, [r0, #2]
	ldr r3, _0806BDB8 @ =gBackgroundsData
	ldrh r0, [r3, #0x1e]
	subs r0, #2
	cmp r2, r0
	bge _0806BE6A
	ldrh r0, [r3, #0x1c]
	mov r1, sp
	muls r0, r2, r0
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, sp
	ldr r0, _0806BDBC @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0806BD9A
	b _0806BE9E
_0806BD9A:
	ldrb r1, [r4, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	bl CheckStartNewSubBombChain
	b _0806BEC4
	.align 2, 0
_0806BDB4: .4byte 0x03004FA8
_0806BDB8: .4byte gBackgroundsData
_0806BDBC: .4byte gTilemapAndClipPointers
_0806BDC0:
	mov r1, sp
	ldrb r0, [r4, #2]
	strh r0, [r1, #2]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _0806BE42
	mov r0, sp
	ldrb r1, [r4, #1]
	ldrb r2, [r4]
	subs r1, r1, r2
	strh r1, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _0806BDEC
	ldrb r1, [r4, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	b _0806BE42
_0806BDEC:
	ldr r3, _0806BE20 @ =gBackgroundsData
	mov r0, sp
	ldrh r2, [r0, #2]
	ldrh r0, [r3, #0x1c]
	mov r1, sp
	muls r0, r2, r0
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, sp
	ldr r0, _0806BE24 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0806BE28
	mov r0, sp
	bl DestroyNonReformBlocks
	movs r7, #1
	b _0806BE42
	.align 2, 0
_0806BE20: .4byte gBackgroundsData
_0806BE24: .4byte gTilemapAndClipPointers
_0806BE28:
	ldrb r1, [r4, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #2
	bl CheckStartNewSubBombChain
_0806BE42:
	ldr r0, _0806BE74 @ =0x03004FA8
	lsls r1, r6, #2
	adds r4, r1, r0
	ldrb r0, [r4, #3]
	lsrs r0, r0, #7
	adds r5, r1, #0
	cmp r0, #0
	beq _0806BEC4
	mov r2, sp
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	adds r0, r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r0]
	ldr r3, _0806BE78 @ =gBackgroundsData
	ldrh r1, [r3, #0x1c]
	subs r0, r1, #2
	cmp r2, r0
	blt _0806BE7C
_0806BE6A:
	ldrb r1, [r4, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #3]
	b _0806BEC4
	.align 2, 0
_0806BE74: .4byte 0x03004FA8
_0806BE78: .4byte gBackgroundsData
_0806BE7C:
	mov r0, sp
	ldrh r0, [r0, #2]
	muls r0, r1, r0
	adds r0, r0, r2
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, sp
	ldr r0, _0806BEA8 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0806BEAC
_0806BE9E:
	mov r0, sp
	bl DestroyNonReformBlocks
	movs r7, #1
	b _0806BEC4
	.align 2, 0
_0806BEA8: .4byte gTilemapAndClipPointers
_0806BEAC:
	ldrb r1, [r4, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	bl CheckStartNewSubBombChain
_0806BEC4:
	ldr r0, _0806BEE0 @ =0x03004FA8
	adds r1, r5, r0
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x19
	cmp r0, #0
	blt _0806BED6
	lsrs r0, r3, #7
	cmp r0, #0
	beq _0806BEE4
_0806BED6:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0806BEF8
	.align 2, 0
_0806BEE0: .4byte 0x03004FA8
_0806BEE4:
	strb r0, [r1]
	ldr r2, _0806BF0C @ =0x03004FB8
	ldr r1, _0806BF10 @ =0x083C93D0
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1b
	adds r0, r0, r1
	ldrb r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_0806BEF8:
	cmp r7, #0
	beq _0806BF04
	movs r0, #0x94
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0806BF04:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BF0C: .4byte 0x03004FB8
_0806BF10: .4byte 0x083C93D0

	thumb_func_start CheckStartNewSubBombChain
CheckStartNewSubBombChain: @ 0x0806BF14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, _0806BFB8 @ =gCurrentClipdataAffectingAction
	movs r0, #0xd
	strb r0, [r1]
	ldr r4, _0806BFBC @ =gBackgroundsData
	ldrh r0, [r4, #0x1c]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sb
	ldr r1, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0806BF54
	mov r0, r8
	mov r1, sb
	bl BlockApplyCCAA
_0806BF54:
	movs r6, #0
	mov sl, r4
	lsls r7, r5, #2
	ldr r2, _0806BFC0 @ =0x083C9414
	adds r5, r7, r2
_0806BF5E:
	lsls r0, r6, #1
	adds r1, r7, #1
	adds r0, r0, r1
	ldr r1, _0806BFC0 @ =0x083C9414
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	adds r4, r2, r0
	mov r1, sl
	ldrh r0, [r1, #0x1c]
	muls r0, r4, r0
	movs r1, #0
	ldrsb r1, [r5, r1]
	mov r2, sb
	adds r3, r2, r1
	adds r0, r0, r3
	mov r2, sl
	ldr r1, [r2, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0806BF9C
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	bl BlockApplyCCAA
_0806BF9C:
	adds r5, #2
	adds r6, #1
	cmp r6, #1
	ble _0806BF5E
	ldr r1, _0806BFB8 @ =gCurrentClipdataAffectingAction
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BFB8: .4byte gCurrentClipdataAffectingAction
_0806BFBC: .4byte gBackgroundsData
_0806BFC0: .4byte 0x083C9414

	thumb_func_start CheckTouchingSpecialClipdata
CheckTouchingSpecialClipdata: @ 0x0806BFC4
	push {lr}
	movs r0, #0
	bl CheckGrabbingCrumbleBlock
	ldr r0, _0806BFDC @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	bne _0806BFE0
	bl CheckTouchingTransitionOnElevator
	b _0806BFFC
	.align 2, 0
_0806BFDC: .4byte gSamusData
_0806BFE0:
	ldr r0, _0806C000 @ =gDisableDoorsAndTanks
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806BFFC
	ldr r0, _0806C004 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806BFF8
	bl CheckTouchingTransitionOrTank
_0806BFF8:
	bl CheckWalkingOnCrumbleBlock
_0806BFFC:
	pop {r0}
	bx r0
	.align 2, 0
_0806C000: .4byte gDisableDoorsAndTanks
_0806C004: .4byte gFrameCounter8Bit

	thumb_func_start CheckWalkingOnCrumbleBlock
CheckWalkingOnCrumbleBlock: @ 0x0806C008
	push {r4, r5, r6, lr}
	ldr r2, _0806C060 @ =gSamusData
	ldrh r1, [r2, #0x16]
	movs r3, #0x28
	ldrsh r0, [r2, r3]
	adds r0, r1, r0
	asrs r5, r0, #6
	ldr r3, _0806C064 @ =gBackgroundsData
	ldrh r0, [r3, #0x1c]
	cmp r5, r0
	ble _0806C020
	adds r5, r0, #0
_0806C020:
	movs r4, #0x24
	ldrsh r0, [r2, r4]
	adds r0, r1, r0
	cmp r0, #0
	bge _0806C02C
	movs r0, #0
_0806C02C:
	asrs r1, r0, #6
	movs r4, #0x2a
	ldrsh r0, [r2, r4]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	adds r0, #2
	asrs r0, r0, #6
	ldrh r2, [r3, #0x1e]
	cmp r0, r2
	ble _0806C042
	adds r0, r2, #0
_0806C042:
	adds r4, r1, #0
	cmp r4, r5
	bgt _0806C05A
	lsls r6, r0, #0x10
_0806C04A:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	lsrs r0, r6, #0x10
	bl CheckOnCrumbleBlock
	adds r4, #1
	cmp r4, r5
	ble _0806C04A
_0806C05A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C060: .4byte gSamusData
_0806C064: .4byte gBackgroundsData

	thumb_func_start CheckTouchingTransitionOnElevator
CheckTouchingTransitionOnElevator: @ 0x0806C068
	push {r4, r5, r6, r7, lr}
	ldr r2, _0806C0A0 @ =gSamusData
	ldrh r1, [r2, #0x14]
	movs r0, #0x40
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r7, r0, #0x1f
	ldrh r3, [r2, #0x16]
	ldr r1, _0806C0A4 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	lsls r0, r0, #6
	adds r6, r1, #0
	cmp r3, r0
	ble _0806C088
	adds r3, r0, #0
_0806C088:
	lsls r0, r3, #0xa
	lsrs r5, r0, #0x10
	cmp r7, #0
	bne _0806C0A8
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	adds r3, r0, #0
	adds r3, #0x80
	b _0806C0B4
	.align 2, 0
_0806C0A0: .4byte gSamusData
_0806C0A4: .4byte gBackgroundsData
_0806C0A8:
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	adds r3, r0, #0
	subs r3, #0x80
_0806C0B4:
	lsls r0, r3, #0x10
	lsrs r1, r0, #0x10
	cmp r3, #0
	bge _0806C0C0
	movs r1, #0
	b _0806C0CC
_0806C0C0:
	ldrh r2, [r6, #0x1e]
	lsls r0, r2, #6
	cmp r1, r0
	ble _0806C0CC
	lsls r0, r2, #0x16
	lsrs r1, r0, #0x10
_0806C0CC:
	lsrs r4, r1, #6
	ldrh r0, [r6, #0x1c]
	muls r0, r4, r0
	adds r0, r0, r5
	ldr r1, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806C0F8
	ldr r1, _0806C0F0 @ =0x083BE3A0
	ldr r0, _0806C0F4 @ =0x00007FFF
	ands r0, r3
	lsls r0, r0, #1
	b _0806C0FE
	.align 2, 0
_0806C0F0: .4byte 0x083BE3A0
_0806C0F4: .4byte 0x00007FFF
_0806C0F8:
	ldr r0, _0806C110 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r3, #1
_0806C0FE:
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0
	cmp r7, #0
	bne _0806C114
	cmp r1, #4
	bne _0806C11A
	b _0806C11E
	.align 2, 0
_0806C110: .4byte gTilemapAndClipPointers
_0806C114:
	cmp r1, #5
	bne _0806C11A
	movs r3, #1
_0806C11A:
	cmp r3, #0
	beq _0806C132
_0806C11E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CheckEnterAreaConnection
	cmp r0, #0
	bne _0806C132
	adds r0, r4, #0
	adds r1, r5, #0
	bl CheckEnterDoor
_0806C132:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CheckTouchingTransitionOrTank
CheckTouchingTransitionOrTank: @ 0x0806C138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r1, _0806C15C @ =gSamusData
	ldrh r0, [r1, #0x28]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	ldrh r2, [r1, #0x16]
	adds r4, r0, r2
	adds r3, r1, #0
	cmp r4, #0
	bge _0806C164
	movs r4, #0
	ldr r5, _0806C160 @ =gBackgroundsData
	b _0806C172
	.align 2, 0
_0806C15C: .4byte gSamusData
_0806C160: .4byte gBackgroundsData
_0806C164:
	ldr r1, _0806C188 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	lsls r0, r0, #6
	adds r5, r1, #0
	cmp r4, r0
	ble _0806C172
	adds r4, r0, #0
_0806C172:
	asrs r0, r4, #6
	str r0, [sp, #0x28]
	ldrh r0, [r3, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	ldrh r1, [r3, #0x16]
	adds r4, r0, r1
	cmp r4, #0
	bge _0806C18C
	movs r4, #0
	b _0806C196
	.align 2, 0
_0806C188: .4byte gBackgroundsData
_0806C18C:
	ldrh r0, [r5, #0x1c]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C196
	adds r4, r0, #0
_0806C196:
	add r1, sp, #0x28
	asrs r0, r4, #6
	str r0, [r1, #4]
	ldrh r4, [r3, #0x16]
	ldrh r0, [r5, #0x1c]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C1A8
	adds r4, r0, #0
_0806C1A8:
	asrs r0, r4, #6
	str r0, [sp, #0x30]
	ldrh r0, [r3, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	ldrh r2, [r3, #0x18]
	adds r4, r0, r2
	cmp r4, #0
	bge _0806C1BE
	movs r4, #0
	b _0806C1C8
_0806C1BE:
	ldrh r0, [r5, #0x1e]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C1C8
	adds r4, r0, #0
_0806C1C8:
	asrs r0, r4, #6
	str r0, [sp, #0x1c]
	ldrh r0, [r3, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	ldrh r1, [r3, #0x18]
	adds r4, r0, r1
	cmp r4, #0
	bge _0806C1DE
	movs r4, #0
	b _0806C1E8
_0806C1DE:
	ldrh r0, [r5, #0x1e]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C1E8
	adds r4, r0, #0
_0806C1E8:
	add r2, sp, #0x1c
	asrs r0, r4, #6
	str r0, [r2, #4]
	ldrh r0, [r3, #0x26]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x12
	asrs r0, r0, #0x11
	adds r1, r1, r0
	ldrh r3, [r3, #0x18]
	adds r4, r1, r3
	cmp r4, #0
	bge _0806C204
	movs r4, #0
	b _0806C20E
_0806C204:
	ldrh r0, [r5, #0x1e]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C20E
	adds r4, r0, #0
_0806C20E:
	asrs r0, r4, #6
	str r0, [sp, #0x24]
	ldr r0, _0806C244 @ =gBackgroundsData
	ldrh r7, [r0, #0x1c]
	ldr r6, [r0, #0x18]
	ldr r2, _0806C248 @ =0x083BE3A0
	mov r8, r2
	add r2, sp, #0xc
	add r3, sp, #0x28
	movs r5, #1
_0806C222:
	ldr r0, [sp, #0x1c]
	muls r0, r7, r0
	ldr r1, [r3]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0806C250
	ldr r0, _0806C24C @ =0x00007FFF
	ands r0, r4
	lsls r0, r0, #1
	add r0, r8
	b _0806C258
	.align 2, 0
_0806C244: .4byte gBackgroundsData
_0806C248: .4byte 0x083BE3A0
_0806C24C: .4byte 0x00007FFF
_0806C250:
	ldr r0, _0806C2B4 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r4, #1
	adds r0, r0, r1
_0806C258:
	ldrh r0, [r0]
	str r0, [r2]
	adds r2, #4
	adds r3, #4
	subs r5, #1
	cmp r5, #0
	bge _0806C222
	movs r5, #0
	ldr r0, _0806C2B8 @ =gBackgroundsData
	ldrh r1, [r0, #0x1c]
	mov r8, r1
	add r7, sp, #0x1c
	ldr r6, [r0, #0x18]
	ldr r2, _0806C2BC @ =0x083BE3A0
	mov sb, r2
_0806C276:
	adds r2, r5, #1
	lsls r0, r2, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r1, [sp, #0x30]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	adds r3, r2, #0
	cmp r0, #0
	beq _0806C2C4
	adds r0, r5, #2
	lsls r0, r0, #2
	mov r1, sp
	adds r1, r1, r0
	adds r1, #0xc
	ldr r0, _0806C2C0 @ =0x00007FFF
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	str r0, [r1]
	b _0806C2DA
	.align 2, 0
_0806C2B4: .4byte gTilemapAndClipPointers
_0806C2B8: .4byte gBackgroundsData
_0806C2BC: .4byte 0x083BE3A0
_0806C2C0: .4byte 0x00007FFF
_0806C2C4:
	adds r0, r5, #2
	lsls r0, r0, #2
	mov r2, sp
	adds r2, r2, r0
	adds r2, #0xc
	ldr r0, _0806C2F0 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r2]
_0806C2DA:
	adds r5, r3, #0
	cmp r5, #1
	ble _0806C276
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bne _0806C2F4
	movs r4, #0
	b _0806C310
	.align 2, 0
_0806C2F0: .4byte gTilemapAndClipPointers
_0806C2F4:
	ldr r0, [sp, #0x10]
	cmp r0, #3
	bne _0806C2FE
	movs r4, #1
	b _0806C310
_0806C2FE:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	bne _0806C308
	movs r4, #2
	b _0806C310
_0806C308:
	ldr r0, [sp, #0x18]
	cmp r0, #5
	bne _0806C310
	movs r4, #3
_0806C310:
	adds r0, r4, #1
	cmp r0, #0
	beq _0806C350
	ldr r1, _0806C34C @ =0x083C9424
	lsls r2, r4, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	mov r5, sp
	adds r5, r5, r0
	adds r5, #0x1c
	ldrh r0, [r5]
	adds r1, #1
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #2
	mov r4, sp
	adds r4, r4, r1
	adds r4, #0x28
	ldrh r1, [r4]
	bl CheckEnterDoor
	cmp r0, #0
	beq _0806C342
	b _0806C47A
_0806C342:
	ldrh r0, [r5]
	ldrh r1, [r4]
	bl CheckEnterAreaConnection
	b _0806C47A
	.align 2, 0
_0806C34C: .4byte 0x083C9424
_0806C350:
	ldr r0, _0806C3E8 @ =gDisableDoorsAndTanks
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806C35A
	b _0806C47A
_0806C35A:
	ldr r0, _0806C3EC @ =0x03000026
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0806C368
	b _0806C47A
_0806C368:
	movs r4, #3
	ldr r2, _0806C3F0 @ =0x083C93F0
	mov sl, r2
	ldr r0, _0806C3F4 @ =0x083C9424
	mov sb, r0
	add r1, sp, #0x18
	mov r8, r1
_0806C376:
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	beq _0806C46C
	subs r0, #0x24
	cmp r0, #8
	bhi _0806C46C
	lsls r0, r0, #2
	add r0, sl
	ldrb r5, [r0]
	cmp r5, #0
	beq _0806C460
	lsls r1, r4, #1
	mov r0, sb
	adds r0, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	mov r7, sp
	adds r7, r7, r0
	adds r7, #0x28
	ldrb r0, [r7]
	add r1, sb
	ldrb r1, [r1]
	lsls r1, r1, #2
	mov r6, sp
	adds r6, r6, r1
	adds r6, #0x1c
	ldrb r1, [r6]
	bl MinimapCheckIsTileExplored
	cmp r0, #0
	beq _0806C460
	ldr r1, _0806C3EC @ =0x03000026
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0806C3F8 @ =0x03004FA4
	mov r2, r8
	ldr r0, [r2]
	strh r0, [r1]
	ldr r0, [r7]
	strb r0, [r1, #2]
	ldr r0, [r6]
	strb r0, [r1, #3]
	cmp r5, #1
	bne _0806C400
	ldr r1, _0806C3FC @ =gEquipment
	ldrh r0, [r1, #6]
	adds r0, #5
	cmp r0, #0xff
	bgt _0806C436
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	adds r0, #5
	strh r0, [r1, #4]
	b _0806C436
	.align 2, 0
_0806C3E8: .4byte gDisableDoorsAndTanks
_0806C3EC: .4byte 0x03000026
_0806C3F0: .4byte 0x083C93F0
_0806C3F4: .4byte 0x083C9424
_0806C3F8: .4byte 0x03004FA4
_0806C3FC: .4byte gEquipment
_0806C400:
	cmp r5, #2
	bne _0806C420
	ldr r2, _0806C418 @ =gEquipment
	ldrh r0, [r2, #2]
	adds r1, r0, #0
	adds r1, #0x64
	ldr r0, _0806C41C @ =0x00000833
	cmp r1, r0
	bgt _0806C436
	strh r1, [r2, #2]
	strh r1, [r2]
	b _0806C436
	.align 2, 0
_0806C418: .4byte gEquipment
_0806C41C: .4byte 0x00000833
_0806C420:
	cmp r5, #3
	bne _0806C436
	ldr r1, _0806C48C @ =gEquipment
	ldrb r0, [r1, #9]
	adds r0, #2
	cmp r0, #0xfe
	bgt _0806C436
	strb r0, [r1, #9]
	ldrb r0, [r1, #8]
	adds r0, #2
	strb r0, [r1, #8]
_0806C436:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #0x24
	lsls r0, r0, #2
	add r0, sl
	ldrb r5, [r0, #2]
	cmp r5, #0
	beq _0806C460
	ldr r1, _0806C490 @ =gSamusData
	ldrh r0, [r1, #0x18]
	str r0, [sp]
	ldrh r0, [r1, #0x16]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x21
	adds r1, r5, #0
	movs r2, #6
	movs r3, #0x10
	bl SpriteSpawnPrimary
_0806C460:
	ldr r0, _0806C494 @ =0x03000026
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806C47A
_0806C46C:
	movs r2, #4
	rsbs r2, r2, #0
	add r8, r2
	subs r4, #1
	cmp r4, #0
	blt _0806C47A
	b _0806C376
_0806C47A:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C48C: .4byte gEquipment
_0806C490: .4byte gSamusData
_0806C494: .4byte 0x03000026

	thumb_func_start FinishCollectingTank
FinishCollectingTank: @ 0x0806C498
	push {r4, r5, r6, lr}
	ldr r1, _0806C4E8 @ =0x03000026
	movs r0, #0
	strb r0, [r1]
	ldr r4, _0806C4EC @ =0x03004FA4
	ldrh r0, [r4]
	subs r0, #0x24
	ldr r1, _0806C4F0 @ =0x083C93F0
	lsls r0, r0, #2
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0
	beq _0806C4E2
	ldrb r0, [r5, #1]
	movs r6, #0
	cmp r0, #0
	beq _0806C4BC
	ldr r6, _0806C4F4 @ =0x0000802C
_0806C4BC:
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	movs r0, #0
	bl SetBg1BlockValue
	adds r0, r6, #0
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	bl SetClipdataBlockValue
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	ldrb r2, [r5]
	bl SetTankAsCollected
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl MinimapUpdateForCollectedItem
_0806C4E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C4E8: .4byte 0x03000026
_0806C4EC: .4byte 0x03004FA4
_0806C4F0: .4byte 0x083C93F0
_0806C4F4: .4byte 0x0000802C

	thumb_func_start CheckOnCrumbleBlock
CheckOnCrumbleBlock: @ 0x0806C4F8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r1, _0806C524 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	muls r0, r4, r0
	adds r0, r0, r2
	ldr r1, [r1, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806C530
	ldr r1, _0806C528 @ =0x083BE3A0
	ldr r0, _0806C52C @ =0x00007FFF
	ands r3, r0
	b _0806C534
	.align 2, 0
_0806C524: .4byte gBackgroundsData
_0806C528: .4byte 0x083BE3A0
_0806C52C: .4byte 0x00007FFF
_0806C530:
	ldr r0, _0806C568 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
_0806C534:
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0x23
	bne _0806C562
	ldr r1, _0806C56C @ =gSamusData
	movs r3, #0x1c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	blt _0806C562
	movs r3, #0
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _0806C558
	ldrb r1, [r1, #6]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
_0806C558:
	movs r0, #3
	adds r1, r2, #0
	adds r2, r4, #0
	bl StoreBrokenReformBlock
_0806C562:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C568: .4byte gTilemapAndClipPointers
_0806C56C: .4byte gSamusData

	thumb_func_start ClearBg1BlockValue
ClearBg1BlockValue: @ 0x0806C570
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r7, r4, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r6, r5, #0
	ldr r2, _0806C5FC @ =gBackgroundsData
	ldrh r0, [r2, #0x1c]
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r5, r0
	lsls r0, r0, #0x10
	ldr r1, [r2, #0x18]
	lsrs r0, r0, #0xf
	adds r1, r0, r1
	movs r3, #0
	strh r3, [r1]
	ldr r1, [r2, #8]
	adds r0, r0, r1
	strh r3, [r0]
	ldr r0, _0806C600 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r1, r0, #6
	subs r0, r1, #4
	cmp r0, r4
	bgt _0806C5F6
	adds r0, #0x11
	cmp r4, r0
	bgt _0806C5F6
	ldr r0, _0806C604 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r1, r0, #6
	subs r0, r1, #4
	cmp r0, r5
	bgt _0806C5F6
	adds r0, #0x16
	cmp r5, r0
	bgt _0806C5F6
	ldr r3, _0806C608 @ =0x06001000
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0806C5CC
	ldr r3, _0806C60C @ =0x06001800
_0806C5CC:
	movs r0, #0xf
	ands r6, r0
	lsls r1, r6, #1
	ands r7, r0
	lsls r0, r7, #6
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r3, r3, r0
	ldr r0, _0806C610 @ =gTilemapAndClipPointers
	ldr r1, [r0]
	ldrh r0, [r1]
	strh r0, [r3]
	ldrh r0, [r1, #2]
	strh r0, [r3, #2]
	adds r2, r3, #0
	adds r2, #0x40
	ldrh r0, [r1, #4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #6]
	strh r0, [r2]
_0806C5F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C5FC: .4byte gBackgroundsData
_0806C600: .4byte gBg1YPosition
_0806C604: .4byte gBg1XPosition
_0806C608: .4byte 0x06001000
_0806C60C: .4byte 0x06001800
_0806C610: .4byte gTilemapAndClipPointers

	thumb_func_start SetBg1BlockValue
SetBg1BlockValue: @ 0x0806C614
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	adds r7, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r6, r2, #0
	ldr r1, _0806C6CC @ =gBackgroundsData
	ldrh r0, [r1, #0xc]
	adds r4, r3, #0
	muls r4, r0, r4
	adds r0, r4, #0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	ldr r1, [r1, #8]
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	mov r1, ip
	strh r1, [r0]
	ldr r0, _0806C6D0 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r4, #4
	cmp r0, r3
	bgt _0806C6C6
	adds r0, #0x11
	cmp r3, r0
	bgt _0806C6C6
	ldr r0, _0806C6D4 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r4, #4
	cmp r0, r2
	bgt _0806C6C6
	adds r0, #0x16
	cmp r2, r0
	bgt _0806C6C6
	ldr r5, _0806C6D8 @ =0x06001000
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0806C670
	ldr r5, _0806C6DC @ =0x06001800
_0806C670:
	movs r0, #0xf
	ands r6, r0
	lsls r4, r6, #1
	ands r7, r0
	lsls r0, r7, #6
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r4, ip
	lsls r0, r4, #0x12
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	ldr r3, _0806C6E0 @ =gTilemapAndClipPointers
	movs r0, #1
	orrs r4, r0
	adds r2, r4, #0
	ldr r3, [r3]
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r5, #2]
	adds r2, r5, #0
	adds r2, #0x40
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r2]
	adds r1, r5, #0
	adds r1, #0x42
	lsrs r0, r0, #0xf
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
_0806C6C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C6CC: .4byte gBackgroundsData
_0806C6D0: .4byte gBg1YPosition
_0806C6D4: .4byte gBg1XPosition
_0806C6D8: .4byte 0x06001000
_0806C6DC: .4byte 0x06001800
_0806C6E0: .4byte gTilemapAndClipPointers

	thumb_func_start SetBg1BlockTilemapValue
SetBg1BlockTilemapValue: @ 0x0806C6E4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	adds r7, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r6, r2, #0
	ldr r1, _0806C79C @ =gBackgroundsData
	ldrh r0, [r1, #0xc]
	adds r4, r3, #0
	muls r4, r0, r4
	adds r0, r4, #0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	ldr r1, [r1, #8]
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	mov r1, ip
	strh r1, [r0]
	ldr r0, _0806C7A0 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r4, #4
	cmp r0, r3
	bgt _0806C794
	adds r0, #0x11
	cmp r3, r0
	bgt _0806C794
	ldr r0, _0806C7A4 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r4, #4
	cmp r0, r2
	bgt _0806C794
	adds r0, #0x16
	cmp r2, r0
	bgt _0806C794
	ldr r5, _0806C7A8 @ =0x06001000
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0806C740
	ldr r5, _0806C7AC @ =0x06001800
_0806C740:
	movs r0, #0xf
	ands r6, r0
	lsls r4, r6, #1
	ands r7, r0
	lsls r0, r7, #6
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r4, ip
	lsls r0, r4, #0x12
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	ldr r3, _0806C7B0 @ =0x083BE740
	movs r0, #1
	orrs r4, r0
	adds r2, r4, #0
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r5, #2]
	adds r2, r5, #0
	adds r2, #0x40
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r2]
	adds r1, r5, #0
	adds r1, #0x42
	lsrs r0, r0, #0xf
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
_0806C794:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C79C: .4byte gBackgroundsData
_0806C7A0: .4byte gBg1YPosition
_0806C7A4: .4byte gBg1XPosition
_0806C7A8: .4byte 0x06001000
_0806C7AC: .4byte 0x06001800
_0806C7B0: .4byte 0x083BE740

	thumb_func_start SetVramBg1BlockTilemapValue
SetVramBg1BlockTilemapValue: @ 0x0806C7B4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _0806C820 @ =0x06001000
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0806C7CE
	ldr r4, _0806C824 @ =0x06001800
_0806C7CE:
	movs r0, #0xf
	ands r2, r0
	lsls r1, r2, #1
	ands r3, r0
	lsls r0, r3, #6
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r0, r5, #0x12
	lsrs r0, r0, #0x10
	ldr r3, _0806C828 @ =0x083BE740
	movs r1, #1
	orrs r1, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r4]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x40
	movs r5, #0x80
	lsls r5, r5, #9
	adds r1, r0, r5
	lsrs r0, r0, #0xf
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	lsrs r1, r1, #0xf
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C820: .4byte 0x06001000
_0806C824: .4byte 0x06001800
_0806C828: .4byte 0x083BE740

	thumb_func_start SetClipdataBlockValue
SetClipdataBlockValue: @ 0x0806C82C
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _0806C850 @ =gBackgroundsData
	ldrh r3, [r4, #0x1c]
	muls r1, r3, r1
	adds r2, r2, r1
	lsls r2, r2, #0x10
	ldr r1, [r4, #0x18]
	lsrs r2, r2, #0xf
	adds r2, r2, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C850: .4byte gBackgroundsData

	thumb_func_start UpdateHatches
UpdateHatches: @ 0x0806C854
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	movs r5, #7
	ldr r4, _0806C890 @ =gHatchData
	movs r0, #0xf
	rsbs r0, r0, #0
	adds r7, r0, #0
_0806C862:
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	cmp r0, #0
	beq _0806C922
	ldrb r2, [r4, #1]
	lsls r3, r2, #0x1e
	lsrs r0, r3, #0x1e
	cmp r0, #1
	beq _0806C878
	cmp r0, #3
	bne _0806C922
_0806C878:
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0806C8B6
	lsrs r0, r3, #0x1e
	cmp r0, #1
	bne _0806C894
	movs r0, #0xfa
	bl SoundPlay
	b _0806C89A
	.align 2, 0
_0806C890: .4byte gHatchData
_0806C894:
	movs r0, #0xfb
	bl SoundPlay
_0806C89A:
	ldrb r1, [r4, #1]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	adds r0, #1
	ands r0, r5
	lsls r0, r0, #1
	ands r1, r7
	orrs r1, r0
	strb r1, [r4]
	b _0806C922
_0806C8B6:
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x1b
	cmp r0, #1
	bhi _0806C8CE
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #3
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	b _0806C922
_0806C8CE:
	adds r0, r5, #0
	ands r0, r2
	strb r0, [r4, #1]
	adds r0, r6, #0
	bl UpdateHatchAnimaton
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	adds r0, #1
	ands r0, r5
	lsls r0, r0, #1
	ands r1, r7
	orrs r1, r0
	strb r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1d
	cmp r1, #5
	bne _0806C922
	ldrb r2, [r4, #1]
	lsls r1, r2, #0x1e
	lsrs r0, r1, #0x1e
	cmp r0, #1
	bne _0806C90C
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	b _0806C91A
_0806C90C:
	lsrs r0, r1, #0x1e
	cmp r0, #3
	bne _0806C91C
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
_0806C91A:
	strb r0, [r4, #1]
_0806C91C:
	ldrb r0, [r4]
	ands r0, r7
	strb r0, [r4]
_0806C922:
	adds r4, #4
	adds r6, #1
	cmp r6, #5
	ble _0806C862
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UpdateHatchAnimaton
UpdateHatchAnimaton: @ 0x0806C930
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, _0806C984 @ =0x00008011
	ldr r0, _0806C988 @ =gHatchData
	lsls r1, r7, #2
	adds r2, r1, r0
	ldrb r3, [r2, #2]
	mov r8, r3
	ldrb r6, [r2]
	lsls r4, r6, #0x1b
	mov sb, r0
	cmp r4, #0
	bge _0806C952
	adds r5, #5
_0806C952:
	lsls r0, r6, #0x1c
	lsrs r0, r0, #0x1d
	subs r3, r0, #1
	ldrb r2, [r2, #1]
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #3
	bne _0806C9DC
	movs r0, #2
	subs r3, r0, r3
	cmp r3, #0
	bge _0806C9DC
	movs r3, #0
	lsls r0, r2, #0x1d
	cmp r0, #0
	blt _0806C97A
	lsls r2, r6, #0x18
	lsrs r0, r2, #0x1d
	cmp r0, #5
	bne _0806C990
_0806C97A:
	ldr r5, _0806C98C @ =0x0000801A
	lsrs r0, r4, #0x1f
	adds r5, r0, r5
	b _0806C9DC
	.align 2, 0
_0806C984: .4byte 0x00008011
_0806C988: .4byte gHatchData
_0806C98C: .4byte 0x0000801A
_0806C990:
	lsrs r0, r2, #0x1d
	cmp r0, #0
	bne _0806C9A0
	ldr r5, _0806C99C @ =0x00008050
	b _0806C9CA
	.align 2, 0
_0806C99C: .4byte 0x00008050
_0806C9A0:
	lsrs r0, r2, #0x1d
	cmp r0, #1
	bne _0806C9B0
	ldr r5, _0806C9AC @ =0x00008090
	b _0806C9CA
	.align 2, 0
_0806C9AC: .4byte 0x00008090
_0806C9B0:
	lsrs r0, r2, #0x1d
	cmp r0, #2
	bne _0806C9C0
	ldr r5, _0806C9BC @ =0x000080D0
	b _0806C9CA
	.align 2, 0
_0806C9BC: .4byte 0x000080D0
_0806C9C0:
	lsrs r0, r2, #0x1d
	ldr r5, _0806CA78 @ =0x00008150
	cmp r0, #3
	bne _0806C9CA
	subs r5, #0x40
_0806C9CA:
	lsls r1, r7, #2
	mov r2, sb
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _0806C9DA
	adds r5, #6
_0806C9DA:
	adds r5, r5, r7
_0806C9DC:
	mov r0, sb
	adds r7, r1, r0
	ldrb r0, [r7]
	lsrs r0, r0, #5
	cmp r0, #5
	bne _0806C9EE
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r3, r3, r2
_0806C9EE:
	adds r5, r5, r3
	lsls r3, r5, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldrb r1, [r7, #3]
	mov r4, r8
	mov r0, sb
	adds r2, r4, #0
	bl SetBg1BlockTilemapValue
	movs r0, #0x10
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r1, [r7, #3]
	adds r1, #1
	adds r2, r4, #0
	bl SetBg1BlockTilemapValue
	adds r6, r5, #0
	adds r6, #0x20
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldrb r1, [r7, #3]
	adds r1, #2
	adds r0, r6, #0
	adds r2, r4, #0
	bl SetBg1BlockTilemapValue
	adds r5, #0x30
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrb r1, [r7, #3]
	adds r1, #3
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetBg1BlockTilemapValue
	ldrb r1, [r7, #3]
	mov r0, sb
	adds r2, r4, #0
	bl SetClipdataBlockValue
	ldrb r1, [r7, #3]
	adds r1, #1
	mov r0, r8
	adds r2, r4, #0
	bl SetClipdataBlockValue
	ldrb r1, [r7, #3]
	adds r1, #2
	adds r0, r6, #0
	adds r2, r4, #0
	bl SetClipdataBlockValue
	ldrb r1, [r7, #3]
	adds r1, #3
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetClipdataBlockValue
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CA78: .4byte 0x00008150

	thumb_func_start CheckGrabbingCrumbleBlock
CheckGrabbingCrumbleBlock: @ 0x0806CA7C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r6, #0
	ldr r2, _0806CAD4 @ =gSamusData
	ldrb r0, [r2, #1]
	cmp r0, #0x18
	bne _0806CB32
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	movs r5, #0x20
	rsbs r5, r5, #0
	cmp r0, #0
	beq _0806CA9C
	movs r5, #0x20
_0806CA9C:
	ldrh r0, [r2, #0x16]
	adds r0, r0, r5
	lsls r1, r0, #0x10
	ldrh r0, [r2, #0x18]
	subs r0, #0x7c
	lsls r0, r0, #0x10
	cmp r3, #0
	bne _0806CAFE
	lsrs r4, r1, #0x16
	lsrs r2, r0, #0x16
	ldr r1, _0806CAD8 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	muls r0, r2, r0
	adds r0, r0, r4
	ldr r1, [r1, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806CAE4
	ldr r1, _0806CADC @ =0x083BE3A0
	ldr r0, _0806CAE0 @ =0x00007FFF
	ands r3, r0
	b _0806CAE8
	.align 2, 0
_0806CAD4: .4byte gSamusData
_0806CAD8: .4byte gBackgroundsData
_0806CADC: .4byte 0x083BE3A0
_0806CAE0: .4byte 0x00007FFF
_0806CAE4:
	ldr r0, _0806CB38 @ =gTilemapAndClipPointers
	ldr r1, [r0, #8]
_0806CAE8:
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	cmp r3, #0x23
	bne _0806CAFE
	movs r0, #3
	adds r1, r4, #0
	movs r3, #0
	bl StoreBrokenReformBlock
	movs r6, #1
_0806CAFE:
	cmp r6, #0
	bne _0806CB20
	ldr r1, _0806CB3C @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x7c
	ldrh r1, [r1, #0x16]
	adds r1, r1, r5
	bl ClipdataProcessForSamus
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r0
	cmp r1, #0
	bne _0806CB1C
	movs r6, #1
_0806CB1C:
	cmp r6, #0
	beq _0806CB32
_0806CB20:
	ldr r1, _0806CB40 @ =sSamusSetPoseFunctionPointer
	ldr r0, _0806CB3C @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfe
	bl _call_via_r1
_0806CB32:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806CB38: .4byte gTilemapAndClipPointers
_0806CB3C: .4byte gSamusData
_0806CB40: .4byte sSamusSetPoseFunctionPointer

	thumb_func_start CheckProjectileHitHatch
CheckProjectileHitHatch: @ 0x0806CB44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _0806CB68 @ =gEquipment
	ldrb r1, [r0, #0xd]
	mov sl, r0
	cmp r1, #4
	bls _0806CB6C
	movs r0, #0
	b _0806CBE4
	.align 2, 0
_0806CB68: .4byte gEquipment
_0806CB6C:
	movs r7, #0
	movs r1, #0
	ldr r6, _0806CBD8 @ =gHatchData
	mov r8, r1
	movs r5, #0x80
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
_0806CB7C:
	lsls r0, r1, #2
	adds r3, r0, r6
	ldrb r0, [r3]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0806CBDC
	ldrb r2, [r3, #1]
	lsls r0, r2, #0x1e
	cmp r0, #0
	bne _0806CBDC
	lsls r0, r2, #0x1d
	cmp r0, #0
	blt _0806CBDC
	ldrb r0, [r3, #2]
	add r0, r8
	cmp r0, ip
	bne _0806CBAC
	ldrb r0, [r3, #3]
	cmp r0, r4
	bhi _0806CBAC
	adds r0, #3
	cmp r0, r4
	blt _0806CBAC
	orrs r1, r5
_0806CBAC:
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	beq _0806CBDC
	movs r0, #0x7f
	ands r1, r0
	lsls r0, r1, #2
	adds r2, r0, r6
	ldrb r0, [r2]
	lsrs r0, r0, #5
	mov r1, sl
	ldrb r1, [r1, #0xd]
	cmp r0, r1
	bhi _0806CBE2
	ldrb r0, [r2, #1]
	mov r1, sb
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #1]
	movs r7, #1
	b _0806CBE2
	.align 2, 0
_0806CBD8: .4byte gHatchData
_0806CBDC:
	adds r1, #1
	cmp r1, #5
	ble _0806CB7C
_0806CBE2:
	adds r0, r7, #0
_0806CBE4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RevealHiddenTank
RevealHiddenTank: @ 0x0806CBF4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #4]
	cmp r0, #0x28
	bne _0806CC08
	ldr r4, _0806CC04 @ =0x0000801C
	b _0806CC2A
	.align 2, 0
_0806CC04: .4byte 0x0000801C
_0806CC08:
	cmp r0, #0x27
	bne _0806CC20
	ldr r4, _0806CC1C @ =0x0000801D
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetClipdataBlockValue
	b _0806CC2A
	.align 2, 0
_0806CC1C: .4byte 0x0000801D
_0806CC20:
	cmp r0, #0x29
	beq _0806CC28
	movs r0, #0
	b _0806CC40
_0806CC28:
	ldr r4, _0806CC48 @ =0x0000801E
_0806CC2A:
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetBg1BlockTilemapValue
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetClipdataBlockValue
	movs r0, #1
_0806CC40:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806CC48: .4byte 0x0000801E

	thumb_func_start UpdateBg1AndSubEventDuringSaXElevatorCutscene
UpdateBg1AndSubEventDuringSaXElevatorCutscene: @ 0x0806CC4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0806CCF0 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0806CCE2
	movs r6, #0xe
	movs r5, #3
	mov r0, sb
	cmp r0, #0
	beq _0806CC6E
	movs r5, #0xe
_0806CC6E:
	mov r8, r5
	ldr r7, _0806CCF4 @ =gBackgroundsData
_0806CC72:
	mov r5, r8
	ldrh r0, [r7, #0xc]
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, [r7, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r6, #0
	subs r4, #9
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	bl SetBg1BlockValue
	adds r5, #1
	ldrh r0, [r7, #0xc]
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, [r7, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	bl SetBg1BlockValue
	adds r5, #1
	ldrh r0, [r7, #0xc]
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, [r7, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	bl SetBg1BlockValue
	adds r6, #1
	cmp r6, #0x11
	ble _0806CC72
	movs r0, #0x13
	mov r1, sb
	cmp r1, #0
	bne _0806CCD8
	movs r0, #0x12
_0806CCD8:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	bl SetSubEventAndUpdateMusic
_0806CCE2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCF0: .4byte gEventCounter
_0806CCF4: .4byte gBackgroundsData

	thumb_func_start SetTankAsCollected
SetTankAsCollected: @ 0x0806CCF8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r0, _0806CD1C @ =gCurrentArea
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #7
	bhi _0806CD68
	adds r3, r1, #0
	movs r2, #0x40
	cmp r3, #0
	beq _0806CD20
	adds r3, #1
	b _0806CD22
	.align 2, 0
_0806CD1C: .4byte gCurrentArea
_0806CD20:
	movs r2, #0x80
_0806CD22:
	movs r4, #1
	lsls r0, r3, #8
	ldr r3, _0806CD70 @ =0x02037200
	adds r1, r0, r3
	movs r3, #0
	cmp r3, r2
	bge _0806CD46
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0806CD4A
_0806CD36:
	adds r3, #1
	adds r1, #4
	cmp r3, r2
	bge _0806CD46
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0806CD36
	movs r4, #0
_0806CD46:
	cmp r4, #0
	bne _0806CD68
_0806CD4A:
	ldr r0, _0806CD74 @ =gCurrentRoom
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	strb r5, [r1]
	adds r1, #1
	strb r6, [r1]
	strb r7, [r1, #1]
	ldr r0, _0806CD78 @ =0x0300003B
	mov r2, ip
	ldrb r1, [r2]
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0806CD68:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD70: .4byte 0x02037200
_0806CD74: .4byte gCurrentRoom
_0806CD78: .4byte 0x0300003B

	thumb_func_start CountTanksOnScreen
CountTanksOnScreen: @ 0x0806CD7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	subs r4, #2
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r1, r5, #4
	subs r1, r1, r5
	adds r5, r1, #2
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	movs r6, #0
	adds r2, r1, #2
	adds r0, r1, #0
	adds r0, #0xc
	cmp r2, r0
	bge _0806CE24
	adds r1, #0xc
	mov sl, r1
	ldr r0, _0806CE34 @ =gBackgroundsData
	mov r8, r0
	lsls r1, r5, #1
	mov sb, r1
_0806CDC8:
	adds r4, r5, #0
	adds r0, r4, #0
	adds r0, #0xf
	adds r1, r2, #1
	mov ip, r1
	cmp r4, r0
	bge _0806CE1E
	mov r1, r8
	ldrh r0, [r1, #0x1c]
	muls r0, r2, r0
	ldr r1, [r1, #0x18]
	ldr r7, _0806CE38 @ =gTilemapAndClipPointers
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r2, sb
	adds r3, r2, r0
_0806CDE8:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0806CDFC
	ldr r1, [r7, #8]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
_0806CDFC:
	cmp r2, #0
	beq _0806CE12
	adds r0, r2, #0
	subs r0, #0x24
	cmp r0, #8
	bls _0806CE10
	ldr r1, _0806CE3C @ =0xFFFF7FE3
	adds r0, r2, r1
	cmp r0, #1
	bhi _0806CE12
_0806CE10:
	adds r6, #1
_0806CE12:
	adds r3, #2
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r4, r0
	blt _0806CDE8
_0806CE1E:
	mov r2, ip
	cmp r2, sl
	blt _0806CDC8
_0806CE24:
	adds r0, r6, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806CE34: .4byte gBackgroundsData
_0806CE38: .4byte gTilemapAndClipPointers
_0806CE3C: .4byte 0xFFFF7FE3

	thumb_func_start RemoveCollectedTanks
RemoveCollectedTanks: @ 0x0806CE40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0806CE6C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806CEFC
	ldr r1, _0806CE70 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0806CEFC
	adds r4, r0, #0
	movs r0, #0x40
	mov r8, r0
	cmp r4, #0
	beq _0806CE74
	adds r4, #1
	b _0806CE78
	.align 2, 0
_0806CE6C: .4byte gPauseScreenFlag
_0806CE70: .4byte gCurrentArea
_0806CE74:
	movs r1, #0x80
	mov r8, r1
_0806CE78:
	lsls r0, r4, #8
	ldr r2, _0806CED4 @ =0x02037200
	adds r6, r0, r2
	movs r4, #0
	cmp r4, r8
	bge _0806CEFC
	ldr r7, _0806CED8 @ =gTilemapAndClipPointers
	mov sl, r7
	ldr r0, _0806CEDC @ =gCurrentRoom
	mov sb, r0
	ldr r1, _0806CEE0 @ =gBackgroundsData
	mov ip, r1
_0806CE90:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _0806CEFC
	mov r2, sb
	ldrb r2, [r2]
	cmp r0, r2
	bne _0806CEF4
	ldrb r1, [r6, #3]
	mov r5, ip
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrb r7, [r6, #2]
	adds r0, r0, r7
	ldr r1, [r5, #0x18]
	lsls r3, r0, #1
	adds r2, r3, r1
	ldrh r0, [r2]
	mov r7, sl
	ldr r1, [r7, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x2a
	cmp r0, #2
	bhi _0806CEE8
	ldr r1, _0806CEE4 @ =0x0000802C
	adds r0, r1, #0
	strh r0, [r2]
	ldr r0, [r5, #8]
	adds r0, r3, r0
	movs r2, #0
	strh r2, [r0]
	b _0806CEF4
	.align 2, 0
_0806CED4: .4byte 0x02037200
_0806CED8: .4byte gTilemapAndClipPointers
_0806CEDC: .4byte gCurrentRoom
_0806CEE0: .4byte gBackgroundsData
_0806CEE4: .4byte 0x0000802C
_0806CEE8:
	movs r7, #0
	strh r7, [r2]
	mov r1, ip
	ldr r0, [r1, #8]
	adds r0, r3, r0
	strh r7, [r0]
_0806CEF4:
	adds r4, #1
	adds r6, #4
	cmp r4, r8
	blt _0806CE90
_0806CEFC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_6cf0c
unk_6cf0c: @ 0x0806CF0C
	push {lr}
	bl unk_6cf20
	bl WaitForDma3
	bl unk_6cf60
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_6cf20
unk_6cf20: @ 0x0806CF20
	push {r4, r5, lr}
	ldr r4, _0806CF4C @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4]
	ldr r0, _0806CF50 @ =0x02035400
	str r0, [r4, #4]
	ldr r5, _0806CF54 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806CF58 @ =0x05000200
	str r0, [r4]
	ldr r0, _0806CF5C @ =0x02035600
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF4C: .4byte 0x040000D4
_0806CF50: .4byte 0x02035400
_0806CF54: .4byte 0x80000100
_0806CF58: .4byte 0x05000200
_0806CF5C: .4byte 0x02035600

	thumb_func_start unk_6cf60
unk_6cf60: @ 0x0806CF60
	push {r4, r5, lr}
	ldr r4, _0806CF8C @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4]
	ldr r0, _0806CF90 @ =0x02035000
	str r0, [r4, #4]
	ldr r5, _0806CF94 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806CF98 @ =0x05000200
	str r0, [r4]
	ldr r0, _0806CF9C @ =0x02035200
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF8C: .4byte 0x040000D4
_0806CF90: .4byte 0x02035000
_0806CF94: .4byte 0x80000100
_0806CF98: .4byte 0x05000200
_0806CF9C: .4byte 0x02035200

	thumb_func_start unk_6cfa0
unk_6cfa0: @ 0x0806CFA0
	push {r4, r5, lr}
	ldr r4, _0806CFC8 @ =0x040000D4
	ldr r0, _0806CFCC @ =0x02035400
	str r0, [r4]
	ldr r0, _0806CFD0 @ =0x02035000
	str r0, [r4, #4]
	ldr r5, _0806CFD4 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806CFD8 @ =0x02035600
	str r0, [r4]
	ldr r0, _0806CFDC @ =0x02035200
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CFC8: .4byte 0x040000D4
_0806CFCC: .4byte 0x02035400
_0806CFD0: .4byte 0x02035000
_0806CFD4: .4byte 0x80000100
_0806CFD8: .4byte 0x02035600
_0806CFDC: .4byte 0x02035200

	thumb_func_start unk_6cfe0
unk_6cfe0: @ 0x0806CFE0
	push {r4, r5, lr}
	ldr r4, _0806D008 @ =0x040000D4
	ldr r0, _0806D00C @ =0x02035800
	str r0, [r4]
	ldr r0, _0806D010 @ =0x02035000
	str r0, [r4, #4]
	ldr r5, _0806D014 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806D018 @ =0x02035A00
	str r0, [r4]
	ldr r0, _0806D01C @ =0x02035200
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D008: .4byte 0x040000D4
_0806D00C: .4byte 0x02035800
_0806D010: .4byte 0x02035000
_0806D014: .4byte 0x80000100
_0806D018: .4byte 0x02035A00
_0806D01C: .4byte 0x02035200

	thumb_func_start unk_6d020
unk_6d020: @ 0x0806D020
	push {r4, r5, lr}
	ldr r4, _0806D048 @ =0x040000D4
	ldr r0, _0806D04C @ =0x02035800
	str r0, [r4]
	ldr r0, _0806D050 @ =0x02035000
	str r0, [r4, #4]
	ldr r5, _0806D054 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806D058 @ =0x02035600
	str r0, [r4]
	ldr r0, _0806D05C @ =0x02035200
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D048: .4byte 0x040000D4
_0806D04C: .4byte 0x02035800
_0806D050: .4byte 0x02035000
_0806D054: .4byte 0x80000100
_0806D058: .4byte 0x02035600
_0806D05C: .4byte 0x02035200

	thumb_func_start ApplyMonochromeToPalette
ApplyMonochromeToPalette: @ 0x0806D060
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r1, sp
	ldr r0, _0806D0E8 @ =0x083C94C0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r7, _0806D0EC @ =0x02035800
	ldr r6, _0806D0F0 @ =0x02035400
	ldr r0, [sp]
	mov sl, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r3, [sp, #8]
	mov r8, r3
	movs r5, #0xff
_0806D086:
	ldrh r1, [r6]
	movs r3, #0x1f
	ands r3, r1
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r0, r4, #0
	adds r2, r1, #0
	ands r2, r0
	lsrs r2, r2, #5
	movs r4, #0xf8
	lsls r4, r4, #7
	adds r0, r4, #0
	ands r1, r0
	lsrs r4, r1, #0xa
	mov r0, sl
	muls r0, r3, r0
	mov r1, sb
	muls r1, r2, r1
	adds r0, r0, r1
	mov r1, r8
	muls r1, r4, r1
	adds r0, r0, r1
	movs r1, #3
	bl __divsi3
	cmp r0, #0x1f
	ble _0806D0BE
	movs r0, #0x1f
_0806D0BE:
	movs r4, #0x1f
	ands r4, r0
	lsls r0, r4, #5
	orrs r0, r4
	lsls r1, r4, #0xa
	orrs r0, r1
	strh r0, [r7]
	subs r5, #1
	adds r7, #2
	adds r6, #2
	cmp r5, #0
	bge _0806D086
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D0E8: .4byte 0x083C94C0
_0806D0EC: .4byte 0x02035800
_0806D0F0: .4byte 0x02035400

	thumb_func_start CheckTransferFadedPalette_Unused
CheckTransferFadedPalette_Unused: @ 0x0806D0F4
	push {lr}
	ldr r3, _0806D144 @ =gColorFading
	ldrb r2, [r3, #4]
	cmp r2, #0
	beq _0806D13E
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0806D11E
	ldr r1, _0806D148 @ =0x040000D4
	ldr r0, _0806D14C @ =0x02035000
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0806D150 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r3, #4]
_0806D11E:
	ldrb r2, [r3, #4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0806D13E
	ldr r1, _0806D148 @ =0x040000D4
	ldr r0, _0806D154 @ =0x02035200
	str r0, [r1]
	ldr r0, _0806D158 @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _0806D150 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xfd
	ands r0, r2
	strb r0, [r3, #4]
_0806D13E:
	pop {r0}
	bx r0
	.align 2, 0
_0806D144: .4byte gColorFading
_0806D148: .4byte 0x040000D4
_0806D14C: .4byte 0x02035000
_0806D150: .4byte 0x80000100
_0806D154: .4byte 0x02035200
_0806D158: .4byte 0x05000200

	thumb_func_start CheckTransferFadedPalette
CheckTransferFadedPalette: @ 0x0806D15C
	push {r4, lr}
	ldr r0, _0806D1B0 @ =gSubGameMode1
	movs r1, #0
	ldrsh r3, [r0, r1]
	cmp r3, #2
	bne _0806D1D0
	ldr r4, _0806D1B4 @ =gColorFading
	ldrb r2, [r4, #4]
	cmp r2, #0
	beq _0806D218
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0806D190
	ldr r1, _0806D1B8 @ =0x040000D4
	ldr r0, _0806D1BC @ =0x02035000
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0806D1C0 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	eors r0, r2
	strb r0, [r4, #4]
_0806D190:
	ldrb r2, [r4, #4]
	ands r3, r2
	cmp r3, #0
	beq _0806D218
	ldr r1, _0806D1B8 @ =0x040000D4
	ldr r0, _0806D1C4 @ =0x02035240
	str r0, [r1]
	ldr r0, _0806D1C8 @ =0x05000240
	str r0, [r1, #4]
	ldr r0, _0806D1CC @ =0x800000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #2
	eors r0, r2
	strb r0, [r4, #4]
	b _0806D218
	.align 2, 0
_0806D1B0: .4byte gSubGameMode1
_0806D1B4: .4byte gColorFading
_0806D1B8: .4byte 0x040000D4
_0806D1BC: .4byte 0x02035000
_0806D1C0: .4byte 0x80000100
_0806D1C4: .4byte 0x02035240
_0806D1C8: .4byte 0x05000240
_0806D1CC: .4byte 0x800000E0
_0806D1D0:
	ldr r3, _0806D220 @ =gColorFading
	ldrb r2, [r3, #4]
	cmp r2, #0
	beq _0806D218
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0806D1F8
	ldr r1, _0806D224 @ =0x040000D4
	ldr r0, _0806D228 @ =0x02035000
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0806D22C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r3, #4]
_0806D1F8:
	ldrb r2, [r3, #4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0806D218
	ldr r1, _0806D224 @ =0x040000D4
	ldr r0, _0806D230 @ =0x02035200
	str r0, [r1]
	ldr r0, _0806D234 @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _0806D22C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xfd
	ands r0, r2
	strb r0, [r3, #4]
_0806D218:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D220: .4byte gColorFading
_0806D224: .4byte 0x040000D4
_0806D228: .4byte 0x02035000
_0806D22C: .4byte 0x80000100
_0806D230: .4byte 0x02035200
_0806D234: .4byte 0x05000200

	thumb_func_start unk_6d238
unk_6d238: @ 0x0806D238
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #0
	mov sl, r0
_0806D252:
	mov r1, sl
	cmp r1, #0
	bne _0806D284
	ldr r0, _0806D274 @ =0x02035000
	mov sb, r0
	ldr r1, _0806D278 @ =gColorFading
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #1
	ands r1, r0
	ldr r0, _0806D27C @ =0x02035400
	mov r8, r0
	cmp r1, #0
	beq _0806D2A0
	ldr r1, _0806D280 @ =0x02035800
	b _0806D29E
	.align 2, 0
_0806D274: .4byte 0x02035000
_0806D278: .4byte gColorFading
_0806D27C: .4byte 0x02035400
_0806D280: .4byte 0x02035800
_0806D284:
	ldr r0, _0806D2C8 @ =0x02035200
	mov sb, r0
	ldr r1, _0806D2CC @ =gColorFading
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #2
	ands r1, r0
	ldr r0, _0806D2D0 @ =0x02035600
	mov r8, r0
	cmp r1, #0
	beq _0806D2A0
	ldr r1, _0806D2D4 @ =0x02035A00
_0806D29E:
	mov r8, r1
_0806D2A0:
	movs r0, #0
	mov ip, r0
	mov r1, sl
	adds r1, #1
	str r1, [sp, #4]
_0806D2AA:
	mov r0, sl
	cmp r0, #0
	bne _0806D2D8
	ldr r1, _0806D2CC @ =gColorFading
	ldrb r0, [r1]
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0806D2E4
	mov r1, ip
	asrs r0, r1, #4
	cmp r0, #1
	beq _0806D3AC
	b _0806D2E4
	.align 2, 0
_0806D2C8: .4byte 0x02035200
_0806D2CC: .4byte gColorFading
_0806D2D0: .4byte 0x02035600
_0806D2D4: .4byte 0x02035A00
_0806D2D8:
	mov r1, ip
	asrs r0, r1, #4
	cmp r0, #3
	beq _0806D3AC
	cmp r0, #6
	beq _0806D3AC
_0806D2E4:
	mov r0, r8
	ldrh r1, [r0]
	movs r7, #0x1f
	movs r6, #0x1f
	adds r2, r6, #0
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r3, r0, #0xa
	ldr r0, _0806D334 @ =gColorFading
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806D35A
	ldr r1, [sp]
	cmp r1, #0
	bne _0806D338
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	b _0806D39C
	.align 2, 0
_0806D334: .4byte gColorFading
_0806D338:
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r3, r0
	b _0806D39C
_0806D35A:
	ldr r0, [sp]
	cmp r0, #0
	bne _0806D37C
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	b _0806D39C
_0806D37C:
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r3, r0
_0806D39C:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r4, #5
	orrs r2, r0
	lsls r0, r3, #0xa
	orrs r2, r0
	mov r1, sb
	strh r2, [r1]
_0806D3AC:
	movs r0, #1
	add ip, r0
	movs r1, #2
	add sb, r1
	add r8, r1
	mov r0, ip
	cmp r0, #0xff
	bgt _0806D3BE
	b _0806D2AA
_0806D3BE:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #1
	bhi _0806D3CC
	b _0806D252
_0806D3CC:
	movs r0, #3
	ldr r1, _0806D3E4 @ =gColorFading
	strb r0, [r1, #4]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D3E4: .4byte gColorFading

	thumb_func_start unk_6d3e8
unk_6d3e8: @ 0x0806D3E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r2, #0
_0806D400:
	cmp r2, #0
	bne _0806D430
	ldr r0, _0806D420 @ =0x02035000
	mov sb, r0
	ldr r1, _0806D424 @ =gColorFading
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #1
	ands r1, r0
	ldr r7, _0806D428 @ =0x02035400
	cmp r1, #0
	beq _0806D448
	ldr r7, _0806D42C @ =0x02035800
	b _0806D448
	.align 2, 0
_0806D420: .4byte 0x02035000
_0806D424: .4byte gColorFading
_0806D428: .4byte 0x02035400
_0806D42C: .4byte 0x02035800
_0806D430:
	ldr r0, _0806D4A4 @ =0x02035200
	mov sb, r0
	ldr r1, _0806D4A8 @ =gColorFading
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #2
	ands r1, r0
	ldr r7, _0806D4AC @ =0x02035600
	cmp r1, #0
	beq _0806D448
	ldr r7, _0806D4B0 @ =0x02035A00
_0806D448:
	adds r2, #1
	str r2, [sp]
	movs r0, #0x1f
	mov r8, r0
	movs r6, #0x1f
	movs r1, #0xff
	mov ip, r1
_0806D456:
	ldrh r1, [r7]
	adds r2, r6, #0
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r3, r0, #0xa
	ldr r0, _0806D4A8 @ =gColorFading
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806D4D6
	mov r1, sl
	cmp r1, #0
	bne _0806D4B4
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	mov r1, r8
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r1, r0
	b _0806D518
	.align 2, 0
_0806D4A4: .4byte 0x02035200
_0806D4A8: .4byte gColorFading
_0806D4AC: .4byte 0x02035600
_0806D4B0: .4byte 0x02035A00
_0806D4B4:
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r3, r0
	b _0806D518
_0806D4D6:
	mov r0, sl
	cmp r0, #0
	bne _0806D4F8
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	b _0806D518
_0806D4F8:
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r3, r0
_0806D518:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r4, #5
	orrs r2, r0
	lsls r0, r3, #0xa
	orrs r2, r0
	mov r1, sb
	strh r2, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	movs r1, #2
	add sb, r1
	adds r7, #2
	mov r0, ip
	cmp r0, #0
	bge _0806D456
	ldr r1, [sp]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bhi _0806D546
	b _0806D400
_0806D546:
	movs r0, #3
	ldr r1, _0806D55C @ =gColorFading
	strb r0, [r1, #4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D55C: .4byte gColorFading

	thumb_func_start unk_6d560
unk_6d560: @ 0x0806D560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #0
	mov sl, r0
_0806D57A:
	mov r1, sl
	cmp r1, #0
	bne _0806D590
	ldr r0, _0806D588 @ =0x02035000
	mov sb, r0
	ldr r1, _0806D58C @ =0x02035400
	b _0806D596
	.align 2, 0
_0806D588: .4byte 0x02035000
_0806D58C: .4byte 0x02035400
_0806D590:
	ldr r0, _0806D600 @ =0x02035200
	mov sb, r0
	ldr r1, _0806D604 @ =0x02035600
_0806D596:
	mov r8, r1
	movs r0, #0
	mov ip, r0
	mov r1, sl
	adds r1, #1
	str r1, [sp, #4]
_0806D5A2:
	mov r0, sl
	cmp r0, #0
	beq _0806D5B0
	mov r1, ip
	asrs r0, r1, #4
	cmp r0, #1
	ble _0806D680
_0806D5B0:
	mov r0, r8
	ldrh r1, [r0]
	movs r7, #0x1f
	movs r6, #0x1f
	adds r2, r6, #0
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r3, r0, #0xa
	ldr r0, _0806D608 @ =gColorFading
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806D62E
	ldr r1, [sp]
	cmp r1, #0
	bne _0806D60C
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	b _0806D670
	.align 2, 0
_0806D600: .4byte 0x02035200
_0806D604: .4byte 0x02035600
_0806D608: .4byte gColorFading
_0806D60C:
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r3, r0
	b _0806D670
_0806D62E:
	ldr r0, [sp]
	cmp r0, #0
	bne _0806D650
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	b _0806D670
_0806D650:
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r3, r0
_0806D670:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r4, #5
	orrs r2, r0
	lsls r0, r3, #0xa
	orrs r2, r0
	mov r1, sb
	strh r2, [r1]
_0806D680:
	movs r0, #1
	add ip, r0
	movs r1, #2
	add sb, r1
	add r8, r1
	mov r0, ip
	cmp r0, #0xff
	ble _0806D5A2
	ldr r1, [sp, #4]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #1
	bhi _0806D69E
	b _0806D57A
_0806D69E:
	movs r0, #3
	ldr r1, _0806D6B4 @ =gColorFading
	strb r0, [r1, #4]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D6B4: .4byte gColorFading

	thumb_func_start unk_6d6b8
unk_6d6b8: @ 0x0806D6B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r0, _0806D6DC @ =gColorFading
	ldrb r1, [r0, #2]
	adds r4, r0, #0
	cmp r1, #0x20
	bne _0806D6E0
	movs r0, #1
	b _0806D818
	.align 2, 0
_0806D6DC: .4byte gColorFading
_0806D6E0:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #0
	bge _0806D6FA
	movs r0, #0xff
	mov r1, ip
	eors r0, r1
	adds r0, #1
	mov ip, r0
	movs r2, #1
	mov r8, r2
	b _0806D700
_0806D6FA:
	mov r8, ip
	movs r0, #1
	mov ip, r0
_0806D700:
	adds r1, r4, #0
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	ldrb r0, [r1, #3]
	cmp r0, r8
	bge _0806D710
	b _0806D816
_0806D710:
	movs r0, #0
	strb r0, [r1, #3]
	ldrb r0, [r1, #2]
	add r0, ip
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bls _0806D726
	movs r0, #0x20
	strb r0, [r1, #2]
_0806D726:
	ldrb r4, [r4, #2]
	mov r8, r4
	ldr r1, _0806D73C @ =0x02035000
	str r1, [sp]
	cmp r3, #0
	bne _0806D748
	ldr r2, _0806D740 @ =0x02035400
	mov sb, r2
	ldr r0, _0806D744 @ =0x02035800
	mov sl, r0
	b _0806D750
	.align 2, 0
_0806D73C: .4byte 0x02035000
_0806D740: .4byte 0x02035400
_0806D744: .4byte 0x02035800
_0806D748:
	ldr r1, _0806D798 @ =0x02035400
	mov sl, r1
	ldr r2, _0806D79C @ =0x02035800
	mov sb, r2
_0806D750:
	movs r0, #0xff
	mov ip, r0
_0806D754:
	mov r2, sb
	ldrh r1, [r2]
	movs r3, #0x1f
	ands r3, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r5, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r7, r0, #0xa
	mov r0, sl
	ldrh r1, [r0]
	movs r2, #0x1f
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r6, r0, #0xa
	cmp r2, r3
	bls _0806D7A0
	subs r0, r2, r3
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #5
	adds r0, r3, r0
	b _0806D7AC
	.align 2, 0
_0806D798: .4byte 0x02035400
_0806D79C: .4byte 0x02035800
_0806D7A0:
	subs r0, r3, r2
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	subs r0, r3, r0
_0806D7AC:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r4, r5
	bls _0806D7C2
	subs r0, r4, r5
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	adds r0, r5, r0
	b _0806D7CE
_0806D7C2:
	subs r0, r5, r4
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	subs r0, r5, r0
_0806D7CE:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r6, r7
	bls _0806D7E4
	subs r0, r6, r7
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	adds r0, r7, r0
	b _0806D7F0
_0806D7E4:
	subs r0, r7, r6
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	subs r0, r7, r0
_0806D7F0:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r3, #5
	orrs r1, r0
	lsls r0, r2, #0xa
	orrs r1, r0
	ldr r0, [sp]
	strh r1, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	adds r0, #2
	str r0, [sp]
	movs r2, #2
	add sb, r2
	add sl, r2
	mov r0, ip
	cmp r0, #0
	bge _0806D754
_0806D816:
	movs r0, #0
_0806D818:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ApplyMonochromeToObjPalram
ApplyMonochromeToObjPalram: @ 0x0806D828
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #5
	ldr r1, _0806D8A4 @ =0x05000200
	adds r4, r0, r1
	lsls r5, r6, #4
	cmp r5, #0xff
	bgt _0806D87A
_0806D83A:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r1, r3, #0
	adds r3, r2, #0
	ands r3, r1
	lsrs r3, r3, #5
	movs r7, #0xf8
	lsls r7, r7, #7
	adds r1, r7, #0
	ands r2, r1
	lsrs r2, r2, #0xa
	adds r0, r0, r3
	adds r0, r0, r2
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0x1f
	ble _0806D868
	movs r2, #0x1f
_0806D868:
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r4]
	adds r5, #1
	adds r4, #2
	cmp r5, #0xff
	ble _0806D83A
_0806D87A:
	ldr r2, _0806D8A8 @ =0x040000D4
	lsls r1, r6, #5
	ldr r3, _0806D8A4 @ =0x05000200
	adds r0, r1, r3
	str r0, [r2]
	ldr r7, _0806D8AC @ =0x02035600
	adds r0, r1, r7
	str r0, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	subs r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D8A4: .4byte 0x05000200
_0806D8A8: .4byte 0x040000D4
_0806D8AC: .4byte 0x02035600

	thumb_func_start PowerBombYellowTint
PowerBombYellowTint: @ 0x0806D8B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0806D948 @ =0x03004FC8
	ldrb r0, [r0]
	movs r6, #0xf0
	cmp r0, #0
	bne _0806D8C6
	adds r6, #0x10
_0806D8C6:
	ldr r1, _0806D94C @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r2, _0806D950 @ =0x02035000
	str r2, [r1, #4]
	ldr r0, _0806D954 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	lsls r0, r3, #5
	adds r5, r0, r2
	lsls r4, r3, #4
	ldr r0, _0806D958 @ =gColorFading
	mov r8, r0
	cmp r4, r6
	bge _0806D932
	movs r1, #0xf8
	lsls r1, r1, #2
	mov ip, r1
	movs r7, #0xf8
	lsls r7, r7, #7
_0806D8F0:
	movs r0, #0xf
	ands r0, r4
	cmp r0, #0
	beq _0806D92A
	ldrh r2, [r5]
	movs r3, #0x1f
	ands r3, r2
	mov r1, ip
	ands r1, r2
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #0xa
	adds r3, #5
	lsls r1, r1, #0x13
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	cmp r3, #0x1f
	bls _0806D91A
	movs r3, #0x1f
_0806D91A:
	cmp r1, #0x1f
	bls _0806D920
	movs r1, #0x1f
_0806D920:
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	orrs r0, r1
	orrs r0, r3
	strh r0, [r5]
_0806D92A:
	adds r4, #1
	adds r5, #2
	cmp r4, r6
	blt _0806D8F0
_0806D932:
	mov r0, r8
	ldrb r1, [r0, #4]
	movs r0, #1
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, #4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D948: .4byte 0x03004FC8
_0806D94C: .4byte 0x040000D4
_0806D950: .4byte 0x02035000
_0806D954: .4byte 0x80000100
_0806D958: .4byte gColorFading

	thumb_func_start unk_6d95c
unk_6d95c: @ 0x0806D95C
	push {r4, r5, r6, lr}
	movs r4, #0xa0
	lsls r4, r4, #0x13
	movs r5, #0xff
_0806D964:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r1, r3, #0
	adds r3, r2, #0
	ands r3, r1
	lsrs r3, r3, #5
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r1, r6, #0
	ands r2, r1
	lsrs r2, r2, #0xa
	adds r0, r0, r3
	adds r0, r0, r2
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0x1f
	ble _0806D992
	movs r2, #0x1f
_0806D992:
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r4]
	subs r5, #1
	adds r4, #2
	cmp r5, #0
	bge _0806D964
	ldr r1, _0806D9BC @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r0, _0806D9C0 @ =0x02035400
	str r0, [r1, #4]
	ldr r0, _0806D9C4 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D9BC: .4byte 0x040000D4
_0806D9C0: .4byte 0x02035400
_0806D9C4: .4byte 0x80000100

	thumb_func_start unk_6d9c8
unk_6d9c8: @ 0x0806D9C8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r6, #0x1f
	subs r0, r6, r0
	muls r0, r3, r0
	asrs r0, r0, #5
	movs r5, #0x1f
	subs r0, r5, r0
	ands r0, r5
	subs r1, r6, r1
	adds r4, r1, #0
	muls r4, r3, r4
	asrs r4, r4, #5
	subs r4, r5, r4
	ands r4, r5
	subs r6, r6, r2
	adds r1, r6, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	subs r1, r5, r1
	ands r1, r5
	lsls r4, r4, #5
	orrs r0, r4
	lsls r1, r1, #0xa
	orrs r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6da10
unk_6da10: @ 0x0806DA10
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r5, #0x1f
	subs r4, r5, r0
	muls r4, r3, r4
	asrs r4, r4, #5
	adds r0, r0, r4
	movs r6, #0x1f
	ands r0, r6
	subs r4, r5, r1
	muls r4, r3, r4
	asrs r4, r4, #5
	adds r1, r1, r4
	ands r1, r6
	subs r5, r5, r2
	muls r3, r5, r3
	asrs r3, r3, #5
	adds r2, r2, r3
	ands r2, r6
	lsls r1, r1, #5
	orrs r0, r1
	lsls r2, r2, #0xa
	orrs r0, r2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6da54
unk_6da54: @ 0x0806DA54
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	muls r0, r3, r0
	asrs r0, r0, #5
	movs r5, #0x1f
	ands r0, r5
	adds r4, r1, #0
	muls r4, r3, r4
	asrs r4, r4, #5
	ands r4, r5
	adds r1, r2, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	ands r1, r5
	lsls r4, r4, #5
	orrs r0, r4
	lsls r1, r1, #0xa
	orrs r0, r1
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_6da8c
unk_6da8c: @ 0x0806DA8C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r4, r0, #0
	muls r4, r3, r4
	asrs r4, r4, #5
	subs r0, r0, r4
	movs r5, #0x1f
	ands r0, r5
	adds r4, r1, #0
	muls r4, r3, r4
	asrs r4, r4, #5
	subs r1, r1, r4
	ands r1, r5
	muls r3, r2, r3
	asrs r3, r3, #5
	subs r2, r2, r3
	ands r2, r5
	lsls r1, r1, #5
	orrs r0, r1
	lsls r2, r2, #0xa
	orrs r0, r2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6dacc
unk_6dacc: @ 0x0806DACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r0, #0
	mov r8, r0
	ldr r1, _0806DAF8 @ =gColorFading
	ldrb r0, [r1]
	subs r0, #1
	adds r7, r1, #0
	cmp r0, #0x13
	bls _0806DAEC
	b _0806DD14
_0806DAEC:
	lsls r0, r0, #2
	ldr r1, _0806DAFC @ =_0806DB00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DAF8: .4byte gColorFading
_0806DAFC: .4byte _0806DB00
_0806DB00: @ jump table
	.4byte _0806DBEA @ case 0
	.4byte _0806DBEA @ case 1
	.4byte _0806DB50 @ case 2
	.4byte _0806DB50 @ case 3
	.4byte _0806DB50 @ case 4
	.4byte _0806DB50 @ case 5
	.4byte _0806DD14 @ case 6
	.4byte _0806DD14 @ case 7
	.4byte _0806DBEA @ case 8
	.4byte _0806DBEA @ case 9
	.4byte _0806DD14 @ case 10
	.4byte _0806DB50 @ case 11
	.4byte _0806DD14 @ case 12
	.4byte _0806DBEA @ case 13
	.4byte _0806DD14 @ case 14
	.4byte _0806DBEA @ case 15
	.4byte _0806DD14 @ case 16
	.4byte _0806DBEA @ case 17
	.4byte _0806DCB0 @ case 18
	.4byte _0806DCB0 @ case 19
_0806DB50:
	ldrb r3, [r7, #2]
	cmp r3, #0
	bne _0806DB78
	cmp r6, #0
	bne _0806DB5E
	ldr r0, _0806DB70 @ =gWrittenToBldy
	strh r6, [r0]
_0806DB5E:
	ldrb r1, [r7, #5]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #5]
	ldr r1, _0806DB74 @ =0x083C94A0
	mov ip, r1
	lsls r4, r2, #3
	b _0806DBCC
	.align 2, 0
_0806DB70: .4byte gWrittenToBldy
_0806DB74: .4byte 0x083C94A0
_0806DB78:
	ldr r0, _0806DBA0 @ =0x083C94A0
	lsls r2, r2, #3
	adds r1, r2, r0
	ldrb r1, [r1, #4]
	mov ip, r0
	adds r4, r2, #0
	cmp r3, r1
	bne _0806DBC4
	cmp r6, #0
	bne _0806DBB4
	ldrb r1, [r7, #5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806DBA4
	bl unk_6d020
	b _0806DBA8
	.align 2, 0
_0806DBA0: .4byte 0x083C94A0
_0806DBA4:
	bl unk_6cfa0
_0806DBA8:
	ldr r1, _0806DBBC @ =gColorFading
	movs r0, #3
	strb r0, [r1, #4]
	adds r7, r1, #0
	ldr r0, _0806DBC0 @ =0x083C94A0
	mov ip, r0
_0806DBB4:
	ldrb r0, [r7, #2]
	adds r0, #1
	strb r0, [r7, #2]
	b _0806DBCC
	.align 2, 0
_0806DBBC: .4byte gColorFading
_0806DBC0: .4byte 0x083C94A0
_0806DBC4:
	cmp r3, r1
	bls _0806DBCC
	movs r1, #1
	mov r8, r1
_0806DBCC:
	mov r0, ip
	adds r2, r4, r0
	ldrb r0, [r7, #2]
	ldrb r1, [r2, #4]
	cmp r0, r1
	blo _0806DBDA
	b _0806DD14
_0806DBDA:
	adds r1, r0, #0
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	bl unk_6d238
	b _0806DD0E
_0806DBEA:
	ldrb r3, [r7, #2]
	cmp r3, #0
	bne _0806DC14
	cmp r6, #0
	bne _0806DBF8
	ldr r0, _0806DC0C @ =gWrittenToBldy
	strh r6, [r0]
_0806DBF8:
	ldrb r1, [r7, #5]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #5]
	ldr r0, _0806DC10 @ =0x083C94A0
	mov ip, r0
	lsls r4, r2, #3
	b _0806DC94
	.align 2, 0
_0806DC0C: .4byte gWrittenToBldy
_0806DC10: .4byte 0x083C94A0
_0806DC14:
	ldr r0, _0806DC48 @ =0x083C94A0
	lsls r2, r2, #3
	adds r1, r2, r0
	ldrb r1, [r1, #4]
	mov ip, r0
	adds r4, r2, #0
	cmp r3, r1
	bne _0806DC8C
	cmp r6, #0
	beq _0806DC58
	ldrb r1, [r7]
	movs r0, #1
	ands r0, r1
	movs r1, #0xff
	cmp r0, #0
	beq _0806DC36
	movs r1, #0xbf
_0806DC36:
	ldr r0, _0806DC4C @ =0x04000050
	strh r1, [r0]
	ldr r0, _0806DC50 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0806DC54 @ =0x04000054
	strh r1, [r0]
	b _0806DC7C
	.align 2, 0
_0806DC48: .4byte 0x083C94A0
_0806DC4C: .4byte 0x04000050
_0806DC50: .4byte gWrittenToBldy
_0806DC54: .4byte 0x04000054
_0806DC58:
	ldrb r1, [r7, #5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806DC6C
	bl unk_6d020
	b _0806DC70
_0806DC6C:
	bl unk_6cfa0
_0806DC70:
	ldr r1, _0806DC84 @ =gColorFading
	movs r0, #3
	strb r0, [r1, #4]
	adds r7, r1, #0
	ldr r1, _0806DC88 @ =0x083C94A0
	mov ip, r1
_0806DC7C:
	ldrb r0, [r7, #2]
	adds r0, #1
	strb r0, [r7, #2]
	b _0806DC94
	.align 2, 0
_0806DC84: .4byte gColorFading
_0806DC88: .4byte 0x083C94A0
_0806DC8C:
	cmp r3, r1
	bls _0806DC94
	movs r0, #1
	mov r8, r0
_0806DC94:
	mov r1, ip
	adds r2, r4, r1
	ldrb r0, [r7, #2]
	ldrb r1, [r2, #4]
	cmp r0, r1
	bhs _0806DD14
	adds r1, r0, #0
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	bl unk_6d3e8
	b _0806DD0E
_0806DCB0:
	ldrb r5, [r7, #2]
	adds r3, r5, #0
	cmp r3, #0
	bne _0806DCD0
	ldrb r1, [r7, #5]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #5]
	ldr r0, _0806DCCC @ =0x083C94A0
	mov ip, r0
	lsls r4, r2, #3
	b _0806DCF4
	.align 2, 0
_0806DCCC: .4byte 0x083C94A0
_0806DCD0:
	ldr r0, _0806DCE8 @ =0x083C94A0
	lsls r2, r2, #3
	adds r1, r2, r0
	ldrb r1, [r1, #4]
	mov ip, r0
	adds r4, r2, #0
	cmp r3, r1
	bne _0806DCEC
	adds r0, r5, #1
	strb r0, [r7, #2]
	b _0806DCF4
	.align 2, 0
_0806DCE8: .4byte 0x083C94A0
_0806DCEC:
	cmp r3, r1
	bls _0806DCF4
	movs r1, #1
	mov r8, r1
_0806DCF4:
	mov r0, ip
	adds r2, r4, r0
	ldrb r0, [r7, #2]
	ldrb r1, [r2, #4]
	cmp r0, r1
	bhs _0806DD14
	adds r1, r0, #0
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	bl unk_6d560
_0806DD0E:
	ldrb r0, [r7, #2]
	adds r0, #1
	strb r0, [r7, #2]
_0806DD14:
	mov r0, r8
	cmp r0, #0
	beq _0806DD20
	ldr r1, _0806DD2C @ =gColorFading
	movs r0, #0
	strb r0, [r1, #2]
_0806DD20:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806DD2C: .4byte gColorFading

	thumb_func_start unk_6dd30
unk_6dd30: @ 0x0806DD30
	push {r4, lr}
	movs r3, #0
	movs r4, #0
	movs r2, #0
	ldr r0, _0806DD4C @ =gColorFading
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xc
	bhi _0806DDB2
	lsls r0, r0, #2
	ldr r1, _0806DD50 @ =_0806DD54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DD4C: .4byte gColorFading
_0806DD50: .4byte _0806DD54
_0806DD54: @ jump table
	.4byte _0806DD88 @ case 0
	.4byte _0806DDAA @ case 1
	.4byte _0806DD90 @ case 2
	.4byte _0806DD92 @ case 3
	.4byte _0806DD9C @ case 4
	.4byte _0806DD94 @ case 5
	.4byte _0806DDB2 @ case 6
	.4byte _0806DDB2 @ case 7
	.4byte _0806DDB2 @ case 8
	.4byte _0806DDB2 @ case 9
	.4byte _0806DDB2 @ case 10
	.4byte _0806DD94 @ case 11
	.4byte _0806DDA4 @ case 12
_0806DD88:
	ldr r3, _0806DD8C @ =0x00007FFF
	b _0806DDAA
	.align 2, 0
_0806DD8C: .4byte 0x00007FFF
_0806DD90:
	ldr r3, _0806DD98 @ =0x00007FFF
_0806DD92:
	movs r4, #1
_0806DD94:
	movs r2, #1
	b _0806DDAA
	.align 2, 0
_0806DD98: .4byte 0x00007FFF
_0806DD9C:
	ldr r3, _0806DDA0 @ =0x00007FFF
	b _0806DD94
	.align 2, 0
_0806DDA0: .4byte 0x00007FFF
_0806DDA4:
	bl unk_6cf20
	b _0806DDB2
_0806DDAA:
	adds r0, r3, #0
	adds r1, r4, #0
	bl unk_6de40
_0806DDB2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_6ddb8
unk_6ddb8: @ 0x0806DDB8
	push {r4, lr}
	movs r3, #0
	movs r4, #0
	movs r2, #0
	ldr r0, _0806DDD4 @ =gColorFading
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xc
	bhi _0806DE3A
	lsls r0, r0, #2
	ldr r1, _0806DDD8 @ =_0806DDDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DDD4: .4byte gColorFading
_0806DDD8: .4byte _0806DDDC
_0806DDDC: @ jump table
	.4byte _0806DE10 @ case 0
	.4byte _0806DE32 @ case 1
	.4byte _0806DE18 @ case 2
	.4byte _0806DE1A @ case 3
	.4byte _0806DE24 @ case 4
	.4byte _0806DE1C @ case 5
	.4byte _0806DE3A @ case 6
	.4byte _0806DE3A @ case 7
	.4byte _0806DE3A @ case 8
	.4byte _0806DE3A @ case 9
	.4byte _0806DE3A @ case 10
	.4byte _0806DE3A @ case 11
	.4byte _0806DE2C @ case 12
_0806DE10:
	ldr r3, _0806DE14 @ =0x00007FFF
	b _0806DE32
	.align 2, 0
_0806DE14: .4byte 0x00007FFF
_0806DE18:
	ldr r3, _0806DE20 @ =0x00007FFF
_0806DE1A:
	movs r4, #1
_0806DE1C:
	movs r2, #1
	b _0806DE32
	.align 2, 0
_0806DE20: .4byte 0x00007FFF
_0806DE24:
	ldr r3, _0806DE28 @ =0x00007FFF
	b _0806DE1C
	.align 2, 0
_0806DE28: .4byte 0x00007FFF
_0806DE2C:
	bl unk_6cf20
	b _0806DE3A
_0806DE32:
	adds r0, r3, #0
	adds r1, r4, #0
	bl unk_6de40
_0806DE3A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_6de40
unk_6de40: @ 0x0806DE40
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r1, _0806DEA8 @ =gColorFading
	movs r0, #0
	strb r0, [r1, #2]
	bl unk_6cf20
	movs r1, #0
	ldr r3, _0806DEAC @ =0x05000200
	movs r2, #0xa0
	lsls r2, r2, #0x13
_0806DE60:
	asrs r0, r1, #4
	cmp r0, #1
	bne _0806DE6A
	cmp r6, #0
	bne _0806DE6C
_0806DE6A:
	strh r4, [r2]
_0806DE6C:
	cmp r0, #3
	beq _0806DE74
	cmp r0, #6
	bne _0806DE78
_0806DE74:
	cmp r5, #0
	bne _0806DE7A
_0806DE78:
	strh r4, [r3]
_0806DE7A:
	adds r3, #2
	adds r2, #2
	adds r1, #1
	cmp r1, #0xff
	ble _0806DE60
	ldr r0, _0806DEB0 @ =0x040000D4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0]
	ldr r1, _0806DEB4 @ =0x02035000
	str r1, [r0, #4]
	ldr r2, _0806DEB8 @ =0x80000100
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0806DEAC @ =0x05000200
	str r1, [r0]
	ldr r1, _0806DEBC @ =0x02035200
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DEA8: .4byte gColorFading
_0806DEAC: .4byte 0x05000200
_0806DEB0: .4byte 0x040000D4
_0806DEB4: .4byte 0x02035000
_0806DEB8: .4byte 0x80000100
_0806DEBC: .4byte 0x02035200

	thumb_func_start unk_6dec0
unk_6dec0: @ 0x0806DEC0
	push {lr}
	movs r0, #6
	bl StartColorFading
	pop {r0}
	bx r0

	thumb_func_start unk_6decc
unk_6decc: @ 0x0806DECC
	push {lr}
	bl unk_6cf0c
	movs r0, #9
	bl StartColorFading
	ldr r1, _0806DEE4 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806DEE4: .4byte gSubGameMode1

	thumb_func_start unk_6dee8
unk_6dee8: @ 0x0806DEE8
	push {lr}
	bl unk_6cf0c
	movs r0, #9
	bl StartColorFading
	ldr r1, _0806DF00 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806DF00: .4byte gSubGameMode1

	thumb_func_start unk_6df04
unk_6df04: @ 0x0806DF04
	push {lr}
	bl unk_6cf0c
	movs r0, #0x12
	bl StartColorFading
	ldr r1, _0806DF1C @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806DF1C: .4byte gSubGameMode1

	thumb_func_start unk_6df20
unk_6df20: @ 0x0806DF20
	push {r4, r5, lr}
	ldr r0, _0806DF58 @ =gWindow1Border
	ldrb r1, [r0, #4]
	adds r2, r0, #0
	cmp r1, #0
	bne _0806DF30
	ldr r0, _0806DF5C @ =gWrittenToBldy
	strh r1, [r0]
_0806DF30:
	ldrb r0, [r2, #4]
	adds r1, r0, #1
	strb r1, [r2, #4]
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _0806DF42
	movs r0, #0xff
	orrs r1, r0
	strb r1, [r2, #4]
_0806DF42:
	ldrb r0, [r2, #4]
	lsrs r0, r0, #1
	adds r1, r0, #2
	movs r4, #0
	ldrb r0, [r2]
	cmp r0, r1
	ble _0806DF60
	subs r0, r0, r1
	strb r0, [r2]
	b _0806DF64
	.align 2, 0
_0806DF58: .4byte gWindow1Border
_0806DF5C: .4byte gWrittenToBldy
_0806DF60:
	strb r4, [r2]
	movs r4, #1
_0806DF64:
	ldrb r0, [r2, #2]
	cmp r0, r1
	ble _0806DF70
	subs r0, r0, r1
	strb r0, [r2, #2]
	b _0806DF76
_0806DF70:
	movs r0, #0
	strb r0, [r2, #2]
	adds r4, #1
_0806DF76:
	ldrb r3, [r2, #1]
	movs r5, #0xf0
	subs r0, r5, r1
	cmp r3, r0
	bge _0806DF86
	adds r0, r3, r1
	strb r0, [r2, #1]
	b _0806DF8A
_0806DF86:
	strb r5, [r2, #1]
	adds r4, #1
_0806DF8A:
	ldrb r3, [r2, #3]
	movs r5, #0xa0
	subs r0, r5, r1
	cmp r3, r0
	bge _0806DF9A
	adds r0, r3, r1
	strb r0, [r2, #3]
	b _0806DF9E
_0806DF9A:
	strb r5, [r2, #3]
	adds r4, #1
_0806DF9E:
	asrs r4, r4, #2
	cmp r4, #0
	beq _0806DFA8
	movs r0, #0
	strb r0, [r2, #4]
_0806DFA8:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_6dfb0
unk_6dfb0: @ 0x0806DFB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _0806DFE4 @ =gWindow1Border
	ldrb r1, [r0, #4]
	adds r7, r0, #0
	cmp r1, #0
	bne _0806DFC2
	adds r0, r1, #1
	strb r0, [r7, #4]
_0806DFC2:
	ldr r3, _0806DFE8 @ =gSamusData
	ldr r2, _0806DFEC @ =gBg1XPosition
	ldr r4, _0806DFF0 @ =gBg1YPosition
	movs r1, #0
	add r0, sp, #0xc
_0806DFCC:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _0806DFCC
	ldrh r1, [r3, #0x16]
	ldrh r0, [r2]
	subs r6, r1, r0
	cmp r6, #0
	bge _0806DFF4
	movs r6, #0
	b _0806DFFC
	.align 2, 0
_0806DFE4: .4byte gWindow1Border
_0806DFE8: .4byte gSamusData
_0806DFEC: .4byte gBg1XPosition
_0806DFF0: .4byte gBg1YPosition
_0806DFF4:
	asrs r6, r6, #2
	cmp r6, #0xf0
	ble _0806DFFC
	movs r6, #0xf0
_0806DFFC:
	ldrh r1, [r3, #0x18]
	ldrh r0, [r4]
	adds r0, #0x3f
	subs r5, r1, r0
	cmp r5, #0
	bge _0806E00C
	movs r5, #0
	b _0806E014
_0806E00C:
	asrs r5, r5, #2
	cmp r5, #0xa0
	ble _0806E014
	movs r5, #0xa0
_0806E014:
	ldrb r0, [r7]
	subs r0, r6, r0
	str r0, [sp]
	ldrb r0, [r7, #1]
	subs r0, r0, r6
	str r0, [sp, #4]
	ldrb r0, [r7, #2]
	subs r0, r5, r0
	str r0, [sp, #8]
	ldrb r0, [r7, #3]
	subs r0, r0, r5
	str r0, [sp, #0xc]
	movs r3, #0
	movs r4, #0
	mov r2, sp
_0806E032:
	lsls r0, r3, #2
	add r0, sp
	ldr r1, [r0]
	ldr r0, [r2]
	cmp r1, r0
	bgt _0806E040
	adds r3, r4, #0
_0806E040:
	adds r2, #4
	adds r4, #1
	cmp r4, #3
	ble _0806E032
	lsls r0, r3, #2
	add r0, sp
	ldr r0, [r0]
	subs r1, r0, #2
	asrs r0, r0, #3
	subs r4, r1, r0
	movs r2, #0
	mov r1, sp
	movs r3, #3
_0806E05A:
	ldr r0, [r1]
	cmp r4, r0
	bge _0806E066
	subs r0, r0, r4
	str r0, [r1]
	b _0806E068
_0806E066:
	str r2, [r1]
_0806E068:
	adds r1, #4
	subs r3, #1
	cmp r3, #0
	bge _0806E05A
	ldr r3, [sp]
	cmp r3, #0
	beq _0806E086
	ldrb r1, [r7]
	subs r0, r6, r3
	cmp r1, r0
	bge _0806E084
	adds r0, r1, r3
	strb r0, [r7]
	b _0806E086
_0806E084:
	strb r6, [r7]
_0806E086:
	ldr r3, [sp, #4]
	cmp r3, #0
	beq _0806E09C
	ldrb r1, [r7, #1]
	adds r0, r6, r3
	cmp r1, r0
	ble _0806E09A
	subs r0, r1, r3
	strb r0, [r7, #1]
	b _0806E09C
_0806E09A:
	strb r6, [r7, #1]
_0806E09C:
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _0806E0B2
	ldrb r1, [r7, #2]
	subs r0, r5, r3
	cmp r1, r0
	bge _0806E0B0
	adds r0, r1, r3
	strb r0, [r7, #2]
	b _0806E0B2
_0806E0B0:
	strb r5, [r7, #2]
_0806E0B2:
	ldr r3, [sp, #0xc]
	cmp r3, #0
	beq _0806E0C8
	ldrb r1, [r7, #3]
	adds r0, r5, r3
	cmp r1, r0
	ble _0806E0C6
	subs r0, r1, r3
	strb r0, [r7, #3]
	b _0806E0C8
_0806E0C6:
	strb r5, [r7, #3]
_0806E0C8:
	movs r4, #0
	ldrb r0, [r7]
	cmp r0, r6
	bne _0806E0F4
	ldrb r0, [r7, #1]
	cmp r0, r6
	bne _0806E0F4
	ldrb r0, [r7, #2]
	cmp r0, r5
	bne _0806E0F4
	ldrb r0, [r7, #3]
	cmp r0, r5
	bne _0806E0F4
	ldr r1, _0806E100 @ =gWrittenToBldcnt
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, _0806E104 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r4, #1
	movs r0, #0
	strb r0, [r7, #4]
_0806E0F4:
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806E100: .4byte gWrittenToBldcnt
_0806E104: .4byte gWrittenToBldy

	thumb_func_start StartColorFading
StartColorFading: @ 0x0806E108
	ldr r1, _0806E118 @ =gColorFading
	movs r2, #0
	strb r0, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	strb r2, [r1, #4]
	bx lr
	.align 2, 0
_0806E118: .4byte gColorFading

	thumb_func_start unk_6e11c
unk_6e11c: @ 0x0806E11C
	push {lr}
	sub sp, #4
	ldr r1, _0806E188 @ =gColorFading
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	ldr r0, _0806E18C @ =gBackgroundPositions
	ldrh r1, [r0, #0xe]
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0xc]
	strh r1, [r0, #0x10]
	ldr r1, _0806E190 @ =0x02032000
	ldr r2, _0806E194 @ =0x06003000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0806E198 @ =0x04000008
	ldr r2, _0806E19C @ =gIoRegisters
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	adds r1, #6
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	ldr r3, _0806E1A0 @ =gHazeInfo
	ldrb r1, [r3, #7]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0806E164
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r3, #7]
_0806E164:
	ldr r1, _0806E1A4 @ =0x04000050
	ldrh r0, [r2, #2]
	strh r0, [r1]
	subs r1, #0x50
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r0, _0806E1A8 @ =0x03000047
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806E180
	bl CheckLockHatchesWithTimer
_0806E180:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0806E188: .4byte gColorFading
_0806E18C: .4byte gBackgroundPositions
_0806E190: .4byte 0x02032000
_0806E194: .4byte 0x06003000
_0806E198: .4byte 0x04000008
_0806E19C: .4byte gIoRegisters
_0806E1A0: .4byte gHazeInfo
_0806E1A4: .4byte 0x04000050
_0806E1A8: .4byte 0x03000047

	thumb_func_start unk_6e1ac
unk_6e1ac: @ 0x0806E1AC
	push {lr}
	ldr r0, _0806E22C @ =gBackgroundPositions
	ldrh r1, [r0, #0xe]
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0xc]
	strh r1, [r0, #0x10]
	bl unk_6cf0c
	ldr r0, _0806E230 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	bne _0806E218
	ldr r1, _0806E234 @ =gIoRegisters
	ldr r2, _0806E238 @ =0x04000008
	ldrh r0, [r2]
	strh r0, [r1, #8]
	ldrh r0, [r2]
	strh r0, [r1, #0x10]
	ldr r0, _0806E23C @ =0x0400000A
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldr r0, _0806E240 @ =0x0400000C
	ldrh r0, [r0]
	strh r0, [r1, #0xc]
	ldr r0, _0806E244 @ =0x0400000E
	ldrh r0, [r0]
	strh r0, [r1, #0xe]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _0806E248 @ =0x0400004A
	ldrb r0, [r0]
	strb r0, [r1, #7]
	ldr r0, _0806E24C @ =0x04000049
	ldrb r0, [r0]
	strb r0, [r1, #6]
	adds r2, #0x4a
	ldrh r0, [r2]
	strb r0, [r1, #4]
	ldrh r0, [r2]
	lsrs r0, r0, #8
	strb r0, [r1, #5]
	ldr r0, _0806E250 @ =0x04000050
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r0, _0806E254 @ =gEventCounter
	ldrb r1, [r0]
	cmp r1, #0xc
	bne _0806E218
	ldr r0, _0806E258 @ =gColorFading
	strb r1, [r0]
_0806E218:
	ldr r1, _0806E25C @ =gWrittenToBldalpha_R
	ldr r2, _0806E234 @ =gIoRegisters
	ldrb r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _0806E260 @ =gWrittenToBldalpha_L
	ldrb r0, [r2, #5]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806E22C: .4byte gBackgroundPositions
_0806E230: .4byte gPauseScreenFlag
_0806E234: .4byte gIoRegisters
_0806E238: .4byte 0x04000008
_0806E23C: .4byte 0x0400000A
_0806E240: .4byte 0x0400000C
_0806E244: .4byte 0x0400000E
_0806E248: .4byte 0x0400004A
_0806E24C: .4byte 0x04000049
_0806E250: .4byte 0x04000050
_0806E254: .4byte gEventCounter
_0806E258: .4byte gColorFading
_0806E25C: .4byte gWrittenToBldalpha_R
_0806E260: .4byte gWrittenToBldalpha_L

	thumb_func_start unk_6e264
unk_6e264: @ 0x0806E264
	push {lr}
	ldr r1, _0806E294 @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r1, r0
	cmp r1, #0
	bne _0806E30A
	movs r3, #0
	ldr r0, _0806E298 @ =gCurrentRoomEntry
	ldrb r1, [r0, #0x10]
	adds r0, r1, #0
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0806E2BC
	ldr r1, _0806E29C @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806E2A4
	ldr r0, _0806E2A0 @ =gWrittenToBldalpha_R
	ldrh r0, [r0]
	cmp r0, #0
	beq _0806E2F6
	b _0806E2A8
	.align 2, 0
_0806E294: .4byte gFrameCounter8Bit
_0806E298: .4byte gCurrentRoomEntry
_0806E29C: .4byte gWrittenToBldalpha_L
_0806E2A0: .4byte gWrittenToBldalpha_R
_0806E2A4:
	subs r0, #1
	strh r0, [r1]
_0806E2A8:
	ldr r1, _0806E2B8 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	beq _0806E2FA
	subs r0, #1
	strh r0, [r1]
	b _0806E2FA
	.align 2, 0
_0806E2B8: .4byte gWrittenToBldalpha_R
_0806E2BC:
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _0806E2F6
	ldr r1, _0806E2DC @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	cmp r0, #0xf
	bls _0806E2E4
	ldr r0, _0806E2E0 @ =gWrittenToBldalpha_R
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0806E2F6
	b _0806E2EA
	.align 2, 0
_0806E2DC: .4byte gWrittenToBldalpha_L
_0806E2E0: .4byte gWrittenToBldalpha_R
_0806E2E4:
	adds r0, #1
	strh r0, [r1]
	ldr r2, _0806E310 @ =gWrittenToBldalpha_R
_0806E2EA:
	ldrh r0, [r2]
	cmp r0, #0
	beq _0806E2F4
	subs r0, #1
	strh r0, [r2]
_0806E2F4:
	movs r3, #1
_0806E2F6:
	cmp r3, #0
	beq _0806E30A
_0806E2FA:
	ldr r2, _0806E314 @ =gWrittenToBldalpha
	ldr r0, _0806E318 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0806E310 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_0806E30A:
	pop {r0}
	bx r0
	.align 2, 0
_0806E310: .4byte gWrittenToBldalpha_R
_0806E314: .4byte gWrittenToBldalpha
_0806E318: .4byte gWrittenToBldalpha_L

	thumb_func_start unk_6e31c
unk_6e31c: @ 0x0806E31C
	push {r4, r5, lr}
	sub sp, #4
	bl unk_6ee8c
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	movs r4, #0x80
	lsls r4, r4, #0x13
	ldrh r1, [r4]
	ldr r0, _0806E390 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r4]
	ldr r1, _0806E394 @ =0x083F21A4
	ldr r5, _0806E398 @ =0x02032000
	movs r0, #0
	adds r2, r5, #0
	bl RleDecompress
	ldr r2, _0806E39C @ =0x06003000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r1, r5, #0
	bl DmaTransfer
	ldr r1, _0806E3A0 @ =0x0400000E
	ldr r2, _0806E3A4 @ =0x00004604
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0806E3A8 @ =gBackgroundPositions
	movs r0, #0x40
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x12]
	ldr r1, _0806E3AC @ =0x0400001E
	strh r0, [r1]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _0806E3B0 @ =0x040000D4
	ldr r0, _0806E3B4 @ =0x0840807C
	str r0, [r1]
	ldr r0, _0806E3B8 @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _0806E3BC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E390: .4byte 0x0000F0FF
_0806E394: .4byte 0x083F21A4
_0806E398: .4byte 0x02032000
_0806E39C: .4byte 0x06003000
_0806E3A0: .4byte 0x0400000E
_0806E3A4: .4byte 0x00004604
_0806E3A8: .4byte gBackgroundPositions
_0806E3AC: .4byte 0x0400001E
_0806E3B0: .4byte 0x040000D4
_0806E3B4: .4byte 0x0840807C
_0806E3B8: .4byte 0x05000020
_0806E3BC: .4byte 0x80000010

	thumb_func_start unk_6e3c0
unk_6e3c0: @ 0x0806E3C0
	push {r4, lr}
	movs r4, #0
	ldr r1, _0806E3DC @ =gColorFading
	ldrb r0, [r1]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #0xc
	bhi _0806E470
	lsls r0, r0, #2
	ldr r1, _0806E3E0 @ =_0806E3E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E3DC: .4byte gColorFading
_0806E3E0: .4byte _0806E3E4
_0806E3E4: @ jump table
	.4byte _0806E41C @ case 0
	.4byte _0806E41C @ case 1
	.4byte _0806E438 @ case 2
	.4byte _0806E438 @ case 3
	.4byte _0806E41C @ case 4
	.4byte _0806E41C @ case 5
	.4byte _0806E43E @ case 6
	.4byte _0806E43E @ case 7
	.4byte _0806E470 @ case 8
	.4byte _0806E470 @ case 9
	.4byte _0806E470 @ case 10
	.4byte _0806E418 @ case 11
	.4byte _0806E460 @ case 12
_0806E418:
	bl SaXUpdateGraphicsAndDraw
_0806E41C:
	ldr r0, _0806E434 @ =gColorFading
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0806E428
	bl unk_6e11c
_0806E428:
	movs r0, #0
	movs r1, #0
	bl unk_6dacc
	b _0806E46E
	.align 2, 0
_0806E434: .4byte gColorFading
_0806E438:
	bl unk_6eb04
	b _0806E46E
_0806E43E:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0806E448
	bl unk_6e11c
_0806E448:
	ldr r1, _0806E458 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0806E45C
	subs r0, #1
	strh r0, [r1]
	b _0806E470
	.align 2, 0
_0806E458: .4byte gWrittenToBldy
_0806E45C:
	movs r4, #1
	b _0806E474
_0806E460:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0806E46A
	bl unk_6e11c
_0806E46A:
	bl unk_6df20
_0806E46E:
	adds r4, r0, #0
_0806E470:
	cmp r4, #0
	beq _0806E4AC
_0806E474:
	ldr r0, _0806E490 @ =gColorFading
	ldrb r0, [r0]
	cmp r0, #1
	blt _0806E4A0
	cmp r0, #2
	ble _0806E494
	cmp r0, #6
	bgt _0806E4A0
	bl CheckPlayNewMusicTrack
	movs r0, #0x22
	bl CheckUpdateSubEventAndMusic
	b _0806E4A0
	.align 2, 0
_0806E490: .4byte gColorFading
_0806E494:
	ldr r0, _0806E4B4 @ =0x03004DE8
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0806E4A0
	bl IncreaseMusicVolume
_0806E4A0:
	movs r0, #2
	bl StartColorFading
	ldr r1, _0806E4B8 @ =gColorFading
	movs r0, #0
	strb r0, [r1, #1]
_0806E4AC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E4B4: .4byte 0x03004DE8
_0806E4B8: .4byte gColorFading

	thumb_func_start unk_6e4bc
unk_6e4bc: @ 0x0806E4BC
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _0806E4E4 @ =gColorFading
	ldrb r2, [r0, #3]
	adds r1, r2, #0
	adds r4, r0, #0
	cmp r1, #0xff
	beq _0806E4D0
	adds r0, r2, #1
	strb r0, [r4, #3]
_0806E4D0:
	ldrb r0, [r4]
	subs r0, #1
	cmp r0, #0x11
	bls _0806E4DA
	b _0806E60A
_0806E4DA:
	lsls r0, r0, #2
	ldr r1, _0806E4E8 @ =_0806E4EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E4E4: .4byte gColorFading
_0806E4E8: .4byte _0806E4EC
_0806E4EC: @ jump table
	.4byte _0806E534 @ case 0
	.4byte _0806E534 @ case 1
	.4byte _0806E540 @ case 2
	.4byte _0806E540 @ case 3
	.4byte _0806E534 @ case 4
	.4byte _0806E534 @ case 5
	.4byte _0806E5C0 @ case 6
	.4byte _0806E5C0 @ case 7
	.4byte _0806E54C @ case 8
	.4byte _0806E546 @ case 9
	.4byte _0806E60A @ case 10
	.4byte _0806E574 @ case 11
	.4byte _0806E5EC @ case 12
	.4byte _0806E568 @ case 13
	.4byte _0806E60A @ case 14
	.4byte _0806E568 @ case 15
	.4byte _0806E60A @ case 16
	.4byte _0806E552 @ case 17
_0806E534:
	bl unk_6e8c0
	cmp r0, #0
	beq _0806E60A
	movs r5, #2
	b _0806E60E
_0806E540:
	bl unk_6e670
	b _0806E56C
_0806E546:
	bl unk_6e92c
	b _0806E56C
_0806E54C:
	bl unk_6e9a8
	b _0806E56C
_0806E552:
	bl unk_6ea40
	cmp r0, #0
	beq _0806E60A
	ldr r1, _0806E564 @ =gDisableSoftReset
	movs r0, #1
	strb r0, [r1]
	movs r5, #1
	b _0806E60E
	.align 2, 0
_0806E564: .4byte gDisableSoftReset
_0806E568:
	bl unk_6eaa4
_0806E56C:
	cmp r0, #0
	beq _0806E60A
	movs r5, #1
	b _0806E60E
_0806E574:
	bl unk_6e1ac
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0806E5A8 @ =0x040000D4
	ldr r0, _0806E5AC @ =0x0840809C
	str r0, [r1]
	ldr r0, _0806E5B0 @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _0806E5B4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0806E5B8 @ =gWrittenToDispcnt
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	ldr r0, _0806E5BC @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2]
	bl unk_6cf0c
	movs r5, #1
	b _0806E60E
	.align 2, 0
_0806E5A8: .4byte 0x040000D4
_0806E5AC: .4byte 0x0840809C
_0806E5B0: .4byte 0x05000020
_0806E5B4: .4byte 0x80000010
_0806E5B8: .4byte gWrittenToDispcnt
_0806E5BC: .4byte 0x0000E0FF
_0806E5C0:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0806E5D0
	bl unk_6e1ac
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806E5D0:
	ldr r1, _0806E5E0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0806E5E4
	adds r0, #1
	strh r0, [r1]
	b _0806E60A
	.align 2, 0
_0806E5E0: .4byte gWrittenToBldy
_0806E5E4:
	bl unk_6e31c
	movs r5, #2
	b _0806E60E
_0806E5EC:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0806E5FC
	bl unk_6e1ac
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806E5FC:
	bl unk_6dfb0
	cmp r0, #0
	beq _0806E60A
	bl unk_6e31c
	movs r5, #2
_0806E60A:
	cmp r5, #0
	beq _0806E64C
_0806E60E:
	ldr r0, _0806E654 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _0806E634
	ldr r0, _0806E658 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806E634
	ldr r0, _0806E65C @ =0x030054B0
	bl StopMusic
	ldr r0, _0806E660 @ =0x030055F0
	bl StopMusic
	ldr r0, _0806E664 @ =0x030054F0
	bl StopMusic
_0806E634:
	ldr r1, _0806E668 @ =gNextOamSlot
	movs r0, #0
	strb r0, [r1]
	bl HudDraw
	bl ParticleUpdate
	bl ResetFreeOam
	ldr r1, _0806E66C @ =gColorFading
	movs r0, #0
	strb r0, [r1, #1]
_0806E64C:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806E654: .4byte gSamusData
_0806E658: .4byte gPauseScreenFlag
_0806E65C: .4byte 0x030054B0
_0806E660: .4byte 0x030055F0
_0806E664: .4byte 0x030054F0
_0806E668: .4byte gNextOamSlot
_0806E66C: .4byte gColorFading

	thumb_func_start unk_6e670
unk_6e670: @ 0x0806E670
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	ldr r0, _0806E68C @ =gColorFading
	ldrb r1, [r0, #1]
	adds r4, r0, #0
	cmp r1, #5
	bls _0806E682
	b _0806E8B0
_0806E682:
	lsls r0, r1, #2
	ldr r1, _0806E690 @ =_0806E694
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E68C: .4byte gColorFading
_0806E690: .4byte _0806E694
_0806E694: @ jump table
	.4byte _0806E6AC @ case 0
	.4byte _0806E6B2 @ case 1
	.4byte _0806E6D4 @ case 2
	.4byte _0806E728 @ case 3
	.4byte _0806E848 @ case 4
	.4byte _0806E8B0 @ case 5
_0806E6AC:
	bl unk_6e1ac
	b _0806E700
_0806E6B2:
	movs r0, #1
	movs r1, #1
	bl unk_6dacc
	cmp r0, #0
	beq _0806E6C6
	ldr r1, _0806E6D0 @ =gColorFading
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
_0806E6C6:
	movs r0, #0
	bl unk_6e264
	b _0806E8B6
	.align 2, 0
_0806E6D0: .4byte gColorFading
_0806E6D4:
	bl unk_6ee8c
	movs r0, #0xa0
	lsls r0, r0, #0x13
	movs r3, #0
	strh r3, [r0]
	ldr r1, _0806E70C @ =0x040000D4
	ldr r0, _0806E710 @ =0x0840807C
	str r0, [r1]
	ldr r0, _0806E714 @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _0806E718 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0806E71C @ =0x0000B3FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0806E720 @ =gSamusOnTopOfBackgrounds
	strb r3, [r0]
_0806E700:
	ldr r1, _0806E724 @ =gColorFading
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _0806E8B6
	.align 2, 0
_0806E70C: .4byte 0x040000D4
_0806E710: .4byte 0x0840807C
_0806E714: .4byte 0x05000020
_0806E718: .4byte 0x80000010
_0806E71C: .4byte 0x0000B3FF
_0806E720: .4byte gSamusOnTopOfBackgrounds
_0806E724: .4byte gColorFading
_0806E728:
	ldr r1, _0806E758 @ =0x083F21A4
	ldr r4, _0806E75C @ =0x02032000
	movs r0, #0
	adds r2, r4, #0
	bl RleDecompress
	ldr r2, _0806E760 @ =0x06003000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r1, r4, #0
	bl DmaTransfer
	ldr r0, _0806E764 @ =gDoorPositionStart
	ldrh r0, [r0]
	cmp r0, #0
	beq _0806E76C
	ldr r1, _0806E768 @ =gBackgroundPositions
	movs r0, #0x98
	lsls r0, r0, #1
	b _0806E772
	.align 2, 0
_0806E758: .4byte 0x083F21A4
_0806E75C: .4byte 0x02032000
_0806E760: .4byte 0x06003000
_0806E764: .4byte gDoorPositionStart
_0806E768: .4byte gBackgroundPositions
_0806E76C:
	ldr r1, _0806E800 @ =gBackgroundPositions
	movs r0, #0x8c
	lsls r0, r0, #2
_0806E772:
	strh r0, [r1, #0x10]
	adds r3, r1, #0
	ldr r0, _0806E804 @ =gDoorPositionStart
	ldrh r0, [r0, #2]
	lsls r0, r0, #6
	ldr r1, _0806E808 @ =gBg1YPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	asrs r0, r0, #2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r3, #0x12]
	ldr r2, _0806E80C @ =0x0400001C
	ldrh r0, [r3, #0x10]
	strh r0, [r2]
	ldr r0, _0806E810 @ =0x0400001E
	strh r1, [r0]
	ldr r1, _0806E814 @ =gWrittenToBldcnt_Special
	ldr r3, _0806E818 @ =0x00003F48
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0806E81C @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	subs r0, #0x43
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0806E820 @ =gWrittenToBldalpha_L
	ldr r6, _0806E824 @ =gWrittenToBldalpha_R
	cmp r0, #2
	bls _0806E7BA
	movs r0, #0x10
	strh r0, [r5]
	movs r0, #0
	strh r0, [r6]
_0806E7BA:
	ldr r2, _0806E828 @ =gWrittenToBldalpha
	ldrh r0, [r5]
	lsls r0, r0, #8
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0806E82C @ =0x03004E3E
	ldr r2, _0806E830 @ =0x00004604
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0806E834 @ =0x03004E40
	ldr r0, _0806E838 @ =0x0400000A
	ldrh r0, [r0]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0806E83C @ =gWrittenToDispcnt
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	ldr r1, _0806E840 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0806E844 @ =gColorFading
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0
	strb r0, [r1, #3]
	movs r7, #0
	b _0806E8B6
	.align 2, 0
_0806E800: .4byte gBackgroundPositions
_0806E804: .4byte gDoorPositionStart
_0806E808: .4byte gBg1YPosition
_0806E80C: .4byte 0x0400001C
_0806E810: .4byte 0x0400001E
_0806E814: .4byte gWrittenToBldcnt_Special
_0806E818: .4byte 0x00003F48
_0806E81C: .4byte gCurrentRoomEntry
_0806E820: .4byte gWrittenToBldalpha_L
_0806E824: .4byte gWrittenToBldalpha_R
_0806E828: .4byte gWrittenToBldalpha
_0806E82C: .4byte 0x03004E3E
_0806E830: .4byte 0x00004604
_0806E834: .4byte 0x03004E40
_0806E838: .4byte 0x0400000A
_0806E83C: .4byte gWrittenToDispcnt
_0806E840: .4byte 0x0000FEFF
_0806E844: .4byte gColorFading
_0806E848:
	ldr r0, _0806E864 @ =gWrittenToBldalpha_L
	ldrh r2, [r0]
	adds r3, r2, #0
	adds r5, r0, #0
	cmp r3, #0
	bne _0806E86C
	ldr r0, _0806E868 @ =gWrittenToBldalpha_R
	ldrh r1, [r0]
	adds r6, r0, #0
	cmp r1, #0xf
	bhi _0806E898
	strh r3, [r5]
	b _0806E872
	.align 2, 0
_0806E864: .4byte gWrittenToBldalpha_L
_0806E868: .4byte gWrittenToBldalpha_R
_0806E86C:
	subs r0, r2, #1
	strh r0, [r5]
	ldr r6, _0806E87C @ =gWrittenToBldalpha_R
_0806E872:
	ldrh r0, [r6]
	cmp r0, #0xf
	bhi _0806E880
	adds r0, #1
	b _0806E882
	.align 2, 0
_0806E87C: .4byte gWrittenToBldalpha_R
_0806E880:
	movs r0, #0x10
_0806E882:
	strh r0, [r6]
	ldr r0, _0806E894 @ =gWrittenToBldalpha
	ldrh r1, [r5]
	lsls r1, r1, #8
	ldrh r2, [r6]
	orrs r1, r2
	strh r1, [r0]
	b _0806E8B6
	.align 2, 0
_0806E894: .4byte gWrittenToBldalpha
_0806E898:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0806E8AC @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	strb r3, [r4, #3]
	movs r0, #5
	b _0806E8B4
	.align 2, 0
_0806E8AC: .4byte 0x0000FDFF
_0806E8B0:
	movs r7, #1
	movs r0, #0
_0806E8B4:
	strb r0, [r4, #1]
_0806E8B6:
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start unk_6e8c0
unk_6e8c0: @ 0x0806E8C0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806E8D8 @ =gColorFading
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _0806E904
	cmp r0, #1
	bgt _0806E8DC
	cmp r0, #0
	beq _0806E8E2
	b _0806E924
	.align 2, 0
_0806E8D8: .4byte gColorFading
_0806E8DC:
	cmp r0, #2
	beq _0806E91E
	b _0806E924
_0806E8E2:
	bl unk_6e1ac
	ldr r0, _0806E900 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0806E8F8
	movs r0, #6
	bl CheckUpdateSubEventAndMusic
_0806E8F8:
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _0806E924
	.align 2, 0
_0806E900: .4byte gPauseScreenFlag
_0806E904:
	movs r0, #1
	movs r1, #0
	bl unk_6dacc
	cmp r0, #0
	beq _0806E916
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806E916:
	movs r0, #0
	bl unk_6e264
	b _0806E924
_0806E91E:
	bl unk_6e31c
	movs r5, #1
_0806E924:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_6e92c
unk_6e92c: @ 0x0806E92C
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806E944 @ =gColorFading
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _0806E958
	cmp r0, #1
	bgt _0806E948
	cmp r0, #0
	beq _0806E952
	b _0806E99E
	.align 2, 0
_0806E944: .4byte gColorFading
_0806E948:
	cmp r0, #2
	beq _0806E978
	cmp r0, #3
	beq _0806E992
	b _0806E99E
_0806E952:
	bl unk_6e1ac
	b _0806E968
_0806E958:
	ldrb r0, [r4, #3]
	cmp r0, #0x1e
	bls _0806E99E
	ldr r1, _0806E974 @ =0x03004FC8
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806E968
	strb r5, [r1]
_0806E968:
	strb r5, [r4, #3]
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _0806E99E
	.align 2, 0
_0806E974: .4byte 0x03004FC8
_0806E978:
	movs r0, #1
	movs r1, #3
	bl unk_6dacc
	cmp r0, #0
	beq _0806E98A
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806E98A:
	movs r0, #7
	bl unk_6e264
	b _0806E99E
_0806E992:
	bl unk_6e31c
	movs r0, #2
	bl StartColorFading
	movs r5, #1
_0806E99E:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6e9a8
unk_6e9a8: @ 0x0806E9A8
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806E9C0 @ =gColorFading
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _0806EA0C
	cmp r0, #1
	bgt _0806E9C4
	cmp r0, #0
	beq _0806E9CA
	b _0806EA34
	.align 2, 0
_0806E9C0: .4byte gColorFading
_0806E9C4:
	cmp r0, #2
	beq _0806EA24
	b _0806EA34
_0806E9CA:
	bl unk_6e1ac
	ldr r1, _0806E9E4 @ =gCurrentCutscene
	strb r5, [r1]
	ldr r0, _0806E9E8 @ =gPauseScreenFlag
	strb r5, [r0]
	ldr r0, _0806E9EC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _0806E9F0
	movs r0, #0xb
	b _0806E9FA
	.align 2, 0
_0806E9E4: .4byte gCurrentCutscene
_0806E9E8: .4byte gPauseScreenFlag
_0806E9EC: .4byte gEventCounter
_0806E9F0:
	cmp r0, #0x66
	bls _0806E9F8
	movs r0, #0x81
	b _0806E9FA
_0806E9F8:
	movs r0, #0xc
_0806E9FA:
	strb r0, [r1]
	ldr r1, _0806EA08 @ =gColorFading
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _0806EA34
	.align 2, 0
_0806EA08: .4byte gColorFading
_0806EA0C:
	movs r0, #1
	movs r1, #3
	bl unk_6dacc
	cmp r0, #0
	beq _0806EA34
	bl StopAllMusicsAndSounds
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _0806EA34
_0806EA24:
	bl unk_6ee8c
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _0806EA3C @ =0x00007FFF
	adds r0, r2, #0
	strh r0, [r1]
	movs r5, #1
_0806EA34:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806EA3C: .4byte 0x00007FFF

	thumb_func_start unk_6ea40
unk_6ea40: @ 0x0806EA40
	push {r4, lr}
	movs r4, #0
	ldr r3, _0806EA54 @ =gColorFading
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _0806EA58
	cmp r0, #1
	beq _0806EA7C
	b _0806EA92
	.align 2, 0
_0806EA54: .4byte gColorFading
_0806EA58:
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r4, [r0]
	ldr r2, _0806EA74 @ =gWrittenToDispcnt
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	ldr r0, _0806EA78 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2]
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	b _0806EA92
	.align 2, 0
_0806EA74: .4byte gWrittenToDispcnt
_0806EA78: .4byte 0x0000E0FF
_0806EA7C:
	bl unk_6ee8c
	movs r0, #0x69
	bl FadeMusic
	ldr r0, _0806EA9C @ =gPauseScreenFlag
	strb r4, [r0]
	ldr r1, _0806EAA0 @ =gCurrentCutscene
	movs r0, #0x80
	strb r0, [r1]
	movs r4, #1
_0806EA92:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806EA9C: .4byte gPauseScreenFlag
_0806EAA0: .4byte gCurrentCutscene

	thumb_func_start unk_6eaa4
unk_6eaa4: @ 0x0806EAA4
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806EABC @ =gColorFading
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _0806EAD6
	cmp r0, #1
	bgt _0806EAC0
	cmp r0, #0
	beq _0806EAC6
	b _0806EAFC
	.align 2, 0
_0806EABC: .4byte gColorFading
_0806EAC0:
	cmp r0, #2
	beq _0806EAF0
	b _0806EAFC
_0806EAC6:
	bl unk_6e1ac
	bl DemoEnd
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _0806EAFC
_0806EAD6:
	movs r0, #1
	movs r1, #2
	bl unk_6dacc
	cmp r0, #0
	beq _0806EAE8
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806EAE8:
	movs r0, #3
	bl unk_6e264
	b _0806EAFC
_0806EAF0:
	bl unk_6ee8c
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r5, [r0]
	movs r5, #1
_0806EAFC:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_6eb04
unk_6eb04: @ 0x0806EB04
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _0806EB2C @ =gColorFading
	ldrb r2, [r0, #3]
	adds r1, r2, #0
	adds r7, r0, #0
	cmp r1, #0xff
	beq _0806EB1A
	adds r0, r2, #1
	strb r0, [r7, #3]
_0806EB1A:
	ldrb r0, [r7, #1]
	cmp r0, #4
	bls _0806EB22
	b _0806ECF2
_0806EB22:
	lsls r0, r0, #2
	ldr r1, _0806EB30 @ =_0806EB34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806EB2C: .4byte gColorFading
_0806EB30: .4byte _0806EB34
_0806EB34: @ jump table
	.4byte _0806EB48 @ case 0
	.4byte _0806EBA4 @ case 1
	.4byte _0806EBD6 @ case 2
	.4byte _0806EC80 @ case 3
	.4byte _0806ECA6 @ case 4
_0806EB48:
	ldr r0, _0806EB60 @ =gBackgroundPositions
	ldrh r0, [r0, #0x10]
	movs r1, #0x8c
	lsls r1, r1, #2
	cmp r0, r1
	bne _0806EB68
	ldr r1, _0806EB64 @ =gDoorPositionStart
	movs r0, #0x98
	lsls r0, r0, #1
	strh r0, [r1]
	adds r3, r1, #0
	b _0806EB6E
	.align 2, 0
_0806EB60: .4byte gBackgroundPositions
_0806EB64: .4byte gDoorPositionStart
_0806EB68:
	ldr r0, _0806EB98 @ =gDoorPositionStart
	strh r1, [r0]
	adds r3, r0, #0
_0806EB6E:
	ldrh r0, [r3, #2]
	lsls r2, r0, #6
	ldr r0, _0806EB9C @ =gBg1YPosition
	ldrh r1, [r0]
	subs r1, r2, r1
	asrs r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldr r0, _0806EBA0 @ =0x03000047
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0806EB92
	b _0806EC8C
_0806EB92:
	bl CheckLockHatchesWithTimer
	b _0806EC8C
	.align 2, 0
_0806EB98: .4byte gDoorPositionStart
_0806EB9C: .4byte gBg1YPosition
_0806EBA0: .4byte 0x03000047
_0806EBA4:
	ldr r0, _0806EBB8 @ =gDoorPositionStart
	ldr r3, _0806EBBC @ =gBackgroundPositions
	ldrh r1, [r3, #0x12]
	ldrh r2, [r0, #2]
	adds r0, r1, #0
	cmp r2, r0
	bls _0806EBC0
	adds r0, r1, #1
	strh r0, [r3, #0x12]
	b _0806ECF2
	.align 2, 0
_0806EBB8: .4byte gDoorPositionStart
_0806EBBC: .4byte gBackgroundPositions
_0806EBC0:
	cmp r2, r0
	bhs _0806EBCA
	subs r0, r1, #1
	strh r0, [r3, #0x12]
	b _0806ECF2
_0806EBCA:
	ldrb r0, [r7, #1]
	adds r0, #1
	movs r1, #0
	strb r0, [r7, #1]
	strb r1, [r7, #3]
	b _0806ECF2
_0806EBD6:
	ldr r0, _0806EBF8 @ =gDoorPositionStart
	ldr r4, _0806EBFC @ =gBackgroundPositions
	ldrh r3, [r0]
	ldrh r0, [r4, #0x10]
	adds r2, r3, #0
	adds r1, r0, #0
	cmp r2, r1
	bls _0806EC00
	adds r0, #6
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r2, r0
	blo _0806EBF4
	b _0806ECF2
_0806EBF4:
	strh r3, [r4, #0x10]
	b _0806ECF2
	.align 2, 0
_0806EBF8: .4byte gDoorPositionStart
_0806EBFC: .4byte gBackgroundPositions
_0806EC00:
	cmp r2, r1
	bhs _0806EC14
	subs r0, #6
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r2, r0
	bls _0806ECF2
	strh r3, [r4, #0x10]
	b _0806ECF2
_0806EC14:
	ldr r1, _0806EC64 @ =0x02032000
	ldr r2, _0806EC68 @ =0x06003000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0806EC6C @ =0x04000008
	ldr r2, _0806EC70 @ =gIoRegisters
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	adds r1, #6
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0x10]
	ldr r3, _0806EC74 @ =gHazeInfo
	ldrb r1, [r3, #7]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0806EC4E
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r3, #7]
_0806EC4E:
	ldr r1, _0806EC78 @ =0x04000050
	ldrh r0, [r2, #2]
	strh r0, [r1]
	subs r1, #0x50
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _0806EC7C @ =gColorFading
	movs r0, #0
	strb r0, [r1, #3]
	b _0806EC8E
	.align 2, 0
_0806EC64: .4byte 0x02032000
_0806EC68: .4byte 0x06003000
_0806EC6C: .4byte 0x04000008
_0806EC70: .4byte gIoRegisters
_0806EC74: .4byte gHazeInfo
_0806EC78: .4byte 0x04000050
_0806EC7C: .4byte gColorFading
_0806EC80:
	movs r0, #0
	movs r1, #0
	bl unk_6dacc
	cmp r0, #0
	beq _0806ECF2
_0806EC8C:
	ldr r1, _0806EC98 @ =gColorFading
_0806EC8E:
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _0806ECF2
	.align 2, 0
_0806EC98: .4byte gColorFading
_0806EC9C:
	ldrb r0, [r5]
	movs r1, #0x88
	orrs r0, r1
	strb r0, [r5]
	b _0806ECEC
_0806ECA6:
	ldr r0, _0806ECD4 @ =0x0300144F
	movs r1, #0
	strb r1, [r0]
	movs r2, #0
	adds r5, r0, #0
	ldr r0, _0806ECD8 @ =gLastDoorUsed
	ldrb r3, [r0]
	adds r4, r5, #0
	ldr r6, _0806ECDC @ =0x03004E04
	ldr r1, _0806ECE0 @ =gHatchData
_0806ECBA:
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r3, r0
	bne _0806ECE4
	ldrb r0, [r1]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0806EC9C
	ldrb r0, [r4]
	movs r1, #0x48
	orrs r0, r1
	strb r0, [r4]
	b _0806ECEC
	.align 2, 0
_0806ECD4: .4byte 0x0300144F
_0806ECD8: .4byte gLastDoorUsed
_0806ECDC: .4byte 0x03004E04
_0806ECE0: .4byte gHatchData
_0806ECE4:
	adds r1, #4
	adds r2, #1
	cmp r2, #5
	ble _0806ECBA
_0806ECEC:
	movs r5, #1
	movs r0, #0
	strb r0, [r7, #1]
_0806ECF2:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ColorFadingApplyMonochrome
ColorFadingApplyMonochrome: @ 0x0806ECFC
	push {r4, r5, lr}
	ldr r5, _0806ED34 @ =0x03000018
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0xff
	beq _0806ED78
	movs r0, #0x80
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0806ED3C
	movs r0, #1
	movs r1, #0
	bl unk_6dacc
	cmp r0, #0
	beq _0806ED78
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0806ED38 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xff
	strb r0, [r5]
	b _0806ED78
	.align 2, 0
_0806ED34: .4byte 0x03000018
_0806ED38: .4byte 0x0000F0FF
_0806ED3C:
	cmp r1, #1
	bne _0806ED5C
	movs r0, #0x14
	bl StartColorFading
	ldr r1, _0806ED58 @ =0x03000043
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806ED6A
	strb r4, [r1]
	bl unk_6ee8c
	b _0806ED6A
	.align 2, 0
_0806ED58: .4byte 0x03000043
_0806ED5C:
	cmp r1, #2
	bne _0806ED68
	movs r0, #0x13
	bl StartColorFading
	b _0806ED6A
_0806ED68:
	strb r4, [r5]
_0806ED6A:
	bl unk_6cf0c
	ldr r0, _0806ED80 @ =0x03000018
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
_0806ED78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED80: .4byte 0x03000018

	thumb_func_start HazeSetBackgroundEffect
HazeSetBackgroundEffect: @ 0x0806ED84
	push {r4, r5, lr}
	bl HazeResetLoops
	ldr r5, _0806EDC4 @ =0x03000043
	ldr r4, _0806EDC8 @ =0x0879BB98
	ldr r3, _0806EDCC @ =gCurrentRoomEntry
	ldrb r0, [r3, #0x10]
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, r1, r4
	ldrb r0, [r1]
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806EDD4
	ldrb r1, [r3, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r3, #0x14]
	ldr r2, _0806EDD0 @ =0x03004E4C
	ldrb r1, [r3, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	b _0806EDE0
	.align 2, 0
_0806EDC4: .4byte 0x03000043
_0806EDC8: .4byte 0x0879BB98
_0806EDCC: .4byte gCurrentRoomEntry
_0806EDD0: .4byte 0x03004E4C
_0806EDD4:
	ldrb r0, [r3, #1]
	cmp r0, #0x47
	bne _0806EDE0
	bl GetAtmosphericStabilizerHazeValue
	strb r0, [r5]
_0806EDE0:
	ldr r0, _0806EDF0 @ =0x03000043
	ldrb r0, [r0]
	bl HazeSetupCode
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDF0: .4byte 0x03000043

	thumb_func_start GetAtmosphericStabilizerHazeValue
GetAtmosphericStabilizerHazeValue: @ 0x0806EDF4
	push {r4, r5, lr}
	movs r3, #0
	ldr r1, _0806EE00 @ =0x083E3758
	ldrb r2, [r1, #1]
	ldr r4, _0806EE04 @ =gEventCounter
	b _0806EE12
	.align 2, 0
_0806EE00: .4byte 0x083E3758
_0806EE04: .4byte gEventCounter
_0806EE08:
	adds r1, #2
	adds r3, #1
	cmp r3, #1
	bgt _0806EE1A
	ldrb r2, [r1, #1]
_0806EE12:
	ldrb r0, [r4]
	ldrb r5, [r1]
	cmp r0, r5
	bhi _0806EE08
_0806EE1A:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HazeTransferAndDeactivate
HazeTransferAndDeactivate: @ 0x0806EE24
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r6, _0806EE78 @ =gHazeInfo
	ldrb r7, [r6, #7]
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0806EE6E
	ldr r2, _0806EE7C @ =0x040000B0
	ldr r5, _0806EE80 @ =0x02024000
	str r5, [r2]
	ldr r4, [r6]
	str r4, [r2, #4]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	ldr r1, _0806EE84 @ =0x80600000
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r3, sp
	ldr r0, _0806EE88 @ =0x083C94CC
	ldrb r1, [r0]
	strb r1, [r3]
	mov r0, sp
	strb r1, [r0]
	str r5, [r2]
	str r4, [r2, #4]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0x7f
	ands r0, r7
	strb r0, [r6, #7]
_0806EE6E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE78: .4byte gHazeInfo
_0806EE7C: .4byte 0x040000B0
_0806EE80: .4byte 0x02024000
_0806EE84: .4byte 0x80600000
_0806EE88: .4byte 0x083C94CC

	thumb_func_start unk_6ee8c
unk_6ee8c: @ 0x0806EE8C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r6, _0806EEEC @ =gHazeInfo
	ldrb r7, [r6, #7]
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0806EEE4
	ldr r2, _0806EEF0 @ =0x040000B0
	ldr r5, _0806EEF4 @ =0x02024000
	str r5, [r2]
	ldr r4, [r6]
	str r4, [r2, #4]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	ldr r1, _0806EEF8 @ =0x80600000
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r3, sp
	ldr r0, _0806EEFC @ =0x083C94CC
	ldrb r1, [r0]
	strb r1, [r3]
	mov r0, sp
	strb r1, [r0]
	str r5, [r2]
	str r4, [r2, #4]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0x7f
	ands r0, r7
	strb r0, [r6, #7]
	movs r1, #0
	movs r0, #2
	strb r0, [r6, #6]
	ldr r0, _0806EF00 @ =0x02024A00
	str r0, [r6]
	ldr r0, _0806EF04 @ =0x03000043
	strb r1, [r0]
_0806EEE4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EEEC: .4byte gHazeInfo
_0806EEF0: .4byte 0x040000B0
_0806EEF4: .4byte 0x02024000
_0806EEF8: .4byte 0x80600000
_0806EEFC: .4byte 0x083C94CC
_0806EF00: .4byte 0x02024A00
_0806EF04: .4byte 0x03000043

	thumb_func_start HazeSetupCode
HazeSetupCode: @ 0x0806EF08
	push {r4, lr}
	sub sp, #4
	ldr r4, _0806EF34 @ =0x03000043
	strb r0, [r4]
	ldr r2, _0806EF38 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #7]
	bl HazeTransferAndDeactivate
	ldrb r0, [r4]
	subs r0, #1
	cmp r0, #0xa
	bls _0806EF2A
	b _0806F20E
_0806EF2A:
	lsls r0, r0, #2
	ldr r1, _0806EF3C @ =_0806EF40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806EF34: .4byte 0x03000043
_0806EF38: .4byte gHazeInfo
_0806EF3C: .4byte _0806EF40
_0806EF40: @ jump table
	.4byte _0806EF6C @ case 0
	.4byte _0806EF98 @ case 1
	.4byte _0806EFA0 @ case 2
	.4byte _0806EFA8 @ case 3
	.4byte _0806EFF8 @ case 4
	.4byte _0806F048 @ case 5
	.4byte _0806F098 @ case 6
	.4byte _0806F0E8 @ case 7
	.4byte _0806F1BC @ case 8
	.4byte _0806F208 @ case 9
	.4byte _0806F208 @ case 10
_0806EF6C:
	bl HazeCalculateGradient
	ldr r2, _0806EF94 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #2
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r2, #4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806EF94: .4byte gHazeInfo
_0806EF98:
	ldr r1, _0806EF9C @ =Haze_Bg3
	b _0806EFFA
	.align 2, 0
_0806EF9C: .4byte Haze_Bg3
_0806EFA0:
	ldr r1, _0806EFA4 @ =Haze_Bg3StrongWeak
	b _0806EFFA
	.align 2, 0
_0806EFA4: .4byte Haze_Bg3StrongWeak
_0806EFA8:
	ldr r1, _0806EFE4 @ =Haze_Bg0
	ldr r4, _0806EFE8 @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806EFEC @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806EFF0 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #2
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r2, #4]
	ldr r0, _0806EFF4 @ =0x04000010
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806EFE4: .4byte Haze_Bg0
_0806EFE8: .4byte 0x03001704
_0806EFEC: .4byte 0x030053FC
_0806EFF0: .4byte gHazeInfo
_0806EFF4: .4byte 0x04000010
_0806EFF8:
	ldr r1, _0806F034 @ =Haze_Bg3NoneWeak
_0806EFFA:
	ldr r4, _0806F038 @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F03C @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F040 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #2
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r2, #4]
	ldr r0, _0806F044 @ =0x0400001C
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806F034: .4byte Haze_Bg3NoneWeak
_0806F038: .4byte 0x03001704
_0806F03C: .4byte 0x030053FC
_0806F040: .4byte gHazeInfo
_0806F044: .4byte 0x0400001C
_0806F048:
	ldr r1, _0806F084 @ =Haze_Bg3Bg2StrongWeakMedium
	ldr r4, _0806F088 @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F08C @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F090 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #8
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r2, #4]
	ldr r0, _0806F094 @ =0x04000018
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806F084: .4byte Haze_Bg3Bg2StrongWeakMedium
_0806F088: .4byte 0x03001704
_0806F08C: .4byte 0x030053FC
_0806F090: .4byte gHazeInfo
_0806F094: .4byte 0x04000018
_0806F098:
	ldr r1, _0806F0D4 @ =Haze_Bg3Bg2Bg1
	ldr r4, _0806F0D8 @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F0DC @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F0E0 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #0xc
	strb r0, [r2, #6]
	movs r0, #0xf0
	lsls r0, r0, #3
	strh r0, [r2, #4]
	ldr r0, _0806F0E4 @ =0x04000014
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806F0D4: .4byte Haze_Bg3Bg2Bg1
_0806F0D8: .4byte 0x03001704
_0806F0DC: .4byte 0x030053FC
_0806F0E0: .4byte gHazeInfo
_0806F0E4: .4byte 0x04000014
_0806F0E8:
	ldr r1, _0806F17C @ =gWrittenToWinin_L
	movs r0, #0x1f
	strb r0, [r1]
	ldr r1, _0806F180 @ =gWrittenToWinout_R
	movs r0, #0x37
	strb r0, [r1]
	ldr r1, _0806F184 @ =gWrittenToBldcnt_Special
	movs r0, #0xcf
	strh r0, [r1]
	ldr r1, _0806F188 @ =0x04000054
	movs r0, #0xc
	strh r0, [r1]
	ldr r1, _0806F18C @ =gWrittenToWin1V
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _0806F190 @ =gWrittenToWin1H
	movs r0, #0
	strh r0, [r1]
	movs r0, #0
	bl PowerBombYellowTint
	ldr r0, _0806F194 @ =gIoRegisters
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0806F138
	ldr r0, _0806F198 @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	cmp r0, #0x14
	beq _0806F138
	ldr r2, _0806F19C @ =gWrittenToDispcnt
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r2]
_0806F138:
	ldr r1, _0806F1A0 @ =gBackdropColor
	ldr r2, _0806F1A4 @ =0x00007FFF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0806F1A8 @ =Haze_PowerBombExpanding
	ldr r4, _0806F1AC @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F1B0 @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F1B4 @ =gHazeInfo
	ldrb r0, [r2, #7]
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #7]
	movs r0, #2
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r2, #4]
	ldr r0, _0806F1B8 @ =0x04000042
	str r0, [r2]
	b _0806F1E6
	.align 2, 0
_0806F17C: .4byte gWrittenToWinin_L
_0806F180: .4byte gWrittenToWinout_R
_0806F184: .4byte gWrittenToBldcnt_Special
_0806F188: .4byte 0x04000054
_0806F18C: .4byte gWrittenToWin1V
_0806F190: .4byte gWrittenToWin1H
_0806F194: .4byte gIoRegisters
_0806F198: .4byte gCurrentRoomEntry
_0806F19C: .4byte gWrittenToDispcnt
_0806F1A0: .4byte gBackdropColor
_0806F1A4: .4byte 0x00007FFF
_0806F1A8: .4byte Haze_PowerBombExpanding
_0806F1AC: .4byte 0x03001704
_0806F1B0: .4byte 0x030053FC
_0806F1B4: .4byte gHazeInfo
_0806F1B8: .4byte 0x04000042
_0806F1BC:
	ldr r1, _0806F1F8 @ =Haze_PowerBombRetracting
	ldr r4, _0806F1FC @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F200 @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F204 @ =gHazeInfo
	ldrb r0, [r2, #7]
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #7]
_0806F1E6:
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0806F20E
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r2, #7]
	b _0806F20E
	.align 2, 0
_0806F1F8: .4byte Haze_PowerBombRetracting
_0806F1FC: .4byte 0x03001704
_0806F200: .4byte 0x030053FC
_0806F204: .4byte gHazeInfo
_0806F208:
	ldr r1, _0806F218 @ =0x03000043
	movs r0, #0
	strb r0, [r1]
_0806F20E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F218: .4byte 0x03000043

	thumb_func_start HazeResetLoops
HazeResetLoops: @ 0x0806F21C
	push {lr}
	ldr r0, _0806F244 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806F236
	ldr r1, _0806F248 @ =0x030053EC
	ldr r0, _0806F24C @ =0x083E375C
	ldr r0, [r0]
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
_0806F236:
	ldr r0, _0806F250 @ =0x030053F8
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0806F254 @ =0x030053F9
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0806F244: .4byte gPauseScreenFlag
_0806F248: .4byte 0x030053EC
_0806F24C: .4byte 0x083E375C
_0806F250: .4byte 0x030053F8
_0806F254: .4byte 0x030053F9

	thumb_func_start HazeCalculateGradient
HazeCalculateGradient: @ 0x0806F258
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _0806F278 @ =0x02024A00
	str r0, [sp]
	movs r3, #0
_0806F26A:
	movs r7, #0
	cmp r3, #4
	bgt _0806F280
	ldr r1, _0806F27C @ =0x050001C0
	ldrh r7, [r1]
	b _0806F288
	.align 2, 0
_0806F278: .4byte 0x02024A00
_0806F27C: .4byte 0x050001C0
_0806F280:
	cmp r3, #0x9a
	ble _0806F288
	ldr r1, _0806F3FC @ =0x050001C0
	ldrh r7, [r1, #0x1e]
_0806F288:
	strh r7, [r0]
	adds r0, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _0806F26A
	ldr r0, [sp]
	adds r0, #0xa
	str r0, [sp]
	movs r3, #0
_0806F29A:
	lsls r2, r3, #1
	ldr r1, _0806F3FC @ =0x050001C0
	adds r2, r2, r1
	ldrh r1, [r2]
	movs r6, #0x1f
	ands r6, r1
	movs r5, #0xf8
	lsls r5, r5, #2
	ands r5, r1
	lsrs r5, r5, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r0, r0, #0xa
	str r0, [sp, #4]
	ldrh r1, [r2, #2]
	movs r4, #0x1f
	ands r4, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	mov sl, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r0, r0, #0xa
	mov r8, r0
	subs r4, r4, r6
	mov r0, sl
	subs r0, r0, r5
	mov sl, r0
	mov r1, r8
	ldr r0, [sp, #4]
	subs r1, r1, r0
	mov r8, r1
	movs r7, #0
	adds r3, #1
	str r3, [sp, #0x18]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x1c]
	lsls r6, r6, #0x18
	str r6, [sp, #0x20]
	adds r0, r4, #0
	movs r1, #0x64
	bl __modsi3
	str r0, [sp, #0x10]
	mov r0, sl
	movs r1, #0xa
	bl __divsi3
	str r0, [sp, #0x14]
	lsls r5, r5, #0x18
	mov sb, r5
	movs r0, #0
	str r0, [sp, #0x24]
_0806F320:
	ldr r1, [sp, #0x20]
	lsrs r6, r1, #0x18
	ldr r0, [sp, #0x1c]
	movs r1, #0xa
	bl __divsi3
	adds r6, r6, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, [sp, #0x24]
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, sb
	lsrs r5, r0, #0x18
	mov r0, sl
	movs r1, #0xa
	bl __modsi3
	muls r0, r7, r0
	movs r1, #0xa
	bl __divsi3
	adds r5, r5, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, sl
	movs r1, #0x64
	bl __modsi3
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r5, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, r8
	movs r1, #0xa
	bl __divsi3
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r1, [sp, #4]
	adds r4, r1, r4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, r8
	movs r1, #0xa
	bl __modsi3
	muls r0, r7, r0
	movs r1, #0xa
	bl __divsi3
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, r8
	movs r1, #0x64
	bl __modsi3
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsls r5, r5, #5
	orrs r6, r5
	lsrs r4, r4, #0xe
	orrs r6, r4
	ldr r0, [sp]
	strh r6, [r0]
	adds r0, #2
	str r0, [sp]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	adds r1, r1, r0
	str r1, [sp, #0x1c]
	ldr r1, [sp, #8]
	lsls r0, r1, #0x18
	ldr r1, [sp, #0x20]
	adds r1, r1, r0
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x18
	add sb, r0
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x24]
	adds r7, #1
	cmp r7, #9
	ble _0806F320
	ldr r3, [sp, #0x18]
	cmp r3, #0xe
	bgt _0806F3EC
	b _0806F29A
_0806F3EC:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F3FC: .4byte 0x050001C0

	thumb_func_start HazeProcess
HazeProcess: @ 0x0806F400
	push {r4, lr}
	movs r4, #0
	ldr r0, _0806F418 @ =0x03000043
	ldrb r0, [r0]
	cmp r0, #0xe
	bls _0806F40E
	b _0806F5AA
_0806F40E:
	lsls r0, r0, #2
	ldr r1, _0806F41C @ =_0806F420
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806F418: .4byte 0x03000043
_0806F41C: .4byte _0806F420
_0806F420: @ jump table
	.4byte _0806F5AA @ case 0
	.4byte _0806F5AA @ case 1
	.4byte _0806F45C @ case 2
	.4byte _0806F45C @ case 3
	.4byte _0806F45C @ case 4
	.4byte _0806F45C @ case 5
	.4byte _0806F45C @ case 6
	.4byte _0806F5A0 @ case 7
	.4byte _0806F46C @ case 8
	.4byte _0806F514 @ case 9
	.4byte _0806F5AA @ case 10
	.4byte _0806F5AA @ case 11
	.4byte _0806F5AA @ case 12
	.4byte _0806F5A6 @ case 13
	.4byte _0806F5A6 @ case 14
_0806F45C:
	ldr r0, _0806F468 @ =0x030053FC
	ldr r0, [r0]
	bl _call_via_r0
	b _0806F5AA
	.align 2, 0
_0806F468: .4byte 0x030053FC
_0806F46C:
	ldr r0, _0806F4A4 @ =0x030053FC
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	bne _0806F47A
	b _0806F5AA
_0806F47A:
	ldr r1, _0806F4A8 @ =0x03000043
	movs r0, #9
	strb r0, [r1]
	movs r0, #9
	bl HazeSetupCode
	ldr r1, _0806F4AC @ =gCurrentPowerBomb
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0806F4B0 @ =0x03004FC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F4C4
	ldr r1, _0806F4B4 @ =0x040000D4
	ldr r0, _0806F4B8 @ =0x02035400
	str r0, [r1]
	ldr r0, _0806F4BC @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0806F4C0 @ =0x80000100
	b _0806F4D0
	.align 2, 0
_0806F4A4: .4byte 0x030053FC
_0806F4A8: .4byte 0x03000043
_0806F4AC: .4byte gCurrentPowerBomb
_0806F4B0: .4byte 0x03004FC8
_0806F4B4: .4byte 0x040000D4
_0806F4B8: .4byte 0x02035400
_0806F4BC: .4byte 0x02035000
_0806F4C0: .4byte 0x80000100
_0806F4C4:
	ldr r1, _0806F4F4 @ =0x040000D4
	ldr r0, _0806F4F8 @ =0x02035400
	str r0, [r1]
	ldr r0, _0806F4FC @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0806F500 @ =0x800000F0
_0806F4D0:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0806F504 @ =gColorFading
	ldrb r1, [r2, #4]
	movs r0, #1
	movs r3, #0
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r1, _0806F508 @ =gWrittenToWinin_L
	movs r0, #0x37
	strb r0, [r1]
	ldr r1, _0806F50C @ =gWrittenToWinout_R
	movs r0, #0x1f
	strb r0, [r1]
	ldr r0, _0806F510 @ =gBackdropColor
	strh r3, [r0]
	b _0806F5AA
	.align 2, 0
_0806F4F4: .4byte 0x040000D4
_0806F4F8: .4byte 0x02035400
_0806F4FC: .4byte 0x02035000
_0806F500: .4byte 0x800000F0
_0806F504: .4byte gColorFading
_0806F508: .4byte gWrittenToWinin_L
_0806F50C: .4byte gWrittenToWinout_R
_0806F510: .4byte gBackdropColor
_0806F514:
	ldr r0, _0806F54C @ =0x030053FC
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	beq _0806F5AA
	ldr r0, _0806F550 @ =gIoRegisters
	ldrh r1, [r0, #8]
	movs r2, #0
	strh r1, [r0, #0x10]
	ldr r1, _0806F554 @ =gCurrentPowerBomb
	movs r0, #5
	strb r0, [r1]
	strb r2, [r1, #1]
	movs r0, #0xa
	bl HazeSetupCode
	ldr r0, _0806F558 @ =0x03004FC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F56C
	ldr r1, _0806F55C @ =0x040000D4
	ldr r0, _0806F560 @ =0x02035400
	str r0, [r1]
	ldr r0, _0806F564 @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0806F568 @ =0x80000100
	b _0806F578
	.align 2, 0
_0806F54C: .4byte 0x030053FC
_0806F550: .4byte gIoRegisters
_0806F554: .4byte gCurrentPowerBomb
_0806F558: .4byte 0x03004FC8
_0806F55C: .4byte 0x040000D4
_0806F560: .4byte 0x02035400
_0806F564: .4byte 0x02035000
_0806F568: .4byte 0x80000100
_0806F56C:
	ldr r1, _0806F58C @ =0x040000D4
	ldr r0, _0806F590 @ =0x02035400
	str r0, [r1]
	ldr r0, _0806F594 @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0806F598 @ =0x800000F0
_0806F578:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0806F59C @ =gColorFading
	ldrb r1, [r2, #4]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #4]
	movs r4, #1
	b _0806F5AE
	.align 2, 0
_0806F58C: .4byte 0x040000D4
_0806F590: .4byte 0x02035400
_0806F594: .4byte 0x02035000
_0806F598: .4byte 0x800000F0
_0806F59C: .4byte gColorFading
_0806F5A0:
	bl Haze_Bg3Bg2Bg1
	b _0806F5AA
_0806F5A6:
	bl unk_6fdd0
_0806F5AA:
	cmp r4, #0
	beq _0806F5BC
_0806F5AE:
	bl HazeSetBackgroundEffect
	ldr r0, _0806F5C4 @ =0x03000043
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F5BC
	movs r4, #0
_0806F5BC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806F5C4: .4byte 0x03000043

	thumb_func_start Haze_Bg3
Haze_Bg3: @ 0x0806F5C8
	push {r4, r5, r6, r7, lr}
	ldr r6, _0806F614 @ =0x02024A00
	movs r3, #0
	ldr r2, _0806F618 @ =0x030053EC
	strb r3, [r2, #0xb]
	strb r3, [r2, #7]
	ldr r0, _0806F61C @ =0x083C9550
	mov ip, r0
	movs r7, #0xf
	strb r3, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806F5F0
	movs r0, #1
	strb r0, [r2, #3]
	strh r3, [r2]
_0806F5F0:
	ldr r1, _0806F620 @ =0x030053F8
	ldrb r0, [r2, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	ldr r0, _0806F624 @ =gEffectYPosition
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _0806F628 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	subs r1, #1
	cmp r1, #0xa0
	ble _0806F62C
	movs r1, #0xa0
	b _0806F632
	.align 2, 0
_0806F614: .4byte 0x02024A00
_0806F618: .4byte 0x030053EC
_0806F61C: .4byte 0x083C9550
_0806F620: .4byte 0x030053F8
_0806F624: .4byte gEffectYPosition
_0806F628: .4byte gBg1YPosition
_0806F62C:
	cmp r1, #0
	bge _0806F632
	movs r1, #0
_0806F632:
	movs r3, #0
	cmp r3, r1
	bge _0806F64C
	ldr r4, _0806F680 @ =gBackgroundPositions
	adds r2, r6, #0
	adds r3, r1, #0
_0806F63E:
	ldrh r0, [r4, #0xc]
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _0806F63E
	adds r3, r1, #0
_0806F64C:
	cmp r3, #0x9f
	bgt _0806F67A
	ldr r5, _0806F684 @ =0x030053F8
	ldr r4, _0806F680 @ =gBackgroundPositions
	lsls r0, r3, #1
	adds r2, r0, r6
_0806F658:
	ldrh r0, [r4, #0xe]
	adds r0, r0, r3
	ldrb r6, [r5]
	adds r1, r0, r6
	ands r1, r7
	mov r6, ip
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0xc]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _0806F658
_0806F67A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F680: .4byte gBackgroundPositions
_0806F684: .4byte 0x030053F8

	thumb_func_start Haze_Bg3StrongWeak
Haze_Bg3StrongWeak: @ 0x0806F688
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0806F704 @ =0x02024A00
	mov ip, r0
	movs r3, #0
	ldr r2, _0806F708 @ =0x030053EC
	strb r3, [r2, #0xb]
	ldr r5, _0806F70C @ =0x083C9550
	mov sb, r5
	movs r7, #0xf
	mov r8, r7
	strb r3, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806F6BA
	movs r0, #1
	strb r0, [r2, #3]
	strh r3, [r2]
_0806F6BA:
	ldr r0, _0806F710 @ =0x083E3728
	mov sl, r0
	movs r6, #0xf
	movs r0, #0
	strb r0, [r2, #7]
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _0806F6D8
	movs r0, #1
	strb r0, [r2, #7]
	strh r3, [r2, #4]
_0806F6D8:
	ldr r1, _0806F714 @ =0x030053F8
	ldrb r0, [r2, #3]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	ldr r1, _0806F718 @ =0x030053F9
	ldrb r0, [r2, #7]
	ldrb r5, [r1]
	adds r0, r0, r5
	strb r0, [r1]
	ldr r0, _0806F71C @ =gEffectYPosition
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _0806F720 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	subs r1, #1
	cmp r1, #0xa0
	ble _0806F724
	movs r1, #0xa0
	b _0806F72A
	.align 2, 0
_0806F704: .4byte 0x02024A00
_0806F708: .4byte 0x030053EC
_0806F70C: .4byte 0x083C9550
_0806F710: .4byte 0x083E3728
_0806F714: .4byte 0x030053F8
_0806F718: .4byte 0x030053F9
_0806F71C: .4byte gEffectYPosition
_0806F720: .4byte gBg1YPosition
_0806F724:
	cmp r1, #0
	bge _0806F72A
	movs r1, #0
_0806F72A:
	movs r3, #0
	cmp r3, r1
	bge _0806F756
	ldr r5, _0806F794 @ =0x030053F9
	ldr r4, _0806F798 @ =gBackgroundPositions
	mov r2, ip
_0806F736:
	ldrh r0, [r4, #0xe]
	adds r0, r0, r3
	ldrb r7, [r5]
	adds r0, r0, r7
	ands r0, r6
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r4, #0xc]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, r1
	blt _0806F736
_0806F756:
	cmp r3, #0x9f
	bgt _0806F786
	ldr r4, _0806F79C @ =0x030053F8
	ldr r2, _0806F798 @ =gBackgroundPositions
	lsls r0, r3, #1
	mov r5, ip
	adds r1, r0, r5
_0806F764:
	ldrh r0, [r2, #0xe]
	adds r0, r0, r3
	ldrb r7, [r4]
	adds r0, r0, r7
	mov r5, r8
	ands r0, r5
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r2, #0xc]
	adds r0, r0, r7
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _0806F764
_0806F786:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F794: .4byte 0x030053F9
_0806F798: .4byte gBackgroundPositions
_0806F79C: .4byte 0x030053F8

	thumb_func_start Haze_Bg3NoneWeak
Haze_Bg3NoneWeak: @ 0x0806F7A0
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r2, _0806F7FC @ =0x030053EC
	strb r3, [r2, #0xb]
	strb r3, [r2, #7]
	ldr r6, _0806F800 @ =0x083E3738
	movs r5, #0x1f
	strb r3, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806F7C4
	movs r0, #1
	strb r0, [r2, #3]
	strh r3, [r2]
_0806F7C4:
	ldr r1, _0806F804 @ =0x030053F8
	ldrb r0, [r2, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	adds r4, r1, #0
	ldr r1, _0806F808 @ =gBackgroundPositions
	ldr r2, _0806F80C @ =0x02024A00
_0806F7D4:
	ldrh r0, [r1, #0xe]
	adds r0, r0, r3
	ldrb r7, [r4]
	adds r0, r0, r7
	ands r0, r5
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r1, #0xc]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _0806F7D4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F7FC: .4byte 0x030053EC
_0806F800: .4byte 0x083E3738
_0806F804: .4byte 0x030053F8
_0806F808: .4byte gBackgroundPositions
_0806F80C: .4byte 0x02024A00

	thumb_func_start Haze_Bg3Bg2StrongWeakMedium
Haze_Bg3Bg2StrongWeakMedium: @ 0x0806F810
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r2, _0806F88C @ =0x030053EC
	strb r4, [r2, #7]
	ldr r6, _0806F890 @ =0x083E3738
	movs r5, #0x1f
	strb r4, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806F832
	movs r0, #1
	strb r0, [r2, #3]
	strh r4, [r2]
_0806F832:
	ldr r1, _0806F894 @ =0x030053F8
	ldrb r0, [r2, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	ldr r2, _0806F898 @ =0x02024A00
	ldr r3, _0806F89C @ =gBackgroundPositions
_0806F840:
	ldrh r0, [r3, #0xa]
	adds r0, r0, r4
	ldrb r7, [r1]
	adds r0, r0, r7
	ands r0, r5
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r3, #8]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xe]
	adds r0, r0, r4
	ldrb r7, [r1]
	adds r0, r0, r7
	ands r0, r5
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r3, #0xc]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xe]
	strh r0, [r2]
	adds r2, #2
	adds r4, #1
	cmp r4, #0x9f
	ble _0806F840
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F88C: .4byte 0x030053EC
_0806F890: .4byte 0x083E3738
_0806F894: .4byte 0x030053F8
_0806F898: .4byte 0x02024A00
_0806F89C: .4byte gBackgroundPositions

	thumb_func_start Haze_Bg0
Haze_Bg0: @ 0x0806F8A0
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r0, _0806F8CC @ =0x030053EC
	strb r4, [r0, #7]
	ldr r1, _0806F8D0 @ =0x03004FA0
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	bls _0806F8D4
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806F8DA
	strh r4, [r3, #8]
	ldrb r0, [r3, #0xb]
	adds r0, #1
	cmp r0, #0xd
	bhi _0806F8DA
	b _0806F8D8
	.align 2, 0
_0806F8CC: .4byte 0x030053EC
_0806F8D0: .4byte 0x03004FA0
_0806F8D4:
	movs r0, #0
	strh r4, [r3, #8]
_0806F8D8:
	strb r0, [r3, #0xb]
_0806F8DA:
	adds r2, r3, #0
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #4
	ldr r1, _0806F93C @ =0x083E3518
	adds r5, r0, r1
	movs r6, #0xf
	movs r4, #0
	strb r4, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldrb r0, [r2, #0xb]
	adds r0, #6
	asrs r0, r0, #1
	cmp r1, r0
	blt _0806F904
	movs r0, #1
	strb r0, [r2, #3]
	strh r4, [r2]
_0806F904:
	ldr r1, _0806F940 @ =0x030053F8
	ldrb r0, [r3, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	ldr r2, _0806F944 @ =0x02024A00
	movs r4, #0
	ldr r3, _0806F948 @ =gBackgroundPositions
_0806F914:
	ldrh r0, [r3, #2]
	adds r0, r0, r4
	ldrb r7, [r1]
	adds r0, r0, r7
	ands r0, r6
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r3]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	adds r4, #1
	cmp r4, #0x9f
	ble _0806F914
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F93C: .4byte 0x083E3518
_0806F940: .4byte 0x030053F8
_0806F944: .4byte 0x02024A00
_0806F948: .4byte gBackgroundPositions

	thumb_func_start Haze_Bg3Bg2Bg1
Haze_Bg3Bg2Bg1: @ 0x0806F94C
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r1, _0806F978 @ =0x030053EC
	ldrh r0, [r1, #8]
	adds r2, r0, #1
	strh r2, [r1, #8]
	ldr r0, _0806F97C @ =0x03004E42
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #1
	bne _0806F980
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0806F994
	strh r5, [r3, #8]
	ldrb r0, [r3, #0xb]
	cmp r0, #3
	bhi _0806F994
	adds r0, #1
	b _0806F992
	.align 2, 0
_0806F978: .4byte 0x030053EC
_0806F97C: .4byte 0x03004E42
_0806F980:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0806F994
	strh r5, [r3, #8]
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0806F994
	subs r0, #1
_0806F992:
	strb r0, [r3, #0xb]
_0806F994:
	adds r2, r3, #0
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #5
	ldr r1, _0806FA28 @ =0x083E3608
	adds r4, r0, r1
	movs r0, #0x1f
	mov ip, r0
	movs r1, #0
	strb r1, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0806F9BA
	movs r0, #1
	strb r0, [r2, #3]
	strh r1, [r2]
_0806F9BA:
	ldr r0, _0806FA2C @ =0x030053F8
	ldrb r1, [r0]
	ldrb r2, [r3, #3]
	subs r1, r1, r2
	strb r1, [r0]
	ldr r2, _0806FA30 @ =0x02024A00
	movs r5, #0
	adds r6, r0, #0
	ldr r3, _0806FA34 @ =gBackgroundPositions
_0806F9CC:
	ldrh r0, [r3, #6]
	adds r0, r0, r5
	ldrb r7, [r6]
	adds r1, r0, r7
	mov r0, ip
	ands r1, r0
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r3, #4]
	adds r1, r0, r7
	strh r1, [r2]
	adds r2, #2
	ldrh r0, [r3, #6]
	strh r0, [r2]
	adds r2, #2
	strh r1, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xe]
	adds r0, r0, r5
	ldrb r7, [r6]
	adds r1, r0, r7
	mov r0, ip
	ands r1, r0
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r3, #0xc]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xe]
	strh r0, [r2]
	adds r2, #2
	adds r5, #1
	cmp r5, #0x9f
	ble _0806F9CC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA28: .4byte 0x083E3608
_0806FA2C: .4byte 0x030053F8
_0806FA30: .4byte 0x02024A00
_0806FA34: .4byte gBackgroundPositions

	thumb_func_start Haze_PowerBombExpanding
Haze_PowerBombExpanding: @ 0x0806FA38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806FA98 @ =gCurrentPowerBomb
	ldrb r1, [r0, #0x12]
	mov ip, r0
	cmp r1, #0
	beq _0806FA4A
	b _0806FB62
_0806FA4A:
	ldr r2, _0806FA9C @ =0x083E3294
	mov r0, ip
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov r8, r0
	adds r3, r1, #0
	mov r1, ip
	ldrh r0, [r1, #4]
	ldr r1, _0806FAA0 @ =gBg1XPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x10
	mov r2, ip
	ldrh r0, [r2, #6]
	ldr r1, _0806FAA4 @ =gBg1YPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x10
	ldr r6, _0806FAA8 @ =0x02024A00
	movs r2, #0
	movs r4, #0x9f
_0806FA7C:
	strh r2, [r6]
	subs r4, #1
	adds r6, #2
	cmp r4, #0
	bge _0806FA7C
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r0, r3, r0
	adds r2, r0, #1
	lsls r0, r3, #0x10
	cmp r2, #0x9f
	ble _0806FAAC
	movs r2, #0x9f
	b _0806FAB2
	.align 2, 0
_0806FA98: .4byte gCurrentPowerBomb
_0806FA9C: .4byte 0x083E3294
_0806FAA0: .4byte gBg1XPosition
_0806FAA4: .4byte gBg1YPosition
_0806FAA8: .4byte 0x02024A00
_0806FAAC:
	cmp r2, #0
	bge _0806FAB2
	movs r2, #0
_0806FAB2:
	movs r3, #0
	asrs r1, r1, #0x10
	asrs r0, r0, #0x10
	subs r4, r1, r0
	cmp r4, #0
	bge _0806FAC4
	rsbs r3, r4, #0
	movs r4, #0
	b _0806FACA
_0806FAC4:
	cmp r4, #0x9f
	ble _0806FACA
	movs r4, #0x9f
_0806FACA:
	lsls r0, r4, #1
	ldr r1, _0806FB04 @ =0x02024A00
	adds r6, r0, r1
	cmp r4, r2
	bge _0806FB36
	lsls r0, r5, #0x10
	asrs r7, r0, #0x10
	subs r4, r2, r4
	lsls r0, r3, #2
	mov r2, r8
	adds r5, r0, r2
_0806FAE0:
	movs r0, #2
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	adds r1, r7, r1
	lsls r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	bge _0806FB08
	movs r3, #0
	b _0806FB0E
	.align 2, 0
_0806FB04: .4byte 0x02024A00
_0806FB08:
	cmp r1, #0xf0
	ble _0806FB0E
	movs r3, #0xf0
_0806FB0E:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0806FB1A
	movs r2, #0xf0
	b _0806FB20
_0806FB1A:
	cmp r0, #0
	bge _0806FB20
	movs r2, #0
_0806FB20:
	lsls r1, r3, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r6]
	subs r4, #1
	adds r5, #4
	adds r6, #2
	cmp r4, #0
	bne _0806FAE0
_0806FB36:
	mov r1, ip
	ldrb r0, [r1, #2]
	cmp r0, #0x9e
	bls _0806FB50
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _0806FB62
	movs r0, #1
	b _0806FB64
_0806FB50:
	adds r0, #3
	mov r1, ip
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x9f
	bls _0806FB62
	movs r0, #0x9f
	strb r0, [r1, #2]
_0806FB62:
	movs r0, #0
_0806FB64:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Haze_PowerBombRetracting
Haze_PowerBombRetracting: @ 0x0806FB70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806FBD0 @ =gCurrentPowerBomb
	ldrb r1, [r0, #0x12]
	mov ip, r0
	cmp r1, #0
	beq _0806FB82
	b _0806FC9A
_0806FB82:
	ldr r2, _0806FBD4 @ =0x083E3294
	mov r0, ip
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov r8, r0
	adds r3, r1, #0
	mov r1, ip
	ldrh r0, [r1, #4]
	ldr r1, _0806FBD8 @ =gBg1XPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x10
	mov r2, ip
	ldrh r0, [r2, #6]
	ldr r1, _0806FBDC @ =gBg1YPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x10
	ldr r6, _0806FBE0 @ =0x02024A00
	movs r2, #0
	movs r4, #0x9f
_0806FBB4:
	strh r2, [r6]
	subs r4, #1
	adds r6, #2
	cmp r4, #0
	bge _0806FBB4
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r0, r3, r0
	adds r2, r0, #1
	lsls r0, r3, #0x10
	cmp r2, #0x9f
	ble _0806FBE4
	movs r2, #0x9f
	b _0806FBEA
	.align 2, 0
_0806FBD0: .4byte gCurrentPowerBomb
_0806FBD4: .4byte 0x083E3294
_0806FBD8: .4byte gBg1XPosition
_0806FBDC: .4byte gBg1YPosition
_0806FBE0: .4byte 0x02024A00
_0806FBE4:
	cmp r2, #0
	bge _0806FBEA
	movs r2, #0
_0806FBEA:
	movs r3, #0
	asrs r1, r1, #0x10
	asrs r0, r0, #0x10
	subs r4, r1, r0
	cmp r4, #0
	bge _0806FBFC
	rsbs r3, r4, #0
	movs r4, #0
	b _0806FC02
_0806FBFC:
	cmp r4, #0x9f
	ble _0806FC02
	movs r4, #0x9f
_0806FC02:
	lsls r0, r4, #1
	ldr r1, _0806FC3C @ =0x02024A00
	adds r6, r0, r1
	cmp r4, r2
	bge _0806FC6E
	lsls r0, r5, #0x10
	asrs r7, r0, #0x10
	subs r4, r2, r4
	lsls r0, r3, #2
	mov r2, r8
	adds r5, r0, r2
_0806FC18:
	movs r0, #2
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	adds r1, r7, r1
	lsls r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	bge _0806FC40
	movs r3, #0
	b _0806FC46
	.align 2, 0
_0806FC3C: .4byte 0x02024A00
_0806FC40:
	cmp r1, #0xf0
	ble _0806FC46
	movs r3, #0xf0
_0806FC46:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0806FC52
	movs r2, #0xf0
	b _0806FC58
_0806FC52:
	cmp r0, #0
	bge _0806FC58
	movs r2, #0
_0806FC58:
	lsls r1, r3, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r6]
	subs r4, #1
	adds r5, #4
	adds r6, #2
	cmp r4, #0
	bne _0806FC18
_0806FC6E:
	mov r1, ip
	ldrb r0, [r1, #2]
	cmp r0, #4
	bhi _0806FC88
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _0806FC9A
	movs r0, #1
	b _0806FC9C
_0806FC88:
	subs r0, #3
	mov r1, ip
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _0806FC9A
	movs r0, #4
	strb r0, [r1, #2]
_0806FC9A:
	movs r0, #0
_0806FC9C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6fca8
unk_6fca8: @ 0x0806FCA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _0806FD34 @ =0x03004E28
	ldrh r2, [r1]
	strh r2, [r1, #4]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	mov ip, r1
	ldrh r1, [r1, #2]
	cmp r0, r1
	beq _0806FD26
	mov r3, ip
	strh r2, [r3, #2]
	movs r6, #0
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r1, #0xf8
	lsls r1, r1, #7
	mov r8, r1
	ldr r7, _0806FD38 @ =0x02024A00
_0806FCD6:
	lsls r1, r6, #0xe
	mov r2, ip
	ldrh r4, [r2, #2]
	movs r0, #0x1f
	ands r0, r4
	asrs r3, r1, #0x10
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge _0806FCEE
	movs r5, #0
_0806FCEE:
	lsls r0, r3, #5
	mov r1, sb
	ands r1, r4
	subs r1, r1, r0
	ldr r2, _0806FD3C @ =0xFFFF83E0
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r1, #0
	bge _0806FD06
	movs r2, #0
_0806FD06:
	lsls r1, r3, #0xa
	mov r0, r8
	ands r0, r4
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0806FD18
	movs r1, #0
_0806FD18:
	orrs r2, r1
	orrs r5, r2
	strh r5, [r7]
	adds r7, #2
	adds r6, #1
	cmp r6, #0x9f
	ble _0806FCD6
_0806FD26:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FD34: .4byte 0x03004E28
_0806FD38: .4byte 0x02024A00
_0806FD3C: .4byte 0xFFFF83E0

	thumb_func_start Haze_Bg3Y
Haze_Bg3Y: @ 0x0806FD40
	push {r4, r5, r6, r7, lr}
	ldr r1, _0806FDBC @ =0x030053EC
	movs r2, #0
	strb r2, [r1, #7]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #3
	ble _0806FD64
	ldrb r0, [r3, #0xb]
	cmp r0, #0x3f
	bhi _0806FD64
	adds r0, #1
	strb r0, [r3, #0xb]
	strh r2, [r3, #8]
_0806FD64:
	adds r2, r3, #0
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #5
	ldr r1, _0806FDC0 @ =0x083C9580
	adds r6, r0, r1
	movs r1, #0
	strb r1, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0806FD86
	movs r0, #1
	strb r0, [r2, #3]
	strh r1, [r2]
_0806FD86:
	ldr r1, _0806FDC4 @ =0x030053F8
	ldrb r0, [r3, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	movs r2, #0
	adds r5, r1, #0
	ldr r4, _0806FDC8 @ =gBackgroundPositions
	movs r1, #0x1f
	ldr r3, _0806FDCC @ =0x02024A00
_0806FD9A:
	ldrh r0, [r4, #0xe]
	adds r0, r0, r2
	ldrb r7, [r5]
	adds r0, r0, r7
	ands r0, r1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	ble _0806FD9A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FDBC: .4byte 0x030053EC
_0806FDC0: .4byte 0x083C9580
_0806FDC4: .4byte 0x030053F8
_0806FDC8: .4byte gBackgroundPositions
_0806FDCC: .4byte 0x02024A00

	thumb_func_start unk_6fdd0
unk_6fdd0: @ 0x0806FDD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r3, #0
	ldr r1, _0806FE58 @ =0x030053EC
	strb r3, [r1, #0xb]
	strb r3, [r1, #7]
	ldr r4, _0806FE5C @ =0x02024A00
	ldr r0, _0806FE60 @ =0x083C9DA0
	mov ip, r0
	ldr r7, _0806FE64 @ =0x083C9DC0
	strb r3, [r1, #3]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0806FE00
	movs r0, #1
	strb r0, [r1, #3]
	strh r3, [r1]
_0806FE00:
	ldr r2, _0806FE68 @ =0x030053F8
	ldrb r0, [r1, #3]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	ldr r0, _0806FE6C @ =gCurrentRoomEntry
	ldrb r0, [r0, #0x10]
	cmp r0, #0xd
	beq _0806FE16
	cmp r0, #0xf
	bne _0806FE74
_0806FE16:
	mov r8, r2
	ldr r5, _0806FE70 @ =gBackgroundPositions
	mov sb, r5
	adds r2, r4, #0
	movs r6, #0xf
	mov sl, r6
	movs r4, #0x1f
_0806FE24:
	mov r1, sb
	ldrh r0, [r1, #0xe]
	adds r0, r0, r3
	mov r5, r8
	ldrb r5, [r5]
	adds r1, r0, r5
	adds r0, r1, #0
	mov r6, sl
	ands r0, r6
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2]
	ands r1, r4
	mov r5, ip
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #2]
	adds r2, #4
	adds r3, #1
	cmp r3, #0x9f
	ble _0806FE24
	b _0806FEB4
	.align 2, 0
_0806FE58: .4byte 0x030053EC
_0806FE5C: .4byte 0x02024A00
_0806FE60: .4byte 0x083C9DA0
_0806FE64: .4byte 0x083C9DC0
_0806FE68: .4byte 0x030053F8
_0806FE6C: .4byte gCurrentRoomEntry
_0806FE70: .4byte gBackgroundPositions
_0806FE74:
	mov r8, r2
	ldr r6, _0806FEC4 @ =gBackgroundPositions
	mov sb, r6
	adds r2, r4, #0
	movs r0, #0xf
	mov sl, r0
	movs r4, #0x1f
_0806FE82:
	mov r1, sb
	ldrh r0, [r1, #0xe]
	adds r0, r0, r3
	mov r5, r8
	ldrb r5, [r5]
	adds r1, r0, r5
	adds r0, r1, #0
	mov r6, sl
	ands r0, r6
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2]
	ands r1, r4
	mov r5, ip
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #2]
	adds r2, #4
	adds r3, #1
	cmp r3, #0x9f
	ble _0806FE82
_0806FEB4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FEC4: .4byte gBackgroundPositions

	thumb_func_start UpdateAnimatedPalette
UpdateAnimatedPalette: @ 0x0806FEC8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806FF00 @ =0x03004FC8
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne _0806FED6
	b _0806FFFA
_0806FED6:
	movs r6, #0
	ldr r1, _0806FF04 @ =0x03004FC0
	ldrb r0, [r1]
	adds r5, r0, #1
	strb r5, [r1]
	ldr r2, _0806FF08 @ =0x083E3764
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrb r0, [r3]
	adds r4, r1, #0
	mov ip, r2
	cmp r0, #1
	beq _0806FF0C
	cmp r0, #1
	ble _0806FF98
	cmp r0, #2
	beq _0806FF40
	cmp r0, #3
	beq _0806FF78
	b _0806FF98
	.align 2, 0
_0806FF00: .4byte 0x03004FC8
_0806FF04: .4byte 0x03004FC0
_0806FF08: .4byte 0x083E3764
_0806FF0C:
	ldrb r1, [r3, #1]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0806FF98
	strb r6, [r4]
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	ldrb r1, [r3, #2]
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _0806FF70
	ldr r0, _0806FF3C @ =0x03004E3A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0806FF36
	movs r6, #1
_0806FF36:
	movs r0, #0
	b _0806FF6E
	.align 2, 0
_0806FF3C: .4byte 0x03004E3A
_0806FF40:
	ldrb r1, [r3, #1]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0806FF98
	strb r6, [r4]
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	ldrb r1, [r3, #2]
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _0806FF70
	ldr r0, _0806FF74 @ =0x03004E3A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0806FF6A
	movs r6, #1
_0806FF6A:
	subs r0, r1, #1
	rsbs r0, r0, #0
_0806FF6E:
	strb r0, [r4, #1]
_0806FF70:
	adds r6, #1
	b _0806FF98
	.align 2, 0
_0806FF74: .4byte 0x03004E3A
_0806FF78:
	ldrb r1, [r3, #1]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0806FF98
	strb r6, [r4]
	ldrb r0, [r4, #1]
	subs r0, #1
	strb r0, [r4, #1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0806FF96
	ldrb r0, [r3, #2]
	subs r0, #1
	strb r0, [r4, #1]
_0806FF96:
	movs r6, #1
_0806FF98:
	cmp r6, #0
	beq _0806FFFA
	movs r3, #1
	ldrsb r3, [r4, r3]
	cmp r3, #0
	bge _0806FFA6
	rsbs r3, r3, #0
_0806FFA6:
	ldr r0, _0806FFC8 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0806FFD4
	ldr r2, _0806FFCC @ =0x040000D4
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #4
	adds r0, r0, r1
	lsls r1, r3, #5
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0806FFD0 @ =0x050001E0
	b _0806FFEA
	.align 2, 0
_0806FFC8: .4byte gSubGameMode1
_0806FFCC: .4byte 0x040000D4
_0806FFD0: .4byte 0x050001E0
_0806FFD4:
	ldr r2, _08070000 @ =0x040000D4
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #4
	adds r0, r0, r1
	lsls r1, r3, #5
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08070004 @ =0x020355E0
_0806FFEA:
	str r0, [r2, #4]
	ldr r0, _08070008 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	cmp r6, #2
	bne _0806FFFA
	movs r0, #0
	strb r0, [r7]
_0806FFFA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070000: .4byte 0x040000D4
_08070004: .4byte 0x020355E0
_08070008: .4byte 0x80000010

	thumb_func_start CheckDisableAnimatedPalette
CheckDisableAnimatedPalette: @ 0x0807000C
	push {lr}
	ldr r2, _08070054 @ =0x03004FC0
	ldr r0, _08070058 @ =0x083E3760
	ldr r1, [r0]
	str r1, [r2]
	ldr r0, _0807005C @ =0x03004FC4
	str r1, [r0]
	ldr r1, _08070060 @ =0x03004E3A
	movs r0, #0
	strb r0, [r1]
	bl CheckOnTimerAnimatedPalette
	cmp r0, #1
	bne _0807002E
	ldr r1, _08070064 @ =0x03004FC8
	movs r0, #0
	strb r0, [r1]
_0807002E:
	ldr r3, _08070064 @ =0x03004FC8
	ldrb r0, [r3]
	cmp r0, #0
	beq _0807004E
	ldr r2, _08070068 @ =0x040000D4
	ldr r1, _0807006C @ =0x083E3764
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _08070070 @ =0x050001E0
	str r0, [r2, #4]
	ldr r0, _08070074 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0807004E:
	pop {r0}
	bx r0
	.align 2, 0
_08070054: .4byte 0x03004FC0
_08070058: .4byte 0x083E3760
_0807005C: .4byte 0x03004FC4
_08070060: .4byte 0x03004E3A
_08070064: .4byte 0x03004FC8
_08070068: .4byte 0x040000D4
_0807006C: .4byte 0x083E3764
_08070070: .4byte 0x050001E0
_08070074: .4byte 0x80000010

	thumb_func_start CheckOnTimerAnimatedPalette
CheckOnTimerAnimatedPalette: @ 0x08070078
	push {lr}
	movs r2, #0
	ldr r1, _08070094 @ =gCurrentRoomEntry
	ldrb r0, [r1]
	cmp r0, #0x2a
	bne _0807009C
	ldr r0, _08070098 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x3a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080700B2
	b _080700B0
	.align 2, 0
_08070094: .4byte gCurrentRoomEntry
_08070098: .4byte gEventCounter
_0807009C:
	ldrb r0, [r1, #1]
	cmp r0, #0x12
	bne _080700B2
	ldr r0, _080700B8 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x46
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080700B2
_080700B0:
	movs r2, #1
_080700B2:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080700B8: .4byte gEventCounter

	thumb_func_start SubEventUpdateForSaXEncounter
SubEventUpdateForSaXEncounter: @ 0x080700BC
	push {lr}
	movs r1, #0
	ldr r0, _080700CC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x19
	bne _080700D0
	movs r1, #0x28
	b _080700E2
	.align 2, 0
_080700CC: .4byte gEventCounter
_080700D0:
	cmp r0, #0x30
	bne _080700D8
	movs r1, #0x44
	b _080700E2
_080700D8:
	cmp r0, #0x43
	bne _080700DE
	movs r1, #0x5c
_080700DE:
	cmp r1, #0
	beq _080700EC
_080700E2:
	ldr r0, _080700F0 @ =gSubEventCounter
	strh r1, [r0]
	movs r0, #8
	bl CheckUpdateSubEventAndMusic
_080700EC:
	pop {r0}
	bx r0
	.align 2, 0
_080700F0: .4byte gSubEventCounter

	thumb_func_start UpdateSubEventCounterAfterAbility
UpdateSubEventCounterAfterAbility: @ 0x080700F4
	push {lr}
	ldr r1, _08070114 @ =sAbilityRamValues
	ldr r0, _08070118 @ =gAbilityCount
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #6]
	cmp r1, #0
	beq _08070110
	ldr r0, _0807011C @ =gSubEventCounter
	strh r1, [r0]
	movs r0, #9
	bl CheckUpdateSubEventAndMusic
_08070110:
	pop {r0}
	bx r0
	.align 2, 0
_08070114: .4byte sAbilityRamValues
_08070118: .4byte gAbilityCount
_0807011C: .4byte gSubEventCounter

	thumb_func_start UpdateSubEventAfterNavigationConversation
UpdateSubEventAfterNavigationConversation: @ 0x08070120
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _08070128 @ =gSubEventCounter
	b _08070132
	.align 2, 0
_08070128: .4byte gSubEventCounter
_0807012C:
	cmp r1, r0
	blo _08070154
	adds r3, #1
_08070132:
	cmp r3, #0x15
	bhi _08070154
	ldr r1, _0807015C @ =gPreviousNavigationConversation
	ldr r4, _08070160 @ =0x0879BBCC
	lsls r2, r3, #2
	adds r0, r2, r4
	ldrb r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0807012C
	adds r0, r4, #2
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, #7
	bl CheckUpdateSubEventAndMusic
_08070154:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807015C: .4byte gPreviousNavigationConversation
_08070160: .4byte 0x0879BBCC

	thumb_func_start SetSubEventAndUpdateMusic
SetSubEventAndUpdateMusic: @ 0x08070164
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0807017C @ =gSubEventCounter
	strh r0, [r2]
	adds r0, r1, #0
	bl CheckUpdateSubEventAndMusic
	pop {r0}
	bx r0
	.align 2, 0
_0807017C: .4byte gSubEventCounter

	thumb_func_start CheckUpdateSubEventAndMusic
CheckUpdateSubEventAndMusic: @ 0x08070180
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080701BC @ =gCurrentArea
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #6
	bls _08070194
	bl _0807159A
_08070194:
	ldr r6, _080701C0 @ =gSubEventCounter
	cmp r4, #0x80
	beq _080701D2
	ldr r1, _080701C4 @ =0x0879BC24
	ldrh r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080701D2
	cmp r4, r0
	beq _080701D2
	cmp r0, #0x20
	beq _080701B2
	bl _0807159A
_080701B2:
	cmp r4, #0x21
	bne _080701C8
	movs r3, #1
	b _080701D2
	.align 2, 0
_080701BC: .4byte gCurrentArea
_080701C0: .4byte gSubEventCounter
_080701C4: .4byte 0x0879BC24
_080701C8:
	cmp r4, #0x22
	beq _080701D0
	bl _0807159A
_080701D0:
	movs r3, #2
_080701D2:
	movs r5, #0
	ldrh r0, [r6]
	cmp r0, #0x9b
	bls _080701DE
	bl _0807158A
_080701DE:
	lsls r0, r0, #2
	ldr r1, _080701E8 @ =_080701EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080701E8: .4byte _080701EC
_080701EC: @ jump table
	.4byte _08071588 @ case 0
	.4byte _0807045C @ case 1
	.4byte _08070464 @ case 2
	.4byte _08071588 @ case 3
	.4byte _080704A4 @ case 4
	.4byte _08071588 @ case 5
	.4byte _080704CC @ case 6
	.4byte _080704D6 @ case 7
	.4byte _080704F0 @ case 8
	.4byte _08070530 @ case 9
	.4byte _08071588 @ case 10
	.4byte _08070588 @ case 11
	.4byte _080705AC @ case 12
	.4byte _080705D4 @ case 13
	.4byte _08071588 @ case 14
	.4byte _08070614 @ case 15
	.4byte _08071588 @ case 16
	.4byte _0807063C @ case 17
	.4byte _0807064A @ case 18
	.4byte _08070652 @ case 19
	.4byte _0807065E @ case 20
	.4byte _0807066C @ case 21
	.4byte _08070674 @ case 22
	.4byte _08071588 @ case 23
	.4byte _0807069C @ case 24
	.4byte _08071588 @ case 25
	.4byte _080706DC @ case 26
	.4byte _0807071C @ case 27
	.4byte _08070744 @ case 28
	.4byte _08070776 @ case 29
	.4byte _080707A4 @ case 30
	.4byte _080707C0 @ case 31
	.4byte _080707EC @ case 32
	.4byte _08071588 @ case 33
	.4byte _08070814 @ case 34
	.4byte _08071588 @ case 35
	.4byte _08071588 @ case 36
	.4byte _08070854 @ case 37
	.4byte _08071588 @ case 38
	.4byte _08070894 @ case 39
	.4byte _080708D4 @ case 40
	.4byte _080708E2 @ case 41
	.4byte _08071588 @ case 42
	.4byte _08071588 @ case 43
	.4byte _08070920 @ case 44
	.4byte _0807092A @ case 45
	.4byte _08070944 @ case 46
	.4byte _08071588 @ case 47
	.4byte _0807096C @ case 48
	.4byte _080709AC @ case 49
	.4byte _080709EC @ case 50
	.4byte _08071588 @ case 51
	.4byte _08070A2C @ case 52
	.4byte _08071588 @ case 53
	.4byte _08070A6C @ case 54
	.4byte _08071588 @ case 55
	.4byte _08070AA8 @ case 56
	.4byte _08070AE4 @ case 57
	.4byte _08071588 @ case 58
	.4byte _08070B28 @ case 59
	.4byte _08070B68 @ case 60
	.4byte _08070B88 @ case 61
	.4byte _08071588 @ case 62
	.4byte _08070BB0 @ case 63
	.4byte _08070BBA @ case 64
	.4byte _08070BCE @ case 65
	.4byte _08071588 @ case 66
	.4byte _08070C06 @ case 67
	.4byte _08070BF8 @ case 68
	.4byte _08070C44 @ case 69
	.4byte _08070C80 @ case 70
	.4byte _08071588 @ case 71
	.4byte _08070CC0 @ case 72
	.4byte _08071588 @ case 73
	.4byte _08070D00 @ case 74
	.4byte _08071588 @ case 75
	.4byte _08071588 @ case 76
	.4byte _08070D40 @ case 77
	.4byte _08070D94 @ case 78
	.4byte _08071588 @ case 79
	.4byte _08071588 @ case 80
	.4byte _08071588 @ case 81
	.4byte _08070DAC @ case 82
	.4byte _08071588 @ case 83
	.4byte _08070DE8 @ case 84
	.4byte _08070E24 @ case 85
	.4byte _08071588 @ case 86
	.4byte _08070E68 @ case 87
	.4byte _08071588 @ case 88
	.4byte _08070E80 @ case 89
	.4byte _08071588 @ case 90
	.4byte _08070EB4 @ case 91
	.4byte _08070EE8 @ case 92
	.4byte _08070EF4 @ case 93
	.4byte _08071588 @ case 94
	.4byte _08070F30 @ case 95
	.4byte _08070F3C @ case 96
	.4byte _08070F60 @ case 97
	.4byte _08071588 @ case 98
	.4byte _08070F70 @ case 99
	.4byte _08070F78 @ case 100
	.4byte _08070F7E @ case 101
	.4byte _08070FB4 @ case 102
	.4byte _08071588 @ case 103
	.4byte _08070FE8 @ case 104
	.4byte _08071030 @ case 105
	.4byte _0807104C @ case 106
	.4byte _08071052 @ case 107
	.4byte _08071058 @ case 108
	.4byte _08071588 @ case 109
	.4byte _08071078 @ case 110
	.4byte _080710AC @ case 111
	.4byte _080710E8 @ case 112
	.4byte _08071588 @ case 113
	.4byte _08071114 @ case 114
	.4byte _08071148 @ case 115
	.4byte _08071164 @ case 116
	.4byte _08071588 @ case 117
	.4byte _08071198 @ case 118
	.4byte _08071588 @ case 119
	.4byte _080711CC @ case 120
	.4byte _08071200 @ case 121
	.4byte _08071588 @ case 122
	.4byte _08071234 @ case 123
	.4byte _08071268 @ case 124
	.4byte _08071588 @ case 125
	.4byte _08071588 @ case 126
	.4byte _08071588 @ case 127
	.4byte _0807129C @ case 128
	.4byte _080712BC @ case 129
	.4byte _080712D0 @ case 130
	.4byte _08071588 @ case 131
	.4byte _080712F0 @ case 132
	.4byte _0807132C @ case 133
	.4byte _08071588 @ case 134
	.4byte _08071336 @ case 135
	.4byte _08071588 @ case 136
	.4byte _08071380 @ case 137
	.4byte _080713A0 @ case 138
	.4byte _080713E0 @ case 139
	.4byte _080713E8 @ case 140
	.4byte _08071434 @ case 141
	.4byte _08071442 @ case 142
	.4byte _08071588 @ case 143
	.4byte _08071588 @ case 144
	.4byte _08071448 @ case 145
	.4byte _08071452 @ case 146
	.4byte _08071468 @ case 147
	.4byte _0807149C @ case 148
	.4byte _08071588 @ case 149
	.4byte _080714C8 @ case 150
	.4byte _08071500 @ case 151
	.4byte _08071588 @ case 152
	.4byte _0807151C @ case 153
	.4byte _08071588 @ case 154
	.4byte _08071554 @ case 155
_0807045C:
	movs r0, #0x1e
	movs r1, #2
	bl _08071584
_08070464:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807046E
	bl _0807158A
_0807046E:
	cmp r3, #1
	bne _0807047E
	ldr r0, _0807049C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0807047E
	bl _0807152E
_0807047E:
	cmp r3, #2
	beq _08070486
	bl _0807158A
_08070486:
	ldr r0, _080704A0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08070492
	bl _0807158A
_08070492:
	movs r0, #0x2b
	movs r1, #2
	bl _08071584
	.align 2, 0
_0807049C: .4byte gDestinationDoor
_080704A0: .4byte gCurrentRoom
_080704A4:
	ldr r0, _080704C8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _080704B0
	bl _0807158A
_080704B0:
	cmp r3, #1
	bne _080704B8
	bl _0807152E
_080704B8:
	cmp r3, #2
	beq _080704C0
	bl _0807158A
_080704C0:
	movs r0, #0x2c
	movs r1, #2
	bl _08071584
	.align 2, 0
_080704C8: .4byte gCurrentNavigationRoom
_080704CC:
	movs r0, #0xb4
	bl FadeMusic
	bl _08071588
_080704D6:
	ldr r0, _080704EC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #0
	beq _080704E2
	bl _0807158A
_080704E2:
	movs r0, #3
	movs r1, #2
	bl _08071584
	.align 2, 0
_080704EC: .4byte gLastElevatorUsed
_080704F0:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080704FA
	bl _0807158A
_080704FA:
	cmp r3, #1
	bne _0807050A
	ldr r0, _08070528 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _0807050A
	bl _0807152E
_0807050A:
	cmp r3, #2
	beq _08070512
	bl _0807158A
_08070512:
	ldr r0, _0807052C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xd
	beq _0807051E
	bl _0807158A
_0807051E:
	movs r0, #0x2e
	movs r1, #2
	bl _08071584
	.align 2, 0
_08070528: .4byte gDestinationDoor
_0807052C: .4byte gCurrentRoom
_08070530:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807053A
	bl _0807158A
_0807053A:
	cmp r3, #1
	bne _08070554
	ldr r0, _08070550 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _08070554
	movs r0, #0x3c
	bl FadeMusic
	b _0807056A
	.align 2, 0
_08070550: .4byte gDestinationDoor
_08070554:
	cmp r3, #2
	bne _0807056A
	ldr r0, _08070580 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _0807056A
	movs r0, #0x1e
	movs r1, #2
	bl PlayMusic
	movs r5, #1
_0807056A:
	cmp r5, #0
	bne _08070572
	bl _0807158A
_08070572:
	movs r5, #2
	ldr r1, _08070584 @ =gSubEventCounter
	movs r0, #8
	strh r0, [r1]
	bl _0807158A
	.align 2, 0
_08070580: .4byte gCurrentRoom
_08070584: .4byte gSubEventCounter
_08070588:
	ldr r0, _080705A8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #3
	beq _08070594
	bl _0807158A
_08070594:
	movs r0, #0x34
	movs r1, #2
	bl PlayMusic
	movs r0, #0x33
	movs r1, #0
	bl unk_38a8
	bl _08071588
	.align 2, 0
_080705A8: .4byte gCurrentNavigationRoom
_080705AC:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080705B6
	bl _0807158A
_080705B6:
	ldr r0, _080705D0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x23
	beq _080705C2
	bl _0807158A
_080705C2:
	movs r0, #0x1e
	movs r1, #0x2c
	movs r2, #2
	bl unk_372c
	bl _08071588
	.align 2, 0
_080705D0: .4byte gCurrentRoom
_080705D4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080705DE
	bl _0807158A
_080705DE:
	cmp r3, #1
	bne _080705EE
	ldr r0, _0807060C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x26
	bne _080705EE
	bl _0807152E
_080705EE:
	cmp r3, #2
	beq _080705F6
	bl _0807158A
_080705F6:
	ldr r0, _08070610 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x26
	beq _08070602
	bl _0807158A
_08070602:
	movs r0, #0x18
	movs r1, #2
	bl _08071584
	.align 2, 0
_0807060C: .4byte gDestinationDoor
_08070610: .4byte gCurrentRoom
_08070614:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807061E
	bl _0807158A
_0807061E:
	ldr r0, _08070638 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _0807062A
	bl _0807158A
_0807062A:
	movs r0, #0x1e
	movs r1, #0x2c
	movs r2, #2
	bl unk_372c
	bl _08071588
	.align 2, 0
_08070638: .4byte gCurrentRoom
_0807063C:
	bl unk_36c4
	movs r0, #0xfc
	bl SoundStop
	bl _08071588
_0807064A:
	movs r0, #0x31
	movs r1, #2
	bl _08071584
_08070652:
	movs r0, #0x96
	lsls r0, r0, #1
	bl FadeMusic
	bl _08071588
_0807065E:
	ldr r0, _08070668 @ =0x00000229
	bl SoundPlay_3b1c
	bl _08071588
	.align 2, 0
_08070668: .4byte 0x00000229
_0807066C:
	movs r0, #0x1e
	movs r1, #2
	bl _08071584
_08070674:
	ldr r0, _08070698 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070680
	bl _0807158A
_08070680:
	cmp r3, #1
	bne _08070688
	bl _0807152E
_08070688:
	cmp r3, #2
	beq _08070690
	bl _0807158A
_08070690:
	movs r0, #0xb
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070698: .4byte gCurrentNavigationRoom
_0807069C:
	ldrb r0, [r2]
	cmp r0, #1
	beq _080706A6
	bl _0807158A
_080706A6:
	cmp r3, #1
	bne _080706B6
	ldr r0, _080706D4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x28
	bne _080706B6
	bl _0807152E
_080706B6:
	cmp r3, #2
	beq _080706BE
	bl _0807158A
_080706BE:
	ldr r0, _080706D8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x28
	beq _080706CA
	bl _0807158A
_080706CA:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_080706D4: .4byte gDestinationDoor
_080706D8: .4byte gCurrentRoom
_080706DC:
	ldrb r0, [r2]
	cmp r0, #1
	beq _080706E6
	bl _0807158A
_080706E6:
	cmp r3, #1
	bne _080706F6
	ldr r0, _08070714 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x28
	beq _080706F6
	bl _0807152E
_080706F6:
	cmp r3, #2
	beq _080706FE
	bl _0807158A
_080706FE:
	ldr r0, _08070718 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x28
	bne _0807070A
	bl _0807158A
_0807070A:
	movs r0, #4
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070714: .4byte gDestinationDoor
_08070718: .4byte gCurrentRoom
_0807071C:
	ldr r0, _08070740 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070728
	bl _0807158A
_08070728:
	cmp r3, #1
	bne _08070730
	bl _0807152E
_08070730:
	cmp r3, #2
	beq _08070738
	bl _0807158A
_08070738:
	movs r0, #0xb
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070740: .4byte gCurrentNavigationRoom
_08070744:
	ldrb r0, [r2]
	cmp r0, #1
	beq _0807074E
	bl _0807158A
_0807074E:
	cmp r4, #0x21
	bne _08070768
	ldr r0, _08070764 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #1
	bne _08070768
	movs r0, #0x3c
	bl FadeMusic
	bl _08071588
	.align 2, 0
_08070764: .4byte gDestinationDoor
_08070768:
	cmp r4, #7
	beq _08070770
	bl _0807158A
_08070770:
	movs r0, #0x1e
	bl _08071130
_08070776:
	ldrb r0, [r2]
	cmp r0, #1
	beq _08070780
	bl _0807158A
_08070780:
	ldr r0, _0807079C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807078C
	bl _0807158A
_0807078C:
	movs r0, #4
	movs r1, #0
	bl PlayMusic
	ldr r1, _080707A0 @ =gSubEventCounter
	movs r0, #0x1e
	bl _08071106
	.align 2, 0
_0807079C: .4byte gCurrentRoom
_080707A0: .4byte gSubEventCounter
_080707A4:
	ldr r0, _080707BC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #3
	beq _080707B0
	bl _0807158A
_080707B0:
	movs r0, #0x96
	lsls r0, r0, #1
	bl FadeMusic
	bl _08071588
	.align 2, 0
_080707BC: .4byte gLastElevatorUsed
_080707C0:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080707CA
	bl _0807158A
_080707CA:
	ldr r0, _080707E8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1d
	beq _080707D6
	bl _0807158A
_080707D6:
	movs r1, #0x96
	lsls r1, r1, #1
	movs r0, #0x1e
	movs r2, #4
	bl unk_3778
	bl _08071588
	.align 2, 0
_080707E8: .4byte gCurrentRoom
_080707EC:
	ldr r0, _08070810 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #6
	beq _080707F8
	bl _0807158A
_080707F8:
	cmp r3, #1
	bne _08070800
	bl _0807152E
_08070800:
	cmp r3, #2
	beq _08070808
	bl _0807158A
_08070808:
	movs r0, #0xb
	movs r1, #4
	bl _08071584
	.align 2, 0
_08070810: .4byte gCurrentNavigationRoom
_08070814:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807081E
	bl _0807158A
_0807081E:
	cmp r3, #1
	bne _0807082E
	ldr r0, _0807084C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807082E
	bl _0807152E
_0807082E:
	cmp r3, #2
	beq _08070836
	bl _0807158A
_08070836:
	ldr r0, _08070850 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070842
	bl _0807158A
_08070842:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_0807084C: .4byte gDestinationDoor
_08070850: .4byte gCurrentRoom
_08070854:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807085E
	bl _0807158A
_0807085E:
	cmp r3, #1
	bne _0807086E
	ldr r0, _0807088C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _0807086E
	bl _0807152E
_0807086E:
	cmp r3, #2
	beq _08070876
	bl _0807158A
_08070876:
	ldr r0, _08070890 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _08070882
	bl _0807158A
_08070882:
	movs r0, #0x18
	movs r1, #4
	bl _08071584
	.align 2, 0
_0807088C: .4byte gDestinationDoor
_08070890: .4byte gCurrentRoom
_08070894:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807089E
	bl _0807158A
_0807089E:
	cmp r3, #1
	bne _080708AE
	ldr r0, _080708CC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _080708AE
	bl _0807152E
_080708AE:
	cmp r3, #2
	beq _080708B6
	bl _0807158A
_080708B6:
	ldr r0, _080708D0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _080708C2
	bl _0807158A
_080708C2:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_080708CC: .4byte gDestinationDoor
_080708D0: .4byte gCurrentRoom
_080708D4:
	movs r0, #0x1e
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	bl _08071588
_080708E2:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080708EC
	bl _0807158A
_080708EC:
	cmp r3, #1
	bne _080708FC
	ldr r0, _08070918 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080708FC
	bl _0807152E
_080708FC:
	cmp r3, #2
	beq _08070904
	bl _0807158A
_08070904:
	ldr r0, _0807091C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2d
	bne _08070910
	bl _0807158A
_08070910:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070918: .4byte gDestinationDoor
_0807091C: .4byte gCurrentRoom
_08070920:
	movs r0, #0xc8
	bl FadeMusic
	bl _08071588
_0807092A:
	ldr r0, _08070940 @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #3
	beq _08070936
	bl _0807158A
_08070936:
	movs r0, #0x1e
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070940: .4byte gLastElevatorUsed
_08070944:
	ldr r0, _08070968 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070950
	bl _0807158A
_08070950:
	cmp r3, #1
	bne _08070958
	bl _0807152E
_08070958:
	cmp r3, #2
	beq _08070960
	bl _0807158A
_08070960:
	movs r0, #0xb
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070968: .4byte gCurrentNavigationRoom
_0807096C:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08070976
	bl _0807158A
_08070976:
	cmp r3, #1
	bne _08070986
	ldr r0, _080709A4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070986
	bl _0807152E
_08070986:
	cmp r3, #2
	beq _0807098E
	bl _0807158A
_0807098E:
	ldr r0, _080709A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807099A
	bl _0807158A
_0807099A:
	movs r0, #9
	movs r1, #0
	bl _08071584
	.align 2, 0
_080709A4: .4byte gDestinationDoor
_080709A8: .4byte gCurrentRoom
_080709AC:
	ldrb r0, [r2]
	cmp r0, #4
	beq _080709B6
	bl _0807158A
_080709B6:
	cmp r3, #1
	bne _080709C6
	ldr r0, _080709E4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1f
	bne _080709C6
	bl _0807152E
_080709C6:
	cmp r3, #2
	beq _080709CE
	bl _0807158A
_080709CE:
	ldr r0, _080709E8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1f
	beq _080709DA
	bl _0807158A
_080709DA:
	movs r0, #0x5f
	movs r1, #5
	bl _08071584
	.align 2, 0
_080709E4: .4byte gDestinationDoor
_080709E8: .4byte gCurrentRoom
_080709EC:
	ldrb r0, [r2]
	cmp r0, #4
	beq _080709F6
	bl _0807158A
_080709F6:
	cmp r3, #1
	bne _08070A06
	ldr r0, _08070A24 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2a
	bne _08070A06
	bl _080714DA
_08070A06:
	cmp r3, #2
	beq _08070A0E
	bl _0807158A
_08070A0E:
	ldr r0, _08070A28 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2a
	beq _08070A1A
	bl _0807158A
_08070A1A:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070A24: .4byte gDestinationDoor
_08070A28: .4byte gCurrentRoom
_08070A2C:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08070A36
	bl _0807158A
_08070A36:
	cmp r3, #1
	bne _08070A46
	ldr r0, _08070A64 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2a
	beq _08070A46
	bl _0807152E
_08070A46:
	cmp r3, #2
	beq _08070A4E
	bl _0807158A
_08070A4E:
	ldr r0, _08070A68 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2a
	bne _08070A5A
	bl _0807158A
_08070A5A:
	movs r0, #9
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070A64: .4byte gDestinationDoor
_08070A68: .4byte gCurrentRoom
_08070A6C:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070A76
	bl _0807158A
_08070A76:
	cmp r3, #1
	bne _08070A82
	ldr r0, _08070AA0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070AFA
_08070A82:
	cmp r3, #2
	beq _08070A8A
	bl _0807158A
_08070A8A:
	ldr r0, _08070AA4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070A96
	bl _0807158A
_08070A96:
	movs r0, #0xf
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070AA0: .4byte gDestinationDoor
_08070AA4: .4byte gCurrentRoom
_08070AA8:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070AB2
	bl _0807158A
_08070AB2:
	cmp r3, #1
	bne _08070ABE
	ldr r0, _08070ADC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #4
	bne _08070AFA
_08070ABE:
	cmp r3, #2
	beq _08070AC6
	bl _0807158A
_08070AC6:
	ldr r0, _08070AE0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #4
	bne _08070AD2
	bl _0807158A
_08070AD2:
	movs r0, #7
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070ADC: .4byte gDestinationDoor
_08070AE0: .4byte gCurrentRoom
_08070AE4:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070AEE
	bl _0807158A
_08070AEE:
	cmp r3, #1
	bne _08070B08
	ldr r0, _08070B04 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x15
	bne _08070B08
_08070AFA:
	movs r0, #0x1e
	bl FadeMusic
	bl _0807158A
	.align 2, 0
_08070B04: .4byte gDestinationDoor
_08070B08:
	cmp r3, #2
	beq _08070B10
	bl _0807158A
_08070B10:
	ldr r0, _08070B24 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _08070B1C
	bl _0807158A
_08070B1C:
	movs r0, #0xf
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070B24: .4byte gCurrentRoom
_08070B28:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B32
	bl _0807158A
_08070B32:
	cmp r3, #1
	bne _08070B42
	ldr r0, _08070B60 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _08070B42
	bl _0807152E
_08070B42:
	cmp r3, #2
	beq _08070B4A
	bl _0807158A
_08070B4A:
	ldr r0, _08070B64 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x15
	bne _08070B56
	bl _0807158A
_08070B56:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070B60: .4byte gDestinationDoor
_08070B64: .4byte gCurrentRoom
_08070B68:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B72
	bl _0807158A
_08070B72:
	ldr r0, _08070B84 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _08070B7E
	bl _0807158A
_08070B7E:
	bl _08071588
	.align 2, 0
_08070B84: .4byte gCurrentRoom
_08070B88:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B92
	bl _0807158A
_08070B92:
	ldr r0, _08070BAC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08070B9E
	bl _0807158A
_08070B9E:
	movs r0, #0x14
	movs r1, #7
	movs r2, #0
	bl unk_372c
	bl _08071588
	.align 2, 0
_08070BAC: .4byte gCurrentRoom
_08070BB0:
	movs r0, #0x1e
	bl FadeMusic
	bl _08071588
_08070BBA:
	movs r0, #0x78
	movs r1, #0x1e
	movs r2, #0xb
	bl unk_372c
	movs r0, #0xfc
	bl SoundPlay
	bl _08071588
_08070BCE:
	ldr r0, _08070BF4 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #9
	beq _08070BDA
	bl _0807158A
_08070BDA:
	cmp r3, #1
	bne _08070BE2
	bl _0807152E
_08070BE2:
	cmp r3, #2
	beq _08070BEA
	bl _0807158A
_08070BEA:
	movs r0, #0xb
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070BF4: .4byte gCurrentNavigationRoom
_08070BF8:
	movs r0, #0xa
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	bl _08071588
_08070C06:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C10
	bl _0807158A
_08070C10:
	cmp r3, #1
	bne _08070C20
	ldr r0, _08070C3C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070C20
	bl _0807152E
_08070C20:
	cmp r3, #2
	beq _08070C28
	bl _0807158A
_08070C28:
	ldr r0, _08070C40 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070C34
	bl _0807158A
_08070C34:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070C3C: .4byte gDestinationDoor
_08070C40: .4byte gCurrentRoom
_08070C44:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C4E
	bl _0807158A
_08070C4E:
	cmp r3, #1
	bne _08070C5C
	ldr r0, _08070C78 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _08070C5C
	b _08070F08
_08070C5C:
	cmp r3, #2
	beq _08070C64
	bl _0807158A
_08070C64:
	ldr r0, _08070C7C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _08070C70
	bl _0807158A
_08070C70:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070C78: .4byte gDestinationDoor
_08070C7C: .4byte gCurrentRoom
_08070C80:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C8A
	bl _0807158A
_08070C8A:
	cmp r3, #1
	bne _08070C9A
	ldr r0, _08070CB8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08070C9A
	bl _0807152E
_08070C9A:
	cmp r3, #2
	beq _08070CA2
	bl _0807158A
_08070CA2:
	ldr r0, _08070CBC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xc
	beq _08070CAE
	bl _0807158A
_08070CAE:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070CB8: .4byte gDestinationDoor
_08070CBC: .4byte gCurrentRoom
_08070CC0:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070CCA
	bl _0807158A
_08070CCA:
	cmp r3, #1
	bne _08070CDA
	ldr r0, _08070CF8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xd
	beq _08070CDA
	bl _0807152E
_08070CDA:
	cmp r3, #2
	beq _08070CE2
	bl _0807158A
_08070CE2:
	ldr r0, _08070CFC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _08070CEE
	bl _0807158A
_08070CEE:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070CF8: .4byte gDestinationDoor
_08070CFC: .4byte gCurrentRoom
_08070D00:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070D0A
	bl _0807158A
_08070D0A:
	cmp r3, #1
	bne _08070D1A
	ldr r0, _08070D38 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #7
	bne _08070D1A
	bl _0807152E
_08070D1A:
	cmp r3, #2
	beq _08070D22
	bl _0807158A
_08070D22:
	ldr r0, _08070D3C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070D2E
	bl _0807158A
_08070D2E:
	movs r0, #8
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070D38: .4byte gDestinationDoor
_08070D3C: .4byte gCurrentRoom
_08070D40:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070D4A
	bl _0807158A
_08070D4A:
	cmp r3, #1
	bne _08070D64
	ldr r0, _08070D60 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070D64
	movs r0, #0x46
	bl FadeMusic
	b _08070D7A
	.align 2, 0
_08070D60: .4byte gDestinationDoor
_08070D64:
	cmp r3, #2
	bne _08070D7A
	ldr r0, _08070D8C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070D7A
	movs r0, #0x5a
	movs r1, #0xb
	bl PlayMusic
	movs r5, #1
_08070D7A:
	cmp r5, #0
	bne _08070D82
	bl _0807158A
_08070D82:
	ldr r0, _08070D90 @ =0x000002CF
	bl unk_3cd4
	bl _0807158A
	.align 2, 0
_08070D8C: .4byte gCurrentRoom
_08070D90: .4byte 0x000002CF
_08070D94:
	ldr r0, _08070DA8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #5
	beq _08070DA0
	bl _0807158A
_08070DA0:
	bl unk_3cfc
	bl _08071588
	.align 2, 0
_08070DA8: .4byte gCurrentNavigationRoom
_08070DAC:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070DB6
	bl _0807158A
_08070DB6:
	cmp r3, #1
	bne _08070DC4
	ldr r0, _08070DE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _08070DC4
	b _0807152E
_08070DC4:
	cmp r3, #2
	beq _08070DCC
	bl _0807158A
_08070DCC:
	ldr r0, _08070DE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1d
	beq _08070DD8
	bl _0807158A
_08070DD8:
	movs r0, #7
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070DE0: .4byte gDestinationDoor
_08070DE4: .4byte gCurrentRoom
_08070DE8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070DF2
	bl _0807158A
_08070DF2:
	cmp r3, #1
	bne _08070E00
	ldr r0, _08070E1C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2e
	bne _08070E00
	b _0807152E
_08070E00:
	cmp r3, #2
	beq _08070E08
	bl _0807158A
_08070E08:
	ldr r0, _08070E20 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2e
	beq _08070E14
	bl _0807158A
_08070E14:
	movs r0, #0x5c
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070E1C: .4byte gDestinationDoor
_08070E20: .4byte gCurrentRoom
_08070E24:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070E2C
	b _0807158A
_08070E2C:
	cmp r3, #1
	bne _08070E44
	ldr r0, _08070E40 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _08070E44
	movs r0, #0x3c
	bl FadeMusic
	b _08070E5A
	.align 2, 0
_08070E40: .4byte gDestinationDoor
_08070E44:
	cmp r3, #2
	bne _08070E5A
	ldr r0, _08070E64 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _08070E5A
	movs r0, #0x2c
	movs r1, #0xa
	bl PlayMusic
	movs r5, #1
_08070E5A:
	cmp r5, #0
	bne _08070E60
	b _0807158A
_08070E60:
	b _08070E72
	.align 2, 0
_08070E64: .4byte gCurrentRoom
_08070E68:
	movs r0, #0x1e
	movs r1, #0x1e
	movs r2, #0
	bl unk_372c
_08070E72:
	movs r5, #2
	ldr r1, _08070E7C @ =gSubEventCounter
	movs r0, #0x54
	strh r0, [r1]
	b _0807158A
	.align 2, 0
_08070E7C: .4byte gSubEventCounter
_08070E80:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070E88
	b _0807158A
_08070E88:
	cmp r3, #1
	bne _08070E96
	ldr r0, _08070EAC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #7
	bne _08070E96
	b _0807152E
_08070E96:
	cmp r3, #2
	beq _08070E9C
	b _0807158A
_08070E9C:
	ldr r0, _08070EB0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070EA6
	b _0807158A
_08070EA6:
	movs r0, #8
	movs r1, #0
	b _08071584
	.align 2, 0
_08070EAC: .4byte gDestinationDoor
_08070EB0: .4byte gCurrentRoom
_08070EB4:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070EBC
	b _0807158A
_08070EBC:
	cmp r3, #1
	bne _08070ECA
	ldr r0, _08070EE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2b
	bne _08070ECA
	b _0807152E
_08070ECA:
	cmp r3, #2
	beq _08070ED0
	b _0807158A
_08070ED0:
	ldr r0, _08070EE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2b
	beq _08070EDA
	b _0807158A
_08070EDA:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070EE0: .4byte gDestinationDoor
_08070EE4: .4byte gCurrentRoom
_08070EE8:
	movs r0, #0xa
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	b _08071588
_08070EF4:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070EFC
	b _0807158A
_08070EFC:
	cmp r3, #1
	bne _08070F14
	ldr r0, _08070F10 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _08070F14
_08070F08:
	movs r0, #0x46
	bl FadeMusic
	b _0807158A
	.align 2, 0
_08070F10: .4byte gDestinationDoor
_08070F14:
	cmp r3, #2
	beq _08070F1A
	b _0807158A
_08070F1A:
	ldr r0, _08070F2C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _08070F24
	b _0807158A
_08070F24:
	movs r0, #8
	movs r1, #0
	b _08071584
	.align 2, 0
_08070F2C: .4byte gCurrentRoom
_08070F30:
	movs r0, #0x60
	movs r1, #3
	movs r2, #0xb
	bl unk_372c
	b _08071588
_08070F3C:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070F44
	b _0807158A
_08070F44:
	ldr r0, _08070F5C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1f
	beq _08070F4E
	b _0807158A
_08070F4E:
	movs r0, #0x1e
	movs r1, #0x5c
	movs r2, #0xb
	bl unk_372c
	b _08071588
	.align 2, 0
_08070F5C: .4byte gCurrentRoom
_08070F60:
	ldr r0, _08070F6C @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070F6A
	b _0807158A
_08070F6A:
	b _08071588
	.align 2, 0
_08070F6C: .4byte gCurrentNavigationRoom
_08070F70:
	movs r0, #0
	bl FadeMusic
	b _08071588
_08070F78:
	movs r0, #0x59
	movs r1, #0xa
	b _08071584
_08070F7E:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070F86
	b _0807158A
_08070F86:
	cmp r3, #1
	bne _08070F94
	ldr r0, _08070FAC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x31
	bne _08070F94
	b _08071304
_08070F94:
	cmp r3, #2
	beq _08070F9A
	b _0807158A
_08070F9A:
	ldr r0, _08070FB0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x31
	beq _08070FA4
	b _0807158A
_08070FA4:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070FAC: .4byte gDestinationDoor
_08070FB0: .4byte gCurrentRoom
_08070FB4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070FBC
	b _0807158A
_08070FBC:
	cmp r3, #1
	bne _08070FCA
	ldr r0, _08070FE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x56
	bne _08070FCA
	b _08071304
_08070FCA:
	cmp r3, #2
	beq _08070FD0
	b _0807158A
_08070FD0:
	ldr r0, _08070FE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x56
	beq _08070FDA
	b _0807158A
_08070FDA:
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_08070FE0: .4byte gDestinationDoor
_08070FE4: .4byte gCurrentRoom
_08070FE8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070FF0
	b _0807158A
_08070FF0:
	cmp r4, #0x21
	beq _08070FF6
	b _0807158A
_08070FF6:
	ldr r0, _0807100C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08071014
	movs r0, #0x3c
	bl FadeMusic
	ldr r1, _08071010 @ =gSubEventCounter
	movs r0, #0x69
	b _08071106
	.align 2, 0
_0807100C: .4byte gDestinationDoor
_08071010: .4byte gSubEventCounter
_08071014:
	cmp r0, #0x36
	beq _0807101A
	b _0807158A
_0807101A:
	movs r0, #0x1e
	movs r1, #3
	movs r2, #0xa
	bl unk_372c
	ldr r1, _0807102C @ =gSubEventCounter
	movs r0, #0x6a
	b _08071106
	.align 2, 0
_0807102C: .4byte gSubEventCounter
_08071030:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08071038
	b _0807158A
_08071038:
	ldr r0, _08071048 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x33
	beq _08071042
	b _0807158A
_08071042:
	movs r0, #3
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071048: .4byte gCurrentRoom
_0807104C:
	bl unk_36c4
	b _08071588
_08071052:
	movs r0, #0x2e
	movs r1, #0xa
	b _08071584
_08071058:
	ldr r0, _08071074 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _08071062
	b _0807158A
_08071062:
	cmp r3, #1
	bne _08071068
	b _0807152E
_08071068:
	cmp r3, #2
	beq _0807106E
	b _0807158A
_0807106E:
	movs r0, #0xb
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071074: .4byte gCurrentNavigationRoom
_08071078:
	ldrb r0, [r2]
	cmp r0, #2
	beq _08071080
	b _0807158A
_08071080:
	cmp r3, #1
	bne _0807108C
	ldr r0, _080710A4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _080710C0
_0807108C:
	cmp r3, #2
	beq _08071092
	b _0807158A
_08071092:
	ldr r0, _080710A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _0807109C
	b _0807158A
_0807109C:
	movs r0, #0x15
	movs r1, #8
	b _08071584
	.align 2, 0
_080710A4: .4byte gDestinationDoor
_080710A8: .4byte gCurrentRoom
_080710AC:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080710B4
	b _0807158A
_080710B4:
	cmp r3, #1
	bne _080710CC
	ldr r0, _080710C8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x37
	bne _080710CC
_080710C0:
	movs r0, #2
	bl FadeMusic
	b _0807158A
	.align 2, 0
_080710C8: .4byte gDestinationDoor
_080710CC:
	cmp r3, #2
	beq _080710D2
	b _0807158A
_080710D2:
	ldr r0, _080710E4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x37
	beq _080710DC
	b _0807158A
_080710DC:
	movs r0, #0x1e
	movs r1, #0
	b _08071584
	.align 2, 0
_080710E4: .4byte gCurrentRoom
_080710E8:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080710F0
	b _0807158A
_080710F0:
	ldr r0, _0807110C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _080710FA
	b _0807158A
_080710FA:
	movs r0, #0x15
	movs r1, #8
	bl PlayMusic
	ldr r1, _08071110 @ =gSubEventCounter
	movs r0, #0x6f
_08071106:
	strh r0, [r1]
	movs r5, #2
	b _0807158A
	.align 2, 0
_0807110C: .4byte gCurrentRoom
_08071110: .4byte gSubEventCounter
_08071114:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807111C
	b _0807158A
_0807111C:
	ldr r0, _08071138 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _08071126
	b _0807158A
_08071126:
	ldr r0, _0807113C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x4d
	bne _08071140
	movs r0, #0x74
_08071130:
	strh r0, [r6]
	movs r5, #2
	b _0807158A
	.align 2, 0
_08071138: .4byte gDestinationDoor
_0807113C: .4byte gEventCounter
_08071140:
	movs r0, #0x1e
	bl FadeMusic
	b _08071588
_08071148:
	ldrb r0, [r2]
	cmp r0, #2
	beq _08071150
	b _0807158A
_08071150:
	ldr r0, _08071160 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _0807115A
	b _0807158A
_0807115A:
	movs r0, #6
	movs r1, #0
	b _08071584
	.align 2, 0
_08071160: .4byte gCurrentRoom
_08071164:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807116C
	b _0807158A
_0807116C:
	cmp r3, #1
	bne _0807117A
	ldr r0, _08071190 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _0807117A
	b _08071304
_0807117A:
	cmp r3, #2
	beq _08071180
	b _0807158A
_08071180:
	ldr r0, _08071194 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _0807118A
	b _0807158A
_0807118A:
	movs r0, #0x44
	b _08071582
	.align 2, 0
_08071190: .4byte gDestinationDoor
_08071194: .4byte gCurrentRoom
_08071198:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080711A0
	b _0807158A
_080711A0:
	cmp r3, #1
	bne _080711AE
	ldr r0, _080711C4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080711AE
	b _08071304
_080711AE:
	cmp r3, #2
	beq _080711B4
	b _0807158A
_080711B4:
	ldr r0, _080711C8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xc
	beq _080711BE
	b _0807158A
_080711BE:
	movs r0, #6
	movs r1, #0
	b _08071584
	.align 2, 0
_080711C4: .4byte gDestinationDoor
_080711C8: .4byte gCurrentRoom
_080711CC:
	ldrb r0, [r2]
	cmp r0, #5
	beq _080711D4
	b _0807158A
_080711D4:
	cmp r3, #1
	bne _080711E2
	ldr r0, _080711F8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _080711E2
	b _08071304
_080711E2:
	cmp r3, #2
	beq _080711E8
	b _0807158A
_080711E8:
	ldr r0, _080711FC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _080711F2
	b _0807158A
_080711F2:
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080711F8: .4byte gDestinationDoor
_080711FC: .4byte gCurrentRoom
_08071200:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08071208
	b _0807158A
_08071208:
	cmp r3, #1
	bne _08071214
	ldr r0, _0807122C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08071304
_08071214:
	cmp r3, #2
	beq _0807121A
	b _0807158A
_0807121A:
	ldr r0, _08071230 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08071224
	b _0807158A
_08071224:
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_0807122C: .4byte gDestinationDoor
_08071230: .4byte gCurrentRoom
_08071234:
	ldrb r0, [r2]
	cmp r0, #5
	beq _0807123C
	b _0807158A
_0807123C:
	cmp r3, #1
	bne _08071248
	ldr r0, _08071260 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _08071304
_08071248:
	cmp r3, #2
	beq _0807124E
	b _0807158A
_0807124E:
	ldr r0, _08071264 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _08071258
	b _0807158A
_08071258:
	movs r0, #0x2c
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071260: .4byte gDestinationDoor
_08071264: .4byte gCurrentRoom
_08071268:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08071270
	b _0807158A
_08071270:
	cmp r3, #1
	bne _0807127C
	ldr r0, _08071294 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _08071304
_0807127C:
	cmp r3, #2
	beq _08071282
	b _0807158A
_08071282:
	ldr r0, _08071298 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _0807128C
	b _0807158A
_0807128C:
	movs r0, #0x3c
	movs r1, #0
	b _08071584
	.align 2, 0
_08071294: .4byte gDestinationDoor
_08071298: .4byte gCurrentRoom
_0807129C:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080712A4
	b _0807158A
_080712A4:
	ldr r0, _080712B8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1a
	beq _080712AE
	b _0807158A
_080712AE:
	movs r0, #0xc8
	bl FadeMusic
	b _08071588
	.align 2, 0
_080712B8: .4byte gDestinationDoor
_080712BC:
	ldr r0, _080712CC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #4
	beq _080712C6
	b _0807158A
_080712C6:
	movs r0, #0x1e
	movs r1, #0xb
	b _08071584
	.align 2, 0
_080712CC: .4byte gLastElevatorUsed
_080712D0:
	ldr r0, _080712EC @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #9
	beq _080712DA
	b _0807158A
_080712DA:
	cmp r3, #1
	beq _08071304
	cmp r3, #2
	beq _080712E4
	b _0807158A
_080712E4:
	movs r0, #0xb
	movs r1, #0xb
	b _08071584
	.align 2, 0
_080712EC: .4byte gCurrentNavigationRoom
_080712F0:
	ldrb r0, [r2]
	cmp r0, #6
	beq _080712F8
	b _0807158A
_080712F8:
	cmp r3, #1
	bne _08071310
	ldr r0, _0807130C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08071310
_08071304:
	movs r0, #0x32
	bl FadeMusic
	b _0807158A
	.align 2, 0
_0807130C: .4byte gDestinationDoor
_08071310:
	cmp r3, #2
	beq _08071316
	b _0807158A
_08071316:
	ldr r0, _08071328 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08071320
	b _0807158A
_08071320:
	movs r0, #0xa
	movs r1, #0
	b _08071584
	.align 2, 0
_08071328: .4byte gCurrentRoom
_0807132C:
	movs r0, #0xb2
	lsls r0, r0, #2
	bl unk_3cd4
	b _08071588
_08071336:
	ldrb r0, [r2]
	cmp r0, #6
	beq _0807133E
	b _0807158A
_0807133E:
	cmp r3, #1
	bne _08071358
	ldr r0, _08071354 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08071358
	movs r0, #0x14
	bl FadeMusic
	b _0807136E
	.align 2, 0
_08071354: .4byte gDestinationDoor
_08071358:
	cmp r3, #2
	bne _0807136E
	ldr r0, _0807137C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0807136E
	movs r0, #0x1b
	movs r1, #7
	bl PlayMusic
	movs r5, #1
_0807136E:
	cmp r5, #0
	bne _08071374
	b _0807158A
_08071374:
	bl unk_3cfc
	b _0807158A
	.align 2, 0
_0807137C: .4byte gCurrentRoom
_08071380:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08071388
	b _0807158A
_08071388:
	ldr r0, _0807139C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08071392
	b _0807158A
_08071392:
	movs r0, #0xb2
	lsls r0, r0, #2
	bl unk_3cd4
	b _08071588
	.align 2, 0
_0807139C: .4byte gCurrentRoom
_080713A0:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080713A8
	b _0807158A
_080713A8:
	cmp r3, #1
	bne _080713C4
	ldr r0, _080713C0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x4e
	bne _080713C4
	movs r0, #0x28
	bl FadeMusic
	bl unk_3cfc
	b _0807158A
	.align 2, 0
_080713C0: .4byte gDestinationDoor
_080713C4:
	cmp r3, #2
	beq _080713CA
	b _0807158A
_080713CA:
	ldr r0, _080713DC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x4e
	beq _080713D4
	b _0807158A
_080713D4:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080713DC: .4byte gCurrentRoom
_080713E0:
	movs r0, #0x14
	bl FadeMusic
	b _08071588
_080713E8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080713F0
	b _0807158A
_080713F0:
	cmp r3, #1
	bne _08071408
	ldr r0, _08071404 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x4f
	bne _08071408
	movs r0, #0x3c
	bl FadeMusic
	b _0807141E
	.align 2, 0
_08071404: .4byte gDestinationDoor
_08071408:
	cmp r3, #2
	bne _0807141E
	ldr r0, _0807142C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x4f
	bne _0807141E
	movs r0, #0x17
	movs r1, #0xa
	bl PlayMusic
	movs r5, #1
_0807141E:
	cmp r5, #0
	bne _08071424
	b _0807158A
_08071424:
	ldr r0, _08071430 @ =0x000002C9
	bl unk_3cd4
	b _0807158A
	.align 2, 0
_0807142C: .4byte gCurrentRoom
_08071430: .4byte 0x000002C9
_08071434:
	movs r0, #0x96
	lsls r0, r0, #2
	bl FadeMusic
	bl unk_3cfc
	b _08071588
_08071442:
	movs r0, #3
	movs r1, #0xa
	b _08071584
_08071448:
	movs r0, #0x96
	lsls r0, r0, #1
	bl FadeMusic
	b _08071588
_08071452:
	ldr r0, _08071464 @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _0807145C
	b _0807158A
_0807145C:
	movs r0, #0x1e
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071464: .4byte gLastElevatorUsed
_08071468:
	ldrb r0, [r2]
	cmp r0, #1
	beq _08071470
	b _0807158A
_08071470:
	cmp r3, #1
	bne _0807147C
	ldr r0, _08071494 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _080714DA
_0807147C:
	cmp r3, #2
	beq _08071482
	b _0807158A
_08071482:
	ldr r0, _08071498 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _0807148C
	b _0807158A
_0807148C:
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071494: .4byte gDestinationDoor
_08071498: .4byte gCurrentRoom
_0807149C:
	ldrb r0, [r2]
	cmp r0, #1
	bne _0807158A
	cmp r3, #1
	bne _080714AE
	ldr r0, _080714C0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _080714DA
_080714AE:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080714C4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0807158A
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_080714C0: .4byte gDestinationDoor
_080714C4: .4byte gCurrentRoom
_080714C8:
	ldrb r0, [r2]
	cmp r0, #1
	bne _0807158A
	cmp r3, #1
	bne _080714E8
	ldr r0, _080714E4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _080714E8
_080714DA:
	movs r0, #0x28
	bl FadeMusic
	b _0807158A
	.align 2, 0
_080714E4: .4byte gDestinationDoor
_080714E8:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080714FC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _0807158A
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080714FC: .4byte gCurrentRoom
_08071500:
	ldr r0, _08071518 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	bne _0807158A
	cmp r3, #1
	beq _0807152E
	cmp r3, #2
	bne _0807158A
	movs r0, #0xb
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071518: .4byte gCurrentNavigationRoom
_0807151C:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807158A
	cmp r3, #1
	bne _0807153C
	ldr r0, _08071538 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x55
	bne _0807153C
_0807152E:
	movs r0, #0x3c
	bl FadeMusic
	b _0807158A
	.align 2, 0
_08071538: .4byte gDestinationDoor
_0807153C:
	cmp r3, #2
	bne _0807158A
	ldr r0, _08071550 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x55
	bne _0807158A
	movs r0, #0x2e
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071550: .4byte gCurrentRoom
_08071554:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807158A
	cmp r3, #1
	bne _08071574
	ldr r0, _08071570 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x3f
	bne _08071574
	movs r0, #0
	bl FadeMusic
	b _0807158A
	.align 2, 0
_08071570: .4byte gDestinationDoor
_08071574:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080715A0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3f
	bne _0807158A
	movs r0, #0x58
_08071582:
	movs r1, #7
_08071584:
	bl PlayMusic
_08071588:
	movs r5, #1
_0807158A:
	cmp r5, #1
	bne _0807159A
	ldr r2, _080715A4 @ =gPreviousSubEvent
	ldr r1, _080715A8 @ =gSubEventCounter
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, #1
	strh r0, [r1]
_0807159A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080715A0: .4byte gCurrentRoom
_080715A4: .4byte gPreviousSubEvent
_080715A8: .4byte gSubEventCounter

	thumb_func_start PlayRoomMusicTrack
PlayRoomMusicTrack: @ 0x080715AC
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r2, _080715E4 @ =0x03004DE8
	ldr r1, _080715E8 @ =0x0879B8BC
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	strh r0, [r2]
	ldrh r0, [r2]
	bl CheckSetNewMusicTrack
	ldr r0, _080715EC @ =gDestinationDoor
	strb r4, [r0]
	movs r0, #0x21
	bl CheckUpdateSubEventAndMusic
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080715E4: .4byte 0x03004DE8
_080715E8: .4byte 0x0879B8BC
_080715EC: .4byte gDestinationDoor

	thumb_func_start CheckUpdateMusicDuringRoomLoad
CheckUpdateMusicDuringRoomLoad: @ 0x080715F0
	push {lr}
	ldr r0, _08071604 @ =0x03000022
	ldrb r0, [r0]
	cmp r0, #0
	beq _08071608
	movs r0, #0
	bl SoundPlay
	b _080716CA
	.align 2, 0
_08071604: .4byte 0x03000022
_08071608:
	ldr r0, _08071648 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807167C
	ldr r0, _0807164C @ =gDemoState
	ldrb r0, [r0]
	cmp r0, #0
	bne _080716CA
	ldr r1, _08071650 @ =0x03004DE8
	ldr r0, _08071654 @ =gCurrentRoomEntry
	ldrh r0, [r0, #0x16]
	strh r0, [r1]
	ldr r0, _08071658 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08071660
	bl unk_3ac4
	ldr r0, _0807165C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3d
	bne _080716CA
	movs r0, #0x11
	movs r1, #0
	bl unk_38a8
	b _080716CA
	.align 2, 0
_08071648: .4byte gUnk_03000be3
_0807164C: .4byte gDemoState
_08071650: .4byte 0x03004DE8
_08071654: .4byte gCurrentRoomEntry
_08071658: .4byte gIsLoadingFile
_0807165C: .4byte gSamusData
_08071660:
	ldr r0, _08071674 @ =gCurrentArea
	ldrb r1, [r0]
	ldr r0, _08071678 @ =gCurrentRoom
	ldrb r0, [r0]
	cmn r1, r0
	bne _080716CA
	movs r0, #3
	bl CheckUpdateSubEventAndMusic
	b _080716CA
	.align 2, 0
_08071674: .4byte gCurrentArea
_08071678: .4byte gCurrentRoom
_0807167C:
	ldr r0, _080716B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080716C4
	cmp r0, #3
	bne _080716CA
	ldr r0, _080716B8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _080716CA
	movs r0, #3
	bl CheckUpdateSubEventAndMusic
	ldr r0, _080716BC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x47
	bne _080716CA
	ldr r0, _080716C0 @ =gSubEventCounter
	ldrh r0, [r0]
	cmp r0, #0x64
	bne _080716CA
	movs r0, #0xc
	bl SetCurrentEventBasedEffect
	b _080716CA
	.align 2, 0
_080716B4: .4byte gPauseScreenFlag
_080716B8: .4byte gCurrentNavigationRoom
_080716BC: .4byte gEventCounter
_080716C0: .4byte gSubEventCounter
_080716C4:
	movs r0, #2
	bl CheckUpdateSubEventAndMusic
_080716CA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LowerMusicVolume
LowerMusicVolume: @ 0x080716D0
	push {lr}
	bl DecreaseMusicVolume
	ldr r1, _080716E0 @ =0x03004DE8
	movs r0, #1
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080716E0: .4byte 0x03004DE8

	thumb_func_start IncreaseMusicVolume
IncreaseMusicVolume: @ 0x080716E4
	push {lr}
	bl unk_3c84
	ldr r1, _080716F4 @ =0x03004DE8
	movs r0, #0
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080716F4: .4byte 0x03004DE8
