    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SovaCheckCollidingWithAir
SovaCheckCollidingWithAir: @ 0x0803B6AC
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0803B6E0 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B70C
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B6E8
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B6E4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0803B74C
	.align 2, 0
_0803B6E0: .4byte gCurrentSprite
_0803B6E4: .4byte gPreviousCollisionCheck
_0803B6E8:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B708 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803B74C
	.align 2, 0
_0803B708: .4byte gPreviousCollisionCheck
_0803B70C:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B734
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B730 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	ldrh r0, [r4, #2]
	subs r0, #4
	b _0803B748
	.align 2, 0
_0803B730: .4byte gPreviousCollisionCheck
_0803B734:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B760 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	ldrh r0, [r4, #2]
_0803B748:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0803B74C:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803B758
	movs r6, #1
_0803B758:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803B760: .4byte gPreviousCollisionCheck

	thumb_func_start SovaUpdateHitbox
SovaUpdateHitbox: @ 0x0803B764
	push {lr}
	ldr r2, _0803B790 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B7B4
	ldrh r1, [r2]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B79C
	ldr r0, _0803B794 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0803B798 @ =0x0000FFC0
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803B7D4
	.align 2, 0
_0803B790: .4byte gCurrentSprite
_0803B794: .4byte 0x0000FFE4
_0803B798: .4byte 0x0000FFC0
_0803B79C:
	ldr r0, _0803B7AC @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0803B7B0 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	strh r3, [r2, #0x10]
	b _0803B7D6
	.align 2, 0
_0803B7AC: .4byte 0x0000FFE4
_0803B7B0: .4byte 0x0000FFF0
_0803B7B4:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B7C6
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x40
	b _0803B7CC
_0803B7C6:
	ldr r0, _0803B7DC @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r0, #0x10
_0803B7CC:
	strh r0, [r2, #0xc]
	ldr r0, _0803B7E0 @ =0x0000FFE4
	strh r0, [r2, #0xe]
	movs r0, #0x1c
_0803B7D4:
	strh r0, [r2, #0x10]
_0803B7D6:
	pop {r0}
	bx r0
	.align 2, 0
_0803B7DC: .4byte 0x0000FFC0
_0803B7E0: .4byte 0x0000FFE4

	thumb_func_start SovaSetCrawlingOam
SovaSetCrawlingOam: @ 0x0803B7E4
	push {lr}
	ldr r0, _0803B7F8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803B800
	ldr r0, _0803B7FC @ =0x0835335C
	b _0803B816
	.align 2, 0
_0803B7F8: .4byte gCurrentSprite
_0803B7FC: .4byte 0x0835335C
_0803B800:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B814
	ldr r0, _0803B810 @ =0x08353384
	b _0803B816
	.align 2, 0
_0803B810: .4byte 0x08353384
_0803B814:
	ldr r0, _0803B824 @ =0x08353334
_0803B816:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803B824: .4byte 0x08353334

	thumb_func_start SovaTurningIntoX
SovaTurningIntoX: @ 0x0803B828
	push {lr}
	ldr r2, _0803B848 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B854
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B84C
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _0803B86A
	.align 2, 0
_0803B848: .4byte gCurrentSprite
_0803B84C:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _0803B86A
_0803B854:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B864
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _0803B868
_0803B864:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_0803B868:
	strh r0, [r2, #2]
_0803B86A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SovaInit
SovaInit: @ 0x0803B870
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803B8A0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B8A4
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803B8A4
	strh r0, [r2]
	b _0803B9E4
	.align 2, 0
_0803B8A0: .4byte gCurrentSprite
_0803B8A4:
	ldr r1, _0803B8BC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	ldrb r0, [r2]
	adds r4, r1, #0
	cmp r0, #0x59
	bne _0803B8C0
	movs r0, #0x5a
	strb r0, [r2]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0803B9B4
	.align 2, 0
_0803B8BC: .4byte gCurrentSprite
_0803B8C0:
	movs r0, #0
	mov r8, r0
	movs r0, #2
	strb r0, [r2]
	movs r1, #0x2f
	adds r1, r1, r4
	mov sb, r1
	mov r0, r8
	strb r0, [r1]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803B8FC @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	movs r7, #0xf0
	adds r5, r7, #0
	ands r5, r0
	cmp r5, #0
	beq _0803B904
	adds r0, r4, #0
	adds r0, #0x2d
	mov r1, r8
	strb r1, [r0]
	ldr r0, _0803B900 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x46
	b _0803B9A2
	.align 2, 0
_0803B8FC: .4byte gPreviousCollisionCheck
_0803B900: .4byte gSpriteRandomNumber
_0803B904:
	ldrh r0, [r4, #2]
	subs r0, #0x44
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B92C
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
	movs r0, #1
	mov r1, sb
	strb r0, [r1]
	b _0803B99A
_0803B92C:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B968
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	ldr r0, _0803B964 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x1e
	adds r1, #3
	strb r0, [r1]
	b _0803B9B4
	.align 2, 0
_0803B964: .4byte gSpriteRandomNumber
_0803B968:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	adds r2, r7, #0
	ands r2, r0
	cmp r2, #0
	beq _0803B9B0
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	strh r0, [r4, #4]
_0803B99A:
	ldr r0, _0803B9AC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x1e
_0803B9A2:
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	b _0803B9B4
	.align 2, 0
_0803B9AC: .4byte gSpriteRandomNumber
_0803B9B0:
	strh r2, [r4]
	b _0803B9E4
_0803B9B4:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl SovaSetCrawlingOam
	bl SovaUpdateHitbox
	ldr r2, _0803B9F0 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_0803B9E4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B9F0: .4byte sPrimarySpriteStats

	thumb_func_start SovaIdleInit
SovaIdleInit: @ 0x0803B9F4
	push {lr}
	bl SovaSetCrawlingOam
	ldr r0, _0803BA08 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803BA08: .4byte gCurrentSprite

	thumb_func_start SovaIdle
SovaIdle: @ 0x0803BA0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r4, _0803BAC0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803BA24
	b _0803BE98
_0803BA24:
	movs r0, #1
	mov r8, r0
	movs r5, #0
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r0, [r6]
	subs r1, r0, #1
	strb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803BA40
	b _0803BBCC
_0803BA40:
	bl SovaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BA4C
	b _0803BD70
_0803BA4C:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BB08
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803BA90
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x14
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x14
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #1
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	strb r0, [r6]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BA90
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803BA90:
	ldr r4, _0803BAC0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BAC8
	ldrh r0, [r4, #2]
	adds r0, #0x28
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BAC4 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803BAB6
	b _0803BC9E
_0803BAB6:
	ldrh r0, [r4, #2]
	adds r0, #0x28
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803BB70
	.align 2, 0
_0803BAC0: .4byte gCurrentSprite
_0803BAC4: .4byte gPreviousCollisionCheck
_0803BAC8:
	ldrh r0, [r4, #2]
	subs r0, #0x28
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BB04 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803BAE0
	b _0803BC9E
_0803BAE0:
	ldrh r0, [r4, #2]
	subs r0, #0x28
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803BAF8
	b _0803BC9E
_0803BAF8:
	ldrh r0, [r4, #2]
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #2]
	b _0803BE80
	.align 2, 0
_0803BB04: .4byte gPreviousCollisionCheck
_0803BB08:
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803BB42
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x14
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x14
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #1
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	strb r0, [r6]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BB42
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803BB42:
	ldr r4, _0803BB88 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BB90
	ldrh r0, [r4, #2]
	adds r0, #0x28
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BB8C @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803BB6A
	b _0803BC9E
_0803BB6A:
	ldrh r0, [r4, #2]
	adds r0, #0x28
	ldrh r1, [r4, #4]
_0803BB70:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803BB80
	b _0803BC9E
_0803BB80:
	ldrh r0, [r4, #2]
	add r0, r8
	strh r0, [r4, #2]
	b _0803BE80
	.align 2, 0
_0803BB88: .4byte gCurrentSprite
_0803BB8C: .4byte gPreviousCollisionCheck
_0803BB90:
	ldrh r0, [r4, #2]
	subs r0, #0x28
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BBC8 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803BC9E
	ldrh r0, [r4, #2]
	subs r0, #0x28
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803BC9E
	ldrh r0, [r4, #2]
	mov r3, r8
	subs r0, r0, r3
	strh r0, [r4, #2]
	b _0803BE80
	.align 2, 0
_0803BBC8: .4byte gPreviousCollisionCheck
_0803BBCC:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BCB6
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _0803BC0E
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x14
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #1
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	strb r0, [r6]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BC0E
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803BC0E:
	bl SovaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BC28
	ldr r0, _0803BC24 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0803BE98
	.align 2, 0
_0803BC24: .4byte gCurrentSprite
_0803BC28:
	ldr r4, _0803BC68 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BC70
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BC6C @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803BC9E
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803BC9E
	b _0803BD4E
	.align 2, 0
_0803BC68: .4byte gCurrentSprite
_0803BC6C: .4byte gPreviousCollisionCheck
_0803BC70:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BCA8 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803BC9E
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803BCAC
_0803BC9E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0803BE80
	.align 2, 0
_0803BCA8: .4byte gPreviousCollisionCheck
_0803BCAC:
	ldrh r0, [r4, #4]
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #4]
	b _0803BE80
_0803BCB6:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x40
	beq _0803BCC2
	cmp r0, #0x20
	bne _0803BCF0
_0803BCC2:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BD24
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0803BD24
_0803BCF0:
	cmp r0, #0
	bne _0803BD24
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x39
	movs r1, #0
	bl SpriteSpawnSecondary
	movs r0, #0xd2
	strb r0, [r6]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BD24
	movs r0, #0xc7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803BD24:
	bl SpriteUtilAlignYPosOnSlope
	ldr r6, _0803BD58 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r6]
	adds r1, r2, #0
	cmp r1, #0
	bne _0803BD84
	ldr r4, _0803BD5C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BD60
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803BD70
_0803BD4E:
	ldrh r0, [r4, #4]
	add r0, r8
	strh r0, [r4, #4]
	b _0803BE80
	.align 2, 0
_0803BD58: .4byte gPreviousVerticalCollisionCheck
_0803BD5C: .4byte gCurrentSprite
_0803BD60:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803BD7A
_0803BD70:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _0803BE98
_0803BD7A:
	ldrh r0, [r4, #4]
	mov r3, r8
	subs r0, r0, r3
	strh r0, [r4, #4]
	b _0803BE80
_0803BD84:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _0803BE18
	ldr r2, _0803BDD4 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _0803BDD8 @ =0x083533AC
	cmp r1, r0
	bne _0803BDAA
	ldr r0, _0803BDDC @ =0x08353334
	str r0, [r2, #0x18]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BDAA
	ldr r0, _0803BDE0 @ =0x0000FFBF
	ands r0, r1
	strh r0, [r2]
_0803BDAA:
	ldr r4, _0803BDD4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BDE8
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BDE4 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803BE0C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x28
	b _0803BE02
	.align 2, 0
_0803BDD4: .4byte gCurrentSprite
_0803BDD8: .4byte 0x083533AC
_0803BDDC: .4byte 0x08353334
_0803BDE0: .4byte 0x0000FFBF
_0803BDE4: .4byte gPreviousCollisionCheck
_0803BDE8:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x28
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803BE14 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803BE0C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x28
_0803BE02:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _0803BE50
_0803BE0C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0803BE50
	.align 2, 0
_0803BE14: .4byte gPreviousCollisionCheck
_0803BE18:
	cmp r1, #2
	beq _0803BE20
	cmp r1, #4
	bne _0803BE2E
_0803BE20:
	ldr r2, _0803BE68 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _0803BE6C @ =0x08353334
	cmp r1, r0
	bne _0803BE2E
	ldr r0, _0803BE70 @ =0x083533AC
	str r0, [r2, #0x18]
_0803BE2E:
	ldr r0, _0803BE74 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #3
	beq _0803BE3A
	cmp r0, #5
	bne _0803BE50
_0803BE3A:
	ldr r2, _0803BE68 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _0803BE6C @ =0x08353334
	cmp r1, r0
	bne _0803BE50
	ldr r0, _0803BE70 @ =0x083533AC
	str r0, [r2, #0x18]
	ldrh r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r2]
_0803BE50:
	cmp r5, #0
	bne _0803BE84
	ldr r2, _0803BE68 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803BE78
	ldrh r0, [r2, #4]
	add r0, r8
	b _0803BE7E
	.align 2, 0
_0803BE68: .4byte gCurrentSprite
_0803BE6C: .4byte 0x08353334
_0803BE70: .4byte 0x083533AC
_0803BE74: .4byte gPreviousVerticalCollisionCheck
_0803BE78:
	ldrh r0, [r2, #4]
	mov r1, r8
	subs r0, r0, r1
_0803BE7E:
	strh r0, [r2, #4]
_0803BE80:
	cmp r5, #0
	beq _0803BE98
_0803BE84:
	ldr r2, _0803BEA4 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
_0803BE98:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BEA4: .4byte gCurrentSprite

	thumb_func_start SovaTurningAroundInit
SovaTurningAroundInit: @ 0x0803BEA8
	ldr r1, _0803BEBC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803BEBC: .4byte gCurrentSprite

	thumb_func_start SovaTurningAround
SovaTurningAround: @ 0x0803BEC0
	push {lr}
	bl SovaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BEDC
	ldr r0, _0803BED8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0803BEF4
	.align 2, 0
_0803BED8: .4byte gCurrentSprite
_0803BEDC:
	ldr r1, _0803BEF8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803BEF4
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0803BEF4:
	pop {r0}
	bx r0
	.align 2, 0
_0803BEF8: .4byte gCurrentSprite

	thumb_func_start SovaFallingInit
SovaFallingInit: @ 0x0803BEFC
	ldr r1, _0803BF10 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bx lr
	.align 2, 0
_0803BF10: .4byte gCurrentSprite

	thumb_func_start SovaFalling
SovaFalling: @ 0x0803BF14
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _0803BF3C @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BF40
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BF4C
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803BF4C
	.align 2, 0
_0803BF3C: .4byte gCurrentSprite
_0803BF40:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803BF54
_0803BF4C:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0803BF54:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0803BFB0 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803BFC6
	ldr r4, _0803BFB4 @ =gCurrentSprite
	movs r3, #0
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803BF7C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803BF7C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	strb r3, [r2]
	ldrh r1, [r4]
	ldr r0, _0803BFB8 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r3, [r0]
	bl SovaSetCrawlingOam
	bl SovaUpdateHitbox
	cmp r5, #0
	beq _0803C008
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803BFBC
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _0803BFC0
	.align 2, 0
_0803BFB0: .4byte gPreviousVerticalCollisionCheck
_0803BFB4: .4byte gCurrentSprite
_0803BFB8: .4byte 0x0000FEFF
_0803BFBC:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_0803BFC0:
	subs r0, r0, r1
	strh r0, [r4, #4]
	b _0803C008
_0803BFC6:
	ldr r3, _0803BFF0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0803BFF4 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803BFF8 @ =0x00007FFF
	cmp r1, r0
	bne _0803BFFC
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0803C006
	.align 2, 0
_0803BFF0: .4byte gCurrentSprite
_0803BFF4: .4byte sSpritesFallingSpeed
_0803BFF8: .4byte 0x00007FFF
_0803BFFC:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0803C006:
	strh r0, [r3, #2]
_0803C008:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SovaFireInit
SovaFireInit: @ 0x0803C010
	push {r4, lr}
	ldr r0, _0803C084 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803C088 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	movs r1, #8
	strb r1, [r0]
	subs r2, #0xb
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0803C08C @ =0x0000FFD8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r3, [r2, #0xc]
	adds r0, #0x20
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	strb r4, [r2, #0x1c]
	strh r3, [r2, #0x16]
	mov r0, ip
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	mov r1, ip
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	beq _0803C094
	ldr r0, _0803C090 @ =0x0835346C
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x16
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r4, [r0]
	b _0803C0A6
	.align 2, 0
_0803C084: .4byte gCurrentSprite
_0803C088: .4byte 0x0000FFFB
_0803C08C: .4byte 0x0000FFD8
_0803C090: .4byte 0x0835346C
_0803C094:
	ldr r0, _0803C0AC @ =0x083533D4
	mov r1, ip
	str r0, [r1, #0x18]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	adds r1, #0x2e
	movs r0, #0x32
	strb r0, [r1]
_0803C0A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C0AC: .4byte 0x083533D4

	thumb_func_start SovaFireBig
SovaFireBig: @ 0x0803C0B0
	push {lr}
	ldr r2, _0803C0EC @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0803C0E6
	movs r1, #0
	ldr r0, _0803C0F0 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	ldr r0, _0803C0F4 @ =0x083533FC
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r3, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0x32
	mov r1, ip
	strb r0, [r1]
_0803C0E6:
	pop {r0}
	bx r0
	.align 2, 0
_0803C0EC: .4byte gCurrentSprite
_0803C0F0: .4byte 0x0000FFE4
_0803C0F4: .4byte 0x083533FC

	thumb_func_start SovaFireSmall
SovaFireSmall: @ 0x0803C0F8
	push {lr}
	ldr r2, _0803C134 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0803C12E
	movs r1, #0
	ldr r0, _0803C138 @ =0x0000FFF0
	strh r0, [r2, #0xa]
	ldr r0, _0803C13C @ =0x08353424
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r3, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	movs r0, #0x1e
	mov r1, ip
	strb r0, [r1]
_0803C12E:
	pop {r0}
	bx r0
	.align 2, 0
_0803C134: .4byte gCurrentSprite
_0803C138: .4byte 0x0000FFF0
_0803C13C: .4byte 0x08353424

	thumb_func_start SovaFireDisappearing
SovaFireDisappearing: @ 0x0803C140
	push {lr}
	ldr r2, _0803C174 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r1, [r3]
	ands r0, r1
	cmp r0, #0
	bne _0803C160
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_0803C160:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0803C170
	strh r0, [r2]
_0803C170:
	pop {r0}
	bx r0
	.align 2, 0
_0803C174: .4byte gCurrentSprite

	thumb_func_start SovaFireExplodingInit
SovaFireExplodingInit: @ 0x0803C178
	push {lr}
	ldr r1, _0803C1A4 @ =gCurrentSprite
	ldr r0, _0803C1A8 @ =0x08353494
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C19E
	ldr r0, _0803C1AC @ =0x0000018F
	bl SoundPlayNotAlreadyPlaying
_0803C19E:
	pop {r0}
	bx r0
	.align 2, 0
_0803C1A4: .4byte gCurrentSprite
_0803C1A8: .4byte 0x08353494
_0803C1AC: .4byte 0x0000018F

	thumb_func_start SovaFireExploding
SovaFireExploding: @ 0x0803C1B0
	push {r4, lr}
	ldr r4, _0803C1D0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803C1C8
	movs r0, #0
	strh r0, [r4]
_0803C1C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C1D0: .4byte gCurrentSprite

	thumb_func_start Sova
Sova: @ 0x0803C1D4
	push {r4, lr}
	ldr r4, _0803C200 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803C1EE
	movs r0, #0xc8
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803C1EE:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C204
	bl SpriteUtilUpdateFreezeTimer
	b _0803C3D0
	.align 2, 0
_0803C200: .4byte gCurrentSprite
_0803C204:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803C210
	b _0803C3D0
_0803C210:
	lsls r0, r0, #2
	ldr r1, _0803C21C @ =_0803C220
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803C21C: .4byte _0803C220
_0803C220: @ jump table
	.4byte _0803C390 @ case 0
	.4byte _0803C396 @ case 1
	.4byte _0803C39A @ case 2
	.4byte _0803C3D0 @ case 3
	.4byte _0803C3D0 @ case 4
	.4byte _0803C3D0 @ case 5
	.4byte _0803C3D0 @ case 6
	.4byte _0803C3A0 @ case 7
	.4byte _0803C3A4 @ case 8
	.4byte _0803C3D0 @ case 9
	.4byte _0803C3D0 @ case 10
	.4byte _0803C3D0 @ case 11
	.4byte _0803C3D0 @ case 12
	.4byte _0803C3D0 @ case 13
	.4byte _0803C3D0 @ case 14
	.4byte _0803C3D0 @ case 15
	.4byte _0803C3D0 @ case 16
	.4byte _0803C3D0 @ case 17
	.4byte _0803C3D0 @ case 18
	.4byte _0803C3D0 @ case 19
	.4byte _0803C3D0 @ case 20
	.4byte _0803C3AA @ case 21
	.4byte _0803C3AE @ case 22
	.4byte _0803C3D0 @ case 23
	.4byte _0803C3D0 @ case 24
	.4byte _0803C3D0 @ case 25
	.4byte _0803C3D0 @ case 26
	.4byte _0803C3D0 @ case 27
	.4byte _0803C3D0 @ case 28
	.4byte _0803C3D0 @ case 29
	.4byte _0803C3D0 @ case 30
	.4byte _0803C3D0 @ case 31
	.4byte _0803C3D0 @ case 32
	.4byte _0803C3D0 @ case 33
	.4byte _0803C3D0 @ case 34
	.4byte _0803C3D0 @ case 35
	.4byte _0803C3D0 @ case 36
	.4byte _0803C3D0 @ case 37
	.4byte _0803C3D0 @ case 38
	.4byte _0803C3D0 @ case 39
	.4byte _0803C3D0 @ case 40
	.4byte _0803C3D0 @ case 41
	.4byte _0803C3D0 @ case 42
	.4byte _0803C3D0 @ case 43
	.4byte _0803C3D0 @ case 44
	.4byte _0803C3D0 @ case 45
	.4byte _0803C3D0 @ case 46
	.4byte _0803C3D0 @ case 47
	.4byte _0803C3D0 @ case 48
	.4byte _0803C3D0 @ case 49
	.4byte _0803C3D0 @ case 50
	.4byte _0803C3D0 @ case 51
	.4byte _0803C3D0 @ case 52
	.4byte _0803C3D0 @ case 53
	.4byte _0803C3D0 @ case 54
	.4byte _0803C3D0 @ case 55
	.4byte _0803C3D0 @ case 56
	.4byte _0803C3D0 @ case 57
	.4byte _0803C3D0 @ case 58
	.4byte _0803C3D0 @ case 59
	.4byte _0803C3D0 @ case 60
	.4byte _0803C3D0 @ case 61
	.4byte _0803C3D0 @ case 62
	.4byte _0803C3D0 @ case 63
	.4byte _0803C3D0 @ case 64
	.4byte _0803C3D0 @ case 65
	.4byte _0803C3D0 @ case 66
	.4byte _0803C3D0 @ case 67
	.4byte _0803C3D0 @ case 68
	.4byte _0803C3D0 @ case 69
	.4byte _0803C3D0 @ case 70
	.4byte _0803C3D0 @ case 71
	.4byte _0803C3D0 @ case 72
	.4byte _0803C3D0 @ case 73
	.4byte _0803C3D0 @ case 74
	.4byte _0803C3D0 @ case 75
	.4byte _0803C3D0 @ case 76
	.4byte _0803C3D0 @ case 77
	.4byte _0803C3D0 @ case 78
	.4byte _0803C3D0 @ case 79
	.4byte _0803C3D0 @ case 80
	.4byte _0803C3D0 @ case 81
	.4byte _0803C3D0 @ case 82
	.4byte _0803C3D0 @ case 83
	.4byte _0803C3D0 @ case 84
	.4byte _0803C3D0 @ case 85
	.4byte _0803C3D0 @ case 86
	.4byte _0803C3B4 @ case 87
	.4byte _0803C3B8 @ case 88
	.4byte _0803C3BE @ case 89
	.4byte _0803C3C2 @ case 90
	.4byte _0803C3C8 @ case 91
_0803C390:
	bl SovaInit
	b _0803C3D0
_0803C396:
	bl SovaIdleInit
_0803C39A:
	bl SovaIdle
	b _0803C3D0
_0803C3A0:
	bl SovaTurningAroundInit
_0803C3A4:
	bl SovaTurningAround
	b _0803C3D0
_0803C3AA:
	bl SovaFallingInit
_0803C3AE:
	bl SovaFalling
	b _0803C3D0
_0803C3B4:
	bl SpriteDyingInit
_0803C3B8:
	bl SpriteDying
	b _0803C3D0
_0803C3BE:
	bl SovaInit
_0803C3C2:
	bl SpriteSpawningFromX
	b _0803C3D0
_0803C3C8:
	bl SovaTurningIntoX
	bl XParasiteInit
_0803C3D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SovaFire
SovaFire: @ 0x0803C3D8
	push {lr}
	ldr r0, _0803C3F0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1a
	bhi _0803C48A
	lsls r0, r0, #2
	ldr r1, _0803C3F4 @ =_0803C3F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803C3F0: .4byte gCurrentSprite
_0803C3F4: .4byte _0803C3F8
_0803C3F8: @ jump table
	.4byte _0803C464 @ case 0
	.4byte _0803C48A @ case 1
	.4byte _0803C46A @ case 2
	.4byte _0803C48A @ case 3
	.4byte _0803C48A @ case 4
	.4byte _0803C48A @ case 5
	.4byte _0803C48A @ case 6
	.4byte _0803C482 @ case 7
	.4byte _0803C486 @ case 8
	.4byte _0803C48A @ case 9
	.4byte _0803C48A @ case 10
	.4byte _0803C48A @ case 11
	.4byte _0803C48A @ case 12
	.4byte _0803C48A @ case 13
	.4byte _0803C48A @ case 14
	.4byte _0803C48A @ case 15
	.4byte _0803C48A @ case 16
	.4byte _0803C48A @ case 17
	.4byte _0803C48A @ case 18
	.4byte _0803C48A @ case 19
	.4byte _0803C48A @ case 20
	.4byte _0803C48A @ case 21
	.4byte _0803C47C @ case 22
	.4byte _0803C48A @ case 23
	.4byte _0803C470 @ case 24
	.4byte _0803C48A @ case 25
	.4byte _0803C476 @ case 26
_0803C464:
	bl SovaFireInit
	b _0803C48A
_0803C46A:
	bl SovaFireBig
	b _0803C48A
_0803C470:
	bl SovaFireSmall
	b _0803C48A
_0803C476:
	bl SovaFireDisappearing
	b _0803C48A
_0803C47C:
	bl CurrentSpriteFalling
	b _0803C48A
_0803C482:
	bl SovaFireExplodingInit
_0803C486:
	bl SovaFireExploding
_0803C48A:
	pop {r0}
	bx r0
	.align 2, 0
