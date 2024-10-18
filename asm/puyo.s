    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start PuyoInit
PuyoInit: @ 0x0804B664
	push {r4, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804B690 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B694
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804B694
	strh r0, [r2]
	b _0804B708
	.align 2, 0
_0804B690: .4byte gCurrentSprite
_0804B694:
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	ldr r0, _0804B6F4 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x27
	movs r3, #0
	movs r1, #0x10
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x28
	strb r3, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r2, #0
	ldr r1, _0804B6F8 @ =0x0000FFE0
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x10]
	ldr r0, _0804B6FC @ =0x0837CE44
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r2, _0804B700 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r1, ip
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804B704
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0804B708
	.align 2, 0
_0804B6F4: .4byte gCurrentSprite
_0804B6F8: .4byte 0x0000FFE0
_0804B6FC: .4byte 0x0837CE44
_0804B700: .4byte sPrimarySpriteStats
_0804B704:
	movs r0, #1
	strb r0, [r1]
_0804B708:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PuyoFallingInit
PuyoFallingInit: @ 0x0804B710
	ldr r3, _0804B72C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	ldr r0, _0804B730 @ =0x0837CE44
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_0804B72C: .4byte gCurrentSprite
_0804B730: .4byte 0x0837CE44

	thumb_func_start PuyoIdleInit
PuyoIdleInit: @ 0x0804B734
	ldr r1, _0804B74C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0804B750 @ =0x0837CE6C
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804B74C: .4byte gCurrentSprite
_0804B750: .4byte 0x0837CE6C

	thumb_func_start PuyoIdle
PuyoIdle: @ 0x0804B754
	push {r4, r5, r6, lr}
	ldr r1, _0804B794 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _0804B766
	b _0804B894
_0804B766:
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804B780
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0804B780
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0804B780
	ldr r0, _0804B798 @ =0x000001C3
	bl SoundPlayNotAlreadyPlaying
_0804B780:
	bl SpriteUtilAlignYPosOnSlope
	ldr r0, _0804B79C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804B7A0
	ldr r0, _0804B794 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _0804B892
	.align 2, 0
_0804B794: .4byte gCurrentSprite
_0804B798: .4byte 0x000001C3
_0804B79C: .4byte gPreviousVerticalCollisionCheck
_0804B7A0:
	ldr r4, _0804B7CC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r6, #0x40
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804B7D4
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804B7D0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804B7FC
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x40
	b _0804B7EE
	.align 2, 0
_0804B7CC: .4byte gCurrentSprite
_0804B7D0: .4byte gPreviousCollisionCheck
_0804B7D4:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804B80C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804B7FC
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x40
_0804B7EE:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0804B810
_0804B7FC:
	ldrh r0, [r4]
	eors r0, r6
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	b _0804B894
	.align 2, 0
_0804B80C: .4byte gPreviousCollisionCheck
_0804B810:
	ldr r1, _0804B824 @ =gCurrentSprite
	ldrh r2, [r1, #0x16]
	subs r0, r2, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r1, #0
	cmp r0, #1
	bhi _0804B828
	movs r3, #4
	b _0804B830
	.align 2, 0
_0804B824: .4byte gCurrentSprite
_0804B828:
	movs r3, #0
	cmp r2, #3
	bne _0804B830
	movs r3, #8
_0804B830:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804B840
	ldrh r0, [r4, #4]
	adds r0, r3, r0
	b _0804B844
_0804B840:
	ldrh r0, [r4, #4]
	subs r0, r0, r3
_0804B844:
	strh r0, [r4, #4]
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B894
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #4
	bne _0804B870
	ldr r1, _0804B868 @ =gCurrentSprite
	ldrh r2, [r1]
	ldr r0, _0804B86C @ =0x0000FFBF
	ands r0, r2
	b _0804B87C
	.align 2, 0
_0804B868: .4byte gCurrentSprite
_0804B86C: .4byte 0x0000FFBF
_0804B870:
	cmp r0, #8
	bne _0804B88C
	ldr r1, _0804B888 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x40
	orrs r0, r2
_0804B87C:
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _0804B894
	.align 2, 0
_0804B888: .4byte gCurrentSprite
_0804B88C:
	ldr r0, _0804B89C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
_0804B892:
	strb r1, [r0]
_0804B894:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B89C: .4byte gCurrentSprite

	thumb_func_start PuyoWaitingInit
PuyoWaitingInit: @ 0x0804B8A0
	ldr r1, _0804B8C4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #8
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B8C8 @ =0x0837CE44
	str r0, [r1, #0x18]
	ldr r0, _0804B8CC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #2
	adds r0, #1
	adds r1, #0x2e
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804B8C4: .4byte gCurrentSprite
_0804B8C8: .4byte 0x0837CE44
_0804B8CC: .4byte gSpriteRandomNumber

	thumb_func_start PuyoWaiting
PuyoWaiting: @ 0x0804B8D0
	push {lr}
	bl SpriteUtilAlignYPosOnSlope
	ldr r0, _0804B8E8 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804B8F0
	ldr r0, _0804B8EC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0804B91C
	.align 2, 0
_0804B8E8: .4byte gPreviousVerticalCollisionCheck
_0804B8EC: .4byte gCurrentSprite
_0804B8F0:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B91C
	ldr r3, _0804B920 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0804B91C
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	ldr r0, _0804B924 @ =0x0837CE6C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
_0804B91C:
	pop {r0}
	bx r0
	.align 2, 0
_0804B920: .4byte gCurrentSprite
_0804B924: .4byte 0x0837CE6C

	thumb_func_start PuyoJumpWarningInit
PuyoJumpWarningInit: @ 0x0804B928
	ldr r1, _0804B940 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B944 @ =0x0837CEA4
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804B940: .4byte gCurrentSprite
_0804B944: .4byte 0x0837CEA4

	thumb_func_start PuyoJumpWarning
PuyoJumpWarning: @ 0x0804B948
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B980
	ldr r3, _0804B984 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2c
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	ldr r0, _0804B988 @ =0x0837CEC4
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B980
	movs r0, #0xe2
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804B980:
	pop {r0}
	bx r0
	.align 2, 0
_0804B984: .4byte gCurrentSprite
_0804B988: .4byte 0x0837CEC4

	thumb_func_start PuyoJumpingUp
PuyoJumpingUp: @ 0x0804B98C
	push {r4, r5, r6, r7, lr}
	ldr r4, _0804B9B4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804B9B8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0804B9BC
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2e
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x31
	strb r2, [r0]
	b _0804BA9A
	.align 2, 0
_0804B9B4: .4byte gCurrentSprite
_0804B9B8: .4byte gPreviousCollisionCheck
_0804B9BC:
	adds r3, r4, #0
	adds r3, #0x31
	ldrb r0, [r3]
	cmp r0, #0x1e
	bls _0804B9D4
	adds r0, r4, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x2e
	strb r1, [r0]
	strb r2, [r3]
	b _0804BA0A
_0804B9D4:
	ldrb r2, [r3]
	ldr r6, _0804B9F8 @ =0x0837C578
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804B9FC @ =0x00007FFF
	cmp r1, r0
	bne _0804BA00
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804BA08
	.align 2, 0
_0804B9F8: .4byte 0x0837C578
_0804B9FC: .4byte 0x00007FFF
_0804BA00:
	adds r0, r2, #1
	strb r0, [r3]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
_0804BA08:
	strh r0, [r4, #2]
_0804BA0A:
	movs r4, #0
	ldr r2, _0804BA34 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804BA3C
	ldrh r0, [r2, #2]
	subs r0, #8
	ldrh r1, [r2, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804BA38 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r4, r0, #0x1f
	b _0804BA56
	.align 2, 0
_0804BA34: .4byte gCurrentSprite
_0804BA38: .4byte gPreviousCollisionCheck
_0804BA3C:
	ldrh r0, [r2, #2]
	subs r0, #8
	ldrh r1, [r2, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804BA74 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0804BA56
	movs r4, #1
_0804BA56:
	cmp r4, #0
	beq _0804BA7C
	ldr r2, _0804BA78 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	movs r3, #0
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
	adds r2, #0x31
	strb r3, [r2]
	b _0804BA9A
	.align 2, 0
_0804BA74: .4byte gPreviousCollisionCheck
_0804BA78: .4byte gCurrentSprite
_0804BA7C:
	ldr r2, _0804BA90 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804BA94
	ldrh r0, [r2, #4]
	adds r0, #2
	b _0804BA98
	.align 2, 0
_0804BA90: .4byte gCurrentSprite
_0804BA94:
	ldrh r0, [r2, #4]
	subs r0, #2
_0804BA98:
	strh r0, [r2, #4]
_0804BA9A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start PuyoJumpingDown
PuyoJumpingDown: @ 0x0804BAA0
	push {r4, r5, r6, lr}
	ldr r4, _0804BAE0 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0804BAE4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804BAF0
	movs r2, #0
	movs r3, #0
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x30
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r0, _0804BAE8 @ =0x0837CED4
	str r0, [r4, #0x18]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804BB2C
	ldr r0, _0804BAEC @ =0x000001C5
	bl SoundPlayNotAlreadyPlaying
	b _0804BB2C
	.align 2, 0
_0804BAE0: .4byte gCurrentSprite
_0804BAE4: .4byte gPreviousVerticalCollisionCheck
_0804BAE8: .4byte 0x0837CED4
_0804BAEC: .4byte 0x000001C5
_0804BAF0:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0804BB18 @ =0x0837C5B8
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0804BB1C @ =0x00007FFF
	cmp r1, r0
	bne _0804BB20
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804BB2A
	.align 2, 0
_0804BB18: .4byte 0x0837C5B8
_0804BB1C: .4byte 0x00007FFF
_0804BB20:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_0804BB2A:
	strh r0, [r4, #2]
_0804BB2C:
	movs r4, #0
	ldr r2, _0804BB58 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804BB60
	ldrh r0, [r2, #2]
	subs r0, #8
	ldrh r1, [r2, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804BB5C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r4, r0, #0x1f
	b _0804BB7A
	.align 2, 0
_0804BB58: .4byte gCurrentSprite
_0804BB5C: .4byte gPreviousCollisionCheck
_0804BB60:
	ldrh r0, [r2, #2]
	subs r0, #8
	ldrh r1, [r2, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804BB98 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0804BB7A
	movs r4, #1
_0804BB7A:
	ldr r2, _0804BB9C @ =gCurrentSprite
	cmp r4, #0
	beq _0804BB88
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_0804BB88:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804BBA0
	ldrh r0, [r2, #4]
	adds r0, #2
	b _0804BBA4
	.align 2, 0
_0804BB98: .4byte gPreviousCollisionCheck
_0804BB9C: .4byte gCurrentSprite
_0804BBA0:
	ldrh r0, [r2, #4]
	subs r0, #2
_0804BBA4:
	strh r0, [r2, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start PuyoLanding
PuyoLanding: @ 0x0804BBAC
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804BBBE
	ldr r0, _0804BBC4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
	strb r1, [r0]
_0804BBBE:
	pop {r0}
	bx r0
	.align 2, 0
_0804BBC4: .4byte gCurrentSprite

	thumb_func_start Puyo
Puyo: @ 0x0804BBC8
	push {r4, lr}
	ldr r4, _0804BBF4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804BBE2
	movs r0, #0xe3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804BBE2:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804BBF8
	bl SpriteUtilUpdateFreezeTimer
	b _0804BDE4
	.align 2, 0
_0804BBF4: .4byte gCurrentSprite
_0804BBF8:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804BC04
	b _0804BDE4
_0804BC04:
	lsls r0, r0, #2
	ldr r1, _0804BC10 @ =_0804BC14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804BC10: .4byte _0804BC14
_0804BC14: @ jump table
	.4byte _0804BD84 @ case 0
	.4byte _0804BD8A @ case 1
	.4byte _0804BD8E @ case 2
	.4byte _0804BDE4 @ case 3
	.4byte _0804BDE4 @ case 4
	.4byte _0804BDE4 @ case 5
	.4byte _0804BDE4 @ case 6
	.4byte _0804BD94 @ case 7
	.4byte _0804BD98 @ case 8
	.4byte _0804BDE4 @ case 9
	.4byte _0804BDE4 @ case 10
	.4byte _0804BDE4 @ case 11
	.4byte _0804BDE4 @ case 12
	.4byte _0804BDE4 @ case 13
	.4byte _0804BDE4 @ case 14
	.4byte _0804BDE4 @ case 15
	.4byte _0804BDE4 @ case 16
	.4byte _0804BDE4 @ case 17
	.4byte _0804BDE4 @ case 18
	.4byte _0804BDE4 @ case 19
	.4byte _0804BDE4 @ case 20
	.4byte _0804BDBA @ case 21
	.4byte _0804BDBE @ case 22
	.4byte _0804BDE4 @ case 23
	.4byte _0804BDE4 @ case 24
	.4byte _0804BDE4 @ case 25
	.4byte _0804BDE4 @ case 26
	.4byte _0804BDE4 @ case 27
	.4byte _0804BDE4 @ case 28
	.4byte _0804BDE4 @ case 29
	.4byte _0804BDE4 @ case 30
	.4byte _0804BDE4 @ case 31
	.4byte _0804BDE4 @ case 32
	.4byte _0804BDE4 @ case 33
	.4byte _0804BDE4 @ case 34
	.4byte _0804BDE4 @ case 35
	.4byte _0804BDE4 @ case 36
	.4byte _0804BDE4 @ case 37
	.4byte _0804BDE4 @ case 38
	.4byte _0804BDE4 @ case 39
	.4byte _0804BDE4 @ case 40
	.4byte _0804BD9E @ case 41
	.4byte _0804BDA2 @ case 42
	.4byte _0804BDE4 @ case 43
	.4byte _0804BDA8 @ case 44
	.4byte _0804BDE4 @ case 45
	.4byte _0804BDAE @ case 46
	.4byte _0804BDE4 @ case 47
	.4byte _0804BDB4 @ case 48
	.4byte _0804BDE4 @ case 49
	.4byte _0804BDE4 @ case 50
	.4byte _0804BDE4 @ case 51
	.4byte _0804BDE4 @ case 52
	.4byte _0804BDE4 @ case 53
	.4byte _0804BDE4 @ case 54
	.4byte _0804BDE4 @ case 55
	.4byte _0804BDE4 @ case 56
	.4byte _0804BDE4 @ case 57
	.4byte _0804BDE4 @ case 58
	.4byte _0804BDE4 @ case 59
	.4byte _0804BDE4 @ case 60
	.4byte _0804BDE4 @ case 61
	.4byte _0804BDE4 @ case 62
	.4byte _0804BDE4 @ case 63
	.4byte _0804BDE4 @ case 64
	.4byte _0804BDE4 @ case 65
	.4byte _0804BDE4 @ case 66
	.4byte _0804BDE4 @ case 67
	.4byte _0804BDE4 @ case 68
	.4byte _0804BDE4 @ case 69
	.4byte _0804BDE4 @ case 70
	.4byte _0804BDE4 @ case 71
	.4byte _0804BDE4 @ case 72
	.4byte _0804BDE4 @ case 73
	.4byte _0804BDE4 @ case 74
	.4byte _0804BDE4 @ case 75
	.4byte _0804BDE4 @ case 76
	.4byte _0804BDE4 @ case 77
	.4byte _0804BDE4 @ case 78
	.4byte _0804BDE4 @ case 79
	.4byte _0804BDE4 @ case 80
	.4byte _0804BDE4 @ case 81
	.4byte _0804BDE4 @ case 82
	.4byte _0804BDE4 @ case 83
	.4byte _0804BDE4 @ case 84
	.4byte _0804BDE4 @ case 85
	.4byte _0804BDE4 @ case 86
	.4byte _0804BDC4 @ case 87
	.4byte _0804BDC8 @ case 88
	.4byte _0804BDCE @ case 89
	.4byte _0804BDD2 @ case 90
	.4byte _0804BDD8 @ case 91
_0804BD84:
	bl PuyoInit
	b _0804BDE4
_0804BD8A:
	bl PuyoIdleInit
_0804BD8E:
	bl PuyoIdle
	b _0804BDE4
_0804BD94:
	bl PuyoWaitingInit
_0804BD98:
	bl PuyoWaiting
	b _0804BDE4
_0804BD9E:
	bl PuyoJumpWarningInit
_0804BDA2:
	bl PuyoJumpWarning
	b _0804BDE4
_0804BDA8:
	bl PuyoJumpingUp
	b _0804BDE4
_0804BDAE:
	bl PuyoJumpingDown
	b _0804BDE4
_0804BDB4:
	bl PuyoLanding
	b _0804BDE4
_0804BDBA:
	bl PuyoFallingInit
_0804BDBE:
	bl CurrentSpriteFalling
	b _0804BDE4
_0804BDC4:
	bl SpriteDyingInit
_0804BDC8:
	bl SpriteDying
	b _0804BDE4
_0804BDCE:
	bl PuyoInit
_0804BDD2:
	bl SpriteSpawningFromX
	b _0804BDE4
_0804BDD8:
	bl XParasiteInit
	ldr r1, _0804BDEC @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_0804BDE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDEC: .4byte gCurrentSprite
