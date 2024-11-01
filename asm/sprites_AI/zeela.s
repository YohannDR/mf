    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ZeelaCheckCollidingWithAir
ZeelaCheckCollidingWithAir: @ 0x0803AA14
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0803AA48 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AA74
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AA50
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AA4C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0803AAB8
	.align 2, 0
_0803AA48: .4byte gCurrentSprite
_0803AA4C: .4byte gPreviousCollisionCheck
_0803AA50:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AA70 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803AAB8
	.align 2, 0
_0803AA70: .4byte gPreviousCollisionCheck
_0803AA74:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803AAA0
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AA9C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	ldrh r0, [r4, #2]
	subs r0, #4
	b _0803AAB4
	.align 2, 0
_0803AA9C: .4byte gPreviousCollisionCheck
_0803AAA0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AACC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	ldrh r0, [r4, #2]
_0803AAB4:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0803AAB8:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803AAC4
	movs r6, #1
_0803AAC4:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803AACC: .4byte gPreviousCollisionCheck

	thumb_func_start ZeelaUpdateHitbox
ZeelaUpdateHitbox: @ 0x0803AAD0
	push {lr}
	ldr r2, _0803AAFC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AB20
	ldrh r1, [r2]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803AB08
	ldr r0, _0803AB00 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	ldr r0, _0803AB04 @ =0x0000FFC0
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803AB42
	.align 2, 0
_0803AAFC: .4byte gCurrentSprite
_0803AB00: .4byte 0x0000FFD8
_0803AB04: .4byte 0x0000FFC0
_0803AB08:
	ldr r0, _0803AB18 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	ldr r0, _0803AB1C @ =0x0000FFF0
	strh r0, [r2, #0xe]
	strh r3, [r2, #0x10]
	b _0803AB44
	.align 2, 0
_0803AB18: .4byte 0x0000FFD8
_0803AB1C: .4byte 0x0000FFF0
_0803AB20:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803AB34
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x40
	b _0803AB3A
_0803AB34:
	ldr r0, _0803AB48 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r0, #0x10
_0803AB3A:
	strh r0, [r2, #0xc]
	ldr r0, _0803AB4C @ =0x0000FFD8
	strh r0, [r2, #0xe]
	movs r0, #0x28
_0803AB42:
	strh r0, [r2, #0x10]
_0803AB44:
	pop {r0}
	bx r0
	.align 2, 0
_0803AB48: .4byte 0x0000FFC0
_0803AB4C: .4byte 0x0000FFD8

	thumb_func_start ZeelaSetCrawlingOam
ZeelaSetCrawlingOam: @ 0x0803AB50
	push {lr}
	ldr r0, _0803AB64 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803AB6C
	ldr r0, _0803AB68 @ =0x083505DC
	b _0803AB6E
	.align 2, 0
_0803AB64: .4byte gCurrentSprite
_0803AB68: .4byte 0x083505DC
_0803AB6C:
	ldr r0, _0803AB7C @ =0x08350584
_0803AB6E:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803AB7C: .4byte 0x08350584

	thumb_func_start ZeelaSetFallingOam
ZeelaSetFallingOam: @ 0x0803AB80
	push {lr}
	ldr r0, _0803AB94 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803AB9C
	ldr r0, _0803AB98 @ =0x0835060C
	b _0803AB9E
	.align 2, 0
_0803AB94: .4byte gCurrentSprite
_0803AB98: .4byte 0x0835060C
_0803AB9C:
	ldr r0, _0803ABAC @ =0x083505B4
_0803AB9E:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803ABAC: .4byte 0x083505B4

	thumb_func_start ZeelaShootProjectiles
ZeelaShootProjectiles: @ 0x0803ABB0
	push {r4, r5, lr}
	sub sp, #0xc
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803ABDC
	ldr r0, _0803ABD8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _0803ABD2
	b _0803AD6C
_0803ABD2:
	movs r0, #0
	strb r0, [r1]
	b _0803AD6C
	.align 2, 0
_0803ABD8: .4byte gCurrentSprite
_0803ABDC:
	ldr r1, _0803AC44 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803ABEA
	b _0803AD6C
_0803ABEA:
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0803AC06
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0803AC06
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803AC06
	ldr r0, _0803AC48 @ =0x000001CB
	bl SoundPlayNotAlreadyPlaying
_0803AC06:
	ldr r1, _0803AC44 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	adds r4, r1, #0
	cmp r0, #1
	bne _0803ACAC
	ldrb r0, [r4, #0x1c]
	cmp r0, #8
	bne _0803ACAC
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AC64
	ldrh r1, [r4]
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803AC4C
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x34
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x3c
	str r0, [sp, #4]
	str r5, [sp, #8]
	b _0803ACEE
	.align 2, 0
_0803AC44: .4byte gCurrentSprite
_0803AC48: .4byte 0x000001CB
_0803AC4C:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x34
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x3c
	str r0, [sp, #4]
	str r5, [sp, #8]
	b _0803AD10
_0803AC64:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803AC8A
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x3c
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x34
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	b _0803AD44
_0803AC8A:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x3c
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x34
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0x38
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0803AD6C
_0803ACAC:
	mov ip, r4
	ldrh r0, [r4, #0x16]
	cmp r0, #2
	bne _0803AD6C
	ldrb r0, [r4, #0x1c]
	cmp r0, #8
	bne _0803AD6C
	mov r0, ip
	adds r0, #0x2d
	ldrb r5, [r0]
	cmp r5, #0
	beq _0803AD1A
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803ACF8
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x34
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x3c
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
_0803ACEE:
	movs r0, #0x38
	movs r1, #3
	bl SpriteSpawnSecondary
	b _0803AD6C
_0803ACF8:
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x34
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x3c
	str r0, [sp, #4]
	str r1, [sp, #8]
_0803AD10:
	movs r0, #0x38
	movs r1, #2
	bl SpriteSpawnSecondary
	b _0803AD6C
_0803AD1A:
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803AD4E
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x3c
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x34
	str r0, [sp, #4]
	str r5, [sp, #8]
_0803AD44:
	movs r0, #0x38
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0803AD6C
_0803AD4E:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x3c
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x34
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x38
	movs r1, #0
	bl SpriteSpawnSecondary
_0803AD6C:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ZeelaTurningIntoX
ZeelaTurningIntoX: @ 0x0803AD74
	push {lr}
	ldr r2, _0803AD94 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803ADA0
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AD98
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _0803ADB8
	.align 2, 0
_0803AD94: .4byte gCurrentSprite
_0803AD98:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _0803ADB8
_0803ADA0:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803ADB2
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _0803ADB6
_0803ADB2:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_0803ADB6:
	strh r0, [r2, #2]
_0803ADB8:
	pop {r0}
	bx r0

	thumb_func_start ZeelaInit
ZeelaInit: @ 0x0803ADBC
	push {r4, r5, r6, r7, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803ADE8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803ADEC
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803ADEC
	strh r0, [r2]
	b _0803AEFC
	.align 2, 0
_0803ADE8: .4byte gCurrentSprite
_0803ADEC:
	ldr r0, _0803AE04 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	ldrb r1, [r2]
	adds r7, r0, #0
	cmp r1, #0x59
	bne _0803AE08
	movs r0, #0x5a
	strb r0, [r2]
	movs r0, #0x2c
	strh r0, [r7, #6]
	b _0803AEC2
	.align 2, 0
_0803AE04: .4byte gCurrentSprite
_0803AE08:
	movs r0, #2
	strb r0, [r2]
	ldrh r0, [r7, #2]
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AE2C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	movs r6, #0xf0
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #0
	beq _0803AE30
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	b _0803AEC2
	.align 2, 0
_0803AE2C: .4byte gPreviousCollisionCheck
_0803AE30:
	ldrh r0, [r7, #2]
	subs r0, #0x44
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803AE5E
	adds r0, r7, #0
	adds r0, #0x2d
	strb r4, [r0]
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r1, r0
	strh r1, [r7]
	ldrh r0, [r7, #2]
	subs r0, #0x40
	strh r0, [r7, #2]
	b _0803AEC2
_0803AE5E:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803AE8A
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r7, #2]
	subs r0, #0x20
	strh r0, [r7, #2]
	ldrh r0, [r7, #4]
	subs r0, #0x20
	strh r0, [r7, #4]
	b _0803AEC2
_0803AE8A:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	adds r2, r6, #0
	ands r2, r0
	cmp r2, #0
	beq _0803AEBE
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r7]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r7]
	ldrh r0, [r7, #2]
	subs r0, #0x20
	strh r0, [r7, #2]
	ldrh r0, [r7, #4]
	adds r0, #0x20
	strh r0, [r7, #4]
	b _0803AEC2
_0803AEBE:
	strh r2, [r7]
	b _0803AEFC
_0803AEC2:
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl ZeelaSetCrawlingOam
	bl ZeelaUpdateHitbox
	ldr r2, _0803AF04 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #8
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_0803AEFC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AF04: .4byte sPrimarySpriteStats

	thumb_func_start ZeelaIdleInit
ZeelaIdleInit: @ 0x0803AF08
	push {lr}
	bl ZeelaSetCrawlingOam
	ldr r0, _0803AF1C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803AF1C: .4byte gCurrentSprite

	thumb_func_start ZeelaIdle
ZeelaIdle: @ 0x0803AF20
	push {r4, r5, r6, lr}
	ldr r4, _0803AF4C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803AF32
	b _0803B14C
_0803AF32:
	bl ZeelaShootProjectiles
	bl ZeelaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF50
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _0803B14C
	.align 2, 0
_0803AF4C: .4byte gCurrentSprite
_0803AF50:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B040
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AFBC
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803AF94
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AF90 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803AF86
	b _0803B138
_0803AF86:
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803AFE6
	.align 2, 0
_0803AF90: .4byte gPreviousCollisionCheck
_0803AF94:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803AFB8 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803AFAC
	b _0803B138
_0803AFAC:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803B024
	.align 2, 0
_0803AFB8: .4byte gPreviousCollisionCheck
_0803AFBC:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B004
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B000 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803AFE0
	b _0803B138
_0803AFE0:
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
_0803AFE6:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803AFF6
	b _0803B138
_0803AFF6:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	b _0803B132
	.align 2, 0
_0803B000: .4byte gPreviousCollisionCheck
_0803B004:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B03C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803B01E
	b _0803B138
_0803B01E:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
_0803B024:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803B034
	b _0803B138
_0803B034:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	b _0803B132
	.align 2, 0
_0803B03C: .4byte gPreviousCollisionCheck
_0803B040:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B0C0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B090
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B08C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B138
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0803B138
	ldrh r0, [r4, #4]
	adds r0, #1
	b _0803B130
	.align 2, 0
_0803B08C: .4byte gPreviousCollisionCheck
_0803B090:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B0BC @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803B138
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	b _0803B126
	.align 2, 0
_0803B0BC: .4byte gPreviousCollisionCheck
_0803B0C0:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B100
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B0FC @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803B138
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803B138
	ldrh r0, [r4, #4]
	adds r0, #1
	b _0803B130
	.align 2, 0
_0803B0FC: .4byte gPreviousCollisionCheck
_0803B100:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803B154 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803B138
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
_0803B126:
	ands r0, r1
	cmp r0, #0
	bne _0803B138
	ldrh r0, [r4, #4]
	subs r0, #1
_0803B130:
	strh r0, [r4, #4]
_0803B132:
	movs r0, #0
	cmp r0, #0
	beq _0803B14C
_0803B138:
	ldr r2, _0803B158 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
_0803B14C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803B154: .4byte gPreviousCollisionCheck
_0803B158: .4byte gCurrentSprite

	thumb_func_start ZeelaTurningAroundInit
ZeelaTurningAroundInit: @ 0x0803B15C
	push {lr}
	ldr r0, _0803B170 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	bl ZeelaSetFallingOam
	pop {r0}
	bx r0
	.align 2, 0
_0803B170: .4byte gCurrentSprite

	thumb_func_start ZeelaTurningAround
ZeelaTurningAround: @ 0x0803B174
	push {lr}
	bl ZeelaCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B18C
	ldr r0, _0803B188 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _0803B19A
	.align 2, 0
_0803B188: .4byte gCurrentSprite
_0803B18C:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803B19C
	ldr r0, _0803B1A0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
_0803B19A:
	strb r1, [r0]
_0803B19C:
	pop {r0}
	bx r0
	.align 2, 0
_0803B1A0: .4byte gCurrentSprite

	thumb_func_start ZeelaFallingInit
ZeelaFallingInit: @ 0x0803B1A4
	push {lr}
	ldr r1, _0803B1C0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bl ZeelaSetFallingOam
	pop {r0}
	bx r0
	.align 2, 0
_0803B1C0: .4byte gCurrentSprite

	thumb_func_start ZeelaFalling
ZeelaFalling: @ 0x0803B1C4
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _0803B1EC @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B1F0
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B1FC
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803B1FC
	.align 2, 0
_0803B1EC: .4byte gCurrentSprite
_0803B1F0:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B204
_0803B1FC:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0803B204:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0803B250 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B278
	ldr r4, _0803B254 @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803B22A
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803B22A:
	ldrh r0, [r4]
	ldr r1, _0803B258 @ =0x0000FEFF
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strb r0, [r2]
	bl ZeelaUpdateHitbox
	cmp r5, #0
	beq _0803B264
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B25C
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _0803B260
	.align 2, 0
_0803B250: .4byte gPreviousVerticalCollisionCheck
_0803B254: .4byte gCurrentSprite
_0803B258: .4byte 0x0000FEFF
_0803B25C:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_0803B260:
	subs r0, r0, r1
	strh r0, [r4, #4]
_0803B264:
	ldr r0, _0803B274 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	bl ZeelaSetFallingOam
	b _0803B2BC
	.align 2, 0
_0803B274: .4byte gCurrentSprite
_0803B278:
	ldr r3, _0803B2A4 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0803B2A8 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803B2AC @ =0x00007FFF
	cmp r1, r0
	bne _0803B2B0
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0803B2BA
	.align 2, 0
_0803B2A4: .4byte gCurrentSprite
_0803B2A8: .4byte sSpritesFallingSpeed
_0803B2AC: .4byte 0x00007FFF
_0803B2B0:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0803B2BA:
	strh r0, [r3, #2]
_0803B2BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZeelaProjectileInit
ZeelaProjectileInit: @ 0x0803B2C4
	push {r4, lr}
	ldr r0, _0803B328 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803B32C @ =0x0000FFFB
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
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0803B330 @ =0x0000FFF8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _0803B334 @ =0x08350634
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B328: .4byte gCurrentSprite
_0803B32C: .4byte 0x0000FFFB
_0803B330: .4byte 0x0000FFF8
_0803B334: .4byte 0x08350634

	thumb_func_start ZeelaProjectileMoving
ZeelaProjectileMoving: @ 0x0803B338
	push {r4, r5, r6, lr}
	ldr r1, _0803B360 @ =gCurrentClipdataAffectingAction
	movs r0, #5
	strb r0, [r1]
	ldr r4, _0803B364 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803B368 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803B36C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0803B3FA
	.align 2, 0
_0803B360: .4byte gCurrentClipdataAffectingAction
_0803B364: .4byte gCurrentSprite
_0803B368: .4byte gPreviousCollisionCheck
_0803B36C:
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _0803B390 @ =0x0834F10C
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803B394 @ =0x00007FFF
	cmp r1, r0
	bne _0803B398
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	b _0803B39C
	.align 2, 0
_0803B390: .4byte 0x0834F10C
_0803B394: .4byte 0x00007FFF
_0803B398:
	adds r0, r2, #1
	strb r0, [r5]
_0803B39C:
	ldr r0, _0803B3B0 @ =gCurrentSprite
	ldrb r2, [r0, #0x1e]
	adds r3, r0, #0
	cmp r2, #1
	bls _0803B3D4
	cmp r2, #3
	bne _0803B3B4
	ldrh r0, [r3, #4]
	adds r0, r0, r4
	b _0803B3B8
	.align 2, 0
_0803B3B0: .4byte gCurrentSprite
_0803B3B4:
	ldrh r0, [r3, #4]
	subs r0, r0, r4
_0803B3B8:
	strh r0, [r3, #4]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B3CC
	ldrh r0, [r3, #2]
	adds r0, #6
	strh r0, [r3, #2]
	b _0803B3FA
_0803B3CC:
	ldrh r0, [r3, #2]
	subs r0, #6
	strh r0, [r3, #2]
	b _0803B3FA
_0803B3D4:
	cmp r2, #0
	beq _0803B3DE
	ldrh r0, [r3, #2]
	subs r0, r0, r4
	b _0803B3E2
_0803B3DE:
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0803B3E2:
	strh r0, [r3, #2]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803B3F4
	ldrh r0, [r3, #4]
	adds r0, #6
	b _0803B3F8
_0803B3F4:
	ldrh r0, [r3, #4]
	subs r0, #6
_0803B3F8:
	strh r0, [r3, #4]
_0803B3FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ZeelaProjectileExplodingInit
ZeelaProjectileExplodingInit: @ 0x0803B400
	push {lr}
	ldr r3, _0803B430 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0803B434 @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B43C
	ldr r0, _0803B438 @ =0x0835066C
	b _0803B43E
	.align 2, 0
_0803B430: .4byte gCurrentSprite
_0803B434: .4byte gSpriteRandomNumber
_0803B438: .4byte 0x0835066C
_0803B43C:
	ldr r0, _0803B444 @ =0x08350694
_0803B43E:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0803B444: .4byte 0x08350694

	thumb_func_start ZeelaProjectileExploding
ZeelaProjectileExploding: @ 0x0803B448
	push {r4, lr}
	ldr r4, _0803B468 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803B460
	movs r0, #0
	strh r0, [r4]
_0803B460:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B468: .4byte gCurrentSprite

	thumb_func_start Zeela
Zeela: @ 0x0803B46C
	push {r4, lr}
	ldr r4, _0803B498 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803B486
	movs r0, #0xe6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803B486:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B49C
	bl SpriteUtilUpdateFreezeTimer
	b _0803B668
	.align 2, 0
_0803B498: .4byte gCurrentSprite
_0803B49C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803B4A8
	b _0803B668
_0803B4A8:
	lsls r0, r0, #2
	ldr r1, _0803B4B4 @ =_0803B4B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803B4B4: .4byte _0803B4B8
_0803B4B8: @ jump table
	.4byte _0803B628 @ case 0
	.4byte _0803B62E @ case 1
	.4byte _0803B632 @ case 2
	.4byte _0803B668 @ case 3
	.4byte _0803B668 @ case 4
	.4byte _0803B668 @ case 5
	.4byte _0803B668 @ case 6
	.4byte _0803B638 @ case 7
	.4byte _0803B63C @ case 8
	.4byte _0803B668 @ case 9
	.4byte _0803B668 @ case 10
	.4byte _0803B668 @ case 11
	.4byte _0803B668 @ case 12
	.4byte _0803B668 @ case 13
	.4byte _0803B668 @ case 14
	.4byte _0803B668 @ case 15
	.4byte _0803B668 @ case 16
	.4byte _0803B668 @ case 17
	.4byte _0803B668 @ case 18
	.4byte _0803B668 @ case 19
	.4byte _0803B668 @ case 20
	.4byte _0803B642 @ case 21
	.4byte _0803B646 @ case 22
	.4byte _0803B668 @ case 23
	.4byte _0803B668 @ case 24
	.4byte _0803B668 @ case 25
	.4byte _0803B668 @ case 26
	.4byte _0803B668 @ case 27
	.4byte _0803B668 @ case 28
	.4byte _0803B668 @ case 29
	.4byte _0803B668 @ case 30
	.4byte _0803B668 @ case 31
	.4byte _0803B668 @ case 32
	.4byte _0803B668 @ case 33
	.4byte _0803B668 @ case 34
	.4byte _0803B668 @ case 35
	.4byte _0803B668 @ case 36
	.4byte _0803B668 @ case 37
	.4byte _0803B668 @ case 38
	.4byte _0803B668 @ case 39
	.4byte _0803B668 @ case 40
	.4byte _0803B668 @ case 41
	.4byte _0803B668 @ case 42
	.4byte _0803B668 @ case 43
	.4byte _0803B668 @ case 44
	.4byte _0803B668 @ case 45
	.4byte _0803B668 @ case 46
	.4byte _0803B668 @ case 47
	.4byte _0803B668 @ case 48
	.4byte _0803B668 @ case 49
	.4byte _0803B668 @ case 50
	.4byte _0803B668 @ case 51
	.4byte _0803B668 @ case 52
	.4byte _0803B668 @ case 53
	.4byte _0803B668 @ case 54
	.4byte _0803B668 @ case 55
	.4byte _0803B668 @ case 56
	.4byte _0803B668 @ case 57
	.4byte _0803B668 @ case 58
	.4byte _0803B668 @ case 59
	.4byte _0803B668 @ case 60
	.4byte _0803B668 @ case 61
	.4byte _0803B668 @ case 62
	.4byte _0803B668 @ case 63
	.4byte _0803B668 @ case 64
	.4byte _0803B668 @ case 65
	.4byte _0803B668 @ case 66
	.4byte _0803B668 @ case 67
	.4byte _0803B668 @ case 68
	.4byte _0803B668 @ case 69
	.4byte _0803B668 @ case 70
	.4byte _0803B668 @ case 71
	.4byte _0803B668 @ case 72
	.4byte _0803B668 @ case 73
	.4byte _0803B668 @ case 74
	.4byte _0803B668 @ case 75
	.4byte _0803B668 @ case 76
	.4byte _0803B668 @ case 77
	.4byte _0803B668 @ case 78
	.4byte _0803B668 @ case 79
	.4byte _0803B668 @ case 80
	.4byte _0803B668 @ case 81
	.4byte _0803B668 @ case 82
	.4byte _0803B668 @ case 83
	.4byte _0803B668 @ case 84
	.4byte _0803B668 @ case 85
	.4byte _0803B668 @ case 86
	.4byte _0803B64C @ case 87
	.4byte _0803B650 @ case 88
	.4byte _0803B656 @ case 89
	.4byte _0803B65A @ case 90
	.4byte _0803B660 @ case 91
_0803B628:
	bl ZeelaInit
	b _0803B668
_0803B62E:
	bl ZeelaIdleInit
_0803B632:
	bl ZeelaIdle
	b _0803B668
_0803B638:
	bl ZeelaTurningAroundInit
_0803B63C:
	bl ZeelaTurningAround
	b _0803B668
_0803B642:
	bl ZeelaFallingInit
_0803B646:
	bl ZeelaFalling
	b _0803B668
_0803B64C:
	bl SpriteDyingInit
_0803B650:
	bl SpriteDying
	b _0803B668
_0803B656:
	bl ZeelaInit
_0803B65A:
	bl SpriteSpawningFromX
	b _0803B668
_0803B660:
	bl ZeelaTurningIntoX
	bl XParasiteInit
_0803B668:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZeelaProjectile
ZeelaProjectile: @ 0x0803B670
	push {lr}
	ldr r0, _0803B688 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803B696
	cmp r0, #2
	bgt _0803B68C
	cmp r0, #0
	beq _0803B692
	b _0803B6A2
	.align 2, 0
_0803B688: .4byte gCurrentSprite
_0803B68C:
	cmp r0, #0x38
	beq _0803B69C
	b _0803B6A2
_0803B692:
	bl ZeelaProjectileInit
_0803B696:
	bl ZeelaProjectileMoving
	b _0803B6A6
_0803B69C:
	bl ZeelaProjectileExploding
	b _0803B6A6
_0803B6A2:
	bl ZeelaProjectileExplodingInit
_0803B6A6:
	pop {r0}
	bx r0
	.align 2, 0
