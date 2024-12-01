    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ZebesianWallSetSideHitboxs
ZebesianWallSetSideHitboxs: @ 0x0802B660
	push {lr}
	ldr r2, _0802B678 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802B680
	ldr r0, _0802B67C @ =0x0000FFB0
	strh r0, [r2, #0xe]
	movs r0, #4
	b _0802B686
	.align 2, 0
_0802B678: .4byte gCurrentSprite
_0802B67C: .4byte 0x0000FFB0
_0802B680:
	ldr r0, _0802B68C @ =0x0000FFFC
	strh r0, [r2, #0xe]
	movs r0, #0x50
_0802B686:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0802B68C: .4byte 0x0000FFFC

	thumb_func_start unk_2b690
unk_2b690: @ 0x0802B690
	push {lr}
	ldr r0, _0802B6A4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0802B728
	lsls r0, r0, #2
	ldr r1, _0802B6A8 @ =_0802B6AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B6A4: .4byte gSpriteRandomNumber
_0802B6A8: .4byte _0802B6AC
_0802B6AC: @ jump table
	.4byte _0802B6E0 @ case 0
	.4byte _0802B6E0 @ case 1
	.4byte _0802B6E0 @ case 2
	.4byte _0802B6E0 @ case 3
	.4byte _0802B6F4 @ case 4
	.4byte _0802B6F4 @ case 5
	.4byte _0802B6F4 @ case 6
	.4byte _0802B6F4 @ case 7
	.4byte _0802B710 @ case 8
	.4byte _0802B710 @ case 9
	.4byte _0802B71C @ case 10
	.4byte _0802B71C @ case 11
	.4byte _0802B71C @ case 12
_0802B6E0:
	ldr r1, _0802B6EC @ =gCurrentSprite
	ldrh r2, [r1]
	ldr r0, _0802B6F0 @ =0x0000FDFF
	ands r0, r2
	b _0802B700
	.align 2, 0
_0802B6EC: .4byte gCurrentSprite
_0802B6F0: .4byte 0x0000FDFF
_0802B6F4:
	ldr r1, _0802B70C @ =gCurrentSprite
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r2
_0802B700:
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0802B730
	.align 2, 0
_0802B70C: .4byte gCurrentSprite
_0802B710:
	ldr r0, _0802B718 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x19
	b _0802B72E
	.align 2, 0
_0802B718: .4byte gCurrentSprite
_0802B71C:
	ldr r0, _0802B724 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x29
	b _0802B72E
	.align 2, 0
_0802B724: .4byte gCurrentSprite
_0802B728:
	ldr r0, _0802B734 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
_0802B72E:
	strb r1, [r0]
_0802B730:
	pop {r0}
	bx r0
	.align 2, 0
_0802B734: .4byte gCurrentSprite

	thumb_func_start ZebesianWallInit
ZebesianWallInit: @ 0x0802B738
	push {r4, r5, r6, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r4, _0802B78C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x25
	movs r3, #0
	movs r5, #2
	strb r5, [r0]
	ldr r2, _0802B790 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r6, #0
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _0802B794 @ =sZebesianWallOam_3236e0
	str r0, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r3, [r4, #0x16]
	subs r1, #5
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0802B798
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #8]
	b _0802B7DA
	.align 2, 0
_0802B78C: .4byte gCurrentSprite
_0802B790: .4byte sPrimarySpriteStats
_0802B794: .4byte sZebesianWallOam_3236e0
_0802B798:
	adds r2, r4, #0
	adds r2, #0x21
	movs r0, #1
	strb r0, [r2]
	strb r5, [r1]
	ldrh r0, [r4, #2]
	strh r0, [r4, #6]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0802B7CC @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0802B7D0
	ldrh r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	b _0802B7D4
	.align 2, 0
_0802B7CC: .4byte gPreviousCollisionCheck
_0802B7D0:
	ldrh r0, [r4, #4]
	subs r0, #0x20
_0802B7D4:
	strh r0, [r4, #4]
	bl SpriteUtilChooseRandomXDirection
_0802B7DA:
	ldr r2, _0802B800 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0802B814
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0802B804
	strh r0, [r2]
	b _0802B820
	.align 2, 0
_0802B800: .4byte gCurrentSprite
_0802B804:
	adds r0, r2, #0
	adds r0, #0x36
	strb r3, [r0]
	ldr r0, _0802B810 @ =0x0000FF90
	b _0802B816
	.align 2, 0
_0802B810: .4byte 0x0000FF90
_0802B814:
	ldr r0, _0802B828 @ =0x0000FFA0
_0802B816:
	strh r0, [r2, #0xa]
	movs r0, #0x50
	strh r0, [r2, #0xc]
	bl ZebesianWallSetSideHitboxs
_0802B820:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B828: .4byte 0x0000FFA0

	thumb_func_start ZebesianWallFormingFromX
ZebesianWallFormingFromX: @ 0x0802B82C
	push {lr}
	ldr r3, _0802B854 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #8]
	subs r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0802B860
	ldr r2, _0802B858 @ =gWrittenToMosaic_H
	ldr r1, _0802B85C @ =sXParasiteMosaicValues
	ldrh r0, [r3, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0802B874
	.align 2, 0
_0802B854: .4byte gCurrentSprite
_0802B858: .4byte gWrittenToMosaic_H
_0802B85C: .4byte sXParasiteMosaicValues
_0802B860:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0802B878 @ =0x0000FFDF
	ands r0, r1
	ldr r1, _0802B87C @ =0x00007FFF
	ands r0, r1
	strh r0, [r3]
_0802B874:
	pop {r0}
	bx r0
	.align 2, 0
_0802B878: .4byte 0x0000FFDF
_0802B87C: .4byte 0x00007FFF

	thumb_func_start ZebesianWallDeath
ZebesianWallDeath: @ 0x0802B880
	push {lr}
	sub sp, #0x10
	ldr r2, _0802B89C @ =gCurrentSprite
	ldrh r0, [r2, #2]
	adds r0, #8
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802B8A0
	ldrh r0, [r2, #4]
	subs r0, #0x28
	b _0802B8A4
	.align 2, 0
_0802B89C: .4byte gCurrentSprite
_0802B8A0:
	ldrh r0, [r2, #4]
	adds r0, #0x28
_0802B8A4:
	strh r0, [r2, #4]
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	subs r0, #0x38
	str r0, [sp, #4]
	ldrh r0, [r2, #4]
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start ZebesianWallMovingVerticallyInit
ZebesianWallMovingVerticallyInit: @ 0x0802B8D0
	ldr r0, _0802B8EC @ =gCurrentSprite
	ldr r1, _0802B8F0 @ =sZebesianWallOam_3236e0
	str r1, [r0, #0x18]
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
	adds r2, r0, #0
	adds r2, #0x2e
	movs r1, #0x40
	strb r1, [r2]
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802B8EC: .4byte gCurrentSprite
_0802B8F0: .4byte sZebesianWallOam_3236e0

	thumb_func_start ZebesianWallMoveVertically
ZebesianWallMoveVertically: @ 0x0802B8F4
	push {lr}
	movs r3, #0
	ldr r2, _0802B92C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	beq _0802B930
	ldrh r0, [r1, #6]
	adds r0, #0x80
	ldrh r2, [r1, #2]
	cmp r0, r2
	ble _0802B952
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B952
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	b _0802B954
	.align 2, 0
_0802B92C: .4byte gCurrentSprite
_0802B930:
	ldrh r0, [r1, #6]
	subs r0, #0xc0
	ldrh r2, [r1, #2]
	cmp r0, r2
	bge _0802B952
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B952
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r1, #2]
	b _0802B954
_0802B952:
	movs r3, #1
_0802B954:
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _0802B970
	cmp r3, #0
	beq _0802B978
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	eors r0, r2
	strh r0, [r1]
	b _0802B978
_0802B970:
	cmp r3, #0
	beq _0802B978
	bl unk_2b690
_0802B978:
	pop {r0}
	bx r0

	thumb_func_start ZebesianWallTurningAroundInit
ZebesianWallTurningAroundInit: @ 0x0802B97C
	ldr r1, _0802B990 @ =gCurrentSprite
	ldr r0, _0802B994 @ =sZebesianWallOam_3237d0
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802B990: .4byte gCurrentSprite
_0802B994: .4byte sZebesianWallOam_3237d0

	thumb_func_start ZebesianWallTurningAround
ZebesianWallTurningAround: @ 0x0802B998
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802B9F0
	ldr r3, _0802B9D8 @ =gCurrentSprite
	ldr r0, _0802B9DC @ =sZebesianWallOam_323850
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	movs r2, #0
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldrh r0, [r3]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r3]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802B9E0
	ldrh r0, [r3, #4]
	adds r0, #0x80
	b _0802B9E4
	.align 2, 0
_0802B9D8: .4byte gCurrentSprite
_0802B9DC: .4byte sZebesianWallOam_323850
_0802B9E0:
	ldrh r0, [r3, #4]
	subs r0, #0x80
_0802B9E4:
	strh r0, [r3, #4]
	bl ZebesianWallSetSideHitboxs
	ldr r0, _0802B9F4 @ =0x0000015B
	bl SoundPlayNotAlreadyPlaying
_0802B9F0:
	pop {r0}
	bx r0
	.align 2, 0
_0802B9F4: .4byte 0x0000015B

	thumb_func_start ZebesianWallJumping
ZebesianWallJumping: @ 0x0802B9F8
	push {r4, r5, r6, lr}
	ldr r2, _0802BA28 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r5, [r0]
	ldr r4, _0802BA2C @ =sZebesianWallJumpYVelocity
	lsls r0, r5, #1
	adds r3, r0, r4
	ldr r1, _0802BA30 @ =sZebesianWallJumpXVelocity
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrh r0, [r2, #2]
	ldrh r3, [r3]
	adds r0, r0, r3
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802BA34
	ldrh r0, [r2, #4]
	adds r0, r0, r6
	b _0802BA38
	.align 2, 0
_0802BA28: .4byte gCurrentSprite
_0802BA2C: .4byte sZebesianWallJumpYVelocity
_0802BA30: .4byte sZebesianWallJumpXVelocity
_0802BA34:
	ldrh r0, [r2, #4]
	subs r0, r0, r6
_0802BA38:
	strh r0, [r2, #4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r2, #0
	adds r0, #0x31
	strb r5, [r0]
	lsls r0, r5, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _0802BA60 @ =0x00007FFF
	cmp r1, r0
	bne _0802BA58
	bl unk_2b690
_0802BA58:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802BA60: .4byte 0x00007FFF

	thumb_func_start ZebesianWallIdleInit
ZebesianWallIdleInit: @ 0x0802BA64
	ldr r1, _0802BA78 @ =gCurrentSprite
	ldr r0, _0802BA7C @ =sZebesianWallOam_323728
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802BA78: .4byte gCurrentSprite
_0802BA7C: .4byte sZebesianWallOam_323728

	thumb_func_start ZebesianWallIdle
ZebesianWallIdle: @ 0x0802BA80
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802BA8E
	bl unk_2b690
_0802BA8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianWallShootingInit
ZebesianWallShootingInit: @ 0x0802BA94
	ldr r1, _0802BAA8 @ =gCurrentSprite
	ldr r0, _0802BAAC @ =sZebesianWallOam_323890
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802BAA8: .4byte gCurrentSprite
_0802BAAC: .4byte sZebesianWallOam_323890

	thumb_func_start ZebesianWallShooting
ZebesianWallShooting: @ 0x0802BAB0
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0802BAF8 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0, #0x16]
	cmp r0, #0x13
	bne _0802BB1A
	mov r1, ip
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0802BB1A
	ldrh r1, [r1]
	movs r4, #0x40
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0802BAFC
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x88
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #5
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0802BB1A
	.align 2, 0
_0802BAF8: .4byte gCurrentSprite
_0802BAFC:
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x88
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #5
	movs r1, #0
	bl SpriteSpawnSecondary
_0802BB1A:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802BB26
	bl unk_2b690
_0802BB26:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianBeamInit
ZebesianBeamInit: @ 0x0802BB30
	push {r4, r5, r6, lr}
	ldr r0, _0802BBA0 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r3, _0802BBA4 @ =0x0000FFFB
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
	movs r2, #0x30
	strb r2, [r0]
	ldr r0, _0802BBA8 @ =0x0000FFF8
	mov r6, ip
	strh r0, [r6, #0xa]
	strh r1, [r6, #0xc]
	ldr r0, _0802BBAC @ =sZebesianWallOam_323998
	str r0, [r6, #0x18]
	strb r5, [r6, #0x1c]
	strh r4, [r6, #0x16]
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
	cmp r0, #0
	beq _0802BBB4
	ldr r0, _0802BBB0 @ =0x0000FFD0
	strh r0, [r6, #0xe]
	adds r0, #0x20
	strh r0, [r6, #0x10]
	b _0802BBBC
	.align 2, 0
_0802BBA0: .4byte gCurrentSprite
_0802BBA4: .4byte 0x0000FFFB
_0802BBA8: .4byte 0x0000FFF8
_0802BBAC: .4byte sZebesianWallOam_323998
_0802BBB0: .4byte 0x0000FFD0
_0802BBB4:
	movs r0, #0x10
	mov r1, ip
	strh r0, [r1, #0xe]
	strh r2, [r1, #0x10]
_0802BBBC:
	ldr r0, _0802BBC8 @ =0x0000015D
	bl SoundPlayNotAlreadyPlaying
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802BBC8: .4byte 0x0000015D

	thumb_func_start ZebesianBeamSpawning
ZebesianBeamSpawning: @ 0x0802BBCC
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802BC10
	ldr r2, _0802BBFC @ =gCurrentSprite
	ldr r0, _0802BC00 @ =sZebesianWallOam_3239c0
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802BC08
	ldr r0, _0802BC04 @ =0x0000FFA0
	strh r0, [r2, #0xe]
	adds r0, #0x40
	b _0802BC0E
	.align 2, 0
_0802BBFC: .4byte gCurrentSprite
_0802BC00: .4byte sZebesianWallOam_3239c0
_0802BC04: .4byte 0x0000FFA0
_0802BC08:
	movs r0, #0x20
	strh r0, [r2, #0xe]
	movs r0, #0x60
_0802BC0E:
	strh r0, [r2, #0x10]
_0802BC10:
	pop {r0}
	bx r0

	thumb_func_start ZebesianBeamExtending
ZebesianBeamExtending: @ 0x0802BC14
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802BC58
	ldr r2, _0802BC44 @ =gCurrentSprite
	ldr r0, _0802BC48 @ =sZebesianWallOam_323968
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802BC50
	ldr r0, _0802BC4C @ =0x0000FF60
	strh r0, [r2, #0xe]
	adds r0, #0x80
	b _0802BC56
	.align 2, 0
_0802BC44: .4byte gCurrentSprite
_0802BC48: .4byte sZebesianWallOam_323968
_0802BC4C: .4byte 0x0000FF60
_0802BC50:
	movs r0, #0x20
	strh r0, [r2, #0xe]
	movs r0, #0xa0
_0802BC56:
	strh r0, [r2, #0x10]
_0802BC58:
	pop {r0}
	bx r0

	thumb_func_start ZebesianWall
ZebesianWall: @ 0x0802BC5C
	push {r4, lr}
	ldr r4, _0802BC88 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0802BC76
	movs r0, #0xaf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0802BC76:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802BC8C
	bl SpriteUtilUpdateFreezeTimer
	b _0802BE68
	.align 2, 0
_0802BC88: .4byte gCurrentSprite
_0802BC8C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0802BC98
	b _0802BE68
_0802BC98:
	lsls r0, r0, #2
	ldr r1, _0802BCA4 @ =_0802BCA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802BCA4: .4byte _0802BCA8
_0802BCA8: @ jump table
	.4byte _0802BE18 @ case 0
	.4byte _0802BE1E @ case 1
	.4byte _0802BE22 @ case 2
	.4byte _0802BE68 @ case 3
	.4byte _0802BE68 @ case 4
	.4byte _0802BE68 @ case 5
	.4byte _0802BE68 @ case 6
	.4byte _0802BE38 @ case 7
	.4byte _0802BE3C @ case 8
	.4byte _0802BE68 @ case 9
	.4byte _0802BE68 @ case 10
	.4byte _0802BE68 @ case 11
	.4byte _0802BE68 @ case 12
	.4byte _0802BE68 @ case 13
	.4byte _0802BE68 @ case 14
	.4byte _0802BE68 @ case 15
	.4byte _0802BE68 @ case 16
	.4byte _0802BE68 @ case 17
	.4byte _0802BE68 @ case 18
	.4byte _0802BE68 @ case 19
	.4byte _0802BE68 @ case 20
	.4byte _0802BE68 @ case 21
	.4byte _0802BE68 @ case 22
	.4byte _0802BE68 @ case 23
	.4byte _0802BE68 @ case 24
	.4byte _0802BE28 @ case 25
	.4byte _0802BE2C @ case 26
	.4byte _0802BE68 @ case 27
	.4byte _0802BE32 @ case 28
	.4byte _0802BE68 @ case 29
	.4byte _0802BE68 @ case 30
	.4byte _0802BE68 @ case 31
	.4byte _0802BE68 @ case 32
	.4byte _0802BE68 @ case 33
	.4byte _0802BE68 @ case 34
	.4byte _0802BE68 @ case 35
	.4byte _0802BE68 @ case 36
	.4byte _0802BE68 @ case 37
	.4byte _0802BE68 @ case 38
	.4byte _0802BE68 @ case 39
	.4byte _0802BE68 @ case 40
	.4byte _0802BE42 @ case 41
	.4byte _0802BE46 @ case 42
	.4byte _0802BE68 @ case 43
	.4byte _0802BE68 @ case 44
	.4byte _0802BE68 @ case 45
	.4byte _0802BE68 @ case 46
	.4byte _0802BE68 @ case 47
	.4byte _0802BE68 @ case 48
	.4byte _0802BE68 @ case 49
	.4byte _0802BE68 @ case 50
	.4byte _0802BE68 @ case 51
	.4byte _0802BE68 @ case 52
	.4byte _0802BE68 @ case 53
	.4byte _0802BE68 @ case 54
	.4byte _0802BE68 @ case 55
	.4byte _0802BE68 @ case 56
	.4byte _0802BE68 @ case 57
	.4byte _0802BE68 @ case 58
	.4byte _0802BE68 @ case 59
	.4byte _0802BE68 @ case 60
	.4byte _0802BE68 @ case 61
	.4byte _0802BE68 @ case 62
	.4byte _0802BE68 @ case 63
	.4byte _0802BE68 @ case 64
	.4byte _0802BE68 @ case 65
	.4byte _0802BE68 @ case 66
	.4byte _0802BE68 @ case 67
	.4byte _0802BE68 @ case 68
	.4byte _0802BE68 @ case 69
	.4byte _0802BE68 @ case 70
	.4byte _0802BE68 @ case 71
	.4byte _0802BE68 @ case 72
	.4byte _0802BE68 @ case 73
	.4byte _0802BE68 @ case 74
	.4byte _0802BE68 @ case 75
	.4byte _0802BE68 @ case 76
	.4byte _0802BE68 @ case 77
	.4byte _0802BE68 @ case 78
	.4byte _0802BE68 @ case 79
	.4byte _0802BE68 @ case 80
	.4byte _0802BE68 @ case 81
	.4byte _0802BE68 @ case 82
	.4byte _0802BE68 @ case 83
	.4byte _0802BE68 @ case 84
	.4byte _0802BE68 @ case 85
	.4byte _0802BE68 @ case 86
	.4byte _0802BE4C @ case 87
	.4byte _0802BE50 @ case 88
	.4byte _0802BE56 @ case 89
	.4byte _0802BE5A @ case 90
	.4byte _0802BE60 @ case 91
_0802BE18:
	bl ZebesianWallInit
	b _0802BE68
_0802BE1E:
	bl ZebesianWallMovingVerticallyInit
_0802BE22:
	bl ZebesianWallMoveVertically
	b _0802BE68
_0802BE28:
	bl ZebesianWallTurningAroundInit
_0802BE2C:
	bl ZebesianWallTurningAround
	b _0802BE68
_0802BE32:
	bl ZebesianWallJumping
	b _0802BE68
_0802BE38:
	bl ZebesianWallIdleInit
_0802BE3C:
	bl ZebesianWallIdle
	b _0802BE68
_0802BE42:
	bl ZebesianWallShootingInit
_0802BE46:
	bl ZebesianWallShooting
	b _0802BE68
_0802BE4C:
	bl SpriteDyingInit
_0802BE50:
	bl SpriteDying
	b _0802BE68
_0802BE56:
	bl ZebesianWallInit
_0802BE5A:
	bl ZebesianWallFormingFromX
	b _0802BE68
_0802BE60:
	bl ZebesianWallDeath
	bl XParasiteInit
_0802BE68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianBeam
ZebesianBeam: @ 0x0802BE70
	push {lr}
	ldr r0, _0802BE88 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0802BE98
	cmp r0, #2
	bgt _0802BE8C
	cmp r0, #0
	beq _0802BE92
	b _0802BEA2
	.align 2, 0
_0802BE88: .4byte gCurrentSprite
_0802BE8C:
	cmp r0, #0x18
	beq _0802BE9E
	b _0802BEA2
_0802BE92:
	bl ZebesianBeamInit
	b _0802BEA2
_0802BE98:
	bl ZebesianBeamSpawning
	b _0802BEA2
_0802BE9E:
	bl ZebesianBeamExtending
_0802BEA2:
	ldr r2, _0802BEB4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802BEB8
	ldrh r0, [r2, #4]
	subs r0, #0xa
	b _0802BEBC
	.align 2, 0
_0802BEB4: .4byte gCurrentSprite
_0802BEB8:
	ldrh r0, [r2, #4]
	adds r0, #0xa
_0802BEBC:
	strh r0, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0
