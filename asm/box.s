    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start BoxSpawnFallingDebris
BoxSpawnFallingDebris: @ 0x08037CCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r4, _08037DC4 @ =gCurrentSprite
	ldrh r6, [r4, #2]
	ldrh r7, [r4, #4]
	ldrb r2, [r4, #0x1f]
	movs r0, #0x23
	adds r0, r0, r4
	mov r8, r0
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0xe8
	str r0, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0xbe
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	ldr r1, _08037DC8 @ =0xFFFFFEAA
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0xa0
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	ldr r1, _08037DCC @ =0xFFFFFEFA
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0xdc
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0x50
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	ldr r1, _08037DD0 @ =0xFFFFFEDC
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0x8c
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #8
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037DC4: .4byte gCurrentSprite
_08037DC8: .4byte 0xFFFFFEAA
_08037DCC: .4byte 0xFFFFFEFA
_08037DD0: .4byte 0xFFFFFEDC

	thumb_func_start BoxSetDebrisClipdata
BoxSetDebrisClipdata: @ 0x08037DD4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08037E10 @ =gCurrentSprite
	ldrh r5, [r0, #2]
	ldrh r6, [r0, #4]
	ldr r0, _08037E14 @ =gCurrentClipdataAffectingAction
	mov r8, r0
	strb r4, [r0]
	subs r5, #0xe0
	adds r1, r6, #0
	adds r1, #0x20
	adds r0, r5, #0
	bl ClipdataProcess
	mov r0, r8
	strb r4, [r0]
	subs r6, #0x20
	adds r0, r5, #0
	adds r1, r6, #0
	bl ClipdataProcess
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037E10: .4byte gCurrentSprite
_08037E14: .4byte gCurrentClipdataAffectingAction

	thumb_func_start BoxDebrisInit
BoxDebrisInit: @ 0x08037E18
	push {r4, r5, lr}
	ldr r4, _08037EAC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	movs r5, #0x29
	movs r0, #0x18
	strb r0, [r5, r4]
	ldr r0, _08037EB0 @ =0x0000FF10
	strh r0, [r4, #0xa]
	strh r1, [r4, #0xc]
	adds r0, #0xc0
	strh r0, [r4, #0xe]
	movs r0, #0x30
	strh r0, [r4, #0x10]
	ldr r0, _08037EB4 @ =sFrameData_347fa8
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	movs r3, #1
	movs r0, #1
	strh r0, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	bl EventCheckAfter_BoxDefeated
	adds r2, r0, #0
	cmp r2, #0
	beq _08037ECC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08037EB8 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r4]
	ldr r0, _08037EBC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037EC0
	strh r0, [r4]
	b _08037EDE
	.align 2, 0
_08037EAC: .4byte gCurrentSprite
_08037EB0: .4byte 0x0000FF10
_08037EB4: .4byte sFrameData_347fa8
_08037EB8: .4byte 0x0000DFFF
_08037EBC: .4byte gPreviousCollisionCheck
_08037EC0:
	movs r0, #2
	bl BoxSetDebrisClipdata
	bl BoxSpawnFallingDebris
	b _08037EDE
_08037ECC:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08037EE4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037EDE
	strh r2, [r4]
_08037EDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037EE4: .4byte gPreviousCollisionCheck

	thumb_func_start BoxDebrisIdle
BoxDebrisIdle: @ 0x08037EE8
	ldr r0, _08037EF4 @ =gCurrentSprite
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08037EF4: .4byte gCurrentSprite

	thumb_func_start BoxDebrisFallingInit
BoxDebrisFallingInit: @ 0x08037EF8
	ldr r1, _08037F14 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r2, [r1]
	ldr r0, _08037F18 @ =0x0000DFFF
	ands r0, r2
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	bx lr
	.align 2, 0
_08037F14: .4byte gCurrentSprite
_08037F18: .4byte 0x0000DFFF

	thumb_func_start BoxDebrisWaitToFall
BoxDebrisWaitToFall: @ 0x08037F1C
	push {lr}
	ldr r2, _08037F74 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2, #4]
	lsrs r0, r0, #2
	ldr r1, _08037F78 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08037F7C @ =0xFFDF0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xae
	bhi _08037F6E
	adds r0, r2, #0
	adds r0, #0x2e
	strb r3, [r0]
	adds r0, #3
	strb r3, [r0]
	subs r0, #0xd
	movs r1, #0x1c
	strb r1, [r0]
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	bl BoxSpawnFallingDebris
	movs r0, #0x8c
	lsls r0, r0, #2
	bl unk_3b1c
_08037F6E:
	pop {r0}
	bx r0
	.align 2, 0
_08037F74: .4byte gCurrentSprite
_08037F78: .4byte gBg1XPosition
_08037F7C: .4byte 0xFFDF0000

	thumb_func_start BoxDebrisFalling
BoxDebrisFalling: @ 0x08037F80
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08037FF0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r7, [r1]
	ldrh r5, [r4, #2]
	ldrh r6, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08037FF4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037FF8
	strh r1, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x1e
	strb r1, [r0]
	movs r0, #0x1e
	movs r1, #0x81
	bl ScreenShakeStartVertical
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x31
	bl ParticleSet
	adds r1, r6, #0
	adds r1, #0x20
	adds r0, r5, #0
	movs r2, #0x31
	bl ParticleSet
	movs r0, #0x28
	bl EventCheckAdvance
	movs r0, #2
	bl BoxSetDebrisClipdata
	movs r0, #0x18
	movs r1, #6
	bl PlayMusic
	b _0803807E
	.align 2, 0
_08037FF0: .4byte gCurrentSprite
_08037FF4: .4byte gPreviousVerticalCollisionCheck
_08037FF8:
	movs r0, #0x31
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	ldr r1, _08038024 @ =sSpritesFallingSpeedFast
	mov ip, r1
	lsls r0, r2, #1
	add r0, ip
	ldrh r3, [r0]
	mov sb, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08038028 @ =0x00007FFF
	cmp r1, r0
	bne _0803802C
	subs r1, r2, #1
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038036
	.align 2, 0
_08038024: .4byte sSpritesFallingSpeedFast
_08038028: .4byte 0x00007FFF
_0803802C:
	adds r0, r2, #1
	mov r1, r8
	strb r0, [r1]
	ldrh r0, [r4, #2]
	add r0, sb
_08038036:
	strh r0, [r4, #2]
	movs r1, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803804E
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x34
	bl ParticleSet
	b _0803807E
_0803804E:
	adds r0, r7, #4
	ands r0, r1
	cmp r0, #0
	bne _08038066
	adds r0, r5, #0
	subs r0, #0xa0
	adds r1, r6, #0
	adds r1, #0x28
	movs r2, #0x33
	bl ParticleSet
	b _0803807E
_08038066:
	adds r0, r7, #0
	adds r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0803807E
	adds r0, r5, #0
	subs r0, #0x82
	adds r1, r6, #0
	subs r1, #0x28
	movs r2, #0x33
	bl ParticleSet
_0803807E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxFallingDebrisInit
BoxFallingDebrisInit: @ 0x0803808C
	push {r4, lr}
	ldr r3, _080380D0 @ =gCurrentSprite
	ldrh r1, [r3]
	ldr r0, _080380D4 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r4, #0
	strh r0, [r3]
	ldr r1, _080380D8 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #0xa
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	ldrb r0, [r3, #0x1e]
	cmp r0, #8
	bls _080380C6
	b _080382E8
_080380C6:
	lsls r0, r0, #2
	ldr r1, _080380DC @ =_080380E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080380D0: .4byte gCurrentSprite
_080380D4: .4byte 0x0000FFFB
_080380D8: .4byte 0x0000FFFC
_080380DC: .4byte _080380E0
_080380E0: @ jump table
	.4byte _08038104 @ case 0
	.4byte _08038160 @ case 1
	.4byte _0803818C @ case 2
	.4byte _080381BC @ case 3
	.4byte _080381EC @ case 4
	.4byte _0803821C @ case 5
	.4byte _0803824C @ case 6
	.4byte _08038280 @ case 7
	.4byte _080382A8 @ case 8
_08038104:
	ldr r3, _08038154 @ =gCurrentSprite
	ldr r0, _08038158 @ =sFrameData_347fb8
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x29
	movs r0, #0x18
	strb r0, [r2]
	ldr r0, _0803815C @ =0x0000FF78
	strh r0, [r3, #0xa]
	strh r1, [r3, #0xc]
	adds r0, #0x84
	strh r0, [r3, #0xe]
	movs r0, #0x44
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xb
	strb r0, [r1]
	adds r1, #3
	movs r0, #1
	strb r0, [r1]
	strh r0, [r3, #0x14]
	adds r2, #0xb
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038154: .4byte gCurrentSprite
_08038158: .4byte sFrameData_347fb8
_0803815C: .4byte 0x0000FF78
_08038160:
	ldr r4, _08038184 @ =gCurrentSprite
	ldr r0, _08038188 @ =sFrameData_347fc8
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #5
	b _080382CA
	.align 2, 0
_08038184: .4byte gCurrentSprite
_08038188: .4byte sFrameData_347fc8
_0803818C:
	ldr r2, _080381B4 @ =gCurrentSprite
	ldr r0, _080381B8 @ =sFrameData_347fd8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x28
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080381B4: .4byte gCurrentSprite
_080381B8: .4byte sFrameData_347fd8
_080381BC:
	ldr r2, _080381E4 @ =gCurrentSprite
	ldr r0, _080381E8 @ =sFrameData_347fe8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x50
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080381E4: .4byte gCurrentSprite
_080381E8: .4byte sFrameData_347fe8
_080381EC:
	ldr r2, _08038214 @ =gCurrentSprite
	ldr r0, _08038218 @ =sFrameData_347ff8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #9
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038214: .4byte gCurrentSprite
_08038218: .4byte sFrameData_347ff8
_0803821C:
	ldr r4, _08038244 @ =gCurrentSprite
	ldr r0, _08038248 @ =0x08348008
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #9
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x78
	b _080382CC
	.align 2, 0
_08038244: .4byte gCurrentSprite
_08038248: .4byte 0x08348008
_0803824C:
	ldr r2, _08038278 @ =gCurrentSprite
	ldr r0, _0803827C @ =0x08348018
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038278: .4byte gCurrentSprite
_0803827C: .4byte 0x08348018
_08038280:
	ldr r2, _080382A0 @ =gCurrentSprite
	ldr r0, _080382A4 @ =0x08348028
	str r0, [r2, #0x18]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x14
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080382A0: .4byte gCurrentSprite
_080382A4: .4byte 0x08348028
_080382A8:
	ldr r4, _080382E0 @ =gCurrentSprite
	ldr r0, _080382E4 @ =0x08348038
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
_080382CA:
	movs r0, #0x3c
_080382CC:
	strb r0, [r1]
	bl EventCheckAfter_BoxDefeated
	cmp r0, #0
	bne _080382EA
	ldrh r0, [r4, #2]
	adds r0, #0xc0
	strh r0, [r4, #2]
	b _080382EA
	.align 2, 0
_080382E0: .4byte gCurrentSprite
_080382E4: .4byte 0x08348038
_080382E8:
	strh r4, [r3]
_080382EA:
	bl EventCheckAfter_BoxDefeated
	cmp r0, #0
	beq _08038300
	ldr r0, _080382FC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1e
	b _08038306
	.align 2, 0
_080382FC: .4byte gCurrentSprite
_08038300:
	ldr r0, _08038310 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
_08038306:
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038310: .4byte gCurrentSprite

	thumb_func_start BoxFallingDebrisFalling
BoxFallingDebrisFalling: @ 0x08038314
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08038334 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	cmp r0, #0
	beq _08038338
	subs r0, #1
	strb r0, [r1]
	b _08038542
	.align 2, 0
_08038334: .4byte gCurrentSprite
_08038338:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r6, [r1]
	ldrh r7, [r4, #2]
	ldrh r0, [r4, #4]
	mov r8, r0
	ldrb r5, [r4, #0x1e]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _08038358
	adds r0, #1
	strb r0, [r1]
_08038358:
	ldrb r0, [r1]
	cmp r0, #0x32
	bls _080383DE
	adds r0, r7, #0
	mov r1, r8
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08038398 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080383DE
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	cmp r5, #0
	bne _0803839C
	movs r1, #0x81
	bl ScreenShakeStartVertical
	mov r1, r8
	subs r1, #0x20
	adds r0, r7, #0
	movs r2, #0x31
	bl ParticleSet
	mov r1, r8
	adds r1, #0x20
	adds r0, r7, #0
	b _080383A8
	.align 2, 0
_08038398: .4byte gPreviousVerticalCollisionCheck
_0803839C:
	cmp r5, #1
	beq _080383A4
	cmp r5, #6
	bne _080383B0
_080383A4:
	adds r0, r7, #0
	mov r1, r8
_080383A8:
	movs r2, #0x31
	bl ParticleSet
	b _08038542
_080383B0:
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080383BE
	cmp r5, #7
	bne _080383D2
_080383BE:
	mov r1, r8
	subs r1, #0x10
	adds r0, r7, #0
	movs r2, #0x27
	bl ParticleSet
	mov r1, r8
	adds r1, #0x10
	adds r0, r7, #0
	b _080383D6
_080383D2:
	adds r0, r7, #0
	mov r1, r8
_080383D6:
	movs r2, #0x27
	bl ParticleSet
	b _08038542
_080383DE:
	cmp r5, #0
	bne _0803845C
	movs r1, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080383F8
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x31
	bl ParticleSet
	b _08038426
_080383F8:
	adds r0, r6, #4
	ands r0, r1
	cmp r0, #0
	bne _08038410
	adds r0, r7, #0
	subs r0, #0xa0
	mov r1, r8
	adds r1, #0x32
	movs r2, #0x2e
	bl ParticleSet
	b _08038426
_08038410:
	adds r0, r6, #0
	adds r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08038426
	mov r1, r8
	subs r1, #0x20
	adds r0, r7, #0
	movs r2, #0x33
	bl ParticleSet
_08038426:
	ldr r3, _08038450 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08038454 @ =sSpritesFallingSpeedFast
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038458 @ =0x00007FFF
	cmp r1, r0
	beq _08038442
	b _08038538
_08038442:
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_08038450: .4byte gCurrentSprite
_08038454: .4byte sSpritesFallingSpeedFast
_08038458: .4byte 0x00007FFF
_0803845C:
	cmp r5, #1
	beq _08038464
	cmp r5, #6
	bne _080384AC
_08038464:
	movs r0, #0x1f
	ands r6, r0
	cmp r6, #0
	bne _08038476
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x27
	bl ParticleSet
_08038476:
	ldr r3, _080384A0 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _080384A4 @ =sSpritesFallingSpeedQuickAcceleration
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _080384A8 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_080384A0: .4byte gCurrentSprite
_080384A4: .4byte sSpritesFallingSpeedQuickAcceleration
_080384A8: .4byte 0x00007FFF
_080384AC:
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080384BA
	cmp r5, #7
	bne _08038504
_080384BA:
	adds r0, r6, #7
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _080384CE
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x33
	bl ParticleSet
_080384CE:
	ldr r3, _080384F8 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _080384FC @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038500 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_080384F8: .4byte gCurrentSprite
_080384FC: .4byte sSpritesFallingSpeed
_08038500: .4byte 0x00007FFF
_08038504:
	ldr r3, _0803852C @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08038530 @ =sSpritesFallingSpeedSlow
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038534 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_0803852C: .4byte gCurrentSprite
_08038530: .4byte sSpritesFallingSpeedSlow
_08038534: .4byte 0x00007FFF
_08038538:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_08038540:
	strh r0, [r3, #2]
_08038542:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Box
Box: @ 0x0803854C
	push {lr}
	ldr r0, _08038564 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4e
	bls _0803855A
	b _0803878A
_0803855A:
	lsls r0, r0, #2
	ldr r1, _08038568 @ =_0803856C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038564: .4byte gCurrentSprite
_08038568: .4byte _0803856C
_0803856C: @ jump table
	.4byte _080386A8 @ case 0
	.4byte _080386AE @ case 1
	.4byte _080386B2 @ case 2
	.4byte _0803878A @ case 3
	.4byte _0803878A @ case 4
	.4byte _0803878A @ case 5
	.4byte _0803878A @ case 6
	.4byte _080386EA @ case 7
	.4byte _080386EE @ case 8
	.4byte _0803878A @ case 9
	.4byte _0803878A @ case 10
	.4byte _0803878A @ case 11
	.4byte _0803878A @ case 12
	.4byte _0803878A @ case 13
	.4byte _0803878A @ case 14
	.4byte _0803878A @ case 15
	.4byte _0803878A @ case 16
	.4byte _0803878A @ case 17
	.4byte _0803878A @ case 18
	.4byte _0803878A @ case 19
	.4byte _0803878A @ case 20
	.4byte _0803878A @ case 21
	.4byte _0803878A @ case 22
	.4byte _080386B8 @ case 23
	.4byte _080386BC @ case 24
	.4byte _080386C2 @ case 25
	.4byte _080386C6 @ case 26
	.4byte _080386CC @ case 27
	.4byte _080386D0 @ case 28
	.4byte _080386D6 @ case 29
	.4byte _080386DA @ case 30
	.4byte _080386E0 @ case 31
	.4byte _080386E4 @ case 32
	.4byte _0803878A @ case 33
	.4byte _0803878A @ case 34
	.4byte _0803878A @ case 35
	.4byte _0803878A @ case 36
	.4byte _0803878A @ case 37
	.4byte _0803878A @ case 38
	.4byte _08038726 @ case 39
	.4byte _0803872A @ case 40
	.4byte _08038730 @ case 41
	.4byte _08038734 @ case 42
	.4byte _0803878A @ case 43
	.4byte _0803873A @ case 44
	.4byte _0803878A @ case 45
	.4byte _08038740 @ case 46
	.4byte _0803878A @ case 47
	.4byte _0803878A @ case 48
	.4byte _0803878A @ case 49
	.4byte _0803878A @ case 50
	.4byte _0803878A @ case 51
	.4byte _0803878A @ case 52
	.4byte _0803878A @ case 53
	.4byte _0803878A @ case 54
	.4byte _080386F4 @ case 55
	.4byte _080386F8 @ case 56
	.4byte _08038708 @ case 57
	.4byte _0803870C @ case 58
	.4byte _08038712 @ case 59
	.4byte _08038716 @ case 60
	.4byte _0803871C @ case 61
	.4byte _08038720 @ case 62
	.4byte _08038746 @ case 63
	.4byte _0803874A @ case 64
	.4byte _08038750 @ case 65
	.4byte _08038754 @ case 66
	.4byte _0803875A @ case 67
	.4byte _0803875E @ case 68
	.4byte _08038764 @ case 69
	.4byte _08038768 @ case 70
	.4byte _0803876E @ case 71
	.4byte _08038772 @ case 72
	.4byte _08038778 @ case 73
	.4byte _0803877C @ case 74
	.4byte _080386FE @ case 75
	.4byte _08038702 @ case 76
	.4byte _08038782 @ case 77
	.4byte _08038786 @ case 78
_080386A8:
	bl BoxInit
	b _0803878A
_080386AE:
	bl BoxCrawlingInit
_080386B2:
	bl BoxCrawling
	b _0803878A
_080386B8:
	bl BoxWaitingToRunInit
_080386BC:
	bl BoxWaitingToRun
	b _0803878A
_080386C2:
	bl BoxSlowRunningInit
_080386C6:
	bl BoxSlowRun
	b _0803878A
_080386CC:
	bl BoxFastRunInit
_080386D0:
	bl BoxFastRun
	b _0803878A
_080386D6:
	bl BoxSkiddingInit
_080386DA:
	bl BoxSkidding
	b _0803878A
_080386E0:
	bl BoxStopSkiddingInit
_080386E4:
	bl BoxStopSkidding
	b _0803878A
_080386EA:
	bl BoxFinishedCrawlingInit
_080386EE:
	bl BoxFinishedCrawling
	b _0803878A
_080386F4:
	bl BoxBonkingInit
_080386F8:
	bl BoxBonking
	b _0803878A
_080386FE:
	bl BoxLandingFromBonkInit
_08038702:
	bl BoxLandingFromBonk
	b _0803878A
_08038708:
	bl BoxLandingInit
_0803870C:
	bl BoxLanding
	b _0803878A
_08038712:
	bl BoxJumpWarningInit
_08038716:
	bl BoxJumpWarning
	b _0803878A
_0803871C:
	bl BoxJumpingInit
_08038720:
	bl BoxJumping
	b _0803878A
_08038726:
	bl BoxStoppingToFireBombInit
_0803872A:
	bl BoxStoppingToFireBomb
	b _0803878A
_08038730:
	bl BoxLoweringToFireBombInit
_08038734:
	bl BoxLoweringToFireBomb
	b _0803878A
_0803873A:
	bl BoxFiringBomb
	b _0803878A
_08038740:
	bl BoxDoneFiringBomb
	b _0803878A
_08038746:
	bl BoxWaitingToEmergeInit
_0803874A:
	bl BoxWaitingToEmerge
	b _0803878A
_08038750:
	bl BoxFirstJumpInit
_08038754:
	bl BoxFirstJump
	b _0803878A
_0803875A:
	bl BoxDefeatedInit
_0803875E:
	bl BoxDefeated
	b _0803878A
_08038764:
	bl BoxMovingToFinalJumpInit
_08038768:
	bl BoxMovingToFinalJump
	b _0803878A
_0803876E:
	bl BoxWaitingForFinalJumpInit
_08038772:
	bl BoxWaitingForFinalJump
	b _0803878A
_08038778:
	bl BoxCrouchingForFinalJumpInit
_0803877C:
	bl BoxCrouchingForFinalJump
	b _0803878A
_08038782:
	bl BoxFinalJumpInit
_08038786:
	bl BoxFinalJump
_0803878A:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxPart
BoxPart: @ 0x08038798
	push {r4, lr}
	ldr r0, _080387B0 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080387B4
	bl BoxPartInit
	b _0803887C
	.align 2, 0
_080387B0: .4byte gCurrentSprite
_080387B4:
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	beq _080387F4
	cmp r0, #2
	bgt _080387C4
	cmp r0, #0
	beq _080387CE
	b _0803885C
_080387C4:
	cmp r0, #6
	beq _0803881C
	cmp r0, #8
	beq _08038834
	b _0803885C
_080387CE:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _080387F0 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _080387E6
	strb r3, [r4]
_080387E6:
	bl BoxPartFrontLeftLeg
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_080387F0: .4byte gSubSpriteData1
_080387F4:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038818 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _0803880C
	strb r3, [r4]
_0803880C:
	bl BoxPartFrontRightLeg
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038818: .4byte gSubSpriteData1
_0803881C:
	ldr r0, _08038830 @ =gSubSpriteData1
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	strb r1, [r0, #0xe]
	bl BoxPartCenter
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038830: .4byte gSubSpriteData1
_08038834:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038858 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _0803884C
	strb r3, [r4]
_0803884C:
	bl BoxPartCenterBottom
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038858: .4byte gSubSpriteData1
_0803885C:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038884 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _08038874
	strb r3, [r4]
_08038874:
	bl BoxPartDefault
	bl BoxSyncSubSprites
_0803887C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038884: .4byte gSubSpriteData1

	thumb_func_start BoxMissile
BoxMissile: @ 0x08038888
	push {lr}
	ldr r0, _080388A0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080388B4
	cmp r0, #2
	bgt _080388A4
	cmp r0, #0
	beq _080388AE
	b _080388C4
	.align 2, 0
_080388A0: .4byte gCurrentSprite
_080388A4:
	cmp r0, #0x18
	beq _080388BA
	cmp r0, #0x37
	beq _080388C0
	b _080388C4
_080388AE:
	bl BoxMissileInit
	b _080388C4
_080388B4:
	bl BoxMissileSpawning
	b _080388C4
_080388BA:
	bl BoxMissileMoving
	b _080388C4
_080388C0:
	bl BoxMissileExploding
_080388C4:
	pop {r0}
	bx r0

	thumb_func_start BoxBomb
BoxBomb: @ 0x080388C8
	push {lr}
	ldr r0, _080388E0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080388F4
	cmp r0, #2
	bgt _080388E4
	cmp r0, #0
	beq _080388EE
	b _08038904
	.align 2, 0
_080388E0: .4byte gCurrentSprite
_080388E4:
	cmp r0, #0x18
	beq _080388FA
	cmp r0, #0x37
	beq _08038900
	b _08038904
_080388EE:
	bl BoxBombInit
	b _08038904
_080388F4:
	bl BoxBombMoving
	b _08038904
_080388FA:
	bl BoxBombLanded
	b _08038904
_08038900:
	bl BoxBombExploding
_08038904:
	pop {r0}
	bx r0

	thumb_func_start BoxFire
BoxFire: @ 0x08038908
	push {lr}
	ldr r0, _08038920 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803892E
	cmp r0, #2
	bgt _08038924
	cmp r0, #0
	beq _0803892A
	b _08038938
	.align 2, 0
_08038920: .4byte gCurrentSprite
_08038924:
	cmp r0, #0x18
	beq _08038934
	b _08038938
_0803892A:
	bl BoxFireInit
_0803892E:
	bl BoxFireMovingHigh
	b _08038938
_08038934:
	bl BoxFireMovingLow
_08038938:
	pop {r0}
	bx r0

	thumb_func_start BoxDebris
BoxDebris: @ 0x0803893C
	push {lr}
	ldr r0, _08038954 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _080389EC
	lsls r0, r0, #2
	ldr r1, _08038958 @ =_0803895C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038954: .4byte gCurrentSprite
_08038958: .4byte _0803895C
_0803895C: @ jump table
	.4byte _080389D0 @ case 0
	.4byte _080389EC @ case 1
	.4byte _080389D6 @ case 2
	.4byte _080389EC @ case 3
	.4byte _080389EC @ case 4
	.4byte _080389EC @ case 5
	.4byte _080389EC @ case 6
	.4byte _080389EC @ case 7
	.4byte _080389EC @ case 8
	.4byte _080389EC @ case 9
	.4byte _080389EC @ case 10
	.4byte _080389EC @ case 11
	.4byte _080389EC @ case 12
	.4byte _080389EC @ case 13
	.4byte _080389EC @ case 14
	.4byte _080389EC @ case 15
	.4byte _080389EC @ case 16
	.4byte _080389EC @ case 17
	.4byte _080389EC @ case 18
	.4byte _080389EC @ case 19
	.4byte _080389EC @ case 20
	.4byte _080389EC @ case 21
	.4byte _080389EC @ case 22
	.4byte _080389EC @ case 23
	.4byte _080389DC @ case 24
	.4byte _080389EC @ case 25
	.4byte _080389E2 @ case 26
	.4byte _080389EC @ case 27
	.4byte _080389E8 @ case 28
_080389D0:
	bl BoxDebrisInit
	b _080389EC
_080389D6:
	bl BoxDebrisIdle
	b _080389EC
_080389DC:
	bl BoxDebrisFallingInit
	b _080389EC
_080389E2:
	bl BoxDebrisWaitToFall
	b _080389EC
_080389E8:
	bl BoxDebrisFalling
_080389EC:
	pop {r0}
	bx r0

	thumb_func_start BoxFallingDebris
BoxFallingDebris: @ 0x080389F0
	push {lr}
	ldr r0, _08038A04 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08038A08
	cmp r0, #2
	beq _08038A0E
	b _08038A12
	.align 2, 0
_08038A04: .4byte gCurrentSprite
_08038A08:
	bl BoxFallingDebrisInit
	b _08038A12
_08038A0E:
	bl BoxFallingDebrisFalling
_08038A12:
	pop {r0}
	bx r0
	.align 2, 0
