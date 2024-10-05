    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start YakuzaSyncSubSprites
YakuzaSyncSubSprites: @ 0x0805B814
	push {r4, lr}
	ldr r4, _0805B870 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _0805B874 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _0805B878 @ =0x0879B784
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805B846
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805B846:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B870: .4byte gSubSpriteData1
_0805B874: .4byte gCurrentSprite
_0805B878: .4byte 0x0879B784

	thumb_func_start YakuzaUpdatePalette
YakuzaUpdatePalette: @ 0x0805B87C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805B8A0 @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r2, _0805B8A4 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r4, _0805B8A8 @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _0805B8AC
	cmp r1, #1
	beq _0805B8C4
	b _0805B8D2
	.align 2, 0
_0805B8A0: .4byte gCurrentSprite
_0805B8A4: .4byte sPrimarySpriteStats
_0805B8A8: .4byte gBossWork1
_0805B8AC:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _0805B8D2
	ldr r7, _0805B8C0 @ =0x083B5210
	movs r0, #1
	strb r0, [r4]
	b _0805B8D6
	.align 2, 0
_0805B8C0: .4byte 0x083B5210
_0805B8C4:
	lsrs r0, r0, #2
	cmp r5, r0
	bhi _0805B8D2
	ldr r7, _0805B8EC @ =0x083B5230
	movs r0, #2
	strb r0, [r4]
	movs r6, #1
_0805B8D2:
	cmp r6, #0
	beq _0805B8E4
_0805B8D6:
	ldr r1, _0805B8F0 @ =0x040000D4
	str r7, [r1]
	ldr r0, _0805B8F4 @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _0805B8F8 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0805B8E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B8EC: .4byte 0x083B5230
_0805B8F0: .4byte 0x040000D4
_0805B8F4: .4byte 0x05000300
_0805B8F8: .4byte 0x80000010

	thumb_func_start YakuzaUpdateGrabbedSamus
YakuzaUpdateGrabbedSamus: @ 0x0805B8FC
	push {lr}
	ldr r2, _0805B90C @ =gSamusData
	ldrb r0, [r2, #1]
	cmp r0, #0x40
	beq _0805B910
	movs r0, #0
	b _0805B922
	.align 2, 0
_0805B90C: .4byte gSamusData
_0805B910:
	ldr r0, _0805B928 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	adds r1, #0xc0
	strh r1, [r2, #0x18]
	ldrh r0, [r0, #0xa]
	strh r0, [r2, #0x16]
	bl TakeConstantDamageFromYakuza
	movs r0, #1
_0805B922:
	pop {r1}
	bx r1
	.align 2, 0
_0805B928: .4byte gSubSpriteData1

	thumb_func_start YakuzaCheckCollidingWithRightWall
YakuzaCheckCollidingWithRightWall: @ 0x0805B92C
	push {lr}
	ldr r0, _0805B948 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _0805B94C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xd7
	bhi _0805B950
	movs r0, #0
	b _0805B952
	.align 2, 0
_0805B948: .4byte gSubSpriteData1
_0805B94C: .4byte gBg1XPosition
_0805B950:
	movs r0, #1
_0805B952:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithLeftWall
YakuzaCheckCollidingWithLeftWall: @ 0x0805B958
	push {lr}
	ldr r0, _0805B974 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _0805B978 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x18
	bls _0805B97C
	movs r0, #0
	b _0805B97E
	.align 2, 0
_0805B974: .4byte gSubSpriteData1
_0805B978: .4byte gBg1XPosition
_0805B97C:
	movs r0, #1
_0805B97E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithFloor
YakuzaCheckCollidingWithFloor: @ 0x0805B984
	push {lr}
	ldr r0, _0805B994 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B998 @ =0x0000073E
	cmp r1, r0
	bhi _0805B99C
	movs r0, #0
	b _0805B99E
	.align 2, 0
_0805B994: .4byte gSubSpriteData1
_0805B998: .4byte 0x0000073E
_0805B99C:
	movs r0, #1
_0805B99E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithCeiling
YakuzaCheckCollidingWithCeiling: @ 0x0805B9A4
	push {lr}
	ldr r0, _0805B9B8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x40
	bne _0805B9C4
	ldr r0, _0805B9BC @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B9C0 @ =0x000003FF
	b _0805B9CA
	.align 2, 0
_0805B9B8: .4byte gSamusData
_0805B9BC: .4byte gSubSpriteData1
_0805B9C0: .4byte 0x000003FF
_0805B9C4:
	ldr r0, _0805B9D4 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B9D8 @ =0x000005FF
_0805B9CA:
	cmp r1, r0
	bhi _0805B9DC
	movs r0, #1
	b _0805B9DE
	.align 2, 0
_0805B9D4: .4byte gSubSpriteData1
_0805B9D8: .4byte 0x000005FF
_0805B9DC:
	movs r0, #0
_0805B9DE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaXMovement
YakuzaXMovement: @ 0x0805B9E4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	ldr r0, _0805BA10 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805BA18
	bl YakuzaCheckCollidingWithRightWall
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA2C
	ldr r1, _0805BA14 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, r4, r0
	b _0805BA2A
	.align 2, 0
_0805BA10: .4byte gCurrentSprite
_0805BA14: .4byte gSubSpriteData1
_0805BA18:
	bl YakuzaCheckCollidingWithLeftWall
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA2C
	ldr r1, _0805BA34 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, r0, r5
_0805BA2A:
	strh r0, [r1, #0xa]
_0805BA2C:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805BA34: .4byte gSubSpriteData1

	thumb_func_start YakuzaYMovement
YakuzaYMovement: @ 0x0805BA38
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, r5, #0
	ldr r4, _0805BA64 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805BA7C
	bl YakuzaCheckCollidingWithFloor
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA6C
	ldr r1, _0805BA68 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r5, r0
	b _0805BA8E
	.align 2, 0
_0805BA64: .4byte gCurrentSprite
_0805BA68: .4byte gSubSpriteData1
_0805BA6C:
	ldrh r1, [r4]
	ldr r0, _0805BA78 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r4]
	movs r2, #0
	b _0805BA90
	.align 2, 0
_0805BA78: .4byte 0x0000FBFF
_0805BA7C:
	bl YakuzaCheckCollidingWithCeiling
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA90
	ldr r1, _0805BA98 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	subs r0, r0, r6
_0805BA8E:
	strh r0, [r1, #8]
_0805BA90:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805BA98: .4byte gSubSpriteData1

	thumb_func_start YakuzaGrabbedSamusInit
YakuzaGrabbedSamusInit: @ 0x0805BA9C
	push {lr}
	ldr r1, _0805BAD4 @ =gSubSpriteData1
	ldr r0, _0805BAD8 @ =0x083B0F98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805BADC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x28
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #0xa
	strb r2, [r0]
	ldrh r1, [r3]
	ldr r0, _0805BAE0 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _0805BAE4 @ =0x0000013F
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805BAD4: .4byte gSubSpriteData1
_0805BAD8: .4byte 0x083B0F98
_0805BADC: .4byte gCurrentSprite
_0805BAE0: .4byte 0x0000FBFF
_0805BAE4: .4byte 0x0000013F

	thumb_func_start YakuzaGrabbedSamus
YakuzaGrabbedSamus: @ 0x0805BAE8
	push {r4, r5, r6, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BB04
	ldr r0, _0805BB00 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BB54
	.align 2, 0
_0805BB00: .4byte gCurrentSprite
_0805BB04:
	ldr r6, _0805BB28 @ =gCurrentSprite
	adds r5, r6, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	cmp r4, #0
	bne _0805BB34
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805BB54
	ldr r0, _0805BB2C @ =gSubSpriteData1
	ldr r1, _0805BB30 @ =0x083B1178
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	ldrb r0, [r5]
	adds r0, #1
	b _0805BB52
	.align 2, 0
_0805BB28: .4byte gCurrentSprite
_0805BB2C: .4byte gSubSpriteData1
_0805BB30: .4byte 0x083B1178
_0805BB34:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805BB54
	adds r1, r6, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r1]
	ldr r1, _0805BB5C @ =gSubSpriteData1
	ldr r0, _0805BB60 @ =0x083B1188
	str r0, [r1]
	strb r2, [r1, #6]
	movs r0, #0
	strh r2, [r1, #4]
_0805BB52:
	strb r0, [r5]
_0805BB54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB5C: .4byte gSubSpriteData1
_0805BB60: .4byte 0x083B1188

	thumb_func_start YakuzaPullingSamus
YakuzaPullingSamus: @ 0x0805BB64
	push {r4, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BB80
	ldr r0, _0805BB7C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BC00
	.align 2, 0
_0805BB7C: .4byte gCurrentSprite
_0805BB80:
	ldr r4, _0805BBC4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BBD0
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _0805BBA0
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _0805BBA0
	movs r0, #0x9b
	lsls r0, r0, #1
	bl SoundPlay
_0805BBA0:
	movs r0, #4
	bl YakuzaYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805BC00
	ldr r1, _0805BBC8 @ =gSubSpriteData1
	ldr r0, _0805BBCC @ =0x083B11B0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805BBC4 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0805BC00
	.align 2, 0
_0805BBC4: .4byte gCurrentSprite
_0805BBC8: .4byte gSubSpriteData1
_0805BBCC: .4byte 0x083B11B0
_0805BBD0:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805BC00
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2c
	strb r0, [r1]
	ldr r0, _0805BC08 @ =gSubSpriteData1
	ldr r1, _0805BC0C @ =0x083B11C0
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0805BC00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC08: .4byte gSubSpriteData1
_0805BC0C: .4byte 0x083B11C0

	thumb_func_start YakuzaHoldingSamusHigh
YakuzaHoldingSamusHigh: @ 0x0805BC10
	push {lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BC2C
	ldr r0, _0805BC28 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BC4C
	.align 2, 0
_0805BC28: .4byte gCurrentSprite
_0805BC2C:
	ldr r2, _0805BC50 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805BC4C
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x2e
	strb r1, [r0]
	adds r0, #0xd
	strb r3, [r0]
_0805BC4C:
	pop {r0}
	bx r0
	.align 2, 0
_0805BC50: .4byte gCurrentSprite

	thumb_func_start YakuzaSlammingSamus
YakuzaSlammingSamus: @ 0x0805BC54
	push {r4, r5, r6, r7, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0805BC8C @ =gCurrentSprite
	adds r5, r0, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _0805BC90 @ =0x083B0B3E
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805BC94 @ =0x00007FFF
	cmp r1, r0
	bne _0805BC9C
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _0805BC98 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #8]
	b _0805BCA8
	.align 2, 0
_0805BC8C: .4byte gCurrentSprite
_0805BC90: .4byte 0x083B0B3E
_0805BC94: .4byte 0x00007FFF
_0805BC98: .4byte gSubSpriteData1
_0805BC9C:
	adds r0, r2, #1
	strb r0, [r5]
	ldr r1, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
_0805BCA8:
	cmp r6, #0
	beq _0805BCC4
	ldr r1, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, #0xc0
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805BD1C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805BCC4
	bl TakeDamageFromYakuzaSlamming
_0805BCC4:
	ldr r5, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	adds r0, #0x48
	ldrh r1, [r5, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r4, r0, #0
	ldr r0, _0805BD20 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0805BD12
	adds r0, r4, #0
	subs r0, #0x48
	strh r0, [r5, #8]
	ldr r0, _0805BD24 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldrh r1, [r5, #0xa]
	adds r0, r4, #0
	movs r2, #0x3c
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x3c
	ldrh r1, [r5, #0xa]
	movs r2, #0x3c
	bl ParticleSet
	movs r0, #0x9d
	lsls r0, r0, #1
	bl SoundPlay
_0805BD12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BD18: .4byte gSubSpriteData1
_0805BD1C: .4byte gPreviousCollisionCheck
_0805BD20: .4byte gPreviousVerticalCollisionCheck
_0805BD24: .4byte gCurrentSprite

	thumb_func_start YakuzaReleasingSamusInit
YakuzaReleasingSamusInit: @ 0x0805BD28
	ldr r1, _0805BD40 @ =gSubSpriteData1
	ldr r0, _0805BD44 @ =0x083B0FC0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BD48 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BD40: .4byte gSubSpriteData1
_0805BD44: .4byte 0x083B0FC0
_0805BD48: .4byte gCurrentSprite

	thumb_func_start YakuzaReleasingSamus
YakuzaReleasingSamus: @ 0x0805BD4C
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0805BD5E
	ldr r0, _0805BD64 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #9
	strb r1, [r0]
_0805BD5E:
	pop {r0}
	bx r0
	.align 2, 0
_0805BD64: .4byte gCurrentSprite

	thumb_func_start YakuzaAfterReleasingSamusInit
YakuzaAfterReleasingSamusInit: @ 0x0805BD68
	ldr r1, _0805BD80 @ =gSubSpriteData1
	ldr r0, _0805BD84 @ =0x083B0F28
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BD88 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0xa
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BD80: .4byte gSubSpriteData1
_0805BD84: .4byte 0x083B0F28
_0805BD88: .4byte gCurrentSprite

	thumb_func_start YakuzaAfterReleasingSamus
YakuzaAfterReleasingSamus: @ 0x0805BD8C
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0805BDAA
	ldr r0, _0805BDB0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x25
	movs r1, #0x1c
	strb r1, [r2]
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	bl SpriteUtilMakeSpriteFaceSamusDirection
_0805BDAA:
	pop {r0}
	bx r0
	.align 2, 0
_0805BDB0: .4byte gCurrentSprite

	thumb_func_start YakuzaInit
YakuzaInit: @ 0x0805BDB4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0805BDD0 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _0805BDD8
	ldr r1, _0805BDD4 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0805BEA0
	.align 2, 0
_0805BDD0: .4byte gEquipment
_0805BDD4: .4byte gCurrentSprite
_0805BDD8:
	ldr r0, _0805BEA8 @ =gBossWork1
	strb r6, [r0]
	ldr r0, _0805BEAC @ =gCurrentSprite
	mov ip, r0
	ldr r1, _0805BEB0 @ =0xFFFFFE00
	adds r0, r1, #0
	mov r2, ip
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	movs r5, #0
	mov r1, ip
	strh r0, [r1, #2]
	ldr r4, _0805BEB4 @ =gSubSpriteData1
	strh r0, [r4, #8]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x24
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0805BEB8 @ =0x0000FFC0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x60
	strh r0, [r2, #0xc]
	ldr r0, _0805BEBC @ =0x0000FFB8
	strh r0, [r2, #0xe]
	movs r0, #0x48
	strh r0, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	movs r3, #1
	mov r0, ip
	strb r3, [r0, #0x1e]
	ldr r2, _0805BEC0 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x14]
	strh r3, [r4, #0xc]
	ldr r0, _0805BEC4 @ =0x083B0F28
	str r0, [r4]
	strb r5, [r4, #6]
	strh r6, [r4, #4]
	adds r1, #0x25
	movs r0, #0x1c
	strb r0, [r1]
	mov r2, ip
	ldrh r0, [r2]
	movs r2, #0x90
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x2d
	strb r5, [r0]
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x64
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x64
	movs r1, #2
	movs r2, #0
	bl SpriteSpawnSecondary
_0805BEA0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEA8: .4byte gBossWork1
_0805BEAC: .4byte gCurrentSprite
_0805BEB0: .4byte 0xFFFFFE00
_0805BEB4: .4byte gSubSpriteData1
_0805BEB8: .4byte 0x0000FFC0
_0805BEBC: .4byte 0x0000FFB8
_0805BEC0: .4byte sPrimarySpriteStats
_0805BEC4: .4byte 0x083B0F28

	thumb_func_start YakuzaWaitingToAppear
YakuzaWaitingToAppear: @ 0x0805BEC8
	push {lr}
	ldr r0, _0805BEE8 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805BEEC @ =0x000006FF
	cmp r1, r0
	bls _0805BEE4
	ldr r1, _0805BEF0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x38
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
_0805BEE4:
	pop {r0}
	bx r0
	.align 2, 0
_0805BEE8: .4byte gSamusData
_0805BEEC: .4byte 0x000006FF
_0805BEF0: .4byte gCurrentSprite

	thumb_func_start YakuzaAboutToAppear
YakuzaAboutToAppear: @ 0x0805BEF4
	push {lr}
	ldr r2, _0805BF38 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BF32
	subs r1, #0xa
	movs r0, #7
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0805BF3C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r1, _0805BF40 @ =gBossWork2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805BF44 @ =0x0000012F
	bl unk_3b1c
_0805BF32:
	pop {r0}
	bx r0
	.align 2, 0
_0805BF38: .4byte gCurrentSprite
_0805BF3C: .4byte 0x0000DFFF
_0805BF40: .4byte gBossWork2
_0805BF44: .4byte 0x0000012F

	thumb_func_start YakuzaIdleBeforeNewRoundInit
YakuzaIdleBeforeNewRoundInit: @ 0x0805BF48
	ldr r1, _0805BF68 @ =gSubSpriteData1
	ldr r0, _0805BF6C @ =0x083B0F28
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805BF70 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	adds r1, #0x25
	movs r0, #0x1c
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805BF68: .4byte gSubSpriteData1
_0805BF6C: .4byte 0x083B0F28
_0805BF70: .4byte gCurrentSprite

	thumb_func_start YakuzaIdleBeforeNewRound
YakuzaIdleBeforeNewRound: @ 0x0805BF74
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0805BFA6
	ldr r1, _0805BF9C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0805BFA0
	subs r0, #1
	strb r0, [r2]
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilMakeSpriteFaceSamusDirection
	b _0805BFA6
	.align 2, 0
_0805BF9C: .4byte gCurrentSprite
_0805BFA0:
	adds r1, #0x24
	movs r0, #0x31
	strb r0, [r1]
_0805BFA6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaBeginSweepInit
YakuzaBeginSweepInit: @ 0x0805BFAC
	ldr r1, _0805BFC4 @ =gSubSpriteData1
	ldr r0, _0805BFC8 @ =0x083B0F50
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BFCC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BFC4: .4byte gSubSpriteData1
_0805BFC8: .4byte 0x083B0F50
_0805BFCC: .4byte gCurrentSprite

	thumb_func_start YakuzaBeginSweep
YakuzaBeginSweep: @ 0x0805BFD0
	push {lr}
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805BFEE
	ldr r1, _0805BFF4 @ =gSubSpriteData1
	ldr r0, _0805BFF8 @ =0x083B0F60
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BFFC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
_0805BFEE:
	pop {r0}
	bx r0
	.align 2, 0
_0805BFF4: .4byte gSubSpriteData1
_0805BFF8: .4byte 0x083B0F60
_0805BFFC: .4byte gCurrentSprite

	thumb_func_start YakuzaSweeping
YakuzaSweeping: @ 0x0805C000
	push {r4, lr}
	ldr r1, _0805C050 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0805C018
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0805C018
	movs r0, #0x9b
	lsls r0, r0, #1
	bl SoundPlay
_0805C018:
	movs r0, #3
	bl YakuzaYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C05C
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805C076
	ldr r2, _0805C050 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	movs r3, #0
	movs r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0805C054 @ =gSubSpriteData1
	ldr r1, _0805C058 @ =0x083B0F88
	str r1, [r0]
	strb r3, [r0, #6]
	strh r4, [r0, #4]
	adds r2, #0x24
	movs r0, #0x1a
	strb r0, [r2]
	b _0805C076
	.align 2, 0
_0805C050: .4byte gCurrentSprite
_0805C054: .4byte gSubSpriteData1
_0805C058: .4byte 0x083B0F88
_0805C05C:
	movs r0, #8
	bl YakuzaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C076
	ldr r0, _0805C07C @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_0805C076:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C07C: .4byte gCurrentSprite

	thumb_func_start YakuzaSweepingEnd
YakuzaSweepingEnd: @ 0x0805C080
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0805C092
	ldr r0, _0805C098 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
	strb r1, [r0]
_0805C092:
	pop {r0}
	bx r0
	.align 2, 0
_0805C098: .4byte gCurrentSprite

	thumb_func_start YakuzaOpeningMouthInit
YakuzaOpeningMouthInit: @ 0x0805C09C
	push {lr}
	ldr r1, _0805C0E8 @ =gSubSpriteData1
	ldr r0, _0805C0EC @ =0x083B0FE8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805C0F0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x32
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x40
	strh r0, [r3, #0xc]
	ldr r0, _0805C0F4 @ =0x0000FFDC
	strh r0, [r3, #0xe]
	movs r0, #0x24
	strh r0, [r3, #0x10]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0805C0F8 @ =0x00000137
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805C0E8: .4byte gSubSpriteData1
_0805C0EC: .4byte 0x083B0FE8
_0805C0F0: .4byte gCurrentSprite
_0805C0F4: .4byte 0x0000FFDC
_0805C0F8: .4byte 0x00000137

	thumb_func_start YakuzaOpeningMouth
YakuzaOpeningMouth: @ 0x0805C0FC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, _0805C11C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #6
	bls _0805C110
	b _0805C468
_0805C110:
	lsls r0, r0, #2
	ldr r1, _0805C120 @ =_0805C124
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805C11C: .4byte gCurrentSprite
_0805C120: .4byte _0805C124
_0805C124: @ jump table
	.4byte _0805C140 @ case 0
	.4byte _0805C178 @ case 1
	.4byte _0805C1E8 @ case 2
	.4byte _0805C270 @ case 3
	.4byte _0805C338 @ case 4
	.4byte _0805C3A8 @ case 5
	.4byte _0805C420 @ case 6
_0805C140:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	bne _0805C14A
	b _0805C468
_0805C14A:
	ldr r1, _0805C16C @ =gSubSpriteData1
	ldr r0, _0805C170 @ =0x083B1040
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C174 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x9c
	lsls r0, r0, #1
	bl SoundPlay
	b _0805C468
	.align 2, 0
_0805C16C: .4byte gSubSpriteData1
_0805C170: .4byte 0x083B1040
_0805C174: .4byte gCurrentSprite
_0805C178:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	bne _0805C182
	b _0805C468
_0805C182:
	ldr r1, _0805C1C8 @ =gSubSpriteData1
	ldr r0, _0805C1CC @ =0x083B1050
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r4, _0805C1D0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C1D4 @ =0x083B0B6E
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C1D8 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C1DC @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C1E0 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C1E4 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #0
	adds r0, #0x30
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #3
	b _0805C466
	.align 2, 0
_0805C1C8: .4byte gSubSpriteData1
_0805C1CC: .4byte 0x083B1050
_0805C1D0: .4byte gCurrentSprite
_0805C1D4: .4byte 0x083B0B6E
_0805C1D8: .4byte 0x040000D4
_0805C1DC: .4byte 0x083B52D0
_0805C1E0: .4byte 0x05000320
_0805C1E4: .4byte 0x80000010
_0805C1E8:
	adds r6, r4, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _0805C1FC
	b _0805C468
_0805C1FC:
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	cmp r0, #0x10
	bhi _0805C218
	adds r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldr r1, _0805C214 @ =0x083B0B6E
	ldrb r0, [r5]
	b _0805C3D2
	.align 2, 0
_0805C214: .4byte 0x083B0B6E
_0805C218:
	ldr r1, _0805C254 @ =gSubSpriteData1
	ldr r0, _0805C258 @ =0x083B1060
	str r0, [r1]
	strb r2, [r1, #6]
	movs r3, #0
	strh r2, [r1, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C25C @ =0x083B0B80
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C260 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C264 @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C268 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C26C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	strb r3, [r5]
	movs r0, #4
	strb r0, [r6]
	b _0805C468
	.align 2, 0
_0805C254: .4byte gSubSpriteData1
_0805C258: .4byte 0x083B1060
_0805C25C: .4byte 0x083B0B80
_0805C260: .4byte 0x040000D4
_0805C264: .4byte 0x083B52D0
_0805C268: .4byte 0x05000320
_0805C26C: .4byte 0x80000010
_0805C270:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0805C284
	b _0805C468
_0805C284:
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0xa
	bhi _0805C2A0
	adds r0, #1
	strb r0, [r2]
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0805C29C @ =0x083B0B80
	ldrb r0, [r2]
	b _0805C3D2
	.align 2, 0
_0805C29C: .4byte 0x083B0B80
_0805C2A0:
	ldr r0, _0805C320 @ =gSubSpriteData1
	ldr r1, _0805C324 @ =0x083B1078
	str r1, [r0]
	strb r5, [r0, #6]
	strh r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x94
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7e
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x9c
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7e
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x9c
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0x7e
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnSecondary
	ldr r1, _0805C328 @ =gBossWork2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805C32C
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x3f
	movs r1, #7
	bl PlayMusic
	movs r0, #0x98
	lsls r0, r0, #1
	bl unk_3b1c
	b _0805C468
	.align 2, 0
_0805C320: .4byte gSubSpriteData1
_0805C324: .4byte 0x083B1078
_0805C328: .4byte gBossWork2
_0805C32C:
	ldr r0, _0805C334 @ =0x00000139
	bl SoundPlay
	b _0805C468
	.align 2, 0
_0805C334: .4byte 0x00000139
_0805C338:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	bne _0805C342
	b _0805C468
_0805C342:
	ldr r1, _0805C388 @ =gSubSpriteData1
	ldr r0, _0805C38C @ =0x083B1050
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r4, _0805C390 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C394 @ =0x083B0B8C
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C398 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C39C @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C3A0 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C3A4 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #0
	adds r0, #0x30
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #2
	b _0805C466
	.align 2, 0
_0805C388: .4byte gSubSpriteData1
_0805C38C: .4byte 0x083B1050
_0805C390: .4byte gCurrentSprite
_0805C394: .4byte 0x083B0B8C
_0805C398: .4byte 0x040000D4
_0805C39C: .4byte 0x083B52D0
_0805C3A0: .4byte 0x05000320
_0805C3A4: .4byte 0x80000010
_0805C3A8:
	adds r1, r4, #0
	adds r5, r1, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805C468
	adds r3, r1, #0
	adds r3, #0x30
	ldrb r0, [r3]
	cmp r0, #5
	bhi _0805C404
	adds r0, #1
	strb r0, [r3]
	movs r0, #2
	strb r0, [r5]
	ldr r1, _0805C3F0 @ =0x083B0B8C
	ldrb r0, [r3]
_0805C3D2:
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C3F4 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C3F8 @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C3FC @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C400 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0805C468
	.align 2, 0
_0805C3F0: .4byte 0x083B0B8C
_0805C3F4: .4byte 0x040000D4
_0805C3F8: .4byte 0x083B52D0
_0805C3FC: .4byte 0x05000320
_0805C400: .4byte 0x80000010
_0805C404:
	ldr r0, _0805C418 @ =gSubSpriteData1
	ldr r1, _0805C41C @ =0x083B10A0
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	b _0805C466
	.align 2, 0
_0805C418: .4byte gSubSpriteData1
_0805C41C: .4byte 0x083B10A0
_0805C420:
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0805C468
	ldr r2, _0805C458 @ =sPrimarySpriteStats
	ldr r3, _0805C45C @ =gCurrentSprite
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r1, r0, #1
	ldrh r0, [r3, #0x14]
	cmp r0, r1
	bhs _0805C460
	strh r1, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	b _0805C468
	.align 2, 0
_0805C458: .4byte sPrimarySpriteStats
_0805C45C: .4byte gCurrentSprite
_0805C460:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1b
_0805C466:
	strb r0, [r1]
_0805C468:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start YakuzaMouthOpenedInit
YakuzaMouthOpenedInit: @ 0x0805C470
	ldr r1, _0805C490 @ =gSubSpriteData1
	ldr r0, _0805C494 @ =0x083B1000
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C498 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805C490: .4byte gSubSpriteData1
_0805C494: .4byte 0x083B1000
_0805C498: .4byte gCurrentSprite

	thumb_func_start YakuzaMouthOpened
YakuzaMouthOpened: @ 0x0805C49C
	push {lr}
	ldr r1, _0805C4BC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C4B6
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
_0805C4B6:
	pop {r0}
	bx r0
	.align 2, 0
_0805C4BC: .4byte gCurrentSprite

	thumb_func_start YakuzaClosingMouthInit
YakuzaClosingMouthInit: @ 0x0805C4C0
	ldr r1, _0805C4F0 @ =gSubSpriteData1
	ldr r0, _0805C4F4 @ =0x083B1028
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C4F8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1e
	strb r0, [r2]
	movs r0, #0x60
	strh r0, [r1, #0xc]
	ldr r0, _0805C4FC @ =0x0000FFB8
	strh r0, [r1, #0xe]
	movs r0, #0x48
	strh r0, [r1, #0x10]
	adds r1, #0x34
	ldrb r2, [r1]
	movs r0, #0x40
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805C4F0: .4byte gSubSpriteData1
_0805C4F4: .4byte 0x083B1028
_0805C4F8: .4byte gCurrentSprite
_0805C4FC: .4byte 0x0000FFB8

	thumb_func_start YakuzaClosingMouth
YakuzaClosingMouth: @ 0x0805C500
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0805C520
	ldr r1, _0805C524 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	ldr r0, _0805C528 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #2
	adds r0, #1
	adds r1, #0x2d
	strb r0, [r1]
_0805C520:
	pop {r0}
	bx r0
	.align 2, 0
_0805C524: .4byte gCurrentSprite
_0805C528: .4byte gSpriteRandomNumber

	thumb_func_start YakuzaPhase1DyingInit
YakuzaPhase1DyingInit: @ 0x0805C52C
	push {lr}
	ldr r3, _0805C560 @ =gSubSpriteData1
	ldr r0, _0805C564 @ =0x083B10B0
	str r0, [r3]
	movs r0, #0
	strb r0, [r3, #6]
	strh r0, [r3, #4]
	ldr r1, _0805C568 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x20
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #0xa]
	movs r2, #0x2f
	bl ParticleSet
	movs r0, #0x99
	lsls r0, r0, #1
	bl unk_3b1c
	pop {r0}
	bx r0
	.align 2, 0
_0805C560: .4byte gSubSpriteData1
_0805C564: .4byte 0x083B10B0
_0805C568: .4byte gCurrentSprite

	thumb_func_start YakuzaPhase1Dying
YakuzaPhase1Dying: @ 0x0805C56C
	push {lr}
	ldr r2, _0805C5D0 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805C5D4 @ =0x0000063E
	cmp r1, r0
	bhi _0805C57C
	adds r0, r1, #4
	strh r0, [r2, #8]
_0805C57C:
	ldr r2, _0805C5D8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805C5AC
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805C5A6
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805C5A6:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_0805C5AC:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805C5CA
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x21
	strb r1, [r0]
	subs r0, #4
	strb r3, [r0]
_0805C5CA:
	pop {r0}
	bx r0
	.align 2, 0
_0805C5D0: .4byte gSubSpriteData1
_0805C5D4: .4byte 0x0000063E
_0805C5D8: .4byte gCurrentSprite

	thumb_func_start YakuzaUpdateHitboxAndImmunity
YakuzaUpdateHitboxAndImmunity: @ 0x0805C5DC
	push {lr}
	ldr r2, _0805C600 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805C608
	ldr r1, _0805C604 @ =0x0000FF80
	strh r1, [r2, #0xa]
	movs r0, #0x80
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	b _0805C61E
	.align 2, 0
_0805C600: .4byte gCurrentSprite
_0805C604: .4byte 0x0000FF80
_0805C608:
	ldr r0, _0805C624 @ =0x0000FF80
	strh r0, [r2, #0xa]
	movs r1, #0x40
	strh r1, [r2, #0xc]
	adds r0, #0x40
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
_0805C61E:
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0805C624: .4byte 0x0000FF80

	thumb_func_start YakuzaLosingLegsInit
YakuzaLosingLegsInit: @ 0x0805C628
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r2, _0805C684 @ =gSubSpriteData1
	ldr r0, _0805C688 @ =0x083B1128
	str r0, [r2]
	movs r3, #0
	strb r3, [r2, #6]
	movs r5, #0
	strh r3, [r2, #4]
	ldr r4, _0805C68C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, #0xe2
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r5, [r0]
	ldr r0, _0805C690 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	adds r1, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	strh r3, [r2, #0xc]
	ldr r0, _0805C694 @ =gSamusData
	ldrh r0, [r0, #0x16]
	adds r3, r4, #0
	ldrh r2, [r2, #0xa]
	cmp r0, r2
	bhs _0805C69C
	ldrh r1, [r3]
	ldr r0, _0805C698 @ =0x0000FDFF
	ands r0, r1
	b _0805C6A6
	.align 2, 0
_0805C684: .4byte gSubSpriteData1
_0805C688: .4byte 0x083B1128
_0805C68C: .4byte gCurrentSprite
_0805C690: .4byte gSpriteRandomNumber
_0805C694: .4byte gSamusData
_0805C698: .4byte 0x0000FDFF
_0805C69C:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
_0805C6A6:
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov sb, r0
	ldrh r6, [r3, #2]
	ldrh r3, [r3, #4]
	mov r8, r3
	adds r7, r6, #0
	subs r7, #0x10
	str r7, [sp]
	mov r4, r8
	subs r4, #0x40
	str r4, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #0
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	movs r0, #0x20
	rsbs r0, r0, #0
	adds r0, r0, r6
	mov sl, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #1
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	subs r6, #0x40
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #2
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	str r7, [sp]
	movs r2, #0x40
	add r8, r2
	mov r0, r8
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #3
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	mov r2, sl
	str r2, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #4
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	str r6, [sp]
	mov r2, r8
	str r2, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #5
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaLosingLegs
YakuzaLosingLegs: @ 0x0805C754
	push {lr}
	ldr r1, _0805C778 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C76E
	adds r1, #0x24
	movs r0, #0x24
	strb r0, [r1]
_0805C76E:
	bl YakuzaUpdateHitboxAndImmunity
	pop {r0}
	bx r0
	.align 2, 0
_0805C778: .4byte gCurrentSprite

	thumb_func_start YakuzaPhase2Init
YakuzaPhase2Init: @ 0x0805C77C
	push {lr}
	ldr r3, _0805C7A4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x24
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldr r0, _0805C7A8 @ =gSamusData
	ldr r1, _0805C7AC @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bhs _0805C7B4
	ldrh r1, [r3]
	ldr r0, _0805C7B0 @ =0x0000FDFF
	ands r0, r1
	b _0805C7BE
	.align 2, 0
_0805C7A4: .4byte gCurrentSprite
_0805C7A8: .4byte gSamusData
_0805C7AC: .4byte gSubSpriteData1
_0805C7B0: .4byte 0x0000FDFF
_0805C7B4:
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
_0805C7BE:
	strh r0, [r3]
	pop {r0}
	bx r0

	thumb_func_start YakuzaPhase2
YakuzaPhase2: @ 0x0805C7C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r0, #0
	mov r8, r0
	ldr r4, _0805C81C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r6, [r0]
	subs r0, #4
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bhi _0805C85E
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0805C85E
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0805C832
	ldr r5, _0805C820 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805C824 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0805C82C
	ldrh r1, [r4]
	ldr r0, _0805C828 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	b _0805C85E
	.align 2, 0
_0805C81C: .4byte gCurrentSprite
_0805C820: .4byte gSubSpriteData1
_0805C824: .4byte gPreviousCollisionCheck
_0805C828: .4byte 0x0000FDFF
_0805C82C:
	ldrh r0, [r5, #0xa]
	adds r0, r0, r6
	b _0805C85C
_0805C832:
	ldr r5, _0805C850 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805C854 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0805C858
	ldrh r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r4]
	b _0805C85E
	.align 2, 0
_0805C850: .4byte gSubSpriteData1
_0805C854: .4byte gPreviousCollisionCheck
_0805C858:
	ldrh r0, [r5, #0xa]
	subs r0, r0, r6
_0805C85C:
	strh r0, [r5, #0xa]
_0805C85E:
	ldr r0, _0805C8A4 @ =0x083B0B94
	ldr r1, _0805C8A8 @ =gCurrentSprite
	mov ip, r1
	mov r4, ip
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	cmp r2, #0x3e
	bhi _0805C87E
	adds r0, r3, #1
	strb r0, [r4]
_0805C87E:
	ldr r4, _0805C8AC @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, r0, r6
	movs r3, #0
	strh r0, [r4, #8]
	lsls r0, r6, #0x10
	cmp r0, #0
	bgt _0805C890
	b _0805CA6C
_0805C890:
	mov r2, ip
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0805C8B0
	adds r0, #0x20
	strb r0, [r2]
	b _0805C8F0
	.align 2, 0
_0805C8A4: .4byte 0x083B0B94
_0805C8A8: .4byte gCurrentSprite
_0805C8AC: .4byte gSubSpriteData1
_0805C8B0:
	mov r0, ip
	ldrh r2, [r0]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0805C8F0
	ldr r0, _0805C924 @ =0x083B1128
	str r0, [r4]
	strb r3, [r4, #6]
	strh r1, [r4, #4]
	ldr r0, _0805C928 @ =0x0000FFF7
	ands r0, r2
	mov r2, ip
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	adds r0, #0x94
	str r0, [sp]
	ldrh r0, [r2, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x7e
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	lsls r0, r0, #1
	bl SoundPlay
_0805C8F0:
	ldr r4, _0805C92C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x80
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0805C930 @ =gPreviousVerticalCollisionCheck
	ldrb r5, [r0]
	cmp r5, #0
	beq _0805C938
	adds r0, r1, #0
	subs r0, #0x80
	movs r1, #0
	strh r0, [r4, #8]
	ldr r2, _0805C934 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x31
	strb r1, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	b _0805CA00
	.align 2, 0
_0805C924: .4byte 0x083B1128
_0805C928: .4byte 0x0000FFF7
_0805C92C: .4byte gSubSpriteData1
_0805C930: .4byte gPreviousVerticalCollisionCheck
_0805C934: .4byte gCurrentSprite
_0805C938:
	ldr r0, _0805CA1C @ =gSamusData
	ldrh r0, [r0, #0x18]
	ldrh r3, [r4, #8]
	cmp r0, r3
	bhs _0805C952
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r0, #0x31
	strb r5, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C952:
	ldrh r0, [r4, #8]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CA24 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805C99A
	ldr r0, _0805CA28 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #8
	beq _0805C97E
	ldr r0, _0805CA20 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0805C99A
_0805C97E:
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x31
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C998
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C998:
	strb r5, [r2]
_0805C99A:
	ldr r1, _0805CA2C @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, #0xe0
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CA24 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805C9D4
	ldr r0, _0805CA28 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _0805C9D4
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x31
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C9D0
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C9D0:
	movs r0, #0
	strb r0, [r2]
_0805C9D4:
	ldr r2, _0805CA20 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _0805CA00
	ldr r0, _0805CA2C @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805CA30 @ =0x0000057E
	cmp r1, r0
	bls _0805CA00
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
_0805CA00:
	mov r3, r8
	cmp r3, #0
	beq _0805CA50
	ldr r0, _0805CA1C @ =gSamusData
	ldr r1, _0805CA2C @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bhs _0805CA38
	ldrh r1, [r2]
	ldr r0, _0805CA34 @ =0x0000FDFF
	ands r0, r1
	b _0805CA42
	.align 2, 0
_0805CA1C: .4byte gSamusData
_0805CA20: .4byte gCurrentSprite
_0805CA24: .4byte gPreviousCollisionCheck
_0805CA28: .4byte gSpriteRandomNumber
_0805CA2C: .4byte gSubSpriteData1
_0805CA30: .4byte 0x0000057E
_0805CA34: .4byte 0x0000FDFF
_0805CA38:
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r1
_0805CA42:
	strh r0, [r2]
	ldr r0, _0805CA64 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r2, #0
	adds r1, #0x30
	strb r0, [r1]
_0805CA50:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CAB8
	ldr r0, _0805CA68 @ =0x0000013B
	bl SoundPlay
	b _0805CAB8
	.align 2, 0
_0805CA64: .4byte gSpriteRandomNumber
_0805CA68: .4byte 0x0000013B
_0805CA6C:
	mov r1, ip
	ldrh r0, [r1]
	ldr r2, _0805CAC8 @ =0x00004008
	adds r1, r2, #0
	orrs r0, r1
	mov r3, ip
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #0x80
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CACC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CA9E
	ldrh r1, [r4, #8]
	ldr r0, _0805CAD0 @ =0x0000057E
	cmp r1, r0
	bhi _0805CAA4
_0805CA9E:
	ldrh r0, [r4, #8]
	subs r0, r0, r6
	strh r0, [r4, #8]
_0805CAA4:
	ldr r0, _0805CAD4 @ =gCurrentSprite
	adds r0, #0x31
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0805CAB8
	ldr r0, _0805CAD8 @ =0x0000013B
	bl SoundPlay
_0805CAB8:
	bl YakuzaUpdateHitboxAndImmunity
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CAC8: .4byte 0x00004008
_0805CACC: .4byte gPreviousCollisionCheck
_0805CAD0: .4byte 0x0000057E
_0805CAD4: .4byte gCurrentSprite
_0805CAD8: .4byte 0x0000013B

	thumb_func_start YakuzaPhase2DyingInit
YakuzaPhase2DyingInit: @ 0x0805CADC
	push {r4, lr}
	ldr r1, _0805CB24 @ =gSubSpriteData1
	ldr r0, _0805CB28 @ =0x083B1160
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805CB2C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x48
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0805CB30 @ =0x0000BFFF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #7
	strb r2, [r0]
	subs r0, #0xc
	strb r2, [r0]
	movs r0, #1
	strh r0, [r3, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB24: .4byte gSubSpriteData1
_0805CB28: .4byte 0x083B1160
_0805CB2C: .4byte gCurrentSprite
_0805CB30: .4byte 0x0000BFFF

	thumb_func_start YakuzaPhase2Dying
YakuzaPhase2Dying: @ 0x0805CB34
	push {r4, lr}
	ldr r1, _0805CB6C @ =gSubSpriteData1
	ldrh r2, [r1, #8]
	ldr r0, _0805CB70 @ =0x0000063E
	cmp r2, r0
	bhi _0805CB44
	adds r0, r2, #4
	strh r0, [r1, #8]
_0805CB44:
	ldrh r2, [r1, #8]
	ldrh r3, [r1, #0xa]
	ldr r1, _0805CB74 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r1
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r4, ip
	strb r0, [r4]
	ldrb r0, [r4]
	adds r4, r1, #0
	cmp r0, #0x28
	bls _0805CB62
	b _0805CC9C
_0805CB62:
	lsls r0, r0, #2
	ldr r1, _0805CB78 @ =_0805CB7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805CB6C: .4byte gSubSpriteData1
_0805CB70: .4byte 0x0000063E
_0805CB74: .4byte gCurrentSprite
_0805CB78: .4byte _0805CB7C
_0805CB7C: @ jump table
	.4byte _0805CC94 @ case 0
	.4byte _0805CC9C @ case 1
	.4byte _0805CC9C @ case 2
	.4byte _0805CC9C @ case 3
	.4byte _0805CC9C @ case 4
	.4byte _0805CC86 @ case 5
	.4byte _0805CC9C @ case 6
	.4byte _0805CC9C @ case 7
	.4byte _0805CC9C @ case 8
	.4byte _0805CC9C @ case 9
	.4byte _0805CC76 @ case 10
	.4byte _0805CC9C @ case 11
	.4byte _0805CC9C @ case 12
	.4byte _0805CC9C @ case 13
	.4byte _0805CC9C @ case 14
	.4byte _0805CC66 @ case 15
	.4byte _0805CC9C @ case 16
	.4byte _0805CC9C @ case 17
	.4byte _0805CC9C @ case 18
	.4byte _0805CC9C @ case 19
	.4byte _0805CC56 @ case 20
	.4byte _0805CC9C @ case 21
	.4byte _0805CC9C @ case 22
	.4byte _0805CC9C @ case 23
	.4byte _0805CC9C @ case 24
	.4byte _0805CC4C @ case 25
	.4byte _0805CC9C @ case 26
	.4byte _0805CC9C @ case 27
	.4byte _0805CC9C @ case 28
	.4byte _0805CC9C @ case 29
	.4byte _0805CC42 @ case 30
	.4byte _0805CC9C @ case 31
	.4byte _0805CC9C @ case 32
	.4byte _0805CC9C @ case 33
	.4byte _0805CC9C @ case 34
	.4byte _0805CC38 @ case 35
	.4byte _0805CC9C @ case 36
	.4byte _0805CC9C @ case 37
	.4byte _0805CC9C @ case 38
	.4byte _0805CC9C @ case 39
	.4byte _0805CC20 @ case 40
_0805CC20:
	adds r0, r2, #0
	subs r0, #0x40
	adds r1, r3, #0
	subs r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	movs r0, #0x9a
	lsls r0, r0, #1
	bl unk_3b1c
	b _0805CC9C
_0805CC38:
	adds r0, r2, #0
	adds r0, #0x20
	adds r1, r3, #0
	subs r1, #0x10
	b _0805CC7E
_0805CC42:
	adds r0, r2, #0
	subs r0, #0x20
	adds r1, r3, #0
	adds r1, #0x1c
	b _0805CC6E
_0805CC4C:
	adds r0, r2, #0
	adds r0, #0x40
	adds r1, r3, #0
	adds r1, #0x20
	b _0805CC7E
_0805CC56:
	adds r0, r2, #0
	subs r0, #0x20
	adds r1, r3, #0
	subs r1, #0x10
	movs r2, #0x26
	bl ParticleSet
	b _0805CC9C
_0805CC66:
	adds r0, r2, #0
	adds r0, #0x40
	adds r1, r3, #0
	subs r1, #0x10
_0805CC6E:
	movs r2, #0x2f
	bl ParticleSet
	b _0805CC9C
_0805CC76:
	adds r0, r2, #0
	subs r0, #0x40
	adds r1, r3, #0
	adds r1, #0x1c
_0805CC7E:
	movs r2, #0x25
	bl ParticleSet
	b _0805CC9C
_0805CC86:
	adds r0, r2, #0
	adds r0, #0x10
	adds r1, r3, #0
	movs r2, #0x3a
	bl ParticleSet
	b _0805CC9C
_0805CC94:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
_0805CC9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaTurningIntoCoreXInit
YakuzaTurningIntoCoreXInit: @ 0x0805CCA4
	ldr r1, _0805CCBC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x4a
	strb r0, [r2]
	ldrh r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x2c
	strh r0, [r1, #6]
	bx lr
	.align 2, 0
_0805CCBC: .4byte gCurrentSprite

	thumb_func_start YakuzaTurningIntoCoreX
YakuzaTurningIntoCoreX: @ 0x0805CCC0
	push {lr}
	ldr r2, _0805CCEC @ =gWrittenToMosaic_H
	ldr r1, _0805CCF0 @ =sXParasiteMosaicValues
	ldr r3, _0805CCF4 @ =gCurrentSprite
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _0805CCF8
	ldrh r2, [r3, #6]
	movs r0, #0x47
	movs r1, #0
	bl SpriteLoadGfx
	b _0805CD06
	.align 2, 0
_0805CCEC: .4byte gWrittenToMosaic_H
_0805CCF0: .4byte sXParasiteMosaicValues
_0805CCF4: .4byte gCurrentSprite
_0805CCF8:
	cmp r0, #0x14
	bne _0805CD06
	movs r0, #0x47
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0805CD06:
	ldr r2, _0805CD20 @ =gCurrentSprite
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _0805CD1A
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x47
	strb r0, [r2, #0x1d]
_0805CD1A:
	pop {r0}
	bx r0
	.align 2, 0
_0805CD20: .4byte gCurrentSprite

	thumb_func_start YakuzaPartInit
YakuzaPartInit: @ 0x0805CD24
	push {r4, r5, lr}
	ldr r2, _0805CD4C @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _0805CD50 @ =0x0000FFFB
	ands r0, r1
	movs r5, #0
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrb r4, [r2, #0x1e]
	adds r3, r2, #0
	cmp r4, #0
	beq _0805CD54
	cmp r4, #2
	beq _0805CD9C
	movs r0, #0
	strh r0, [r3]
	b _0805CDD2
	.align 2, 0
_0805CD4C: .4byte gCurrentSprite
_0805CD50: .4byte 0x0000FFFB
_0805CD54:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xb
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805CD98 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r2, #4
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	orrs r0, r2
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	subs r0, #0xa
	strb r5, [r0]
	b _0805CDD2
	.align 2, 0
_0805CD98: .4byte 0x0000FFFC
_0805CD9C:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _0805CDE8 @ =0x0000FF80
	strh r0, [r3, #0xa]
	movs r0, #0x10
	strh r0, [r3, #0xc]
	ldr r0, _0805CDEC @ =0x0000FF60
	strh r0, [r3, #0xe]
	movs r0, #0xa0
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r0, #1
	strh r0, [r3, #0x14]
_0805CDD2:
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r3]
	bl YakuzaSyncSubSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CDE8: .4byte 0x0000FF80
_0805CDEC: .4byte 0x0000FF60

	thumb_func_start YakuzaPartLegsIdle
YakuzaPartLegsIdle: @ 0x0805CDF0
	push {r4, r5, r6, lr}
	ldr r1, _0805CE34 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r4, [r1]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r0, r4
	adds r2, r1, #0
	ldr r6, _0805CE38 @ =gSpriteData
	cmp r0, #0
	beq _0805CE24
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0805CE64
	ldr r0, _0805CE3C @ =0x0000DFFF
	ands r0, r4
	strh r0, [r2]
_0805CE24:
	ldr r0, _0805CE40 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x40
	bne _0805CE44
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
	b _0805CE4A
	.align 2, 0
_0805CE34: .4byte gCurrentSprite
_0805CE38: .4byte gSpriteData
_0805CE3C: .4byte 0x0000DFFF
_0805CE40: .4byte gSamusData
_0805CE44:
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #2
_0805CE4A:
	strb r0, [r1]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0x60
	bne _0805CE60
	movs r0, #0x10
	b _0805CE62
_0805CE60:
	movs r0, #0x2c
_0805CE62:
	strh r0, [r2, #0xc]
_0805CE64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPartLegsDead
YakuzaPartLegsDead: @ 0x0805CE6C
	push {r4, r5, lr}
	ldr r3, _0805CE90 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0805CE94 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805CE98
	movs r0, #0
	strh r0, [r3]
	b _0805CEC6
	.align 2, 0
_0805CE90: .4byte gCurrentSprite
_0805CE94: .4byte gSpriteData
_0805CE98:
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r5, #0
	adds r2, r0, #0
	orrs r2, r1
	strh r2, [r3]
	ldrh r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805CEC0
	movs r0, #4
	orrs r2, r0
	b _0805CEC4
_0805CEC0:
	ldr r0, _0805CECC @ =0x0000FFFB
	ands r2, r0
_0805CEC4:
	strh r2, [r3]
_0805CEC6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CECC: .4byte 0x0000FFFB

	thumb_func_start YakuzaPartEyeIdle
YakuzaPartEyeIdle: @ 0x0805CED0
	push {r4, r5, r6, r7, lr}
	ldr r4, _0805CF08 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	adds r0, #3
	movs r7, #1
	strb r7, [r0]
	ldr r2, _0805CF0C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805CF10
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	b _0805CFF4
	.align 2, 0
_0805CF08: .4byte gCurrentSprite
_0805CF0C: .4byte gSpriteData
_0805CF10:
	ldrh r3, [r4]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r0, r3
	cmp r0, #0
	beq _0805CF2C
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0805CFF8
	ldr r0, _0805CF70 @ =0x0000DFFF
	ands r0, r3
	strh r0, [r4]
_0805CF2C:
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r6, r4, #0
	adds r6, #0x2f
	ldrb r5, [r6]
	adds r3, r5, #0
	cmp r3, #0
	bne _0805CFC0
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _0805CF7C
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	adds r0, r5, #1
	strb r0, [r6]
	ldr r0, _0805CF74 @ =0x083B7240
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805CF78 @ =0x0000FFFB
	ands r0, r1
	b _0805CFF6
	.align 2, 0
_0805CF70: .4byte 0x0000DFFF
_0805CF74: .4byte 0x083B7240
_0805CF78: .4byte 0x0000FFFB
_0805CF7C:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #7
	beq _0805CF8A
	cmp r0, #9
	bne _0805CFF8
_0805CF8A:
	ldr r0, _0805CFB4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bhi _0805CFF8
	adds r0, r7, #0
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x2e
	strb r0, [r1]
	adds r0, r5, #1
	strb r0, [r6]
	ldr r0, _0805CFB8 @ =0x083B7240
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805CFBC @ =0x0000FFFB
	ands r0, r1
	b _0805CFF6
	.align 2, 0
_0805CFB4: .4byte gSpriteRandomNumber
_0805CFB8: .4byte 0x083B7240
_0805CFBC: .4byte 0x0000FFFB
_0805CFC0:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0805CFD4
	ldrb r0, [r4, #0x1c]
	adds r0, #2
	strb r0, [r4, #0x1c]
_0805CFD4:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0805CFF8
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0805CFEE
	subs r0, #1
	strb r0, [r2]
	b _0805CFF8
_0805CFEE:
	strb r1, [r6]
	ldrh r1, [r4]
	movs r0, #4
_0805CFF4:
	orrs r0, r1
_0805CFF6:
	strh r0, [r4]
_0805CFF8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPartEyesPhase2
YakuzaPartEyesPhase2: @ 0x0805D000
	push {lr}
	ldr r3, _0805D030 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldr r2, _0805D034 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805D02A
	movs r0, #0
	strh r0, [r3]
_0805D02A:
	pop {r0}
	bx r0
	.align 2, 0
_0805D030: .4byte gCurrentSprite
_0805D034: .4byte gSpriteData

	thumb_func_start YakuzaProjectileInit
YakuzaProjectileInit: @ 0x0805D038
	push {r4, r5, lr}
	ldr r3, _0805D094 @ =gCurrentSprite
	ldrh r0, [r3]
	ldr r1, _0805D098 @ =0x0000FFFB
	ands r1, r0
	movs r5, #0
	movs r4, #0
	strh r1, [r3]
	adds r0, r3, #0
	adds r0, #0x22
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0805D09C @ =gSubSpriteData1
	ldrh r2, [r0, #0xc]
	cmp r2, #0
	beq _0805D0A8
	adds r0, r3, #0
	adds r0, #0x25
	movs r1, #2
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x27
	movs r0, #0x28
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x28
	strb r5, [r0]
	adds r2, #2
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0805D0A0 @ =0x0000FFA0
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r0, #0x48
	strh r0, [r3, #0xe]
	movs r0, #0x18
	strh r0, [r3, #0x10]
	ldr r0, _0805D0A4 @ =0x083B72C0
	str r0, [r3, #0x18]
	strb r5, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x24
	strb r1, [r0]
	strh r4, [r3, #0x14]
	b _0805D0EE
	.align 2, 0
_0805D094: .4byte gCurrentSprite
_0805D098: .4byte 0x0000FFFB
_0805D09C: .4byte gSubSpriteData1
_0805D0A0: .4byte 0x0000FFA0
_0805D0A4: .4byte 0x083B72C0
_0805D0A8:
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0805D0F4 @ =0x0000FFE0
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	adds r0, #4
	strh r0, [r3, #0xe]
	movs r0, #0x1c
	strh r0, [r3, #0x10]
	ldr r0, _0805D0F8 @ =0x083B7288
	str r0, [r3, #0x18]
	strb r5, [r3, #0x1c]
	strh r2, [r3, #0x16]
	subs r1, #5
	movs r0, #0x28
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r3, #0x14]
_0805D0EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D0F4: .4byte 0x0000FFE0
_0805D0F8: .4byte 0x083B7288

	thumb_func_start YakuzaProjectileExploding
YakuzaProjectileExploding: @ 0x0805D0FC
	push {r4, lr}
	ldr r4, _0805D11C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x2d
	bl ParticleSet
	ldr r0, _0805D120 @ =0x000001BF
	bl SoundPlay
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D11C: .4byte gCurrentSprite
_0805D120: .4byte 0x000001BF

	thumb_func_start YakuzaProjectileSpitFalling
YakuzaProjectileSpitFalling: @ 0x0805D124
	push {lr}
	ldr r0, _0805D13C @ =gCurrentSprite
	ldrh r1, [r0, #2]
	adds r1, #0xc
	strh r1, [r0, #2]
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	bne _0805D138
	bl YakuzaProjectileExploding
_0805D138:
	pop {r0}
	bx r0
	.align 2, 0
_0805D13C: .4byte gCurrentSprite

	thumb_func_start YakuzaProjectileFireFalling
YakuzaProjectileFireFalling: @ 0x0805D140
	push {r4, lr}
	ldr r0, _0805D170 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	adds r1, #0xc
	strh r1, [r0, #2]
	ldrb r1, [r0, #0x1e]
	adds r4, r0, #0
	cmp r1, #0
	beq _0805D192
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805D174
	ldrh r0, [r4, #4]
	adds r0, #0xc
	strh r0, [r4, #4]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	b _0805D184
	.align 2, 0
_0805D170: .4byte gCurrentSprite
_0805D174:
	ldrh r0, [r4, #4]
	subs r0, #0xc
	strh r0, [r4, #4]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
_0805D184:
	ldr r0, _0805D1CC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	ldr r4, _0805D1D0 @ =gCurrentSprite
	cmp r0, #0
	beq _0805D192
	movs r0, #0
	strb r0, [r4, #0x1e]
_0805D192:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0805D1D4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D1C4
	movs r2, #0
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x78
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r0, #0x9e
	lsls r0, r0, #1
	bl SoundPlay
_0805D1C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D1CC: .4byte gPreviousCollisionCheck
_0805D1D0: .4byte gCurrentSprite
_0805D1D4: .4byte gPreviousVerticalCollisionCheck

	thumb_func_start YakuzaProjectileFireBurning1
YakuzaProjectileFireBurning1: @ 0x0805D1D8
	push {r4, r5, r6, r7, lr}
	ldr r2, _0805D240 @ =gCurrentSprite
	adds r6, r2, #0
	adds r6, #0x30
	ldrb r3, [r6]
	ldr r5, _0805D244 @ =0x083B0B04
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D248 @ =0x00007FFF
	cmp r1, r0
	bne _0805D1F8
	ldrh r4, [r5]
	movs r3, #0
_0805D1F8:
	adds r0, r3, #1
	strb r0, [r6]
	ldrh r0, [r2, #4]
	adds r0, r0, r4
	strh r0, [r2, #4]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0805D258
	movs r0, #0x50
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _0805D24C @ =0x083B72E0
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0805D250 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	adds r0, #0x30
	strh r0, [r2, #0xe]
	movs r0, #0x10
	strh r0, [r2, #0x10]
	ldr r0, _0805D254 @ =0x0000013D
	bl SoundPlay
	b _0805D268
	.align 2, 0
_0805D240: .4byte gCurrentSprite
_0805D244: .4byte 0x083B0B04
_0805D248: .4byte 0x00007FFF
_0805D24C: .4byte 0x083B72E0
_0805D250: .4byte 0x0000FFC0
_0805D254: .4byte 0x0000013D
_0805D258:
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0805D268
	movs r0, #0x9e
	lsls r0, r0, #1
	bl SoundPlay
_0805D268:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaProjectileFireBurning2
YakuzaProjectileFireBurning2: @ 0x0805D270
	push {r4, r5, r6, r7, lr}
	ldr r2, _0805D2D8 @ =gCurrentSprite
	adds r6, r2, #0
	adds r6, #0x30
	ldrb r3, [r6]
	ldr r5, _0805D2DC @ =0x083B0B04
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D2E0 @ =0x00007FFF
	cmp r1, r0
	bne _0805D290
	ldrh r4, [r5]
	movs r3, #0
_0805D290:
	adds r0, r3, #1
	strb r0, [r6]
	ldrh r0, [r2, #4]
	adds r0, r0, r4
	strh r0, [r2, #4]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0805D2EC
	movs r0, #0x3c
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _0805D2E4 @ =0x083B7300
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0805D2E8 @ =0x0000FFE0
	strh r0, [r2, #0xa]
	adds r0, #0x14
	strh r0, [r2, #0xe]
	movs r0, #0xc
	strh r0, [r2, #0x10]
	movs r0, #0x9f
	lsls r0, r0, #1
	bl SoundPlay
	b _0805D2FA
	.align 2, 0
_0805D2D8: .4byte gCurrentSprite
_0805D2DC: .4byte 0x083B0B04
_0805D2E0: .4byte 0x00007FFF
_0805D2E4: .4byte 0x083B7300
_0805D2E8: .4byte 0x0000FFE0
_0805D2EC:
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0805D2FA
	ldr r0, _0805D300 @ =0x0000013D
	bl SoundPlay
_0805D2FA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D300: .4byte 0x0000013D

	thumb_func_start YakuzaProjectileFireBurning3
YakuzaProjectileFireBurning3: @ 0x0805D304
	push {r4, r5, r6, r7, lr}
	ldr r3, _0805D364 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x30
	ldrb r2, [r6]
	ldr r5, _0805D368 @ =0x083B0B04
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D36C @ =0x00007FFF
	cmp r1, r0
	bne _0805D324
	ldrh r4, [r5]
	movs r2, #0
_0805D324:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r3, #4]
	adds r0, r0, r4
	strh r0, [r3, #4]
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805D34A
	movs r0, #0x3c
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0805D34A:
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0805D35C
	movs r0, #0x9f
	lsls r0, r0, #1
	bl SoundPlay
_0805D35C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D364: .4byte gCurrentSprite
_0805D368: .4byte 0x083B0B04
_0805D36C: .4byte 0x00007FFF

	thumb_func_start YakuzaProjectileFireBurning4
YakuzaProjectileFireBurning4: @ 0x0805D370
	push {lr}
	ldr r0, _0805D3B0 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r3, [r1]
	adds r2, r0, #0
	cmp r3, #0x1d
	bhi _0805D396
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ands r0, r3
	cmp r0, #0
	bne _0805D396
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_0805D396:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805D3AA
	strh r0, [r2]
_0805D3AA:
	pop {r0}
	bx r0
	.align 2, 0
_0805D3B0: .4byte gCurrentSprite

	thumb_func_start YakuzaFallingLegInit
YakuzaFallingLegInit: @ 0x0805D3B4
	push {r4, r5, lr}
	ldr r0, _0805D424 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0805D428 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	ldr r0, _0805D42C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	ldr r1, _0805D430 @ =0x0000FFFC
	mov r5, ip
	strh r1, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	strb r3, [r5, #0x1c]
	strh r4, [r5, #0x16]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	adds r0, #0xd
	strb r3, [r0]
	strh r4, [r5, #0x14]
	ldrb r0, [r5, #0x1e]
	mov r3, ip
	cmp r0, #5
	bls _0805D418
	b _0805D56C
_0805D418:
	lsls r0, r0, #2
	ldr r1, _0805D434 @ =_0805D438
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D424: .4byte gCurrentSprite
_0805D428: .4byte 0x0000FFFB
_0805D42C: .4byte gIoRegisters
_0805D430: .4byte 0x0000FFFC
_0805D434: .4byte _0805D438
_0805D438: @ jump table
	.4byte _0805D450 @ case 0
	.4byte _0805D490 @ case 1
	.4byte _0805D4BC @ case 2
	.4byte _0805D4E8 @ case 3
	.4byte _0805D514 @ case 4
	.4byte _0805D540 @ case 5
_0805D450:
	ldr r0, _0805D488 @ =0x083B7320
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _0805D48C @ =0x00000133
	bl unk_3b1c
	b _0805D570
	.align 2, 0
_0805D488: .4byte 0x083B7320
_0805D48C: .4byte 0x00000133
_0805D490:
	ldr r0, _0805D4B8 @ =0x083B7330
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r2, #8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	b _0805D570
	.align 2, 0
_0805D4B8: .4byte 0x083B7330
_0805D4BC:
	ldr r0, _0805D4E4 @ =0x083B7340
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #7
	movs r0, #0xa
	strb r0, [r1]
	subs r1, #2
	movs r0, #6
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D4E4: .4byte 0x083B7340
_0805D4E8:
	ldr r0, _0805D510 @ =0x083B7350
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	movs r0, #4
	strb r0, [r1]
	subs r1, #2
	movs r0, #0xa
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D510: .4byte 0x083B7350
_0805D514:
	ldr r0, _0805D53C @ =0x083B7360
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #6
	strb r0, [r1]
	subs r1, #2
	movs r0, #2
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D53C: .4byte 0x083B7360
_0805D540:
	ldr r0, _0805D568 @ =0x083B7370
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #7
	movs r0, #0xa
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D568: .4byte 0x083B7370
_0805D56C:
	mov r0, ip
	strh r4, [r0]
_0805D570:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaFallingLegMoving
YakuzaFallingLegMoving: @ 0x0805D578
	push {r4, r5, r6, lr}
	ldr r1, _0805D5A0 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r2, r1, #0
	cmp r0, #0
	beq _0805D5A4
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805D5FE
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #4]
	movs r2, #0x25
	bl ParticleSet
	b _0805D5FE
	.align 2, 0
_0805D5A0: .4byte gCurrentSprite
_0805D5A4:
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _0805D5CC @ =sSpritesFallingSpeed_2e499c
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0805D5D0 @ =0x00007FFF
	cmp r1, r0
	bne _0805D5D4
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0805D5DE
	.align 2, 0
_0805D5CC: .4byte sSpritesFallingSpeed_2e499c
_0805D5D0: .4byte 0x00007FFF
_0805D5D4:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
_0805D5DE:
	strh r0, [r2, #2]
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	bhi _0805D5F2
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	b _0805D5FC
_0805D5F2:
	adds r1, r2, #0
	adds r1, #0x30
	ldrh r0, [r2, #4]
	ldrb r1, [r1]
	adds r0, r0, r1
_0805D5FC:
	strh r0, [r2, #4]
_0805D5FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Yakuza
Yakuza: @ 0x0805D604
	push {r4, lr}
	ldr r1, _0805D648 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	adds r4, r1, #0
	cmp r0, #0
	bne _0805D61C
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805D61C
	movs r0, #0x47
	strb r0, [r1]
_0805D61C:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0805D630
	ldr r0, _0805D64C @ =0x00000131
	bl SoundPlayNotAlreadyPlaying
_0805D630:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4a
	bls _0805D63C
	b _0805D830
_0805D63C:
	lsls r0, r0, #2
	ldr r1, _0805D650 @ =_0805D654
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D648: .4byte gCurrentSprite
_0805D64C: .4byte 0x00000131
_0805D650: .4byte _0805D654
_0805D654: @ jump table
	.4byte _0805D780 @ case 0
	.4byte _0805D792 @ case 1
	.4byte _0805D796 @ case 2
	.4byte _0805D830 @ case 3
	.4byte _0805D830 @ case 4
	.4byte _0805D830 @ case 5
	.4byte _0805D830 @ case 6
	.4byte _0805D7A8 @ case 7
	.4byte _0805D7AC @ case 8
	.4byte _0805D7D8 @ case 9
	.4byte _0805D7DC @ case 10
	.4byte _0805D830 @ case 11
	.4byte _0805D830 @ case 12
	.4byte _0805D830 @ case 13
	.4byte _0805D830 @ case 14
	.4byte _0805D830 @ case 15
	.4byte _0805D830 @ case 16
	.4byte _0805D830 @ case 17
	.4byte _0805D830 @ case 18
	.4byte _0805D830 @ case 19
	.4byte _0805D830 @ case 20
	.4byte _0805D830 @ case 21
	.4byte _0805D830 @ case 22
	.4byte _0805D830 @ case 23
	.4byte _0805D79C @ case 24
	.4byte _0805D830 @ case 25
	.4byte _0805D7A2 @ case 26
	.4byte _0805D7EC @ case 27
	.4byte _0805D7F0 @ case 28
	.4byte _0805D7F6 @ case 29
	.4byte _0805D7FA @ case 30
	.4byte _0805D800 @ case 31
	.4byte _0805D804 @ case 32
	.4byte _0805D80A @ case 33
	.4byte _0805D80E @ case 34
	.4byte _0805D814 @ case 35
	.4byte _0805D818 @ case 36
	.4byte _0805D830 @ case 37
	.4byte _0805D830 @ case 38
	.4byte _0805D7B2 @ case 39
	.4byte _0805D7B6 @ case 40
	.4byte _0805D830 @ case 41
	.4byte _0805D7BC @ case 42
	.4byte _0805D830 @ case 43
	.4byte _0805D7C2 @ case 44
	.4byte _0805D830 @ case 45
	.4byte _0805D7C8 @ case 46
	.4byte _0805D7CE @ case 47
	.4byte _0805D7D2 @ case 48
	.4byte _0805D7E2 @ case 49
	.4byte _0805D7E6 @ case 50
	.4byte _0805D830 @ case 51
	.4byte _0805D830 @ case 52
	.4byte _0805D830 @ case 53
	.4byte _0805D830 @ case 54
	.4byte _0805D786 @ case 55
	.4byte _0805D78C @ case 56
	.4byte _0805D830 @ case 57
	.4byte _0805D830 @ case 58
	.4byte _0805D830 @ case 59
	.4byte _0805D830 @ case 60
	.4byte _0805D830 @ case 61
	.4byte _0805D830 @ case 62
	.4byte _0805D830 @ case 63
	.4byte _0805D830 @ case 64
	.4byte _0805D830 @ case 65
	.4byte _0805D830 @ case 66
	.4byte _0805D830 @ case 67
	.4byte _0805D830 @ case 68
	.4byte _0805D830 @ case 69
	.4byte _0805D830 @ case 70
	.4byte _0805D81E @ case 71
	.4byte _0805D822 @ case 72
	.4byte _0805D828 @ case 73
	.4byte _0805D82C @ case 74
_0805D780:
	bl YakuzaInit
	b _0805D830
_0805D786:
	bl YakuzaWaitingToAppear
	b _0805D830
_0805D78C:
	bl YakuzaAboutToAppear
	b _0805D830
_0805D792:
	bl YakuzaBeginSweepInit
_0805D796:
	bl YakuzaBeginSweep
	b _0805D830
_0805D79C:
	bl YakuzaSweeping
	b _0805D830
_0805D7A2:
	bl YakuzaSweepingEnd
	b _0805D830
_0805D7A8:
	bl YakuzaIdleBeforeNewRoundInit
_0805D7AC:
	bl YakuzaIdleBeforeNewRound
	b _0805D830
_0805D7B2:
	bl YakuzaGrabbedSamusInit
_0805D7B6:
	bl YakuzaGrabbedSamus
	b _0805D830
_0805D7BC:
	bl YakuzaPullingSamus
	b _0805D830
_0805D7C2:
	bl YakuzaHoldingSamusHigh
	b _0805D830
_0805D7C8:
	bl YakuzaSlammingSamus
	b _0805D830
_0805D7CE:
	bl YakuzaReleasingSamusInit
_0805D7D2:
	bl YakuzaReleasingSamus
	b _0805D830
_0805D7D8:
	bl YakuzaAfterReleasingSamusInit
_0805D7DC:
	bl YakuzaAfterReleasingSamus
	b _0805D830
_0805D7E2:
	bl YakuzaOpeningMouthInit
_0805D7E6:
	bl YakuzaOpeningMouth
	b _0805D830
_0805D7EC:
	bl YakuzaMouthOpenedInit
_0805D7F0:
	bl YakuzaMouthOpened
	b _0805D830
_0805D7F6:
	bl YakuzaClosingMouthInit
_0805D7FA:
	bl YakuzaClosingMouth
	b _0805D830
_0805D800:
	bl YakuzaPhase1DyingInit
_0805D804:
	bl YakuzaPhase1Dying
	b _0805D830
_0805D80A:
	bl YakuzaLosingLegsInit
_0805D80E:
	bl YakuzaLosingLegs
	b _0805D830
_0805D814:
	bl YakuzaPhase2Init
_0805D818:
	bl YakuzaPhase2
	b _0805D830
_0805D81E:
	bl YakuzaPhase2DyingInit
_0805D822:
	bl YakuzaPhase2Dying
	b _0805D830
_0805D828:
	bl YakuzaTurningIntoCoreXInit
_0805D82C:
	bl YakuzaTurningIntoCoreX
_0805D830:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl YakuzaSyncSubSprites
	bl YakuzaUpdatePalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPart
YakuzaPart: @ 0x0805D844
	push {lr}
	ldr r2, _0805D858 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	cmp r1, #0
	bne _0805D85C
	bl YakuzaPartInit
	b _0805D894
	.align 2, 0
_0805D858: .4byte gCurrentSprite
_0805D85C:
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	bne _0805D87E
	ldr r0, _0805D870 @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _0805D874
	bl YakuzaPartLegsIdle
	b _0805D878
	.align 2, 0
_0805D870: .4byte gSubSpriteData1
_0805D874:
	bl YakuzaPartLegsDead
_0805D878:
	bl YakuzaSyncSubSprites
	b _0805D894
_0805D87E:
	cmp r0, #0
	bne _0805D894
	cmp r1, #2
	bne _0805D88C
	bl YakuzaPartEyeIdle
	b _0805D890
_0805D88C:
	bl YakuzaPartEyesPhase2
_0805D890:
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
_0805D894:
	pop {r0}
	bx r0

	thumb_func_start YakuzaProjectile
YakuzaProjectile: @ 0x0805D898
	push {lr}
	ldr r0, _0805D8B0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	bls _0805D8A6
	b _0805D9C6
_0805D8A6:
	lsls r0, r0, #2
	ldr r1, _0805D8B4 @ =_0805D8B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D8B0: .4byte gCurrentSprite
_0805D8B4: .4byte _0805D8B8
_0805D8B8: @ jump table
	.4byte _0805D998 @ case 0
	.4byte _0805D9C6 @ case 1
	.4byte _0805D9AA @ case 2
	.4byte _0805D9C6 @ case 3
	.4byte _0805D9C6 @ case 4
	.4byte _0805D9C6 @ case 5
	.4byte _0805D9C6 @ case 6
	.4byte _0805D9C6 @ case 7
	.4byte _0805D9C6 @ case 8
	.4byte _0805D9C6 @ case 9
	.4byte _0805D9C6 @ case 10
	.4byte _0805D9C6 @ case 11
	.4byte _0805D9C6 @ case 12
	.4byte _0805D9C6 @ case 13
	.4byte _0805D9C6 @ case 14
	.4byte _0805D9C6 @ case 15
	.4byte _0805D9C6 @ case 16
	.4byte _0805D9C6 @ case 17
	.4byte _0805D9C6 @ case 18
	.4byte _0805D9C6 @ case 19
	.4byte _0805D9C6 @ case 20
	.4byte _0805D9C6 @ case 21
	.4byte _0805D9C6 @ case 22
	.4byte _0805D9C6 @ case 23
	.4byte _0805D9B0 @ case 24
	.4byte _0805D9C6 @ case 25
	.4byte _0805D9B6 @ case 26
	.4byte _0805D9C6 @ case 27
	.4byte _0805D9BC @ case 28
	.4byte _0805D9C6 @ case 29
	.4byte _0805D9C2 @ case 30
	.4byte _0805D9C6 @ case 31
	.4byte _0805D9C6 @ case 32
	.4byte _0805D9C6 @ case 33
	.4byte _0805D9C6 @ case 34
	.4byte _0805D9C6 @ case 35
	.4byte _0805D9C6 @ case 36
	.4byte _0805D9C6 @ case 37
	.4byte _0805D9C6 @ case 38
	.4byte _0805D9C6 @ case 39
	.4byte _0805D99E @ case 40
	.4byte _0805D9C6 @ case 41
	.4byte _0805D9C6 @ case 42
	.4byte _0805D9C6 @ case 43
	.4byte _0805D9C6 @ case 44
	.4byte _0805D9C6 @ case 45
	.4byte _0805D9C6 @ case 46
	.4byte _0805D9C6 @ case 47
	.4byte _0805D9C6 @ case 48
	.4byte _0805D9C6 @ case 49
	.4byte _0805D9C6 @ case 50
	.4byte _0805D9C6 @ case 51
	.4byte _0805D9C6 @ case 52
	.4byte _0805D9C6 @ case 53
	.4byte _0805D9C6 @ case 54
	.4byte _0805D9A4 @ case 55
_0805D998:
	bl YakuzaProjectileInit
	b _0805D9C6
_0805D99E:
	bl YakuzaProjectileSpitFalling
	b _0805D9C6
_0805D9A4:
	bl YakuzaProjectileExploding
	b _0805D9C6
_0805D9AA:
	bl YakuzaProjectileFireFalling
	b _0805D9C6
_0805D9B0:
	bl YakuzaProjectileFireBurning1
	b _0805D9C6
_0805D9B6:
	bl YakuzaProjectileFireBurning2
	b _0805D9C6
_0805D9BC:
	bl YakuzaProjectileFireBurning3
	b _0805D9C6
_0805D9C2:
	bl YakuzaProjectileFireBurning4
_0805D9C6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaFallingLeg
YakuzaFallingLeg: @ 0x0805D9CC
	push {lr}
	ldr r0, _0805D9E8 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D9EC
	cmp r0, #2
	beq _0805D9F2
	b _0805D9F6
	.align 2, 0
_0805D9E8: .4byte gCurrentSprite
_0805D9EC:
	bl YakuzaFallingLegInit
	b _0805D9F6
_0805D9F2:
	bl YakuzaFallingLegMoving
_0805D9F6:
	pop {r0}
	bx r0
	.align 2, 0
