    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start OperationsRoomPadInit
OperationsRoomPadInit: @ 0x080399B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r4, _08039A38 @ =gCurrentSprite
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r7, #0
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x25
	strb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _08039A3C @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x21
	movs r1, #1
	mov r8, r1
	mov r1, r8
	strb r1, [r0]
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x34
	movs r1, #0
	bl SpriteSpawnSecondary
	bl EventCheckOn_SaXDefeated
	adds r5, r0, #0
	cmp r5, #0
	beq _08039A40
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	b _08039A5E
	.align 2, 0
_08039A38: .4byte gCurrentSprite
_08039A3C: .4byte 0x0000FFFC
_08039A40:
	bl EventCheckAfter_OrbitChange
	cmp r0, #0
	beq _08039A68
	adds r0, r4, #0
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
_08039A5E:
	movs r0, #0x35
	movs r1, #0
	bl SpriteSpawnSecondary
	b _08039A70
_08039A68:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	strb r0, [r1]
_08039A70:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start OperationsRoomPadIdleInit
OperationsRoomPadIdleInit: @ 0x08039A7C
	push {lr}
	ldr r1, _08039AA4 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039AAC
	ldr r0, _08039AA8 @ =sOperationsRoomPadOam_34c344
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x46
	b _08039AB4
	.align 2, 0
_08039AA4: .4byte gCurrentSprite
_08039AA8: .4byte sOperationsRoomPadOam_34c344
_08039AAC:
	ldr r0, _08039ABC @ =sOperationsRoomPadOam_34c2f4
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #2
_08039AB4:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08039ABC: .4byte sOperationsRoomPadOam_34c2f4

	thumb_func_start OperationsRoomPadIdle
OperationsRoomPadIdle: @ 0x08039AC0
	push {lr}
	bl NavPadDetectSamus
	cmp r0, #0
	beq _08039B00
	ldr r3, _08039AF4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08039B08
	subs r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08039AF8 @ =sOperationsRoomPadOam_34c254
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _08039AFC @ =0x00000101
	bl SoundPlay
	b _08039B08
	.align 2, 0
_08039AF4: .4byte gCurrentSprite
_08039AF8: .4byte sOperationsRoomPadOam_34c254
_08039AFC: .4byte 0x00000101
_08039B00:
	ldr r0, _08039B0C @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
_08039B08:
	pop {r0}
	bx r0
	.align 2, 0
_08039B0C: .4byte gCurrentSprite

	thumb_func_start OperationsRoomPadPressingSwitch
OperationsRoomPadPressingSwitch: @ 0x08039B10
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08039B2E
	ldr r1, _08039B34 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _08039B38 @ =sOperationsRoomPadOam_34c344
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
_08039B2E:
	pop {r0}
	bx r0
	.align 2, 0
_08039B34: .4byte gCurrentSprite
_08039B38: .4byte sOperationsRoomPadOam_34c344

	thumb_func_start OperationsRoomPadSwitchPressed
OperationsRoomPadSwitchPressed: @ 0x08039B3C
	push {r4, lr}
	bl NavPadDetectSamus
	adds r3, r0, #0
	cmp r3, #0
	beq _08039B90
	bl SpriteUtilCheckSamusMorphed
	cmp r0, #0
	bne _08039BAA
	ldr r2, _08039B84 @ =gSamusData
	ldr r4, _08039B88 @ =gCurrentSprite
	ldrh r0, [r4, #4]
	strh r0, [r2, #0x16]
	ldrb r0, [r2, #5]
	cmp r0, #0
	beq _08039B62
	movs r0, #0
	strb r0, [r2, #5]
_08039B62:
	ldr r1, _08039B8C @ =sSamusSetPoseFunctionPointer
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x36
	bl _call_via_r1
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x14
	strb r0, [r1]
	b _08039BAA
	.align 2, 0
_08039B84: .4byte gSamusData
_08039B88: .4byte gCurrentSprite
_08039B8C: .4byte sSamusSetPoseFunctionPointer
_08039B90:
	ldr r1, _08039BB0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _08039BB4 @ =sOperationsRoomPadOam_34c2cc
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	movs r0, #0x81
	lsls r0, r0, #1
	bl SoundPlay
_08039BAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039BB0: .4byte gCurrentSprite
_08039BB4: .4byte sOperationsRoomPadOam_34c2cc

	thumb_func_start OperationsRoomPadReleasing
OperationsRoomPadReleasing: @ 0x08039BB8
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08039BC6
	bl OperationsRoomPadIdleInit
_08039BC6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OperationsRoomPadSamusInteracting
OperationsRoomPadSamusInteracting: @ 0x08039BCC
	push {lr}
	ldr r0, _08039C10 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08039BEA
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039BEA
	ldr r0, _08039C14 @ =0x00000103
	bl SoundPlay
_08039BEA:
	ldr r1, _08039C18 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x36
	bne _08039C0C
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _08039C0C
	ldr r1, _08039C10 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3a
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
_08039C0C:
	pop {r0}
	bx r0
	.align 2, 0
_08039C10: .4byte gCurrentSprite
_08039C14: .4byte 0x00000103
_08039C18: .4byte gSamusData

	thumb_func_start OperationsRoomPadStartEscape
OperationsRoomPadStartEscape: @ 0x08039C1C
	push {lr}
	ldr r1, _08039C58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039C52
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldr r1, _08039C5C @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x67
	bl EventCheckAdvance
	movs r0, #0xb
	bl TrySpawnMessageBanner
	movs r0, #0
	bl FadeMusic
_08039C52:
	pop {r0}
	bx r0
	.align 2, 0
_08039C58: .4byte gCurrentSprite
_08039C5C: .4byte gPreventMovementTimer

	thumb_func_start OperationsRoomPadConsoleInit
OperationsRoomPadConsoleInit: @ 0x08039C60
	push {r4, lr}
	ldr r0, _08039CB4 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08039CB8 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08039CBC @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08039CC0 @ =sOperationsRoomPadOam_34c244
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039CB4: .4byte gCurrentSprite
_08039CB8: .4byte 0x0000FFFB
_08039CBC: .4byte 0x0000FFFC
_08039CC0: .4byte sOperationsRoomPadOam_34c244

	thumb_func_start OperationsRoomPadConsoleIdle
OperationsRoomPadConsoleIdle: @ 0x08039CC4
	bx lr
	.align 2, 0

	thumb_func_start OperationsRoomPadConsoleScreenInit
OperationsRoomPadConsoleScreenInit: @ 0x08039CC8
	push {r4, lr}
	ldr r0, _08039D3C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08039D40 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08039D44 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r2, _08039D48 @ =gSpriteData
	mov r0, ip
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039D50
	ldr r0, _08039D4C @ =sOperationsRoomPadOam_34c27c
	mov r1, ip
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x18
	b _08039D5C
	.align 2, 0
_08039D3C: .4byte gCurrentSprite
_08039D40: .4byte 0x0000FFFB
_08039D44: .4byte 0x0000FFFC
_08039D48: .4byte gSpriteData
_08039D4C: .4byte sOperationsRoomPadOam_34c27c
_08039D50:
	ldr r0, _08039D64 @ =sOperationsRoomPadOam_34c2a4
	mov r2, ip
	str r0, [r2, #0x18]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
_08039D5C:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039D64: .4byte sOperationsRoomPadOam_34c2a4

	thumb_func_start OperationsRoomPadConsoleScreenIdle
OperationsRoomPadConsoleScreenIdle: @ 0x08039D68
	push {lr}
	ldr r2, _08039D9C @ =gSpriteData
	ldr r3, _08039DA0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _08039D96
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08039DA4 @ =sOperationsRoomPadOam_34c27c
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
_08039D96:
	pop {r0}
	bx r0
	.align 2, 0
_08039D9C: .4byte gSpriteData
_08039DA0: .4byte gCurrentSprite
_08039DA4: .4byte sOperationsRoomPadOam_34c27c

	thumb_func_start OperationsRoomPadScreenInit
OperationsRoomPadScreenInit: @ 0x08039DA8
	push {r4, lr}
	ldr r0, _08039E0C @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r3, #0
	orrs r0, r1
	strb r0, [r2]
	mov r4, ip
	ldrh r1, [r4]
	ldr r0, _08039E10 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08039E14 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08039E18 @ =sOperationsRoomPadOam_34c31c
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	movs r0, #0x82
	lsls r0, r0, #1
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039E0C: .4byte gCurrentSprite
_08039E10: .4byte 0x0000FFFB
_08039E14: .4byte 0x0000FFFC
_08039E18: .4byte sOperationsRoomPadOam_34c31c

	thumb_func_start OperationsRoomPadScreenTurningOn
OperationsRoomPadScreenTurningOn: @ 0x08039E1C
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08039E38
	ldr r1, _08039E3C @ =gCurrentSprite
	ldr r0, _08039E40 @ =sOperationsRoomPadOam_34c304
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_08039E38:
	pop {r0}
	bx r0
	.align 2, 0
_08039E3C: .4byte gCurrentSprite
_08039E40: .4byte sOperationsRoomPadOam_34c304

	thumb_func_start OperationsRoomPadScreenIdle
OperationsRoomPadScreenIdle: @ 0x08039E44
	push {lr}
	ldr r3, _08039E7C @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _08039E80 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _08039E78
	ldr r0, _08039E84 @ =sOperationsRoomPadOam_34c354
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, #0xeb
	bl SoundPlay
_08039E78:
	pop {r0}
	bx r0
	.align 2, 0
_08039E7C: .4byte gCurrentSprite
_08039E80: .4byte gSpriteData
_08039E84: .4byte sOperationsRoomPadOam_34c354

	thumb_func_start OperationsRoomPadScreenTurningOff
OperationsRoomPadScreenTurningOff: @ 0x08039E88
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08039E98
	ldr r1, _08039E9C @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08039E98:
	pop {r0}
	bx r0
	.align 2, 0
_08039E9C: .4byte gCurrentSprite

	thumb_func_start OperationsRoomPad
OperationsRoomPad: @ 0x08039EA0
	push {lr}
	ldr r0, _08039EC0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bls _08039EB6
	b _08039FE0
_08039EB6:
	lsls r0, r0, #2
	ldr r1, _08039EC4 @ =_08039EC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039EC0: .4byte gCurrentSprite
_08039EC4: .4byte _08039EC8
_08039EC8: @ jump table
	.4byte _08039FB4 @ case 0
	.4byte _08039FB8 @ case 1
	.4byte _08039FBE @ case 2
	.4byte _08039FE0 @ case 3
	.4byte _08039FE0 @ case 4
	.4byte _08039FE0 @ case 5
	.4byte _08039FE0 @ case 6
	.4byte _08039FE0 @ case 7
	.4byte _08039FE0 @ case 8
	.4byte _08039FE0 @ case 9
	.4byte _08039FE0 @ case 10
	.4byte _08039FE0 @ case 11
	.4byte _08039FE0 @ case 12
	.4byte _08039FE0 @ case 13
	.4byte _08039FE0 @ case 14
	.4byte _08039FE0 @ case 15
	.4byte _08039FE0 @ case 16
	.4byte _08039FE0 @ case 17
	.4byte _08039FE0 @ case 18
	.4byte _08039FE0 @ case 19
	.4byte _08039FE0 @ case 20
	.4byte _08039FE0 @ case 21
	.4byte _08039FE0 @ case 22
	.4byte _08039FE0 @ case 23
	.4byte _08039FC4 @ case 24
	.4byte _08039FE0 @ case 25
	.4byte _08039FCA @ case 26
	.4byte _08039FE0 @ case 27
	.4byte _08039FD0 @ case 28
	.4byte _08039FE0 @ case 29
	.4byte _08039FE0 @ case 30
	.4byte _08039FE0 @ case 31
	.4byte _08039FE0 @ case 32
	.4byte _08039FE0 @ case 33
	.4byte _08039FE0 @ case 34
	.4byte _08039FE0 @ case 35
	.4byte _08039FE0 @ case 36
	.4byte _08039FE0 @ case 37
	.4byte _08039FE0 @ case 38
	.4byte _08039FE0 @ case 39
	.4byte _08039FE0 @ case 40
	.4byte _08039FE0 @ case 41
	.4byte _08039FE0 @ case 42
	.4byte _08039FE0 @ case 43
	.4byte _08039FE0 @ case 44
	.4byte _08039FE0 @ case 45
	.4byte _08039FE0 @ case 46
	.4byte _08039FE0 @ case 47
	.4byte _08039FE0 @ case 48
	.4byte _08039FE0 @ case 49
	.4byte _08039FE0 @ case 50
	.4byte _08039FE0 @ case 51
	.4byte _08039FE0 @ case 52
	.4byte _08039FE0 @ case 53
	.4byte _08039FE0 @ case 54
	.4byte _08039FE0 @ case 55
	.4byte _08039FD6 @ case 56
	.4byte _08039FE0 @ case 57
	.4byte _08039FDC @ case 58
_08039FB4:
	bl OperationsRoomPadInit
_08039FB8:
	bl OperationsRoomPadIdleInit
	b _08039FE0
_08039FBE:
	bl OperationsRoomPadIdle
	b _08039FE0
_08039FC4:
	bl OperationsRoomPadPressingSwitch
	b _08039FE0
_08039FCA:
	bl OperationsRoomPadSwitchPressed
	b _08039FE0
_08039FD0:
	bl OperationsRoomPadReleasing
	b _08039FE0
_08039FD6:
	bl OperationsRoomPadSamusInteracting
	b _08039FE0
_08039FDC:
	bl OperationsRoomPadStartEscape
_08039FE0:
	pop {r0}
	bx r0

	thumb_func_start OperationsRoomPadConsole
OperationsRoomPadConsole: @ 0x08039FE4
	push {lr}
	ldr r0, _0803A000 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A004
	cmp r0, #2
	beq _0803A008
	b _0803A00C
	.align 2, 0
_0803A000: .4byte gCurrentSprite
_0803A004:
	bl OperationsRoomPadConsoleInit
_0803A008:
	bl OperationsRoomPadConsoleIdle
_0803A00C:
	pop {r0}
	bx r0

	thumb_func_start OperationsRoomPadConsoleScreen
OperationsRoomPadConsoleScreen: @ 0x0803A010
	push {lr}
	ldr r0, _0803A02C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A030
	cmp r0, #2
	beq _0803A036
	b _0803A03A
	.align 2, 0
_0803A02C: .4byte gCurrentSprite
_0803A030:
	bl OperationsRoomPadConsoleScreenInit
	b _0803A03A
_0803A036:
	bl OperationsRoomPadConsoleScreenIdle
_0803A03A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OperationsRoomPadScreen
OperationsRoomPadScreen: @ 0x0803A040
	push {lr}
	ldr r0, _0803A060 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803A072
	cmp r0, #2
	bgt _0803A064
	cmp r0, #0
	beq _0803A06E
	b _0803A082
	.align 2, 0
_0803A060: .4byte gCurrentSprite
_0803A064:
	cmp r0, #0x18
	beq _0803A078
	cmp r0, #0x1a
	beq _0803A07E
	b _0803A082
_0803A06E:
	bl OperationsRoomPadScreenInit
_0803A072:
	bl OperationsRoomPadScreenTurningOn
	b _0803A082
_0803A078:
	bl OperationsRoomPadScreenIdle
	b _0803A082
_0803A07E:
	bl OperationsRoomPadScreenTurningOff
_0803A082:
	pop {r0}
	bx r0
	.align 2, 0
