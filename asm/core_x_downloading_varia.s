    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start CoreAbilityBeforeVariaCoreInit
CoreAbilityBeforeVariaCoreInit: @ 0x08026648
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r5, _08026770 @ =gCurrentSprite
	ldrh r0, [r5, #2]
	adds r0, #0x30
	movs r3, #0
	movs r6, #0
	strh r0, [r5, #2]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #2
	strb r4, [r0]
	ldr r2, _08026774 @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	ldr r0, _08026778 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r3, [r0]
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802677C @ =0x0000FFE0
	strh r1, [r5, #0xa]
	movs r0, #0x20
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _08026780 @ =0x083151FC
	str r0, [r5, #0x18]
	strb r3, [r5, #0x1c]
	strh r6, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x2e
	strb r4, [r0]
	adds r0, #2
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
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
	movs r0, #0x5d
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08026764
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x5c
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08026764
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x5c
	movs r1, #1
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08026764
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x5c
	movs r1, #2
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08026764
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x5c
	movs r1, #3
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08026766
_08026764:
	strh r6, [r5]
_08026766:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026770: .4byte gCurrentSprite
_08026774: .4byte sPrimarySpriteStats
_08026778: .4byte gIoRegisters
_0802677C: .4byte 0x0000FFE0
_08026780: .4byte 0x083151FC

	thumb_func_start CoreXAbilityBeforeVariaCoreIdle
CoreXAbilityBeforeVariaCoreIdle: @ 0x08026784
	push {lr}
	ldr r0, _080267A8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _080267A2
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080267A2
	ldr r0, _080267AC @ =0x00000231
	bl SoundPlay
_080267A2:
	pop {r0}
	bx r0
	.align 2, 0
_080267A8: .4byte gCurrentSprite
_080267AC: .4byte 0x00000231

	thumb_func_start CoreXAbilityBeforeVariaCoreExplodingDataPad
CoreXAbilityBeforeVariaCoreExplodingDataPad: @ 0x080267B0
	push {r4, r5, r6, r7, lr}
	ldr r2, _08026804 @ =gCurrentSprite
	adds r5, r2, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r4, _08026808 @ =0x083031E0
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _0802680C @ =0x00007FFF
	cmp r0, r6
	bne _080267D0
	ldrh r3, [r4]
	movs r1, #0
_080267D0:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _08026810 @ =0x08303262
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _080267F4
	ldrh r3, [r4]
	movs r1, #0
_080267F4:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026804: .4byte gCurrentSprite
_08026808: .4byte 0x083031E0
_0802680C: .4byte 0x00007FFF
_08026810: .4byte 0x08303262

	thumb_func_start CoreXAbilityBeforeVariaCoreFloatingAway
CoreXAbilityBeforeVariaCoreFloatingAway: @ 0x08026814
	push {r4, r5, r6, r7, lr}
	ldr r3, _08026878 @ =gCurrentSprite
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
	adds r5, r3, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r4, _0802687C @ =0x083031E0
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r7, _08026880 @ =0x00007FFF
	mov ip, r7
	cmp r0, ip
	bne _0802683E
	ldrh r1, [r4]
	movs r2, #0
_0802683E:
	adds r0, r2, #1
	strb r0, [r5]
	ldrh r0, [r3, #2]
	adds r5, r0, r1
	strh r5, [r3, #2]
	adds r6, r3, #0
	adds r6, #0x30
	ldrb r2, [r6]
	ldr r4, _08026884 @ =0x08303262
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, ip
	bne _08026862
	ldrh r1, [r4]
	movs r2, #0
_08026862:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r3, #4]
	adds r0, r0, r1
	subs r1, r5, #2
	strh r1, [r3, #2]
	adds r0, #3
	strh r0, [r3, #4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026878: .4byte gCurrentSprite
_0802687C: .4byte 0x083031E0
_08026880: .4byte 0x00007FFF
_08026884: .4byte 0x08303262

	thumb_func_start CoreXAbilityBeforeVariaCore
CoreXAbilityBeforeVariaCore: @ 0x08026888
	push {lr}
	ldr r0, _080268A8 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080268BC
	cmp r0, #2
	bgt _080268AC
	cmp r0, #0
	beq _080268B6
	b _080268CC
	.align 2, 0
_080268A8: .4byte gCurrentSprite
_080268AC:
	cmp r0, #0x18
	beq _080268C2
	cmp r0, #0x1a
	beq _080268C8
	b _080268CC
_080268B6:
	bl CoreAbilityBeforeVariaCoreInit
	b _080268CC
_080268BC:
	bl CoreXAbilityBeforeVariaCoreIdle
	b _080268CC
_080268C2:
	bl CoreXAbilityBeforeVariaCoreExplodingDataPad
	b _080268CC
_080268C8:
	bl CoreXAbilityBeforeVariaCoreFloatingAway
_080268CC:
	pop {r0}
	bx r0

	thumb_func_start CoreXShellBeforeVariaCore
CoreXShellBeforeVariaCore: @ 0x080268D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08026964 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r7, [r1]
	adds r5, r0, #0
	adds r5, #0x24
	ldrb r3, [r5]
	mov ip, r0
	cmp r3, #0
	bne _08026978
	ldrh r1, [r0]
	movs r0, #8
	movs r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #0x12]
	mov r0, ip
	adds r0, #0x2b
	strb r2, [r0]
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	mov r4, ip
	ldrh r1, [r4]
	ldr r0, _08026968 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	mov r1, ip
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0802696C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r4, #0x14]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08026970 @ =0x0000FFB0
	strh r1, [r4, #0xa]
	movs r0, #0x50
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08026974 @ =0x083151E4
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	mov r1, ip
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	adds r1, #9
	strb r2, [r1]
	strb r0, [r5]
	b _08026B0C
	.align 2, 0
_08026964: .4byte gCurrentSprite
_08026968: .4byte 0x0000FFFB
_0802696C: .4byte gIoRegisters
_08026970: .4byte 0x0000FFB0
_08026974: .4byte 0x083151E4
_08026978:
	cmp r3, #0x1a
	bne _0802699C
	mov r1, ip
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	mov r1, ip
	ldrh r0, [r1]
	movs r1, #4
	eors r0, r1
	mov r2, ip
	strh r0, [r2]
	mov r1, ip
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0xe
	strb r0, [r1]
	b _08026B0C
_0802699C:
	mov r3, ip
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r0, #1
	movs r4, #0
	mov r8, r4
	strb r0, [r3]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x77
	bls _080269BE
	mov r2, ip
	adds r2, #0x2b
	lsrs r0, r1, #0x1c
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
_080269BE:
	ldrb r0, [r3]
	cmp r0, #0xb4
	bne _08026A08
	mov r2, ip
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r0, r4, #0
	movs r6, #0
	orrs r0, r1
	strh r0, [r2]
	movs r4, #0x1a
	strb r4, [r5]
	mov r0, ip
	adds r0, #0x25
	strb r6, [r0]
	ldr r3, _08026A00 @ =gSpriteData
	lsls r5, r7, #3
	subs r1, r5, r7
	lsls r1, r1, #3
	adds r2, r1, r3
	adds r0, r2, #0
	adds r0, #0x24
	strb r4, [r0]
	adds r0, r3, #0
	adds r0, #0x18
	adds r1, r1, r0
	ldr r0, _08026A04 @ =0x083152BC
	str r0, [r1]
	strb r6, [r2, #0x1c]
	mov r0, r8
	strh r0, [r2, #0x16]
	b _08026B40
	.align 2, 0
_08026A00: .4byte gSpriteData
_08026A04: .4byte 0x083152BC
_08026A08:
	cmp r0, #0x78
	bne _08026A50
	ldr r4, _08026A44 @ =gSpriteData
	lsls r5, r7, #3
	subs r1, r5, r7
	lsls r1, r1, #3
	adds r3, r1, r4
	adds r2, r3, #0
	adds r2, #0x24
	movs r0, #0x18
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x18
	adds r1, r1, r0
	ldr r0, _08026A48 @ =0x08315284
	str r0, [r1]
	mov r1, r8
	strb r1, [r3, #0x1c]
	movs r1, #0
	mov r2, r8
	strh r2, [r3, #0x16]
	ldr r0, _08026A4C @ =0x083151D4
	mov r2, ip
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	mov r0, r8
	strh r0, [r2, #0x16]
	adds r3, r4, #0
	b _08026B40
	.align 2, 0
_08026A44: .4byte gSpriteData
_08026A48: .4byte 0x08315284
_08026A4C: .4byte 0x083151D4
_08026A50:
	cmp r0, #0x79
	bne _08026A6C
	ldr r1, _08026A60 @ =0x040000D4
	ldr r0, _08026A64 @ =0x08315414
	str r0, [r1]
	ldr r0, _08026A68 @ =0x06015800
	b _08026B04
	.align 2, 0
_08026A60: .4byte 0x040000D4
_08026A64: .4byte 0x08315414
_08026A68: .4byte 0x06015800
_08026A6C:
	cmp r0, #0x7a
	bne _08026A88
	ldr r1, _08026A7C @ =0x040000D4
	ldr r0, _08026A80 @ =0x08315614
	str r0, [r1]
	ldr r0, _08026A84 @ =0x06015A00
	b _08026B04
	.align 2, 0
_08026A7C: .4byte 0x040000D4
_08026A80: .4byte 0x08315614
_08026A84: .4byte 0x06015A00
_08026A88:
	cmp r0, #0x7b
	bne _08026AA4
	ldr r1, _08026A98 @ =0x040000D4
	ldr r0, _08026A9C @ =0x08315814
	str r0, [r1]
	ldr r0, _08026AA0 @ =0x06015C00
	b _08026B04
	.align 2, 0
_08026A98: .4byte 0x040000D4
_08026A9C: .4byte 0x08315814
_08026AA0: .4byte 0x06015C00
_08026AA4:
	cmp r0, #0x7c
	bne _08026AC0
	ldr r1, _08026AB4 @ =0x040000D4
	ldr r0, _08026AB8 @ =0x08315A14
	str r0, [r1]
	ldr r0, _08026ABC @ =0x06015E00
	b _08026B04
	.align 2, 0
_08026AB4: .4byte 0x040000D4
_08026AB8: .4byte 0x08315A14
_08026ABC: .4byte 0x06015E00
_08026AC0:
	cmp r0, #0x7d
	bne _08026ADC
	ldr r1, _08026AD0 @ =0x040000D4
	ldr r0, _08026AD4 @ =0x08315C14
	str r0, [r1]
	ldr r0, _08026AD8 @ =0x06016000
	b _08026B04
	.align 2, 0
_08026AD0: .4byte 0x040000D4
_08026AD4: .4byte 0x08315C14
_08026AD8: .4byte 0x06016000
_08026ADC:
	cmp r0, #0x7e
	bne _08026AF8
	ldr r1, _08026AEC @ =0x040000D4
	ldr r0, _08026AF0 @ =0x08315E14
	str r0, [r1]
	ldr r0, _08026AF4 @ =0x06016200
	b _08026B04
	.align 2, 0
_08026AEC: .4byte 0x040000D4
_08026AF0: .4byte 0x08315E14
_08026AF4: .4byte 0x06016200
_08026AF8:
	cmp r0, #0x7f
	bne _08026B28
	ldr r1, _08026B14 @ =0x040000D4
	ldr r0, _08026B18 @ =0x08316014
	str r0, [r1]
	ldr r0, _08026B1C @ =0x06016400
_08026B04:
	str r0, [r1, #4]
	ldr r0, _08026B20 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08026B0C:
	ldr r3, _08026B24 @ =gSpriteData
	lsls r5, r7, #3
	b _08026B40
	.align 2, 0
_08026B14: .4byte 0x040000D4
_08026B18: .4byte 0x08316014
_08026B1C: .4byte 0x06016400
_08026B20: .4byte 0x80000100
_08026B24: .4byte gSpriteData
_08026B28:
	ldr r3, _08026B5C @ =gSpriteData
	lsls r5, r7, #3
	cmp r0, #0x80
	bne _08026B40
	ldr r1, _08026B60 @ =0x040000D4
	ldr r0, _08026B64 @ =0x08316214
	str r0, [r1]
	ldr r0, _08026B68 @ =0x06016600
	str r0, [r1, #4]
	ldr r0, _08026B6C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08026B40:
	subs r0, r5, r7
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r0, #2]
	mov r2, ip
	strh r1, [r2, #2]
	ldrh r0, [r0, #4]
	strh r0, [r2, #4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026B5C: .4byte gSpriteData
_08026B60: .4byte 0x040000D4
_08026B64: .4byte 0x08316214
_08026B68: .4byte 0x06016600
_08026B6C: .4byte 0x80000100

	thumb_func_start CoreXStaticBeforeVariaCore
CoreXStaticBeforeVariaCore: @ 0x08026B70
	push {r4, r5, r6, lr}
	ldr r1, _08026BDC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r5, [r0]
	adds r6, r1, #0
	adds r6, #0x24
	ldrb r4, [r6]
	adds r3, r1, #0
	cmp r4, #0
	bne _08026C2A
	adds r0, r3, #0
	adds r0, #0x22
	movs r2, #4
	strb r2, [r0]
	ldr r0, _08026BE0 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r1, #0
	ldr r0, _08026BE4 @ =0x0000FFFC
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	strh r0, [r3, #0xe]
	strh r2, [r3, #0x10]
	strb r1, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	movs r0, #2
	strb r0, [r6]
	ldrb r0, [r3, #0x1e]
	cmp r0, #0
	bne _08026BEC
	ldr r0, _08026BE8 @ =0x0831539C
	str r0, [r3, #0x18]
	b _08026C2A
	.align 2, 0
_08026BDC: .4byte gCurrentSprite
_08026BE0: .4byte gIoRegisters
_08026BE4: .4byte 0x0000FFFC
_08026BE8: .4byte 0x0831539C
_08026BEC:
	cmp r0, #1
	bne _08026BFC
	ldr r0, _08026BF8 @ =0x083153C4
	str r0, [r3, #0x18]
	b _08026C2A
	.align 2, 0
_08026BF8: .4byte 0x083153C4
_08026BFC:
	cmp r0, #2
	bne _08026C0C
	ldr r0, _08026C08 @ =0x083153EC
	str r0, [r3, #0x18]
	b _08026C2A
	.align 2, 0
_08026C08: .4byte 0x083153EC
_08026C0C:
	cmp r0, #3
	bne _08026C28
	ldr r0, _08026C20 @ =0x08315304
	str r0, [r3, #0x18]
	ldrh r1, [r3]
	ldr r0, _08026C24 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r3]
	b _08026C2A
	.align 2, 0
_08026C20: .4byte 0x08315304
_08026C24: .4byte 0x0000FFFB
_08026C28:
	strh r4, [r3]
_08026C2A:
	ldr r0, _08026C48 @ =gSpriteData
	lsls r2, r5, #3
	subs r1, r2, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0x1a
	bne _08026C4C
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	b _08026C60
	.align 2, 0
_08026C48: .4byte gSpriteData
_08026C4C:
	cmp r1, #0x18
	bne _08026C62
	ldrb r0, [r3, #0x1e]
	cmp r0, #3
	bne _08026C5A
	movs r0, #0
	b _08026C60
_08026C5A:
	ldrh r1, [r3]
	ldr r0, _08026C78 @ =0x0000FFFB
	ands r0, r1
_08026C60:
	strh r0, [r3]
_08026C62:
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #2]
	strh r1, [r3, #2]
	ldrh r0, [r0, #4]
	strh r0, [r3, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026C78: .4byte 0x0000FFFB
