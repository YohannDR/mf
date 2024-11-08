    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start GenesisInit
GenesisInit: @ 0x0804ADA0
	push {r4, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804ADCC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804ADD0
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804ADD0
	strh r0, [r2]
	b _0804AE58
	.align 2, 0
_0804ADCC: .4byte gCurrentSprite
_0804ADD0:
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	ldr r0, _0804AE40 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x27
	movs r3, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	movs r2, #0
	ldr r1, _0804AE44 @ =0x0000FFC0
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	movs r0, #0x40
	strh r0, [r4, #0x10]
	ldr r0, _0804AE48 @ =sGenesisOam_37c360
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r0, _0804AE4C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	ldr r2, _0804AE50 @ =sPrimarySpriteStats
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
	bne _0804AE54
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0804AE58
	.align 2, 0
_0804AE40: .4byte gCurrentSprite
_0804AE44: .4byte 0x0000FFC0
_0804AE48: .4byte sGenesisOam_37c360
_0804AE4C: .4byte gIoRegisters
_0804AE50: .4byte sPrimarySpriteStats
_0804AE54:
	movs r0, #1
	strb r0, [r1]
_0804AE58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenesisIdleInit
GenesisIdleInit: @ 0x0804AE60
	push {lr}
	ldr r3, _0804AE84 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	ldr r0, _0804AE88 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804AE90
	ldr r0, _0804AE8C @ =sGenesisOam_37c360
	b _0804AE92
	.align 2, 0
_0804AE84: .4byte gCurrentSprite
_0804AE88: .4byte gSpriteRandomNumber
_0804AE8C: .4byte sGenesisOam_37c360
_0804AE90:
	ldr r0, _0804AE98 @ =sGenesisOam_37c398
_0804AE92:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0804AE98: .4byte sGenesisOam_37c398

	thumb_func_start GenesisIdle
GenesisIdle: @ 0x0804AE9C
	push {r4, r5, lr}
	ldr r1, _0804AEF0 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _0804AEAE
	b _0804B000
_0804AEAE:
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804AEC8
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0804AEC8
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0804AEC8
	ldr r0, _0804AEF4 @ =0x000001C7
	bl SoundPlayNotAlreadyPlaying
_0804AEC8:
	ldr r4, _0804AEF0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804AEFC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x48
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804AEF8 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804AF24
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x48
	b _0804AF16
	.align 2, 0
_0804AEF0: .4byte gCurrentSprite
_0804AEF4: .4byte 0x000001C7
_0804AEF8: .4byte gPreviousCollisionCheck
_0804AEFC:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x48
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804AF30 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804AF24
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x48
_0804AF16:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0804AF34
_0804AF24:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #9
	strb r0, [r1]
	b _0804B000
	.align 2, 0
_0804AF30: .4byte gPreviousCollisionCheck
_0804AF34:
	ldr r2, _0804AF54 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _0804AF58 @ =sGenesisOam_37c398
	movs r3, #1
	cmp r1, r0
	bne _0804AF42
	movs r3, #2
_0804AF42:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804AF5C
	ldrh r0, [r2, #4]
	adds r0, r3, r0
	b _0804AF60
	.align 2, 0
_0804AF54: .4byte gCurrentSprite
_0804AF58: .4byte sGenesisOam_37c398
_0804AF5C:
	ldrh r0, [r2, #4]
	subs r0, r0, r3
_0804AF60:
	strh r0, [r2, #4]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B000
	ldr r1, _0804AF88 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0804AF8C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0xf
	bhi _0804B000
	lsls r0, r0, #2
	ldr r1, _0804AF90 @ =_0804AF94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AF88: .4byte gCurrentSprite
_0804AF8C: .4byte gSpriteRandomNumber
_0804AF90: .4byte _0804AF94
_0804AF94: @ jump table
	.4byte _0804AFD4 @ case 0
	.4byte _0804AFD4 @ case 1
	.4byte _0804AFD4 @ case 2
	.4byte _0804AFD4 @ case 3
	.4byte _0804AFD4 @ case 4
	.4byte _0804AFD4 @ case 5
	.4byte _0804AFD4 @ case 6
	.4byte _0804AFD4 @ case 7
	.4byte _0804AFE4 @ case 8
	.4byte _0804AFE4 @ case 9
	.4byte _0804AFF4 @ case 10
	.4byte _0804AFF4 @ case 11
	.4byte _0804AFF4 @ case 12
	.4byte _0804AFFC @ case 13
	.4byte _0804AFFC @ case 14
	.4byte _0804AFFC @ case 15
_0804AFD4:
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x2a
	strb r1, [r0]
	ldr r0, _0804AFE0 @ =sGenesisOam_37c478
	b _0804AFFE
	.align 2, 0
_0804AFE0: .4byte sGenesisOam_37c478
_0804AFE4:
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0xa
	strb r1, [r0]
	ldr r0, _0804AFF0 @ =sGenesisOam_37c478
	b _0804AFFE
	.align 2, 0
_0804AFF0: .4byte sGenesisOam_37c478
_0804AFF4:
	ldr r0, _0804AFF8 @ =sGenesisOam_37c398
	b _0804AFFE
	.align 2, 0
_0804AFF8: .4byte sGenesisOam_37c398
_0804AFFC:
	ldr r0, _0804B008 @ =sGenesisOam_37c360
_0804AFFE:
	str r0, [r2, #0x18]
_0804B000:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B008: .4byte sGenesisOam_37c360

	thumb_func_start GensisWaitingInit
GensisWaitingInit: @ 0x0804B00C
	ldr r1, _0804B024 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #8
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B028 @ =sGenesisOam_37c478
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804B024: .4byte gCurrentSprite
_0804B028: .4byte sGenesisOam_37c478

	thumb_func_start GenesisWaiting
GenesisWaiting: @ 0x0804B02C
	push {r4, lr}
	ldr r4, _0804B04C @ =gCurrentSprite
	ldr r1, [r4, #0x18]
	ldr r0, _0804B050 @ =sGenesisOam_37c478
	cmp r1, r0
	bne _0804B058
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B068
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0804B054 @ =sGenesisOam_37c450
	str r0, [r4, #0x18]
	b _0804B068
	.align 2, 0
_0804B04C: .4byte gCurrentSprite
_0804B050: .4byte sGenesisOam_37c478
_0804B054: .4byte sGenesisOam_37c450
_0804B058:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B068
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0804B068:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenesisReachedWallInit
GenesisReachedWallInit: @ 0x0804B070
	ldr r1, _0804B088 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0xa
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B08C @ =sGenesisOam_37c478
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804B088: .4byte gCurrentSprite
_0804B08C: .4byte sGenesisOam_37c478

	thumb_func_start GenesisReachedWall
GenesisReachedWall: @ 0x0804B090
	push {r4, lr}
	ldr r4, _0804B0B0 @ =gCurrentSprite
	ldr r1, [r4, #0x18]
	ldr r0, _0804B0B4 @ =sGenesisOam_37c478
	cmp r1, r0
	bne _0804B0BC
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B0CC
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0804B0B8 @ =sGenesisOam_37c450
	str r0, [r4, #0x18]
	b _0804B0CC
	.align 2, 0
_0804B0B0: .4byte gCurrentSprite
_0804B0B4: .4byte sGenesisOam_37c478
_0804B0B8: .4byte sGenesisOam_37c450
_0804B0BC:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B0CC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0804B0CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenesisTurningAroundInit
GenesisTurningAroundInit: @ 0x0804B0D4
	ldr r1, _0804B0EC @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B0F0 @ =sGenesisOam_37c488
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804B0EC: .4byte gCurrentSprite
_0804B0F0: .4byte sGenesisOam_37c488

	thumb_func_start GenesisTurningAround
GenesisTurningAround: @ 0x0804B0F4
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B118
	ldr r1, _0804B11C @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0804B120 @ =sGenesisOam_37c488
	str r0, [r1, #0x18]
	ldrh r0, [r1]
	movs r2, #0x40
	eors r0, r2
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #5
	strb r0, [r1]
_0804B118:
	pop {r0}
	bx r0
	.align 2, 0
_0804B11C: .4byte gCurrentSprite
_0804B120: .4byte sGenesisOam_37c488

	thumb_func_start GenesisTurningAroundSecondPart
GenesisTurningAroundSecondPart: @ 0x0804B124
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B136
	ldr r0, _0804B13C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0804B136:
	pop {r0}
	bx r0
	.align 2, 0
_0804B13C: .4byte gCurrentSprite

	thumb_func_start GenesisSpitting
GenesisSpitting: @ 0x0804B140
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0804B174 @ =gCurrentSprite
	ldr r1, [r4, #0x18]
	ldr r0, _0804B178 @ =sGenesisOam_37c478
	cmp r1, r0
	bne _0804B180
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B202
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0804B17C @ =sGenesisOam_37c498
	str r0, [r4, #0x18]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B202
	movs r0, #0xe4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0804B202
	.align 2, 0
_0804B174: .4byte gCurrentSprite
_0804B178: .4byte sGenesisOam_37c478
_0804B17C: .4byte sGenesisOam_37c498
_0804B180:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	adds r5, r0, #0
	cmp r5, #0
	beq _0804B1AA
	ldr r0, _0804B19C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _0804B1A0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0804B202
	.align 2, 0
_0804B19C: .4byte gSpriteRandomNumber
_0804B1A0:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0804B202
_0804B1AA:
	ldrh r0, [r4, #0x16]
	cmp r0, #0x11
	bne _0804B202
	ldrb r0, [r4, #0x1c]
	cmp r0, #6
	bne _0804B202
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0804B1E4
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x78
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x65
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0804B202
_0804B1E4:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x78
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x65
	movs r1, #0
	bl SpriteSpawnSecondary
_0804B202:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenesisSpitInit
GenesisSpitInit: @ 0x0804B20C
	push {r4, lr}
	ldr r0, _0804B284 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0804B288 @ =0x0000FFFB
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
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r3, [r0]
	adds r0, #1
	movs r1, #8
	strb r1, [r0]
	ldr r0, _0804B28C @ =0x0000FFE0
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r4, [r2, #0xc]
	adds r0, #0x18
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	mov r1, ip
	adds r1, #0x25
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0804B290 @ =gIoRegisters
	ldrb r1, [r1, #0xa]
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0804B294 @ =sGenesisOam_37c548
	str r0, [r2, #0x18]
	adds r1, #0xd
	movs r0, #6
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B284: .4byte gCurrentSprite
_0804B288: .4byte 0x0000FFFB
_0804B28C: .4byte 0x0000FFE0
_0804B290: .4byte gIoRegisters
_0804B294: .4byte sGenesisOam_37c548

	thumb_func_start GenesisSpitHanging
GenesisSpitHanging: @ 0x0804B298
	push {lr}
	ldr r2, _0804B2C4 @ =gCurrentSprite
	ldrh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B2BE
	subs r1, #0xa
	movs r0, #0x16
	strb r0, [r1]
	adds r1, #0xd
	movs r0, #0
	strb r0, [r1]
_0804B2BE:
	pop {r0}
	bx r0
	.align 2, 0
_0804B2C4: .4byte gCurrentSprite

	thumb_func_start GenesisSpitSplashingInit
GenesisSpitSplashingInit: @ 0x0804B2C8
	push {lr}
	ldr r1, _0804B2F4 @ =gCurrentSprite
	ldr r0, _0804B2F8 @ =sGenesisOam_37c558
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
	beq _0804B2EE
	ldr r0, _0804B2FC @ =0x000001C9
	bl SoundPlayNotAlreadyPlaying
_0804B2EE:
	pop {r0}
	bx r0
	.align 2, 0
_0804B2F4: .4byte gCurrentSprite
_0804B2F8: .4byte sGenesisOam_37c558
_0804B2FC: .4byte 0x000001C9

	thumb_func_start GenesisSpitSplashing
GenesisSpitSplashing: @ 0x0804B300
	push {r4, lr}
	ldr r4, _0804B320 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804B318
	movs r0, #0
	strh r0, [r4]
_0804B318:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B320: .4byte gCurrentSprite

	thumb_func_start Genesis
Genesis: @ 0x0804B324
	push {r4, lr}
	ldr r4, _0804B350 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804B33E
	movs r0, #0xe5
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804B33E:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B354
	bl SpriteUtilUpdateFreezeTimer
	b _0804B53A
	.align 2, 0
_0804B350: .4byte gCurrentSprite
_0804B354:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804B360
	b _0804B53A
_0804B360:
	lsls r0, r0, #2
	ldr r1, _0804B36C @ =_0804B370
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B36C: .4byte _0804B370
_0804B370: @ jump table
	.4byte _0804B4E0 @ case 0
	.4byte _0804B4E6 @ case 1
	.4byte _0804B4EA @ case 2
	.4byte _0804B504 @ case 3
	.4byte _0804B508 @ case 4
	.4byte _0804B50E @ case 5
	.4byte _0804B53A @ case 6
	.4byte _0804B4F0 @ case 7
	.4byte _0804B4F4 @ case 8
	.4byte _0804B4FA @ case 9
	.4byte _0804B4FE @ case 10
	.4byte _0804B53A @ case 11
	.4byte _0804B53A @ case 12
	.4byte _0804B53A @ case 13
	.4byte _0804B53A @ case 14
	.4byte _0804B53A @ case 15
	.4byte _0804B53A @ case 16
	.4byte _0804B53A @ case 17
	.4byte _0804B53A @ case 18
	.4byte _0804B53A @ case 19
	.4byte _0804B53A @ case 20
	.4byte _0804B53A @ case 21
	.4byte _0804B53A @ case 22
	.4byte _0804B53A @ case 23
	.4byte _0804B53A @ case 24
	.4byte _0804B53A @ case 25
	.4byte _0804B53A @ case 26
	.4byte _0804B53A @ case 27
	.4byte _0804B53A @ case 28
	.4byte _0804B53A @ case 29
	.4byte _0804B53A @ case 30
	.4byte _0804B53A @ case 31
	.4byte _0804B53A @ case 32
	.4byte _0804B53A @ case 33
	.4byte _0804B53A @ case 34
	.4byte _0804B53A @ case 35
	.4byte _0804B53A @ case 36
	.4byte _0804B53A @ case 37
	.4byte _0804B53A @ case 38
	.4byte _0804B53A @ case 39
	.4byte _0804B53A @ case 40
	.4byte _0804B53A @ case 41
	.4byte _0804B514 @ case 42
	.4byte _0804B53A @ case 43
	.4byte _0804B53A @ case 44
	.4byte _0804B53A @ case 45
	.4byte _0804B53A @ case 46
	.4byte _0804B53A @ case 47
	.4byte _0804B53A @ case 48
	.4byte _0804B53A @ case 49
	.4byte _0804B53A @ case 50
	.4byte _0804B53A @ case 51
	.4byte _0804B53A @ case 52
	.4byte _0804B53A @ case 53
	.4byte _0804B53A @ case 54
	.4byte _0804B53A @ case 55
	.4byte _0804B53A @ case 56
	.4byte _0804B53A @ case 57
	.4byte _0804B53A @ case 58
	.4byte _0804B53A @ case 59
	.4byte _0804B53A @ case 60
	.4byte _0804B53A @ case 61
	.4byte _0804B53A @ case 62
	.4byte _0804B53A @ case 63
	.4byte _0804B53A @ case 64
	.4byte _0804B53A @ case 65
	.4byte _0804B53A @ case 66
	.4byte _0804B53A @ case 67
	.4byte _0804B53A @ case 68
	.4byte _0804B53A @ case 69
	.4byte _0804B53A @ case 70
	.4byte _0804B53A @ case 71
	.4byte _0804B53A @ case 72
	.4byte _0804B53A @ case 73
	.4byte _0804B53A @ case 74
	.4byte _0804B53A @ case 75
	.4byte _0804B53A @ case 76
	.4byte _0804B53A @ case 77
	.4byte _0804B53A @ case 78
	.4byte _0804B53A @ case 79
	.4byte _0804B53A @ case 80
	.4byte _0804B53A @ case 81
	.4byte _0804B53A @ case 82
	.4byte _0804B53A @ case 83
	.4byte _0804B53A @ case 84
	.4byte _0804B53A @ case 85
	.4byte _0804B53A @ case 86
	.4byte _0804B51A @ case 87
	.4byte _0804B51E @ case 88
	.4byte _0804B524 @ case 89
	.4byte _0804B528 @ case 90
	.4byte _0804B52E @ case 91
_0804B4E0:
	bl GenesisInit
	b _0804B53A
_0804B4E6:
	bl GenesisIdleInit
_0804B4EA:
	bl GenesisIdle
	b _0804B53A
_0804B4F0:
	bl GensisWaitingInit
_0804B4F4:
	bl GenesisWaiting
	b _0804B53A
_0804B4FA:
	bl GenesisReachedWallInit
_0804B4FE:
	bl GenesisReachedWall
	b _0804B53A
_0804B504:
	bl GenesisTurningAroundInit
_0804B508:
	bl GenesisTurningAround
	b _0804B53A
_0804B50E:
	bl GenesisTurningAroundSecondPart
	b _0804B53A
_0804B514:
	bl GenesisSpitting
	b _0804B53A
_0804B51A:
	bl SpriteDyingInit
_0804B51E:
	bl SpriteDying
	b _0804B53A
_0804B524:
	bl GenesisInit
_0804B528:
	bl SpriteSpawningFromX
	b _0804B53A
_0804B52E:
	bl XParasiteInit
	ldr r1, _0804B540 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_0804B53A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B540: .4byte gCurrentSprite

	thumb_func_start GenesisSpit
GenesisSpit: @ 0x0804B544
	push {lr}
	ldr r0, _0804B55C @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	bls _0804B552
	b _0804B65E
_0804B552:
	lsls r0, r0, #2
	ldr r1, _0804B560 @ =_0804B564
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B55C: .4byte gCurrentSprite
_0804B560: .4byte _0804B564
_0804B564: @ jump table
	.4byte _0804B644 @ case 0
	.4byte _0804B65E @ case 1
	.4byte _0804B64A @ case 2
	.4byte _0804B65E @ case 3
	.4byte _0804B65E @ case 4
	.4byte _0804B65E @ case 5
	.4byte _0804B65E @ case 6
	.4byte _0804B650 @ case 7
	.4byte _0804B654 @ case 8
	.4byte _0804B65E @ case 9
	.4byte _0804B65E @ case 10
	.4byte _0804B65E @ case 11
	.4byte _0804B65E @ case 12
	.4byte _0804B65E @ case 13
	.4byte _0804B65E @ case 14
	.4byte _0804B65E @ case 15
	.4byte _0804B65E @ case 16
	.4byte _0804B65E @ case 17
	.4byte _0804B65E @ case 18
	.4byte _0804B65E @ case 19
	.4byte _0804B65E @ case 20
	.4byte _0804B65E @ case 21
	.4byte _0804B65A @ case 22
	.4byte _0804B65E @ case 23
	.4byte _0804B65E @ case 24
	.4byte _0804B65E @ case 25
	.4byte _0804B65E @ case 26
	.4byte _0804B65E @ case 27
	.4byte _0804B65E @ case 28
	.4byte _0804B65E @ case 29
	.4byte _0804B65E @ case 30
	.4byte _0804B65E @ case 31
	.4byte _0804B65E @ case 32
	.4byte _0804B65E @ case 33
	.4byte _0804B65E @ case 34
	.4byte _0804B65E @ case 35
	.4byte _0804B65E @ case 36
	.4byte _0804B65E @ case 37
	.4byte _0804B65E @ case 38
	.4byte _0804B65E @ case 39
	.4byte _0804B65E @ case 40
	.4byte _0804B65E @ case 41
	.4byte _0804B65E @ case 42
	.4byte _0804B65E @ case 43
	.4byte _0804B65E @ case 44
	.4byte _0804B65E @ case 45
	.4byte _0804B65E @ case 46
	.4byte _0804B65E @ case 47
	.4byte _0804B65E @ case 48
	.4byte _0804B65E @ case 49
	.4byte _0804B65E @ case 50
	.4byte _0804B65E @ case 51
	.4byte _0804B65E @ case 52
	.4byte _0804B65E @ case 53
	.4byte _0804B65E @ case 54
	.4byte _0804B650 @ case 55
_0804B644:
	bl GenesisSpitInit
	b _0804B65E
_0804B64A:
	bl GenesisSpitHanging
	b _0804B65E
_0804B650:
	bl GenesisSpitSplashingInit
_0804B654:
	bl GenesisSpitSplashing
	b _0804B65E
_0804B65A:
	bl SpriteUtilCurrentSpriteFalling
_0804B65E:
	pop {r0}
	bx r0
	.align 2, 0
