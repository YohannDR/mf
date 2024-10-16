    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start MegaXUpdatePalette
MegaXUpdatePalette: @ 0x0805740C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805742C @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r1, _08057430 @ =sSecondarySpriteStats
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r4, _08057434 @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _08057438
	cmp r1, #1
	beq _08057450
	b _08057466
	.align 2, 0
_0805742C: .4byte gCurrentSprite
_08057430: .4byte sSecondarySpriteStats
_08057434: .4byte gBossWork1
_08057438:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _08057466
	ldr r7, _0805744C @ =0x083A5498
	movs r0, #1
	strb r0, [r4]
	b _0805746A
	.align 2, 0
_0805744C: .4byte 0x083A5498
_08057450:
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _08057466
	ldr r7, _08057480 @ =0x083A54B8
	movs r0, #2
	strb r0, [r4]
	movs r6, #1
_08057466:
	cmp r6, #0
	beq _08057478
_0805746A:
	ldr r1, _08057484 @ =0x040000D4
	str r7, [r1]
	ldr r0, _08057488 @ =0x05000380
	str r0, [r1, #4]
	ldr r0, _0805748C @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08057478:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057480: .4byte 0x083A54B8
_08057484: .4byte 0x040000D4
_08057488: .4byte 0x05000380
_0805748C: .4byte 0x80000010

	thumb_func_start MegaXDestroyShields
MegaXDestroyShields: @ 0x08057490
	push {r4, lr}
	movs r3, #0
	ldr r4, _080574D8 @ =gSpriteData
_08057496:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080574C6
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080574C6
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x4a
	bne _080574C6
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	beq _080574C6
	movs r0, #0
	strh r0, [r2, #0x14]
_080574C6:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _08057496
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080574D8: .4byte gSpriteData

	thumb_func_start MegaXTurningIntoX_Unused
MegaXTurningIntoX_Unused: @ 0x080574DC
	push {lr}
	ldr r1, _08057508 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0
	beq _08057514
	ldr r2, _0805750C @ =gWrittenToMosaic_H
	ldr r1, _08057510 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08057532
	.align 2, 0
_08057508: .4byte gCurrentSprite
_0805750C: .4byte gWrittenToMosaic_H
_08057510: .4byte sXParasiteMosaicValues
_08057514:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _08057544 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08057548 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
_08057532:
	ldrh r0, [r3, #6]
	cmp r0, #7
	bhi _0805754C
	adds r2, r0, #0
	movs r0, #0x21
	movs r1, #6
	bl SpriteLoadGfx
	b _0805755A
	.align 2, 0
_08057544: .4byte 0x0000FFDF
_08057548: .4byte gIoRegisters
_0805754C:
	cmp r0, #8
	bne _0805755A
	movs r0, #0x21
	movs r1, #6
	movs r2, #2
	bl SpriteLoadPal
_0805755A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start VariaSuitAbilityInit
VariaSuitAbilityInit: @ 0x08057560
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _08057580 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r7, #0x10
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _08057588
	ldr r1, _08057584 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _08057694
	.align 2, 0
_08057580: .4byte gEquipment
_08057584: .4byte gCurrentSprite
_08057588:
	ldr r0, _0805769C @ =gBossWork1
	strb r6, [r0]
	ldr r5, _080576A0 @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080576A4 @ =0xFFFFFF00
	adds r1, r0, #0
	ldrh r0, [r5, #2]
	adds r1, r1, r0
	movs r4, #0
	strh r1, [r5, #2]
	ldrh r0, [r5, #4]
	subs r0, #0x80
	strh r0, [r5, #4]
	strh r1, [r5, #6]
	strh r0, [r5, #8]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	ldrh r2, [r5]
	movs r0, #4
	orrs r2, r0
	orrs r2, r4
	strh r2, [r5]
	ldr r3, _080576A8 @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	ldr r0, _080576AC @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r1, #0
	orrs r2, r0
	strh r2, [r5]
	adds r0, r5, #0
	adds r0, #0x27
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	ldr r1, _080576B0 @ =0x0000FFE0
	strh r1, [r5, #0xa]
	movs r0, #0x20
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _080576B4 @ =0x083A59B0
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r6, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	strh r7, [r5, #0x12]
	adds r0, #2
	strb r4, [r0]
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	adds r4, r5, #0
	adds r4, #0x23
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x78
	bl SpriteSpawnSecondary
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x60
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #2
	bl SpriteSpawnSecondary
_08057694:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805769C: .4byte gBossWork1
_080576A0: .4byte gCurrentSprite
_080576A4: .4byte 0xFFFFFF00
_080576A8: .4byte sPrimarySpriteStats
_080576AC: .4byte gIoRegisters
_080576B0: .4byte 0x0000FFE0
_080576B4: .4byte 0x083A59B0

	thumb_func_start VariaSuitAbilityWaitingToSpawn
VariaSuitAbilityWaitingToSpawn: @ 0x080576B8
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _080576EA
	ldr r2, _080576F0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	movs r0, #0x40
	movs r1, #7
	bl PlayMusic
_080576EA:
	pop {r0}
	bx r0
	.align 2, 0
_080576F0: .4byte gCurrentSprite

	thumb_func_start VariaSuitAbilitySpawning
VariaSuitAbilitySpawning: @ 0x080576F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r3, _08057724 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08057728 @ =0x083A1304
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, _0805772C @ =0x00007FFF
	adds r4, r3, #0
	cmp r1, r0
	bne _08057730
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0805773A
	.align 2, 0
_08057724: .4byte gCurrentSprite
_08057728: .4byte 0x083A1304
_0805772C: .4byte 0x00007FFF
_08057730:
	adds r0, r2, #1
	mov r7, ip
	strb r0, [r7]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
_0805773A:
	strh r0, [r4, #2]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r2, [r6]
	ldr r5, _08057764 @ =0x083A1386
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08057768 @ =0x00007FFF
	cmp r1, r0
	bne _0805776C
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #4]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08057774
	.align 2, 0
_08057764: .4byte 0x083A1386
_08057768: .4byte 0x00007FFF
_0805776C:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r4, #4]
	adds r0, r0, r3
_08057774:
	strh r0, [r4, #4]
	adds r1, r4, #0
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _080577A4
	ldrh r2, [r1, #0x12]
	ldr r0, _08057794 @ =0x000001FF
	cmp r2, r0
	bhi _08057798
	adds r0, r2, #0
	adds r0, #0x10
	strh r0, [r1, #0x12]
	b _08057870
	.align 2, 0
_08057794: .4byte 0x000001FF
_08057798:
	movs r0, #1
	strb r0, [r3]
	adds r1, #0x2f
	movs r0, #0x3c
	strb r0, [r1]
	b _08057870
_080577A4:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08057870
	subs r1, #0xb
	movs r0, #0x39
	strb r0, [r1]
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #7
	bl SpriteSpawnSecondary
_08057870:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start VariaSuitAbilityMovingInit
VariaSuitAbilityMovingInit: @ 0x08057878
	ldr r3, _0805789C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x3a
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805789C: .4byte gCurrentSprite

	thumb_func_start VariaSuitAbilityMoving
VariaSuitAbilityMoving: @ 0x080578A0
	push {lr}
	sub sp, #8
	ldr r0, _080578BC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080578C8
	ldr r1, _080578C0 @ =gSamusData
	ldr r2, _080578C4 @ =0xFFFFFEC0
	adds r0, r2, #0
	ldrh r2, [r1, #0x18]
	adds r0, r0, r2
	b _080578CE
	.align 2, 0
_080578BC: .4byte gFrameCounter8Bit
_080578C0: .4byte gSamusData
_080578C4: .4byte 0xFFFFFEC0
_080578C8:
	ldr r1, _080578EC @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
_080578CE:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r0, #2
	str r0, [sp]
	movs r0, #0xc0
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x38
	movs r3, #0x50
	bl XParasiteMoveWithSound
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080578EC: .4byte gSamusData

	thumb_func_start VariaSuitAbilityShrinking
VariaSuitAbilityShrinking: @ 0x080578F0
	push {lr}
	ldr r2, _08057908 @ =gCurrentSprite
	ldrh r1, [r2, #0x12]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0805790C
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r2, #0x12]
	b _08057922
	.align 2, 0
_08057908: .4byte gCurrentSprite
_0805790C:
	ldrh r1, [r2]
	ldr r0, _08057928 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #9
	strb r0, [r1]
_08057922:
	pop {r0}
	bx r0
	.align 2, 0
_08057928: .4byte 0x0000FFFB

	thumb_func_start VariaSuitAbilityShrinked
VariaSuitAbilityShrinked: @ 0x0805792C
	bx lr
	.align 2, 0

	thumb_func_start VariaSuitAbilityTurningIntoCoreX
VariaSuitAbilityTurningIntoCoreX: @ 0x08057930
	push {lr}
	ldr r1, _0805795C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805794A
	adds r1, #0x24
	movs r0, #0x3f
	strb r0, [r1]
_0805794A:
	ldrb r0, [r2]
	cmp r0, #7
	bhi _08057960
	adds r2, r0, #0
	movs r0, #0x21
	movs r1, #6
	bl SpriteLoadGfx
	b _0805796E
	.align 2, 0
_0805795C: .4byte gCurrentSprite
_08057960:
	cmp r0, #8
	bne _0805796E
	movs r0, #0x21
	movs r1, #6
	movs r2, #2
	bl SpriteLoadPal
_0805796E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start VariaSuitAbilityCoreXMovingInit
VariaSuitAbilityCoreXMovingInit: @ 0x08057974
	ldr r3, _08057998 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_08057998: .4byte gCurrentSprite

	thumb_func_start VariaSuitAbilityCoreXMoving
VariaSuitAbilityCoreXMoving: @ 0x0805799C
	push {lr}
	sub sp, #8
	ldr r1, _080579C4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0xc0
	str r2, [sp, #4]
	movs r2, #0x1c
	movs r3, #0x28
	bl XParasiteMoveWithSound
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080579C4: .4byte gSamusData

	thumb_func_start VariaSuitAbilityCoreXMovingInit_Unused
VariaSuitAbilityCoreXMovingInit_Unused: @ 0x080579C8
	ldr r3, _080579EC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x42
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_080579EC: .4byte gCurrentSprite

	thumb_func_start VariaSuitAbilityCoreXMoving_Unused
VariaSuitAbilityCoreXMoving_Unused: @ 0x080579F0
	push {lr}
	sub sp, #8
	ldr r1, _08057A18 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0xc0
	str r2, [sp, #4]
	movs r2, #0x1c
	movs r3, #0x28
	bl XParasiteMoveWithSound
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08057A18: .4byte gSamusData

	thumb_func_start MegaXShieldInit
MegaXShieldInit: @ 0x08057A1C
	push {r4, lr}
	ldr r0, _08057AA0 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08057AA4 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r2, #0
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08057AA8 @ =gIoRegisters
	ldrb r1, [r1, #0xa]
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0xc
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08057AAC @ =0x0000FFE0
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08057AB0 @ =0x083A5EF8
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r2, [r4, #0x16]
	mov r0, ip
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	ldr r1, _08057AB4 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	mov r0, ip
	adds r0, #0x30
	strb r3, [r0]
	ldrb r0, [r4, #0x1e]
	lsls r0, r0, #5
	mov r1, ip
	adds r1, #0x2f
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057AA0: .4byte gCurrentSprite
_08057AA4: .4byte 0x0000FFFB
_08057AA8: .4byte gIoRegisters
_08057AAC: .4byte 0x0000FFE0
_08057AB0: .4byte 0x083A5EF8
_08057AB4: .4byte sSecondarySpriteStats

	thumb_func_start MegaXShieldIdle
MegaXShieldIdle: @ 0x08057AB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08057AD8 @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	adds r4, r0, #0
	cmp r5, #0
	bne _08057ADC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x22
	bl ParticleSet
	strh r5, [r4]
	b _08057BD6
	.align 2, 0
_08057AD8: .4byte gCurrentSprite
_08057ADC:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _08057B08
	ldrh r1, [r4, #0x12]
	ldr r0, _08057B00 @ =0x0000013F
	cmp r1, r0
	bhi _08057B04
	adds r0, r1, #2
	strh r0, [r4, #0x12]
	b _08057B18
	.align 2, 0
_08057B00: .4byte 0x0000013F
_08057B04:
	movs r0, #0
	b _08057B16
_08057B08:
	ldrh r0, [r4, #0x12]
	cmp r0, #0xc0
	bls _08057B14
	subs r0, #2
	strh r0, [r4, #0x12]
	b _08057B18
_08057B14:
	movs r0, #1
_08057B16:
	strb r0, [r2]
_08057B18:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r6, [r0]
	ldrh r3, [r4, #0x12]
	adds r0, #0xc
	ldrb r7, [r0]
	ldr r1, _08057B5C @ =0x080A4FA4
	lsls r0, r7, #1
	adds r0, r0, r1
	movs r5, #0
	ldrsh r2, [r0, r5]
	mov r8, r1
	cmp r2, #0
	bge _08057B64
	rsbs r2, r2, #0
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	muls r0, r2, r0
	adds r5, r1, #0
	cmp r0, #0
	bge _08057B44
	adds r0, #0xff
_08057B44:
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	ldr r1, _08057B60 @ =gSpriteData
	lsls r2, r6, #3
	subs r0, r2, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	subs r0, r0, r3
	strh r0, [r4, #2]
	mov ip, r1
	b _08057B8A
	.align 2, 0
_08057B5C: .4byte 0x080A4FA4
_08057B60: .4byte gSpriteData
_08057B64:
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	muls r2, r0, r2
	adds r5, r1, #0
	cmp r2, #0
	bge _08057B72
	adds r2, #0xff
_08057B72:
	lsls r1, r2, #8
	ldr r2, _08057BB8 @ =gSpriteData
	lsls r3, r6, #3
	subs r0, r3, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	lsrs r1, r1, #0x10
	ldrh r0, [r0, #2]
	adds r1, r1, r0
	strh r1, [r4, #2]
	mov ip, r2
	adds r2, r3, #0
_08057B8A:
	adds r0, r7, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	bge _08057BBC
	rsbs r1, r1, #0
	asrs r0, r5, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _08057BA6
	adds r0, #0xff
_08057BA6:
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	subs r0, r2, r6
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #4]
	subs r0, r0, r1
	strh r0, [r4, #4]
	b _08057BD6
	.align 2, 0
_08057BB8: .4byte gSpriteData
_08057BBC:
	asrs r0, r5, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _08057BC6
	adds r0, #0xff
_08057BC6:
	lsls r1, r0, #8
	subs r0, r2, r6
	lsls r0, r0, #3
	add r0, ip
	lsrs r1, r1, #0x10
	ldrh r0, [r0, #4]
	adds r1, r1, r0
	strh r1, [r4, #4]
_08057BD6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start VariaSuitAbility
VariaSuitAbility: @ 0x08057BE0
	push {lr}
	ldr r0, _08057BF8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5f
	bls _08057BEE
	b _08057DD2
_08057BEE:
	lsls r0, r0, #2
	ldr r1, _08057BFC @ =_08057C00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057BF8: .4byte gCurrentSprite
_08057BFC: .4byte _08057C00
_08057C00: @ jump table
	.4byte _08057D80 @ case 0
	.4byte _08057DD2 @ case 1
	.4byte _08057DD2 @ case 2
	.4byte _08057DD2 @ case 3
	.4byte _08057DD2 @ case 4
	.4byte _08057DD2 @ case 5
	.4byte _08057DD2 @ case 6
	.4byte _08057DD2 @ case 7
	.4byte _08057DD2 @ case 8
	.4byte _08057DD2 @ case 9
	.4byte _08057DD2 @ case 10
	.4byte _08057DD2 @ case 11
	.4byte _08057DD2 @ case 12
	.4byte _08057DD2 @ case 13
	.4byte _08057DD2 @ case 14
	.4byte _08057DD2 @ case 15
	.4byte _08057DD2 @ case 16
	.4byte _08057DD2 @ case 17
	.4byte _08057DD2 @ case 18
	.4byte _08057DD2 @ case 19
	.4byte _08057DD2 @ case 20
	.4byte _08057DD2 @ case 21
	.4byte _08057DD2 @ case 22
	.4byte _08057DD2 @ case 23
	.4byte _08057DD2 @ case 24
	.4byte _08057DD2 @ case 25
	.4byte _08057DD2 @ case 26
	.4byte _08057DD2 @ case 27
	.4byte _08057DD2 @ case 28
	.4byte _08057DD2 @ case 29
	.4byte _08057DD2 @ case 30
	.4byte _08057DD2 @ case 31
	.4byte _08057DD2 @ case 32
	.4byte _08057DD2 @ case 33
	.4byte _08057DD2 @ case 34
	.4byte _08057DD2 @ case 35
	.4byte _08057DD2 @ case 36
	.4byte _08057DD2 @ case 37
	.4byte _08057DD2 @ case 38
	.4byte _08057DD2 @ case 39
	.4byte _08057DD2 @ case 40
	.4byte _08057DD2 @ case 41
	.4byte _08057DD2 @ case 42
	.4byte _08057DD2 @ case 43
	.4byte _08057DD2 @ case 44
	.4byte _08057DD2 @ case 45
	.4byte _08057DD2 @ case 46
	.4byte _08057DD2 @ case 47
	.4byte _08057DD2 @ case 48
	.4byte _08057DD2 @ case 49
	.4byte _08057DD2 @ case 50
	.4byte _08057DD2 @ case 51
	.4byte _08057DD2 @ case 52
	.4byte _08057DD2 @ case 53
	.4byte _08057DD2 @ case 54
	.4byte _08057D86 @ case 55
	.4byte _08057D8C @ case 56
	.4byte _08057D92 @ case 57
	.4byte _08057D98 @ case 58
	.4byte _08057D9E @ case 59
	.4byte _08057DA4 @ case 60
	.4byte _08057DAA @ case 61
	.4byte _08057DD2 @ case 62
	.4byte _08057DB0 @ case 63
	.4byte _08057DB6 @ case 64
	.4byte _08057DD2 @ case 65
	.4byte _08057DD2 @ case 66
	.4byte _08057DD2 @ case 67
	.4byte _08057DD2 @ case 68
	.4byte _08057DD2 @ case 69
	.4byte _08057DD2 @ case 70
	.4byte _08057DD2 @ case 71
	.4byte _08057DD2 @ case 72
	.4byte _08057DD2 @ case 73
	.4byte _08057DD2 @ case 74
	.4byte _08057DD2 @ case 75
	.4byte _08057DD2 @ case 76
	.4byte _08057DD2 @ case 77
	.4byte _08057DD2 @ case 78
	.4byte _08057DD2 @ case 79
	.4byte _08057DD2 @ case 80
	.4byte _08057DD2 @ case 81
	.4byte _08057DD2 @ case 82
	.4byte _08057DD2 @ case 83
	.4byte _08057DD2 @ case 84
	.4byte _08057DD2 @ case 85
	.4byte _08057DD2 @ case 86
	.4byte _08057DD2 @ case 87
	.4byte _08057DD2 @ case 88
	.4byte _08057DD2 @ case 89
	.4byte _08057DD2 @ case 90
	.4byte _08057DD2 @ case 91
	.4byte _08057DBC @ case 92
	.4byte _08057DC2 @ case 93
	.4byte _08057DC8 @ case 94
	.4byte _08057DCE @ case 95
_08057D80:
	bl VariaSuitAbilityInit
	b _08057DD2
_08057D86:
	bl VariaSuitAbilityWaitingToSpawn
	b _08057DD2
_08057D8C:
	bl VariaSuitAbilitySpawning
	b _08057DD2
_08057D92:
	bl VariaSuitAbilityMovingInit
	b _08057DD2
_08057D98:
	bl VariaSuitAbilityMoving
	b _08057DD2
_08057D9E:
	bl VariaSuitAbilityShrinking
	b _08057DD2
_08057DA4:
	bl VariaSuitAbilityShrinked
	b _08057DD2
_08057DAA:
	bl VariaSuitAbilityTurningIntoCoreX
	b _08057DD2
_08057DB0:
	bl VariaSuitAbilityCoreXMovingInit
	b _08057DD2
_08057DB6:
	bl VariaSuitAbilityCoreXMoving
	b _08057DD2
_08057DBC:
	bl CoreXAbilityMovingToTargetInit
	b _08057DD2
_08057DC2:
	bl CoreXAbilityMovingToTarget
	b _08057DD2
_08057DC8:
	bl CoreXAbilityWaitingAtTarget
	b _08057DD2
_08057DCE:
	bl CoreXAbilityGettingAbsorbed
_08057DD2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MegaX
MegaX: @ 0x08057DD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08057E30 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r7, [r1]
	adds r5, r0, #0
	adds r5, #0x24
	ldrb r3, [r5]
	adds r4, r0, #0
	cmp r3, #0
	beq _08057E38
	cmp r3, #0x18
	bne _08057EB0
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08057E1A
	b _0805813E
_08057E1A:
	ldr r0, _08057E34 @ =gSpriteData
	lsls r1, r7, #3
	subs r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	movs r0, #0x3d
	strb r0, [r1]
	strh r2, [r4]
	b _0805813E
	.align 2, 0
_08057E30: .4byte gCurrentSprite
_08057E34: .4byte gSpriteData
_08057E38:
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #4
	strb r0, [r1]
	subs r1, #0x13
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08057EDC @ =gIoRegisters
	ldrb r1, [r1, #0xa]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r1, _08057EE0 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08057EE4 @ =0x0000FF70
	strh r1, [r4, #0xa]
	movs r0, #0x90
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08057EE8 @ =0x083A5E70
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #2
	strb r0, [r5]
	ldrh r0, [r4]
	ldr r3, _08057EEC @ =0x00004008
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r2, [r0]
_08057EB0:
	ldr r2, _08057EF0 @ =gSpriteData
	lsls r3, r7, #3
	subs r0, r3, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r1, [r0, #4]
	strh r1, [r4, #4]
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x37
	mov r8, r2
	adds r6, r3, #0
	cmp r0, #4
	bls _08057ED2
	b _0805813A
_08057ED2:
	lsls r0, r0, #2
	ldr r1, _08057EF4 @ =_08057EF8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057EDC: .4byte gIoRegisters
_08057EE0: .4byte sSecondarySpriteStats
_08057EE4: .4byte 0x0000FF70
_08057EE8: .4byte 0x083A5E70
_08057EEC: .4byte 0x00004008
_08057EF0: .4byte gSpriteData
_08057EF4: .4byte _08057EF8
_08057EF8: @ jump table
	.4byte _08057F0C @ case 0
	.4byte _08057F16 @ case 1
	.4byte _08057FE4 @ case 2
	.4byte _08057FEC @ case 3
	.4byte _08057F38 @ case 4
_08057F0C:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _0805813A
_08057F16:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08057F34 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #0x12]
	strh r0, [r4, #0x12]
	b _0805813A
	.align 2, 0
_08057F34: .4byte 0x0000FFFB
_08057F38:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08057FBC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08057F6C
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08057F66
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r4, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_08057F66:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_08057F6C:
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #0x12]
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08057FC4
	adds r0, r4, #0
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldrh r1, [r4]
	ldr r0, _08057FC0 @ =0x0000BFF7
	ands r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #0xe
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, #0x18
	ldrh r1, [r4, #4]
	movs r2, #0x3a
	bl ParticleSet
	b _0805813A
	.align 2, 0
_08057FBC: .4byte gFrameCounter8Bit
_08057FC0: .4byte 0x0000BFF7
_08057FC4:
	ldr r0, _08057FE0 @ =0x0000017F
	cmp r1, r0
	bls _08057FCC
	b _0805813A
_08057FCC:
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	b _0805813A
	.align 2, 0
_08057FE0: .4byte 0x0000017F
_08057FE4:
	ldrh r1, [r4]
	ldr r0, _08058040 @ =0x00007FFF
	ands r0, r1
	strh r0, [r4]
_08057FEC:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _080580DC
	movs r0, #0xdf
	lsls r0, r0, #1
	bl SoundPlay
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	movs r3, #0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08058044 @ =0x083A5ED0
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	movs r2, #0
	mov ip, r2
	strh r3, [r4, #0x16]
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _0805804C
	adds r0, r4, #0
	adds r0, #0x25
	mov r3, ip
	strb r3, [r0]
	ldr r1, _08058048 @ =gSpriteData
	subs r0, r6, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0x3b
	strb r1, [r0]
	bl MegaXDestroyShields
	b _0805813E
	.align 2, 0
_08058040: .4byte 0x00007FFF
_08058044: .4byte 0x083A5ED0
_08058048: .4byte gSpriteData
_0805804C:
	ldr r3, _08058078 @ =gSpriteData
	subs r0, r6, r7
	lsls r0, r0, #3
	adds r5, r0, r3
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r2, [r4, #2]
	ldr r1, _0805807C @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x40
	mov r8, r3
	adds r3, r1, #0
	cmp r2, r0
	ble _08058080
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	b _08058086
	.align 2, 0
_08058078: .4byte gSpriteData
_0805807C: .4byte gSamusData
_08058080:
	ldrh r1, [r5]
	ldr r0, _080580A8 @ =0x0000FBFF
	ands r0, r1
_08058086:
	strh r0, [r5]
	ldr r1, _080580AC @ =gCurrentSprite
	ldrh r0, [r1, #4]
	adds r4, r1, #0
	ldrh r3, [r3, #0x16]
	cmp r0, r3
	bls _080580B0
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	ldrh r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r1, r2
	b _080580BC
	.align 2, 0
_080580A8: .4byte 0x0000FBFF
_080580AC: .4byte gCurrentSprite
_080580B0:
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	ldrh r2, [r0]
	ldr r1, _08058148 @ =0x0000FDFF
	ands r1, r2
_080580BC:
	strh r1, [r0]
	subs r0, r6, r7
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2f
	movs r1, #0x50
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	movs r1, #0x38
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
_080580DC:
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	adds r0, #0x2d
	ldrb r1, [r0]
	cmp r1, #0
	beq _0805813A
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08058112
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805810C
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r2, [r4, #0x1f]
	adds r0, r0, r2
	movs r1, #0xd
	subs r1, r1, r0
_0805810C:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_08058112:
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	adds r0, #0x2d
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0
	bne _0805813A
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r3, [r0]
_0805813A:
	bl MegaXUpdatePalette
_0805813E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058148: .4byte 0x0000FDFF

	thumb_func_start CoreXShellVaria
CoreXShellVaria: @ 0x0805814C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r2, _08058190 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _08058194 @ =sSecondarySpriteStats
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r4, r2, #0
	adds r4, #0x24
	ldrb r3, [r4]
	adds r5, r2, #0
	cmp r3, #0
	beq _08058198
	cmp r3, #0x18
	bne _08058206
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	bne _0805818A
	b _080584FC
_0805818A:
	movs r0, #0
	strh r0, [r5]
	b _080584FC
	.align 2, 0
_08058190: .4byte gCurrentSprite
_08058194: .4byte sSecondarySpriteStats
_08058198:
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0x13
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08058234 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	strh r6, [r5, #0x14]
	adds r0, r5, #0
	adds r0, #0x27
	movs r1, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08058238 @ =0x0000FFB0
	strh r1, [r5, #0xa]
	movs r0, #0x50
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _0805823C @ =0x083A5E40
	str r0, [r5, #0x18]
	strb r2, [r5, #0x1c]
	strh r3, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #2
	strb r0, [r4]
	ldrh r0, [r5]
	ldr r3, _08058240 @ =0x00004008
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
	movs r0, #0x10
	strh r0, [r5, #0x12]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r2, [r0]
_08058206:
	ldr r2, _08058244 @ =gSpriteData
	mov r0, r8
	lsls r3, r0, #3
	subs r0, r3, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r5, #2]
	ldrh r1, [r0, #4]
	strh r1, [r5, #4]
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x37
	mov ip, r2
	adds r7, r3, #0
	cmp r0, #9
	bls _0805822A
	b _080584FC
_0805822A:
	lsls r0, r0, #2
	ldr r1, _08058248 @ =_0805824C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08058234: .4byte gIoRegisters
_08058238: .4byte 0x0000FFB0
_0805823C: .4byte 0x083A5E40
_08058240: .4byte 0x00004008
_08058244: .4byte gSpriteData
_08058248: .4byte _0805824C
_0805824C: @ jump table
	.4byte _08058274 @ case 0
	.4byte _0805827E @ case 1
	.4byte _080584FC @ case 2
	.4byte _080584FC @ case 3
	.4byte _080582A0 @ case 4
	.4byte _080584FC @ case 5
	.4byte _080584FC @ case 6
	.4byte _080584FC @ case 7
	.4byte _08058300 @ case 8
	.4byte _08058310 @ case 9
_08058274:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _080584FC
_0805827E:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r5]
	ldr r0, _0805829C @ =0x0000FFFB
	ands r0, r1
	strh r0, [r5]
	mov r1, r8
	subs r0, r7, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #0x12]
	strh r0, [r5, #0x12]
	b _080584FC
	.align 2, 0
_0805829C: .4byte 0x0000FFFB
_080582A0:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #0x12]
	strh r0, [r5, #0x12]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080582E0
	ldrh r1, [r5]
	ldr r0, _080582DC @ =0x0000BFF7
	ands r0, r1
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080584FC
	.align 2, 0
_080582DC: .4byte 0x0000BFF7
_080582E0:
	ldr r0, _080582FC @ =0x0000017F
	cmp r1, r0
	bls _080582E8
	b _080584FC
_080582E8:
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	b _080584FC
	.align 2, 0
_080582FC: .4byte 0x0000017F
_08058300:
	ldrh r0, [r5]
	ldr r1, _08058344 @ =0x00007FFF
	ands r1, r0
	strh r1, [r5]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
_08058310:
	ldrh r4, [r5, #0x14]
	cmp r4, #0
	bne _0805834C
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	ldr r0, _08058348 @ =0x083A5B68
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	mov r3, r8
	subs r0, r7, r3
	lsls r0, r0, #3
	add r0, ip
	adds r0, #0x24
	movs r1, #0x5c
	strb r1, [r0]
	movs r0, #0xc1
	bl SoundPlay
	b _080584FC
	.align 2, 0
_08058344: .4byte 0x00007FFF
_08058348: .4byte 0x083A5B68
_0805834C:
	adds r0, r6, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bhi _0805836C
	ldr r0, _08058368 @ =0x083A5E60
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #3
	b _08058384
	.align 2, 0
_08058368: .4byte 0x083A5E60
_0805836C:
	ldrh r4, [r5, #0x14]
	lsls r0, r6, #1
	movs r1, #3
	bl __divsi3
	cmp r4, r0
	bgt _08058386
	ldr r0, _080583C8 @ =0x083A5E50
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #2
_08058384:
	strb r0, [r1]
_08058386:
	adds r6, r5, #0
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #1
	bne _080583CC
	movs r0, #0x32
	bl SpriteUtilCountPrimarySprites
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bhi _08058482
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r3, [r0]
	movs r0, #0x20
	str r0, [sp]
	ldrh r0, [r6, #2]
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _08058482
	.align 2, 0
_080583C8: .4byte 0x083A5E50
_080583CC:
	cmp r1, #0x10
	bne _08058482
	movs r0, #0xc2
	bl SoundPlay
	adds r2, r5, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0805840C @ =gSpriteData
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0xb4
	strb r0, [r1]
	ldrh r1, [r5, #2]
	ldr r0, _08058410 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x40
	cmp r1, r0
	ble _08058414
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	b _0805841A
	.align 2, 0
_0805840C: .4byte gSpriteData
_08058410: .4byte gSamusData
_08058414:
	ldrh r1, [r3]
	ldr r0, _08058440 @ =0x0000FBFF
	ands r0, r1
_0805841A:
	strh r0, [r3]
	ldr r0, _08058444 @ =gCurrentSprite
	ldr r1, _08058448 @ =gSamusData
	ldrh r0, [r0, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08058450
	ldr r0, _0805844C @ =gSpriteData
	mov r3, r8
	subs r1, r7, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r2
	b _08058460
	.align 2, 0
_08058440: .4byte 0x0000FBFF
_08058444: .4byte gCurrentSprite
_08058448: .4byte gSamusData
_0805844C: .4byte gSpriteData
_08058450:
	ldr r0, _080584C0 @ =gSpriteData
	mov r2, r8
	subs r1, r7, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	ldr r0, _080584C4 @ =0x0000FDFF
	ands r0, r2
_08058460:
	strh r0, [r1]
	ldr r1, _080584C0 @ =gSpriteData
	mov r3, r8
	subs r0, r7, r3
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2f
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	movs r1, #0x1c
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
_08058482:
	ldr r1, _080584C0 @ =gSpriteData
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r4, [r0]
	mov ip, r1
	cmp r4, #0
	beq _080584FC
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _080584D2
	movs r0, #4
	ands r4, r0
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080584CC
	ldr r0, _080584C8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	ldrb r3, [r0, #0x1f]
	adds r1, r1, r3
	movs r2, #0xd
	subs r2, r2, r1
	adds r0, #0x20
	strb r2, [r0]
	b _080584D2
	.align 2, 0
_080584C0: .4byte gSpriteData
_080584C4: .4byte 0x0000FDFF
_080584C8: .4byte gCurrentSprite
_080584CC:
	ldr r0, _08058508 @ =gCurrentSprite
	adds r0, #0x20
	strb r1, [r0]
_080584D2:
	mov r1, r8
	subs r0, r7, r1
	lsls r0, r0, #3
	add r0, ip
	adds r0, #0x2d
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r4, #0
	bne _080584FC
	ldr r1, _08058508 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x34
	ldrb r2, [r3]
	movs r0, #0xbf
	ands r0, r2
	strb r0, [r3]
	adds r1, #0x20
	strb r4, [r1]
_080584FC:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058508: .4byte gCurrentSprite

	thumb_func_start MegaXShield
MegaXShield: @ 0x0805850C
	push {lr}
	ldr r0, _08058520 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08058524
	cmp r0, #2
	beq _0805852A
	b _0805852E
	.align 2, 0
_08058520: .4byte gCurrentSprite
_08058524:
	bl MegaXShieldInit
	b _0805852E
_0805852A:
	bl MegaXShieldIdle
_0805852E:
	pop {r0}
	bx r0
	.align 2, 0
