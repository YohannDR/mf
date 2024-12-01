    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ReoPlaySound
ReoPlaySound: @ 0x08033A44
	push {lr}
	ldr r0, _08033A60 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _08033A5A
	movs r0, #0xc1
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08033A5A:
	pop {r0}
	bx r0
	.align 2, 0
_08033A60: .4byte gFrameCounter8Bit

	thumb_func_start ReoCheckFall
ReoCheckFall: @ 0x08033A64
	push {lr}
	ldr r2, _08033A8C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bls _08033A90
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033A90
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	movs r0, #1
	b _08033A92
	.align 2, 0
_08033A8C: .4byte gCurrentSprite
_08033A90:
	movs r0, #0
_08033A92:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ReoXMovement
ReoXMovement: @ 0x08033A98
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, r5, #0
	ldr r4, _08033AC8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033AD0
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08033ACC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08033AE4
	ldrh r0, [r4, #4]
	adds r0, r5, r0
	b _08033AF0
	.align 2, 0
_08033AC8: .4byte gCurrentSprite
_08033ACC: .4byte gPreviousCollisionCheck
_08033AD0:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08033AE8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08033AEC
_08033AE4:
	movs r0, #1
	b _08033AF4
	.align 2, 0
_08033AE8: .4byte gPreviousCollisionCheck
_08033AEC:
	ldrh r0, [r4, #4]
	subs r0, r0, r6
_08033AF0:
	strh r0, [r4, #4]
	movs r0, #0
_08033AF4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ReoInit
ReoInit: @ 0x08033AFC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08033B28 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033B40
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08033B2C
	strh r0, [r2]
	b _08033BFC
	.align 2, 0
_08033B28: .4byte gCurrentSprite
_08033B2C:
	ldr r0, _08033B3C @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r1, #0x28
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	movs r0, #0x40
	b _08033B4E
	.align 2, 0
_08033B3C: .4byte 0x0000FFC0
_08033B40:
	ldr r0, _08033BAC @ =0x0000FFC8
	strh r0, [r2, #0xa]
	movs r0, #0x18
	strh r0, [r2, #0xc]
	ldr r0, _08033BB0 @ =0x0000FFD8
	strh r0, [r2, #0xe]
	movs r0, #0x28
_08033B4E:
	strh r0, [r2, #0x10]
	ldr r5, _08033BB4 @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x27
	movs r6, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08033BB8 @ =sReoOam_33f128
	str r0, [r5, #0x18]
	strb r6, [r5, #0x1c]
	movs r0, #0
	strh r6, [r5, #0x16]
	adds r1, #5
	strb r0, [r1]
	adds r1, #3
	strb r0, [r1]
	ldr r2, _08033BBC @ =sPrimarySpriteStats
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
	bl SpriteUtilMakeSpriteFaceSamusDirection
	adds r1, r5, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _08033BC0
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r5, #6]
	b _08033BFC
	.align 2, 0
_08033BAC: .4byte 0x0000FFC8
_08033BB0: .4byte 0x0000FFD8
_08033BB4: .4byte gCurrentSprite
_08033BB8: .4byte sReoOam_33f128
_08033BBC: .4byte sPrimarySpriteStats
_08033BC0:
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r5, #2]
	strh r0, [r5, #8]
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	ldrh r4, [r5]
	movs r0, #0x40
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x2c
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _08033BF6
	strh r6, [r5]
_08033BF6:
	adds r0, r5, #0
	adds r0, #0x2f
	strb r2, [r0]
_08033BFC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ReoFallInit
ReoFallInit: @ 0x08033C04
	ldr r3, _08033C38 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x38
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	ldr r0, _08033C3C @ =sReoOam_33f178
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	ldr r2, _08033C40 @ =gSpriteData
	subs r0, #2
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #4
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08033C38: .4byte gCurrentSprite
_08033C3C: .4byte sReoOam_33f178
_08033C40: .4byte gSpriteData

	thumb_func_start ReoFalling
ReoFalling: @ 0x08033C44
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _08033CA4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r5, _08033CA8 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08033C8E
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08033C8E
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _08033C8A
	movs r6, #1
_08033C8A:
	cmp r6, #0
	beq _08033CAC
_08033C8E:
	ldr r1, _08033CA4 @ =gCurrentSprite
	strh r2, [r1, #2]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3a
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	b _08033CEC
	.align 2, 0
_08033CA4: .4byte gCurrentSprite
_08033CA8: .4byte gPreviousVerticalCollisionCheck
_08033CAC:
	adds r3, r4, #0
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08033CD8 @ =sSpritesFallingSpeedQuickAcceleration
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08033CDC @ =0x00007FFF
	cmp r1, r0
	bne _08033CE0
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _08033CEC
	.align 2, 0
_08033CD8: .4byte sSpritesFallingSpeedQuickAcceleration
_08033CDC: .4byte 0x00007FFF
_08033CE0:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_08033CEC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ReoLanding
ReoLanding: @ 0x08033CF4
	push {lr}
	ldr r3, _08033D34 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08033D30
	subs r1, #0xa
	movs r0, #0x2d
	strb r0, [r1]
	ldr r0, _08033D38 @ =sReoOam_33f128
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r2, _08033D3C @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r1]
	ldr r0, _08033D40 @ =0x0000FFFB
	ands r0, r2
	strh r0, [r1]
_08033D30:
	pop {r0}
	bx r0
	.align 2, 0
_08033D34: .4byte gCurrentSprite
_08033D38: .4byte sReoOam_33f128
_08033D3C: .4byte gSpriteData
_08033D40: .4byte 0x0000FFFB

	thumb_func_start ReoIdleInit
ReoIdleInit: @ 0x08033D44
	ldr r3, _08033D68 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	ldr r0, _08033D6C @ =sReoOam_33f128
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08033D68: .4byte gCurrentSprite
_08033D6C: .4byte sReoOam_33f128

	thumb_func_start ReoIdle
ReoIdle: @ 0x08033D70
	push {r4, r5, r6, r7, lr}
	ldr r4, _08033E2C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08033E52
	bl ReoCheckFall
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08033E52
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _08033E30 @ =sReoIdleYMovement
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08033E34 @ =0x00007FFF
	cmp r1, r0
	bne _08033DB2
	ldrh r3, [r5]
	movs r2, #0
_08033DB2:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	movs r0, #2
	bl ReoXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08033DD0
	ldrb r0, [r6]
	cmp r0, #0x20
	bls _08033DE0
_08033DD0:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	movs r0, #0
	strb r0, [r6]
_08033DE0:
	ldr r6, _08033E2C @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x2f
	bne _08033E52
	ldr r7, _08033E38 @ =gSamusData
	ldrh r5, [r7, #0x18]
	ldrh r4, [r6, #2]
	subs r4, #0x60
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #0xf0
	lsls r1, r1, #2
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r4
	bhs _08033E0E
	movs r0, #0
_08033E0E:
	cmp r0, #0
	beq _08033E52
	ldrh r1, [r6]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08033E3C
	ldrh r0, [r6, #4]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bls _08033E4A
	b _08033E44
	.align 2, 0
_08033E2C: .4byte gCurrentSprite
_08033E30: .4byte sReoIdleYMovement
_08033E34: .4byte 0x00007FFF
_08033E38: .4byte gSamusData
_08033E3C:
	ldrh r0, [r6, #4]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bhs _08033E4A
_08033E44:
	adds r0, r2, #0
	eors r0, r1
	strh r0, [r6]
_08033E4A:
	ldr r0, _08033E58 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x29
	strb r1, [r0]
_08033E52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033E58: .4byte gCurrentSprite

	thumb_func_start ReoGoingDownInit
ReoGoingDownInit: @ 0x08033E5C
	ldr r2, _08033E78 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	movs r1, #0
	movs r0, #8
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x31
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bx lr
	.align 2, 0
_08033E78: .4byte gCurrentSprite

	thumb_func_start ReoGoingDown
ReoGoingDown: @ 0x08033E7C
	push {r4, r5, r6, r7, lr}
	bl ReoCheckFall
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08033F36
	bl ReoPlaySound
	ldr r4, _08033ECC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08033ED0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08033ED4
	movs r0, #3
	bl ReoXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033EB4
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2d
	strb r0, [r1]
_08033EB4:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08033F36
	subs r1, #0xa
	movs r0, #0x2d
	strb r0, [r1]
	b _08033F36
	.align 2, 0
_08033ECC: .4byte gCurrentSprite
_08033ED0: .4byte gPreviousCollisionCheck
_08033ED4:
	adds r6, r4, #0
	adds r6, #0x31
	ldrb r0, [r6]
	lsrs r0, r0, #2
	cmp r0, #4
	bls _08033EE2
	movs r0, #6
_08033EE2:
	bl ReoXMovement
	ldrh r0, [r4, #2]
	adds r0, #0x80
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08033F00
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2b
	strb r0, [r1]
	b _08033F36
_08033F00:
	ldrb r2, [r6]
	ldr r5, _08033F24 @ =sReoGoingDownYSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08033F28 @ =0x00007FFF
	cmp r1, r0
	bne _08033F2C
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08033F34
	.align 2, 0
_08033F24: .4byte sReoGoingDownYSpeed
_08033F28: .4byte 0x00007FFF
_08033F2C:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_08033F34:
	strh r0, [r4, #2]
_08033F36:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ReoSlidingInit
ReoSlidingInit: @ 0x08033F3C
	ldr r2, _08033F58 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	movs r1, #0
	movs r0, #8
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x31
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	bx lr
	.align 2, 0
_08033F58: .4byte gCurrentSprite

	thumb_func_start ReoSliding
ReoSliding: @ 0x08033F5C
	push {r4, r5, r6, r7, lr}
	bl ReoCheckFall
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08034016
	bl ReoPlaySound
	movs r0, #6
	bl ReoXMovement
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _08033FB0 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08033FB4 @ =gPreviousCollisionCheck
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08033FB8
	cmp r6, #0
	beq _08033F98
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2d
	strb r0, [r1]
_08033F98:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034016
	subs r1, #0xa
	movs r0, #0x2d
	b _08034014
	.align 2, 0
_08033FB0: .4byte gCurrentSprite
_08033FB4: .4byte gPreviousCollisionCheck
_08033FB8:
	ldrh r0, [r4, #2]
	adds r0, #0x80
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08034004
	adds r6, r4, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08033FF0 @ =sReoSlidingYSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08033FF4 @ =0x00007FFF
	cmp r1, r0
	bne _08033FF8
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #2]
	b _08034016
	.align 2, 0
_08033FF0: .4byte sReoSlidingYSpeed
_08033FF4: .4byte 0x00007FFF
_08033FF8:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	b _08034016
_08034004:
	adds r0, r4, #0
	adds r0, #0x2e
	strb r5, [r0]
	adds r0, #3
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2a
_08034014:
	strb r0, [r1]
_08034016:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ReoGoingUpInit
ReoGoingUpInit: @ 0x0803401C
	ldr r1, _08034034 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #0
	strb r0, [r2]
	adds r2, #3
	strb r0, [r2]
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
	bx lr
	.align 2, 0
_08034034: .4byte gCurrentSprite

	thumb_func_start ReoGoingUp
ReoGoingUp: @ 0x08034038
	push {r4, r5, r6, r7, lr}
	bl ReoCheckFall
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803411C
	bl ReoPlaySound
	ldr r4, _080340A0 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080340A4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08034114
	adds r7, r4, #0
	adds r7, #0x2e
	ldrb r5, [r7]
	cmp r5, #0
	bne _080340CA
	movs r0, #6
	bl ReoXMovement
	ldrh r0, [r4, #8]
	adds r0, #0x60
	ldrh r6, [r4, #2]
	cmp r0, r6
	bge _080340BE
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _080340A8 @ =sReoGoingUpAccceleratingYSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _080340AC @ =0x00007FFF
	cmp r1, r0
	bne _080340B0
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	adds r0, r6, r3
	strh r0, [r4, #2]
	b _0803411C
	.align 2, 0
_080340A0: .4byte gCurrentSprite
_080340A4: .4byte gPreviousCollisionCheck
_080340A8: .4byte sReoGoingUpAccceleratingYSpeed
_080340AC: .4byte 0x00007FFF
_080340B0:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	b _0803411C
_080340BE:
	movs r0, #1
	strb r0, [r7]
	adds r0, r4, #0
	adds r0, #0x31
	strb r5, [r0]
	b _0803411C
_080340CA:
	movs r0, #3
	bl ReoXMovement
	ldrh r3, [r4, #2]
	ldrh r0, [r4, #8]
	cmp r0, r3
	bhs _08034114
	adds r7, r4, #0
	adds r7, #0x31
	ldrb r2, [r7]
	ldr r6, _08034100 @ =sReoGoingUpDeceleratingYSpeed
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	mov ip, r5
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08034104 @ =0x00007FFF
	cmp r1, r0
	bne _08034108
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r4, #2]
	b _0803411C
	.align 2, 0
_08034100: .4byte sReoGoingUpDeceleratingYSpeed
_08034104: .4byte 0x00007FFF
_08034108:
	adds r0, r2, #1
	strb r0, [r7]
	mov r7, ip
	adds r0, r3, r7
	strh r0, [r4, #2]
	b _0803411C
_08034114:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0803411C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ReoWingsInit
ReoWingsInit: @ 0x08034124
	push {r4, lr}
	ldr r0, _080341A0 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _080341A4 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803414C
	mov r4, ip
	ldrh r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r4]
_0803414C:
	mov r0, ip
	ldrh r1, [r0]
	ldr r0, _080341A8 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080341AC @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	subs r1, #2
	movs r0, #5
	strb r0, [r1]
	ldr r0, _080341B0 @ =sReoOam_33f150
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080341A0: .4byte gCurrentSprite
_080341A4: .4byte gSpriteData
_080341A8: .4byte 0x0000FFFB
_080341AC: .4byte 0x0000FFFC
_080341B0: .4byte sReoOam_33f150

	thumb_func_start ReoWingsIdle
ReoWingsIdle: @ 0x080341B4
	push {r4, r5, r6, lr}
	ldr r1, _080341F0 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r5, [r0]
	ldr r2, _080341F4 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrh r0, [r3, #2]
	strh r0, [r1, #2]
	ldrh r0, [r3, #4]
	strh r0, [r1, #4]
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x57
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #1
	bhi _080341F8
	bl SpriteDyingInit
	bl SpriteDying
	b _08034260
	.align 2, 0
_080341F0: .4byte gCurrentSprite
_080341F4: .4byte gSpriteData
_080341F8:
	ldrh r1, [r3]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803420A
	ldrh r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	b _08034210
_0803420A:
	ldrh r1, [r4]
	ldr r0, _0803422C @ =0x0000FFDF
	ands r0, r1
_08034210:
	strh r0, [r4]
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08034230
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	b _08034236
	.align 2, 0
_0803422C: .4byte 0x0000FFDF
_08034230:
	ldrh r1, [r4]
	ldr r0, _08034254 @ =0x0000FFBF
	ands r0, r1
_08034236:
	strh r0, [r4]
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08034258
	ldrh r1, [r4]
	adds r0, r2, #0
	orrs r0, r1
	b _0803425E
	.align 2, 0
_08034254: .4byte 0x0000FFBF
_08034258:
	ldrh r1, [r4]
	ldr r0, _08034268 @ =0x0000DFFF
	ands r0, r1
_0803425E:
	strh r0, [r4]
_08034260:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034268: .4byte 0x0000DFFF

	thumb_func_start Reo
Reo: @ 0x0803426C
	push {r4, lr}
	ldr r4, _080342A0 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08034284
	ldr r0, _080342A4 @ =0x00000183
	bl SoundPlayNotAlreadyPlaying
_08034284:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _080342A8
	bl SpriteUtilUpdateFreezeTimer
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x2c
	bl SpriteUtilUpdateSecondarySpritesFreezeTimer
	b _080344A2
	.align 2, 0
_080342A0: .4byte gCurrentSprite
_080342A4: .4byte 0x00000183
_080342A8:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _080342B4
	b _080344A2
_080342B4:
	lsls r0, r0, #2
	ldr r1, _080342C0 @ =_080342C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080342C0: .4byte _080342C4
_080342C4: @ jump table
	.4byte _08034434 @ case 0
	.4byte _0803443A @ case 1
	.4byte _0803443E @ case 2
	.4byte _080344A2 @ case 3
	.4byte _080344A2 @ case 4
	.4byte _080344A2 @ case 5
	.4byte _080344A2 @ case 6
	.4byte _080344A2 @ case 7
	.4byte _080344A2 @ case 8
	.4byte _080344A2 @ case 9
	.4byte _080344A2 @ case 10
	.4byte _080344A2 @ case 11
	.4byte _080344A2 @ case 12
	.4byte _080344A2 @ case 13
	.4byte _080344A2 @ case 14
	.4byte _080344A2 @ case 15
	.4byte _080344A2 @ case 16
	.4byte _080344A2 @ case 17
	.4byte _080344A2 @ case 18
	.4byte _080344A2 @ case 19
	.4byte _080344A2 @ case 20
	.4byte _080344A2 @ case 21
	.4byte _080344A2 @ case 22
	.4byte _080344A2 @ case 23
	.4byte _080344A2 @ case 24
	.4byte _080344A2 @ case 25
	.4byte _080344A2 @ case 26
	.4byte _080344A2 @ case 27
	.4byte _080344A2 @ case 28
	.4byte _080344A2 @ case 29
	.4byte _080344A2 @ case 30
	.4byte _080344A2 @ case 31
	.4byte _080344A2 @ case 32
	.4byte _080344A2 @ case 33
	.4byte _080344A2 @ case 34
	.4byte _080344A2 @ case 35
	.4byte _080344A2 @ case 36
	.4byte _080344A2 @ case 37
	.4byte _080344A2 @ case 38
	.4byte _080344A2 @ case 39
	.4byte _080344A2 @ case 40
	.4byte _08034454 @ case 41
	.4byte _08034458 @ case 42
	.4byte _0803445E @ case 43
	.4byte _08034462 @ case 44
	.4byte _08034468 @ case 45
	.4byte _0803446C @ case 46
	.4byte _080344A2 @ case 47
	.4byte _080344A2 @ case 48
	.4byte _080344A2 @ case 49
	.4byte _080344A2 @ case 50
	.4byte _080344A2 @ case 51
	.4byte _080344A2 @ case 52
	.4byte _080344A2 @ case 53
	.4byte _080344A2 @ case 54
	.4byte _08034444 @ case 55
	.4byte _08034448 @ case 56
	.4byte _080344A2 @ case 57
	.4byte _0803444E @ case 58
	.4byte _080344A2 @ case 59
	.4byte _080344A2 @ case 60
	.4byte _080344A2 @ case 61
	.4byte _080344A2 @ case 62
	.4byte _080344A2 @ case 63
	.4byte _080344A2 @ case 64
	.4byte _080344A2 @ case 65
	.4byte _080344A2 @ case 66
	.4byte _080344A2 @ case 67
	.4byte _080344A2 @ case 68
	.4byte _080344A2 @ case 69
	.4byte _080344A2 @ case 70
	.4byte _080344A2 @ case 71
	.4byte _080344A2 @ case 72
	.4byte _080344A2 @ case 73
	.4byte _080344A2 @ case 74
	.4byte _080344A2 @ case 75
	.4byte _080344A2 @ case 76
	.4byte _080344A2 @ case 77
	.4byte _080344A2 @ case 78
	.4byte _080344A2 @ case 79
	.4byte _080344A2 @ case 80
	.4byte _080344A2 @ case 81
	.4byte _080344A2 @ case 82
	.4byte _080344A2 @ case 83
	.4byte _080344A2 @ case 84
	.4byte _080344A2 @ case 85
	.4byte _080344A2 @ case 86
	.4byte _08034472 @ case 87
	.4byte _08034482 @ case 88
	.4byte _0803448C @ case 89
	.4byte _08034490 @ case 90
	.4byte _08034496 @ case 91
_08034434:
	bl ReoInit
	b _080344A2
_0803443A:
	bl ReoIdleInit
_0803443E:
	bl ReoIdle
	b _080344A2
_08034444:
	bl ReoFallInit
_08034448:
	bl ReoFalling
	b _080344A2
_0803444E:
	bl ReoLanding
	b _080344A2
_08034454:
	bl ReoGoingDownInit
_08034458:
	bl ReoGoingDown
	b _080344A2
_0803445E:
	bl ReoSlidingInit
_08034462:
	bl ReoSliding
	b _080344A2
_08034468:
	bl ReoGoingUpInit
_0803446C:
	bl ReoGoingUp
	b _080344A2
_08034472:
	ldr r0, _08034488 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x2c
	bl SpriteUtilUnfreezeSecondarySprites
	bl SpriteDyingInit
_08034482:
	bl SpriteDying
	b _080344A2
	.align 2, 0
_08034488: .4byte gCurrentSprite
_0803448C:
	bl ReoInit
_08034490:
	bl SpriteSpawningFromX
	b _080344A2
_08034496:
	bl XParasiteInit
	ldr r1, _080344A8 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_080344A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080344A8: .4byte gCurrentSprite

	thumb_func_start ReoWings
ReoWings: @ 0x080344AC
	push {lr}
	ldr r1, _080344C8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _080344CC
	bl SpriteUtilUpdateFreezeTimer
	b _080344E8
	.align 2, 0
_080344C8: .4byte gCurrentSprite
_080344CC:
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _080344E0
	cmp r0, #0x58
	bne _080344E4
	bl SpriteDying
	b _080344E8
_080344E0:
	bl ReoWingsInit
_080344E4:
	bl ReoWingsIdle
_080344E8:
	pop {r0}
	bx r0
