    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start GerudaYMovement
GerudaYMovement: @ 0x08038A18
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, r5, #0
	ldr r4, _08038A48 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08038A50
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08038A4C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08038A62
	ldrh r0, [r4, #2]
	adds r0, r5, r0
	b _08038A70
	.align 2, 0
_08038A48: .4byte gCurrentSprite
_08038A4C: .4byte gPreviousCollisionCheck
_08038A50:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08038A68 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08038A6C
_08038A62:
	movs r0, #1
	b _08038A74
	.align 2, 0
_08038A68: .4byte gPreviousCollisionCheck
_08038A6C:
	ldrh r0, [r4, #2]
	subs r0, r0, r6
_08038A70:
	strh r0, [r4, #2]
	movs r0, #0
_08038A74:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GerudaXMovement
GerudaXMovement: @ 0x08038A7C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	ldr r4, _08038ABC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08038AC4
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08038AC0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08038AEA
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08038AEA
	ldrh r0, [r4, #4]
	adds r0, r6, r0
	b _08038AF8
	.align 2, 0
_08038ABC: .4byte gCurrentSprite
_08038AC0: .4byte gPreviousCollisionCheck
_08038AC4:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08038AF0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08038AEA
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08038AF4
_08038AEA:
	movs r0, #1
	b _08038AFC
	.align 2, 0
_08038AF0: .4byte gPreviousCollisionCheck
_08038AF4:
	ldrh r0, [r4, #4]
	subs r0, r0, r7
_08038AF8:
	strh r0, [r4, #4]
	movs r0, #0
_08038AFC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GerudaSetIdleSideHitboxes
GerudaSetIdleSideHitboxes: @ 0x08038B04
	push {lr}
	ldr r2, _08038B20 @ =gCurrentSprite
	ldr r3, _08038B24 @ =0x0000FFE0
	strh r3, [r2, #0xa]
	movs r0, #0x40
	strh r0, [r2, #0xc]
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08038B28
	strh r3, [r2, #0xe]
	movs r0, #0x30
	b _08038B2E
	.align 2, 0
_08038B20: .4byte gCurrentSprite
_08038B24: .4byte 0x0000FFE0
_08038B28:
	ldr r0, _08038B34 @ =0x0000FFD0
	strh r0, [r2, #0xe]
	movs r0, #0x20
_08038B2E:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08038B34: .4byte 0x0000FFD0

	thumb_func_start GerudaSetAttackingSideHitboxes
GerudaSetAttackingSideHitboxes: @ 0x08038B38
	push {lr}
	ldr r2, _08038B54 @ =gCurrentSprite
	ldr r3, _08038B58 @ =0x0000FFE0
	strh r3, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08038B5C
	strh r3, [r2, #0xe]
	movs r0, #0x50
	b _08038B62
	.align 2, 0
_08038B54: .4byte gCurrentSprite
_08038B58: .4byte 0x0000FFE0
_08038B5C:
	ldr r0, _08038B68 @ =0x0000FFB0
	strh r0, [r2, #0xe]
	movs r0, #0x20
_08038B62:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08038B68: .4byte 0x0000FFB0

	thumb_func_start GerudaUpdateLungingAnimation
GerudaUpdateLungingAnimation: @ 0x08038B6C
	push {lr}
	movs r0, #0xe0
	movs r1, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038BAE
	ldr r1, _08038B90 @ =gCurrentSprite
	ldr r0, [r1, #0x18]
	ldr r2, _08038B94 @ =0x08348C64
	cmp r0, r2
	beq _08038B98
	str r2, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	b _08038BE0
	.align 2, 0
_08038B90: .4byte gCurrentSprite
_08038B94: .4byte 0x08348C64
_08038B98:
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _08038BE0
	ldrb r0, [r1, #0x1c]
	cmp r0, #4
	bne _08038BE0
	movs r0, #0xc6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _08038BE0
_08038BAE:
	ldr r2, _08038BE4 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _08038BE8 @ =0x08348C64
	cmp r1, r0
	bne _08038BE0
	ldrh r0, [r2, #0x16]
	cmp r0, #0
	bne _08038BCC
	ldrb r0, [r2, #0x1c]
	cmp r0, #4
	bne _08038BCC
	movs r0, #0xc6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08038BCC:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08038BE0
	ldr r0, _08038BE4 @ =gCurrentSprite
	ldr r1, _08038BEC @ =0x08348C54
	str r1, [r0, #0x18]
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
_08038BE0:
	pop {r0}
	bx r0
	.align 2, 0
_08038BE4: .4byte gCurrentSprite
_08038BE8: .4byte 0x08348C64
_08038BEC: .4byte 0x08348C54

	thumb_func_start GerudaInit
GerudaInit: @ 0x08038BF0
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08038C1C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08038C20
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08038C20
	strh r0, [r2]
	b _08038C84
	.align 2, 0
_08038C1C: .4byte gCurrentSprite
_08038C20:
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	ldr r5, _08038C74 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x27
	movs r4, #0
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0x20
	strb r0, [r1]
	bl GerudaSetIdleSideHitboxes
	ldr r0, _08038C78 @ =0x08348C1C
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	ldr r2, _08038C7C @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _08038C80
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r5, #6]
	b _08038C84
	.align 2, 0
_08038C74: .4byte gCurrentSprite
_08038C78: .4byte 0x08348C1C
_08038C7C: .4byte sPrimarySpriteStats
_08038C80:
	movs r0, #1
	strb r0, [r1]
_08038C84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GerudaIdleInit
GerudaIdleInit: @ 0x08038C8C
	ldr r3, _08038CB0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	ldr r0, _08038CB4 @ =0x08348C1C
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08038CB0: .4byte gCurrentSprite
_08038CB4: .4byte 0x08348C1C

	thumb_func_start GerudaIdle
GerudaIdle: @ 0x08038CB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _08038D28 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _08038CCE
	b _08038E98
_08038CCE:
	adds r4, r2, #0
	adds r4, #0x31
	ldrb r0, [r4]
	cmp r0, #0x23
	bhi _08038CEE
	ldrh r0, [r2, #2]
	adds r0, #0x40
	ldrh r1, [r2, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08038D2C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08038CEE
	movs r0, #0x24
	strb r0, [r4]
_08038CEE:
	ldr r4, _08038D28 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08038D30 @ =0x083480C8
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038D34 @ =0x00007FFF
	cmp r1, r0
	bne _08038D0C
	ldrh r3, [r5]
	movs r2, #0
_08038D0C:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	movs r0, #1
	bl GerudaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038D38
	adds r1, r4, #0
	b _08038E92
	.align 2, 0
_08038D28: .4byte gCurrentSprite
_08038D2C: .4byte gPreviousCollisionCheck
_08038D30: .4byte 0x083480C8
_08038D34: .4byte 0x00007FFF
_08038D38:
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08038D56
	cmp r2, #8
	beq _08038D5C
	b _08038E86
_08038D56:
	cmp r2, #4
	beq _08038D5C
	movs r2, #0
_08038D5C:
	cmp r2, #0
	bne _08038D62
	b _08038E86
_08038D62:
	ldr r2, _08038DA4 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08038DA8 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08038DAC @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r5, [r2, #2]
	adds r0, r5, #0
	adds r0, #0x64
	adds r4, r2, #0
	mov r8, r1
	cmp r6, r0
	ble _08038DE8
	subs r0, #0x24
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08038DB0 @ =gPreviousCollisionCheck
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08038DB4
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
	adds r1, r4, #0
	b _08038E92
	.align 2, 0
_08038DA4: .4byte gCurrentSprite
_08038DA8: .4byte 0x0000F7FF
_08038DAC: .4byte gSamusData
_08038DB0: .4byte gPreviousCollisionCheck
_08038DB4:
	ldrh r0, [r4, #2]
	adds r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08038DD2
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
	adds r1, r4, #0
	b _08038E92
_08038DD2:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	b _08038E42
_08038DE8:
	adds r0, r5, #0
	subs r0, #0x64
	cmp r6, r0
	bge _08038E3A
	adds r0, #0x24
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08038E10 @ =gPreviousCollisionCheck
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08038E14
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
	adds r1, r4, #0
	b _08038E92
	.align 2, 0
_08038E10: .4byte gPreviousCollisionCheck
_08038E14:
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08038E32
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
	adds r1, r4, #0
	b _08038E92
_08038E32:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	b _08038E40
_08038E3A:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
_08038E40:
	strb r0, [r1]
_08038E42:
	strh r5, [r4, #6]
	strh r6, [r4, #8]
	mov r7, r8
	ldrh r6, [r7, #0x16]
	ldrh r5, [r4, #4]
	cmp r5, r6
	bls _08038E54
	subs r0, r5, r6
	b _08038E56
_08038E54:
	subs r0, r6, r5
_08038E56:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r5, r0
	bls _08038E6A
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #8
	b _08038E7C
_08038E6A:
	cmp r5, #0xa0
	bls _08038E76
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #6
	b _08038E7C
_08038E76:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
_08038E7C:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	b _08038E96
_08038E86:
	ldr r1, _08038EA4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x3d
	bls _08038E98
_08038E92:
	adds r1, #0x24
	movs r0, #3
_08038E96:
	strb r0, [r1]
_08038E98:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038EA4: .4byte gCurrentSprite

	thumb_func_start GerudaTurningAroundInit
GerudaTurningAroundInit: @ 0x08038EA8
	ldr r1, _08038EC0 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _08038EC4 @ =0x08348C94
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08038EC0: .4byte gCurrentSprite
_08038EC4: .4byte 0x08348C94

	thumb_func_start GerudaTurningAround
GerudaTurningAround: @ 0x08038EC8
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _08038EE4
	ldr r2, _08038EE8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_08038EE4:
	pop {r0}
	bx r0
	.align 2, 0
_08038EE8: .4byte gCurrentSprite

	thumb_func_start GerudaAttackWarningInit
GerudaAttackWarningInit: @ 0x08038EEC
	push {lr}
	ldr r1, _08038F08 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _08038F0C @ =0x08348C44
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bl GerudaSetAttackingSideHitboxes
	pop {r0}
	bx r0
	.align 2, 0
_08038F08: .4byte gCurrentSprite
_08038F0C: .4byte 0x08348C44

	thumb_func_start GerudaAttackWarning
GerudaAttackWarning: @ 0x08038F10
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08038F34
	ldr r0, _08038F38 @ =gCurrentSprite
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
	ldr r1, _08038F3C @ =0x08348C54
	str r1, [r0, #0x18]
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x2c
	strb r1, [r2]
	adds r0, #0x2e
	movs r1, #0xb4
	strb r1, [r0]
_08038F34:
	pop {r0}
	bx r0
	.align 2, 0
_08038F38: .4byte gCurrentSprite
_08038F3C: .4byte 0x08348C54

	thumb_func_start GerudaAttacking
GerudaAttacking: @ 0x08038F40
	push {r4, r5, lr}
	bl GerudaUpdateLungingAnimation
	movs r5, #0
	ldr r4, _08038F84 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08038F92
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl GerudaXMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08038F8C
	ldrh r0, [r4, #2]
	ldrh r2, [r4, #8]
	cmp r0, r2
	blo _08038FB6
	ldr r0, _08038F88 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r4]
	b _08038FB6
	.align 2, 0
_08038F84: .4byte gCurrentSprite
_08038F88: .4byte 0x0000F7FF
_08038F8C:
	ldrh r0, [r4, #2]
	ldrh r4, [r4, #6]
	b _08038FAC
_08038F92:
	cmp r0, #1
	bne _08038FCA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl GerudaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038FA8
	movs r5, #1
_08038FA8:
	ldrh r0, [r4, #2]
	ldrh r4, [r4, #8]
_08038FAC:
	cmp r0, r4
	bhi _08038FB6
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08038FB6:
	movs r0, #4
	bl GerudaYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038FD8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08038FD8
_08038FCA:
	movs r0, #8
	bl GerudaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038FD8
	movs r5, #1
_08038FD8:
	ldr r2, _08039010 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08038FF0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08038FF0:
	cmp r5, #0
	beq _0803903C
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08039018
	ldr r1, _08039014 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08039030
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	b _08039036
	.align 2, 0
_08039010: .4byte gCurrentSprite
_08039014: .4byte gSamusData
_08039018:
	ldr r1, _0803902C @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _08039030
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	b _08039036
	.align 2, 0
_0803902C: .4byte gSamusData
_08039030:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
_08039036:
	strb r0, [r1]
	bl GerudaSetIdleSideHitboxes
_0803903C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Geruda
Geruda: @ 0x08039044
	push {r4, lr}
	ldr r4, _0803906C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803905C
	ldr r0, _08039070 @ =0x0000018D
	bl SoundPlayNotAlreadyPlaying
_0803905C:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039074
	bl SpriteUtilUpdateFreezeTimer
	b _08039242
	.align 2, 0
_0803906C: .4byte gCurrentSprite
_08039070: .4byte 0x0000018D
_08039074:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08039080
	b _08039242
_08039080:
	lsls r0, r0, #2
	ldr r1, _0803908C @ =_08039090
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803908C: .4byte _08039090
_08039090: @ jump table
	.4byte _08039200 @ case 0
	.4byte _08039206 @ case 1
	.4byte _0803920A @ case 2
	.4byte _08039210 @ case 3
	.4byte _08039214 @ case 4
	.4byte _08039242 @ case 5
	.4byte _08039242 @ case 6
	.4byte _08039242 @ case 7
	.4byte _08039242 @ case 8
	.4byte _08039242 @ case 9
	.4byte _08039242 @ case 10
	.4byte _08039242 @ case 11
	.4byte _08039242 @ case 12
	.4byte _08039242 @ case 13
	.4byte _08039242 @ case 14
	.4byte _08039242 @ case 15
	.4byte _08039242 @ case 16
	.4byte _08039242 @ case 17
	.4byte _08039242 @ case 18
	.4byte _08039242 @ case 19
	.4byte _08039242 @ case 20
	.4byte _08039242 @ case 21
	.4byte _08039242 @ case 22
	.4byte _08039242 @ case 23
	.4byte _08039242 @ case 24
	.4byte _08039242 @ case 25
	.4byte _08039242 @ case 26
	.4byte _08039242 @ case 27
	.4byte _08039242 @ case 28
	.4byte _08039242 @ case 29
	.4byte _08039242 @ case 30
	.4byte _08039242 @ case 31
	.4byte _08039242 @ case 32
	.4byte _08039242 @ case 33
	.4byte _08039242 @ case 34
	.4byte _08039242 @ case 35
	.4byte _08039242 @ case 36
	.4byte _08039242 @ case 37
	.4byte _08039242 @ case 38
	.4byte _08039242 @ case 39
	.4byte _08039242 @ case 40
	.4byte _0803921A @ case 41
	.4byte _0803921E @ case 42
	.4byte _08039242 @ case 43
	.4byte _08039224 @ case 44
	.4byte _08039242 @ case 45
	.4byte _08039242 @ case 46
	.4byte _08039242 @ case 47
	.4byte _08039242 @ case 48
	.4byte _08039242 @ case 49
	.4byte _08039242 @ case 50
	.4byte _08039242 @ case 51
	.4byte _08039242 @ case 52
	.4byte _08039242 @ case 53
	.4byte _08039242 @ case 54
	.4byte _08039242 @ case 55
	.4byte _08039242 @ case 56
	.4byte _08039242 @ case 57
	.4byte _08039242 @ case 58
	.4byte _08039242 @ case 59
	.4byte _08039242 @ case 60
	.4byte _08039242 @ case 61
	.4byte _08039242 @ case 62
	.4byte _08039242 @ case 63
	.4byte _08039242 @ case 64
	.4byte _08039242 @ case 65
	.4byte _08039242 @ case 66
	.4byte _08039242 @ case 67
	.4byte _08039242 @ case 68
	.4byte _08039242 @ case 69
	.4byte _08039242 @ case 70
	.4byte _08039242 @ case 71
	.4byte _08039242 @ case 72
	.4byte _08039242 @ case 73
	.4byte _08039242 @ case 74
	.4byte _08039242 @ case 75
	.4byte _08039242 @ case 76
	.4byte _08039242 @ case 77
	.4byte _08039242 @ case 78
	.4byte _08039242 @ case 79
	.4byte _08039242 @ case 80
	.4byte _08039242 @ case 81
	.4byte _08039242 @ case 82
	.4byte _08039242 @ case 83
	.4byte _08039242 @ case 84
	.4byte _08039242 @ case 85
	.4byte _08039242 @ case 86
	.4byte _0803922A @ case 87
	.4byte _0803922E @ case 88
	.4byte _08039234 @ case 89
	.4byte _08039238 @ case 90
	.4byte _0803923E @ case 91
_08039200:
	bl GerudaInit
	b _08039242
_08039206:
	bl GerudaIdleInit
_0803920A:
	bl GerudaIdle
	b _08039242
_08039210:
	bl GerudaTurningAroundInit
_08039214:
	bl GerudaTurningAround
	b _08039242
_0803921A:
	bl GerudaAttackWarningInit
_0803921E:
	bl GerudaAttackWarning
	b _08039242
_08039224:
	bl GerudaAttacking
	b _08039242
_0803922A:
	bl SpriteDyingInit
_0803922E:
	bl SpriteDying
	b _08039242
_08039234:
	bl GerudaInit
_08039238:
	bl SpriteSpawningFromX
	b _08039242
_0803923E:
	bl XParasiteInit
_08039242:
	pop {r4}
	pop {r0}
	bx r0
