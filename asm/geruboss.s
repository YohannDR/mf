    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start GerubossYMovement
GerubossYMovement: @ 0x0803EE3C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	ldr r4, _0803EE80 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803EE88
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803EE84 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EEAE
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EEAE
	ldrh r0, [r4, #2]
	adds r0, r6, r0
	b _0803EEBC
	.align 2, 0
_0803EE80: .4byte gCurrentSprite
_0803EE84: .4byte gPreviousCollisionCheck
_0803EE88:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803EEB4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EEAE
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803EEB8
_0803EEAE:
	movs r0, #1
	b _0803EEC0
	.align 2, 0
_0803EEB4: .4byte gPreviousCollisionCheck
_0803EEB8:
	ldrh r0, [r4, #2]
	subs r0, r0, r7
_0803EEBC:
	strh r0, [r4, #2]
	movs r0, #0
_0803EEC0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GerubossXMovement
GerubossXMovement: @ 0x0803EEC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	ldr r4, _0803EF0C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803EF14
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803EF10 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EF3A
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EF3A
	ldrh r0, [r4, #4]
	adds r0, r6, r0
	b _0803EF48
	.align 2, 0
_0803EF0C: .4byte gCurrentSprite
_0803EF10: .4byte gPreviousCollisionCheck
_0803EF14:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803EF40 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803EF3A
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803EF44
_0803EF3A:
	movs r0, #1
	b _0803EF4C
	.align 2, 0
_0803EF40: .4byte gPreviousCollisionCheck
_0803EF44:
	ldrh r0, [r4, #4]
	subs r0, r0, r7
_0803EF48:
	strh r0, [r4, #4]
	movs r0, #0
_0803EF4C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GerubossTurningIntoX
GerubossTurningIntoX: @ 0x0803EF54
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0803EF94 @ =gCurrentSprite
	ldrb r1, [r4, #0x1d]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #8
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x24
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r4, #2]
	adds r0, #8
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x24
	strh r0, [r4, #4]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803EF94: .4byte gCurrentSprite

	thumb_func_start GerubossInit
GerubossInit: @ 0x0803EF98
	push {lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803EFC4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803EFC8
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803EFC8
	strh r0, [r2]
	b _0803F05A
	.align 2, 0
_0803EFC4: .4byte gCurrentSprite
_0803EFC8:
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r3, _0803F038 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x27
	movs r2, #0
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0803F03C @ =0x0000FFE0
	strh r0, [r3, #0xa]
	movs r0, #0x30
	strh r0, [r3, #0xc]
	ldr r0, _0803F040 @ =0x0000FFC8
	strh r0, [r3, #0xe]
	movs r0, #0x38
	strh r0, [r3, #0x10]
	ldr r0, _0803F044 @ =sGerubossOam_358e14
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0803F048 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r2, _0803F04C @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803F050
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r3, #6]
	b _0803F05A
	.align 2, 0
_0803F038: .4byte gCurrentSprite
_0803F03C: .4byte 0x0000FFE0
_0803F040: .4byte 0x0000FFC8
_0803F044: .4byte sGerubossOam_358e14
_0803F048: .4byte gIoRegisters
_0803F04C: .4byte sPrimarySpriteStats
_0803F050:
	ldrh r0, [r3, #2]
	subs r0, #0x20
	strh r0, [r3, #2]
	movs r0, #1
	strb r0, [r1]
_0803F05A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GerubossIdleInit
GerubossIdleInit: @ 0x0803F060
	ldr r0, _0803F07C @ =gCurrentSprite
	adds r3, r0, #0
	adds r3, #0x24
	movs r2, #0
	movs r1, #2
	strb r1, [r3]
	strb r2, [r0, #0x1c]
	strh r2, [r0, #0x16]
	ldr r1, _0803F080 @ =sGerubossOam_358e14
	str r1, [r0, #0x18]
	adds r0, #0x2e
	movs r1, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803F07C: .4byte gCurrentSprite
_0803F080: .4byte sGerubossOam_358e14

	thumb_func_start GerubossIdle
GerubossIdle: @ 0x0803F084
	push {r4, r5, lr}
	ldr r4, _0803F0C0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803F154
	ldrh r0, [r4, #2]
	subs r0, #0x24
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803F0C4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F0C8
	ldrh r0, [r4, #2]
	subs r0, #0x24
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F0C8
	bl SpriteUtilMakeSpriteFaceSamusDirection
	b _0803F14C
	.align 2, 0
_0803F0C0: .4byte gCurrentSprite
_0803F0C4: .4byte gPreviousCollisionCheck
_0803F0C8:
	ldr r4, _0803F0FC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0803F104
	adds r2, r4, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #8
	strb r0, [r2]
	strb r1, [r4, #0x1c]
	strh r1, [r4, #0x16]
	ldr r0, _0803F100 @ =sGerubossOam_358df4
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0xd0
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0803F154
	.align 2, 0
_0803F0FC: .4byte gCurrentSprite
_0803F100: .4byte sGerubossOam_358df4
_0803F104:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F112
	subs r0, #1
	b _0803F152
_0803F112:
	ldr r0, _0803F13C @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x48
	ldrh r1, [r4, #2]
	cmp r0, r1
	blt _0803F154
	movs r5, #0x80
	lsls r5, r5, #2
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _0803F140
	ldrh r1, [r4]
	adds r0, r5, #0
	orrs r0, r1
	b _0803F14A
	.align 2, 0
_0803F13C: .4byte gSamusData
_0803F140:
	cmp r0, #4
	bne _0803F154
	ldrh r1, [r4]
	ldr r0, _0803F15C @ =0x0000FDFF
	ands r0, r1
_0803F14A:
	strh r0, [r4]
_0803F14C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
_0803F152:
	strb r0, [r1]
_0803F154:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F15C: .4byte 0x0000FDFF

	thumb_func_start GerubossStalling
GerubossStalling: @ 0x0803F160
	push {lr}
	ldr r1, _0803F180 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F17A
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0803F17A:
	pop {r0}
	bx r0
	.align 2, 0
_0803F180: .4byte gCurrentSprite

	thumb_func_start GerubossLaunchingInit
GerubossLaunchingInit: @ 0x0803F184
	push {lr}
	ldr r1, _0803F1A4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F1A8 @ =sGerubossOam_358e3c
	str r0, [r1, #0x18]
	ldr r0, _0803F1AC @ =0x0000019D
	bl SoundPlayNotAlreadyPlaying
	pop {r0}
	bx r0
	.align 2, 0
_0803F1A4: .4byte gCurrentSprite
_0803F1A8: .4byte sGerubossOam_358e3c
_0803F1AC: .4byte 0x0000019D

	thumb_func_start GerubossCharging
GerubossCharging: @ 0x0803F1B0
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803F1E8
	ldr r1, _0803F1EC @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2c
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F1F0 @ =sGerubossOam_358e6c
	str r0, [r1, #0x18]
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r1, #0x2e
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0xcf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803F1E8:
	pop {r0}
	bx r0
	.align 2, 0
_0803F1EC: .4byte gCurrentSprite
_0803F1F0: .4byte sGerubossOam_358e6c

	thumb_func_start GerubossGoingDown
GerubossGoingDown: @ 0x0803F1F4
	push {r4, lr}
	ldr r2, _0803F220 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F228
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0803F242
	strb r1, [r2, #0x1c]
	movs r0, #0
	strh r1, [r2, #0x16]
	ldr r1, _0803F224 @ =sGerubossOam_358e8c
	str r1, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	b _0803F242
	.align 2, 0
_0803F220: .4byte gCurrentSprite
_0803F224: .4byte sGerubossOam_358e8c
_0803F228:
	adds r4, r2, #0
	adds r4, #0x2f
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803F23C
	ldr r0, _0803F270 @ =0x0000019F
	bl SoundPlay
_0803F23C:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0803F242:
	movs r0, #2
	bl GerubossXMovement
	movs r0, #0xc
	bl GerubossYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F268
	ldr r1, _0803F274 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2e
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F278 @ =sGerubossOam_358eec
	str r0, [r1, #0x18]
_0803F268:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F270: .4byte 0x0000019F
_0803F274: .4byte gCurrentSprite
_0803F278: .4byte sGerubossOam_358eec

	thumb_func_start GerubossChangingDirection
GerubossChangingDirection: @ 0x0803F27C
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803F2B0
	ldr r1, _0803F2B4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x30
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F2B8 @ =sGerubossOam_358eac
	str r0, [r1, #0x18]
	ldrh r2, [r1]
	ldr r0, _0803F2BC @ =0x0000F7FF
	ands r0, r2
	strh r0, [r1]
	adds r1, #0x2e
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0xcf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803F2B0:
	pop {r0}
	bx r0
	.align 2, 0
_0803F2B4: .4byte gCurrentSprite
_0803F2B8: .4byte sGerubossOam_358eac
_0803F2BC: .4byte 0x0000F7FF

	thumb_func_start GerubossGoingUp
GerubossGoingUp: @ 0x0803F2C0
	push {r4, lr}
	ldr r2, _0803F2EC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F2F4
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0803F30E
	strb r1, [r2, #0x1c]
	movs r0, #0
	strh r1, [r2, #0x16]
	ldr r1, _0803F2F0 @ =sGerubossOam_358ecc
	str r1, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	b _0803F30E
	.align 2, 0
_0803F2EC: .4byte gCurrentSprite
_0803F2F0: .4byte sGerubossOam_358ecc
_0803F2F4:
	adds r4, r2, #0
	adds r4, #0x2f
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803F308
	ldr r0, _0803F33C @ =0x0000019F
	bl SoundPlay
_0803F308:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0803F30E:
	movs r0, #2
	bl GerubossXMovement
	movs r0, #0xc
	bl GerubossYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F334
	ldr r1, _0803F340 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x32
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F344 @ =sGerubossOam_358f3c
	str r0, [r1, #0x18]
_0803F334:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F33C: .4byte 0x0000019F
_0803F340: .4byte gCurrentSprite
_0803F344: .4byte sGerubossOam_358f3c

	thumb_func_start GerubossGrabbingCeiling
GerubossGrabbingCeiling: @ 0x0803F348
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803F35A
	ldr r0, _0803F360 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0803F35A:
	pop {r0}
	bx r0
	.align 2, 0
_0803F360: .4byte gCurrentSprite

	thumb_func_start Geruboss
Geruboss: @ 0x0803F364
	push {r4, lr}
	ldr r4, _0803F38C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803F37C
	ldr r0, _0803F390 @ =0x000001A1
	bl SoundPlayNotAlreadyPlaying
_0803F37C:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F394
	bl SpriteUtilUpdateFreezeTimer
	b _0803F574
	.align 2, 0
_0803F38C: .4byte gCurrentSprite
_0803F390: .4byte 0x000001A1
_0803F394:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803F3A0
	b _0803F574
_0803F3A0:
	lsls r0, r0, #2
	ldr r1, _0803F3AC @ =_0803F3B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803F3AC: .4byte _0803F3B0
_0803F3B0: @ jump table
	.4byte _0803F520 @ case 0
	.4byte _0803F526 @ case 1
	.4byte _0803F52A @ case 2
	.4byte _0803F574 @ case 3
	.4byte _0803F574 @ case 4
	.4byte _0803F574 @ case 5
	.4byte _0803F574 @ case 6
	.4byte _0803F574 @ case 7
	.4byte _0803F530 @ case 8
	.4byte _0803F574 @ case 9
	.4byte _0803F574 @ case 10
	.4byte _0803F574 @ case 11
	.4byte _0803F574 @ case 12
	.4byte _0803F574 @ case 13
	.4byte _0803F574 @ case 14
	.4byte _0803F574 @ case 15
	.4byte _0803F574 @ case 16
	.4byte _0803F574 @ case 17
	.4byte _0803F574 @ case 18
	.4byte _0803F574 @ case 19
	.4byte _0803F574 @ case 20
	.4byte _0803F574 @ case 21
	.4byte _0803F574 @ case 22
	.4byte _0803F574 @ case 23
	.4byte _0803F574 @ case 24
	.4byte _0803F574 @ case 25
	.4byte _0803F574 @ case 26
	.4byte _0803F574 @ case 27
	.4byte _0803F574 @ case 28
	.4byte _0803F574 @ case 29
	.4byte _0803F574 @ case 30
	.4byte _0803F574 @ case 31
	.4byte _0803F574 @ case 32
	.4byte _0803F574 @ case 33
	.4byte _0803F574 @ case 34
	.4byte _0803F574 @ case 35
	.4byte _0803F574 @ case 36
	.4byte _0803F574 @ case 37
	.4byte _0803F574 @ case 38
	.4byte _0803F574 @ case 39
	.4byte _0803F574 @ case 40
	.4byte _0803F536 @ case 41
	.4byte _0803F53A @ case 42
	.4byte _0803F574 @ case 43
	.4byte _0803F540 @ case 44
	.4byte _0803F574 @ case 45
	.4byte _0803F546 @ case 46
	.4byte _0803F574 @ case 47
	.4byte _0803F54C @ case 48
	.4byte _0803F574 @ case 49
	.4byte _0803F552 @ case 50
	.4byte _0803F574 @ case 51
	.4byte _0803F574 @ case 52
	.4byte _0803F574 @ case 53
	.4byte _0803F574 @ case 54
	.4byte _0803F574 @ case 55
	.4byte _0803F574 @ case 56
	.4byte _0803F574 @ case 57
	.4byte _0803F574 @ case 58
	.4byte _0803F574 @ case 59
	.4byte _0803F574 @ case 60
	.4byte _0803F574 @ case 61
	.4byte _0803F574 @ case 62
	.4byte _0803F574 @ case 63
	.4byte _0803F574 @ case 64
	.4byte _0803F574 @ case 65
	.4byte _0803F574 @ case 66
	.4byte _0803F574 @ case 67
	.4byte _0803F574 @ case 68
	.4byte _0803F574 @ case 69
	.4byte _0803F574 @ case 70
	.4byte _0803F574 @ case 71
	.4byte _0803F574 @ case 72
	.4byte _0803F574 @ case 73
	.4byte _0803F574 @ case 74
	.4byte _0803F574 @ case 75
	.4byte _0803F574 @ case 76
	.4byte _0803F574 @ case 77
	.4byte _0803F574 @ case 78
	.4byte _0803F574 @ case 79
	.4byte _0803F574 @ case 80
	.4byte _0803F574 @ case 81
	.4byte _0803F574 @ case 82
	.4byte _0803F574 @ case 83
	.4byte _0803F574 @ case 84
	.4byte _0803F574 @ case 85
	.4byte _0803F574 @ case 86
	.4byte _0803F558 @ case 87
	.4byte _0803F55C @ case 88
	.4byte _0803F562 @ case 89
	.4byte _0803F566 @ case 90
	.4byte _0803F56C @ case 91
_0803F520:
	bl GerubossInit
	b _0803F574
_0803F526:
	bl GerubossIdleInit
_0803F52A:
	bl GerubossIdle
	b _0803F574
_0803F530:
	bl GerubossStalling
	b _0803F574
_0803F536:
	bl GerubossLaunchingInit
_0803F53A:
	bl GerubossCharging
	b _0803F574
_0803F540:
	bl GerubossGoingDown
	b _0803F574
_0803F546:
	bl GerubossChangingDirection
	b _0803F574
_0803F54C:
	bl GerubossGoingUp
	b _0803F574
_0803F552:
	bl GerubossGrabbingCeiling
	b _0803F574
_0803F558:
	bl SpriteDyingInit
_0803F55C:
	bl SpriteDying
	b _0803F574
_0803F562:
	bl GerubossInit
_0803F566:
	bl SpriteSpawningFromX
	b _0803F574
_0803F56C:
	bl GerubossTurningIntoX
	bl XParasiteInit
_0803F574:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
