    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start GameOverSubroutine
GameOverSubroutine: @ 0x0809DEB4
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0809DECC @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0809DEE4
	cmp r0, #1
	bgt _0809DED0
	cmp r0, #0
	beq _0809DEDA
	b _0809DF4C
	.align 2, 0
_0809DECC: .4byte gSubGameMode1
_0809DED0:
	cmp r0, #2
	beq _0809DF02
	cmp r0, #3
	beq _0809DF1C
	b _0809DF4C
_0809DEDA:
	bl GameOverInit
	movs r0, #1
	strh r0, [r4]
	b _0809DF4C
_0809DEE4:
	bl GameOverDrawAllOam
	ldr r1, _0809DEF4 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0809DEF8
	subs r0, #1
	b _0809DF4A
	.align 2, 0
_0809DEF4: .4byte gWrittenToBldy
_0809DEF8:
	movs r0, #3
	movs r1, #0
	bl PlayMusic
	b _0809DF10
_0809DF02:
	bl GameOverAfterOptionDelay
	cmp r0, #0
	beq _0809DF4C
	ldr r1, _0809DF18 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
_0809DF10:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _0809DF4C
	.align 2, 0
_0809DF18: .4byte 0x04000050
_0809DF1C:
	bl GameOverDrawAllOam
	ldr r1, _0809DF2C @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0809DF30
	adds r0, #1
	b _0809DF4A
	.align 2, 0
_0809DF2C: .4byte gWrittenToBldy
_0809DF30:
	ldr r0, _0809DF3C @ =gNonGameplayRam
	ldrb r0, [r0, #3]
	cmp r0, #1
	bne _0809DF40
	movs r5, #1
	b _0809DF46
	.align 2, 0
_0809DF3C: .4byte gNonGameplayRam
_0809DF40:
	cmp r0, #2
	bne _0809DF46
	movs r5, #2
_0809DF46:
	ldr r1, _0809DF54 @ =gSubGameMode1
	movs r0, #0
_0809DF4A:
	strh r0, [r1]
_0809DF4C:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809DF54: .4byte gSubGameMode1

	thumb_func_start GameOverInit
GameOverInit: @ 0x0809DF58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r3, _0809E0A0 @ =0x04000208
	movs r5, #0
	strh r5, [r3]
	ldr r2, _0809E0A4 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0809E0A8 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0809E0AC @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809E0B0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809E0B4 @ =unk_9e58c
	bl CallbackSetVBlank
	movs r0, #0x80
	lsls r0, r0, #0x13
	mov sl, r0
	strh r5, [r0]
	movs r4, #0
	str r4, [sp]
	ldr r7, _0809E0B8 @ =0x040000D4
	mov r1, sp
	str r1, [r7]
	ldr r0, _0809E0BC @ =gNonGameplayRam
	str r0, [r7, #4]
	ldr r0, _0809E0C0 @ =0x85000150
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _0809E0C4 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
	ldr r0, _0809E0C8 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0809E0CC @ =0x04000054
	strh r1, [r0]
	ldr r6, _0809E0D0 @ =0x06010000
	str r6, [r7]
	ldr r0, _0809E0D4 @ =gSpriteTilesBackup
	str r0, [r7, #4]
	ldr r0, _0809E0D8 @ =0x84002000
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	bl ClearGfxRam
	ldr r0, _0809E0DC @ =gNextOamSlot
	strb r5, [r0]
	bl ResetFreeOam
	ldr r0, _0809E0E0 @ =0x0400000E
	mov sb, r0
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	ldr r1, _0809E0E4 @ =0x0400000A
	mov r8, r1
	strh r4, [r1]
	subs r0, #4
	strh r4, [r0]
	adds r0, #8
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _0809E0E8 @ =0x08739A78
	adds r1, r6, #0
	bl LZ77UncompVram
	ldr r0, _0809E0EC @ =0x0873C4E4
	str r0, [r7]
	ldr r0, _0809E0F0 @ =0x05000200
	str r0, [r7, #4]
	ldr r5, _0809E0F4 @ =0x84000080
	str r5, [r7, #8]
	ldr r0, [r7, #8]
	ldr r0, _0809E0F8 @ =0x0873422C
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r4, #0
	bl LZ77UncompVram
	ldr r1, _0809E0FC @ =0x03000011
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	ble _0809E042
	ldr r0, _0809E100 @ =0x0879E874
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r4, #0
	bl LZ77UncompVram
_0809E042:
	ldr r0, _0809E104 @ =0x0873C6E4
	ldr r1, _0809E108 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0809E10C @ =0x0873CCA8
	ldr r1, _0809E110 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0809E114 @ =0x0873C2E4
	str r0, [r7]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r7, #4]
	str r5, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _0809E118 @ =0x00001E02
	adds r0, r1, #0
	mov r1, r8
	strh r0, [r1]
	ldr r1, _0809E11C @ =0x00001F03
	adds r0, r1, #0
	mov r1, sb
	strh r0, [r1]
	movs r0, #1
	movs r1, #0x2b
	movs r2, #0x6f
	bl GameOverSetupOam
	bl GameOverDrawAllOam
	movs r1, #0xd0
	lsls r1, r1, #5
	adds r0, r1, #0
	mov r1, sl
	strh r0, [r1]
	ldr r0, _0809E120 @ =GameOverVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E0A0: .4byte 0x04000208
_0809E0A4: .4byte 0x04000004
_0809E0A8: .4byte 0x0000FFEF
_0809E0AC: .4byte 0x04000200
_0809E0B0: .4byte 0x0000FFFD
_0809E0B4: .4byte unk_9e58c
_0809E0B8: .4byte 0x040000D4
_0809E0BC: .4byte gNonGameplayRam
_0809E0C0: .4byte 0x85000150
_0809E0C4: .4byte 0x04000050
_0809E0C8: .4byte gWrittenToBldy
_0809E0CC: .4byte 0x04000054
_0809E0D0: .4byte 0x06010000
_0809E0D4: .4byte gSpriteTilesBackup
_0809E0D8: .4byte 0x84002000
_0809E0DC: .4byte gNextOamSlot
_0809E0E0: .4byte 0x0400000E
_0809E0E4: .4byte 0x0400000A
_0809E0E8: .4byte 0x08739A78
_0809E0EC: .4byte 0x0873C4E4
_0809E0F0: .4byte 0x05000200
_0809E0F4: .4byte 0x84000080
_0809E0F8: .4byte 0x0873422C
_0809E0FC: .4byte 0x03000011
_0809E100: .4byte 0x0879E874
_0809E104: .4byte 0x0873C6E4
_0809E108: .4byte 0x0600F800
_0809E10C: .4byte 0x0873CCA8
_0809E110: .4byte 0x0600F000
_0809E114: .4byte 0x0873C2E4
_0809E118: .4byte 0x00001E02
_0809E11C: .4byte 0x00001F03
_0809E120: .4byte GameOverVblank

	thumb_func_start GameOverAfterOptionDelay
GameOverAfterOptionDelay: @ 0x0809E124
	push {r4, lr}
	movs r4, #0
	bl GameOverProcessOam
	bl GameOverDrawAllOam
	ldr r1, _0809E154 @ =gNonGameplayRam
	ldrb r0, [r1, #1]
	cmp r0, #1
	bne _0809E14A
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bne _0809E14A
	strb r4, [r1, #2]
	movs r4, #1
_0809E14A:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809E154: .4byte gNonGameplayRam

	thumb_func_start GameOverSetupOam
GameOverSetupOam: @ 0x0809E158
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r4, #0
	ldr r1, _0809E190 @ =gNonGameplayRam
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0809E188
_0809E170:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bhi _0809E18C
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0809E170
_0809E188:
	cmp r4, #2
	bls _0809E194
_0809E18C:
	movs r0, #3
	b _0809E1F6
	.align 2, 0
_0809E190: .4byte gNonGameplayRam
_0809E194:
	adds r0, r4, #0
	bl GameOverResetOam
	ldr r3, _0809E1CC @ =gNonGameplayRam
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #3
	adds r1, r2, r3
	strh r7, [r1, #4]
	strh r6, [r1, #6]
	strb r5, [r1, #8]
	movs r0, #1
	strb r0, [r1, #9]
	cmp r5, #1
	bne _0809E1D8
	movs r0, #3
	strb r0, [r1, #0xf]
	adds r0, r3, #0
	adds r0, #0x14
	adds r0, r2, r0
	ldr r1, _0809E1D0 @ =0x0879E868
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x18
	adds r0, r2, r0
	ldr r1, _0809E1D4 @ =GameOverProcessCursor
	b _0809E1F2
	.align 2, 0
_0809E1CC: .4byte gNonGameplayRam
_0809E1D0: .4byte 0x0879E868
_0809E1D4: .4byte GameOverProcessCursor
_0809E1D8:
	cmp r5, #2
	bne _0809E1F4
	movs r0, #3
	strb r0, [r1, #0xf]
	adds r0, r3, #0
	adds r0, #0x14
	adds r0, r2, r0
	ldr r1, _0809E1FC @ =0x0873C274
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x18
	adds r0, r2, r0
	ldr r1, _0809E200 @ =unk_9e2cc
_0809E1F2:
	str r1, [r0]
_0809E1F4:
	adds r0, r4, #0
_0809E1F6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809E1FC: .4byte 0x0873C274
_0809E200: .4byte unk_9e2cc

	thumb_func_start GameOverProcessCursor
GameOverProcessCursor: @ 0x0809E204
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _0809E2BC
	ldr r0, _0809E230 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809E238
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0x6f
	beq _0809E252
	movs r0, #0x6f
	strh r0, [r4, #2]
	ldr r0, _0809E234 @ =0x000001F9
	bl SoundPlay
	b _0809E252
	.align 2, 0
_0809E230: .4byte gChangedInput
_0809E234: .4byte 0x000001F9
_0809E238:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809E252
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0x88
	beq _0809E252
	movs r0, #0x88
	strh r0, [r4, #2]
	ldr r0, _0809E280 @ =0x000001F9
	bl SoundPlay
_0809E252:
	ldr r0, _0809E284 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0809E2BC
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0x6f
	bne _0809E290
	movs r0, #0xff
	lsls r0, r0, #1
	bl SoundPlay
	movs r0, #0xa
	bl MusicFade
	ldr r0, _0809E288 @ =0x0879E868
	ldr r0, [r0, #4]
	str r0, [r4, #0x10]
	ldr r1, _0809E28C @ =gNonGameplayRam
	movs r0, #1
	b _0809E2AC
	.align 2, 0
_0809E280: .4byte 0x000001F9
_0809E284: .4byte gChangedInput
_0809E288: .4byte 0x0879E868
_0809E28C: .4byte gNonGameplayRam
_0809E290:
	cmp r0, #0x88
	bne _0809E2AE
	movs r0, #0xff
	lsls r0, r0, #1
	bl SoundPlay
	movs r0, #0xa
	bl MusicFade
	ldr r0, _0809E2C4 @ =0x0879E868
	ldr r0, [r0, #8]
	str r0, [r4, #0x10]
	ldr r1, _0809E2C8 @ =gNonGameplayRam
	movs r0, #2
_0809E2AC:
	strb r0, [r1, #3]
_0809E2AE:
	ldr r0, _0809E2C8 @ =gNonGameplayRam
	movs r1, #0
	movs r2, #1
	strb r2, [r0, #1]
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	strb r2, [r4, #9]
_0809E2BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E2C4: .4byte 0x0879E868
_0809E2C8: .4byte gNonGameplayRam

	thumb_func_start unk_9e2cc
unk_9e2cc: @ 0x0809E2CC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	mov r4, sp
	adds r4, #2
	movs r0, #1
	mov r1, sp
	adds r2, r4, #0
	bl GameOverGetPositionAndSlotOfOamByType
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5]
	ldrh r0, [r4]
	strh r0, [r5, #2]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GameOverResetOam
GameOverResetOam: @ 0x0809E2F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0809E318 @ =gNonGameplayRam
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	movs r0, #0
	strb r0, [r1, #0xa]
	strb r0, [r1, #0xb]
	strb r0, [r1, #0xc]
	strb r0, [r1, #0xd]
	strb r0, [r1, #0xe]
	strb r0, [r1, #0xf]
	strb r0, [r1, #0x10]
	strb r0, [r1, #0x11]
	strh r0, [r1, #0x12]
	bx lr
	.align 2, 0
_0809E318: .4byte gNonGameplayRam

	thumb_func_start GameOverProcessOam
GameOverProcessOam: @ 0x0809E31C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _0809E350 @ =gNonGameplayRam
	adds r6, r5, #4
_0809E324:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #3
	adds r0, r2, r5
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0809E340
	adds r1, r5, #0
	adds r1, #0x18
	adds r1, r2, r1
	adds r0, r2, r6
	ldr r1, [r1]
	bl _call_via_r1
_0809E340:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0809E324
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E350: .4byte gNonGameplayRam

	thumb_func_start GameOverDrawAllOam
GameOverDrawAllOam: @ 0x0809E354
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _0809E38C @ =gNonGameplayRam
	adds r6, r5, #4
_0809E35C:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r1, r0, #3
	adds r0, r1, r5
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809E370
	adds r0, r1, r6
	bl GameOverDrawOam
_0809E370:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0809E35C
	bl ResetFreeOam
	ldr r1, _0809E390 @ =gNextOamSlot
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E38C: .4byte gNonGameplayRam
_0809E390: .4byte gNextOamSlot

	thumb_func_start GameOverDrawOam
GameOverDrawOam: @ 0x0809E394
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r2, _0809E454 @ =gNextOamSlot
	ldrb r0, [r2]
	lsls r0, r0, #3
	ldr r1, _0809E458 @ =gOamData
	adds r7, r0, r1
	ldrb r4, [r5, #6]
	lsls r1, r4, #3
	ldr r0, [r5, #0x10]
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	ldrb r2, [r5, #7]
	cmp r0, r2
	bne _0809E3C4
	adds r0, r4, #1
	movs r1, #0
	strb r0, [r5, #6]
	strb r1, [r5, #7]
	adds r3, #8
_0809E3C4:
	ldrb r1, [r3, #4]
	cmp r1, #0
	bne _0809E3D2
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	subs r3, r3, r0
	strb r1, [r5, #6]
_0809E3D2:
	ldr r6, [r3]
	ldrh r3, [r6]
	mov sl, r3
	adds r6, #2
	movs r4, #0
	mov sb, r4
	cmp sb, sl
	blt _0809E3E4
	b _0809E4E8
_0809E3E4:
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
	ldr r2, _0809E454 @ =gNextOamSlot
	ldrb r0, [r2]
	mov r4, sb
	adds r3, r0, r4
	ldrb r1, [r5, #0xc]
	cmp r1, #1
	bne _0809E464
	lsls r4, r3, #3
	ldr r0, _0809E458 @ =gOamData
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
	ldr r2, _0809E45C @ =0x08734220
	adds r1, r1, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r5]
	subs r2, r1, r0
	ldr r3, _0809E460 @ =0x000001FF
	ands r2, r3
	ldrh r0, [r5, #2]
	mov r3, r8
	adds r1, r3, r0
	movs r0, #0xff
	ands r1, r0
	b _0809E47A
	.align 2, 0
_0809E454: .4byte gNextOamSlot
_0809E458: .4byte gOamData
_0809E45C: .4byte 0x08734220
_0809E460: .4byte 0x000001FF
_0809E464:
	ldrh r0, [r5, #2]
	mov r4, r8
	adds r1, r4, r0
	movs r0, #0xff
	ands r1, r0
	ldrh r0, [r5]
	mov r4, ip
	adds r2, r4, r0
	ldr r0, _0809E504 @ =0x000001FF
	ands r2, r0
	lsls r4, r3, #3
_0809E47A:
	ldr r0, _0809E508 @ =gOamData
	adds r3, r4, r0
	strb r1, [r3]
	ldr r1, _0809E504 @ =0x000001FF
	ands r2, r1
	ldrh r1, [r3, #2]
	ldr r0, _0809E50C @ =0xFFFFFE00
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
	ldr r4, _0809E510 @ =0x000003FF
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _0809E514 @ =0xFFFFFC00
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
	bge _0809E4E8
	b _0809E3E4
_0809E4E8:
	ldr r2, _0809E518 @ =gNextOamSlot
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
_0809E504: .4byte 0x000001FF
_0809E508: .4byte gOamData
_0809E50C: .4byte 0xFFFFFE00
_0809E510: .4byte 0x000003FF
_0809E514: .4byte 0xFFFFFC00
_0809E518: .4byte gNextOamSlot

	thumb_func_start GameOverGetPositionAndSlotOfOamByType
GameOverGetPositionAndSlotOfOamByType: @ 0x0809E51C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0
	ldr r6, _0809E540 @ =gNonGameplayRam
_0809E528:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r6
	ldrb r0, [r3, #8]
	cmp r0, r5
	bne _0809E544
	ldrh r0, [r3, #4]
	strh r0, [r4]
	ldrh r0, [r3, #6]
	b _0809E558
	.align 2, 0
_0809E540: .4byte gNonGameplayRam
_0809E544:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	bls _0809E528
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r4]
	movs r0, #0xc8
_0809E558:
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start GameOverVblank
GameOverVblank: @ 0x0809E560
	ldr r1, _0809E57C @ =0x040000D4
	ldr r0, _0809E580 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0809E584 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0x80
	ldr r0, _0809E588 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0809E57C: .4byte 0x040000D4
_0809E580: .4byte gOamData
_0809E584: .4byte 0x84000100
_0809E588: .4byte gWrittenToBldy

	thumb_func_start unk_9e58c
unk_9e58c: @ 0x0809E58C
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0
