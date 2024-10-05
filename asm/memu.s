    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start MemuInit
MemuInit: @ 0x0803E75C
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803E788 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803E78C
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803E78C
	strh r0, [r2]
	b _0803E814
	.align 2, 0
_0803E788: .4byte gCurrentSprite
_0803E78C:
	ldr r4, _0803E7FC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x27
	movs r2, #0
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r5, #0
	ldr r1, _0803E800 @ =0x0000FFE0
	strh r1, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _0803E804 @ =0x08357F14
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldr r2, _0803E808 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl SpriteUtilChooseRandomXDirection
	ldr r0, _0803E80C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #8
	bls _0803E7E6
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0803E7E6:
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803E810
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0803E814
	.align 2, 0
_0803E7FC: .4byte gCurrentSprite
_0803E800: .4byte 0x0000FFE0
_0803E804: .4byte 0x08357F14
_0803E808: .4byte sPrimarySpriteStats
_0803E80C: .4byte gSpriteRandomNumber
_0803E810:
	movs r0, #1
	strb r0, [r1]
_0803E814:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MemuIdleInit
MemuIdleInit: @ 0x0803E81C
	ldr r2, _0803E838 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0803E83C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	adds r1, #0xc
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803E838: .4byte gCurrentSprite
_0803E83C: .4byte gSpriteRandomNumber

	thumb_func_start MemuIdle
MemuIdle: @ 0x0803E840
	push {r4, r5, r6, r7, lr}
	ldr r4, _0803E8B8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803E8B0
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r3, _0803E8BC @ =0x083575B0
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _0803E8C0 @ =0x00007FFF
	cmp r0, r6
	bne _0803E86C
	ldrh r2, [r3]
	movs r1, #0
_0803E86C:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r3, _0803E8C4 @ =0x08357632
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _0803E890
	ldrh r2, [r3]
	movs r1, #0
_0803E890:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _0803E8B0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_0803E8B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E8B8: .4byte gCurrentSprite
_0803E8BC: .4byte 0x083575B0
_0803E8C0: .4byte 0x00007FFF
_0803E8C4: .4byte 0x08357632

	thumb_func_start MemuChasingSamusInit
MemuChasingSamusInit: @ 0x0803E8C8
	push {r4, r5, lr}
	ldr r4, _0803E920 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	ldr r0, _0803E924 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r5, #0
	strh r0, [r4, #8]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0xc
	strh r0, [r4, #0x12]
	ldr r0, _0803E928 @ =0x08357F3C
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r2, [r4, #0x16]
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldrh r2, [r4, #2]
	ldr r1, _0803E92C @ =gSamusData
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	cmp r2, r0
	ble _0803E934
	ldrh r1, [r4]
	ldr r0, _0803E930 @ =0x0000FBFF
	ands r0, r1
	b _0803E93E
	.align 2, 0
_0803E920: .4byte gCurrentSprite
_0803E924: .4byte gSpriteRandomNumber
_0803E928: .4byte 0x08357F3C
_0803E92C: .4byte gSamusData
_0803E930: .4byte 0x0000FBFF
_0803E934:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
_0803E93E:
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MemuChasingSamus
MemuChasingSamus: @ 0x0803E948
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0803E9D4 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	mov ip, r1
	ldrh r3, [r0, #4]
	mov r8, r3
	movs r5, #0x18
	adds r0, #0x23
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bhi _0803EA22
	ldr r0, _0803E9D8 @ =gSpriteData
	mov sb, r0
_0803E96E:
	lsls r2, r4, #3
	subs r0, r2, r4
	lsls r0, r0, #3
	mov r1, sb
	adds r3, r0, r1
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803EA18
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803EA18
	ldrb r0, [r3, #0x1d]
	cmp r0, #0x70
	bne _0803EA18
	ldrh r7, [r3, #2]
	ldrh r6, [r3, #4]
	mov r0, ip
	adds r1, r0, r5
	subs r0, r7, r5
	cmp r1, r0
	ble _0803EA18
	mov r0, ip
	subs r1, r0, r5
	adds r0, r7, r5
	cmp r1, r0
	bge _0803EA18
	mov r0, r8
	adds r1, r0, r5
	subs r0, r6, r5
	cmp r1, r0
	ble _0803EA18
	mov r0, r8
	subs r1, r0, r5
	adds r0, r6, r5
	cmp r1, r0
	bge _0803EA18
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803EA22
	cmp ip, r7
	bls _0803E9DC
	subs r0, r7, #4
	b _0803E9DE
	.align 2, 0
_0803E9D4: .4byte gCurrentSprite
_0803E9D8: .4byte gSpriteData
_0803E9DC:
	adds r0, r7, #4
_0803E9DE:
	strh r0, [r3, #2]
	cmp r8, r6
	bls _0803E9F0
	subs r1, r2, r4
	lsls r1, r1, #3
	add r1, sb
	ldrh r0, [r1, #4]
	subs r0, #4
	b _0803E9FA
_0803E9F0:
	subs r1, r2, r4
	lsls r1, r1, #3
	add r1, sb
	ldrh r0, [r1, #4]
	adds r0, #4
_0803E9FA:
	strh r0, [r1, #4]
	subs r2, r2, r4
	lsls r2, r2, #3
	add r2, sb
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	eors r1, r0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	eors r1, r0
	strh r1, [r2]
	b _0803EA22
_0803EA18:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bls _0803E96E
_0803EA22:
	ldr r4, _0803EA3C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803EA40
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	b _0803EA46
	.align 2, 0
_0803EA3C: .4byte gCurrentSprite
_0803EA40:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
_0803EA46:
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803EA70 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0803EA5A
	ldrh r1, [r4]
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4]
_0803EA5A:
	ldr r4, _0803EA74 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803EA78
	ldrh r0, [r4, #2]
	adds r0, #0x20
	b _0803EA7C
	.align 2, 0
_0803EA70: .4byte gPreviousCollisionCheck
_0803EA74: .4byte gCurrentSprite
_0803EA78:
	ldrh r0, [r4, #2]
	subs r0, #0x20
_0803EA7C:
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803EAE0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0803EA92
	ldrh r1, [r4]
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4]
_0803EA92:
	ldr r0, _0803EAE4 @ =gSamusData
	ldrh r1, [r0, #0x18]
	subs r1, #0x48
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldrh r6, [r0, #0x16]
	movs r0, #4
	mov r8, r0
	ldr r1, _0803EAE8 @ =gCurrentSprite
	ldrh r4, [r1]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r4
	adds r2, r1, #0
	cmp r0, #0
	beq _0803EB0C
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803EAEC
	ldrh r1, [r2, #4]
	subs r0, r6, #4
	cmp r1, r0
	bgt _0803EB1E
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #3
	bhi _0803EAD4
	adds r0, #1
	strb r0, [r1]
_0803EAD4:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	b _0803EB60
	.align 2, 0
_0803EAE0: .4byte gPreviousCollisionCheck
_0803EAE4: .4byte gSamusData
_0803EAE8: .4byte gCurrentSprite
_0803EAEC:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803EB00
	lsrs r0, r0, #0x1a
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _0803EB60
_0803EB00:
	ldr r0, _0803EB08 @ =0x0000FDFF
	ands r0, r4
	b _0803EB56
	.align 2, 0
_0803EB08: .4byte 0x0000FDFF
_0803EB0C:
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803EB3C
	ldrh r1, [r2, #4]
	adds r0, r6, #4
	cmp r1, r0
	bge _0803EB28
_0803EB1E:
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r3]
	b _0803EB60
_0803EB28:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #3
	bhi _0803EB36
	adds r0, #1
	strb r0, [r1]
_0803EB36:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0803EB4A
_0803EB3C:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803EB52
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0803EB4A:
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	strh r0, [r2, #4]
	b _0803EB60
_0803EB52:
	adds r0, r5, #0
	orrs r0, r4
_0803EB56:
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_0803EB60:
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0803EBBC
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803EB9A
	ldrh r1, [r2, #2]
	subs r0, r7, #4
	cmp r1, r0
	bgt _0803EBCE
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0803EB8E
	adds r0, #1
	strb r0, [r1]
_0803EB8E:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _0803EC12
_0803EB9A:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803EBAE
	lsrs r0, r0, #0x1a
	ldrh r3, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	b _0803EC12
_0803EBAE:
	ldrh r0, [r2]
	ldr r1, _0803EBB8 @ =0x0000FBFF
	ands r1, r0
	b _0803EC08
	.align 2, 0
_0803EBB8: .4byte 0x0000FBFF
_0803EBBC:
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803EBEC
	ldrh r1, [r2, #2]
	adds r0, r7, #4
	cmp r1, r0
	bge _0803EBD8
_0803EBCE:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _0803EC12
_0803EBD8:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0803EBE6
	adds r0, #1
	strb r0, [r1]
_0803EBE6:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0803EBFA
_0803EBEC:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803EC02
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0803EBFA:
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _0803EC12
_0803EC02:
	ldrh r0, [r2]
	adds r1, r4, #0
	orrs r1, r0
_0803EC08:
	strh r1, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0803EC12:
	ldrh r0, [r2, #0x12]
	subs r0, #1
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803EC32
	movs r0, #0xc
	strh r0, [r2, #0x12]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803EC32
	ldr r0, _0803EC40 @ =0x0000019B
	bl SoundPlayNotAlreadyPlaying
_0803EC32:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EC40: .4byte 0x0000019B

	thumb_func_start Memu
Memu: @ 0x0803EC44
	push {r4, lr}
	ldr r4, _0803EC70 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803EC5E
	movs r0, #0xce
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803EC5E:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803EC74
	bl SpriteUtilUpdateFreezeTimer
	b _0803EE34
	.align 2, 0
_0803EC70: .4byte gCurrentSprite
_0803EC74:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803EC80
	b _0803EE34
_0803EC80:
	lsls r0, r0, #2
	ldr r1, _0803EC8C @ =_0803EC90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803EC8C: .4byte _0803EC90
_0803EC90: @ jump table
	.4byte _0803EE00 @ case 0
	.4byte _0803EE06 @ case 1
	.4byte _0803EE0C @ case 2
	.4byte _0803EE34 @ case 3
	.4byte _0803EE34 @ case 4
	.4byte _0803EE34 @ case 5
	.4byte _0803EE34 @ case 6
	.4byte _0803EE34 @ case 7
	.4byte _0803EE34 @ case 8
	.4byte _0803EE34 @ case 9
	.4byte _0803EE34 @ case 10
	.4byte _0803EE34 @ case 11
	.4byte _0803EE34 @ case 12
	.4byte _0803EE34 @ case 13
	.4byte _0803EE34 @ case 14
	.4byte _0803EE34 @ case 15
	.4byte _0803EE34 @ case 16
	.4byte _0803EE34 @ case 17
	.4byte _0803EE34 @ case 18
	.4byte _0803EE34 @ case 19
	.4byte _0803EE34 @ case 20
	.4byte _0803EE34 @ case 21
	.4byte _0803EE34 @ case 22
	.4byte _0803EE12 @ case 23
	.4byte _0803EE16 @ case 24
	.4byte _0803EE34 @ case 25
	.4byte _0803EE34 @ case 26
	.4byte _0803EE34 @ case 27
	.4byte _0803EE34 @ case 28
	.4byte _0803EE34 @ case 29
	.4byte _0803EE34 @ case 30
	.4byte _0803EE34 @ case 31
	.4byte _0803EE34 @ case 32
	.4byte _0803EE34 @ case 33
	.4byte _0803EE34 @ case 34
	.4byte _0803EE34 @ case 35
	.4byte _0803EE34 @ case 36
	.4byte _0803EE34 @ case 37
	.4byte _0803EE34 @ case 38
	.4byte _0803EE34 @ case 39
	.4byte _0803EE34 @ case 40
	.4byte _0803EE34 @ case 41
	.4byte _0803EE34 @ case 42
	.4byte _0803EE34 @ case 43
	.4byte _0803EE34 @ case 44
	.4byte _0803EE34 @ case 45
	.4byte _0803EE34 @ case 46
	.4byte _0803EE34 @ case 47
	.4byte _0803EE34 @ case 48
	.4byte _0803EE34 @ case 49
	.4byte _0803EE34 @ case 50
	.4byte _0803EE34 @ case 51
	.4byte _0803EE34 @ case 52
	.4byte _0803EE34 @ case 53
	.4byte _0803EE34 @ case 54
	.4byte _0803EE34 @ case 55
	.4byte _0803EE34 @ case 56
	.4byte _0803EE34 @ case 57
	.4byte _0803EE34 @ case 58
	.4byte _0803EE34 @ case 59
	.4byte _0803EE34 @ case 60
	.4byte _0803EE34 @ case 61
	.4byte _0803EE34 @ case 62
	.4byte _0803EE34 @ case 63
	.4byte _0803EE34 @ case 64
	.4byte _0803EE34 @ case 65
	.4byte _0803EE34 @ case 66
	.4byte _0803EE34 @ case 67
	.4byte _0803EE34 @ case 68
	.4byte _0803EE34 @ case 69
	.4byte _0803EE34 @ case 70
	.4byte _0803EE34 @ case 71
	.4byte _0803EE34 @ case 72
	.4byte _0803EE34 @ case 73
	.4byte _0803EE34 @ case 74
	.4byte _0803EE34 @ case 75
	.4byte _0803EE34 @ case 76
	.4byte _0803EE34 @ case 77
	.4byte _0803EE34 @ case 78
	.4byte _0803EE34 @ case 79
	.4byte _0803EE34 @ case 80
	.4byte _0803EE34 @ case 81
	.4byte _0803EE34 @ case 82
	.4byte _0803EE34 @ case 83
	.4byte _0803EE34 @ case 84
	.4byte _0803EE34 @ case 85
	.4byte _0803EE34 @ case 86
	.4byte _0803EE1C @ case 87
	.4byte _0803EE20 @ case 88
	.4byte _0803EE26 @ case 89
	.4byte _0803EE2A @ case 90
	.4byte _0803EE30 @ case 91
_0803EE00:
	bl MemuInit
	b _0803EE34
_0803EE06:
	bl MemuIdleInit
	b _0803EE34
_0803EE0C:
	bl MemuIdle
	b _0803EE34
_0803EE12:
	bl MemuChasingSamusInit
_0803EE16:
	bl MemuChasingSamus
	b _0803EE34
_0803EE1C:
	bl SpriteDyingInit
_0803EE20:
	bl SpriteDying
	b _0803EE34
_0803EE26:
	bl MemuInit
_0803EE2A:
	bl SpriteSpawningFromX
	b _0803EE34
_0803EE30:
	bl XParasiteInit
_0803EE34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
