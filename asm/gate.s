    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start GateSetCollision
GateSetCollision: @ 0x08030818
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08030860 @ =gCurrentSprite
	ldrh r7, [r0, #2]
	ldrh r6, [r0, #4]
	ldr r5, _08030864 @ =gCurrentClipdataAffectingAction
	strb r4, [r5]
	adds r0, r7, #0
	subs r0, #0x20
	adds r1, r6, #0
	bl ClipdataProcess
	strb r4, [r5]
	adds r0, r7, #0
	subs r0, #0x60
	adds r1, r6, #0
	bl ClipdataProcess
	strb r4, [r5]
	adds r0, r7, #0
	subs r0, #0xa0
	adds r1, r6, #0
	bl ClipdataProcess
	strb r4, [r5]
	adds r0, r7, #0
	subs r0, #0xe0
	adds r1, r6, #0
	bl ClipdataProcess
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030860: .4byte gCurrentSprite
_08030864: .4byte gCurrentClipdataAffectingAction

	thumb_func_start GateInit
GateInit: @ 0x08030868
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _080308D8 @ =gCurrentSprite
	mov ip, r0
	ldr r2, _080308DC @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	ldrh r0, [r1]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x27
	movs r0, #0x40
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080308E0 @ =0x0000FFFC
	mov r4, ip
	strh r0, [r4, #0xa]
	strh r3, [r4, #0xc]
	strh r0, [r4, #0xe]
	movs r0, #4
	strh r0, [r4, #0x10]
	subs r1, #5
	movs r0, #2
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	mov r0, ip
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _080308F8
	cmp r0, #0x12
	bgt _080308E4
	cmp r0, #0x11
	beq _080308EE
	b _08030924
	.align 2, 0
_080308D8: .4byte gCurrentSprite
_080308DC: .4byte sPrimarySpriteStats
_080308E0: .4byte 0x0000FFFC
_080308E4:
	cmp r0, #0x13
	beq _08030904
	cmp r0, #0x14
	beq _08030914
	b _08030924
_080308EE:
	movs r5, #1
	ldr r0, _080308F4 @ =0x08339084
	b _08030908
	.align 2, 0
_080308F4: .4byte 0x08339084
_080308F8:
	movs r5, #2
	ldr r0, _08030900 @ =0x08339084
	b _08030918
	.align 2, 0
_08030900: .4byte 0x08339084
_08030904:
	movs r5, #3
	ldr r0, _08030910 @ =0x083391F4
_08030908:
	mov r1, ip
	str r0, [r1, #0x18]
	b _0803095E
	.align 2, 0
_08030910: .4byte 0x083391F4
_08030914:
	movs r5, #4
	ldr r0, _08030920 @ =0x083391F4
_08030918:
	mov r4, ip
	str r0, [r4, #0x18]
	b _0803095E
	.align 2, 0
_08030920: .4byte 0x083391F4
_08030924:
	movs r5, #5
	bl EventCheckAfter_AnimalsReleased
	cmp r0, #0
	beq _08030948
	ldr r2, _08030940 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _08030944 @ =0x08338F84
	str r0, [r2, #0x18]
	b _08030990
	.align 2, 0
_08030940: .4byte gCurrentSprite
_08030944: .4byte 0x08338F84
_08030948:
	ldr r2, _08030998 @ =gCurrentSprite
	ldr r0, _0803099C @ =0x08339084
	str r0, [r2, #0x18]
	adds r3, r2, #0
	adds r3, #0x34
	ldrb r1, [r3]
	movs r0, #1
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0xd2
	strh r0, [r2, #6]
_0803095E:
	movs r0, #2
	bl GateSetCollision
	cmp r5, #4
	bhi _08030990
	ldr r4, _08030998 @ =gCurrentSprite
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r6, #0
	str r6, [sp, #8]
	movs r0, #0xf
	adds r1, r5, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xff
	bne _08030990
	strh r6, [r4]
_08030990:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030998: .4byte gCurrentSprite
_0803099C: .4byte 0x08339084

	thumb_func_start GateClosed
GateClosed: @ 0x080309A0
	push {r4, lr}
	ldr r4, _080309D4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0x14
	bgt _080309B2
	cmp r0, #0x11
	bge _080309CE
_080309B2:
	bl EventCheckAfter_AnimalsReleased
	cmp r0, #0
	beq _080309CE
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080309CE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_080309CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080309D4: .4byte gCurrentSprite

	thumb_func_start GateOpeningInit
GateOpeningInit: @ 0x080309D8
	push {lr}
	movs r0, #1
	bl GateSetCollision
	ldr r3, _08030A0C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0x11
	blt _08030A2C
	cmp r0, #0x12
	bgt _08030A14
	ldr r0, _08030A10 @ =0x0833900C
	str r0, [r3, #0x18]
	movs r0, #0x8a
	lsls r0, r0, #1
	bl SoundPlay
	b _08030A3A
	.align 2, 0
_08030A0C: .4byte gCurrentSprite
_08030A10: .4byte 0x0833900C
_08030A14:
	cmp r0, #0x14
	bgt _08030A2C
	ldr r0, _08030A24 @ =0x0833917C
	str r0, [r3, #0x18]
	ldr r0, _08030A28 @ =0x00000115
	bl SoundPlay
	b _08030A3A
	.align 2, 0
_08030A24: .4byte 0x0833917C
_08030A28: .4byte 0x00000115
_08030A2C:
	ldr r0, _08030A40 @ =gCurrentSprite
	ldr r1, _08030A44 @ =0x0833900C
	str r1, [r0, #0x18]
	movs r0, #0x8a
	lsls r0, r0, #1
	bl SoundPlay
_08030A3A:
	pop {r0}
	bx r0
	.align 2, 0
_08030A40: .4byte gCurrentSprite
_08030A44: .4byte 0x0833900C

	thumb_func_start GateOpening
GateOpening: @ 0x08030A48
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08030A84
	ldr r1, _08030A78 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x1a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	adds r0, r1, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0x11
	blt _08030A80
	cmp r0, #0x12
	ble _08030A80
	cmp r0, #0x14
	bgt _08030A80
	ldr r0, _08030A7C @ =0x083390F4
	b _08030A82
	.align 2, 0
_08030A78: .4byte gCurrentSprite
_08030A7C: .4byte 0x083390F4
_08030A80:
	ldr r0, _08030A88 @ =0x08338F84
_08030A82:
	str r0, [r1, #0x18]
_08030A84:
	pop {r0}
	bx r0
	.align 2, 0
_08030A88: .4byte 0x08338F84

	thumb_func_start GateSwitchInit
GateSwitchInit: @ 0x08030A8C
	push {r4, lr}
	ldr r0, _08030AF4 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08030AF8 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08030AFC @ =sSecondarySpriteStats
	mov r4, ip
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r1, ip
	adds r1, #0x25
	movs r0, #1
	strb r0, [r1]
	adds r1, #2
	movs r0, #0x40
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x28
	strb r0, [r1]
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r4, #0xa]
	adds r0, #0x40
	strh r0, [r4, #0xc]
	subs r1, #5
	movs r0, #2
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldrb r0, [r4, #0x1e]
	mov r1, ip
	cmp r0, #2
	beq _08030B20
	cmp r0, #2
	bgt _08030B00
	cmp r0, #1
	beq _08030B0A
	b _08030B34
	.align 2, 0
_08030AF4: .4byte gCurrentSprite
_08030AF8: .4byte 0x0000FFFB
_08030AFC: .4byte sSecondarySpriteStats
_08030B00:
	cmp r0, #3
	beq _08030B0A
	cmp r0, #4
	beq _08030B20
	b _08030B34
_08030B0A:
	ldr r0, _08030B18 @ =0x0000FF6C
	strh r0, [r1, #0xe]
	adds r0, #0x20
	strh r0, [r1, #0x10]
	ldr r0, _08030B1C @ =0x0833928C
	str r0, [r1, #0x18]
	b _08030B38
	.align 2, 0
_08030B18: .4byte 0x0000FF6C
_08030B1C: .4byte 0x0833928C
_08030B20:
	movs r0, #0x74
	strh r0, [r1, #0xe]
	movs r0, #0x94
	strh r0, [r1, #0x10]
	ldr r0, _08030B30 @ =0x083392C4
	str r0, [r1, #0x18]
	b _08030B38
	.align 2, 0
_08030B30: .4byte 0x083392C4
_08030B34:
	movs r0, #0
	strh r0, [r1]
_08030B38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GateSwitchIdle
GateSwitchIdle: @ 0x08030B40
	push {lr}
	ldr r0, _08030B70 @ =gCurrentSprite
	ldrh r3, [r0, #0x14]
	adds r2, r0, #0
	cmp r3, #0
	bne _08030B98
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	strb r3, [r2, #0x1c]
	movs r0, #0
	strh r3, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x25
	strb r0, [r1]
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	beq _08030B88
	cmp r0, #2
	bgt _08030B74
	cmp r0, #1
	beq _08030B7E
	b _08030B94
	.align 2, 0
_08030B70: .4byte gCurrentSprite
_08030B74:
	cmp r0, #3
	beq _08030B7E
	cmp r0, #4
	beq _08030B88
	b _08030B94
_08030B7E:
	ldr r0, _08030B84 @ =0x083392AC
	str r0, [r2, #0x18]
	b _08030B98
	.align 2, 0
_08030B84: .4byte 0x083392AC
_08030B88:
	ldr r0, _08030B90 @ =0x083392E4
	str r0, [r2, #0x18]
	b _08030B98
	.align 2, 0
_08030B90: .4byte 0x083392E4
_08030B94:
	movs r0, #0
	strh r0, [r2]
_08030B98:
	pop {r0}
	bx r0

	thumb_func_start GateSwitchPressing
GateSwitchPressing: @ 0x08030B9C
	push {r4, r5, lr}
	ldr r4, _08030BE4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r5, #0
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08030C1E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	strb r5, [r4, #0x1c]
	strh r5, [r4, #0x16]
	ldr r2, _08030BE8 @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
	ldrb r1, [r4, #0x1e]
	cmp r1, #2
	beq _08030C08
	cmp r1, #2
	bgt _08030BEC
	cmp r1, #1
	beq _08030BF6
	b _08030C18
	.align 2, 0
_08030BE4: .4byte gCurrentSprite
_08030BE8: .4byte gSpriteData
_08030BEC:
	cmp r1, #3
	beq _08030BF6
	cmp r1, #4
	beq _08030C08
	b _08030C18
_08030BF6:
	ldr r1, _08030C00 @ =gCurrentSprite
	ldr r0, _08030C04 @ =0x083392FC
	str r0, [r1, #0x18]
	b _08030C1E
	.align 2, 0
_08030C00: .4byte gCurrentSprite
_08030C04: .4byte 0x083392FC
_08030C08:
	ldr r1, _08030C10 @ =gCurrentSprite
	ldr r0, _08030C14 @ =0x0833930C
	str r0, [r1, #0x18]
	b _08030C1E
	.align 2, 0
_08030C10: .4byte gCurrentSprite
_08030C14: .4byte 0x0833930C
_08030C18:
	ldr r1, _08030C24 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08030C1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030C24: .4byte gCurrentSprite

	thumb_func_start GateSwitchPressed
GateSwitchPressed: @ 0x08030C28
	ldr r0, _08030C34 @ =gCurrentSprite
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08030C34: .4byte gCurrentSprite

	thumb_func_start Gate
Gate: @ 0x08030C38
	push {lr}
	ldr r0, _08030C58 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08030C6C
	cmp r0, #2
	bgt _08030C5C
	cmp r0, #0
	beq _08030C66
	b _08030C7C
	.align 2, 0
_08030C58: .4byte gCurrentSprite
_08030C5C:
	cmp r0, #0x17
	beq _08030C72
	cmp r0, #0x18
	beq _08030C78
	b _08030C7C
_08030C66:
	bl GateInit
	b _08030C7C
_08030C6C:
	bl GateClosed
	b _08030C7C
_08030C72:
	bl GateOpeningInit
	b _08030C7C
_08030C78:
	bl GateOpening
_08030C7C:
	pop {r0}
	bx r0

	thumb_func_start GateSwitch
GateSwitch: @ 0x08030C80
	push {lr}
	ldr r0, _08030C98 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08030CAC
	cmp r0, #2
	bgt _08030C9C
	cmp r0, #0
	beq _08030CA6
	b _08030CBC
	.align 2, 0
_08030C98: .4byte gCurrentSprite
_08030C9C:
	cmp r0, #0x18
	beq _08030CB2
	cmp r0, #0x1a
	beq _08030CB8
	b _08030CBC
_08030CA6:
	bl GateSwitchInit
	b _08030CBC
_08030CAC:
	bl GateSwitchIdle
	b _08030CBC
_08030CB2:
	bl GateSwitchPressing
	b _08030CBC
_08030CB8:
	bl GateSwitchPressed
_08030CBC:
	pop {r0}
	bx r0
