    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ZebesianAquaXMovement
ZebesianAquaXMovement: @ 0x0804C744
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _0804C768 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0804C790
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804C76C
	ldrh r0, [r4, #4]
	adds r0, #0x38
	b _0804C770
	.align 2, 0
_0804C768: .4byte gCurrentSprite
_0804C76C:
	ldrh r0, [r4, #4]
	adds r0, #0x28
_0804C770:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804C78C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0804C7B8
	ldrh r0, [r4, #4]
	adds r0, r5, r0
	b _0804C7C4
	.align 2, 0
_0804C78C: .4byte gPreviousCollisionCheck
_0804C790:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804C7A0
	ldrh r0, [r4, #4]
	subs r0, #0x38
	b _0804C7A4
_0804C7A0:
	ldrh r0, [r4, #4]
	subs r0, #0x28
_0804C7A4:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804C7BC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0804C7C0
_0804C7B8:
	movs r0, #1
	b _0804C7C8
	.align 2, 0
_0804C7BC: .4byte gPreviousCollisionCheck
_0804C7C0:
	ldrh r0, [r4, #4]
	subs r0, r0, r5
_0804C7C4:
	strh r0, [r4, #4]
	movs r0, #0
_0804C7C8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ZebesianAquaTurningIntoX
ZebesianAquaTurningIntoX: @ 0x0804C7D0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0804C80C @ =gCurrentSprite
	ldrb r1, [r4, #0x1d]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C80C: .4byte gCurrentSprite

	thumb_func_start ZebesianAquaInit
ZebesianAquaInit: @ 0x0804C810
	push {lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804C83C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804C840
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804C840
	strh r0, [r2]
	b _0804C8B0
	.align 2, 0
_0804C83C: .4byte gCurrentSprite
_0804C840:
	ldr r3, _0804C89C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x25
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	ldr r0, _0804C8A0 @ =sZebesianAquaOam_381764
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _0804C8A4 @ =0x0000FF90
	strh r0, [r3, #0xa]
	adds r0, #0x68
	strh r0, [r3, #0xc]
	subs r0, #0x38
	strh r0, [r3, #0xe]
	movs r0, #0x40
	strh r0, [r3, #0x10]
	ldr r2, _0804C8A8 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804C8AC
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r3, #6]
	b _0804C8B0
	.align 2, 0
_0804C89C: .4byte gCurrentSprite
_0804C8A0: .4byte sZebesianAquaOam_381764
_0804C8A4: .4byte 0x0000FF90
_0804C8A8: .4byte sPrimarySpriteStats
_0804C8AC:
	movs r0, #1
	strb r0, [r1]
_0804C8B0:
	pop {r0}
	bx r0

	thumb_func_start ZebesianAquaIdleInit
ZebesianAquaIdleInit: @ 0x0804C8B4
	push {r4, lr}
	ldr r1, _0804C8D8 @ =gCurrentSprite
	ldrh r0, [r1, #4]
	movs r3, #0
	movs r4, #0
	strh r0, [r1, #8]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #2
	strb r0, [r2]
	strb r3, [r1, #0x1c]
	strh r4, [r1, #0x16]
	ldr r0, _0804C8DC @ =sZebesianAquaOam_381764
	str r0, [r1, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C8D8: .4byte gCurrentSprite
_0804C8DC: .4byte sZebesianAquaOam_381764

	thumb_func_start ZebesianAquaIdle
ZebesianAquaIdle: @ 0x0804C8E0
	push {r4, r5, lr}
	movs r0, #6
	bl ZebesianAquaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804C900
	ldr r2, _0804C8FC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	adds r5, r2, #0
	b _0804C938
	.align 2, 0
_0804C8FC: .4byte gCurrentSprite
_0804C900:
	ldr r2, _0804C920 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _0804C924
	ldrh r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r5, #4]
	cmp r0, r1
	bge _0804C938
	b _0804C930
	.align 2, 0
_0804C920: .4byte gCurrentSprite
_0804C924:
	ldrh r0, [r5, #8]
	ldr r1, _0804C98C @ =0xFFFFFE00
	adds r0, r0, r1
	ldrh r1, [r5, #4]
	cmp r0, r1
	ble _0804C938
_0804C930:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0804C938:
	ldr r0, _0804C990 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0804C9BE
	ldr r2, _0804C994 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r4, r5, #0
	ldrh r0, [r4, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r2
	ble _0804C9A0
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804C998 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C9BE
	ldr r0, _0804C99C @ =gCurrentAffectingClipdata
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _0804C9BE
	ldrh r0, [r4, #2]
	subs r0, #2
	strh r0, [r4, #2]
	b _0804C9BE
	.align 2, 0
_0804C98C: .4byte 0xFFFFFE00
_0804C990: .4byte gEquipment
_0804C994: .4byte gSamusData
_0804C998: .4byte gPreviousCollisionCheck
_0804C99C: .4byte gCurrentAffectingClipdata
_0804C9A0:
	adds r0, r1, #0
	adds r0, #0x40
	cmp r0, r2
	bge _0804C9BE
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CA04 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C9BE
	ldrh r0, [r5, #2]
	adds r0, #2
	strh r0, [r5, #2]
_0804C9BE:
	ldr r0, _0804CA08 @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804CA5C
	movs r0, #0xa0
	movs r1, #0xc8
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	bne _0804CA5C
	movs r1, #0xc8
	lsls r1, r1, #1
	movs r0, #0xa0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r1, r0, #0
	ldr r3, _0804CA0C @ =gCurrentSprite
	ldrh r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0804CA22
	cmp r1, #8
	bne _0804CA1C
	ldr r0, _0804CA10 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804CA14
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0804CA5A
	.align 2, 0
_0804CA04: .4byte gPreviousCollisionCheck
_0804CA08: .4byte 0x03001346
_0804CA0C: .4byte gCurrentSprite
_0804CA10: .4byte gEquipment
_0804CA14:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2b
	b _0804CA5A
_0804CA1C:
	cmp r1, #4
	bne _0804CA5C
	b _0804CA4C
_0804CA22:
	cmp r1, #4
	bne _0804CA48
	ldr r0, _0804CA3C @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804CA40
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0804CA5A
	.align 2, 0
_0804CA3C: .4byte gEquipment
_0804CA40:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2b
	b _0804CA5A
_0804CA48:
	cmp r1, #8
	bne _0804CA5C
_0804CA4C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0804CA5C
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #3
_0804CA5A:
	strb r0, [r1]
_0804CA5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianAquaLungeInit
ZebesianAquaLungeInit: @ 0x0804CA64
	ldr r1, _0804CA78 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x2c
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804CA78: .4byte gCurrentSprite

	thumb_func_start ZebesianAquaLunge
ZebesianAquaLunge: @ 0x0804CA7C
	push {r4, r5, lr}
	ldr r4, _0804CAF8 @ =gCurrentSprite
	ldrb r0, [r4, #0x1c]
	adds r0, #4
	strb r0, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804CAA0
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804CB14
	ldr r0, _0804CAFC @ =0x000001BD
	bl SoundPlayNotAlreadyPlaying
_0804CAA0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CB00 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CAB6
	ldrh r0, [r4, #2]
	adds r0, #2
	strh r0, [r4, #2]
_0804CAB6:
	movs r0, #0x10
	bl ZebesianAquaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804CB0C
	ldr r0, _0804CB04 @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804CB14
	movs r5, #0xa0
	lsls r5, r5, #1
	movs r1, #0xe1
	lsls r1, r1, #1
	adds r0, r5, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	bne _0804CB14
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804CB08
	cmp r2, #4
	bne _0804CB14
	b _0804CB0C
	.align 2, 0
_0804CAF8: .4byte gCurrentSprite
_0804CAFC: .4byte 0x000001BD
_0804CB00: .4byte gPreviousCollisionCheck
_0804CB04: .4byte 0x03001346
_0804CB08:
	cmp r2, #8
	bne _0804CB14
_0804CB0C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0804CB14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianAquaShootingInit
ZebesianAquaShootingInit: @ 0x0804CB1C
	ldr r1, _0804CB34 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804CB38 @ =sZebesianAquaOam_3817c4
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804CB34: .4byte gCurrentSprite
_0804CB38: .4byte sZebesianAquaOam_3817c4

	thumb_func_start ZebesianAquaShooting
ZebesianAquaShooting: @ 0x0804CB3C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r2, _0804CB88 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _0804CB8C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r2
	ble _0804CB98
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CB90 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CBB6
	ldr r0, _0804CB94 @ =gCurrentAffectingClipdata
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _0804CBB6
	ldrh r0, [r4, #2]
	subs r0, #1
	b _0804CBB4
	.align 2, 0
_0804CB88: .4byte gSamusData
_0804CB8C: .4byte gCurrentSprite
_0804CB90: .4byte gPreviousCollisionCheck
_0804CB94: .4byte gCurrentAffectingClipdata
_0804CB98:
	adds r0, r1, #0
	adds r0, #0x20
	cmp r0, r2
	bge _0804CBB6
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CBD0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CBB6
	ldrh r0, [r4, #2]
	adds r0, #1
_0804CBB4:
	strh r0, [r4, #2]
_0804CBB6:
	movs r0, #8
	bl ZebesianAquaXMovement
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804CBD8
	ldr r0, _0804CBD4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	b _0804CC6C
	.align 2, 0
_0804CBD0: .4byte gPreviousCollisionCheck
_0804CBD4: .4byte gCurrentSprite
_0804CBD8:
	ldr r4, _0804CC30 @ =gCurrentSprite
	ldrh r0, [r4, #0x16]
	cmp r0, #7
	bne _0804CC6C
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _0804CC6C
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0804CC34
	ldrb r2, [r4, #0x1f]
	adds r5, r4, #0
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x70
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x66
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x2c
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x66
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0804CC6C
	.align 2, 0
_0804CC30: .4byte gCurrentSprite
_0804CC34:
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x70
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x66
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x2c
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x66
	movs r1, #1
	bl SpriteSpawnSecondary
_0804CC6C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ZebesianAquaTurningAroundInit
ZebesianAquaTurningAroundInit: @ 0x0804CC74
	ldr r1, _0804CC8C @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804CC90 @ =sZebesianAquaOam_38179c
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804CC8C: .4byte gCurrentSprite
_0804CC90: .4byte sZebesianAquaOam_38179c

	thumb_func_start ZebesianAquaTurningAround
ZebesianAquaTurningAround: @ 0x0804CC94
	push {r4, lr}
	ldr r0, _0804CCE0 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0804CD18
	ldr r2, _0804CCE4 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _0804CCE8 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r2
	ble _0804CCF0
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CCEC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CD18
	ldrh r0, [r4, #2]
	adds r0, #2
	b _0804CD16
	.align 2, 0
_0804CCE0: .4byte gEquipment
_0804CCE4: .4byte gSamusData
_0804CCE8: .4byte gCurrentSprite
_0804CCEC: .4byte gPreviousCollisionCheck
_0804CCF0:
	adds r0, r1, #0
	adds r0, #0x20
	cmp r0, r2
	bge _0804CD18
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CD44 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CD18
	ldr r0, _0804CD48 @ =gCurrentAffectingClipdata
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _0804CD18
	ldrh r0, [r4, #2]
	subs r0, #2
_0804CD16:
	strh r0, [r4, #2]
_0804CD18:
	ldr r2, _0804CD4C @ =gCurrentSprite
	ldrh r0, [r2, #0x16]
	cmp r0, #1
	bne _0804CD2E
	ldrb r0, [r2, #0x1c]
	cmp r0, #4
	bne _0804CD2E
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_0804CD2E:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804CD3E
	ldr r0, _0804CD4C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0804CD3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD44: .4byte gPreviousCollisionCheck
_0804CD48: .4byte gCurrentAffectingClipdata
_0804CD4C: .4byte gCurrentSprite

	thumb_func_start ZebesianAquaProjectileInit
ZebesianAquaProjectileInit: @ 0x0804CD50
	push {r4, r5, lr}
	ldr r0, _0804CDC4 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r3, _0804CDC8 @ =0x0000FFFB
	ands r3, r0
	movs r5, #0
	movs r4, #0
	mov r1, ip
	strh r3, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0804CDCC @ =0x0000FFF4
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r0, #0xc
	strh r0, [r1, #0xc]
	ldr r0, _0804CDD0 @ =sZebesianAquaOam_38182c
	str r0, [r1, #0x18]
	strb r5, [r1, #0x1c]
	strh r4, [r1, #0x16]
	mov r0, ip
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	subs r1, #1
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x40
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, ip
	cmp r2, #0
	beq _0804CDD4
	strh r4, [r1, #0xe]
	movs r0, #0x18
	strh r0, [r1, #0x10]
	b _0804CDDA
	.align 2, 0
_0804CDC4: .4byte gCurrentSprite
_0804CDC8: .4byte 0x0000FFFB
_0804CDCC: .4byte 0x0000FFF4
_0804CDD0: .4byte sZebesianAquaOam_38182c
_0804CDD4:
	ldr r0, _0804CDF0 @ =0x0000FFE8
	strh r0, [r1, #0xe]
	strh r2, [r1, #0x10]
_0804CDDA:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	bne _0804CDE8
	movs r0, #0xde
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804CDE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804CDF0: .4byte 0x0000FFE8

	thumb_func_start ZebesianAqua
ZebesianAqua: @ 0x0804CDF4
	push {r4, lr}
	ldr r4, _0804CE20 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804CE0E
	movs r0, #0xaf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804CE0E:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804CE24
	bl SpriteUtilUpdateFreezeTimer
	b _0804CFFC
	.align 2, 0
_0804CE20: .4byte gCurrentSprite
_0804CE24:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804CE30
	b _0804CFFC
_0804CE30:
	lsls r0, r0, #2
	ldr r1, _0804CE3C @ =_0804CE40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804CE3C: .4byte _0804CE40
_0804CE40: @ jump table
	.4byte _0804CFB0 @ case 0
	.4byte _0804CFB6 @ case 1
	.4byte _0804CFBC @ case 2
	.4byte _0804CFC2 @ case 3
	.4byte _0804CFC6 @ case 4
	.4byte _0804CFFC @ case 5
	.4byte _0804CFFC @ case 6
	.4byte _0804CFFC @ case 7
	.4byte _0804CFFC @ case 8
	.4byte _0804CFFC @ case 9
	.4byte _0804CFFC @ case 10
	.4byte _0804CFFC @ case 11
	.4byte _0804CFFC @ case 12
	.4byte _0804CFFC @ case 13
	.4byte _0804CFFC @ case 14
	.4byte _0804CFFC @ case 15
	.4byte _0804CFFC @ case 16
	.4byte _0804CFFC @ case 17
	.4byte _0804CFFC @ case 18
	.4byte _0804CFFC @ case 19
	.4byte _0804CFFC @ case 20
	.4byte _0804CFFC @ case 21
	.4byte _0804CFFC @ case 22
	.4byte _0804CFFC @ case 23
	.4byte _0804CFFC @ case 24
	.4byte _0804CFFC @ case 25
	.4byte _0804CFFC @ case 26
	.4byte _0804CFFC @ case 27
	.4byte _0804CFFC @ case 28
	.4byte _0804CFFC @ case 29
	.4byte _0804CFFC @ case 30
	.4byte _0804CFFC @ case 31
	.4byte _0804CFFC @ case 32
	.4byte _0804CFFC @ case 33
	.4byte _0804CFFC @ case 34
	.4byte _0804CFFC @ case 35
	.4byte _0804CFFC @ case 36
	.4byte _0804CFFC @ case 37
	.4byte _0804CFFC @ case 38
	.4byte _0804CFFC @ case 39
	.4byte _0804CFFC @ case 40
	.4byte _0804CFCC @ case 41
	.4byte _0804CFD0 @ case 42
	.4byte _0804CFD6 @ case 43
	.4byte _0804CFDA @ case 44
	.4byte _0804CFFC @ case 45
	.4byte _0804CFFC @ case 46
	.4byte _0804CFFC @ case 47
	.4byte _0804CFFC @ case 48
	.4byte _0804CFFC @ case 49
	.4byte _0804CFFC @ case 50
	.4byte _0804CFFC @ case 51
	.4byte _0804CFFC @ case 52
	.4byte _0804CFFC @ case 53
	.4byte _0804CFFC @ case 54
	.4byte _0804CFFC @ case 55
	.4byte _0804CFFC @ case 56
	.4byte _0804CFFC @ case 57
	.4byte _0804CFFC @ case 58
	.4byte _0804CFFC @ case 59
	.4byte _0804CFFC @ case 60
	.4byte _0804CFFC @ case 61
	.4byte _0804CFFC @ case 62
	.4byte _0804CFFC @ case 63
	.4byte _0804CFFC @ case 64
	.4byte _0804CFFC @ case 65
	.4byte _0804CFFC @ case 66
	.4byte _0804CFFC @ case 67
	.4byte _0804CFFC @ case 68
	.4byte _0804CFFC @ case 69
	.4byte _0804CFFC @ case 70
	.4byte _0804CFFC @ case 71
	.4byte _0804CFFC @ case 72
	.4byte _0804CFFC @ case 73
	.4byte _0804CFFC @ case 74
	.4byte _0804CFFC @ case 75
	.4byte _0804CFFC @ case 76
	.4byte _0804CFFC @ case 77
	.4byte _0804CFFC @ case 78
	.4byte _0804CFFC @ case 79
	.4byte _0804CFFC @ case 80
	.4byte _0804CFFC @ case 81
	.4byte _0804CFFC @ case 82
	.4byte _0804CFFC @ case 83
	.4byte _0804CFFC @ case 84
	.4byte _0804CFFC @ case 85
	.4byte _0804CFFC @ case 86
	.4byte _0804CFE0 @ case 87
	.4byte _0804CFE4 @ case 88
	.4byte _0804CFEA @ case 89
	.4byte _0804CFEE @ case 90
	.4byte _0804CFF4 @ case 91
_0804CFB0:
	bl ZebesianAquaInit
	b _0804CFFC
_0804CFB6:
	bl ZebesianAquaIdleInit
	b _0804CFFC
_0804CFBC:
	bl ZebesianAquaIdle
	b _0804CFFC
_0804CFC2:
	bl ZebesianAquaTurningAroundInit
_0804CFC6:
	bl ZebesianAquaTurningAround
	b _0804CFFC
_0804CFCC:
	bl ZebesianAquaShootingInit
_0804CFD0:
	bl ZebesianAquaShooting
	b _0804CFFC
_0804CFD6:
	bl ZebesianAquaLungeInit
_0804CFDA:
	bl ZebesianAquaLunge
	b _0804CFFC
_0804CFE0:
	bl SpriteDyingInit
_0804CFE4:
	bl SpriteDying
	b _0804CFFC
_0804CFEA:
	bl ZebesianAquaInit
_0804CFEE:
	bl SpriteSpawningFromX
	b _0804CFFC
_0804CFF4:
	bl ZebesianAquaTurningIntoX
	bl XParasiteInit
_0804CFFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianAquaProjectile
ZebesianAquaProjectile: @ 0x0804D004
	push {r4, lr}
	ldr r4, _0804D028 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804D016
	bl ZebesianAquaProjectileInit
_0804D016:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804D02C
	ldrh r0, [r4, #4]
	adds r0, #0x10
	b _0804D030
	.align 2, 0
_0804D028: .4byte gCurrentSprite
_0804D02C:
	ldrh r0, [r4, #4]
	subs r0, #0x10
_0804D030:
	strh r0, [r4, #4]
	pop {r4}
	pop {r0}
	bx r0
